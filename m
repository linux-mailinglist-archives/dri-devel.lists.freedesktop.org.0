Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB5A5A3128
	for <lists+dri-devel@lfdr.de>; Fri, 26 Aug 2022 23:36:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4A3710E803;
	Fri, 26 Aug 2022 21:35:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8116C10E6D8;
 Fri, 26 Aug 2022 21:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661549727; x=1693085727;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wa3cllefe8tNwRjOMj8usyvDkEmC5ANY8uff3LM9IwM=;
 b=F2umXytoNGYkdkiuk6+H+3oVeKsuaxuWakHcblUE3Iut+0S26LDkFFTb
 zNVlJgcO632vUwj4aleGwRKLayt5qWynE9uYnRCFniEMShz02TJMFjHmz
 L3kI7zAuKkSrcfz1op506QF1XVzrWj5vh8FL8Vvd2ApNKJq9jJJBsY5KM
 tF8rHJeSn+XjGcsr1pkxcbwyn1JvftdVHWfNT1GuZ3WMusn/qCGWVoHAa
 fJP1+q9xQ11cDR9SNQjjxLZRQ3iBD/QRYcK4VP4FSkNYOZpmWcN0cW7xg
 aOOBqrgpcjenSSunCWhCLldhkMLjxSuiKeryw06Ng7vTr71dFQt7XmBx5 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10451"; a="380902815"
X-IronPort-AV: E=Sophos;i="5.93,266,1654585200"; d="scan'208";a="380902815"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2022 14:35:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,266,1654585200"; d="scan'208";a="643805802"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by orsmga001.jf.intel.com with SMTP; 26 Aug 2022 14:35:24 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Sat, 27 Aug 2022 00:35:23 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 06/11] drm/edid: Extract drm_gtf2_mode()
Date: Sat, 27 Aug 2022 00:34:56 +0300
Message-Id: <20220826213501.31490-7-ville.syrjala@linux.intel.com>
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

Extract the GTF vs. GTF2 logic into a separate function.
We'll have a second user soon.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_edid.c | 47 ++++++++++++++++++++++++--------------
 1 file changed, 30 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index b459fdf12b58..0c7cbe9b44f5 100644
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

