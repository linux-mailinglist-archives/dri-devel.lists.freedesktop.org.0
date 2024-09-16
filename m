Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D2F97A364
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2024 15:58:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D01510E385;
	Mon, 16 Sep 2024 13:58:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FBQ2WfF1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C3E010E37A;
 Mon, 16 Sep 2024 13:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726495082; x=1758031082;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eUyFHGpLnm0GiFr6R45QRYKMqFyqBiOPWuSQdcI130g=;
 b=FBQ2WfF1Qz2v9ys0z/HFLmS/eVRRmd85G6m8N1CZbMrxpwmgCRpqgASU
 +v8FzrZKXW2DD6NXloktd/ymUwjhDu8WvpjrHuADyescTamsoHxF88Kke
 QY//CQdaSnZFjUQTd+/+SzW2Ovy5FUKI5He1gLtTyrNDKe8W1wE5IH2XT
 sj526BBfj2A9HQVsi0pKmuGIINTMOAQ07/o7rpGWN/4KhV2mPMzXM/IKn
 OfXtm5PWM1b/1b2dh7MHCLeZ5PbRJ3UA6YEGzo6AKr8OUKCG1+KxvRw2P
 oOsgc1N+zf4Sv8eNsnsCq4fhTYEH7E6q+QBQFUOW//jiETgHs+nrpojNf A==;
X-CSE-ConnectionGUID: Diec3PwMTuSUiO7KgSPwWg==
X-CSE-MsgGUID: 4EeyHhT7SaG30irD9qgQ/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="36666863"
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; d="scan'208";a="36666863"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2024 06:58:02 -0700
X-CSE-ConnectionGUID: q7F9RPWMQp+GnsXAS4DLZQ==
X-CSE-MsgGUID: WE17oruOQryIwiRDcEDN2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; d="scan'208";a="68837396"
Received: from sannilnx-dsk.jer.intel.com ([10.12.231.107])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2024 06:57:57 -0700
From: Alexander Usyskin <alexander.usyskin@intel.com>
To: Mark Brown <broonie@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>
Cc: Tomas Winkler <tomas.winkler@intel.com>,
 Alexander Usyskin <alexander.usyskin@intel.com>,
 Vitaly Lubart <vitaly.lubart@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-spi@vger.kernel.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v6 07/12] spi: intel-dg: wake card on operations
Date: Mon, 16 Sep 2024 16:49:23 +0300
Message-Id: <20240916134928.3654054-8-alexander.usyskin@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240916134928.3654054-1-alexander.usyskin@intel.com>
References: <20240916134928.3654054-1-alexander.usyskin@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Enable runtime PM in spi driver to notify graphics driver that
whole card should be kept awake while spi operations are
performed through this driver.

CC: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
---
 drivers/spi/spi-intel-dg.c | 44 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/drivers/spi/spi-intel-dg.c b/drivers/spi/spi-intel-dg.c
index c76b0a70f8d8..a14fc3190520 100644
--- a/drivers/spi/spi-intel-dg.c
+++ b/drivers/spi/spi-intel-dg.c
@@ -12,11 +12,14 @@
 #include <linux/module.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/partitions.h>
+#include <linux/pm_runtime.h>
 #include <linux/string.h>
 #include <linux/slab.h>
 #include <linux/sizes.h>
 #include <linux/types.h>
 
+#define INTEL_DG_SPI_RPM_TIMEOUT 500
+
 struct intel_dg_spi {
 	struct kref refcnt;
 	struct mtd_info mtd;
@@ -471,6 +474,12 @@ static int intel_dg_spi_erase(struct mtd_info *mtd, struct erase_info *info)
 	total_len = info->len;
 	addr = info->addr;
 
+	ret = pm_runtime_resume_and_get(mtd->dev.parent);
+	if (ret < 0) {
+		dev_err(&mtd->dev, "rpm: get failed %d\n", ret);
+		return ret;
+	}
+
 	mutex_lock(&spi->lock);
 
 	while (total_len > 0) {
@@ -512,6 +521,8 @@ static int intel_dg_spi_erase(struct mtd_info *mtd, struct erase_info *info)
 
 out:
 	mutex_unlock(&spi->lock);
+	pm_runtime_mark_last_busy(mtd->dev.parent);
+	pm_runtime_put_autosuspend(mtd->dev.parent);
 	return ret;
 }
 
@@ -545,6 +556,12 @@ static int intel_dg_spi_read(struct mtd_info *mtd, loff_t from, size_t len,
 	if (len > spi->regions[idx].size - from)
 		len = spi->regions[idx].size - from;
 
+	ret = pm_runtime_resume_and_get(mtd->dev.parent);
+	if (ret < 0) {
+		dev_err(&mtd->dev, "rpm: get failed %zd\n", ret);
+		return ret;
+	}
+
 	mutex_lock(&spi->lock);
 
 	ret = spi_read(spi, region, from, len, buf);
@@ -557,6 +574,8 @@ static int intel_dg_spi_read(struct mtd_info *mtd, loff_t from, size_t len,
 	*retlen = ret;
 
 	mutex_unlock(&spi->lock);
+	pm_runtime_mark_last_busy(mtd->dev.parent);
+	pm_runtime_put_autosuspend(mtd->dev.parent);
 	return 0;
 }
 
@@ -590,6 +609,12 @@ static int intel_dg_spi_write(struct mtd_info *mtd, loff_t to, size_t len,
 	if (len > spi->regions[idx].size - to)
 		len = spi->regions[idx].size - to;
 
+	ret = pm_runtime_resume_and_get(mtd->dev.parent);
+	if (ret < 0) {
+		dev_err(&mtd->dev, "rpm: get failed %zd\n", ret);
+		return ret;
+	}
+
 	mutex_lock(&spi->lock);
 
 	ret = spi_write(spi, region, to, len, buf);
@@ -602,6 +627,8 @@ static int intel_dg_spi_write(struct mtd_info *mtd, loff_t to, size_t len,
 	*retlen = ret;
 
 	mutex_unlock(&spi->lock);
+	pm_runtime_mark_last_busy(mtd->dev.parent);
+	pm_runtime_put_autosuspend(mtd->dev.parent);
 	return 0;
 }
 
@@ -747,6 +774,17 @@ static int intel_dg_spi_probe(struct auxiliary_device *aux_dev,
 		}
 	}
 
+	pm_runtime_enable(device);
+
+	pm_runtime_set_autosuspend_delay(device, INTEL_DG_SPI_RPM_TIMEOUT);
+	pm_runtime_use_autosuspend(device);
+
+	ret = pm_runtime_resume_and_get(device);
+	if (ret < 0) {
+		dev_err(device, "rpm: get failed %d\n", ret);
+		goto err_norpm;
+	}
+
 	spi->base = devm_ioremap_resource(device, &ispi->bar);
 	if (IS_ERR(spi->base)) {
 		dev_err(device, "mmio not mapped\n");
@@ -769,9 +807,13 @@ static int intel_dg_spi_probe(struct auxiliary_device *aux_dev,
 
 	dev_set_drvdata(&aux_dev->dev, spi);
 
+	pm_runtime_put(device);
 	return 0;
 
 err:
+	pm_runtime_put(device);
+err_norpm:
+	pm_runtime_disable(device);
 	kref_put(&spi->refcnt, intel_dg_spi_release);
 	return ret;
 }
@@ -783,6 +825,8 @@ static void intel_dg_spi_remove(struct auxiliary_device *aux_dev)
 	if (!spi)
 		return;
 
+	pm_runtime_disable(&aux_dev->dev);
+
 	mtd_device_unregister(&spi->mtd);
 
 	dev_set_drvdata(&aux_dev->dev, NULL);
-- 
2.34.1

