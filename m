Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E5C9691EC
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 05:23:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0C3510E3E6;
	Tue,  3 Sep 2024 03:23:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="QqZeRnnO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBF3A10E3DF
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 03:23:05 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-2f025b94e07so47614921fa.0
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Sep 2024 20:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725333784; x=1725938584; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=nNcyVVvZk5loLiufOoESYV0Fl75NGNrg1mqZRy+YG+o=;
 b=QqZeRnnOksuwxNCPrnuIAUFXne4bgcs3Fd6VVJ6TJtx4M6g0nI8vXMDcfqWU8p1/Jj
 qDvKyHRBdKT0RN8l/Wi9Jm7o6A5RSIyjlx5M77DMglvq8ltK4EdfCZQYyX7UEY48g5+n
 13dmVmRf5SEltYIKdFzs5BYAYZ19S0ithXToKLdfV6gk/3NGufNDdOxaIH3/NJGVDIEK
 szuuBJt2DH197StQbc9c9O4KoAcB86uvPw/Kx4+MDDZgatH8LskrahpELscWI73O54jP
 4g4ivM4XLAFy9KyLlH+2ncP32HO9rYuMKAVY2uB1vQb7vqZboNa1cQaiWNRRtY/pRzF9
 WZoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725333784; x=1725938584;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nNcyVVvZk5loLiufOoESYV0Fl75NGNrg1mqZRy+YG+o=;
 b=TDZXWUsncQX+sGNUY9tyYYK5xMROyevZXtxINUA09nENr07uIyT3J8ThBL+DhXQZXm
 /JdkFPVdDNt2V/xYJEP9TAzEqV2daHvilM7oN2NHHeAMhvSESPLu1ZRqcvvZwG6ShiVx
 cfCeTbn3VXmEHsBgoJgQ8VVplCvcuyxZreGlAmuK4dNHlInZCceva5Bj3cECcmWfEgQ8
 qljk2lS30+m699EUKBk8eKYPhgFCwjTAxWpnDySOkI4XEYWXGax/wVt116cdGuXM8Ofn
 QfKQfmS9O0OnY8m5iUZJI6trXEwk6H0LdZvN/OYqO869yQQ2s5k9jPpICTuY5Ko+uEGU
 Qokw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLEPkPlRvBV8aHcExmZS8cPq6bRZ1AjXYEiu28YBXtUcWUW2i+9sQK5KA5d0Vlf0/1AlGG8L16qTY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YySkB4AP5hz2yWUo7/c0ARdMmiAXBnklBJvDV54KGUx4dTRdBmf
 QGr2Ai1027o1EpSzx9vZ0z6qX3dsWePRfGzN1gzH9BOVcbfyLkjFT1jjB++ScN0=
X-Google-Smtp-Source: AGHT+IHOxIlT4SuY36W/z8DrCYweOAxrs+1iXepanIFfvFeHHaelsiCTrgeQYczKg8X0mf/jree25A==
X-Received: by 2002:a2e:4609:0:b0:2ef:3126:390d with SMTP id
 38308e7fff4ca-2f61054aaf9mr101064971fa.42.1725333783444; 
 Mon, 02 Sep 2024 20:23:03 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f614ed15a5sm21003961fa.8.2024.09.02.20.23.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2024 20:23:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 03 Sep 2024 06:22:56 +0300
Subject: [PATCH v6 13/15] drm/msm/dpu: check for the plane pitch overflow
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240903-dpu-mode-config-width-v6-13-617e1ecc4b7a@linaro.org>
References: <20240903-dpu-mode-config-width-v6-0-617e1ecc4b7a@linaro.org>
In-Reply-To: <20240903-dpu-mode-config-width-v6-0-617e1ecc4b7a@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1824;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=XPsvsitt1q1/pSPR8E1pmuiZ9IMdCJRZ86FgRWBJlZE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBm1oEM5yi+wct8hrTlmYoAn+9Ei59ElyUyoj8WD
 4JcHT2FZiSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZtaBDAAKCRCLPIo+Aiko
 1aLgB/9+zx1fLDKaiXhu0s2o9e1/WxNm3q+pEqD9GEUvWsZ2ruuv3/us/a2E3sWA1xfeD6j+x6P
 PLQNgXQUiVsHtPkyyBV/bKHE8vZ8ZsexfiVTqJV1N4VW1lYY3a+Exk1Obtj2kydjkK0q+k6s2LO
 2l3WBM7vowl7zwQnqf0sREz/bDPBVaYX5g5gwfmAhiQj8gR+T1HG0eaj4sERZuhiMobz8iS8AFo
 bNSuD6yLzMdbRjXg4QjmcE1i+mMVlCerTG4J+jkD7QLuioNf6LAgcj4dDdDabBfXx09ez4mCUg6
 5m35FR4+pASI75ScJ+7gOFAmUXCU6OX58qU+QfPckcYhmwcD
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Check that the plane pitch doesn't overflow the maximum pitch size
allowed by the hardware.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Tested-by: Abhinav Kumar <quic_abhinavk@quicinc.com> # sc7280
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h | 2 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 6 +++++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
index 4a910b808687..8998d1862e16 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
@@ -12,6 +12,8 @@
 
 struct dpu_hw_sspp;
 
+#define DPU_SSPP_MAX_PITCH_SIZE		0xffff
+
 /**
  * Flags
  */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 3045bda8a7b7..f686588bf896 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -782,7 +782,7 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 {
 	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
 										 plane);
-	int ret = 0, min_scale;
+	int i, ret = 0, min_scale;
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
 	struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
 	u64 max_mdp_clk_rate = kms->perf.max_core_clk_rate;
@@ -856,6 +856,10 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 		return ret;
 	}
 
+	for (i = 0; i < pstate->layout.num_planes; i++)
+		if (pstate->layout.plane_pitch[i] > DPU_SSPP_MAX_PITCH_SIZE)
+			return -E2BIG;
+
 	fmt = msm_framebuffer_format(new_plane_state->fb);
 
 	max_linewidth = pdpu->catalog->caps->max_linewidth;

-- 
2.39.2

