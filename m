Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7B987B596
	for <lists+dri-devel@lfdr.de>; Thu, 14 Mar 2024 01:02:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E301510E754;
	Thu, 14 Mar 2024 00:02:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="j0/UZjwp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A05D210E18F
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Mar 2024 00:02:21 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-513a6416058so692551e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Mar 2024 17:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710374539; x=1710979339; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dRoAz+CmhNjrfdAdzTuoudY5YtPxIo6KTnpc/4/7Msk=;
 b=j0/UZjwpURoVV1Fk/Xj1apUcIwGF7AlKxYhCabbjno3cb0OZ6sXGbW9O7Xy3Vva2Hs
 n5iN6Xgp+k0BAWUNYxgDODibHrksVnkMXbQPBrZel1X3wdLOC/lXdUsmU48garMwYLBZ
 TcOdAg9cUZxdC+kia+DgQKK+2wA+KcvqKQZTS2MCBx3bnO6nc79fpw/Dph4MhrNcf9//
 gx0bvSGGrbuH8y0BI6OyvyxKXrRjTAddYvuyp/wGEJoAr2VRh89+c2gPiJfvP2iR4CGV
 5SRK6XDUg+KaJXrNtHM6qokB5MpSJlANUwEeOdZyJppiPvlxEqmrKYceAvxreu0jef5w
 tfzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710374539; x=1710979339;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dRoAz+CmhNjrfdAdzTuoudY5YtPxIo6KTnpc/4/7Msk=;
 b=raQavRfmV1YuEhB0peCRh0eMJB0Xawy9tXNdptez71GhQ4s2wxNWKpGcW16DLQJjuQ
 QiM1nviMoJmulosCfkssv2aYUjaTcSSuai0+rBqPhQGEXz3hovrFW76Qc3kIEB8Egtrk
 01aYPRGcv7rJFA1elg2ijSKDQLPFOq+MP4qe/j3Z4lplliGDqHYeuh7bvFBug5itnQEo
 SCnJp0emfyPTjMCAomezNzCD3LA1ESUnxZotewAFsqZhZGLW+6N0rqns9ca7+9fxCULi
 7nRLCbMvDHyvTk6GgExlOmUkZlsBgrzyOK3u+QGJVJFZSCy6dI4mHGBUmc3ChdceKsWz
 Wh3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUESwlRje+77MBEjJMH9cSJKIw7R4+KrfhyjCRWFNZRukzuodx0l+wlqgfVvsISmLd8zPEFXdEbPU40TZ63UzlAwpKkPhIiHw6u1ZovbkaM
X-Gm-Message-State: AOJu0YwWMt6Ym6CJWCp2Cx/9hwoSNU6VZUDHJXA8m9p3oriwTDrv11Wf
 UI7MA5KWaPmQaVSMZHpveWGQvGA9ymArmlUM2iE8WRh51Iry8Lo77Ow8C0R6VRI=
X-Google-Smtp-Source: AGHT+IFof1jodr968Rtad36DFoDLNMwGgycfHRg3fwZPFnqXAtPT2DoN1hDgJKoSQ6oe2hRjTrQBmw==
X-Received: by 2002:a05:6512:54e:b0:513:c17b:1426 with SMTP id
 h14-20020a056512054e00b00513c17b1426mr51650lfl.11.1710374539755; 
 Wed, 13 Mar 2024 17:02:19 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 x5-20020a19e005000000b00513360ebd22sm46111lfg.118.2024.03.13.17.02.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Mar 2024 17:02:19 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: Stephen Boyd <swboyd@chromium.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: [PATCH v4 02/13] drm/msm/dpu: use drm_rect_fp_to_int()
Date: Thu, 14 Mar 2024 02:02:05 +0200
Message-Id: <20240314000216.392549-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240314000216.392549-1-dmitry.baryshkov@linaro.org>
References: <20240314000216.392549-1-dmitry.baryshkov@linaro.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use the drm_rect_fp_to_int() helper instead of using the hand-written
code.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 44f35ae09ba6..9c52fe3c0261 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -837,13 +837,8 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 		return -EINVAL;
 	}
 
-	pipe_cfg->src_rect = new_plane_state->src;
-
 	/* state->src is 16.16, src_rect is not */
-	pipe_cfg->src_rect.x1 >>= 16;
-	pipe_cfg->src_rect.x2 >>= 16;
-	pipe_cfg->src_rect.y1 >>= 16;
-	pipe_cfg->src_rect.y2 >>= 16;
+	drm_rect_fp_to_int(&pipe_cfg->src_rect, &new_plane_state->src);
 
 	pipe_cfg->dst_rect = new_plane_state->dst;
 
-- 
2.39.2

