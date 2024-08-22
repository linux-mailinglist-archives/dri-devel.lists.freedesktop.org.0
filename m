Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35BBE95BD8F
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 19:43:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F8E710EBAE;
	Thu, 22 Aug 2024 17:43:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QhLESs4V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8EFB10EBAE
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2024 17:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724348614; x=1755884614;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cInaH5YhWjMHXB+Tiq+aUkG/UqKzahFJ+y1X1Oh0Rj8=;
 b=QhLESs4VxNpG6t7Vu/1e3GqL9uM4HF8cY++9sfYoQT1iQCbnQC8ZKe8W
 uFVusoweuyJ1ekO+hHqWcjYxiFq9wZQfiUtLq3bjjz2NVcUFmo6qFkvg4
 VFgcVJAbG4JccR+zO5WTDXP60twTF7I3A0sNdwTLSgp7+soRJYo7OUt9Q
 n3hgZH586h8eS6LZ9DyG8jBEAS+wlvCG0xtrjTczEliwADKI64yyCOvNO
 BRt73eQoE1dsXIuE18E9F+5HgwQwoVDWV0BZ3G9tT4qI6BhgaxNqefySH
 Yt4GbPtTZQo7d8e3nS+dn309/eF1ihBB6NOlD3txyXKCGBtnTLKNjlITB g==;
X-CSE-ConnectionGUID: S4ICQdRHSiumAIs9mwyimA==
X-CSE-MsgGUID: GpCej08CQberrsZuJyPX/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="22955425"
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; d="scan'208";a="22955425"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 10:43:33 -0700
X-CSE-ConnectionGUID: xddZFUq+STWsls54hLqKCA==
X-CSE-MsgGUID: p9mUht6HSpSCc/xMX6OHSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; d="scan'208";a="65862403"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.121])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 10:43:29 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com, Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH 5/6] drm/ipuv3/parallel: convert to struct drm_edid
Date: Thu, 22 Aug 2024 20:42:51 +0300
Message-Id: <a1698044d556072e79041d69b8702099fd17bd90.1724348429.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1724348429.git.jani.nikula@intel.com>
References: <cover.1724348429.git.jani.nikula@intel.com>
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

Prefer the struct drm_edid based functions for storing the EDID and
updating the connector.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>

---

Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/gpu/drm/imx/ipuv3/parallel-display.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/imx/ipuv3/parallel-display.c b/drivers/gpu/drm/imx/ipuv3/parallel-display.c
index 55dedd73f528..91d7808a2d8d 100644
--- a/drivers/gpu/drm/imx/ipuv3/parallel-display.c
+++ b/drivers/gpu/drm/imx/ipuv3/parallel-display.c
@@ -34,7 +34,7 @@ struct imx_parallel_display_encoder {
 
 struct imx_parallel_display {
 	struct device *dev;
-	void *edid;
+	const struct drm_edid *drm_edid;
 	u32 bus_format;
 	u32 bus_flags;
 	struct drm_display_mode mode;
@@ -62,9 +62,9 @@ static int imx_pd_connector_get_modes(struct drm_connector *connector)
 	if (num_modes > 0)
 		return num_modes;
 
-	if (imxpd->edid) {
-		drm_connector_update_edid_property(connector, imxpd->edid);
-		num_modes = drm_add_edid_modes(connector, imxpd->edid);
+	if (imxpd->drm_edid) {
+		drm_edid_connector_update(connector, imxpd->drm_edid);
+		num_modes = drm_edid_connector_add_modes(connector);
 	}
 
 	if (np) {
@@ -331,7 +331,7 @@ static int imx_pd_probe(struct platform_device *pdev)
 
 	edidp = of_get_property(np, "edid", &edid_len);
 	if (edidp)
-		imxpd->edid = devm_kmemdup(dev, edidp, edid_len, GFP_KERNEL);
+		imxpd->drm_edid = drm_edid_alloc(edidp, edid_len);
 
 	ret = of_property_read_string(np, "interface-pix-fmt", &fmt);
 	if (!ret) {
@@ -355,7 +355,11 @@ static int imx_pd_probe(struct platform_device *pdev)
 
 static void imx_pd_remove(struct platform_device *pdev)
 {
+	struct imx_parallel_display *imxpd = platform_get_drvdata(pdev);
+
 	component_del(&pdev->dev, &imx_pd_ops);
+
+	drm_edid_free(imxpd->drm_edid);
 }
 
 static const struct of_device_id imx_pd_dt_ids[] = {
-- 
2.39.2

