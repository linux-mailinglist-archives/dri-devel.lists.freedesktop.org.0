Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9157E9691E8
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 05:23:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FA0D10E3E0;
	Tue,  3 Sep 2024 03:23:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="EW+UP1S3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42C5C10E3E1
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 03:23:05 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2f406034874so57522601fa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Sep 2024 20:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725333783; x=1725938583; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=JnTpKnP4ELVQ61jnwvZH/DvQ98T2PSNEOPQgmIwZDJg=;
 b=EW+UP1S34ANL3aK6WjcFNuMNh1LocIMz4dcvkrUs3DRdTF82IDL3P/kD79T77XTe4x
 w6OJhSW0uNEu+WeOYymogYd+qQM2xGJ9WKLmqlQu3B9D9IjheoC6T89J49zRFQw7i6Sz
 9wb997pvCYED8N7VBk6oZFqIYBfXRMIvAMFo7qm8Z9s+9DF6Ig8NONGrAT5jwcQrnUFF
 By3fhgLd77NaGlqaskW+hjsmFFDno1RG1/nAQ75idloWsnznvo+wdJ9IknckKRJIVuys
 KB/vqHkteOCOB75RUenhJ9vLV03Pa2MGIk+XYKZkVlODgeCEEX8JfFISC57d0lUsQanl
 LBkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725333783; x=1725938583;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JnTpKnP4ELVQ61jnwvZH/DvQ98T2PSNEOPQgmIwZDJg=;
 b=IbF9WUZF1uJhVz6rBZaUHT9VB+js0jVQy93EKaYrnU4DGh1DIOBPEd2fCSMu/NQINR
 C4fm/qqjVOoPF4+qV1jI87gPoLTIBxovynPNpa9I5dtWolrfnDvK43oYnnKMIQjeo3wM
 2FlIUjWnTeKlXijGVCQKiSTIj/Wi12dnqexa5h4BEYiBdZV3eGo0PRqy2III9XXDYoVE
 +XRnKA+KC7LBUnS9qlCJKZNQTO/NEGUoAAQFqwaAXlD9mR2KN5vvJvZqq57LY+IavTLB
 eIKTEt2i0AxCmTJhlPPKsKosltMtoQhCUMjsJgRZH56osf3GCpepXAAYYcpxZNL4rvZQ
 jhLw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU13Q1eZRaSax/wWvBKH9nqk2fk/8yh2jcAgGHhEEl2TVb8eytTvGhJMjMguKTmt/QLYpz6MbgqGjM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwcsNqLchoYmeZ3XazTZRwuAH726wQEn1wiyLyVT0WAvvXJTNXM
 CvKNRwlaeKODJ98LG2fod+3N8zB94J6mlLH48mq5R89K5L04zEg298RihdE4SMA=
X-Google-Smtp-Source: AGHT+IEur2S4Nc8ikOaCA/vRxjSg9edwKu2KMOglmSfJLktNRs/Rto+WlQVfrZDdXvSQVQIb7dZQsg==
X-Received: by 2002:a05:651c:548:b0:2f3:b078:84bc with SMTP id
 38308e7fff4ca-2f6105b5d9amr123073801fa.4.1725333782729; 
 Mon, 02 Sep 2024 20:23:02 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f614ed15a5sm21003961fa.8.2024.09.02.20.23.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2024 20:23:02 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 03 Sep 2024 06:22:55 +0300
Subject: [PATCH v6 12/15] drm/msm/dpu: move layout setup population out of
 dpu_plane_prepare_fb()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240903-dpu-mode-config-width-v6-12-617e1ecc4b7a@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3133;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=u19dHALRdHSRYZ4rbk5/scc2X+1dvppKJEof9vorl5k=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBm1oEMacu4VLgoz8vof64f2OfQYFd9niVuVDtKX
 83StGnymjCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZtaBDAAKCRCLPIo+Aiko
 1e39CACupr8oxAKD1t+qVPxOmjXpbbdG6wzw8SbDmbedj+zXOC0djbZyWtWzE6hgKL34zGTw1Qn
 GV3mNPqdkKCiTAN1mnu+38hzbZnUMMeTlOcaxs5XthjcpyAGPZluOdgQ774GgFMa2MBnXBkBWYb
 YEGUGiD/tkChgUEuusX9vmMmvgdfewaQJHux+5zTCLzoEYrZDyIdFKadt1SxBMSfDRhBbogUa+e
 YUUHaf8miu9Z50D6d+OtM7zeMopnVpgFQtSW4gAL3icIuITSQ+Qr1vNrjxhal6Si+qm92feHU49
 WmHo3n/Pon45PILZUyc5Hce8jZiYewnI15xbT4gAQpfV8jbm
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

Move the call to dpu_format_populate_plane_sizes() to the atomic_check
step, so that any issues with the FB layout can be reported as early as
possible.

At the same time move the call to dpu_format_populate_addrs() to
dpu_plane_sspp_atomic_update(). This way the all layout management is
performed only for the visible planes: the .prepare_fb callback is
called for not visible planes too, so keeping dpu_format_populate_addrs
in dpu_plane_prepare_fb() will require dpu_format_populate_plane_sizes()
to be called for !visible planes too.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 26 +++++++++++---------------
 1 file changed, 11 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index df95377b98fc..3045bda8a7b7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -675,19 +675,6 @@ static int dpu_plane_prepare_fb(struct drm_plane *plane,
 		}
 	}
 
-	ret = dpu_format_populate_plane_sizes(new_state->fb, &pstate->layout);
-	if (ret) {
-		DPU_ERROR_PLANE(pdpu, "failed to get format plane sizes, %d\n", ret);
-		if (pstate->aspace)
-			msm_framebuffer_cleanup(new_state->fb, pstate->aspace,
-						pstate->needs_dirtyfb);
-		return ret;
-	}
-
-	dpu_format_populate_addrs(pstate->aspace,
-				  new_state->fb,
-				  &pstate->layout);
-
 	return 0;
 }
 
@@ -863,6 +850,12 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 		return -E2BIG;
 	}
 
+	ret = dpu_format_populate_plane_sizes(new_plane_state->fb, &pstate->layout);
+	if (ret) {
+		DPU_ERROR_PLANE(pdpu, "failed to get format plane sizes, %d\n", ret);
+		return ret;
+	}
+
 	fmt = msm_framebuffer_format(new_plane_state->fb);
 
 	max_linewidth = pdpu->catalog->caps->max_linewidth;
@@ -1102,7 +1095,8 @@ static void dpu_plane_sspp_update_pipe(struct drm_plane *plane,
 		_dpu_plane_set_qos_remap(plane, pipe);
 }
 
-static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
+static void dpu_plane_sspp_atomic_update(struct drm_plane *plane,
+					 struct drm_plane_state *new_state)
 {
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
 	struct drm_plane_state *state = plane->state;
@@ -1123,6 +1117,8 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 	pstate->needs_qos_remap |= (is_rt_pipe != pdpu->is_rt_pipe);
 	pdpu->is_rt_pipe = is_rt_pipe;
 
+	dpu_format_populate_addrs(pstate->aspace, new_state->fb, &pstate->layout);
+
 	DPU_DEBUG_PLANE(pdpu, "FB[%u] " DRM_RECT_FP_FMT "->crtc%u " DRM_RECT_FMT
 			", %p4cc ubwc %d\n", fb->base.id, DRM_RECT_FP_ARG(&state->src),
 			crtc->base.id, DRM_RECT_ARG(&state->dst),
@@ -1187,7 +1183,7 @@ static void dpu_plane_atomic_update(struct drm_plane *plane,
 	if (!new_state->visible) {
 		_dpu_plane_atomic_disable(plane);
 	} else {
-		dpu_plane_sspp_atomic_update(plane);
+		dpu_plane_sspp_atomic_update(plane, new_state);
 	}
 }
 

-- 
2.39.2

