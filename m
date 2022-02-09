Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2EF4AF829
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 18:26:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8691F10E474;
	Wed,  9 Feb 2022 17:25:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E43B810E3E7
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 17:25:34 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id h8so2344080lfj.10
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Feb 2022 09:25:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MG3zuJRQr0/11wQ3yzupBhlp7+IP6nsyDfHf4irQxtY=;
 b=u5qfYP9TDVSTY4earvH1yPKWmkiPqVvTc49fKYcLElCuaeeEa5+4i4BeQ5HWjhyK7J
 Dgh+bG0HhXimVWD+hufvDQLsxUG22MPfk4yPF+BtgZFn+EyliSvMaf2cycyH7qNBifVr
 z9phkN3FawAzNkDcpdTkfw6U+ImxQTr1Stfoq6sNPqhgsonNwkVZukcAseHoExVKx3EH
 FjbvEuAD6DdN3yXWtUiFRvhZM6cVnzU0TlvWAw4WRD40gYIOdMRqFHAF8KKeyQdKKdWy
 lyJeWTVbY4Hd9gWNXDaM4wNsg/26xjy2uJvpt3mz1uaMdMsG5kZ9i8DUsuLIV0rkUu/W
 CyMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MG3zuJRQr0/11wQ3yzupBhlp7+IP6nsyDfHf4irQxtY=;
 b=zFWQomYE+kVAQs6MjYqKzShT3Q8OqJ5DJs3+kwxTAe+DxmEFTGLLmOoHdRi5dE/Pi7
 kcoIWJnhdQgE8wtjNm0aqf/AyFStZhVgIutLYjIibkTU+7DZ8RUX4c5gnY4BLVMFS3tX
 4HP5OdjXoZssEJ7e9asQyFkuaPVIIhPCWCUG7F3HNMqffJPNwiV2qJpwZch+EB9Uzd5W
 OlCWKV0Aul4GO+HVXrtrRstU6F6A4lchBCaEHiI/mEWmHXZaQaUSEuaQAGMDkDm/qIpz
 FfSdFi03q/4pqqKun//A4oqqZd9F88wdoSqEZHOs2ftQrvD1Xh+3UIkVlxxVs0FsBFw0
 MUxQ==
X-Gm-Message-State: AOAM533ykcafHNC+3Hlw2G5/s4e4IeIDu8iqHR1nyJ+1jhYPn0kW8osy
 SMAr/o9edrmyfZSAkpKkfCetEw==
X-Google-Smtp-Source: ABdhPJzkspnpj0RHn32D7wkua/6ALOhuUR/7ZzYarqohURMzFEL3aURJi+Dzg6eCk+O3QN1IBBJPpg==
X-Received: by 2002:a05:6512:114d:: with SMTP id
 m13mr2197256lfg.450.1644427533287; 
 Wed, 09 Feb 2022 09:25:33 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id u14sm2560055lji.40.2022.02.09.09.25.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 09:25:32 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 12/25] drm/msm/dpu: inline _dpu_plane_set_scanout
Date: Wed,  9 Feb 2022 20:25:07 +0300
Message-Id: <20220209172520.3719906-13-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220209172520.3719906-1-dmitry.baryshkov@linaro.org>
References: <20220209172520.3719906-1-dmitry.baryshkov@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In preparation to reworking dpu_plane_sspp_atomic_update() inline the
_dpu_plane_set_scanout() function.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 41 ++++++++++-------------
 1 file changed, 18 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index d029ce806039..3ce7dcc285e2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -490,28 +490,6 @@ static void _dpu_plane_set_qos_remap(struct drm_plane *plane)
 	dpu_vbif_set_qos_remap(dpu_kms, &qos_params);
 }
 
-static void _dpu_plane_set_scanout(struct drm_plane *plane,
-		struct dpu_plane_state *pstate,
-		struct dpu_hw_pipe_cfg *pipe_cfg,
-		struct drm_framebuffer *fb)
-{
-	struct dpu_plane *pdpu = to_dpu_plane(plane);
-	struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
-	struct msm_gem_address_space *aspace = kms->base.aspace;
-	int ret;
-
-	ret = dpu_format_populate_layout(aspace, fb, &pipe_cfg->layout);
-	if (ret == -EAGAIN)
-		DPU_DEBUG_PLANE(pdpu, "not updating same src addrs\n");
-	else if (ret)
-		DPU_ERROR_PLANE(pdpu, "failed to get format layout, %d\n", ret);
-	else if (pstate->pipe.sspp->ops.setup_sourceaddress) {
-		trace_dpu_plane_set_scanout(&pstate->pipe,
-					    &pipe_cfg->layout);
-		pstate->pipe.sspp->ops.setup_sourceaddress(&pstate->pipe, pipe_cfg);
-	}
-}
-
 static void _dpu_plane_setup_scaler3(struct dpu_hw_pipe *pipe_hw,
 		uint32_t src_w, uint32_t src_h, uint32_t dst_w, uint32_t dst_h,
 		struct dpu_hw_scaler3_cfg *scale_cfg,
@@ -1074,10 +1052,27 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 	const struct dpu_format *fmt =
 		to_dpu_format(msm_framebuffer_format(fb));
 	struct dpu_hw_pipe_cfg pipe_cfg;
+	struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
+	struct msm_gem_address_space *aspace = kms->base.aspace;
+	bool update_src_addr = true;
+	int ret;
 
 	memset(&pipe_cfg, 0, sizeof(struct dpu_hw_pipe_cfg));
 
-	_dpu_plane_set_scanout(plane, pstate, &pipe_cfg, fb);
+	ret = dpu_format_populate_layout(aspace, fb, &pipe_cfg.layout);
+	if (ret == -EAGAIN) {
+		DPU_DEBUG_PLANE(pdpu, "not updating same src addrs\n");
+		update_src_addr = false;
+	} else if (ret) {
+		DPU_ERROR_PLANE(pdpu, "failed to get format layout, %d\n", ret);
+		update_src_addr = false;
+	}
+
+	if (update_src_addr &&
+	    pipe->sspp->ops.setup_sourceaddress) {
+		trace_dpu_plane_set_scanout(pipe, &pipe_cfg.layout);
+		pipe->sspp->ops.setup_sourceaddress(pipe, &pipe_cfg);
+	}
 
 	pstate->pending = true;
 
-- 
2.34.1

