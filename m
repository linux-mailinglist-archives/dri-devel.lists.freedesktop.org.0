Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3AAF8C565E
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2024 14:56:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA1BD10E7EA;
	Tue, 14 May 2024 12:56:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dek77Fgp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 694AC10E7EA
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2024 12:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715691385; x=1747227385;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=O3WR6uh8GZmy2rdXUJXqCpt0BQUtQN00jH3P5Gn5m4E=;
 b=dek77FgpaSoCOCszmS8TV7zHFbikvaqISjpeSCZj0XmJkFbk98G3xwo3
 Dyx7jYGf/cghngnsZpc/u35SaVr4w27cORhvvCvCwIiXr22coRqPJVOVP
 2CML+SkqxcJfbfpr8CtPoeEIXYC3j2DyoO1ja9L4KcCvJMUQ2S4hUq8GA
 Gjggnqw5JElF2Q1nlGl8uJpPJxeNRV/fBifX1xfd3uMT7jadp+Tnct0gK
 UMMWf/T2d8Qv2xMd7MFgA9oSU398++gxzd7mwL7fZbDfcY2IIhovM8AKL
 tAsV0ay+KLQ/l3kuHN2hqMRJmbi6vRR5sBei5ndd3F052LRKfe7srSETU g==;
X-CSE-ConnectionGUID: SbmAOIzlSlqp8VE+9ooxGQ==
X-CSE-MsgGUID: FNWxwsJPQXGCfdq6ngl8Pw==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="22270730"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="22270730"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 05:56:25 -0700
X-CSE-ConnectionGUID: hhZRhLesSbiCjuDXCXvH7Q==
X-CSE-MsgGUID: EcLCTva4To+gJY8/rwZ1dQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="35140874"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.91])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 05:56:22 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com, Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: [PATCH 09/11] drm/tegra: convert to struct drm_edid
Date: Tue, 14 May 2024 15:55:15 +0300
Message-Id: <e037667dfc325925bdeabff539df1e708d7c3c64.1715691257.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1715691257.git.jani.nikula@intel.com>
References: <cover.1715691257.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Prefer the struct drm_edid based functions for reading the EDID and
updating the connector.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>

---

Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org
---
 drivers/gpu/drm/tegra/drm.h    |  2 +-
 drivers/gpu/drm/tegra/output.c | 29 +++++++++++++++++------------
 2 files changed, 18 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.h
index 682011166a8f..2f3781e04b0a 100644
--- a/drivers/gpu/drm/tegra/drm.h
+++ b/drivers/gpu/drm/tegra/drm.h
@@ -133,7 +133,7 @@ struct tegra_output {
 	struct drm_bridge *bridge;
 	struct drm_panel *panel;
 	struct i2c_adapter *ddc;
-	const struct edid *edid;
+	const struct drm_edid *drm_edid;
 	struct cec_notifier *cec;
 	unsigned int hpd_irq;
 	struct gpio_desc *hpd_gpio;
diff --git a/drivers/gpu/drm/tegra/output.c b/drivers/gpu/drm/tegra/output.c
index 4da3c3d1abbc..e6b5863fec71 100644
--- a/drivers/gpu/drm/tegra/output.c
+++ b/drivers/gpu/drm/tegra/output.c
@@ -21,7 +21,7 @@
 int tegra_output_connector_get_modes(struct drm_connector *connector)
 {
 	struct tegra_output *output = connector_to_output(connector);
-	struct edid *edid = NULL;
+	const struct drm_edid *drm_edid;
 	int err = 0;
 
 	/*
@@ -34,18 +34,17 @@ int tegra_output_connector_get_modes(struct drm_connector *connector)
 			return err;
 	}
 
-	if (output->edid)
-		edid = kmemdup(output->edid, sizeof(*edid), GFP_KERNEL);
+	if (output->drm_edid)
+		drm_edid = drm_edid_dup(output->drm_edid);
 	else if (output->ddc)
-		edid = drm_get_edid(connector, output->ddc);
+		drm_edid = drm_edid_read_ddc(connector, output->ddc);
 
-	cec_notifier_set_phys_addr_from_edid(output->cec, edid);
-	drm_connector_update_edid_property(connector, edid);
+	drm_edid_connector_update(connector, drm_edid);
+	cec_notifier_set_phys_addr(output->cec,
+				   connector->display_info.source_physical_address);
 
-	if (edid) {
-		err = drm_add_edid_modes(connector, edid);
-		kfree(edid);
-	}
+	err = drm_edid_connector_add_modes(connector);
+	drm_edid_free(drm_edid);
 
 	return err;
 }
@@ -98,6 +97,7 @@ static irqreturn_t hpd_irq(int irq, void *data)
 int tegra_output_probe(struct tegra_output *output)
 {
 	struct device_node *ddc, *panel;
+	const void *edid;
 	unsigned long flags;
 	int err, size;
 
@@ -124,8 +124,6 @@ int tegra_output_probe(struct tegra_output *output)
 			return PTR_ERR(output->panel);
 	}
 
-	output->edid = of_get_property(output->of_node, "nvidia,edid", &size);
-
 	ddc = of_parse_phandle(output->of_node, "nvidia,ddc-i2c-bus", 0);
 	if (ddc) {
 		output->ddc = of_get_i2c_adapter_by_node(ddc);
@@ -137,6 +135,9 @@ int tegra_output_probe(struct tegra_output *output)
 		}
 	}
 
+	edid = of_get_property(output->of_node, "nvidia,edid", &size);
+	output->drm_edid = drm_edid_alloc(edid, size);
+
 	output->hpd_gpio = devm_fwnode_gpiod_get(output->dev,
 					of_fwnode_handle(output->of_node),
 					"nvidia,hpd",
@@ -187,6 +188,8 @@ int tegra_output_probe(struct tegra_output *output)
 	if (output->ddc)
 		i2c_put_adapter(output->ddc);
 
+	drm_edid_free(output->drm_edid);
+
 	return err;
 }
 
@@ -197,6 +200,8 @@ void tegra_output_remove(struct tegra_output *output)
 
 	if (output->ddc)
 		i2c_put_adapter(output->ddc);
+
+	drm_edid_free(output->drm_edid);
 }
 
 int tegra_output_init(struct drm_device *drm, struct tegra_output *output)
-- 
2.39.2

