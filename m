Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D776F8A6C1A
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 15:23:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 090C6112C81;
	Tue, 16 Apr 2024 13:23:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eep1WKc9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 698DB112C78
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 13:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713273779; x=1744809779;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yOMudxr/IhVFoLp6pZDvo2yX59Nca4jBORukKpBT7ik=;
 b=eep1WKc9b8NcLYyY/fHMcshSLiKdZ7qKHACwpUYhh2UTu9fuYJDwkPiq
 Oix+jJzng0e35R+bA16R7faq4MfWDXRT/vlk4DO4lrCEdkJLTxDISMWJI
 2dPZI5Z7pXaksMmaAHHJ8NdaWPiXvdezzgOTvM+sFfo/167NEDNNtBRIw
 BNi8g3B2q43L/UnMTKJhmCB1QgbGvnpgXM5rzmfux6z/pi2ffcFPs6pzl
 NFRflQIEtrXkJ1VmlbGRuio5/jZW7M9ATIHBkKCQEhhLDrdp88lEsxtlr
 2Lg7FZLrn8qycZz1J3BGGtXH7auN5v0gm8ShI3mwwjvQhd/LWl32u3nCR g==;
X-CSE-ConnectionGUID: UI06En9rQnqfEfOf77UN5Q==
X-CSE-MsgGUID: PUkb+CwNRWKN3t5696H57A==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="8875687"
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="8875687"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 06:22:45 -0700
X-CSE-ConnectionGUID: 6hFWcRddQfevPksBjD+2sg==
X-CSE-MsgGUID: TO6+m/LWRr2gzv7wv9n/oQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; d="scan'208";a="26906053"
Received: from martakit-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.44.100])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 06:22:43 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 02/15] drm/panel-samsung-atna33xc20: switch to struct drm_edid
Date: Tue, 16 Apr 2024 16:22:16 +0300
Message-Id: <4ec5ec3ac5c5fbe738f51aeeb4363de1a9672684.1713273659.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1713273659.git.jani.nikula@intel.com>
References: <cover.1713273659.git.jani.nikula@intel.com>
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

Prefer struct drm_edid based functions over struct edid.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>

---

Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/panel/panel-samsung-atna33xc20.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c b/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c
index 6828a4f24d14..a9f0d214a900 100644
--- a/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c
+++ b/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c
@@ -36,7 +36,7 @@ struct atana33xc20_panel {
 	struct gpio_desc *el_on3_gpio;
 	struct drm_dp_aux *aux;
 
-	struct edid *edid;
+	const struct drm_edid *drm_edid;
 
 	ktime_t powered_off_time;
 	ktime_t powered_on_time;
@@ -253,9 +253,12 @@ static int atana33xc20_get_modes(struct drm_panel *panel,
 
 	pm_runtime_get_sync(panel->dev);
 
-	if (!p->edid)
-		p->edid = drm_get_edid(connector, &aux_ep->aux->ddc);
-	num = drm_add_edid_modes(connector, p->edid);
+	if (!p->drm_edid)
+		p->drm_edid = drm_edid_read_ddc(connector, &aux_ep->aux->ddc);
+
+	drm_edid_connector_update(connector, p->drm_edid);
+
+	num = drm_edid_connector_add_modes(connector);
 
 	pm_runtime_mark_last_busy(panel->dev);
 	pm_runtime_put_autosuspend(panel->dev);
@@ -351,7 +354,7 @@ static void atana33xc20_remove(struct dp_aux_ep_device *aux_ep)
 	drm_panel_disable(&panel->base);
 	drm_panel_unprepare(&panel->base);
 
-	kfree(panel->edid);
+	drm_edid_free(panel->drm_edid);
 }
 
 static void atana33xc20_shutdown(struct dp_aux_ep_device *aux_ep)
-- 
2.39.2

