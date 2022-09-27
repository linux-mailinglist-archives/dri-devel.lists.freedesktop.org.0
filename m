Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC285ECA54
	for <lists+dri-devel@lfdr.de>; Tue, 27 Sep 2022 19:01:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07C5D10E13A;
	Tue, 27 Sep 2022 17:01:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1288310E0FA;
 Tue, 27 Sep 2022 17:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664298043; x=1695834043;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sSTmUKt/CaF+I5tJQCd7Qdsnjia+SAo2dGYwNbRf0fY=;
 b=CFk6tEE3W1wDmbIqBVwIJ49dkehKtV64Gz9vrkusiFuQnPbL3gS1O1hr
 Td9l/mjGemoYgM9hrp6Tg4RoKS3ajh23lBzN8XP05YoIy23yrr6pLZbZF
 N6wcuQfwz3rWz81OKFYYnS2Duje8PfHEqqCAxCAf82/MPbmZ3OWsk1Q+J
 qZ7SbcJvr9UgF2ZLuBnlKAdhaz198l1CRPyBT3thjMZ68JQ24oYQG51oT
 3W5oBjrhsb3gXdTRjyAiTnMb9F6Xhepo+wO2uD3+tHU+F4MTSXGqkIdpd
 dSIYSniWhj5HJDzzL4Q4tLq7VF1wVBpNlUYgVKDn8Iv4/4Q8pIGhyJJMN w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="365414079"
X-IronPort-AV: E=Sophos;i="5.93,349,1654585200"; d="scan'208";a="365414079"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2022 10:00:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="623821892"
X-IronPort-AV: E=Sophos;i="5.93,350,1654585200"; d="scan'208";a="623821892"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by fmsmga007.fm.intel.com with SMTP; 27 Sep 2022 10:00:18 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 27 Sep 2022 20:00:17 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 3/9] drm/edid: Only parse VRR range for continuous
 frequency displays
Date: Tue, 27 Sep 2022 20:00:00 +0300
Message-Id: <20220927170006.27855-4-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220927170006.27855-1-ville.syrjala@linux.intel.com>
References: <20220927170006.27855-1-ville.syrjala@linux.intel.com>
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
 Manasi Navare <manasi.d.navare@intel.com>, Jani Nikula <jani.nikula@intel.com>,
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
Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_edid.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 76753c56d4f7..8c89d6a90390 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -6064,7 +6064,10 @@ static void drm_get_monitor_range(struct drm_connector *connector,
 		.drm_edid = drm_edid,
 	};
 
-	if (!version_greater(drm_edid, 1, 1))
+	if (!version_greater(drm_edid, 1, 3))
+		return;
+
+	if (!(drm_edid->edid->features & DRM_EDID_FEATURE_CONTINUOUS_FREQ))
 		return;
 
 	drm_for_each_detailed_block(drm_edid, get_monitor_range, &closure);
-- 
2.35.1

