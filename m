Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A468399C3
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 20:41:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CF8510E8A7;
	Tue, 23 Jan 2024 19:41:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7297C10E8A7
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 19:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706038868; x=1737574868;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=z9KAu5XpuQmkb6FICe4JPb43WPifpjg1Bghh6UEt5Xo=;
 b=YTQIH/5WEFqAoBTCrlTSBv5Ntu61f0XVWbkb65HX/NMD0taaWLI1hdbt
 9Gf+kuqviU9chTJWrpy+MJ+1msGkK0WOxN+KD8blyjlUdCwy6ReV8MrVL
 yAhnoTqXBviU4neI9ZXfgEaAAQuk0xFG0DHbFp5Uzi/Zs1xiEo5lMZkmw
 3QxS5aQS2bdYSieBHWZC82j0ajzZbXR1Ps1ELVdrP/JkJWeqjMZThsTlU
 TlUEEZNxEPmoQ9RM1ewEUyYS2IUudRLFoge1XTJnGq+V5uT3kAcVOiTLv
 bk5dIvgtDI9NRb4Dt/UGoLNbEy6i8gK1RGEiz8hVqRsG5tTQ/RU3wJRyT A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="9022506"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; 
   d="scan'208";a="9022506"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 11:41:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="929435861"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; d="scan'208";a="929435861"
Received: from pzsolt-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.40.183])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 11:41:04 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v3 32/39] drm: xlnx: zynqmp_dpsub: switch to ->edid_read
 callback
Date: Tue, 23 Jan 2024 21:37:38 +0200
Message-Id: <549694273b57e7275de01daf8ce60579121998d4.1706038510.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1706038510.git.jani.nikula@intel.com>
References: <cover.1706038510.git.jani.nikula@intel.com>
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
Cc: Jani Nikula <jani.nikula@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Prefer using the struct drm_edid based callback and functions.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xlnx/zynqmp_dp.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
index a0606fab0e22..24213eaa38d0 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
@@ -1560,12 +1560,12 @@ static enum drm_connector_status zynqmp_dp_bridge_detect(struct drm_bridge *brid
 	return connector_status_disconnected;
 }
 
-static struct edid *zynqmp_dp_bridge_get_edid(struct drm_bridge *bridge,
-					      struct drm_connector *connector)
+static const struct drm_edid *zynqmp_dp_bridge_edid_read(struct drm_bridge *bridge,
+							 struct drm_connector *connector)
 {
 	struct zynqmp_dp *dp = bridge_to_dp(bridge);
 
-	return drm_get_edid(connector, &dp->aux.ddc);
+	return drm_edid_read_ddc(connector, &dp->aux.ddc);
 }
 
 static const struct drm_bridge_funcs zynqmp_dp_bridge_funcs = {
@@ -1579,7 +1579,7 @@ static const struct drm_bridge_funcs zynqmp_dp_bridge_funcs = {
 	.atomic_reset = drm_atomic_helper_bridge_reset,
 	.atomic_check = zynqmp_dp_bridge_atomic_check,
 	.detect = zynqmp_dp_bridge_detect,
-	.get_edid = zynqmp_dp_bridge_get_edid,
+	.edid_read = zynqmp_dp_bridge_edid_read,
 };
 
 /* -----------------------------------------------------------------------------
-- 
2.39.2

