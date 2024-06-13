Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 681F890795F
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 19:05:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32B3C10EB48;
	Thu, 13 Jun 2024 17:05:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="D5dWDCKp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FC4F10EB49
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 17:05:15 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-52c89d6b4adso1268333e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 10:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718298313; x=1718903113; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=jFIftxDedqw0XeujJ+yqXgGm8FkPdhMhPZNtKoZN16g=;
 b=D5dWDCKpNGvPQQNim5GetEPujDltCmdyPlI/WX+j8fP4VyfE8OeF/E7ac5Gp5dnU/u
 k0Kime65lQylIvzKfYGYpYoqvlIx9QcW5aDRSeRJ6DAa2kRrsQ08tnhiG8dxZC/OF8jM
 X6Gwy3J5fTDPuX++FvN3LNrQyNwidgFyedW+hV9+4rkydooLCjG3rVCl/KWKc920rXFV
 T6jTpIWg1FjBYqMMDE7gZNfsvjujcOuobCIqTTxYKDjYX0gjhCGvaMUazswxP81w4lDD
 4rKHqAHOCPyoOg68EAIl4tg5NaVxwzXT/OXAUzljwrd7xcFGGTUWrEhFUeOU/26fKfUE
 QBvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718298313; x=1718903113;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jFIftxDedqw0XeujJ+yqXgGm8FkPdhMhPZNtKoZN16g=;
 b=RF7FAUelMQNsm5w/2NEy1AiJdQMhjVvPaKRsDe4MeOEJqh89ZFoy26dJOnfyONTOr7
 Mm+KVh2k2JRMH3lzbFav1N8jQBRoSFqMq7YUS262ozfqQYKBMjNzSeN90lVYa3EMd137
 oGaalry5Wz8T5WZygEIFYqBTJ7QDC/4H/W5zBn9LxvLy/12AeMNJW/Tm6tB4+HbUEXzG
 BVMUFVFd9hJz76aqvRLMLo9BfmzjWNlddRxhDStZFUFZ/7rGHt4QGoU6RWeoHF0BYNmF
 5I9G4YkFFY4cdAlnfjQCRMg23zHvYaZ+XlvG5Ebb/XRvrB/E/uMlqXkmGgALmKSrTo78
 7EGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXd3Ib2JBGQ2+TqlQ/E7ioyOQ4wVavpJ1JqsCV1muISuz6g28Pha9efOYVf/BVMjO3LnLKmw01UZW/9rGWR44M6e2xulbjdUgW1DnXBYr5/
X-Gm-Message-State: AOJu0YyYRad1xHBMQbQ/k1YAruzTPOPUei1bipZpjJSyI6GM/Mwu4HOr
 bOC8Udw+WYLZ6s8azU/p0up//oEnsTI71DkETkPgGCYNT2MjnNpHVFrqueEaICM=
X-Google-Smtp-Source: AGHT+IE2l88kV8KRfmueofaMiGT9jOC6bDnGDLEFAidZGySARjBWwc6bw1tMCn2EDrlw3Y+pvm3faQ==
X-Received: by 2002:a05:6512:3c96:b0:52b:c0b1:ab9e with SMTP id
 2adb3069b0e04-52ca6e564d2mr272152e87.5.1718298312739; 
 Thu, 13 Jun 2024 10:05:12 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ca2825733sm287312e87.60.2024.06.13.10.05.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jun 2024 10:05:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 13 Jun 2024 20:05:11 +0300
Subject: [PATCH v2 8/8] drm/msm/dpu: rename dpu_hw_setup_vsync_source functions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240613-dpu-handle-te-signal-v2-8-67a0116b5366@linaro.org>
References: <20240613-dpu-handle-te-signal-v2-0-67a0116b5366@linaro.org>
In-Reply-To: <20240613-dpu-handle-te-signal-v2-0-67a0116b5366@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2201;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=ueS1wf8UISai/dHWZNsJmGTXzlQKS5D7cMZLTp/g7pM=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ1q22qFk9TX8rEHKdSeV7vy9tNmzxVbbNr3lv/3a3qeZI
 q84j1/qZDRmYWDkYpAVU2TxKWiZGrMpOezDjqn1MINYmUCmMHBxCsBEgmU5GBoePXzIn1bMMMlk
 5afCiHcR50/Z2f5WMD306KHEZLaOs282zjA4njA7OSDF8O3SQJmHb9k39v5VuCkV0WekwZ3Cp7L
 8OM/GHwv9JG2VLwXuPMXUf9anmE9BMNXto0gjV9WCVWq1B0I3bM9Kdsk4u/O/QHh2OS+P2BaGxt
 l6YZoXprO6Htl28YWLihbD+dwl37okXVQ2t3isSJWOO9L6ZrvHl1v+q04u/qv5csP2K/Ir2W+uW
 v2vPau/X6k9bJJMxJ7IMAf9c33KvZt0XI10Q3t3svW3rXp+cPuNOI03e0878N14KBqZEZyy8bGW
 8mahwszwnFyTnPYA8S8qzemSN62+a270fzjxXIxEgf0fAA==
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

Rename dpu_hw_setup_vsync_source functions to make the names match the
implementation: on DPU 5.x the TOP only contains timer setup, while 3.x
and 4.x used MDP_VSYNC_SEL register to select TE source.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
index 05e48cf4ec1d..6e2ac50b94a4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
@@ -107,8 +107,8 @@ static void dpu_hw_get_danger_status(struct dpu_hw_mdp *mdp,
 	status->sspp[SSPP_CURSOR1] = (value >> 26) & 0x3;
 }
 
-static void dpu_hw_setup_vsync_source(struct dpu_hw_mdp *mdp,
-		struct dpu_vsync_source_cfg *cfg)
+static void dpu_hw_setup_wd_timer(struct dpu_hw_mdp *mdp,
+				  struct dpu_vsync_source_cfg *cfg)
 {
 	struct dpu_hw_blk_reg_map *c;
 	u32 reg, wd_load_value, wd_ctl, wd_ctl2;
@@ -163,8 +163,8 @@ static void dpu_hw_setup_vsync_source(struct dpu_hw_mdp *mdp,
 	}
 }
 
-static void dpu_hw_setup_vsync_source_and_vsync_sel(struct dpu_hw_mdp *mdp,
-		struct dpu_vsync_source_cfg *cfg)
+static void dpu_hw_setup_vsync_sel(struct dpu_hw_mdp *mdp,
+				   struct dpu_vsync_source_cfg *cfg)
 {
 	struct dpu_hw_blk_reg_map *c;
 	u32 reg, i;
@@ -187,7 +187,7 @@ static void dpu_hw_setup_vsync_source_and_vsync_sel(struct dpu_hw_mdp *mdp,
 	}
 	DPU_REG_WRITE(c, MDP_VSYNC_SEL, reg);
 
-	dpu_hw_setup_vsync_source(mdp, cfg);
+	dpu_hw_setup_wd_timer(mdp, cfg);
 }
 
 static void dpu_hw_get_safe_status(struct dpu_hw_mdp *mdp,
@@ -239,9 +239,9 @@ static void _setup_mdp_ops(struct dpu_hw_mdp_ops *ops,
 	ops->get_danger_status = dpu_hw_get_danger_status;
 
 	if (cap & BIT(DPU_MDP_VSYNC_SEL))
-		ops->setup_vsync_source = dpu_hw_setup_vsync_source_and_vsync_sel;
+		ops->setup_vsync_source = dpu_hw_setup_vsync_sel;
 	else
-		ops->setup_vsync_source = dpu_hw_setup_vsync_source;
+		ops->setup_vsync_source = dpu_hw_setup_wd_timer;
 
 	ops->get_safe_status = dpu_hw_get_safe_status;
 

-- 
2.39.2

