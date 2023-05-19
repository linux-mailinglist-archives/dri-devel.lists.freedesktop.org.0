Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F65B708DD1
	for <lists+dri-devel@lfdr.de>; Fri, 19 May 2023 04:30:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A44C10E5A5;
	Fri, 19 May 2023 02:30:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E674810E5A4
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 02:30:17 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2af2451b3f1so1613581fa.2
 for <dri-devel@lists.freedesktop.org>; Thu, 18 May 2023 19:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684463415; x=1687055415;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DTMoBnu8c03FjNPj9qU+/R0vXknB9qzxYO9GXWdKjog=;
 b=JeSP/gFlVkSYoNqo7EjpTFhfBTSCo4IUuoal5O+mGF90sXIpVGdJMSfV5focJo8qTl
 jwv0o/PBqjDv+SAL44gPeIvNN4EixZw19I7SjDj2WuA4EGxHrl+Co3RF8WDspH3r0O2q
 wZkLjbYcwqR/03k1fLHQVZjjI507zkt35qr4sJ67slvlpAxcimDqL7UWcCvKJHHj7+TG
 vFCJ/6XrZ/CGtFUiYTA9OjgyroKqwoZ5qCJF0/wVP+nS4MV70CzQ6cY2+WCd0w3CiTzD
 oxFa9Ulqbr1N0dxHYkZCXDeK2W/bmCRvQyuHqXHIk2/3ViUBZlzo53T5IVXcs6akd+/d
 QkcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684463415; x=1687055415;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DTMoBnu8c03FjNPj9qU+/R0vXknB9qzxYO9GXWdKjog=;
 b=jE82J3CEDgX343lOO8hLbOiZ2h81X3etb3wXXV+5Kgg1T7+2Z47EKY/eIH3eyZ32j/
 5xBuP10LiG3VHBj2vZ9w8kiRdiItz4BrDMKy43C6W8a7tsx3asovg6c6IQDvUR2nJtmg
 SDt/+nZyGqo8xnQJedv8OAV7Td6dazSPs/IZEm4HJfDTCQhzoULaHCVODN7Pk+4HF5KG
 9ZwQkEnAJyxE06+yd7J1RPXDApHhj6ZIoZ1CdwH7Q9jZR/OppTc0afQ/lZzb1BGUTfxX
 Y0J0o2Wo3Oqq48iJFHLbHCR0Efc/1/bWMnWD2w3RhzrqhJeuG2qJLH535mok9xjn3pt2
 rHVQ==
X-Gm-Message-State: AC+VfDx5uNYPgmUv25GS3/5pdaV15WaZwM6wJDDvN1borlmCul43C2tv
 WkZxhj/jHx56yKSIFyYSpbYq3MHEjVnQXxDyNYQ=
X-Google-Smtp-Source: ACHHUZ6Kot9UNOvZVgzIbG+e7WN/U79ck+dSDUf6n/v2yItL6wE/tXaHJcxo//4EjNDKMI7NrXqFgw==
X-Received: by 2002:a2e:740b:0:b0:2ac:80f6:544a with SMTP id
 p11-20020a2e740b000000b002ac80f6544amr126469ljc.24.1684463415271; 
 Thu, 18 May 2023 19:30:15 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 t16-20020a2e9d10000000b002aa3ad9014asm573709lji.54.2023.05.18.19.30.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 May 2023 19:30:14 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 2/2] drm/msm/dpu: drop dpu_encoder_phys_ops::atomic_check()
Date: Fri, 19 May 2023 05:30:11 +0300
Message-Id: <20230519023011.3837868-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230519023011.3837868-1-dmitry.baryshkov@linaro.org>
References: <20230519023011.3837868-1-dmitry.baryshkov@linaro.org>
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

Writeback was the last user of dpu_encoder_phys_ops's atomic_check()
callback. As the code was moved to the dpu_writeback.c, the callback
becomes unused. Drop it now.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      | 15 ---------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |  4 ----
 2 files changed, 19 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 509b4fc7dbc5..77f476c17829 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -605,7 +605,6 @@ static int dpu_encoder_virt_atomic_check(
 	struct drm_display_mode *adj_mode;
 	struct msm_display_topology topology;
 	struct dpu_global_state *global_state;
-	int i = 0;
 	int ret = 0;
 
 	if (!drm_enc || !crtc_state || !conn_state) {
@@ -626,20 +625,6 @@ static int dpu_encoder_virt_atomic_check(
 
 	trace_dpu_enc_atomic_check(DRMID(drm_enc));
 
-	/* perform atomic check on the first physical encoder (master) */
-	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
-		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
-
-		if (phys->ops.atomic_check)
-			ret = phys->ops.atomic_check(phys, crtc_state,
-					conn_state);
-		if (ret) {
-			DPU_ERROR_ENC(dpu_enc,
-					"mode unsupported, phys idx %d\n", i);
-			return ret;
-		}
-	}
-
 	topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode, crtc_state);
 
 	/*
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
index 67c4b4e0975d..1fcb502f368b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
@@ -70,7 +70,6 @@ struct dpu_encoder_phys;
  *				on split_role and current mode (CMD/VID).
  * @enable:			DRM Call. Enable a DRM mode.
  * @disable:			DRM Call. Disable mode.
- * @atomic_check:		DRM Call. Atomic check new DRM state.
  * @destroy:			DRM Call. Destroy and release resources.
  * @control_vblank_irq		Register/Deregister for VBLANK IRQ
  * @wait_for_commit_done:	Wait for hardware to have flushed the
@@ -97,9 +96,6 @@ struct dpu_encoder_phys_ops {
 	bool (*is_master)(struct dpu_encoder_phys *encoder);
 	void (*enable)(struct dpu_encoder_phys *encoder);
 	void (*disable)(struct dpu_encoder_phys *encoder);
-	int (*atomic_check)(struct dpu_encoder_phys *encoder,
-			    struct drm_crtc_state *crtc_state,
-			    struct drm_connector_state *conn_state);
 	void (*destroy)(struct dpu_encoder_phys *encoder);
 	int (*control_vblank_irq)(struct dpu_encoder_phys *enc, bool enable);
 	int (*wait_for_commit_done)(struct dpu_encoder_phys *phys_enc);
-- 
2.39.2

