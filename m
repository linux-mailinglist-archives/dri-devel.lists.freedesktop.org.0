Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F566E12C3
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 18:49:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB4F010EB95;
	Thu, 13 Apr 2023 16:49:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 875A710E380;
 Thu, 13 Apr 2023 16:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681404582; x=1712940582;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xUlOujp3VBoiGcCZqWhzgbXO97qHTua64Yy9wHHgCSs=;
 b=PslrpN4UWlgquiwONI/ihNCpME7AE06BE8FZzMiexvWq6mEiFJs+Wc39
 kUmxaoMBQqyehoxIxlLIj2aciHVHPBdBwDSWT1dJ9sbqxtcJgpfX2u0HM
 Yc/FVCEYjvvEDfCZpyeOoXQJz5x2AyevcB2k3ZnAF51PswIC2sWvGZ91A
 qItb5bqjF2RjXXKFGHw4dwfeljxIP9hGMwmOONXv5V7bd7jeUeuqrteO/
 b1IclS88thHgArH5oSw56C7PlM21vun+r2BtCGtkJa+qT8YvO1yOERGfw
 ofx/VplnBna98aa34j41zLf6IWlLXzLM49FLFtxr97VUdcRorWCIr2Jfh A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="342991103"
X-IronPort-AV: E=Sophos;i="5.99,194,1677571200"; d="scan'208";a="342991103"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2023 09:49:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="692037932"
X-IronPort-AV: E=Sophos;i="5.99,194,1677571200"; d="scan'208";a="692037932"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.70])
 by fmsmga007.fm.intel.com with SMTP; 13 Apr 2023 09:49:29 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 13 Apr 2023 19:49:28 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 4/7] drm/i915: Always enable CGM CSC on CHV
Date: Thu, 13 Apr 2023 19:49:13 +0300
Message-Id: <20230413164916.4221-5-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230413164916.4221-1-ville.syrjala@linux.intel.com>
References: <20230413164916.4221-1-ville.syrjala@linux.intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

On CHV toggling the CGM CSC on/off while the pipe is running leads
to underruns. Looks like we'd have to do the toggling strictly inside
the start_of_vblank-frame_start window to avoid this, but that window
is less than a scanline so there's no way we can guarantee hitting it.

As a workaround let's just leave the CGM CSC permanently enabled.
Fortunately the CGM gamma/degamma units don't seem to suffer from
this malady.

I also tried turning off CGM unit clock gating, but that did not
help.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_color.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index 63141f4ed372..7a705e7d8776 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -605,6 +605,16 @@ static void chv_cgm_csc_convert_ctm(const struct intel_crtc_state *crtc_state,
 		csc->coeff[i] = ctm_to_twos_complement(ctm->matrix[i], 4, 12);
 }
 
+#define CHV_CGM_CSC_COEFF_1_0 (1 << 12)
+
+static const struct intel_csc_matrix chv_cgm_csc_matrix_identity = {
+	.coeff = {
+		CHV_CGM_CSC_COEFF_1_0, 0, 0,
+		0, CHV_CGM_CSC_COEFF_1_0, 0,
+		0, 0, CHV_CGM_CSC_COEFF_1_0,
+	},
+};
+
 static void chv_load_cgm_csc(struct intel_crtc *crtc,
 			     const struct intel_csc_matrix *csc)
 {
@@ -667,9 +677,9 @@ static void chv_assign_csc(struct intel_crtc_state *crtc_state)
 
 		chv_cgm_csc_convert_ctm(crtc_state, &crtc_state->csc);
 	} else {
-		drm_WARN_ON(&i915->drm, (crtc_state->cgm_mode & CGM_PIPE_MODE_CSC) != 0);
+		drm_WARN_ON(&i915->drm, (crtc_state->cgm_mode & CGM_PIPE_MODE_CSC) == 0);
 
-		intel_csc_clear(&crtc_state->csc);
+		crtc_state->csc = chv_cgm_csc_matrix_identity;
 	}
 }
 
@@ -2033,6 +2043,13 @@ static u32 chv_cgm_mode(const struct intel_crtc_state *crtc_state)
 	    !lut_is_legacy(crtc_state->hw.gamma_lut))
 		cgm_mode |= CGM_PIPE_MODE_GAMMA;
 
+	/*
+	 * Toggling the CGM CSC on/off outside of the tiny window
+	 * between start of vblank and frame start causes underruns.
+	 * Always enable the CGM CSC as a workaround.
+	 */
+	cgm_mode |= CGM_PIPE_MODE_CSC;
+
 	return cgm_mode;
 }
 
-- 
2.39.2

