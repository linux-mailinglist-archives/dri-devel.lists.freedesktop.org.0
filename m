Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE0BA5ECA52
	for <lists+dri-devel@lfdr.de>; Tue, 27 Sep 2022 19:01:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 851AF10E126;
	Tue, 27 Sep 2022 17:01:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91E7E10E0C9;
 Tue, 27 Sep 2022 17:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664298043; x=1695834043;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QJwTe7jm42SPL/0A1AqCPfxgb5vgp/on4jj3KN93B8o=;
 b=naBNg7SkDi324k1ge+UNWYShkV5IxJSx6NzDJRdh+Vk9V52xhtKrW8lr
 LvycPyV3VO6F8oUQAG2RcJaD19x7DwUL35lhokPphZblsqhpg8afeArdc
 k2kpAfduU+rbtqooDuQppYAhFvWEAAMJmxNf1UIyKmsCHDx5pip+XsxsH
 P4HTHSnVDloFoRIJEws2P015vzPxzuak1wtVfGTPKpVQmjKbWeDt03qiG
 NQxdBL6ME/c5+ZJhxjRdKtu7umfh8iS55kuqyLDu3h86PCFT2tJxKo1Fa
 8Owj3rdW5KwS28eWJLRYSt/VA1PRcHB8LmdfEb4oA+vSF7HJ/oHoM01Sd A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="365414071"
X-IronPort-AV: E=Sophos;i="5.93,349,1654585200"; d="scan'208";a="365414071"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2022 10:00:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="623821904"
X-IronPort-AV: E=Sophos;i="5.93,350,1654585200"; d="scan'208";a="623821904"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by fmsmga007.fm.intel.com with SMTP; 27 Sep 2022 10:00:22 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 27 Sep 2022 20:00:21 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 4/9] drm/edid: Extract drm_gtf2_mode()
Date: Tue, 27 Sep 2022 20:00:01 +0300
Message-Id: <20220927170006.27855-5-ville.syrjala@linux.intel.com>
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
Cc: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Extract the GTF vs. GTF2 logic into a separate function.
We'll have a second user soon.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_edid.c | 47 ++++++++++++++++++++++++--------------
 1 file changed, 30 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 8c89d6a90390..c7dbd6bf7f80 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -3113,6 +3113,35 @@ static int drm_mode_hsync(const struct drm_display_mode *mode)
 	return DIV_ROUND_CLOSEST(mode->clock, mode->htotal);
 }
 
+static struct drm_display_mode *
+drm_gtf2_mode(struct drm_device *dev,
+	      const struct drm_edid *drm_edid,
+	      int hsize, int vsize, int vrefresh_rate)
+{
+	struct drm_display_mode *mode;
+
+	/*
+	 * This is potentially wrong if there's ever a monitor with
+	 * more than one ranges section, each claiming a different
+	 * secondary GTF curve.  Please don't do that.
+	 */
+	mode = drm_gtf_mode(dev, hsize, vsize, vrefresh_rate, 0, 0);
+	if (!mode)
+		return NULL;
+
+	if (drm_mode_hsync(mode) > drm_gtf2_hbreak(drm_edid)) {
+		drm_mode_destroy(dev, mode);
+		mode = drm_gtf_mode_complex(dev, hsize, vsize,
+					    vrefresh_rate, 0, 0,
+					    drm_gtf2_m(drm_edid),
+					    drm_gtf2_2c(drm_edid),
+					    drm_gtf2_k(drm_edid),
+					    drm_gtf2_2j(drm_edid));
+	}
+
+	return mode;
+}
+
 /*
  * Take the standard timing params (in this case width, aspect, and refresh)
  * and convert them into a real mode using CVT/GTF/DMT.
@@ -3201,23 +3230,7 @@ static struct drm_display_mode *drm_mode_std(struct drm_connector *connector,
 		mode = drm_gtf_mode(dev, hsize, vsize, vrefresh_rate, 0, 0);
 		break;
 	case LEVEL_GTF2:
-		/*
-		 * This is potentially wrong if there's ever a monitor with
-		 * more than one ranges section, each claiming a different
-		 * secondary GTF curve.  Please don't do that.
-		 */
-		mode = drm_gtf_mode(dev, hsize, vsize, vrefresh_rate, 0, 0);
-		if (!mode)
-			return NULL;
-		if (drm_mode_hsync(mode) > drm_gtf2_hbreak(drm_edid)) {
-			drm_mode_destroy(dev, mode);
-			mode = drm_gtf_mode_complex(dev, hsize, vsize,
-						    vrefresh_rate, 0, 0,
-						    drm_gtf2_m(drm_edid),
-						    drm_gtf2_2c(drm_edid),
-						    drm_gtf2_k(drm_edid),
-						    drm_gtf2_2j(drm_edid));
-		}
+		mode = drm_gtf2_mode(dev, drm_edid, hsize, vsize, vrefresh_rate);
 		break;
 	case LEVEL_CVT:
 		mode = drm_cvt_mode(dev, hsize, vsize, vrefresh_rate, 0, 0,
-- 
2.35.1

