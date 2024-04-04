Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 126F8898F9F
	for <lists+dri-devel@lfdr.de>; Thu,  4 Apr 2024 22:33:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 907591134E6;
	Thu,  4 Apr 2024 20:33:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BnpHJp95";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B11C1134DE;
 Thu,  4 Apr 2024 20:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712262829; x=1743798829;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hUIkdF/D4sPjlMnpQtKFBjuuJZDXWBMNCAqHBzmhBGM=;
 b=BnpHJp95J7OYIyCAp/jiqKZ1KpWqIk43VQmuYf6X7Lk+LYg5xetkGVx4
 NEPwtr/KXeNWJF4TItx0cnyvGoO66LyLHCMOAXXyqCh+SGKjBWAOxm8Un
 P9ao5Ka9PJ5yfEin6XHQPdG5mh57go09QGwjRxWaLGE3uDRUEyaKUJGoM
 3spllKUuQt6pHO0jeAzzdRWVCXY4dOqs0TOJa8NwKtFSDVRF9wL9Yp2Hj
 1ry2qXBbmAMstQfVGnxoL8ygmUbQHym9x+ge3N/KDD1askb+r8IdCqRG+
 Cg3TSatUEvetvPmu4WNaCN7Rd2c6h9IfQnV0OI2H9Ls8PZdoV4GiJdgPH w==;
X-CSE-ConnectionGUID: TbhgILQESCSyiGW678Ey4A==
X-CSE-MsgGUID: Ecngad9fRa2xc0miMLoUWw==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="25019731"
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; d="scan'208";a="25019731"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 13:33:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="827790580"
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; d="scan'208";a="827790580"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 04 Apr 2024 13:33:46 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 04 Apr 2024 23:33:46 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
Subject: [PATCH 03/12] drm/client: Use drm_mode_destroy()
Date: Thu,  4 Apr 2024 23:33:27 +0300
Message-ID: <20240404203336.10454-4-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240404203336.10454-1-ville.syrjala@linux.intel.com>
References: <20240404203336.10454-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Prefer drm_mode_destroy() over bare kfree(), for consistency
and setting a good example.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_client_modeset.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
index 1c3aeb2dfa57..2b7d0be04911 100644
--- a/drivers/gpu/drm/drm_client_modeset.c
+++ b/drivers/gpu/drm/drm_client_modeset.c
@@ -329,7 +329,7 @@ static bool drm_client_target_cloned(struct drm_device *dev,
 		if (!modes[i])
 			can_clone = false;
 	}
-	kfree(dmt_mode);
+	drm_mode_destroy(dev, dmt_mode);
 
 	if (can_clone) {
 		DRM_DEBUG_KMS("can clone using 1024x768\n");
@@ -867,7 +867,7 @@ int drm_client_modeset_probe(struct drm_client_dev *client, unsigned int width,
 				break;
 			}
 
-			kfree(modeset->mode);
+			drm_mode_destroy(dev, modeset->mode);
 			modeset->mode = drm_mode_duplicate(dev, mode);
 			drm_connector_get(connector);
 			modeset->connectors[modeset->num_connectors++] = connector;
-- 
2.43.2

