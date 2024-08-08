Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94EE294B689
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2024 08:14:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48C3810E4F2;
	Thu,  8 Aug 2024 06:14:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 472A010E4F2
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2024 06:14:06 +0000 (UTC)
Received: from icess-ProLiant-DL380-Gen10.. (unknown [183.174.60.14])
 by APP-05 (Coremail) with SMTP id zQCowAB3XjkUYrRmkOZaBA--.15327S2;
 Thu, 08 Aug 2024 14:13:47 +0800 (CST)
From: Ma Ke <make24@iscas.ac.cn>
To: tomi.valkeinen@ideasonboard.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, laurent.pinchart@ideasonboard.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Ma Ke <make24@iscas.ac.cn>, stable@vger.kernel.org
Subject: [PATCH] drm: omapdrm: Add missing check for alloc_ordered_workqueue
Date: Thu,  8 Aug 2024 14:13:36 +0800
Message-Id: <20240808061336.2796729-1-make24@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowAB3XjkUYrRmkOZaBA--.15327S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Zr13AFWfWFyrGF1kurykXwb_yoW8Jw4DpF
 Zxta40yrW8Jr47tr1DJr1DZF1rG3WIkFyfWF18Awn3uw4SyrWDZ34FqFyjyrWkGFsavF45
 tFZ7tFWrXryqkrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBa14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
 1j6F4UJwAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40E
 FcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr
 0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8v
 x2IErcIFxwACI402YVCY1x02628vn2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20x
 vY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I
 3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIx
 AIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAI
 cVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2js
 IEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUQvtAUUUUU=
X-Originating-IP: [183.174.60.14]
X-CM-SenderInfo: ppdnvj2u6l2u1dvotugofq/
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As it may return NULL pointer and cause NULL pointer dereference. Add check
for the return value of alloc_ordered_workqueue.

Cc: stable@vger.kernel.org
Fixes: 2f95bc6d324a ("drm: omapdrm: Perform initialization/cleanup at probe/remove time")
Signed-off-by: Ma Ke <make24@iscas.ac.cn>
---
 drivers/gpu/drm/omapdrm/omap_drv.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/omapdrm/omap_drv.c b/drivers/gpu/drm/omapdrm/omap_drv.c
index 6598c9c08ba1..94a57f0d1c08 100644
--- a/drivers/gpu/drm/omapdrm/omap_drv.c
+++ b/drivers/gpu/drm/omapdrm/omap_drv.c
@@ -695,6 +695,10 @@ static int omapdrm_init(struct omap_drm_private *priv, struct device *dev)
 	soc = soc_device_match(omapdrm_soc_devices);
 	priv->omaprev = soc ? (uintptr_t)soc->data : 0;
 	priv->wq = alloc_ordered_workqueue("omapdrm", 0);
+	if (!priv->wq) {
+		ret = -ENOMEM;
+		goto err_alloc_workqueue;
+	}
 
 	mutex_init(&priv->list_lock);
 	INIT_LIST_HEAD(&priv->obj_list);
@@ -753,6 +757,7 @@ static int omapdrm_init(struct omap_drm_private *priv, struct device *dev)
 	drm_mode_config_cleanup(ddev);
 	omap_gem_deinit(ddev);
 	destroy_workqueue(priv->wq);
+err_alloc_workqueue:
 	omap_disconnect_pipelines(ddev);
 	drm_dev_put(ddev);
 	return ret;
-- 
2.25.1

