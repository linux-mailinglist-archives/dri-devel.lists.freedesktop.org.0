Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5885A311F
	for <lists+dri-devel@lfdr.de>; Fri, 26 Aug 2022 23:36:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70C8110E721;
	Fri, 26 Aug 2022 21:35:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B75010E721;
 Fri, 26 Aug 2022 21:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661549736; x=1693085736;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DB5pZschjig9iQHOe43WS8LbqM/GAk+L6tjbnGUnMyE=;
 b=UbFJM2cZehPFaWOnVB8F5kG2gQRpnHIaHty15jnZf7tEnRYC79htodAY
 g6rI5Mxp88F0+rmLKCRTg3uPSlxMC0M9F4m97y7U3aufeKptGMD778unA
 jIPaq2o7m874XoKzXMi61Jtgz0v2c232i+JbgbGMwxrKo2XJ9XbtLaZfQ
 NrjbUQd6MJg0OIyLCHYEFndeqAL03G79/3ZhEjy36uYYl6Viot9LqtUEA
 s3ZYO12FWgGTw4PCMoGK36Tvv75b8I1wlGPwFT5VS04MyU/VwHEDsV2lP
 llZZcQzxD3FPLUvUz0fGrUesi0BInaa84bkaje8xLfvrQ2j3sD5k5ooQD g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10451"; a="275002386"
X-IronPort-AV: E=Sophos;i="5.93,266,1654585200"; d="scan'208";a="275002386"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2022 14:35:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,266,1654585200"; d="scan'208";a="610696225"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by orsmga002.jf.intel.com with SMTP; 26 Aug 2022 14:35:33 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Sat, 27 Aug 2022 00:35:32 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 09/11] drm/edid: Unconfuse preferred timing stuff a bit
Date: Sat, 27 Aug 2022 00:34:59 +0300
Message-Id: <20220826213501.31490-10-ville.syrjala@linux.intel.com>
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
Cc: intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

For EDID 1.4 the first detailed timing is always preferred,
for older EDIDs there was a feature flag to indicate the same.
While correct, the code setting that up is rather confusing.
Restate it in a slightly more straightforward manner.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_edid.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index c1c85b9e1208..0fe06e5fd6e0 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -3952,13 +3952,14 @@ static int add_detailed_modes(struct drm_connector *connector,
 	struct detailed_mode_closure closure = {
 		.connector = connector,
 		.drm_edid = drm_edid,
-		.preferred = true,
 		.quirks = quirks,
 	};
 
-	if (closure.preferred && !version_greater(drm_edid, 1, 3))
+	if (version_greater(drm_edid, 1, 3))
+		closure.preferred = true; /* first detailed timing is always preferred */
+	else
 		closure.preferred =
-		    (drm_edid->edid->features & DRM_EDID_FEATURE_PREFERRED_TIMING);
+			drm_edid->edid->features & DRM_EDID_FEATURE_PREFERRED_TIMING;
 
 	drm_for_each_detailed_block(drm_edid, do_detailed_mode, &closure);
 
-- 
2.35.1

