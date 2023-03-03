Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EFADA6A97E9
	for <lists+dri-devel@lfdr.de>; Fri,  3 Mar 2023 13:58:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9FC310E5FC;
	Fri,  3 Mar 2023 12:57:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 120E410E5D6
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Mar 2023 12:57:30 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id d36so304823lfv.8
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Mar 2023 04:57:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yt62C7qHhet0eDGfwuI4lO3fuOx6eMbCxLDhsjhMDQw=;
 b=WcrwNiIIqSi2xnBKQkK9+JVXuLosMGBcwngfzRheEFP+bghiuNx3TV3NAypJzkHVUM
 lrMiUuOE715b1j3JVht0E8yfRJsyKWfRLlrJgNmMJ3+D15b2O9S3PbLangwlY1k8vb5D
 HBDYl2fd/OeZYmR93rB4wjsVrWyXHhDPfS6gaNp+XtF/AkSV0HRVGlZD6kd6ZaFF6mV0
 xrbJ8kxzpfRu1RSmcA2gjt7Qdi0EB/s2jycageL6fGfGVBOd/lWBmMGiDUhslFWjylv9
 5hudmGjUCs8PoRs34WPppvL3GmTGLCs0ys+9jlB5nSKiV2a/Gr5IBhYjjfowq7g6jVaw
 bn9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yt62C7qHhet0eDGfwuI4lO3fuOx6eMbCxLDhsjhMDQw=;
 b=GgZMu4RihBaMS6+ltQ/gl0QCN0Nsl8vLi5cxdybMduZk+9YcNLB8Aj3oXb/nWLmuFq
 2NtCqPkBZl4CNR/2Sf98vLk4EUIxRs1tUmd3I/VmWnrpvIGPyar+/xsYRRIAKOfc2jeF
 EY/zpZSmr9pMeahee1y+W7qqiW/upgEYX3ylM5M1Th7skaefyKM4LhSfR8dWNVFC2WDY
 BEBcxo9Wkkyiu+sPbBf7NrZTLPUNZwGMsJ5hhEvIyo9lDQMRWaDVi/50HOrnetQ6k0cF
 JPBek7ItpdO5cJMSRLKiM1/noa5Gs8/g9rIJJgkbwcnhWZObnCgJjrWWsHpLM4NERXC5
 Z46w==
X-Gm-Message-State: AO0yUKW5lV+LdKEsOf5eKyT4OZxeab/CiGwOuxOn6a6h+MQTWiLKDs08
 0u2W1puJQ2agdJK7xCKBt5uURQ==
X-Google-Smtp-Source: AK7set9WXEHTTIfOlH4/M39O1CsRskZdSYbVsVVtDy26H0V1QoYM3D9Mmui9j0vsrKc9xCnU2tlvyw==
X-Received: by 2002:ac2:514f:0:b0:4b5:61c5:8927 with SMTP id
 q15-20020ac2514f000000b004b561c58927mr505321lfd.42.1677848248202; 
 Fri, 03 Mar 2023 04:57:28 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 c5-20020ac25305000000b004cf07a0051csm379266lfh.228.2023.03.03.04.57.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 04:57:27 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v4 03/30] drm/msm/dpu: move SSPP debugfs creation to dpu_kms.c
Date: Fri,  3 Mar 2023 14:56:58 +0200
Message-Id: <20230303125725.3695011-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230303125725.3695011-1-dmitry.baryshkov@linaro.org>
References: <20230303125725.3695011-1-dmitry.baryshkov@linaro.org>
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
index a683bd9b5a04..0d2ef83c38ea 100644
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
2.39.2

