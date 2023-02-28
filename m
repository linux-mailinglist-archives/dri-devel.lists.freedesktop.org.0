Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 862A16A5833
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 12:34:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C5E310E687;
	Tue, 28 Feb 2023 11:33:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47A9E10E050
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Feb 2023 11:33:46 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id r27so12695224lfe.10
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Feb 2023 03:33:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RHLuoMC1TsrcaoIJpAQH8uGPf0IEJuSQkho32eq1jak=;
 b=GlQiZ8CabeWT8jrPqKNDGhQpM8Uq31Ws0+f4ZyXWcRy7vD8d3/K23bHpx5+FEptJfT
 vt/w5PgxnkVercxXLm5DatJfoEqAhJ4D/VbHPNexMjfb6SWV87PxsLy8OsxPpgGpFlQS
 vqf02QbDvQj5VaSflNZHCMr23Dm4E6FJ+kJwHAsAyqQ1q2DuBCRKvI+0oWdUlz1xThQY
 OM9gvfQjzAxtZHCfAh7UExCbq6ZaM59w50W9DdCa1GFZNDpPZ+UD6eX4KDT8tssQ729q
 OGN6Dxfp9iYdtOdE1MiZ6Yr3ZqJqsi6f8cbiupcXIlioYtzR8W5Mt744BNb55sI3fMP3
 Gh+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RHLuoMC1TsrcaoIJpAQH8uGPf0IEJuSQkho32eq1jak=;
 b=uxfHu8oNgazuW0LwE2lQF0OTMaR0AYAPpBpdLHqADC6FL2MIEUz12G68A1eEBqya4g
 +1jIDCorsqcSKeQovb0+HUvd/WVTVAg+l4BcahJju0tQOqi5DLL1hvO5j4DbQlTHzBl8
 hI76+iW59wditZSCE3STvHKmW88dZbN5RwNglHvszB/DVSsCl0llL9pQqrUxzv3A7cnL
 XDPuTuf9FBMrNLMWwhx6wWH6wHWh9pmnT+rQ+jluyBL0OZi2ciQkveye9sl4ri0aNqBZ
 fLbDHp6mTMjpTjne9at+8WvlnzBwIFNiKza4Mvm9e0sveeUZW/tRoxXTkVNeTWpYasG+
 /x7Q==
X-Gm-Message-State: AO0yUKVMMu60ASmyhThZo4V8BhDFiDPcy1m94mrGeJyOExVVM1sxo149
 NCyD1n9XbheEnUb6/mNfVAbcRQ==
X-Google-Smtp-Source: AK7set8A78h91xPnacTfbzD098aC+6UfOBQ+U0398uSjC3TwYKPt+A7f4jghzHejyctDUr5jJBkj8Q==
X-Received: by 2002:ac2:5d2e:0:b0:4df:1d72:8e7d with SMTP id
 i14-20020ac25d2e000000b004df1d728e7dmr864937lfb.39.1677584024377; 
 Tue, 28 Feb 2023 03:33:44 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 h20-20020ac25974000000b004dd0bbc89a1sm1288472lfp.244.2023.02.28.03.33.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 03:33:43 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 01/10] drm/i915/dsc: change DSC param tables to follow the DSC
 model
Date: Tue, 28 Feb 2023 13:33:33 +0200
Message-Id: <20230228113342.2051425-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230228113342.2051425-1-dmitry.baryshkov@linaro.org>
References: <20230228113342.2051425-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
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
Cc: linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

After cross-checking DSC models (20150914, 20161212, 20210623) change
values in rc_parameters tables to follow config files present inside
the DSC model. Handle two places, where i915 tables diverged from the
model, by patching the rc values in the code.

Note: I left one case uncorrected, 8bpp/10bpc/range_max_qp[0], because
the table in the VESA DSC 1.1 sets it to 4.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/i915/display/intel_vdsc.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_vdsc.c b/drivers/gpu/drm/i915/display/intel_vdsc.c
index 207b2a648d32..d080741fd0b3 100644
--- a/drivers/gpu/drm/i915/display/intel_vdsc.c
+++ b/drivers/gpu/drm/i915/display/intel_vdsc.c
@@ -86,7 +86,7 @@ static const struct rc_parameters rc_parameters[][MAX_COLUMN_INDEX] = {
 		}
 	},
 	/* 6BPP/14BPC */
-	{ 768, 15, 6144, 15, 25, 23, 27, {
+	{ 768, 15, 6144, 15, 25, 23, 23, {
 		{ 0, 16, 0 }, { 7, 18, -2 }, { 15, 20, -2 }, { 16, 20, -4 },
 		{ 17, 21, -6 }, { 17, 21, -6 }, { 18, 21, -6 }, { 18, 22, -8 },
 		{ 19, 23, -8 }, { 20, 24, -10 }, { 21, 24, -10 },
@@ -115,6 +115,10 @@ static const struct rc_parameters rc_parameters[][MAX_COLUMN_INDEX] = {
 	},
 	/* 8BPP/10BPC */
 	{ 512, 12, 6144, 7, 16, 15, 15, {
+		/*
+		 * DSC model/pre-SCR-cfg has 8 for range_max_qp[0], however
+		 * VESA DSC 1.1 Table E-5 sets it to 4.
+		 */
 		{ 0, 4, 2 }, { 4, 8, 0 }, { 5, 9, 0 }, { 5, 10, -2 },
 		{ 7, 11, -4 }, { 7, 11, -6 }, { 7, 11, -8 }, { 7, 12, -8 },
 		{ 7, 13, -8 }, { 7, 14, -10 }, { 9, 15, -10 }, { 9, 16, -12 },
@@ -132,7 +136,7 @@ static const struct rc_parameters rc_parameters[][MAX_COLUMN_INDEX] = {
 	},
 	/* 8BPP/14BPC */
 	{ 512, 12, 6144, 15, 24, 23, 23, {
-		{ 0, 12, 0 }, { 5, 13, 0 }, { 11, 15, 0 }, { 12, 17, -2 },
+		{ 0, 12, 2 }, { 5, 13, 0 }, { 11, 15, 0 }, { 12, 17, -2 },
 		{ 15, 19, -4 }, { 15, 19, -6 }, { 15, 19, -8 }, { 15, 20, -8 },
 		{ 15, 21, -8 }, { 15, 22, -10 }, { 17, 22, -10 },
 		{ 17, 23, -12 }, { 17, 23, -12 }, { 21, 24, -12 },
@@ -529,6 +533,16 @@ int intel_dsc_compute_params(struct intel_crtc_state *pipe_config)
 			DSC_RANGE_BPG_OFFSET_MASK;
 	}
 
+	if (DISPLAY_VER(dev_priv) < 13) {
+		if (compressed_bpp == 6 &&
+		    vdsc_cfg->bits_per_component == 8)
+			vdsc_cfg->rc_quant_incr_limit1 = 23;
+
+		if (compressed_bpp == 8 &&
+		    vdsc_cfg->bits_per_component == 14)
+			vdsc_cfg->rc_range_params[0].range_bpg_offset = 0;
+	}
+
 	/*
 	 * BitsPerComponent value determines mux_word_size:
 	 * When BitsPerComponent is less than or 10bpc, muxWordSize will be equal to
-- 
2.39.2

