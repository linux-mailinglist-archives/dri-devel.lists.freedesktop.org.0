Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28131822AF4
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jan 2024 11:09:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61ED810E284;
	Wed,  3 Jan 2024 10:09:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5534010E284
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jan 2024 10:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704276596; x=1735812596;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HosFtGYNJ85el/dWBGAP1jZCfXJ7+kLMbfpkqkJc0Hk=;
 b=Wbu03NSV0XE1DmEkql7TlvGSqxONao+SScwB9WsozJb3M4AVxJrRvXSc
 HatsfAZodK7GVW6VtD61IYKwucUNVSPB3sk7EXrnGwzy0Nf86OTluuiXp
 HCtm3FB47TI15C9NO8NaW6xt3o4hOTKakSd2IUP6kNkHoQAs0TEllYOve
 LWxdA6m00z8miifHWfC8eqPx0PDIU7vXQ/CsLnTvykB8jX0zkcHCQCbTR
 qqA1Mj5WktYTR/fENru9wRjDaH1D3f6DX3GpUgTeOwf20YUU8sd59p/m8
 WV9L372D0jt0yF92SKstdp7KbSynJSE3xzI3UA+1jFhe78RAGVINrqNMx Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="4341653"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; 
   d="scan'208";a="4341653"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2024 02:09:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="953184868"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; d="scan'208";a="953184868"
Received: from lwenners-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.35.39])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2024 02:09:51 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 07/39] drm/bridge: lt9611uxc: use drm_bridge_read_edid()
Date: Wed,  3 Jan 2024 12:08:21 +0200
Message-Id: <f2a487fdd24405b27a51be90f680fd6bd4c397ce.1704276309.git.jani.nikula@intel.com>
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

Prefer using the struct drm_edid based functions.

Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
index e971b75e90ad..3d916306a47d 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
@@ -294,12 +294,12 @@ static int lt9611uxc_connector_get_modes(struct drm_connector *connector)
 {
 	struct lt9611uxc *lt9611uxc = connector_to_lt9611uxc(connector);
 	unsigned int count;
-	struct edid *edid;
+	const struct drm_edid *drm_edid;
 
-	edid = drm_bridge_get_edid(&lt9611uxc->bridge, connector);
-	drm_connector_update_edid_property(connector, edid);
-	count = drm_add_edid_modes(connector, edid);
-	kfree(edid);
+	drm_edid = drm_bridge_edid_read(&lt9611uxc->bridge, connector);
+	drm_edid_connector_update(connector, drm_edid);
+	count = drm_edid_connector_add_modes(connector);
+	drm_edid_free(drm_edid);
 
 	return count;
 }
-- 
2.39.2

