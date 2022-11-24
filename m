Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E60063779F
	for <lists+dri-devel@lfdr.de>; Thu, 24 Nov 2022 12:26:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0A6C10E028;
	Thu, 24 Nov 2022 11:26:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 170297 seconds by postgrey-1.36 at gabe;
 Thu, 24 Nov 2022 11:26:22 UTC
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [63.216.63.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 526C310E028
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Nov 2022 11:26:22 +0000 (UTC)
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mxhk.zte.com.cn (FangMail) with ESMTPS id 4NHwfx2tNGz5BNRf;
 Thu, 24 Nov 2022 19:26:17 +0800 (CST)
Received: from szxlzmapp04.zte.com.cn ([10.5.231.166])
 by mse-fl2.zte.com.cn with SMTP id 2AOBQAQp098428;
 Thu, 24 Nov 2022 19:26:10 +0800 (+08)
 (envelope-from yang.yang29@zte.com.cn)
Received: from mapi (szxlzmapp02[null]) by mapi (Zmail) with MAPI id mid14;
 Thu, 24 Nov 2022 19:26:13 +0800 (CST)
Date: Thu, 24 Nov 2022 19:26:13 +0800 (CST)
X-Zmail-TransId: 2b04637f54d5ffffffffd03e764f
X-Mailer: Zmail v1.0
Message-ID: <202211241926133236370@zte.com.cn>
Mime-Version: 1.0
From: <yang.yang29@zte.com.cn>
To: <sumit.semwal@linaro.org>
Subject: =?UTF-8?B?W1BBVENIIGxpbnV4LW5leHRdIGRtYS1idWY6IHVzZSBzdHJzY3B5KCkgdG8gaW5zdGVhZCBvZiBzdHJsY3B5KCk=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL: mse-fl2.zte.com.cn 2AOBQAQp098428
X-Fangmail-Gw-Spam-Type: 0
X-FangMail-Miltered: at cgslv5.04-192.168.250.138.novalocal with ID
 637F54D9.000 by FangMail milter!
X-FangMail-Envelope: 1669289177/4NHwfx2tNGz5BNRf/637F54D9.000/10.5.228.133/[10.5.228.133]/mse-fl2.zte.com.cn/<yang.yang29@zte.com.cn>
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 637F54D9.000/4NHwfx2tNGz5BNRf
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
Cc: yang.yang29@zte.com.cn, xu.panda@zte.com.cn, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 christian.koenig@amd.com, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Xu Panda <xu.panda@zte.com.cn>

The implementation of strscpy() is more robust and safer.
That's now the recommended way to copy NUL terminated strings.

Signed-off-by: Xu Panda <xu.panda@zte.com.cn>
Signed-off-by: Yang Yang <yang.yang29@zte.com>
---
 drivers/dma-buf/dma-buf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index b6c36914e7c6..485cf4f3431e 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -51,7 +51,7 @@ static char *dmabuffs_dname(struct dentry *dentry, char *buffer, int buflen)
 	dmabuf = dentry->d_fsdata;
 	spin_lock(&dmabuf->name_lock);
 	if (dmabuf->name)
-		ret = strlcpy(name, dmabuf->name, DMA_BUF_NAME_LEN);
+		ret = strscpy(name, dmabuf->name, DMA_BUF_NAME_LEN);
 	spin_unlock(&dmabuf->name_lock);

 	return dynamic_dname(buffer, buflen, "/%s:%s",
-- 
2.15.2
