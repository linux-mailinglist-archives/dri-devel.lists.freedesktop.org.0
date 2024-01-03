Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 119FD822AF8
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jan 2024 11:10:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AC1610E2AB;
	Wed,  3 Jan 2024 10:10:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D3A410E2A0
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jan 2024 10:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704276619; x=1735812619;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=71c7AnwoSXidCTgx5jsGSoSJfqz2yMNzVqFVuPV4ICA=;
 b=HrGQotqaw/cwXWQ+5ZaABM90/t+/Rq0cOnVVVa0BTaHG7A9eotPqWx9d
 URMxBU324M1z1y2Ie64SEU09tznQlg4QEEY3wkrnw5og0KeTRKFZw7/p4
 N4jOAwb/PNoBpv/Cbry0bYRbxABDbLiuuvNkPpgt8xfe4K93J1b8fX1wC
 +eKYnANBC2Mv9wwJU2psD1yaRVWSE4WY1pD9gLiuH3MZGIMxNBlajPshj
 VJksg1Bg6h0MGjEnd/mUSWHZMtCWQxtZfeFECW8/ELjRR7vlagyBep4ZP
 m3yPmRiB9ufhUH+q/h50RSTphRb/wh6B/SDxWQE0ZExhgcrDLfsnUm4nr Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="4341702"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; 
   d="scan'208";a="4341702"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2024 02:10:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="953184901"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; d="scan'208";a="953184901"
Received: from lwenners-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.35.39])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2024 02:10:15 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 11/39] drm/bridge: tfp410: clear the EDID property on
 failures
Date: Wed,  3 Jan 2024 12:08:25 +0200
Message-Id: <6ee8cc7f5344075aa9a25758d71e11eb8a26d1ec.1704276309.git.jani.nikula@intel.com>
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
 drivers/gpu/drm/bridge/ti-tfp410.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-tfp410.c b/drivers/gpu/drm/bridge/ti-tfp410.c
index dd14731eb03e..c7bef5c23927 100644
--- a/drivers/gpu/drm/bridge/ti-tfp410.c
+++ b/drivers/gpu/drm/bridge/ti-tfp410.c
@@ -61,6 +61,8 @@ static int tfp410_get_modes(struct drm_connector *connector)
 		drm_edid = NULL;
 	}
 
+	drm_edid_connector_update(connector, drm_edid);
+
 	if (!drm_edid) {
 		/*
 		 * No EDID, fallback on the XGA standard modes and prefer a mode
@@ -71,8 +73,6 @@ static int tfp410_get_modes(struct drm_connector *connector)
 		return ret;
 	}
 
-	drm_edid_connector_update(connector, drm_edid);
-
 	ret = drm_edid_connector_add_modes(connector);
 
 	drm_edid_free(drm_edid);
-- 
2.39.2

