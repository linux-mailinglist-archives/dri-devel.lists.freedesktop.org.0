Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD894E6FA2
	for <lists+dri-devel@lfdr.de>; Fri, 25 Mar 2022 09:49:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D35F10EB48;
	Fri, 25 Mar 2022 08:49:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 922 seconds by postgrey-1.36 at gabe;
 Thu, 24 Mar 2022 09:27:43 UTC
Received: from m12-11.163.com (m12-11.163.com [220.181.12.11])
 by gabe.freedesktop.org (Postfix) with ESMTP id 022B510E792
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Mar 2022 09:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=Y63xt4boxyExZq6hhV
 N4HB4jAAAEHQlGefrZDnFYgGg=; b=A9epg5pGbMDc3HSK9XABSIllTpHrUkBJsS
 FXVkVLZ4uTM2wB+GzQtLn4uVvXdZrSd3Cwnog29OycmaHCY0HWDgKppeD39hlHmX
 SNGqilINnEfPkkQwb+7jYjfL2Dnv2utnOwVTe51kEOZwzbPUQLVvAcuCiTnY4IkV
 mMJfpcDEU=
Received: from localhost (unknown [159.226.95.33])
 by smtp7 (Coremail) with SMTP id C8CowADXcrjqNTxieYAGEA--.7423S2;
 Thu, 24 Mar 2022 17:12:10 +0800 (CST)
From: QintaoShen <unSimple1993@163.com>
To: tomba@kernel.org
Subject: [PATCH v1] drm: omapdrm: Check for NULL return of kzalloc()
Date: Thu, 24 Mar 2022 17:12:07 +0800
Message-Id: <1648113127-8020-1-git-send-email-unSimple1993@163.com>
X-Mailer: git-send-email 2.7.4
X-CM-TRANSID: C8CowADXcrjqNTxieYAGEA--.7423S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Kry3JFy5urWxtw47Zw43KFg_yoW8GFy8pF
 WDta4jkr18AF42grnrA3WqyFy5Ga13CF1Sgr9ruwna9w4rArW7Xwn8JFy3Arykuws3Ar42
 gF4kt3WfGrn8Cr7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JUO18gUUUUU=
X-Originating-IP: [159.226.95.33]
X-CM-SenderInfo: 5xqvxz5sohimizt6il2tof0z/xtbCbgrNH2BbCZwkzwAAsz
X-Mailman-Approved-At: Fri, 25 Mar 2022 08:49:35 +0000
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
Cc: QintaoShen <unSimple1993@163.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

kzalloc() is a memory allocation function which may return NULL.
It is better to check the return value of it to catch the error in time.

Signed-off-by: QintaoShen <unSimple1993@163.com>
---
 drivers/gpu/drm/omapdrm/omap_crtc.c | 3 +++
 drivers/gpu/drm/omapdrm/omap_irq.c  | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/omapdrm/omap_crtc.c b/drivers/gpu/drm/omapdrm/omap_crtc.c
index 06a719c..fcd76ea 100644
--- a/drivers/gpu/drm/omapdrm/omap_crtc.c
+++ b/drivers/gpu/drm/omapdrm/omap_crtc.c
@@ -166,6 +166,9 @@ void omap_crtc_set_enabled(struct drm_crtc *crtc, bool enable)
 	dispc_mgr_enable(priv->dispc, channel, enable);
 	omap_crtc->enabled = enable;
 
+	if (!wait)
+		return ;
+
 	ret = omap_irq_wait(dev, wait, msecs_to_jiffies(100));
 	if (ret) {
 		dev_err(dev->dev, "%s: timeout waiting for %s\n",
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
2.7.4

