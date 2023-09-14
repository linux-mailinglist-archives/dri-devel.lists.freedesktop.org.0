Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA4579F9D0
	for <lists+dri-devel@lfdr.de>; Thu, 14 Sep 2023 07:07:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AE2610E4FB;
	Thu, 14 Sep 2023 05:07:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E89610E4F7
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Sep 2023 05:07:11 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2bcb50e194dso8080591fa.3
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Sep 2023 22:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694668029; x=1695272829; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R10mXVtDMcWIBom4B4RANApmxfehNpaKxAb93aUCAhw=;
 b=nWibQ5VSvFQi8FaqiSQ2jXx3B43Fbw6EBPnQcLc9IHwNzJsRpBcDmTXbcF5blbDWzU
 LUZ51iX2WLhipFS6M0vi+hkru70iqrXaS58E/CkK3J1mx7zJlqQyIX/DrzzHpJeqvoi6
 8lFXLX4V1hlif0pKlsvHml/OPJPYIftW6B5tIaaweWUxNFO00Wv9CA1cnD4nE4ruK/8L
 atjdHLiZT1+I7G3XjMLx1PeNmSzMju70Htwcdr0HYRK4WvdEHg75/1+xxqfg++yMBb/G
 5Et9ME9uxlcbtKPGgDs8aEcA6BkbE2GJLGspDTuI0N1ysb4aBfH4sf8O9vy/MUIEZPHb
 JFeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694668029; x=1695272829;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R10mXVtDMcWIBom4B4RANApmxfehNpaKxAb93aUCAhw=;
 b=uAWEBD8gKPlGicvgPgfOD3tl/fnHw8bJHFkkYNpwFZrUcqdhfV3A6Kqr0/+VZf7RSg
 AKZ3wEoZbZQEOYMKaini+FM3O/DhgPl2m7n5aU8wclQQlAqM7rbVDe5emHILMYF3kN7P
 nyURaA4QvWm+JFUR0R7EjIHzZM3ZdWz9wxjJO/wfkNklCF7jD1gDYXmlZMGIieUTUJvX
 8ZVQ6/DBRYfjPH4Y7gCtJwUCHfd8j7JkA87h1vcTWUgNt7SwpXcSLjXnlZr4P5WpQ+Op
 AjHLE6d1k6e3jWA+Hhb/eFS9Amoo3KNXK7DqPmDJllr6g5ljkaMfWXp4GruqkS3CSlQQ
 RQJw==
X-Gm-Message-State: AOJu0Yy3PXgc5un9PFJpsalbcnhxONq/9TjDUbVm1clhXM12xWQ78Ho7
 DspZRUce5ip7AywjBDMmL75AMZd6wRtZutb+PT4=
X-Google-Smtp-Source: AGHT+IHnihmtc2vsv5dhrZBDc8UMldl6OVUIYcXEBdHEa7UfMhDIENjazXuDNb321U3p6nkW1W1rlA==
X-Received: by 2002:a2e:98d7:0:b0:2b9:48f1:b195 with SMTP id
 s23-20020a2e98d7000000b002b948f1b195mr3853326ljj.44.1694668029333; 
 Wed, 13 Sep 2023 22:07:09 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 y15-20020a2e978f000000b002bce38190a3sm124777lji.34.2023.09.13.22.07.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Sep 2023 22:07:08 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v3 02/12] drm/msm/dpu: add current resource allocation to
 dumped state
Date: Thu, 14 Sep 2023 08:06:56 +0300
Message-Id: <20230914050706.1058620-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230914050706.1058620-1-dmitry.baryshkov@linaro.org>
References: <20230914050706.1058620-1-dmitry.baryshkov@linaro.org>
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

Provide atomic_print_state callback to the DPU's private object. This
way the debugfs/dri/0/state will also include RM's internal state.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c |  4 +++
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h |  2 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c  | 48 +++++++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h  |  8 +++++
 4 files changed, 62 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index ee84160592ce..172b64dc60e6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -362,6 +362,7 @@ static void dpu_kms_global_destroy_state(struct drm_private_obj *obj,
 static const struct drm_private_state_funcs dpu_kms_global_state_funcs = {
 	.atomic_duplicate_state = dpu_kms_global_duplicate_state,
 	.atomic_destroy_state = dpu_kms_global_destroy_state,
+	.atomic_print_state = dpu_rm_print_state,
 };
 
 static int dpu_kms_global_obj_init(struct dpu_kms *dpu_kms)
@@ -375,6 +376,9 @@ static int dpu_kms_global_obj_init(struct dpu_kms *dpu_kms)
 	drm_atomic_private_obj_init(dpu_kms->dev, &dpu_kms->global_state,
 				    &state->base,
 				    &dpu_kms_global_state_funcs);
+
+	state->rm = &dpu_kms->rm;
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
index ed549f0f7c65..dd2be279b366 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
@@ -130,6 +130,8 @@ struct vsync_info {
 struct dpu_global_state {
 	struct drm_private_state base;
 
+	struct dpu_rm *rm;
+
 	uint32_t pingpong_to_enc_id[PINGPONG_MAX - PINGPONG_0];
 	uint32_t mixer_to_enc_id[LM_MAX - LM_0];
 	uint32_t ctl_to_enc_id[CTL_MAX - CTL_0];
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index f9215643c71a..5e3442fb8678 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -652,3 +652,51 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
 
 	return num_blks;
 }
+
+void dpu_rm_print_state(struct drm_printer *p,
+			const struct drm_private_state *state)
+{
+	const struct dpu_global_state *global_state = to_dpu_global_state(state);
+	const struct dpu_rm *rm = global_state->rm;
+	int i;
+
+	drm_puts(p, "pingpong:");
+	for (i = 0; i < ARRAY_SIZE(global_state->pingpong_to_enc_id); i++)
+		if (rm->pingpong_blks[i])
+			drm_printf(p, " %d,", global_state->pingpong_to_enc_id[i]);
+		else
+			drm_puts(p, " -,");
+	drm_puts(p, "\n");
+
+	drm_puts(p, "mixer:");
+	for (i = 0; i < ARRAY_SIZE(global_state->mixer_to_enc_id); i++)
+		if (rm->mixer_blks[i])
+			drm_printf(p, " %d,", global_state->mixer_to_enc_id[i]);
+		else
+			drm_puts(p, " -,");
+	drm_puts(p, "\n");
+
+	drm_puts(p, "ctl:");
+	for (i = 0; i < ARRAY_SIZE(global_state->ctl_to_enc_id); i++)
+		if (rm->ctl_blks[i])
+			drm_printf(p, " %d,", global_state->ctl_to_enc_id[i]);
+		else
+			drm_puts(p, " -,");
+	drm_puts(p, "\n");
+
+	drm_puts(p, "dspp:");
+	for (i = 0; i < ARRAY_SIZE(global_state->dspp_to_enc_id); i++)
+		if (rm->dspp_blks[i])
+			drm_printf(p, " %d,", global_state->dspp_to_enc_id[i]);
+		else
+			drm_puts(p, " -,");
+	drm_puts(p, "\n");
+
+	drm_puts(p, "dsc:");
+	for (i = 0; i < ARRAY_SIZE(global_state->dsc_to_enc_id); i++)
+		if (rm->dsc_blks[i])
+			drm_printf(p, " %d,", global_state->dsc_to_enc_id[i]);
+		else
+			drm_puts(p, " -,");
+	drm_puts(p, "\n");
+}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
index 2b551566cbf4..913baca81a42 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
@@ -92,6 +92,14 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
 	struct dpu_global_state *global_state, uint32_t enc_id,
 	enum dpu_hw_blk_type type, struct dpu_hw_blk **blks, int blks_size);
 
+/**
+ * dpu_rm_print_state - output the RM private state
+ * @p: DRM printer
+ * @state: private object state
+ */
+void dpu_rm_print_state(struct drm_printer *p,
+			const struct drm_private_state *state);
+
 /**
  * dpu_rm_get_intf - Return a struct dpu_hw_intf instance given it's index.
  * @rm: DPU Resource Manager handle
-- 
2.39.2

