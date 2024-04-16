Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D218A6C25
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 15:23:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08784112C86;
	Tue, 16 Apr 2024 13:23:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QLp7XSBK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01843112C84
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 13:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713273802; x=1744809802;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uJKT3zSQDtsEV59tUJnmdRikdm58Nt2Nz1vDhuoO1Dc=;
 b=QLp7XSBKr33zoEE0g/MCmCrP0DqRgp58/01Gu6Nv+Z01P9hFowecthnW
 DssoxRev/ilzGGV6ZRvOQTHJvRqFkYvYFSxuQQXh9vhtahPA1BZ3tPoAW
 ufU1LfH1jov0QLcZPetpTTDRj5GwaxfC3Co+TdZTUylvqxII5ProVsXxp
 bcwE6/0Sv3aBeoDs7+OIc9B4JDJjTZBZ3HscvjSLI9EGTTPr2DEEcCReL
 1wQDnlAD7dRM4XZN4vvQyDcZos32MIJ8VzSc1GjVec/x1MKSG6KdRik5L
 1HSDxL4HjIAHweR2fMzAb+NBg3u1N7lil1QlUETZ3vAXrVpj5EcoM0/Bi A==;
X-CSE-ConnectionGUID: jrGnWWe5Ra6cNPkWnew94A==
X-CSE-MsgGUID: lee2PwJ3Riu0iDc/iZPmww==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="26169424"
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; d="scan'208";a="26169424"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 06:23:22 -0700
X-CSE-ConnectionGUID: oQcA1rY6S1m6jaKEnTNzkw==
X-CSE-MsgGUID: dFfSigjKTMSmfEfzEX1gKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; d="scan'208";a="26929275"
Received: from martakit-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.44.100])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 06:23:21 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: [PATCH 09/15] drm/gud: switch to struct drm_edid
Date: Tue, 16 Apr 2024 16:22:23 +0300
Message-Id: <c519a9b9d3c3c9a413de33b99b97a1120f774f2d.1713273659.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1713273659.git.jani.nikula@intel.com>
References: <cover.1713273659.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Cc: "Noralf Trønnes" <noralf@tronnes.org>
---
 drivers/gpu/drm/gud/gud_connector.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/gud/gud_connector.c b/drivers/gpu/drm/gud/gud_connector.c
index 034e78360d4f..0f07d77c5d52 100644
--- a/drivers/gpu/drm/gud/gud_connector.c
+++ b/drivers/gpu/drm/gud/gud_connector.c
@@ -221,7 +221,7 @@ static int gud_connector_get_modes(struct drm_connector *connector)
 	struct gud_display_mode_req *reqmodes = NULL;
 	struct gud_connector_get_edid_ctx edid_ctx;
 	unsigned int i, num_modes = 0;
-	struct edid *edid = NULL;
+	const struct drm_edid *drm_edid = NULL;
 	int idx, ret;
 
 	if (!drm_dev_enter(connector->dev, &idx))
@@ -238,13 +238,13 @@ static int gud_connector_get_modes(struct drm_connector *connector)
 		gud_conn_err(connector, "Invalid EDID size", ret);
 	} else if (ret > 0) {
 		edid_ctx.len = ret;
-		edid = drm_do_get_edid(connector, gud_connector_get_edid_block, &edid_ctx);
+		drm_edid = drm_edid_read_custom(connector, gud_connector_get_edid_block, &edid_ctx);
 	}
 
 	kfree(edid_ctx.buf);
-	drm_connector_update_edid_property(connector, edid);
+	drm_edid_connector_update(connector, drm_edid);
 
-	if (edid && edid_ctx.edid_override)
+	if (drm_edid && edid_ctx.edid_override)
 		goto out;
 
 	reqmodes = kmalloc_array(GUD_CONNECTOR_MAX_NUM_MODES, sizeof(*reqmodes), GFP_KERNEL);
@@ -276,10 +276,10 @@ static int gud_connector_get_modes(struct drm_connector *connector)
 	}
 out:
 	if (!num_modes)
-		num_modes = drm_add_edid_modes(connector, edid);
+		num_modes = drm_edid_connector_add_modes(connector);
 
 	kfree(reqmodes);
-	kfree(edid);
+	drm_edid_free(drm_edid);
 	drm_dev_exit(idx);
 
 	return num_modes;
-- 
2.39.2

