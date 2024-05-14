Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9928C5662
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2024 14:56:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 028EF10E7BE;
	Tue, 14 May 2024 12:56:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lii6+N3Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 108C910E7BE
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2024 12:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715691401; x=1747227401;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sncs7CxlVP7FlPsWW7vAI9GxSz7YTTUFsPvqj+KbprM=;
 b=Lii6+N3Z1ruyXUJlVUFXA37GSzMwDzH2bRX8PcDnbbfu7rOB4sIINlOq
 xtIw8D/kuSGcmkRHYXVu9fATygvnjCMpM5GJbGsZlGMiQBkPtZZdusdFO
 trqzEfOtWBDk+oXb7MW+1iBsumXW2T9PdfVEh1CwrQXJ9YL65NHPvXAKU
 uwKLO6rhwikBzDvrQ/zgskm/xCkV3qCTjLl/iq/7Amboe2favFxjV362M
 IoVfubuQhWgtog9HsZ3TkekSx1+GwRBXzHFRICXrKaCirHnqoLYFdiG0Z
 qbVEThxpXxFCK9O/xQnQsCRfsItR/zo3nXL9ykjQuz1a9C6uRsOoMpv7R A==;
X-CSE-ConnectionGUID: 4LBiaXLMREKHlxTdqoIKIw==
X-CSE-MsgGUID: orG+NmJWR1ykdHVzMJg7XA==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="11613870"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="11613870"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 05:56:33 -0700
X-CSE-ConnectionGUID: gjyKdEViQC633PClo/RP0w==
X-CSE-MsgGUID: f4LA4gsvSUWO93oy333Ywg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="31232409"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.91])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 05:56:29 -0700
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
Subject: [PATCH 10/11] drm/imx/tve: convert to struct drm_edid
Date: Tue, 14 May 2024 15:55:16 +0300
Message-Id: <2f59a7ad10c29c21f08223ef19221cef48623cc8.1715691257.git.jani.nikula@intel.com>
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

Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/gpu/drm/imx/ipuv3/imx-tve.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/imx/ipuv3/imx-tve.c b/drivers/gpu/drm/imx/ipuv3/imx-tve.c
index b49bddb85535..29f494bfff67 100644
--- a/drivers/gpu/drm/imx/ipuv3/imx-tve.c
+++ b/drivers/gpu/drm/imx/ipuv3/imx-tve.c
@@ -201,18 +201,16 @@ static int tve_setup_vga(struct imx_tve *tve)
 static int imx_tve_connector_get_modes(struct drm_connector *connector)
 {
 	struct imx_tve *tve = con_to_tve(connector);
-	struct edid *edid;
-	int ret = 0;
+	const struct drm_edid *drm_edid;
+	int ret;
 
 	if (!tve->ddc)
 		return 0;
 
-	edid = drm_get_edid(connector, tve->ddc);
-	if (edid) {
-		drm_connector_update_edid_property(connector, edid);
-		ret = drm_add_edid_modes(connector, edid);
-		kfree(edid);
-	}
+	drm_edid = drm_edid_read_ddc(connector, tve->ddc);
+	drm_edid_connector_update(connector, drm_edid);
+	ret = drm_edid_connector_add_modes(connector);
+	drm_edid_free(drm_edid);
 
 	return ret;
 }
-- 
2.39.2

