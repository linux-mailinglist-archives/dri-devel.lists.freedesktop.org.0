Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9184C822AF6
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jan 2024 11:10:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 134F710E289;
	Wed,  3 Jan 2024 10:10:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA7F210E289
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jan 2024 10:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704276607; x=1735812607;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=v9FZKbjvBB/NxHvwiFX0Rpj1B/MRb4K1rWaQu3jkBKU=;
 b=J6Tt2PBDDrVtu4IBsTCkfqaqEf2naJocsZm/R8m11kW6T95go/0cdmQr
 qOXXixLVmTRF+N2b+7koSWqxysEDM+TFi/eG9hzNqtdpnnpN4CSiM4M6o
 Qveqs91xq+W382sEqaXptzSANFPucWZT16nUd8qc4G8LtSnpLQaC6frQc
 D4MQhbJWUHEUS0Gk+dXy4ATolzXi9pa9MDoA12oOLsX9N8IAEXQsqFth+
 M/gAWINk/1TqzR+GWg1hwgGAM178KaBbMHvs8s7gmwa0amC9ubwe2gWGM
 wUzTeMbOopsIMoYcsZ6F4S30Ll7WVFT9nDztVaoCsOYnG6w6Z2VS7+QAk g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="4341684"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; 
   d="scan'208";a="4341684"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2024 02:10:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="953184886"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; d="scan'208";a="953184886"
Received: from lwenners-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.35.39])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2024 02:10:03 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 09/39] drm: bridge: simple-bridge: clear the EDID property
 on failures
Date: Wed,  3 Jan 2024 12:08:23 +0200
Message-Id: <c351cfa3ca0316a833c19fbc2e0590937559fcec.1704276309.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1704276309.git.jani.nikula@intel.com>
References: <cover.1704276309.git.jani.nikula@intel.com>
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

If EDID read fails, clear the EDID property.

Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/bridge/simple-bridge.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/simple-bridge.c b/drivers/gpu/drm/bridge/simple-bridge.c
index e0cf7721bb8c..5813a2c4fc5e 100644
--- a/drivers/gpu/drm/bridge/simple-bridge.c
+++ b/drivers/gpu/drm/bridge/simple-bridge.c
@@ -62,6 +62,8 @@ static int simple_bridge_get_modes(struct drm_connector *connector)
 		drm_edid = NULL;
 	}
 
+	drm_edid_connector_update(connector, drm_edid);
+
 	if (!drm_edid) {
 		/*
 		 * In case we cannot retrieve the EDIDs (missing or broken DDC
@@ -73,7 +75,6 @@ static int simple_bridge_get_modes(struct drm_connector *connector)
 		return ret;
 	}
 
-	drm_edid_connector_update(connector, drm_edid);
 	ret = drm_edid_connector_add_modes(connector);
 	drm_edid_free(drm_edid);
 
-- 
2.39.2

