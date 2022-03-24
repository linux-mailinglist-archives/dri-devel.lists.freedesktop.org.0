Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C01754E6202
	for <lists+dri-devel@lfdr.de>; Thu, 24 Mar 2022 11:58:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFE3110E894;
	Thu, 24 Mar 2022 10:58:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out203-205-221-239.mail.qq.com (out203-205-221-239.mail.qq.com
 [203.205.221.239])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B030610E892
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Mar 2022 10:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
 s=s201512; t=1648119531;
 bh=MiK7sEzGBHCdbf5gWTcvE8l+cSUdFAE938ETs/tbpfg=;
 h=From:To:Cc:Subject:Date;
 b=f9p2sZHi+U0VnrbJxb1duxi4hQQ7U/fFPMP10YoMrZBVsR40EBYLGz2dpSBh0FDlZ
 SNWTh90YcHCQ6coIIrMSwqfWwp1UUB/AkGtdVs5SXvjCl75ZA8SREXKaBiHRT0HWgF
 JTQ59LnAiRyQ3n2xxlMzxbdMTw/bS8IXyxeOZS28=
Received: from localhost.localdomain ([43.227.138.48])
 by newxmesmtplogicsvrsza5.qq.com (NewEsmtp) with SMTP
 id EAF35228; Thu, 24 Mar 2022 18:58:47 +0800
X-QQ-mid: xmsmtpt1648119527t812l750o
Message-ID: <tencent_E01412E12D4A66FFB02064CC9CB9141CDE08@qq.com>
X-QQ-XMAILINFO: M7dxyDFn9MPmPxEIf5rL3xQJmuzpC42ZBVPiLrqnw6oyG9TiSExtqoS7YccQ3A
 Lv7wv+VILkMCbjfrV788WJs/9vbr+/0zYxuplSuXeceGKI5IO1AQVPbzQEAMgYZ+t0Pyp0KtZSDW
 CVPkINWkLS6GI8NQqk3rm1nuFV6H8NSFFLF8yiBb4FJwMs5vdz/s8UEUsz9truS+SsEDpsTlEmBs
 NyYHqLxe89RuI2O+hF5d2C54TCTqWUpp5La1BgMB58ZM/CZY4nJcvbXBAQ7DmO7+HP5ZgffLkzeN
 Mv7FTzNmzOHEcNasq0fTIsxPm84s/iTYUjxCR2ubVRoxFhlb4M/E923aF4eM6yYo8ZAGlTHRVLCB
 hkKgY18m9Evy5IgjZOAnlwxGlyLfIA1AA0hBhEfBFeL+0or+c2JQNg9/f3O/mQygUG+ZzYHgYpus
 C+RkuH+cL7pUhtEuJhbEeOr15J+CM00Aw7LjkuhHXNbLhcv7tiymjVb2Z6P/ehy+Lwgn94fEPNCj
 pnTkmrBZxBtiTbT5LkrIY3c6tN3AkjKpg+11a8C+z4+yuq/dbKP8hH3fI61hdFj6nZhwCwWmQ3ap
 jTQD2uvIxoyVLiB7dM7Upx3otN/f1/mPxt9qoDLlzK07EpLPsMcUR+W19qzMzDPhoYsA6RZNrrln
 NA3qREI6nckAZ7+rx6fIai+J9XXwIFqryb0ziejKdGyN3H7msidcVAX2DgMAvtGPiL683Fr3/pID
 3mc70c5n6ZVC+hciZ9YgdmFRFSIFtXce3bq+vNCavgszvlUyVEIoKEWBGhrcWENjSeaCTVHYKyPe
 fHn4IkCE32/998gu1o3Uco3BL54VFX9s9NbuWcQzhfXgsaN2WGstodSZCGlh56lUv6EUpO0zBOjr
 uXmAgbYty6ph3UgWGP9BMFdwTydSrhfN0APs+vSdKGcF0TE0Xn2gtjp5lFLUoJDaxlbQsTaVxlr1
 zQ1FtSp4g=
From: xkernel.wang@foxmail.com
To: tomba@kernel.org,
	airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH] drm/omapdrm: check the return value of kzalloc()
Date: Thu, 24 Mar 2022 18:58:04 +0800
X-OQ-MSGID: <20220324105804.3088-1-xkernel.wang@foxmail.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Xiaoke Wang <xkernel.wang@foxmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Xiaoke Wang <xkernel.wang@foxmail.com>

kzalloc() is a memory allocation function which can return NULL when
some internal memory errors happen. So it is better to check it.
Besides, to properly handle the error, another check is added for the
return of omap_irq_wait_init().

Signed-off-by: Xiaoke Wang <xkernel.wang@foxmail.com>
---
 drivers/gpu/drm/omapdrm/omap_crtc.c | 12 ++++++++----
 drivers/gpu/drm/omapdrm/omap_irq.c  |  3 +++
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_crtc.c b/drivers/gpu/drm/omapdrm/omap_crtc.c
index 06a719c..12c0008 100644
--- a/drivers/gpu/drm/omapdrm/omap_crtc.c
+++ b/drivers/gpu/drm/omapdrm/omap_crtc.c
@@ -166,10 +166,14 @@ void omap_crtc_set_enabled(struct drm_crtc *crtc, bool enable)
 	dispc_mgr_enable(priv->dispc, channel, enable);
 	omap_crtc->enabled = enable;
 
-	ret = omap_irq_wait(dev, wait, msecs_to_jiffies(100));
-	if (ret) {
-		dev_err(dev->dev, "%s: timeout waiting for %s\n",
-				omap_crtc->name, enable ? "enable" : "disable");
+	if (!wait) {
+		dev_err(dev->dev, "%s: out of memory\n", omap_crtc->name);
+	} else {
+		ret = omap_irq_wait(dev, wait, msecs_to_jiffies(100));
+		if (ret) {
+			dev_err(dev->dev, "%s: timeout waiting for %s\n",
+					omap_crtc->name, enable ? "enable" : "disable");
+		}
 	}
 
 	if (omap_crtc->channel == OMAP_DSS_CHANNEL_DIGIT) {
diff --git a/drivers/gpu/drm/omapdrm/omap_irq.c b/drivers/gpu/drm/omapdrm/omap_irq.c
index 4aca14d..a234462 100644
--- a/drivers/gpu/drm/omapdrm/omap_irq.c
+++ b/drivers/gpu/drm/omapdrm/omap_irq.c
@@ -45,6 +45,9 @@ struct omap_irq_wait * omap_irq_wait_init(struct drm_device *dev,
 	struct omap_irq_wait *wait = kzalloc(sizeof(*wait), GFP_KERNEL);
 	unsigned long flags;
 
+	if (!wait)
+		return NULL;
+
 	init_waitqueue_head(&wait->wq);
 	wait->irqmask = irqmask;
 	wait->count = count;
-- 
