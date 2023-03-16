Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5426BD4FB
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 17:17:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 669B610ED57;
	Thu, 16 Mar 2023 16:17:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11C9310E227
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 16:16:59 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id h9so2276094ljq.2
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 09:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678983417;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GJsFBX78us0ytWSzoOjbwcL92MtU2RJHJdypdpisobI=;
 b=kOI6qcFtjwmkIppT1ey6n2x86D9cGLgzYaW+wdh0c7FuE68Rej/ijA80moZwhE8dKC
 rv64NNyrfYGaJI3sI5tU4QNO8vigvA82JC9H/2EJd3+lOZ/y16tf7nUlA+0s8/4/b0bh
 t7K3pl3IkrfCrbeK3/r5jajEQBDNvReZWWI+5dREF5BVhp2a/m3PmDWLXdaz1ADTHpAK
 S+40CEfQfMBSlS/AVIm8MLAHy7JmimbmLhDKkv9hmsGqhMihAM4zTJ+1rCthVuQ66MG8
 UTqeMFh5hSJMYrDQAbnnDsy5XkkCxF26r+aI9xLjrdYHFaLr2OGJuG753SXoCtKS65gO
 BNeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678983417;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GJsFBX78us0ytWSzoOjbwcL92MtU2RJHJdypdpisobI=;
 b=6yBSVeHDBBQyg9TTAbiqBNg4iC+FVofpdXdUWyiUqeOwx0g46UrYkxd3xfmhaxq8/+
 W9P18UgOfKnukyRpI9RaU/mL3hCmYaGvzLFu2xmnC5z9dzytme4CB1M3HWYrkigF1WTB
 C/b86+1RPkdVfXwVJFSccwHn/f7kSMoeH7X92VRvw/TmDiTAwBLSEWXm63k4zVBiJwIp
 namVSJXzATzPkbg02VDpCXvOXbJoLnc56/ovet7yIehERB6irs6ku2shn4d7afTqVkEj
 WtlTI1yM//vLV7unhH4u4qRS+3U7QWL7hISwD9fFoNevx+3naziG/uNK5uFBozRQKP+T
 ZSUA==
X-Gm-Message-State: AO0yUKVmopt9GKjfx4JWMrM8Jd/duoCkxIO0z5SmVkN9CSVmElgLWc0b
 i1g7HgEIQjYoxjbyLFbKPNNTSA==
X-Google-Smtp-Source: AK7set9X5x865vCAPn6ekuyKh4bV0jfXl16YT8HXyct3mwX63hVs9oIi3x2kgZhFc8bcoRhme7NexQ==
X-Received: by 2002:a2e:9502:0:b0:298:a77b:7c18 with SMTP id
 f2-20020a2e9502000000b00298a77b7c18mr2197627ljh.19.1678983417393; 
 Thu, 16 Mar 2023 09:16:57 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 l2-20020a2e8342000000b00298b33afe1csm549152ljh.87.2023.03.16.09.16.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Mar 2023 09:16:56 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v7 03/32] drm/msm/dpu: move SSPP debugfs creation to dpu_kms.c
Date: Thu, 16 Mar 2023 19:16:24 +0300
Message-Id: <20230316161653.4106395-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230316161653.4106395-1-dmitry.baryshkov@linaro.org>
References: <20230316161653.4106395-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As SSPP blocks are now visible through dpu_kms->rm.sspp_blocks, move
SSPP debugfs creation from dpu_plane to dpu_kms. We are going to break
the 1:1 correspondence between planes and SSPPs, so it makes no sense
anymore to create SSPP debugfs entries in dpu_plane.c

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Tested-by: Abhinav Kumar <quic_abhinavk@quicinc.com> # sc7280
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h |  1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 18 ++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 16 ----------------
 3 files changed, 18 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
index bbff908e6dbe..c30f168b6c0a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
@@ -388,7 +388,6 @@ struct dpu_hw_sspp *dpu_hw_sspp_init(enum dpu_sspp idx,
  */
 void dpu_hw_sspp_destroy(struct dpu_hw_sspp *ctx);
 
-void dpu_debugfs_sspp_init(struct dpu_kms *dpu_kms, struct dentry *debugfs_root);
 int _dpu_hw_sspp_init_debugfs(struct dpu_hw_sspp *hw_pipe, struct dpu_kms *kms,
 			      struct dentry *entry);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 681dd2e0c7e8..35194262e628 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -250,6 +250,24 @@ void dpu_debugfs_create_regset32(const char *name, umode_t mode,
 	debugfs_create_file(name, mode, parent, regset, &dpu_regset32_fops);
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
+		struct dpu_hw_sspp *hw = dpu_rm_get_sspp(&dpu_kms->rm, i);
+
+		if (!hw)
+			continue;
+
+		_dpu_hw_sspp_init_debugfs(hw, dpu_kms, entry);
+	}
+}
+
 static int dpu_kms_debugfs_init(struct msm_kms *kms, struct drm_minor *minor)
 {
 	struct dpu_kms *dpu_kms = to_dpu_kms(kms);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index b054055f120b..2b0ebdd4c207 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1399,22 +1399,6 @@ void dpu_plane_danger_signal_ctrl(struct drm_plane *plane, bool enable)
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
2.30.2

