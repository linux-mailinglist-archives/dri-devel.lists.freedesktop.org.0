Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0288E13BAD6
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2020 09:28:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D95E56E879;
	Wed, 15 Jan 2020 08:27:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7DB26E33E;
 Tue, 14 Jan 2020 09:52:09 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id t14so12908848wmi.5;
 Tue, 14 Jan 2020 01:52:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=q6RanNdUoczCExPmVTmgRD9iBfpF1gCk763s4qX8JSY=;
 b=PDK4+Znj3pDpGScOLb1jD7Y+GaEdkIlqrSBrgCHVt11xjztSfFj/Gnf69dHZrZIObD
 TDil1nTHkIP5Qf1oxy+FJJJtQUA6VsAYfDXHs0Ce9gfxFZNWdZ95Htsx/pBOmHbnXcw4
 +D86kt+FYYGmwpih7Udj34mguk2k943d5fpgI4kHK3cDDK6/HlIJ8X4H/6ss7OtvCHwF
 GPWi/wwzT1Gy0UoHRYEddbcCgvMysVUSR7xykVTaks8ERO+1hpv75X27pDJ+vX1zmSeL
 zHFFwNXA4Hjy2sE3B/23xbBKCiyiXLC4fcY4Z5MpCtLNh8epREuyHLFpGjftzEbGR0l9
 qvBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=q6RanNdUoczCExPmVTmgRD9iBfpF1gCk763s4qX8JSY=;
 b=AVcjk5/tjFRFlhOVguvnaDpDUPhWBk70gtVY8oIm6Z3HjcxAZCzu+4ORNNa3SbDdkw
 xnMOIO8+7QIxldDNst1/dnOTcZ6saGLEHiaeVmwE5ZDZKw6KG9d29uAV0Kt/8lE1Fbft
 8kwx7zxqBZWoW9l7eNteamtIvedxJGf3HUlKgIaz2XpBamEXWmHrCBvgo02/3310IjOX
 B1A55MTgHGLvh4cHCea/Xz1EmuO1IMBAd4GK1M3dLIexfLJsF8JnLRCGt6AF7JkLpT6U
 YCC6H10IwFTqVhE78TH6EiUDX6z6SI5Ic8dggvJcNAMrbbm76i8ylnhceIie/Flm6cYk
 74ww==
X-Gm-Message-State: APjAAAXcxaZRimjKXJLiXSB3sqBhQMzFbbjBmsdUEYCf6T+ZXod5ixWP
 XVE1a89DataRvGjI9K0D10I=
X-Google-Smtp-Source: APXvYqwO7YZvaRCdvWf6/tVZNRsaC/bTSPpG3XW22QHjcte+N4+0Qmt2jsbdDrO8+JXv+rZEO2n5Ow==
X-Received: by 2002:a1c:a9c6:: with SMTP id
 s189mr26335879wme.151.1578995528477; 
 Tue, 14 Jan 2020 01:52:08 -0800 (PST)
Received: from localhost.localdomain ([154.70.37.104])
 by smtp.googlemail.com with ESMTPSA id y20sm17454881wmi.25.2020.01.14.01.52.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jan 2020 01:52:08 -0800 (PST)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH 4/5] drm/i915/bw: convert to new drm_device based logging
 macros.
Date: Tue, 14 Jan 2020 12:51:06 +0300
Message-Id: <20200114095107.21197-5-wambui.karugax@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200114095107.21197-1-wambui.karugax@gmail.com>
References: <20200114095107.21197-1-wambui.karugax@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 15 Jan 2020 08:27:50 +0000
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
Cc: intel-gfx@lists.freedesktop.org, sean@poorly.run,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
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
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
