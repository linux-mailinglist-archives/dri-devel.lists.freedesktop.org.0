Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D3596070F1
	for <lists+dri-devel@lfdr.de>; Fri, 21 Oct 2022 09:24:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5244210E5DC;
	Fri, 21 Oct 2022 07:22:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5C3310E098
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Oct 2022 17:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666288658; x=1697824658;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=G5SeP6hMbKGGbqIANcB+W4q5oQzdkPzPsG+hKbPRgP0=;
 b=VZ0Wpp42B9yMz8+tZzWKKlIOVXifImYHt8qB3dU6cJFe2LgoYm2BbdqP
 g2AoRv6BlBEyjtF7jsi2/d//imSGgKTOuhZtcX1HwkILAVYa57JrVwmpR
 kzCxa4xenACMGdcLfiNf5YD5DOAmA/iLbz986E9KpstzsLQVfAncq/d/b
 c3Gb/ESr37E7gMmaFz7MQA9y08ApXGiOcyWFr9PRGhLBzrxAZtcN2vF6h
 4ONU+BUIq9pLXN5rFOkmjePZNzI9CHpcmAjLWtWlocw8XeBJeWWl0ceTI
 KG/WPp+Yjo1IO6RsJuHAj269/u0EVejaMrH1TgZ9fx/6HSCcK7Mzd9kh5 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="305528648"
X-IronPort-AV: E=Sophos;i="5.95,199,1661842800"; d="scan'208";a="305528648"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2022 10:57:38 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="772517074"
X-IronPort-AV: E=Sophos;i="5.95,199,1661842800"; d="scan'208";a="772517074"
Received: from gna-nuc-dev34.igk.intel.com ([10.102.80.34])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2022 10:57:35 -0700
From: Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>
To: Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>,
 Derek Kiernan <derek.kiernan@xilinx.com>,
 Dragan Cvetic <dragan.cvetic@xilinx.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Olof Johansson <olof@lixom.net>
Subject: [PATCH v5 09/10] gna: add power management
Date: Thu, 20 Oct 2022 19:53:33 +0200
Message-Id: <20221020175334.1820519-10-maciej.kwapulinski@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221020175334.1820519-1-maciej.kwapulinski@linux.intel.com>
References: <20221020175334.1820519-1-maciej.kwapulinski@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 21 Oct 2022 07:22:31 +0000
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
Cc: linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>,
 Tomasz Jankowski <tomasz1.jankowski@intel.com>,
 Mikolaj Grzybowski <mikolajx.grzybowski@intel.com>,
 Jianxun Zhang <jianxun.zhang@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Implement power management in GNA driver

Signed-off-by: Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>
Tested-by: Mikolaj Grzybowski <mikolajx.grzybowski@intel.com>
Co-developed-by: Tomasz Jankowski <tomasz1.jankowski@intel.com>
Signed-off-by: Tomasz Jankowski <tomasz1.jankowski@intel.com>
Co-developed-by: Jianxun Zhang <jianxun.zhang@linux.intel.com>
Signed-off-by: Jianxun Zhang <jianxun.zhang@linux.intel.com>
---
 drivers/gpu/drm/gna/gna_device.c  | 47 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/gna/gna_device.h  |  3 ++
 drivers/gpu/drm/gna/gna_pci.c     |  3 ++
 drivers/gpu/drm/gna/gna_request.c | 15 ++++++++++
 4 files changed, 68 insertions(+)

diff --git a/drivers/gpu/drm/gna/gna_device.c b/drivers/gpu/drm/gna/gna_device.c
index 2ef5be16dc9a..aee409e3b4ea 100644
--- a/drivers/gpu/drm/gna/gna_device.c
+++ b/drivers/gpu/drm/gna/gna_device.c
@@ -32,6 +32,32 @@ static const struct drm_ioctl_desc gna_drm_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(GNA_WAIT, gna_wait_ioctl, DRM_RENDER_ALLOW),
 };
 
+static int __maybe_unused gna_runtime_suspend(struct device *dev)
+{
+	struct drm_device *drm_dev = dev_get_drvdata(dev);
+	struct gna_device *gna_priv = to_gna_device(drm_dev);
+	u32 val = gna_reg_read(gna_priv, GNA_MMIO_D0I3C);
+
+	dev_dbg(dev, "%s D0I3, reg %.8x\n", __func__, val);
+
+	return 0;
+}
+
+static int __maybe_unused gna_runtime_resume(struct device *dev)
+{
+	struct drm_device *drm_dev = dev_get_drvdata(dev);
+	struct gna_device *gna_priv = to_gna_device(drm_dev);
+	u32 val = gna_reg_read(gna_priv, GNA_MMIO_D0I3C);
+
+	dev_dbg(dev, "%s D0I3, reg %.8x\n", __func__, val);
+
+	return 0;
+}
+
+const struct dev_pm_ops __maybe_unused gna_pm = {
+	SET_RUNTIME_PM_OPS(gna_runtime_suspend, gna_runtime_resume, NULL)
+};
+
 
 static void gna_drm_dev_fini(struct drm_device *dev, void *ptr)
 {
@@ -49,6 +75,22 @@ static int gna_drm_dev_init(struct drm_device *dev)
 	return drmm_add_action_or_reset(dev, gna_drm_dev_fini, NULL);
 }
 
+static void gna_pm_init(struct device *dev)
+{
+	pm_runtime_set_autosuspend_delay(dev, 2000);
+	pm_runtime_use_autosuspend(dev);
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_allow(dev);
+	pm_runtime_put_noidle(dev);
+}
+
+static void gna_pm_fini(struct drm_device *drm, void *data)
+{
+	struct device *dev = data;
+
+	pm_runtime_get_noresume(dev);
+}
+
 static irqreturn_t gna_interrupt(int irq, void *priv)
 {
 	struct gna_device *gna_priv;
@@ -170,6 +212,11 @@ int gna_probe(struct device *parent, struct gna_dev_info *dev_info, void __iomem
 	if (err)
 		return err;
 
+	gna_pm_init(parent);
+	err = drmm_add_action(drm_dev, gna_pm_fini, parent);
+	if (err)
+		return err;
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/gna/gna_device.h b/drivers/gpu/drm/gna/gna_device.h
index ffdc3d1d1f87..6eae0f2f44df 100644
--- a/drivers/gpu/drm/gna/gna_device.h
+++ b/drivers/gpu/drm/gna/gna_device.h
@@ -11,6 +11,7 @@
 #include <linux/io.h>
 #include <linux/list.h>
 #include <linux/mutex.h>
+#include <linux/pm_runtime.h>
 #include <linux/types.h>
 
 #include "gna_gem.h"
@@ -78,6 +79,8 @@ int gna_score_ioctl(struct drm_device *dev, void *data,
 int gna_wait_ioctl(struct drm_device *dev, void *data,
 		struct drm_file *file);
 
+extern const struct dev_pm_ops __maybe_unused gna_pm;
+
 static inline u32 gna_reg_read(struct gna_device *gna_priv, u32 reg)
 {
 	return readl(gna_priv->iobase + reg);
diff --git a/drivers/gpu/drm/gna/gna_pci.c b/drivers/gpu/drm/gna/gna_pci.c
index 034554b417a8..eaae42142bfb 100644
--- a/drivers/gpu/drm/gna/gna_pci.c
+++ b/drivers/gpu/drm/gna/gna_pci.c
@@ -138,6 +138,9 @@ static struct pci_driver gna_pci_driver = {
 	.name = DRIVER_NAME,
 	.id_table = gna_pci_ids,
 	.probe = gna_pci_probe,
+	.driver = {
+		.pm = &gna_pm,
+	},
 };
 
 module_pci_driver(gna_pci_driver);
diff --git a/drivers/gpu/drm/gna/gna_request.c b/drivers/gpu/drm/gna/gna_request.c
index 9efaea61ac68..1d9572bedcc2 100644
--- a/drivers/gpu/drm/gna/gna_request.c
+++ b/drivers/gpu/drm/gna/gna_request.c
@@ -11,6 +11,7 @@
 #include <linux/list.h>
 #include <linux/math.h>
 #include <linux/mutex.h>
+#include <linux/pm_runtime.h>
 #include <linux/slab.h>
 #include <linux/timekeeping.h>
 #include <linux/uaccess.h>
@@ -110,6 +111,14 @@ static void gna_request_process(struct work_struct *work)
 
 	score_request->drv_perf.pre_processing = ktime_get_ns();
 
+	ret = pm_runtime_get_sync(gna_dev(gna_priv));
+	if (ret < 0 && ret != -EACCES) {
+		dev_warn(gna_dev(gna_priv), "pm_runtime_get_sync() failed: %d\n", ret);
+		score_request->status = -ENODEV;
+		pm_runtime_put_noidle(gna_dev(gna_priv));
+		goto tail;
+	}
+
 	/* Set busy flag before kicking off HW. The isr will clear it and wake up us. There is
 	 * no difference if isr is missed in a timeout situation of the last request. We just
 	 * always set it busy and let the wait_event_timeout check the reset.
@@ -120,6 +129,8 @@ static void gna_request_process(struct work_struct *work)
 
 	ret = gna_score(score_request);
 	if (ret) {
+		if (pm_runtime_put(gna_dev(gna_priv)) < 0)
+			dev_warn(gna_dev(gna_priv), "pm_runtime_put() failed: %d\n", ret);
 		score_request->status = ret;
 		goto tail;
 	}
@@ -142,6 +153,10 @@ static void gna_request_process(struct work_struct *work)
 	if (ret < 0 && score_request->status == 0)
 		score_request->status = ret; // -ETIMEDOUT
 
+	ret = pm_runtime_put(gna_dev(gna_priv));
+	if (ret < 0)
+		dev_warn(gna_dev(gna_priv), "pm_runtime_put() failed: %d\n", ret);
+
 	gna_mmu_clear(gna_priv);
 
 	for (i = 0, buffer = score_request->buffer_list; i < score_request->buffer_count; i++, buffer++)
-- 
2.25.1

