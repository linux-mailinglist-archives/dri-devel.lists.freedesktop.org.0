Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 533125B2AF7
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 02:17:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1566B10E87B;
	Fri,  9 Sep 2022 00:16:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A7DA10E879;
 Fri,  9 Sep 2022 00:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662682605; x=1694218605;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3ee1TO/94UgBjY+J+pcNoPdoNYZquXUW2mHeg1EK+tw=;
 b=TqbM678A7paC6r3EwbaZKI1thpNertS9AAkqQaEYTqgW8KkJrIdm7A/J
 5uP9qPWj17VqKJXJidbSHNOEugXojKojKXEoDGP0f3VpoN8xXjRHLmKR1
 CZl1/1iX1+K13jeTZu8OkJbQ5OSsjQ/9NKP4pJ1QX0g8gMmZBF+09jaEU
 kDnOXxZLCCwbMffRNYVxHMEXefXO2O87A1x/8ls1tXxpSELI8R7A53G/9
 tXtTQu0BmFnz+CYBz09lffIYuco+wEqrawsZt98JSBdbU1zv9OXMFeljR
 MbeuWV+itTIHpIhoXMXzx05N1gMsU/2ROk0OL1PKt2MbJJfVGus+SCQAq A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10464"; a="294938829"
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; d="scan'208";a="294938829"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2022 17:16:36 -0700
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; d="scan'208";a="676933175"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2022 17:16:36 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v4 02/15] mei: bus: enable sending gsc commands
Date: Thu,  8 Sep 2022 17:15:59 -0700
Message-Id: <20220909001612.728451-3-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220909001612.728451-1-daniele.ceraolospurio@intel.com>
References: <20220909001612.728451-1-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Tomas Winkler <tomas.winkler@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Vitaly Lubart <vitaly.lubart@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tomas Winkler <tomas.winkler@intel.com>

GSC command is and extended header containing a scatter gather
list and without a data buffer. Using MEI_CL_IO_SGL flag,
the caller send the GSC command as a data and the function internally
moves it to the extended header.

Signed-off-by: Tomas Winkler <tomas.winkler@intel.com>
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Vitaly Lubart <vitaly.lubart@intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/misc/mei/bus.c     | 20 ++++++++++++++++++--
 drivers/misc/mei/mei_dev.h |  4 ++++
 2 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/misc/mei/bus.c b/drivers/misc/mei/bus.c
index 46aa3554e97b..225f0b04c021 100644
--- a/drivers/misc/mei/bus.c
+++ b/drivers/misc/mei/bus.c
@@ -100,9 +100,18 @@ ssize_t __mei_cl_send(struct mei_cl *cl, const u8 *buf, size_t length, u8 vtag,
 	cb->internal = !!(mode & MEI_CL_IO_TX_INTERNAL);
 	cb->blocking = !!(mode & MEI_CL_IO_TX_BLOCKING);
 	memcpy(cb->buf.data, buf, length);
+	/* hack we point data to header */
+	if (mode & MEI_CL_IO_SGL) {
+		cb->ext_hdr = (struct mei_ext_hdr *)cb->buf.data;
+		cb->buf.data = NULL;
+		cb->buf.size = 0;
+	}
 
 	rets = mei_cl_write(cl, cb);
 
+	if (mode & MEI_CL_IO_SGL && rets == 0)
+		rets = length;
+
 out:
 	mutex_unlock(&bus->device_lock);
 
@@ -205,9 +214,16 @@ ssize_t __mei_cl_recv(struct mei_cl *cl, u8 *buf, size_t length, u8 *vtag,
 		goto free;
 	}
 
-	r_length = min_t(size_t, length, cb->buf_idx);
-	memcpy(buf, cb->buf.data, r_length);
+	/* for the GSC type - copy the extended header to the buffer */
+	if (cb->ext_hdr && cb->ext_hdr->type == MEI_EXT_HDR_GSC) {
+		r_length = min_t(size_t, length, cb->ext_hdr->length * sizeof(u32));
+		memcpy(buf, cb->ext_hdr, r_length);
+	} else {
+		r_length = min_t(size_t, length, cb->buf_idx);
+		memcpy(buf, cb->buf.data, r_length);
+	}
 	rets = r_length;
+
 	if (vtag)
 		*vtag = cb->vtag;
 
diff --git a/drivers/misc/mei/mei_dev.h b/drivers/misc/mei/mei_dev.h
index 31784bbc2d2a..8d8018428d9d 100644
--- a/drivers/misc/mei/mei_dev.h
+++ b/drivers/misc/mei/mei_dev.h
@@ -116,12 +116,16 @@ enum mei_cb_file_ops {
  * @MEI_CL_IO_TX_INTERNAL: internal communication between driver and FW
  *
  * @MEI_CL_IO_RX_NONBLOCK: recv is non-blocking
+ *
+ * @MEI_CL_IO_SGL: send command with sgl list.
  */
 enum mei_cl_io_mode {
 	MEI_CL_IO_TX_BLOCKING = BIT(0),
 	MEI_CL_IO_TX_INTERNAL = BIT(1),
 
 	MEI_CL_IO_RX_NONBLOCK = BIT(2),
+
+	MEI_CL_IO_SGL         = BIT(3),
 };
 
 /*
-- 
2.37.2

