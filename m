Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A52E8876801
	for <lists+dri-devel@lfdr.de>; Fri,  8 Mar 2024 17:04:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F1CF1131C5;
	Fri,  8 Mar 2024 16:04:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mu7zYtZ+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78AA91138D5;
 Fri,  8 Mar 2024 16:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709913873; x=1741449873;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IgX/5gEHUBW0EE0D1xlfyPQ+mLA7q4NeUJYJiWpsMY8=;
 b=Mu7zYtZ+Kd8KrZ2CvbPtuNvSSSVtZK+shFs/2JMxDYlEpqI+ZJ2vZ1W6
 q13o8WFfqt6UPeteRcr471QfDdSdv6imxlK82k1OaFfZii5oIsCzkKK4g
 uyBlsyaIbdIpdmnB8XY6JFsEDTFddmHPKWTHhfNAY7eixwMgWfYEahdQs
 cRRr01WX8CfigldPjtYCuod//bWEh+HM7g17kSTQ2dg8YC6BZO5YYZWHK
 bupBmJQfRbz3Gv0peVnCI96H3RP+kmVrtutydTSh5MUWD5NDSivus9cuH
 nq13cmD3963EllZz2kDP7u/f5IPV73HE4JZslW0tgwzggLjmbE6slQPSo w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="4564086"
X-IronPort-AV: E=Sophos;i="6.07,110,1708416000"; 
   d="scan'208";a="4564086"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 08:04:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,110,1708416000"; d="scan'208";a="10511743"
Received: from unknown (HELO localhost) ([10.252.34.187])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 08:04:31 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, jani.nikula@intel.com,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>
Subject: [PATCH 7/8] drm/bridge: lt9611uxc: use int for holding number of modes
Date: Fri,  8 Mar 2024 18:03:45 +0200
Message-Id: <ed97f4f036263cdc4f34330cef91214970f99a77.1709913674.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1709913674.git.jani.nikula@intel.com>
References: <cover.1709913674.git.jani.nikula@intel.com>
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

lt9611uxc_connector_get_modes() propagates the return value of
drm_edid_connector_add_modes() but stores the int temporarily in an
unsigned int. Use the correct type.

Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
index bcf8bccd86d6..f4f593ad8f79 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
@@ -294,8 +294,8 @@ static struct mipi_dsi_device *lt9611uxc_attach_dsi(struct lt9611uxc *lt9611uxc,
 static int lt9611uxc_connector_get_modes(struct drm_connector *connector)
 {
 	struct lt9611uxc *lt9611uxc = connector_to_lt9611uxc(connector);
-	unsigned int count;
 	const struct drm_edid *drm_edid;
+	int count;
 
 	drm_edid = drm_bridge_edid_read(&lt9611uxc->bridge, connector);
 	drm_edid_connector_update(connector, drm_edid);
-- 
2.39.2

