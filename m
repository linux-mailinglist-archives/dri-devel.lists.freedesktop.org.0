Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF424AF810
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 18:25:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51DBC10E3CE;
	Wed,  9 Feb 2022 17:25:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF68810E3E6
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 17:25:27 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id m18so5557640lfq.4
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Feb 2022 09:25:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tkfC5TUEm5vYZaztIKawUNBYYGPAof7pzxftrloc+wI=;
 b=LvUk4/uHqG/gKvS0PZOGMhkFtgMM9yc5eEz3ZqImdyu9B8PIxteNjz0eTBVxWBEDHx
 En/z4XAejrLOQyEIZHEE/IGyiGl2AgGh60Q+2iJCwwHjqNzrykbJQ/ZWQKHdBN9r5AiT
 dd+Tz3wMeMZ/HU/RzH52+nv7tqKG2V39N8pb5vtJQmlSMvrmpiKTmyg8XC6WO9ETy1K8
 t50lC1hQTcP4sRaxd1eQnHIi6DnfY+11NqzM4SfY4f9CTRZ3pUr6rtQZLpM0ntbRN61c
 17E8pBR00zaQZ75OURn4pBTn7Dvnckty4Aw7L+qmGMNVUU5lFoT3GJoBEAM5WkF68Rgo
 4QMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tkfC5TUEm5vYZaztIKawUNBYYGPAof7pzxftrloc+wI=;
 b=JkYydKdzYPY2VKqd0s3s6Bxe3MPj9ZOnjp+Pr2FdSsDSmHna8vcLliK81P1OHZEleb
 TrhMtFNjO9GmL7NRxb8toK+Ik5fiSrpLur34bRIV+9CHPqyAU/eDhBudoHWigvLcFZoO
 vR1aaxMyZBrYupXbrOQzWmrc3eNMe5PmYAEq1c4v3sZANqdB6RIS+YHro/RPbbka3zfS
 1KziEY3dKqocuYqYqK5MiI2jEX+/ezjIe/a2gASwbB37+hKvTWDbUq9+p4hKECtYIzfC
 re4VpSj9FnjF+cz+SeDBXBTvYN6ivYR01KhOD/bZmlBTEGg3OcJIsThzUGYyiFotrfli
 70Kw==
X-Gm-Message-State: AOAM531gM38gQCQgBHy4f+V+U0xo6UoVGtvYJL2WdJACFuRyz28Txlz5
 uyoHomGRUKorThF4Wsx0yYfngw==
X-Google-Smtp-Source: ABdhPJxFnSDUdeXlEr/gTiTZj/RrA+xjsQ81Wk8JIJ8mFzZkzyOgzgbB0nIhOdkcfDPYd7TFEmCXgw==
X-Received: by 2002:ac2:5dcb:: with SMTP id x11mr2235969lfq.254.1644427526198; 
 Wed, 09 Feb 2022 09:25:26 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id u14sm2560055lji.40.2022.02.09.09.25.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 09:25:25 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 04/25] drm/msm/dpu: move SSPP debugfs creation to dpu_kms.c
Date: Wed,  9 Feb 2022 20:24:59 +0300
Message-Id: <20220209172520.3719906-5-dmitry.baryshkov@linaro.org>
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

As SSPP blocks are now visible through dpu_kms->rm.sspp_blocks, move
SSPP debugfs creation from dpu_plane to dpu_kms.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h |  1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 19 +++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 16 ----------------
 3 files changed, 19 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
index f805c30643b1..674f311f99b4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
@@ -415,7 +415,6 @@ struct dpu_hw_pipe *dpu_hw_sspp_init(enum dpu_sspp idx,
  */
 void dpu_hw_sspp_destroy(struct dpu_hw_pipe *ctx);
 
-void dpu_debugfs_sspp_init(struct dpu_kms *dpu_kms, struct dentry *debugfs_root);
 int _dpu_hw_sspp_init_debugfs(struct dpu_hw_pipe *hw_pipe, struct dpu_kms *kms, struct dentry *entry);
 
 #endif /*_DPU_HW_SSPP_H */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 4d2b75f3bc89..8196b11fe2f3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -259,6 +259,25 @@ void dpu_debugfs_create_regset32(const char *name, umode_t mode,
 	debugfs_create_file(name, mode, parent, regset, &dpu_fops_regset32);
 }
 
+static void dpu_debugfs_sspp_init(struct dpu_kms *dpu_kms, struct dentry *debugfs_root)
+{
+	struct dentry *entry = debugfs_create_dir("sspp", debugfs_root);
+	int i;
+
+	if (IS_ERR(entry))
+		return;
+
+	for (i = SSPP_NONE; i < SSPP_MAX; i++) {
+		struct dpu_hw_pipe *pipe_hw;
+
+		if (!dpu_kms->rm.sspp_blks[i - SSPP_NONE])
+			continue;
+
+		pipe_hw = to_dpu_hw_pipe(dpu_kms->rm.sspp_blks[i - SSPP_NONE]);
+		_dpu_hw_sspp_init_debugfs(pipe_hw, dpu_kms, entry);
+	}
+}
+
 static int dpu_kms_debugfs_init(struct msm_kms *kms, struct drm_minor *minor)
 {
 	struct dpu_kms *dpu_kms = to_dpu_kms(kms);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 146dbccd79cd..37742f74a7bf 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1359,22 +1359,6 @@ void dpu_plane_danger_signal_ctrl(struct drm_plane *plane, bool enable)
 	_dpu_plane_set_qos_ctrl(plane, enable, DPU_PLANE_QOS_PANIC_CTRL);
 	pm_runtime_put_sync(&dpu_kms->pdev->dev);
 }
-
-/* SSPP live inside dpu_plane private data only. Enumerate them here. */
-void dpu_debugfs_sspp_init(struct dpu_kms *dpu_kms, struct dentry *debugfs_root)
-{
-	struct drm_plane *plane;
-	struct dentry *entry = debugfs_create_dir("sspp", debugfs_root);
-
-	if (IS_ERR(entry))
-		return;
-
-	drm_for_each_plane(plane, dpu_kms->dev) {
-		struct dpu_plane *pdpu = to_dpu_plane(plane);
-
-		_dpu_hw_sspp_init_debugfs(pdpu->pipe_hw, dpu_kms, entry);
-	}
-}
 #endif
 
 static bool dpu_plane_format_mod_supported(struct drm_plane *plane,
-- 
2.34.1

