Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C4B4EB38F
	for <lists+dri-devel@lfdr.de>; Tue, 29 Mar 2022 20:43:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04D8E10EE3E;
	Tue, 29 Mar 2022 18:43:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3709210E8A6;
 Tue, 29 Mar 2022 18:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648579388; x=1680115388;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eXgz2+gEsm3mvGtsWikpA1BanAbpn7y+ylqYifprRnU=;
 b=cIorL3HyrW1ShTiUzLaFN4NtN5b156y/9dCyaFFHppxHlTXu9iakfWrr
 valqTGR8/vftKkDOODXXNfnYJKy2ydwihM/X8P1manayBqfprm86WdhfV
 hcHUeULBpQRNirCR1qtCpmXMkq5kuIkx3Vzpu65yGwASON8RHHn7lSngX
 Q7Kdq5KHni+R71rrGYZtM/FAwrSxzHBVk+4ZceRgColpYL/4OfQaCK7p4
 wtqC5Ky2CjtKFis/Fc8sNW6UI6H2W9c/9bxMKHcmfag2Snv/7S+dZmZHy
 cBAXaJHRxzgR0wONjN42fJkZfxOCreu2DpqTyvAmVdJmF2fxVRZkWFgfZ Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10301"; a="256912743"
X-IronPort-AV: E=Sophos;i="5.90,220,1643702400"; d="scan'208";a="256912743"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2022 11:43:07 -0700
X-IronPort-AV: E=Sophos;i="5.90,220,1643702400"; d="scan'208";a="521558061"
Received: from dmendyk-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.63.121])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2022 11:43:05 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 09/12] drm/edid: simplify block check when filtering invalid
 blocks
Date: Tue, 29 Mar 2022 21:42:16 +0300
Message-Id: <40bbdfa892243e6602a8ba79418713c6c8d6fd07.1648578814.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1648578814.git.jani.nikula@intel.com>
References: <cover.1648578814.git.jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There's no need to handle complicated scenarios or debug log when
filtering blocks that have already been identified as invalid. Simplify
by adding an edid_block_valid() helper that operates on const data and
prints nothing.

(Finally, here's the justification for the previously added separate
edid_block_status_valid() function!)

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 235d3cde2e97..a1be5c3a80e5 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -1713,6 +1713,12 @@ static bool edid_block_status_valid(enum edid_block_status status, int tag)
 		(status == EDID_BLOCK_CHECKSUM && tag == CEA_EXT);
 }
 
+static bool edid_block_valid(const void *block, bool base)
+{
+	return edid_block_status_valid(edid_block_check(block, base),
+				       edid_block_tag(block));
+}
+
 /**
  * drm_edid_block_valid - Sanity check the EDID block (base or extension)
  * @raw_edid: pointer to raw EDID block
@@ -2081,7 +2087,7 @@ struct edid *drm_do_get_edid(struct drm_connector *connector,
 		for (i = 0; i <= edid->extensions; i++) {
 			void *block = edid + i;
 
-			if (!drm_edid_block_valid(block, i, false, NULL))
+			if (!edid_block_valid(block, i == 0))
 				continue;
 
 			memcpy(base, block, EDID_LENGTH);
-- 
2.30.2

