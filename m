Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D159AF607
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 02:20:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ACCE10E03F;
	Fri, 25 Oct 2024 00:20:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="xUqi7IyA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDE1210E9C1
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 00:20:18 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-539983beb19so1935979e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2024 17:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729815617; x=1730420417; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=JazWMIkVQS8p1EyDaDe3Z84iDsKuOpFQiDqKXM3qNvI=;
 b=xUqi7IyAQhTykw/7TubfUWhQu+KymUCSzMYiiOFgsYcCLyLolq2I31z15/m8ZOG1+Z
 ncm56uUrAd4jCjGGQPp1oZu559n/mPa1mTMX4PaPA9jkTTQfo4h7Y8x6JoVqZIOU64RH
 H9EE1UV6X6eNWCBdLmnPB5OB5xbuSVV1ICaaFe6AFrxF4w6RlLUUEdyRNUsc5HAqRqXd
 t/rX17NpepR5DfLCpEOhLWbvGxBrEwBp+6XRWZT6IQPbSkF9//1gP4YH1pJtHrnw876Z
 3sK+71E1duEsGnhUwbKXrVdXwg3Gu2190aDU4mnRNUORbohUOQuq/ZkrWw8BxtUqw9nh
 uBqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729815617; x=1730420417;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JazWMIkVQS8p1EyDaDe3Z84iDsKuOpFQiDqKXM3qNvI=;
 b=n2Vg/a0X5E6f08OwpKmqMhsaA3FAUppdNJekU3b2hLfxoKguAZc86h+7XV3KSdDPSA
 WZOGLplKCKhdUmppQZVUX7CYSVQoK7qGsaWUcA4Kv50fn8s93mA2q9ZoWCHihoCB/Lf7
 Y3P1tmyvQnoNEi7YQV2rGnN74pHCa4yl10iLjXplHVogF1Xg8J/+24ot9xgDg7rVhpnv
 fN7H/sDko1K8yTGxfHajvveRU/X5UPqa/Un8PGgm2II6yuwyyYj9u/OU4WMrQcAADXgG
 moxWT44eKrJnpBlJLVAJ12pkakxfznJcxowgg/kov+02H7ZKi/GvLS/NzHZ7H1QTdYj+
 8NOQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVnNrDZW8OguN+M4vVk/rJNEfMe1kfhUeMNYXIYuPuc6p0LkN2fV+YPj2ebJX3fknfHQ7G5Ydj+ZSU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzAxmT9i3ZDmDcp6eqd8dbCNAt7RQF8XKLjRWq9f3JEI3e631NT
 IOw26jM+wlUeu85RktKM6lEAjXkZvnjQbFoIWdZEiiq4GgbcLQ8vSbEZhzcDs/E=
X-Google-Smtp-Source: AGHT+IH4ihiQHJARiTWnfLQwFkyVcMpyXvC7EwdHVpv5nSyfcZCcySDU5vmWQQTKvV5ZfTfcCAMgCA==
X-Received: by 2002:a05:6512:10c7:b0:539:e023:8fce with SMTP id
 2adb3069b0e04-53b1a2facb6mr4665041e87.12.1729815616586; 
 Thu, 24 Oct 2024 17:20:16 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53b2e1b05b3sm6227e87.161.2024.10.24.17.20.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2024 17:20:16 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 25 Oct 2024 03:20:09 +0300
Subject: [PATCH v6 2/9] drm/msm/dpu: move pstate->pipe initialization to
 dpu_plane_atomic_check
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-dpu-virtual-wide-v6-2-0310fd519765@linaro.org>
References: <20241025-dpu-virtual-wide-v6-0-0310fd519765@linaro.org>
In-Reply-To: <20241025-dpu-virtual-wide-v6-0-0310fd519765@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2729;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=PHJ6sTq6uvNcQ3gChU8Ct2HDM9wv2LQmbjOrC4ORXdI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnGuQ6hQho0KIgBTBFvj9q6BbQKv0Gp3wic2CJz
 SwNl9VOghaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZxrkOgAKCRCLPIo+Aiko
 1UgnB/4lW/gdxBKLrIy5SBKyqWzevme3eymEBo8+UbDaxqGVnggcx0aM3CP9kZvr0Ii5OvjBcvf
 0fSlCwZh/tVpiyYOw+1/ZTNRm7qxPE9FSWmL5GCK0kOeYQ+sPmyHP7kB09bWO8lLVYkJ1srq1WK
 0XU9iMZHCM+ZKo00OqpFD3Nw6lhKdSvqauT2HRfoYmhOkTl+DokoGE5EIOW5CwQ97/9xD3I/X6F
 0ZBtfkevH5jV4TlTLyUTvnulTMNGBFWdFwZe3igUVvKuTCJt+PzzxmCe5+LmW2iZrPMq51iozPO
 7HnoidCOp3JT5A2rfeMCr2jvND7ccagqEPRH7j1IHvNb2/XU
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

In preparation for virtualized planes support, move pstate->pipe
initialization from dpu_plane_reset() to dpu_plane_atomic_check(). In
case of virtual planes the plane's pipe will not be known up to the
point of atomic_check() callback.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 25 +++++++++++--------------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 37faf5b238b0..725c9a5826fd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -797,13 +797,22 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 	uint32_t max_linewidth;
 	unsigned int rotation;
 	uint32_t supported_rotations;
-	const struct dpu_sspp_cfg *pipe_hw_caps = pstate->pipe.sspp->cap;
-	const struct dpu_sspp_sub_blks *sblk = pstate->pipe.sspp->cap->sblk;
+	const struct dpu_sspp_cfg *pipe_hw_caps;
+	const struct dpu_sspp_sub_blks *sblk;
 
 	if (new_plane_state->crtc)
 		crtc_state = drm_atomic_get_new_crtc_state(state,
 							   new_plane_state->crtc);
 
+	pipe->sspp = dpu_rm_get_sspp(&kms->rm, pdpu->pipe);
+	r_pipe->sspp = NULL;
+
+	if (!pipe->sspp)
+		return -EINVAL;
+
+	pipe_hw_caps = pipe->sspp->cap;
+	sblk = pipe->sspp->cap->sblk;
+
 	min_scale = FRAC_16_16(1, sblk->maxupscale);
 	ret = drm_atomic_helper_check_plane_state(new_plane_state, crtc_state,
 						  min_scale,
@@ -820,7 +829,6 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 	pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
 	r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
 	r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
-	r_pipe->sspp = NULL;
 
 	pstate->stage = DPU_STAGE_0 + pstate->base.normalized_zpos;
 	if (pstate->stage >= pdpu->catalog->caps->max_mixer_blendstages) {
@@ -1286,7 +1294,6 @@ static void dpu_plane_reset(struct drm_plane *plane)
 {
 	struct dpu_plane *pdpu;
 	struct dpu_plane_state *pstate;
-	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
 
 	if (!plane) {
 		DPU_ERROR("invalid plane\n");
@@ -1308,16 +1315,6 @@ static void dpu_plane_reset(struct drm_plane *plane)
 		return;
 	}
 
-	/*
-	 * Set the SSPP here until we have proper virtualized DPU planes.
-	 * This is the place where the state is allocated, so fill it fully.
-	 */
-	pstate->pipe.sspp = dpu_rm_get_sspp(&dpu_kms->rm, pdpu->pipe);
-	pstate->pipe.multirect_index = DPU_SSPP_RECT_SOLO;
-	pstate->pipe.multirect_mode = DPU_SSPP_MULTIRECT_NONE;
-
-	pstate->r_pipe.sspp = NULL;
-
 	__drm_atomic_helper_plane_reset(plane, &pstate->base);
 }
 

-- 
2.39.5

