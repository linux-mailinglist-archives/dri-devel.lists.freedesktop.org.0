Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A389F790411
	for <lists+dri-devel@lfdr.de>; Sat,  2 Sep 2023 01:40:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B61DB10E7DB;
	Fri,  1 Sep 2023 23:40:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 430A810E7CF
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Sep 2023 23:40:50 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id
 41be03b00d2f7-565f86ff4d1so1734376a12.2
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Sep 2023 16:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1693611649; x=1694216449;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=avtFoQWfrX7xdMu3Sd5ac4PfesUntzwfqvS4jP+7oBI=;
 b=VW8bQaaz8o3xIpXlTwDmmlBjm99kbx/0xFhohyyY2JbAI2fvAIb81qYrGOn18etKrB
 QjKsO2FJ4nSIgC+7Pl+G2SfrQHIttsk95lfTO1+Ejjz8JT7XgJIEGCZquE27832OD4Qz
 2PHcGcR8BUZxr7ozy3WPgxeSHK1bz+xX801H0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693611649; x=1694216449;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=avtFoQWfrX7xdMu3Sd5ac4PfesUntzwfqvS4jP+7oBI=;
 b=Q+LDmPFm3R7rLpknHsKnqf2zpgR+tFRklOUrE5O4rmCJAAwirnwH6nGc2LPOxYPNLk
 NmoZR0zYwiZDEcfT4bIE3YON02yzmZ5fRU/6P/pYMyO3uPe4X3NoikplUyPVm8U1N/da
 7iNKKgRtKX+QWjUXmyEpSzYxBW1BmqmoEi7gcZnUCucY4a6t9W+wSO2uj5jfgHUpKA3U
 JF4r69peM8yI/jFQ1rOHVoFxGORDQvBYx5Kh/DYIjs9Y6Ah5zgtNQFFr/Mf5i8SOCJyj
 4Ob0yX8QXJkqMwdBLHxFxYUjMOy/dzQelBX+k4reaHlYPXSn97uNJ5QyMfiXXqbVFs23
 Tbkw==
X-Gm-Message-State: AOJu0YzlQvYKV7L3a/kJE37w+V/t+PmtNHqvJhDoXPxQBTSLPu8vvU54
 N5Gjws0YB1+dcrjdwMRderDCP/8/h/ImsDAnloxmwScy
X-Google-Smtp-Source: AGHT+IF+1sCuqR6i5s3DNMl3XitRy524OyiSPFyAlVpl5Y7dCztWfGCzWdm6Ibi7nkN2uBmxsAN69Q==
X-Received: by 2002:a17:90a:898d:b0:262:ece1:5fd0 with SMTP id
 v13-20020a17090a898d00b00262ece15fd0mr3751666pjn.12.1693611648909; 
 Fri, 01 Sep 2023 16:40:48 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:8d94:1fc5:803c:41cc])
 by smtp.gmail.com with ESMTPSA id
 5-20020a17090a1a4500b0026b4ca7f62csm3773488pjl.39.2023.09.01.16.40.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Sep 2023 16:40:48 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Subject: [RFT PATCH 2/6] drm: Call drm_atomic_helper_shutdown() at shutdown
 time for misc drivers
Date: Fri,  1 Sep 2023 16:39:53 -0700
Message-ID: <20230901163944.RFT.2.I9115e5d094a43e687978b0699cc1fe9f2a3452ea@changeid>
X-Mailer: git-send-email 2.42.0.283.g2d96d420d3-goog
In-Reply-To: <20230901234015.566018-1-dianders@chromium.org>
References: <20230901234015.566018-1-dianders@chromium.org>
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
Cc: alexandre.belloni@bootlin.com, xinliang.liu@linaro.org,
 tomi.valkeinen@ideasonboard.com, liviu.dudau@arm.com,
 linux-hyperv@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
 wens@csie.org, jstultz@google.com, kraxel@redhat.com, sumit.semwal@linaro.org,
 yongqin.liu@linaro.org, samuel@sholland.org, sam@ravnborg.org,
 javierm@redhat.com, jernej.skrabec@gmail.com, drawat.floss@gmail.com,
 kong.kongxinwei@hisilicon.com, alain.volmat@foss.st.com,
 linux-sunxi@lists.linux.dev, nicolas.ferre@microchip.com,
 suijingfeng@loongson.cn, tzimmermann@suse.de, alison.wang@nxp.com,
 airlied@redhat.com, virtualization@lists.linux-foundation.org,
 linux-arm-kernel@lists.infradead.org, jfalempe@redhat.com,
 bbrezillon@kernel.org, linux-kernel@vger.kernel.org, christian.koenig@amd.com,
 paul.kocialkowski@bootlin.com, spice-devel@lists.freedesktop.org,
 alexander.deucher@amd.com, tiantao6@hisilicon.com,
 claudiu.beznea@microchip.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Based on grepping through the source code these drivers appear to be
missing a call to drm_atomic_helper_shutdown() at system shutdown
time. Among other things, this means that if a panel is in use that it
won't be cleanly powered off at system shutdown time.

The fact that we should call drm_atomic_helper_shutdown() in the case
of OS shutdown/restart comes straight out of the kernel doc "driver
instance overview" in drm_drv.c.

All of the drivers in this patch were fairly straightforward to fix
since they already had a call to drm_atomic_helper_shutdown() at
remove/unbind time but were just lacking one at system shutdown. The
only hitch is that some of these drivers use the component model to
register/unregister their DRM devices. The shutdown callback is part
of the original device. The typical solution here, based on how other
DRM drivers do this, is to keep track of whether the device is bound
based on drvdata. In most cases the drvdata is the drm_device, so we
can just make sure it is NULL when the device is not bound. In some
drivers, this required minor code changes. To make things simpler,
drm_atomic_helper_shutdown() has been modified to consider a NULL
drm_device as a noop in the patch ("drm/atomic-helper:
drm_atomic_helper_shutdown(NULL) should be a noop").

Suggested-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
This commit is only compile-time tested.

Note that checkpatch yells that "drivers/gpu/drm/tiny/cirrus.c" is
marked as 'obsolete', but it seems silly not to include the fix if
it's already been written. If someone wants me to take that out,
though, I can.

 drivers/gpu/drm/arm/display/komeda/komeda_drv.c | 9 +++++++++
 drivers/gpu/drm/arm/display/komeda/komeda_kms.c | 7 +++++++
 drivers/gpu/drm/arm/display/komeda/komeda_kms.h | 1 +
 drivers/gpu/drm/arm/hdlcd_drv.c                 | 6 ++++++
 drivers/gpu/drm/arm/malidp_drv.c                | 6 ++++++
 drivers/gpu/drm/ast/ast_drv.c                   | 6 ++++++
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c    | 6 ++++++
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c       | 8 ++++++++
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c | 6 ++++++
 drivers/gpu/drm/hyperv/hyperv_drm_drv.c         | 6 ++++++
 drivers/gpu/drm/logicvc/logicvc_drm.c           | 9 +++++++++
 drivers/gpu/drm/loongson/lsdc_drv.c             | 6 ++++++
 drivers/gpu/drm/mcde/mcde_drv.c                 | 9 +++++++++
 drivers/gpu/drm/omapdrm/omap_drv.c              | 8 ++++++++
 drivers/gpu/drm/qxl/qxl_drv.c                   | 7 +++++++
 drivers/gpu/drm/sti/sti_drv.c                   | 7 +++++++
 drivers/gpu/drm/sun4i/sun4i_drv.c               | 6 ++++++
 drivers/gpu/drm/tiny/bochs.c                    | 6 ++++++
 drivers/gpu/drm/tiny/cirrus.c                   | 6 ++++++
 19 files changed, 125 insertions(+)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_drv.c b/drivers/gpu/drm/arm/display/komeda/komeda_drv.c
index cb2a2be24c5f..cc57ea4e13ae 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_drv.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_drv.c
@@ -45,6 +45,14 @@ static void komeda_platform_remove(struct platform_device *pdev)
 	devm_kfree(dev, mdrv);
 }
 
+static void komeda_platform_shutdown(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct komeda_drv *mdrv = dev_get_drvdata(dev);
+
+	komeda_kms_shutdown(mdrv->kms);
+}
+
 static int komeda_platform_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -142,6 +150,7 @@ static const struct dev_pm_ops komeda_pm_ops = {
 static struct platform_driver komeda_platform_driver = {
 	.probe	= komeda_platform_probe,
 	.remove_new = komeda_platform_remove,
+	.shutdown = komeda_platform_shutdown,
 	.driver	= {
 		.name = "komeda",
 		.of_match_table	= komeda_of_match,
diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_kms.c b/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
index 9299026701f3..fe46b0ebefea 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
@@ -340,3 +340,10 @@ void komeda_kms_detach(struct komeda_kms_dev *kms)
 	komeda_kms_cleanup_private_objs(kms);
 	drm->dev_private = NULL;
 }
+
+void komeda_kms_shutdown(struct komeda_kms_dev *kms)
+{
+	struct drm_device *drm = &kms->base;
+
+	drm_atomic_helper_shutdown(drm);
+}
diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_kms.h b/drivers/gpu/drm/arm/display/komeda/komeda_kms.h
index 6ef655326357..a4048724564d 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_kms.h
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_kms.h
@@ -190,5 +190,6 @@ void komeda_crtc_flush_and_wait_for_flip_done(struct komeda_crtc *kcrtc,
 
 struct komeda_kms_dev *komeda_kms_attach(struct komeda_dev *mdev);
 void komeda_kms_detach(struct komeda_kms_dev *kms);
+void komeda_kms_shutdown(struct komeda_kms_dev *kms);
 
 #endif /*_KOMEDA_KMS_H_*/
diff --git a/drivers/gpu/drm/arm/hdlcd_drv.c b/drivers/gpu/drm/arm/hdlcd_drv.c
index aa06f9838015..32be9e370049 100644
--- a/drivers/gpu/drm/arm/hdlcd_drv.c
+++ b/drivers/gpu/drm/arm/hdlcd_drv.c
@@ -372,6 +372,11 @@ static void hdlcd_remove(struct platform_device *pdev)
 	component_master_del(&pdev->dev, &hdlcd_master_ops);
 }
 
+static void hdlcd_shutdown(struct platform_device *pdev)
+{
+	drm_atomic_helper_shutdown(platform_get_drvdata(pdev));
+}
+
 static const struct of_device_id  hdlcd_of_match[] = {
 	{ .compatible	= "arm,hdlcd" },
 	{},
@@ -399,6 +404,7 @@ static SIMPLE_DEV_PM_OPS(hdlcd_pm_ops, hdlcd_pm_suspend, hdlcd_pm_resume);
 static struct platform_driver hdlcd_platform_driver = {
 	.probe		= hdlcd_probe,
 	.remove_new	= hdlcd_remove,
+	.shutdown	= hdlcd_shutdown,
 	.driver	= {
 		.name = "hdlcd",
 		.pm = &hdlcd_pm_ops,
diff --git a/drivers/gpu/drm/arm/malidp_drv.c b/drivers/gpu/drm/arm/malidp_drv.c
index 62329d5dd992..6682131d2910 100644
--- a/drivers/gpu/drm/arm/malidp_drv.c
+++ b/drivers/gpu/drm/arm/malidp_drv.c
@@ -941,6 +941,11 @@ static void malidp_platform_remove(struct platform_device *pdev)
 	component_master_del(&pdev->dev, &malidp_master_ops);
 }
 
+static void malidp_platform_shutdown(struct platform_device *pdev)
+{
+	drm_atomic_helper_shutdown(platform_get_drvdata(pdev));
+}
+
 static int __maybe_unused malidp_pm_suspend(struct device *dev)
 {
 	struct drm_device *drm = dev_get_drvdata(dev);
@@ -982,6 +987,7 @@ static const struct dev_pm_ops malidp_pm_ops = {
 static struct platform_driver malidp_platform_driver = {
 	.probe		= malidp_platform_probe,
 	.remove_new	= malidp_platform_remove,
+	.shutdown	= malidp_platform_shutdown,
 	.driver	= {
 		.name = "mali-dp",
 		.pm = &malidp_pm_ops,
diff --git a/drivers/gpu/drm/ast/ast_drv.c b/drivers/gpu/drm/ast/ast_drv.c
index e1224ef4ad83..cf5b754f044c 100644
--- a/drivers/gpu/drm/ast/ast_drv.c
+++ b/drivers/gpu/drm/ast/ast_drv.c
@@ -125,6 +125,11 @@ static void ast_pci_remove(struct pci_dev *pdev)
 	drm_atomic_helper_shutdown(dev);
 }
 
+static void ast_pci_shutdown(struct pci_dev *pdev)
+{
+	drm_atomic_helper_shutdown(pci_get_drvdata(pdev));
+}
+
 static int ast_drm_freeze(struct drm_device *dev)
 {
 	int error;
@@ -209,6 +214,7 @@ static struct pci_driver ast_pci_driver = {
 	.id_table = ast_pciidlist,
 	.probe = ast_pci_probe,
 	.remove = ast_pci_remove,
+	.shutdown = ast_pci_shutdown,
 	.driver.pm = &ast_pm_ops,
 };
 
diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
index fa0f9a93d50d..84c54e8622d1 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
@@ -782,6 +782,11 @@ static void atmel_hlcdc_dc_drm_remove(struct platform_device *pdev)
 	drm_dev_put(ddev);
 }
 
+static void atmel_hlcdc_dc_drm_shutdown(struct platform_device *pdev)
+{
+	drm_atomic_helper_shutdown(platform_get_drvdata(pdev));
+}
+
 static int atmel_hlcdc_dc_drm_suspend(struct device *dev)
 {
 	struct drm_device *drm_dev = dev_get_drvdata(dev);
@@ -825,6 +830,7 @@ static const struct of_device_id atmel_hlcdc_dc_of_match[] = {
 static struct platform_driver atmel_hlcdc_dc_platform_driver = {
 	.probe	= atmel_hlcdc_dc_drm_probe,
 	.remove_new = atmel_hlcdc_dc_drm_remove,
+	.shutdown = atmel_hlcdc_dc_drm_shutdown,
 	.driver	= {
 		.name	= "atmel-hlcdc-display-controller",
 		.pm	= pm_sleep_ptr(&atmel_hlcdc_dc_drm_pm_ops),
diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
index a395f93449f3..ab6c0c6cd0e2 100644
--- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
+++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
@@ -356,9 +356,17 @@ static void fsl_dcu_drm_remove(struct platform_device *pdev)
 	clk_unregister(fsl_dev->pix_clk);
 }
 
+static void fsl_dcu_drm_shutdown(struct platform_device *pdev)
+{
+	struct fsl_dcu_drm_device *fsl_dev = platform_get_drvdata(pdev);
+
+	drm_atomic_helper_shutdown(fsl_dev->drm);
+}
+
 static struct platform_driver fsl_dcu_drm_platform_driver = {
 	.probe		= fsl_dcu_drm_probe,
 	.remove_new	= fsl_dcu_drm_remove,
+	.shutdown	= fsl_dcu_drm_shutdown,
 	.driver		= {
 		.name	= "fsl-dcu",
 		.pm	= &fsl_dcu_drm_pm_ops,
diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
index 8a98fa276e8a..57c21ec452b7 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
@@ -357,6 +357,11 @@ static void hibmc_pci_remove(struct pci_dev *pdev)
 	hibmc_unload(dev);
 }
 
+static void hibmc_pci_shutdown(struct pci_dev *pdev)
+{
+	drm_atomic_helper_shutdown(pci_get_drvdata(pdev));
+}
+
 static const struct pci_device_id hibmc_pci_table[] = {
 	{ PCI_VDEVICE(HUAWEI, 0x1711) },
 	{0,}
@@ -367,6 +372,7 @@ static struct pci_driver hibmc_pci_driver = {
 	.id_table =	hibmc_pci_table,
 	.probe =	hibmc_pci_probe,
 	.remove =	hibmc_pci_remove,
+	.shutdown =	hibmc_pci_shutdown,
 	.driver.pm =    &hibmc_pm_ops,
 };
 
diff --git a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c b/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
index 8026118c6e03..58b0b46a21e6 100644
--- a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
+++ b/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
@@ -178,6 +178,11 @@ static void hyperv_vmbus_remove(struct hv_device *hdev)
 	vmbus_free_mmio(hv->mem->start, hv->fb_size);
 }
 
+static void hyperv_vmbus_shutdown(struct hv_device *hdev)
+{
+	drm_atomic_helper_shutdown(hv_get_drvdata(hdev));
+}
+
 static int hyperv_vmbus_suspend(struct hv_device *hdev)
 {
 	struct drm_device *dev = hv_get_drvdata(hdev);
@@ -220,6 +225,7 @@ static struct hv_driver hyperv_hv_driver = {
 	.id_table = hyperv_vmbus_tbl,
 	.probe = hyperv_vmbus_probe,
 	.remove = hyperv_vmbus_remove,
+	.shutdown = hyperv_vmbus_shutdown,
 	.suspend = hyperv_vmbus_suspend,
 	.resume = hyperv_vmbus_resume,
 	.driver = {
diff --git a/drivers/gpu/drm/logicvc/logicvc_drm.c b/drivers/gpu/drm/logicvc/logicvc_drm.c
index 749debd3d6a5..01a37e28c080 100644
--- a/drivers/gpu/drm/logicvc/logicvc_drm.c
+++ b/drivers/gpu/drm/logicvc/logicvc_drm.c
@@ -482,6 +482,14 @@ static void logicvc_drm_remove(struct platform_device *pdev)
 	of_reserved_mem_device_release(dev);
 }
 
+static void logicvc_drm_shutdown(struct platform_device *pdev)
+{
+	struct logicvc_drm *logicvc = platform_get_drvdata(pdev);
+	struct drm_device *drm_dev = &logicvc->drm_dev;
+
+	drm_atomic_helper_shutdown(drm_dev);
+}
+
 static const struct of_device_id logicvc_drm_of_table[] = {
 	{ .compatible = "xylon,logicvc-3.02.a-display" },
 	{ .compatible = "xylon,logicvc-4.01.a-display" },
@@ -492,6 +500,7 @@ MODULE_DEVICE_TABLE(of, logicvc_drm_of_table);
 static struct platform_driver logicvc_drm_platform_driver = {
 	.probe		= logicvc_drm_probe,
 	.remove_new	= logicvc_drm_remove,
+	.shutdown	= logicvc_drm_shutdown,
 	.driver		= {
 		.name		= "logicvc-drm",
 		.of_match_table	= logicvc_drm_of_table,
diff --git a/drivers/gpu/drm/loongson/lsdc_drv.c b/drivers/gpu/drm/loongson/lsdc_drv.c
index 188ec82afcfb..89ccc0c43169 100644
--- a/drivers/gpu/drm/loongson/lsdc_drv.c
+++ b/drivers/gpu/drm/loongson/lsdc_drv.c
@@ -327,6 +327,11 @@ static void lsdc_pci_remove(struct pci_dev *pdev)
 	drm_atomic_helper_shutdown(ddev);
 }
 
+static void lsdc_pci_shutdown(struct pci_dev *pdev)
+{
+	drm_atomic_helper_shutdown(pci_get_drvdata(pdev));
+}
+
 static int lsdc_drm_freeze(struct drm_device *ddev)
 {
 	struct lsdc_device *ldev = to_lsdc(ddev);
@@ -447,6 +452,7 @@ struct pci_driver lsdc_pci_driver = {
 	.id_table = lsdc_pciid_list,
 	.probe = lsdc_pci_probe,
 	.remove = lsdc_pci_remove,
+	.shutdown = lsdc_pci_shutdown,
 	.driver.pm = &lsdc_pm_ops,
 };
 
diff --git a/drivers/gpu/drm/mcde/mcde_drv.c b/drivers/gpu/drm/mcde/mcde_drv.c
index a2572fb311f0..10c06440c7e7 100644
--- a/drivers/gpu/drm/mcde/mcde_drv.c
+++ b/drivers/gpu/drm/mcde/mcde_drv.c
@@ -459,6 +459,14 @@ static void mcde_remove(struct platform_device *pdev)
 	regulator_disable(mcde->epod);
 }
 
+static void mcde_shutdown(struct platform_device *pdev)
+{
+	struct drm_device *drm = platform_get_drvdata(pdev);
+
+	if (drm->registered)
+		drm_atomic_helper_shutdown(drm);
+}
+
 static const struct of_device_id mcde_of_match[] = {
 	{
 		.compatible = "ste,mcde",
@@ -473,6 +481,7 @@ static struct platform_driver mcde_driver = {
 	},
 	.probe = mcde_probe,
 	.remove_new = mcde_remove,
+	.shutdown = mcde_shutdown,
 };
 
 static struct platform_driver *const component_drivers[] = {
diff --git a/drivers/gpu/drm/omapdrm/omap_drv.c b/drivers/gpu/drm/omapdrm/omap_drv.c
index afeeb7737552..b2835b3ea6f5 100644
--- a/drivers/gpu/drm/omapdrm/omap_drv.c
+++ b/drivers/gpu/drm/omapdrm/omap_drv.c
@@ -817,6 +817,13 @@ static void pdev_remove(struct platform_device *pdev)
 	kfree(priv);
 }
 
+static void pdev_shutdown(struct platform_device *pdev)
+{
+	struct omap_drm_private *priv = platform_get_drvdata(pdev);
+
+	drm_atomic_helper_shutdown(priv->ddev);
+}
+
 #ifdef CONFIG_PM_SLEEP
 static int omap_drm_suspend(struct device *dev)
 {
@@ -846,6 +853,7 @@ static struct platform_driver pdev = {
 	},
 	.probe = pdev_probe,
 	.remove_new = pdev_remove,
+	.shutdown = pdev_shutdown,
 };
 
 static struct platform_driver * const drivers[] = {
diff --git a/drivers/gpu/drm/qxl/qxl_drv.c b/drivers/gpu/drm/qxl/qxl_drv.c
index b30ede1cf62d..a4144c62ca93 100644
--- a/drivers/gpu/drm/qxl/qxl_drv.c
+++ b/drivers/gpu/drm/qxl/qxl_drv.c
@@ -163,6 +163,12 @@ qxl_pci_remove(struct pci_dev *pdev)
 		vga_put(pdev, VGA_RSRC_LEGACY_IO);
 }
 
+static void
+qxl_pci_shutdown(struct pci_dev *pdev)
+{
+	drm_atomic_helper_shutdown(pci_get_drvdata(pdev));
+}
+
 DEFINE_DRM_GEM_FOPS(qxl_fops);
 
 static int qxl_drm_freeze(struct drm_device *dev)
@@ -269,6 +275,7 @@ static struct pci_driver qxl_pci_driver = {
 	 .id_table = pciidlist,
 	 .probe = qxl_pci_probe,
 	 .remove = qxl_pci_remove,
+	 .shutdown = qxl_pci_shutdown,
 	 .driver.pm = &qxl_pm_ops,
 };
 
diff --git a/drivers/gpu/drm/sti/sti_drv.c b/drivers/gpu/drm/sti/sti_drv.c
index 2390c1bb6596..4bab93c4fefd 100644
--- a/drivers/gpu/drm/sti/sti_drv.c
+++ b/drivers/gpu/drm/sti/sti_drv.c
@@ -174,6 +174,7 @@ static void sti_cleanup(struct drm_device *ddev)
 	drm_atomic_helper_shutdown(ddev);
 	drm_mode_config_cleanup(ddev);
 	component_unbind_all(ddev->dev, ddev);
+	dev_set_drvdata(ddev->dev, NULL);
 	kfree(private);
 	ddev->dev_private = NULL;
 }
@@ -253,6 +254,11 @@ static void sti_platform_remove(struct platform_device *pdev)
 	component_master_del(&pdev->dev, &sti_ops);
 }
 
+static void sti_platform_shutdown(struct platform_device *pdev)
+{
+	drm_atomic_helper_shutdown(platform_get_drvdata(pdev));
+}
+
 static const struct of_device_id sti_dt_ids[] = {
 	{ .compatible = "st,sti-display-subsystem", },
 	{ /* end node */ },
@@ -262,6 +268,7 @@ MODULE_DEVICE_TABLE(of, sti_dt_ids);
 static struct platform_driver sti_platform_driver = {
 	.probe = sti_platform_probe,
 	.remove_new = sti_platform_remove,
+	.shutdown = sti_platform_shutdown,
 	.driver = {
 		.name = DRIVER_NAME,
 		.of_match_table = sti_dt_ids,
diff --git a/drivers/gpu/drm/sun4i/sun4i_drv.c b/drivers/gpu/drm/sun4i/sun4i_drv.c
index 6a8dfc022d3c..35d7a7ffd208 100644
--- a/drivers/gpu/drm/sun4i/sun4i_drv.c
+++ b/drivers/gpu/drm/sun4i/sun4i_drv.c
@@ -413,6 +413,11 @@ static void sun4i_drv_remove(struct platform_device *pdev)
 	component_master_del(&pdev->dev, &sun4i_drv_master_ops);
 }
 
+static void sun4i_drv_shutdown(struct platform_device *pdev)
+{
+	drm_atomic_helper_shutdown(platform_get_drvdata(pdev));
+}
+
 static const struct of_device_id sun4i_drv_of_table[] = {
 	{ .compatible = "allwinner,sun4i-a10-display-engine" },
 	{ .compatible = "allwinner,sun5i-a10s-display-engine" },
@@ -437,6 +442,7 @@ MODULE_DEVICE_TABLE(of, sun4i_drv_of_table);
 static struct platform_driver sun4i_drv_platform_driver = {
 	.probe		= sun4i_drv_probe,
 	.remove_new	= sun4i_drv_remove,
+	.shutdown	= sun4i_drv_shutdown,
 	.driver		= {
 		.name		= "sun4i-drm",
 		.of_match_table	= sun4i_drv_of_table,
diff --git a/drivers/gpu/drm/tiny/bochs.c b/drivers/gpu/drm/tiny/bochs.c
index d254679a136e..c23c9f0cf49c 100644
--- a/drivers/gpu/drm/tiny/bochs.c
+++ b/drivers/gpu/drm/tiny/bochs.c
@@ -690,6 +690,11 @@ static void bochs_pci_remove(struct pci_dev *pdev)
 	drm_dev_put(dev);
 }
 
+static void bochs_pci_shutdown(struct pci_dev *pdev)
+{
+	drm_atomic_helper_shutdown(pci_get_drvdata(pdev));
+}
+
 static const struct pci_device_id bochs_pci_tbl[] = {
 	{
 		.vendor      = 0x1234,
@@ -720,6 +725,7 @@ static struct pci_driver bochs_pci_driver = {
 	.id_table =	bochs_pci_tbl,
 	.probe =	bochs_pci_probe,
 	.remove =	bochs_pci_remove,
+	.shutdown =	bochs_pci_shutdown,
 	.driver.pm =    &bochs_pm_ops,
 };
 
diff --git a/drivers/gpu/drm/tiny/cirrus.c b/drivers/gpu/drm/tiny/cirrus.c
index 594bc472862f..c5c34cd2edc1 100644
--- a/drivers/gpu/drm/tiny/cirrus.c
+++ b/drivers/gpu/drm/tiny/cirrus.c
@@ -727,6 +727,11 @@ static void cirrus_pci_remove(struct pci_dev *pdev)
 	drm_atomic_helper_shutdown(dev);
 }
 
+static void cirrus_pci_shutdown(struct pci_dev *pdev)
+{
+	drm_atomic_helper_shutdown(pci_get_drvdata(pdev));
+}
+
 static const struct pci_device_id pciidlist[] = {
 	{
 		.vendor    = PCI_VENDOR_ID_CIRRUS,
@@ -748,6 +753,7 @@ static struct pci_driver cirrus_pci_driver = {
 	.id_table = pciidlist,
 	.probe = cirrus_pci_probe,
 	.remove = cirrus_pci_remove,
+	.shutdown = cirrus_pci_shutdown,
 };
 
 drm_module_pci_driver(cirrus_pci_driver)
-- 
2.42.0.283.g2d96d420d3-goog

