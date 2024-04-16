Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D67E8A6C18
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 15:22:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99BAF10ECA7;
	Tue, 16 Apr 2024 13:22:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BL4r5u5X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9027610EE1C
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 13:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713273774; x=1744809774;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Hdf4TmrP+rG03H4ip70dzKETlhcfqKQ2I23YWogVfhI=;
 b=BL4r5u5X1f0N+PZIrqA/IOF5fJl7mm+syAWGxfS2NJdHWBNl8Pmh235x
 fVJ4O7m0TIvSuMFLTC3XIWaQopwSA0iTgWX6levuF7ZdV5Cw3UTeuFuqd
 XwynX1o2T6y6n8mxdhOm1i+tCFSUwyb+AngpWh4IFlYDxJahmoYlizIh5
 7X8E89NilDZVogjVOPyKZwyfiRvxi4Ug1WEOc+W7y22Fm38eWqPk/htSB
 eMXgttFRXq1qAZR9ySE1w+VGEwsHKg6aWtoPkmyo0p9m8iKpMK9q48tFi
 auaM4E8z34zsdjzvZj0Z7zX2ZvBbKvFOxh1MO+UCvQsCKUYyq4VQ1MChV w==;
X-CSE-ConnectionGUID: z08bELJyTUK2zBStosRrVA==
X-CSE-MsgGUID: PJ0xtjZcTiGNnogqo9NEpA==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="8571674"
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="8571674"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 06:22:42 -0700
X-CSE-ConnectionGUID: 2k+NnVCbT1qlRRPx/CDCTQ==
X-CSE-MsgGUID: Vpg35AIhStyxzcMvYHo3bA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; d="scan'208";a="53438568"
Received: from martakit-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.44.100])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 06:22:38 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 01/15] drm/panel: simple: switch to struct drm_edid
Date: Tue, 16 Apr 2024 16:22:15 +0300
Message-Id: <869e91527e8f9da054d776ed6109c7a6bc6151cb.1713273659.git.jani.nikula@intel.com>
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
 drivers/gpu/drm/panel/panel-simple.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 7215cf767898..d3264fa2f3ff 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -151,7 +151,7 @@ struct panel_simple {
 
 	struct gpio_desc *enable_gpio;
 
-	struct edid *edid;
+	const struct drm_edid *drm_edid;
 
 	struct drm_display_mode override_mode;
 
@@ -309,8 +309,8 @@ static int panel_simple_suspend(struct device *dev)
 	regulator_disable(p->supply);
 	p->unprepared_time = ktime_get_boottime();
 
-	kfree(p->edid);
-	p->edid = NULL;
+	drm_edid_free(p->drm_edid);
+	p->drm_edid = NULL;
 
 	return 0;
 }
@@ -399,11 +399,12 @@ static int panel_simple_get_modes(struct drm_panel *panel,
 	if (p->ddc) {
 		pm_runtime_get_sync(panel->dev);
 
-		if (!p->edid)
-			p->edid = drm_get_edid(connector, p->ddc);
+		if (!p->drm_edid)
+			p->drm_edid = drm_edid_read_ddc(connector, p->ddc);
 
-		if (p->edid)
-			num += drm_add_edid_modes(connector, p->edid);
+		drm_edid_connector_update(connector, p->drm_edid);
+
+		num += drm_edid_connector_add_modes(connector);
 
 		pm_runtime_mark_last_busy(panel->dev);
 		pm_runtime_put_autosuspend(panel->dev);
-- 
2.39.2

