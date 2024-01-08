Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E7C826D47
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jan 2024 13:01:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A11510E1F6;
	Mon,  8 Jan 2024 12:01:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41FAE10E1F6
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jan 2024 12:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1704715264;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PFENih9XWAd70944xbCOau+9oHw/D103WR9u3LQvnx8=;
 b=QEsdJscwiJEspTAoEHRDNK7VnoGgpp0UGaBRfdN8yjy64rkHYjOZYbhcPEnI8nVS88oAIb
 lUCdoJ6bnksYqtGmP1DgMA+2SYnNjnqO8RVCclnVrpFxfZU3wLhxd+Ijyl27rmZApxI4Jl
 n0GqzBZqFruQrC9jLKU5sAfjRLjmBxo=
From: Paul Cercueil <paul@crapouillou.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH v3 2/4] usb: gadget: functionfs: Factorize wait-for-endpoint
 code
Date: Mon,  8 Jan 2024 13:00:54 +0100
Message-ID: <20240108120056.22165-3-paul@crapouillou.net>
In-Reply-To: <20240108120056.22165-1-paul@crapouillou.net>
References: <20240108120056.22165-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: Paul Cercueil <paul@crapouillou.net>,
 Michael Hennerich <Michael.Hennerich@analog.com>, linux-doc@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 linaro-mm-sig@lists.linaro.org,
 =?UTF-8?q?Nuno=20S=C3=A1?= <noname.nuno@gmail.com>,
 Jonathan Cameron <jic23@kernel.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This exact same code was duplicated in two different places.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/usb/gadget/function/f_fs.c | 48 +++++++++++++++++-------------
 1 file changed, 27 insertions(+), 21 deletions(-)

diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index 6bff6cb93789..ed2a6d5fcef7 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -934,31 +934,44 @@ static ssize_t __ffs_epfile_read_data(struct ffs_epfile *epfile,
 	return ret;
 }
 
-static ssize_t ffs_epfile_io(struct file *file, struct ffs_io_data *io_data)
+static struct ffs_ep *ffs_epfile_wait_ep(struct file *file)
 {
 	struct ffs_epfile *epfile = file->private_data;
-	struct usb_request *req;
 	struct ffs_ep *ep;
-	char *data = NULL;
-	ssize_t ret, data_len = -EINVAL;
-	int halt;
-
-	/* Are we still active? */
-	if (WARN_ON(epfile->ffs->state != FFS_ACTIVE))
-		return -ENODEV;
+	int ret;
 
 	/* Wait for endpoint to be enabled */
 	ep = epfile->ep;
 	if (!ep) {
 		if (file->f_flags & O_NONBLOCK)
-			return -EAGAIN;
+			return ERR_PTR(-EAGAIN);
 
 		ret = wait_event_interruptible(
 				epfile->ffs->wait, (ep = epfile->ep));
 		if (ret)
-			return -EINTR;
+			return ERR_PTR(-EINTR);
 	}
 
+	return ep;
+}
+
+static ssize_t ffs_epfile_io(struct file *file, struct ffs_io_data *io_data)
+{
+	struct ffs_epfile *epfile = file->private_data;
+	struct usb_request *req;
+	struct ffs_ep *ep;
+	char *data = NULL;
+	ssize_t ret, data_len = -EINVAL;
+	int halt;
+
+	/* Are we still active? */
+	if (WARN_ON(epfile->ffs->state != FFS_ACTIVE))
+		return -ENODEV;
+
+	ep = ffs_epfile_wait_ep(file);
+	if (IS_ERR(ep))
+		return PTR_ERR(ep);
+
 	/* Do we halt? */
 	halt = (!io_data->read == !epfile->in);
 	if (halt && epfile->isoc)
@@ -1280,16 +1293,9 @@ static long ffs_epfile_ioctl(struct file *file, unsigned code,
 		return -ENODEV;
 
 	/* Wait for endpoint to be enabled */
-	ep = epfile->ep;
-	if (!ep) {
-		if (file->f_flags & O_NONBLOCK)
-			return -EAGAIN;
-
-		ret = wait_event_interruptible(
-				epfile->ffs->wait, (ep = epfile->ep));
-		if (ret)
-			return -EINTR;
-	}
+	ep = ffs_epfile_wait_ep(file);
+	if (IS_ERR(ep))
+		return PTR_ERR(ep);
 
 	spin_lock_irq(&epfile->ffs->eps_lock);
 
-- 
2.43.0

