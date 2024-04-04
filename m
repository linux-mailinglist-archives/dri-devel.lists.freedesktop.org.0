Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5766898F9C
	for <lists+dri-devel@lfdr.de>; Thu,  4 Apr 2024 22:33:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 458441134E3;
	Thu,  4 Apr 2024 20:33:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XH1dVEZ+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21B6311325E;
 Thu,  4 Apr 2024 20:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712262823; x=1743798823;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zilOGH9d9aSJ4609zaqdQzRgfqugSYDSLLlLCXBZbuM=;
 b=XH1dVEZ+Zb+yq8W4qnaImTg0+yFX3TBCtU+D2yVyQz85saD4/+QCs4a4
 KbAR3BW5FDTHw5gw7MCkgZFTx9oOIiuFOFEi/PsT5hhYiUu6sXHCGDKOZ
 RR0GsMHF1Kw1hkZm6P1N6tJxOrGoLxqkJMcpPwoeh+YfzM1mSAoPzBNII
 PROk88RcDaDg2Lkx0bKska2yVfDJMQ8QFZ57DrRoGGym06ASFT/Iv9S8H
 uC8HMCvwNmvJcmj1aE502iUoLxjMld4Ia/yN2QJPdBu3q4+w39hkB9q3O
 05iax5GU6ioprybCeVjL0wCjeSHDWWdXqWxl5xqUitciRVvTeBnh2GC+1 A==;
X-CSE-ConnectionGUID: wZBhttGGQHqGg+vn6OumOA==
X-CSE-MsgGUID: 7n0QYWJXSY+WadUXrEiszg==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="25019718"
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; d="scan'208";a="25019718"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 13:33:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="827790578"
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; d="scan'208";a="827790578"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 04 Apr 2024 13:33:40 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 04 Apr 2024 23:33:39 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org,
	stable@vger.kernel.org
Subject: [PATCH 01/12] drm/client: Fully protect modes[] with
 dev->mode_config.mutex
Date: Thu,  4 Apr 2024 23:33:25 +0300
Message-ID: <20240404203336.10454-2-ville.syrjala@linux.intel.com>
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

The modes[] array contains pointers to modes on the connectors'
mode lists, which are protected by dev->mode_config.mutex.
Thus we need to extend modes[] the same protection or by the
time we use it the elements may already be pointing to
freed/reused memory.

Cc: stable@vger.kernel.org
Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/10583
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_client_modeset.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
index 871e4e2129d6..0683a129b362 100644
--- a/drivers/gpu/drm/drm_client_modeset.c
+++ b/drivers/gpu/drm/drm_client_modeset.c
@@ -777,6 +777,7 @@ int drm_client_modeset_probe(struct drm_client_dev *client, unsigned int width,
 	unsigned int total_modes_count = 0;
 	struct drm_client_offset *offsets;
 	unsigned int connector_count = 0;
+	/* points to modes protected by mode_config.mutex */
 	struct drm_display_mode **modes;
 	struct drm_crtc **crtcs;
 	int i, ret = 0;
@@ -845,7 +846,6 @@ int drm_client_modeset_probe(struct drm_client_dev *client, unsigned int width,
 		drm_client_pick_crtcs(client, connectors, connector_count,
 				      crtcs, modes, 0, width, height);
 	}
-	mutex_unlock(&dev->mode_config.mutex);
 
 	drm_client_modeset_release(client);
 
@@ -875,6 +875,7 @@ int drm_client_modeset_probe(struct drm_client_dev *client, unsigned int width,
 			modeset->y = offset->y;
 		}
 	}
+	mutex_unlock(&dev->mode_config.mutex);
 
 	mutex_unlock(&client->modeset_mutex);
 out:
-- 
2.43.2

