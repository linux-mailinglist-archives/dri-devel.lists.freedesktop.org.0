Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D3E144D5D
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2020 09:22:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03A6D6F3F4;
	Wed, 22 Jan 2020 08:21:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 551196ECF3;
 Tue, 21 Jan 2020 13:46:22 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id d16so3228837wre.10;
 Tue, 21 Jan 2020 05:46:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=oTa1VqITVge6WV7oRjAnmHlhAXizGmEu7HI8M0yFGwM=;
 b=cUthgRS12TpM7g1AxGRgWUIcrNCbJURnzhaA7ucQr0Z522J3XcMc4YzSKTDlxKtIj7
 BCd+mPAeF+e1xyi5ohFY8nzyiLgyOqsuG+plw9bz5h5KW9KuZJXRIMXlwApGQ6a5bvpD
 KKvycetfNYRCfD4PFpiU63fqNCNm3SbluHEKCQz5e9muXczTTJYsLwnAX3NTZb8j6RaB
 JKFPRu0KmPBxD7ih5VvEwKUL06t+8km8tql78+MlpMFEBJiyZmuBDnC4XK/t1Db0isoB
 30XY14LmYefU8bsVZsDG9zbAPTVPJnByOETAe7k6J4x1LNUDgvNsNrnY8s+NIVTSQgcr
 kPDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=oTa1VqITVge6WV7oRjAnmHlhAXizGmEu7HI8M0yFGwM=;
 b=LB/g2ozYuelmikWIvVKa09VOShWKAjZ95rKjXd1R++UA36YT4t1KdVQEbLmGaUGkam
 i1Jwpo2PJ65Gz12zuscqHxEqIpIHWKGZ9DHd1DQx3a0el81jlm5Md2rOge9WqTp+evpF
 2iVqqGtfOkzIfx+MLetZm2gadAyP6d7Gq5c71L1Mky/CU1/zJlPP4NxuLsAEAOG6HsiY
 dGS5led/DkA+PqW8LpPRyxwMGaSROBHgsOcLW7yDS6wi8ZNJyr8TTeh0d463HN54tXoU
 QE9kMFbqjlStLF6ooP/14X5apBXqv18VZc6kqLEC1fvQY8V7a/JaFbzcQ07YFXP5sP0A
 RCyw==
X-Gm-Message-State: APjAAAU3yiTOOZVNgy7Pu4yrLx+lxRLKTSa0Inm4uMJlrTXDxtdH/aZf
 8fEIfVEkET5fN1mUEcJG3WM=
X-Google-Smtp-Source: APXvYqxqlmArV62RmaLNb0cFMTMjuJYURYQ3LxnTyTtF4Gy7gMvwx+xwmcYyIv++Uzvrz/jHPUHB/Q==
X-Received: by 2002:adf:f70b:: with SMTP id r11mr4889882wrp.388.1579614381048; 
 Tue, 21 Jan 2020 05:46:21 -0800 (PST)
Received: from localhost.localdomain ([197.254.95.38])
 by smtp.googlemail.com with ESMTPSA id x17sm51590093wrt.74.2020.01.21.05.46.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2020 05:46:20 -0800 (PST)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@linux.ie, daniel@ffwll.ch,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/5] drm/i915/bw: convert to drm_device based logging macros
Date: Tue, 21 Jan 2020 16:45:58 +0300
Message-Id: <20200121134559.17355-5-wambui.karugax@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200121134559.17355-1-wambui.karugax@gmail.com>
References: <20200121134559.17355-1-wambui.karugax@gmail.com>
X-Mailman-Approved-At: Wed, 22 Jan 2020 08:21:10 +0000
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This replaces the printk based logging macros with the struct drm_based
macros in i915/display/intel_bw.c
This transformation was achieved by using the following coccinelle
script that matches based on the existence of a struct drm_i915_private
device in the functions:

@rule1@
identifier fn, T;
@@

fn(struct drm_i915_private *T,...) {
<+...
(
-DRM_INFO(
+drm_info(&T->drm,
...)
|
-DRM_ERROR(
+drm_err(&T->drm,
...)
|
-DRM_WARN(
+drm_warn(&T->drm,
...)
|
-DRM_DEBUG(
+drm_dbg(&T->drm,
...)
|
-DRM_DEBUG_DRIVER(
+drm_dbg(&T->drm,
...)
|
-DRM_DEBUG_KMS(
+drm_dbg_kms(&T->drm,
...)
)
...+>
}

@rule2@
identifier fn, T;
@@

fn(...) {
...
struct drm_i915_private *T = ...;
<+...
(
-DRM_INFO(
+drm_info(&T->drm,
...)
|
-DRM_ERROR(
+drm_err(&T->drm,
...)
|
-DRM_WARN(
+drm_warn(&T->drm,
...)
|
-DRM_DEBUG(
+drm_dbg(&T->drm,
...)
|
-DRM_DEBUG_KMS(
+drm_dbg_kms(&T->drm,
...)
|
-DRM_DEBUG_DRIVER(
+drm_dbg(&T->drm,
...)
)
...+>
}

Resulting checkpatch warnings were addressed manually.

Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
---
 drivers/gpu/drm/i915/display/intel_bw.c | 29 +++++++++++++++----------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_bw.c b/drivers/gpu/drm/i915/display/intel_bw.c
index b228671d5a5d..9c40ad52dd73 100644
--- a/drivers/gpu/drm/i915/display/intel_bw.c
+++ b/drivers/gpu/drm/i915/display/intel_bw.c
@@ -132,9 +132,10 @@ static int icl_get_qgv_points(struct drm_i915_private *dev_priv,
 		if (ret)
 			return ret;
 
-		DRM_DEBUG_KMS("QGV %d: DCLK=%d tRP=%d tRDPRE=%d tRAS=%d tRCD=%d tRC=%d\n",
-			      i, sp->dclk, sp->t_rp, sp->t_rdpre, sp->t_ras,
-			      sp->t_rcd, sp->t_rc);
+		drm_dbg_kms(&dev_priv->drm,
+			    "QGV %d: DCLK=%d tRP=%d tRDPRE=%d tRAS=%d tRCD=%d tRC=%d\n",
+			    i, sp->dclk, sp->t_rp, sp->t_rdpre, sp->t_ras,
+			    sp->t_rcd, sp->t_rc);
 	}
 
 	return 0;
@@ -187,7 +188,8 @@ static int icl_get_bw_info(struct drm_i915_private *dev_priv, const struct intel
 
 	ret = icl_get_qgv_points(dev_priv, &qi);
 	if (ret) {
-		DRM_DEBUG_KMS("Failed to get memory subsystem information, ignoring bandwidth limits");
+		drm_dbg_kms(&dev_priv->drm,
+			    "Failed to get memory subsystem information, ignoring bandwidth limits");
 		return ret;
 	}
 	num_channels = qi.num_channels;
@@ -228,8 +230,9 @@ static int icl_get_bw_info(struct drm_i915_private *dev_priv, const struct intel
 			bi->deratedbw[j] = min(maxdebw,
 					       bw * 9 / 10); /* 90% */
 
-			DRM_DEBUG_KMS("BW%d / QGV %d: num_planes=%d deratedbw=%u\n",
-				      i, j, bi->num_planes, bi->deratedbw[j]);
+			drm_dbg_kms(&dev_priv->drm,
+				    "BW%d / QGV %d: num_planes=%d deratedbw=%u\n",
+				    i, j, bi->num_planes, bi->deratedbw[j]);
 		}
 
 		if (bi->num_planes == 1)
@@ -424,10 +427,11 @@ int intel_bw_atomic_check(struct intel_atomic_state *state)
 		bw_state->data_rate[crtc->pipe] = new_data_rate;
 		bw_state->num_active_planes[crtc->pipe] = new_active_planes;
 
-		DRM_DEBUG_KMS("pipe %c data rate %u num active planes %u\n",
-			      pipe_name(crtc->pipe),
-			      bw_state->data_rate[crtc->pipe],
-			      bw_state->num_active_planes[crtc->pipe]);
+		drm_dbg_kms(&dev_priv->drm,
+			    "pipe %c data rate %u num active planes %u\n",
+			    pipe_name(crtc->pipe),
+			    bw_state->data_rate[crtc->pipe],
+			    bw_state->num_active_planes[crtc->pipe]);
 	}
 
 	if (!bw_state)
@@ -441,8 +445,9 @@ int intel_bw_atomic_check(struct intel_atomic_state *state)
 	data_rate = DIV_ROUND_UP(data_rate, 1000);
 
 	if (data_rate > max_data_rate) {
-		DRM_DEBUG_KMS("Bandwidth %u MB/s exceeds max available %d MB/s (%d active planes)\n",
-			      data_rate, max_data_rate, num_active_planes);
+		drm_dbg_kms(&dev_priv->drm,
+			    "Bandwidth %u MB/s exceeds max available %d MB/s (%d active planes)\n",
+			    data_rate, max_data_rate, num_active_planes);
 		return -EINVAL;
 	}
 
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
