Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D9D6DE741
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 00:29:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33F2F10E354;
	Tue, 11 Apr 2023 22:29:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 442C610E1DB;
 Tue, 11 Apr 2023 22:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681252183; x=1712788183;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xt8zT1YZRdFHhWLsgQphruGj5/L9fb/AakwpLz1znqY=;
 b=dIG8ktJWk12cbIjjsLmB07gEb+Y0qptQTGe6Pyt4qyupHoRNLL/UJ0mB
 xH2rwQYq/YCRwgj/uZ+GvcFalWFthPvpYYpB9wQ3tFRrWGUZmv/OEczp6
 35jnL6gtiQ9gCCEPtzUY+N3+WFiSReJYGKrH9/FL55HGXM27T210PZWIk
 8SIlI8iJnGz1Ajc49v2aNjV9JXVUTnTevd1o1UekuH+aV2OHhy4oEB7eW
 hDsktVe01c9KHWM2Nw1S9cCkjF4nnQ7hdHxKJ8YR/q9ej2TcDsskpzrAB
 2smxS+wreM1duW4Toq8oPyGPRkCOJtSFeq9rBnuwX9POZ/1HS2S7PVBx1 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="342506246"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; d="scan'208";a="342506246"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2023 15:29:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="753296821"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; d="scan'208";a="753296821"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.70])
 by fmsmga008.fm.intel.com with SMTP; 11 Apr 2023 15:29:41 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 12 Apr 2023 01:29:40 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 3/6] drm/i915: Fix CHV CGM CSC coefficient sign handling
Date: Wed, 12 Apr 2023 01:29:28 +0300
Message-Id: <20230411222931.15127-4-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230411222931.15127-1-ville.syrjala@linux.intel.com>
References: <20230411222931.15127-1-ville.syrjala@linux.intel.com>
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

The CHV CGM CSC coefficients are in s4.12 two's complement
format. Fix the CTM->CGM conversion to handle that correctly
instead of pretending that the hw coefficients are also
in some sign-magnitude format.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_color.c | 46 ++++++++++++++--------
 1 file changed, 29 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index 4fc16cac052d..63141f4ed372 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -568,29 +568,41 @@ static void icl_load_csc_matrix(const struct intel_crtc_state *crtc_state)
 		icl_update_output_csc(crtc, &crtc_state->output_csc);
 }
 
+static u16 ctm_to_twos_complement(u64 coeff, int int_bits, int frac_bits)
+{
+	s64 c = CTM_COEFF_ABS(coeff);
+
+	/* leave an extra bit for rounding */
+	c >>= 32 - frac_bits - 1;
+
+	/* round and drop the extra bit */
+	c = (c + 1) >> 1;
+
+	if (CTM_COEFF_NEGATIVE(coeff))
+		c = -c;
+
+	c = clamp(c, -(s64)BIT(int_bits + frac_bits - 1),
+		  (s64)(BIT(int_bits + frac_bits - 1) - 1));
+
+	return c & (BIT(int_bits + frac_bits) - 1);
+}
+
+/*
+ * CHV Color Gamut Mapping (CGM) CSC
+ * |r|   | c0 c1 c2 |   |r|
+ * |g| = | c3 c4 c5 | x |g|
+ * |b|   | c6 c7 c8 |   |b|
+ *
+ * Coefficients are two's complement s4.12.
+ */
 static void chv_cgm_csc_convert_ctm(const struct intel_crtc_state *crtc_state,
 				    struct intel_csc_matrix *csc)
 {
 	const struct drm_color_ctm *ctm = crtc_state->hw.ctm->data;
 	int i;
 
-	for (i = 0; i < 9; i++) {
-		u64 abs_coeff = ((1ULL << 63) - 1) & ctm->matrix[i];
-
-		/* Round coefficient. */
-		abs_coeff += 1 << (32 - 13);
-		/* Clamp to hardware limits. */
-		abs_coeff = clamp_val(abs_coeff, 0, CTM_COEFF_8_0 - 1);
-
-		csc->coeff[i] = 0;
-
-		/* Write coefficients in S3.12 format. */
-		if (ctm->matrix[i] & (1ULL << 63))
-			csc->coeff[i] |= 1 << 15;
-
-		csc->coeff[i] |= ((abs_coeff >> 32) & 7) << 12;
-		csc->coeff[i] |= (abs_coeff >> 20) & 0xfff;
-	}
+	for (i = 0; i < 9; i++)
+		csc->coeff[i] = ctm_to_twos_complement(ctm->matrix[i], 4, 12);
 }
 
 static void chv_load_cgm_csc(struct intel_crtc *crtc,
-- 
2.39.2

