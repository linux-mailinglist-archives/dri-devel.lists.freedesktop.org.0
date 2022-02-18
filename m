Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE264BB63C
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 11:05:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC82F10EEDE;
	Fri, 18 Feb 2022 10:04:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 019E510EED5;
 Fri, 18 Feb 2022 10:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645178694; x=1676714694;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2M52if3Hu+xc+/wHz54aY5c2l4pLze6BBe7uKcQB3io=;
 b=gDWX2k+ifQIm5J4iCAyJ8GGdWwTxuDVFD56zUYdzlc3Bb96+LotE3pRR
 mcnyL4nX0kqCf/98qx7yGzCdWlJdz7xXXIP5Lhc/T/KmjBPXiMJWeYl8u
 6S9aEswf+gZ0CeZ99umtcQpYrpaIkq2flVBfBy9s01S6qj7qn4q7sLIL3
 RzpT4tA7Vzvw6DyQ4czcLhXTlCIko1AGvlvOJmaU+fM3UmhA1Vq+H4olk
 18oNU+xi4q5MZ7/L8UUu8YPBeSEYXx0OTJz1Qba8QgN9YMEfht+fM2DA/
 XkLt2dzLM5td/xVsbnw5ONy991J2QseiGA9dLf1QPF8QM932A4YOtkqDa w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10261"; a="248693051"
X-IronPort-AV: E=Sophos;i="5.88,378,1635231600"; d="scan'208";a="248693051"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2022 02:04:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,378,1635231600"; d="scan'208";a="682442492"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.151])
 by fmsmga001.fm.intel.com with SMTP; 18 Feb 2022 02:04:50 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 18 Feb 2022 12:04:49 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 10/22] drm/msm: Nuke weird on stack mode copy
Date: Fri, 18 Feb 2022 12:03:51 +0200
Message-Id: <20220218100403.7028-11-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220218100403.7028-1-ville.syrjala@linux.intel.com>
References: <20220218100403.7028-1-ville.syrjala@linux.intel.com>
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
Cc: Sean Paul <sean@poorly.run>, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

This on stack middle man mode looks entirely pointless.
Just duplicate the original mode directly.

Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/msm/dp/dp_drm.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index d4d360d19eba..09188d02aa1e 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -56,7 +56,7 @@ static int dp_connector_get_modes(struct drm_connector *connector)
 	int rc = 0;
 	struct msm_dp *dp;
 	struct dp_display_mode *dp_mode = NULL;
-	struct drm_display_mode *m, drm_mode;
+	struct drm_display_mode *m;
 
 	if (!connector)
 		return 0;
@@ -82,13 +82,11 @@ static int dp_connector_get_modes(struct drm_connector *connector)
 			return rc;
 		}
 		if (dp_mode->drm_mode.clock) { /* valid DP mode */
-			memset(&drm_mode, 0x0, sizeof(drm_mode));
-			drm_mode_copy(&drm_mode, &dp_mode->drm_mode);
-			m = drm_mode_duplicate(connector->dev, &drm_mode);
+			m = drm_mode_duplicate(connector->dev, &dp_mode->drm_mode);
 			if (!m) {
 				DRM_ERROR("failed to add mode %ux%u\n",
-				       drm_mode.hdisplay,
-				       drm_mode.vdisplay);
+					  dp_mode->drm_mode.hdisplay,
+					  dp_mode->drm_mode.vdisplay);
 				kfree(dp_mode);
 				return 0;
 			}
-- 
2.34.1

