Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBBB269D972
	for <lists+dri-devel@lfdr.de>; Tue, 21 Feb 2023 04:45:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B444110E048;
	Tue, 21 Feb 2023 03:45:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-130.freemail.mail.aliyun.com
 (out30-130.freemail.mail.aliyun.com [115.124.30.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3A5B10E045
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Feb 2023 03:45:00 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R161e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046051;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=7; SR=0;
 TI=SMTPD_---0VcALxh8_1676951087; 
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0VcALxh8_1676951087) by smtp.aliyun-inc.com;
 Tue, 21 Feb 2023 11:44:56 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: patrik.r.jakobsson@gmail.com
Subject: [PATCH] drm/amd/display: Clean up some inconsistent indenting
Date: Tue, 21 Feb 2023 11:44:45 +0800
Message-Id: <20230221034445.60034-1-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
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
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 Abaci Robot <abaci@linux.alibaba.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

No functional modification involved.

drivers/gpu/drm/gma500/cdv_device.c:218 cdv_errata() warn: inconsistent indenting.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=4126
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/gpu/drm/gma500/cdv_device.c | 27 ++++++++++++++++-----------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/gma500/cdv_device.c b/drivers/gpu/drm/gma500/cdv_device.c
index 3e83299113e3..765f359365b9 100644
--- a/drivers/gpu/drm/gma500/cdv_device.c
+++ b/drivers/gpu/drm/gma500/cdv_device.c
@@ -78,7 +78,8 @@ static u32 cdv_get_max_backlight(struct drm_device *dev)
 	if (max == 0) {
 		DRM_DEBUG_KMS("LVDS Panel PWM value is 0!\n");
 		/* i915 does this, I believe which means that we should not
-		 * smash PWM control as firmware will take control of it. */
+		 * smash PWM control as firmware will take control of it.
+		 */
 		return 1;
 	}
 
@@ -149,6 +150,7 @@ static inline u32 CDV_MSG_READ32(int domain, uint port, uint offset)
 	int mcr = (0x10<<24) | (port << 16) | (offset << 8);
 	uint32_t ret_val = 0;
 	struct pci_dev *pci_root = pci_get_domain_bus_and_slot(domain, 0, 0);
+
 	pci_write_config_dword(pci_root, 0xD0, mcr);
 	pci_read_config_dword(pci_root, 0xD4, &ret_val);
 	pci_dev_put(pci_root);
@@ -160,6 +162,7 @@ static inline void CDV_MSG_WRITE32(int domain, uint port, uint offset,
 {
 	int mcr = (0x11<<24) | (port << 16) | (offset << 8) | 0xF0;
 	struct pci_dev *pci_root = pci_get_domain_bus_and_slot(domain, 0, 0);
+
 	pci_write_config_dword(pci_root, 0xD4, value);
 	pci_write_config_dword(pci_root, 0xD0, mcr);
 	pci_dev_put(pci_root);
@@ -180,10 +183,8 @@ static void cdv_init_pm(struct drm_device *dev)
 	int domain = pci_domain_nr(pdev->bus);
 	int i;
 
-	dev_priv->apm_base = CDV_MSG_READ32(domain, PSB_PUNIT_PORT,
-							PSB_APMBA) & 0xFFFF;
-	dev_priv->ospm_base = CDV_MSG_READ32(domain, PSB_PUNIT_PORT,
-							PSB_OSPMBA) & 0xFFFF;
+	dev_priv->apm_base = CDV_MSG_READ32(domain, PSB_PUNIT_PORT, PSB_APMBA) & 0xFFFF;
+	dev_priv->ospm_base = CDV_MSG_READ32(domain, PSB_PUNIT_PORT, PSB_OSPMBA) & 0xFFFF;
 
 	/* Power status */
 	pwr_cnt = inl(dev_priv->apm_base + PSB_APM_CMD);
@@ -196,6 +197,7 @@ static void cdv_init_pm(struct drm_device *dev)
 	/* Wait for the GPU power */
 	for (i = 0; i < 5; i++) {
 		u32 pwr_sts = inl(dev_priv->apm_base + PSB_APM_STS);
+
 		if ((pwr_sts & PSB_PWRGT_GFX_MASK) == 0)
 			return;
 		udelay(10);
@@ -215,7 +217,7 @@ static void cdv_errata(struct drm_device *dev)
 	 *	Bonus Launch to work around the issue, by degrading
 	 *	performance.
 	 */
-	 CDV_MSG_WRITE32(pci_domain_nr(pdev->bus), 3, 0x30, 0x08027108);
+	CDV_MSG_WRITE32(pci_domain_nr(pdev->bus), 3, 0x30, 0x08027108);
 }
 
 /**
@@ -401,20 +403,21 @@ static int cdv_power_up(struct drm_device *dev)
 
 static void cdv_hotplug_work_func(struct work_struct *work)
 {
-        struct drm_psb_private *dev_priv = container_of(work, struct drm_psb_private,
+	struct drm_psb_private *dev_priv = container_of(work, struct drm_psb_private,
 							hotplug_work);
 	struct drm_device *dev = &dev_priv->dev;
 
-        /* Just fire off a uevent and let userspace tell us what to do */
-        drm_helper_hpd_irq_event(dev);
+	/* Just fire off a uevent and let userspace tell us what to do */
+	drm_helper_hpd_irq_event(dev);
 }
 
 /* The core driver has received a hotplug IRQ. We are in IRQ context
-   so extract the needed information and kick off queued processing */
-
+ * so extract the needed information and kick off queued processing
+ */
 static int cdv_hotplug_event(struct drm_device *dev)
 {
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
+
 	schedule_work(&dev_priv->hotplug_work);
 	REG_WRITE(PORT_HOTPLUG_STAT, REG_READ(PORT_HOTPLUG_STAT));
 	return 1;
@@ -424,6 +427,7 @@ static void cdv_hotplug_enable(struct drm_device *dev, bool on)
 {
 	if (on) {
 		u32 hotplug = REG_READ(PORT_HOTPLUG_EN);
+
 		hotplug |= HDMIB_HOTPLUG_INT_EN | HDMIC_HOTPLUG_INT_EN |
 			   HDMID_HOTPLUG_INT_EN | CRT_HOTPLUG_INT_EN;
 		REG_WRITE(PORT_HOTPLUG_EN, hotplug);
@@ -549,6 +553,7 @@ static const struct psb_offset cdv_regmap[2] = {
 static int cdv_chip_setup(struct drm_device *dev)
 {
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
+
 	INIT_WORK(&dev_priv->hotplug_work, cdv_hotplug_work_func);
 
 	dev_priv->use_msi = true;
-- 
2.20.1.7.g153144c

