Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0A3907EFF
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 00:36:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FB4210EBF2;
	Thu, 13 Jun 2024 22:36:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="dy1uPI4F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E74F10EBE3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 22:36:31 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-2ebf5b259ffso24258881fa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 15:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718318189; x=1718922989; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=FlN072hhw0fBKiJsgk2J9BeVUDiEV3EKvdHtXHIJvno=;
 b=dy1uPI4FiC+ptmCZ2ZDs77CddRf1ykv5dHHaGLGqiKxCmo2RcekHeawJWOK2YnBXO5
 XZNphA3hJD7eXsIAfO3k2wV/Q3yULt4/gtZbOnk9t6sYRhwdrt7nZD1gvhpA1o+/PkiV
 DjA/sq6sWlWLn05sek13KA4uKmXifsCWCx6GNKRc7dko5SSAmJdnwoPHmPMZxSg7UrCM
 UTKzdtszKlaPwOYlLQnK7mf03p69LniuSSQwepHfVOg4OOD5ZFtZ8+8+fq7LPZFTnF8z
 87yc272eLuZsxxQAiMjN24YO7QAGnsFDy/hO2UDjzZdyJVzeIuhh2Vbf/6Ax98/9mkTi
 shjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718318189; x=1718922989;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FlN072hhw0fBKiJsgk2J9BeVUDiEV3EKvdHtXHIJvno=;
 b=EB/RJsRO+vDohHhKO95qkwTPXr9KolI8VPvE1yNaJVxQbunod0TaPHfn1qwh+rbtWL
 wAswoysfEpzsaqzVi1b3RVfC2diu2lk/xe5jAiYr6TtrWhySv8wl291Gl0mlYUAGg1k+
 EjJ4yDvqop2tiI3pLZtUIS4jhYdFayLeOmZZGUqJjD23lSYM8iO9uV25c5P1bHs0hOHh
 v8MEaOge7chUJIN87RX+hzUyGQ1kA7t3MFlA+EDwB4BtwasQP28eaB3VauAoI8ltLHQ+
 mQfvNI5100iz55TILnDpsA6OreYH9oXNUIrICTk+p3n03edPdB00sROyo/wgqjKdf6Yi
 CPMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUh85klzUNwfMfjVlunmBQtPRZgJk5JlLvgw1yKPomPzwPX/IL6AfJ6aln13rsEKS0jt+8Z2AN1egDRDIpz7fVVvBRcy9yy98Zy2higSQCn
X-Gm-Message-State: AOJu0YywaTpliusz/hpqa4TgiotFL/kjij5vytn7fBm5sacHzwYt/sDz
 YgMcqHdCLOc9hWGzbYMaN2gckHFLC5jPNwY9If+K1RTXPEbDcC+6Vvwnev1xc4g=
X-Google-Smtp-Source: AGHT+IH6QppQUoYrdkNvnK2t5Jhmp6XGoEKLvdCUf9/Pzsg4JY7mpWQnrjFwhF8ZL+LfKFken4NG7Q==
X-Received: by 2002:a2e:2e18:0:b0:2ea:8d49:c063 with SMTP id
 38308e7fff4ca-2ec02b833a9mr12655111fa.13.1718318189423; 
 Thu, 13 Jun 2024 15:36:29 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ec05c04a08sm3865191fa.29.2024.06.13.15.36.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jun 2024 15:36:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 14 Jun 2024 01:36:08 +0300
Subject: [PATCH v3 7/9] drm/msm/dpu: drop
 _dpu_crtc_check_and_setup_lm_bounds from atomic_begin
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240614-dpu-mode-config-width-v3-7-29ec4069c99b@linaro.org>
References: <20240614-dpu-mode-config-width-v3-0-29ec4069c99b@linaro.org>
In-Reply-To: <20240614-dpu-mode-config-width-v3-0-29ec4069c99b@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=934;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=/ebMwYAo85KjvumV8JrThFY1ICZfff/QWK4oXrEtQu0=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ1p2SdreK+p3WL8/aNd9JN2a4x1X3ralpXS7Gl+/lNJmL
 k3R7N5ORmMWBkYuBlkxRRafgpapMZuSwz7smFoPM4iVCWQKAxenAEzEwJv9n3li0aWA3K/6N9xM
 EoOvlEkIat2/UHLc6os7d23giXS2d2Ld9gmvJ8ZwSXkrNMxnfRwpqbA0a4Ud/zlBn1krzrk/k2r
 Zo1Lq/KxQdu38xwXZJvE7PqT65v46nb1On4nh7h6RGy/PanHr9FYuDXpdFhPO7bfLVY71+/U7k/
 SdrZ/UcXx54M0juvuBnvv8zddznZJyQplCvRSWeLVqBJxKCJjl46SdfUmn0OLb5TP8/lZT5OM9X
 jJ5FhaVanNwnzIxW/LlfbaIYUdqhqmVyLesnGlxM56kszz8xyVgOX39g7KFvvsCfMJXpOZ6aBhy
 BD8w9zp70inj+77Z4hqT1rtOr89enrBx5qyqNJff9wA=
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

The dpu_crtc_atomic_check() already calls the function
_dpu_crtc_check_and_setup_lm_bounds().  There is no need to call it
again from dpu_crtc_atomic_begin().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index b0d81e8ea765..5dbf5254d310 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -809,8 +809,6 @@ static void dpu_crtc_atomic_begin(struct drm_crtc *crtc,
 
 	DRM_DEBUG_ATOMIC("crtc%d\n", crtc->base.id);
 
-	_dpu_crtc_check_and_setup_lm_bounds(crtc, crtc->state);
-
 	/* encoder will trigger pending mask now */
 	drm_for_each_encoder_mask(encoder, crtc->dev, crtc->state->encoder_mask)
 		dpu_encoder_trigger_kickoff_pending(encoder);

-- 
2.39.2

