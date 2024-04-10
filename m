Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A0B89FF58
	for <lists+dri-devel@lfdr.de>; Wed, 10 Apr 2024 20:01:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2893B10FF80;
	Wed, 10 Apr 2024 18:01:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FlIMexGc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2985A10ED70;
 Wed, 10 Apr 2024 18:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712772103; x=1744308103;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=N6XrkYYKC8gGwO6vqU7Ke1ZPsiEC1yKtEbvoXwmk2Ak=;
 b=FlIMexGciJqq6GgOGmc6N+Nzu05jBda7aRhS6JVSgTFJeYeotruPJVT6
 dEDeaKwniDV9WXYKjUf66kAYgIlF1lAtdTTi2ACFkRiT8rJvDW4X1/XfR
 MC22Po44ikJnS4EVKohAP2VA9ZlfpZPtnoTlxISSA85v7ieaF3XQChBXx
 g1VQxZOyN8yJYcukA/A9s3JX4OcdwII/voNQOU5B3TiYhPUgOG4OzS0Hz
 ocGTLtkX586d687xr3NxziajHFnHj9hjz05/tSKNIry4WXEhnZf5JcZWv
 0Adcpzhi56UWEW1EIS47+xxoit2FrvoJ4HBGc43SWMFd9aONGmYt/OXAx g==;
X-CSE-ConnectionGUID: YxaMQOjHQoOsPGFMjKgx+g==
X-CSE-MsgGUID: 3tqFGVS1QICOQ+88o+/nBA==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="8067416"
X-IronPort-AV: E=Sophos;i="6.07,191,1708416000"; 
   d="scan'208";a="8067416"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 11:01:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="827793216"
X-IronPort-AV: E=Sophos;i="6.07,191,1708416000"; d="scan'208";a="827793216"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 10 Apr 2024 11:01:39 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 10 Apr 2024 21:01:39 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, Jani Nikula <jani.nikula@intel.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: [PATCH] drm/edid: Parse topology block for all DispID structure v1.x
Date: Wed, 10 Apr 2024 21:01:39 +0300
Message-ID: <20240410180139.21352-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.43.2
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

DisplayID spec v1.3 revision history notes do claim that
the toplogy block was added in v1.3 so requiring structure
v1.2 would seem correct, but there is at least one EDID in
edid.tv with a topology block and structure v1.0. And
there are also EDIDs with DisplayID structure v1.3 which
seems to be totally incorrect as DisplayID spec v1.3 lists
structure v1.2 as the only legal value.

Unfortunately I couldn't find copies of DisplayID spec
v1.0-v1.2 anywhere (even on vesa.org), so I'll have to
go on empirical evidence alone.

We used to parse the topology block on all v1.x
structures until the check for structure v2.0 was added.
Let's go back to doing that as the evidence does suggest
that there are DisplayIDs in the wild that would miss
out on the topology stuff otherwise.

Also toss out DISPLAY_ID_STRUCTURE_VER_12 entirely as
it doesn't appear we can really use it for anything.

I *think* we could technically skip all the structure
version checks as the block tags shouldn't conflict
between v2.0 and v1.x. But no harm in having a bit of
extra sanity checks I guess.

So far I'm not aware of any user reported regressions
from overly strict check, but I do know that it broke
igt/kms_tiled_display's fake DisplayID as that one
gets generated with structure v1.0.

Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Fixes: c5a486af9df7 ("drm/edid: parse Tiled Display Topology Data Block for DisplayID 2.0")
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_edid.c  | 2 +-
 include/drm/drm_displayid.h | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index ea77577a3786..f0948ab214b3 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -7405,7 +7405,7 @@ static void drm_parse_tiled_block(struct drm_connector *connector,
 static bool displayid_is_tiled_block(const struct displayid_iter *iter,
 				     const struct displayid_block *block)
 {
-	return (displayid_version(iter) == DISPLAY_ID_STRUCTURE_VER_12 &&
+	return (displayid_version(iter) < DISPLAY_ID_STRUCTURE_VER_20 &&
 		block->tag == DATA_BLOCK_TILED_DISPLAY) ||
 		(displayid_version(iter) == DISPLAY_ID_STRUCTURE_VER_20 &&
 		 block->tag == DATA_BLOCK_2_TILED_DISPLAY_TOPOLOGY);
diff --git a/include/drm/drm_displayid.h b/include/drm/drm_displayid.h
index 566497eeb3b8..bc1f6b378195 100644
--- a/include/drm/drm_displayid.h
+++ b/include/drm/drm_displayid.h
@@ -30,7 +30,6 @@ struct drm_edid;
 #define VESA_IEEE_OUI				0x3a0292
 
 /* DisplayID Structure versions */
-#define DISPLAY_ID_STRUCTURE_VER_12		0x12
 #define DISPLAY_ID_STRUCTURE_VER_20		0x20
 
 /* DisplayID Structure v1r2 Data Blocks */
-- 
2.43.2

