Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2224C85A518
	for <lists+dri-devel@lfdr.de>; Mon, 19 Feb 2024 14:49:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1432410E1B8;
	Mon, 19 Feb 2024 13:48:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="rr8ZmuKG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC20410E1B8
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Feb 2024 13:48:54 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-512be6fda52so372743e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Feb 2024 05:48:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708350533; x=1708955333; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=41jhgkJJnbHhFKY32GcChRuzAwAisfLrI12T03vWSOI=;
 b=rr8ZmuKGkk9iTczVIsd+xefGPTlhZrQPHE2zyxz4aA4uClMurERFYarqCSZy2tHxca
 ZE4QoMI4uOX8ntUmzmW1A4G4mOXPfnN24sw/JFPmQ2753QeymLkMXM3aHQkN++N/1vu+
 oWNjJ6c4q271edYFqtVDvhf8MyqgmeHjRAakniJsitYPZG/HLcPnVq7SJxWebZURMrO3
 OL+BsQ+a9MaYvQU5ffkhKzvivgfEtya94axz+mONwVckRh7xP+muDNVUQ6NtElkOcXvQ
 YvW9mE0aRgPIzy3oIuKDgxwSfBMdFKSyfJWv1jxNyY5fCLa+s1wBGferH73qhQmliy18
 a6iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708350533; x=1708955333;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=41jhgkJJnbHhFKY32GcChRuzAwAisfLrI12T03vWSOI=;
 b=hBuoCG+IAGqCu3ID+LhRu5McbYXcY9a/rAIO+zOuHfjEbIOFM8Yls3r0IVnyui2ZyK
 DFDkZFaUZfOHPmx9zD+oH97VkCg2WZqz5FDizkOaJzEW+HOy33g6GeSlHH7GQUAuM74w
 3VQJdQBIiJ9Iw6R8dFLo0hf2Ck/OWr/ZPta8sw+6enTRFSJKIPeXj2FEeIyBG18RlWly
 xiSj1FS+KE195/0wb0zF6fQ94acLEamlZUpN0J/O5bkE4kwmUNF6In98iX5Nac6WalHv
 GobFdCKI0AtDGxfU6oa6KHdCTJF6PFFtJTs57ChNlE+2PBFnxW9cd7S9/Ii6J9FtJfzK
 4TpQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvvOdxgWiqFhe2VuVsV7q4V5CVH9kw8oFTo7D9/hB9P+UjVSQgxwgjxSzdcpKHIlXOprtDs6z5H5NkhQlOzdtwjgZx8N0pBLvCNn8v+5X6
X-Gm-Message-State: AOJu0YwHes6W1enqWNEzn+pDchiQ0uDHcLn58aUK8WhU/dgn5GCjWyJU
 U7nIF1AN6fVgpu99F3c907Ak12UvuFPOFlXbFhRq3PGEFgyk3xJ12lTwGnRErO4=
X-Google-Smtp-Source: AGHT+IEFlN2FFmNK5ETDbGZnhFmF7nAGdxZVUIsrTc008pmqF9SIV9SESU9HSHr/Zpi9woiM3mXFQg==
X-Received: by 2002:a05:6512:1290:b0:512:96dc:ab50 with SMTP id
 u16-20020a056512129000b0051296dcab50mr7821451lfs.20.1708350532717; 
 Mon, 19 Feb 2024 05:48:52 -0800 (PST)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 s19-20020a056512203300b0051172bf4e66sm925365lfs.74.2024.02.19.05.48.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Feb 2024 05:48:52 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 19 Feb 2024 15:48:51 +0200
Subject: [PATCH v4] drm/msm/dpu: add current resource allocation to dumped
 state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240219-fd-rm-state-v4-1-b47f14ef27c2@linaro.org>
X-B4-Tracking: v=1; b=H4sIAEJc02UC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyTHQUlJIzE
 vPSU3UzU4B8JSMDIxMDI0NL3bQU3aJc3eKSxJJU3aQUQyNDC0tTkyRzCyWgjoKi1LTMCrBp0bG
 1tQC0YenDXQAAAA==
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=5375;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=VxnAyfR+APi608UKnfr/bM0ytrt6MietQpC+Mr0o9kY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl01xEY9+WxUIUMmCJx3D5K3r0cYYidT51fB5e1
 J+8mwY9usyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZdNcRAAKCRCLPIo+Aiko
 1QnrB/9aLpcHx3ftsfHhlZa3upe2lPXy/KMYQQjzHbS9/Sahk3Huc1SVUSiKmjEJrtdi5JhmT/z
 Xb3ZFJtcYa4I4qZ1OfS77/ycyNfhqjp0KRAJde8MdIK0+aNGcqfAbHUQD9yij2bmw0592opV+mh
 uePr0eDyx1X68MMNk3ZsWf89K0h2mNBLREcerBhS51yDVdiB0vZwa6yicTqIXSoodqYsqDmkVGX
 zfvDN9xW0cQzg/5c3OiLdqd1hrGxQmMBXpCN8B9ubfCxGiIH3IIRD4U7oOWy9cpj7+8DrKlwGYX
 AZLUL4OvzYYNbMlmBVb0LH2EnSN4azNAeQvfjZ3UhnF5n0rP
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

Provide atomic_print_state callback to the DPU's private object. This
way the debugfs/dri/0/state will also include RM's internal state.

Example output (RB5 board, HDMI and writeback encoder enabled)

resource mapping:
	pingpong=31 36 0 0 0 0 - - - - -
	mixer=31 36 0 0 0 0 -
	ctl=0 0 31 36 0 0
	dspp=0 0 0 0
	dsc=0 0 0 0 - -
	cdm=0

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v4:
- Split the patch from the virual wide planes series
- Reworked the output format
- Added the CDM block into the dump
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 12 +++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h |  2 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c  | 55 +++++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h  |  8 +++++
 4 files changed, 77 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 723cc1d82143..9f3697e1eacb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -353,9 +353,18 @@ static void dpu_kms_global_destroy_state(struct drm_private_obj *obj,
 	kfree(dpu_state);
 }
 
+static void dpu_kms_global_print_state(struct drm_printer *p,
+				       const struct drm_private_state *state)
+{
+	const struct dpu_global_state *global_state = to_dpu_global_state(state);
+
+	dpu_rm_print_state(p, global_state);
+}
+
 static const struct drm_private_state_funcs dpu_kms_global_state_funcs = {
 	.atomic_duplicate_state = dpu_kms_global_duplicate_state,
 	.atomic_destroy_state = dpu_kms_global_destroy_state,
+	.atomic_print_state = dpu_kms_global_print_state,
 };
 
 static int dpu_kms_global_obj_init(struct dpu_kms *dpu_kms)
@@ -371,6 +380,9 @@ static int dpu_kms_global_obj_init(struct dpu_kms *dpu_kms)
 	drm_atomic_private_obj_init(dpu_kms->dev, &dpu_kms->global_state,
 				    &state->base,
 				    &dpu_kms_global_state_funcs);
+
+	state->rm = &dpu_kms->rm;
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
index d1207f4ec3ae..2512c9bd08df 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
@@ -131,6 +131,8 @@ struct vsync_info {
 struct dpu_global_state {
 	struct drm_private_state base;
 
+	struct dpu_rm *rm;
+
 	uint32_t pingpong_to_enc_id[PINGPONG_MAX - PINGPONG_0];
 	uint32_t mixer_to_enc_id[LM_MAX - LM_0];
 	uint32_t ctl_to_enc_id[CTL_MAX - CTL_0];
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index 724537ab776d..08dd38d336a8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -634,3 +634,58 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
 
 	return num_blks;
 }
+
+void dpu_rm_print_state(struct drm_printer *p,
+			const struct dpu_global_state *global_state)
+{
+	const struct dpu_rm *rm = global_state->rm;
+	int i;
+
+	drm_puts(p, "resource mapping:\n");
+	drm_puts(p, "\tpingpong=");
+	for (i = 0; i < ARRAY_SIZE(global_state->pingpong_to_enc_id); i++)
+		if (rm->pingpong_blks[i])
+			drm_printf(p, "%d ", global_state->pingpong_to_enc_id[i]);
+		else
+			drm_puts(p, "- ");
+	drm_puts(p, "\n");
+
+	drm_puts(p, "\tmixer=");
+	for (i = 0; i < ARRAY_SIZE(global_state->mixer_to_enc_id); i++)
+		if (rm->mixer_blks[i])
+			drm_printf(p, "%d ", global_state->mixer_to_enc_id[i]);
+		else
+			drm_puts(p, "- ");
+	drm_puts(p, "\n");
+
+	drm_puts(p, "\tctl=");
+	for (i = 0; i < ARRAY_SIZE(global_state->ctl_to_enc_id); i++)
+		if (rm->ctl_blks[i])
+			drm_printf(p, "%d ", global_state->ctl_to_enc_id[i]);
+		else
+			drm_puts(p, "- ");
+	drm_puts(p, "\n");
+
+	drm_puts(p, "\tdspp=");
+	for (i = 0; i < ARRAY_SIZE(global_state->dspp_to_enc_id); i++)
+		if (rm->dspp_blks[i])
+			drm_printf(p, "%d ", global_state->dspp_to_enc_id[i]);
+		else
+			drm_puts(p, "- ");
+	drm_puts(p, "\n");
+
+	drm_puts(p, "\tdsc=");
+	for (i = 0; i < ARRAY_SIZE(global_state->dsc_to_enc_id); i++)
+		if (rm->dsc_blks[i])
+			drm_printf(p, "%d ", global_state->dsc_to_enc_id[i]);
+		else
+			drm_puts(p, "- ");
+	drm_puts(p, "\n");
+
+	drm_puts(p, "\tcdm=");
+	if (rm->cdm_blk)
+		drm_printf(p, "%d ", global_state->cdm_to_enc_id);
+	else
+		drm_puts(p, "- ");
+	drm_puts(p, "\n");
+}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
index e3f83ebc656b..e63db8ace6b9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
@@ -89,6 +89,14 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
 	struct dpu_global_state *global_state, uint32_t enc_id,
 	enum dpu_hw_blk_type type, struct dpu_hw_blk **blks, int blks_size);
 
+/**
+ * dpu_rm_print_state - output the RM private state
+ * @p: DRM printer
+ * @global_state: global state
+ */
+void dpu_rm_print_state(struct drm_printer *p,
+			const struct dpu_global_state *global_state);
+
 /**
  * dpu_rm_get_intf - Return a struct dpu_hw_intf instance given it's index.
  * @rm: DPU Resource Manager handle

---
base-commit: 41c177cf354126a22443b5c80cec9fdd313e67e1
change-id: 20240219-fd-rm-state-bd1218954b78

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

