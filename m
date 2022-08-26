Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8585A311A
	for <lists+dri-devel@lfdr.de>; Fri, 26 Aug 2022 23:36:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E859510E6FB;
	Fri, 26 Aug 2022 21:35:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D65810E6D7;
 Fri, 26 Aug 2022 21:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661549724; x=1693085724;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Z1pbq0Unb+uKrKT2+NJlh/dxpG6pjO0aRXlnYSq7W5M=;
 b=cFmGnL0ifAMGAlhDzDqWju+HCsOPLg7aLHZYSnasvlXChOyOW703+8/5
 wrlUgxFiwsPENa/MioFSFQpXnt4HGdijBaQGiOJU1cPqYQdK2sXE4RR9J
 tjQdVnEFv3FMW3IFfmTZhBxGv9AEwAmNU8Eept6ZSFmuHdwYox55/gWXE
 X2MLR7SuWFHb71+jfMvx9tispPEYQiIaH1LN8D7NEbsDU5tZkRjdu1elA
 pQM9zUgMobxx7BG4RFF9wDn3roIL69bdbmPBEYsTsGQdJOF2D84hu9ddT
 yHVa7V42ep4ZBBhVWwmTnxSTTVBdSL2hxDSD7soXj/fxfZvY33iZkOABl g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10451"; a="356315592"
X-IronPort-AV: E=Sophos;i="5.93,266,1654585200"; d="scan'208";a="356315592"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2022 14:35:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,266,1654585200"; d="scan'208";a="587444582"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by orsmga006.jf.intel.com with SMTP; 26 Aug 2022 14:35:20 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Sat, 27 Aug 2022 00:35:19 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 05/11] drm/edid: Only parse VRR range for continuous frequency
 displays
Date: Sat, 27 Aug 2022 00:34:55 +0300
Message-Id: <20220826213501.31490-6-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220826213501.31490-1-ville.syrjala@linux.intel.com>
References: <20220826213501.31490-1-ville.syrjala@linux.intel.com>
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
Cc: Leo Li <sunpeng.li@amd.com>, intel-gfx@lists.freedesktop.org,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, amd-gfx@lists.freedesktop.org,
 Manasi Navare <manasi.d.navare@intel.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Since we only use the parsed vrefresh range to determine
if VRR should be supported we should only accept continuous
frequency displays here.

Cc: Manasi Navare <manasi.d.navare@intel.com>
Cc: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc: amd-gfx@lists.freedesktop.org
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_edid.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 856d304a1354..b459fdf12b58 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -6064,7 +6064,10 @@ static void drm_get_vrr_range(struct drm_connector *connector,
 		.drm_edid = drm_edid,
 	};
 
-	if (!version_greater(drm_edid, 1, 1))
+	if (!version_greater(drm_edid, 1, 3))
+		return;
+
+	if (!(drm_edid->edid->features & DRM_EDID_FEATURE_CONTINUOUS_FREQ))
 		return;
 
 	drm_for_each_detailed_block(drm_edid, get_vrr_range, &closure);
-- 
2.35.1

