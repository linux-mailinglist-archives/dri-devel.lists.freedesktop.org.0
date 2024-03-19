Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE38D87FEA8
	for <lists+dri-devel@lfdr.de>; Tue, 19 Mar 2024 14:22:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECF4910F889;
	Tue, 19 Mar 2024 13:22:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="VbVSn0Yd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C8B310FA8F
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Mar 2024 13:22:09 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-2d21cdbc85bso80244131fa.2
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Mar 2024 06:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710854527; x=1711459327; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=wkg7d4NEsh9ZC2iGh7MvW0HxBI7EYVmrRUBe6AkB3qo=;
 b=VbVSn0Yd1D+y9FJsY2W9dyikTCK4usHfi/+3VekiZI7FP7u8FnfP1t2hwQ84S+y9E3
 ypUgEsMvPI9ljLahwK8ZZkM9T4rAxlGSiHyjzy+9NO1ckNXwo48hVHwPvlzPtcs8LvAR
 saAWPwFkXgI3zaVBgqRUlqr0PdogEz1oYTw2+nEjuCChhMqu7pwoprwFGSp24FZ45LAN
 V/EzhLqV/4hnbkWltkeYkdqvSvv7SAqA1q4NHvnt66DI46LofM7E0+3nUMq8smaBt7vc
 ExxHml91S6XMzk1nrZNiiNF4flZlxRxFiFMoZPxKlmYUduRS8jH1ZZneR7alINiajHUi
 TASQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710854527; x=1711459327;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wkg7d4NEsh9ZC2iGh7MvW0HxBI7EYVmrRUBe6AkB3qo=;
 b=ptpxn64bVKdL1J21cNHBcZaq0ZuiZyJH2hB4h8uJLV0FHQNaoa3DI54uZPZcoNpo6C
 FVngThH6g7tYkaZMa+oc+AxnulR2fvYmiyIYh4RmngE7bc4FeVXpSVBF2EE8prrnSIJG
 9ZDHpxUHWbreI8dVH97pgElbgtSLiYf1LwTEsxXnrg6D5ZDC+iCJO4HXDzdq7EVqsvbn
 /6eTexpN6mGOetQqaH0tjDKAguWvvlgUVZjwkt7ayyIigGwUGreFdbj6thJxjs7HTKMP
 IvmC6Ijl4GR42NhrQ9xf32OTLxAq3zr8WA+8Z308vvsHbsVatC+PPuii+nJTdoo9E91e
 IlUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1M9aQCsY7N8pBg+Rtse7Hn/RxpmF2z/u50HdnC5pS6gznICsgze1tXR17vNGKYHYzwkL79r8PDctv1UUJIJLv2A61GRRvNnUleon5VR8+
X-Gm-Message-State: AOJu0YyB3W4QvkZWuuB69y2+UCtQfPQOiVxdJWC/EClTmxFqMso4vK/g
 Jkd1zlvdIPCPKJhYeuHWneH8B5s97Qup39Hp+5AkQ5Ctf+wPHHt/7NrJSCw6lWG2vNV8QpLQhEc
 A
X-Google-Smtp-Source: AGHT+IEJOSkP21SWHRkBvJ/gKsHTLI5anClFTAmbFaNnG1iFr5mCTdKzmhe08eHXXq4zyTwWZ0jxkw==
X-Received: by 2002:a2e:2c16:0:b0:2d2:c83c:ffd7 with SMTP id
 s22-20020a2e2c16000000b002d2c83cffd7mr7540374ljs.42.1710854527250; 
 Tue, 19 Mar 2024 06:22:07 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 j7-20020a2e3c07000000b002d435cdf2adsm1826148lja.111.2024.03.19.06.22.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Mar 2024 06:22:06 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 19 Mar 2024 15:22:04 +0200
Subject: [PATCH 6/9] drm/msm/dpu: drop call to _dpu_crtc_setup_lm_bounds
 from atomic_begin
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240319-dpu-mode-config-width-v1-6-d0fe6bf81bf1@linaro.org>
References: <20240319-dpu-mode-config-width-v1-0-d0fe6bf81bf1@linaro.org>
In-Reply-To: <20240319-dpu-mode-config-width-v1-0-d0fe6bf81bf1@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=893;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=PZaux6GZliSItAtHMhFoC7Cv0J9bBbkhdS1XTU0uAuA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl+ZF402eopG0n4dj6mj2TTriwPmVKnm7MzvpNe
 nYDXVJUWRqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZfmReAAKCRCLPIo+Aiko
 1ToOB/47+iGOOAdfofKqOyaIgByjkF+X12vvIEhw8fXNxKwKiC1DATubjzcO1vVMqhlvU73a628
 D2mI0z46D3oOBvpK32SEd9U9piZ/C+/WZ3dwarCmbryFKCi9+qWkIl6gRpx8R0qJsh7GZgTaKOG
 OAqr0z6gDgA14ot0s2Kp2oosgrpzDswzxLwGbbOGMux9slgPkVc+qzHaUTHb5cq+BBbuSEizmpU
 svixizDtZAx4n3YgIP2354yq9CN1vr+y00OyylH5yYtme1KJkLgD+msS3rP2729d0rXWNKPkpk4
 sm9qx+Q3yfzUA2l0+V7FbNiXmXvnqOlidDshrEG0bSZD+Yrv
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

The dpu_crtc_atomic_check() already calls _dpu_crtc_setup_lm_bounds().
There is no need to call it from dpu_crtc_atomic_begin().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 88c2e51ab166..64befead366f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -803,8 +803,6 @@ static void dpu_crtc_atomic_begin(struct drm_crtc *crtc,
 
 	DRM_DEBUG_ATOMIC("crtc%d\n", crtc->base.id);
 
-	_dpu_crtc_setup_lm_bounds(crtc, crtc->state);
-
 	/* encoder will trigger pending mask now */
 	drm_for_each_encoder_mask(encoder, crtc->dev, crtc->state->encoder_mask)
 		dpu_encoder_trigger_kickoff_pending(encoder);

-- 
2.39.2

