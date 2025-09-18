Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5359CB84CFD
	for <lists+dri-devel@lfdr.de>; Thu, 18 Sep 2025 15:29:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ADF910E8A4;
	Thu, 18 Sep 2025 13:29:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="KgQr0E8l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A49BE10E8A4
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 13:29:25 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id
 98e67ed59e1d1-33082c95fd0so228955a91.1
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 06:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758202165; x=1758806965; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=SW4I0bHOJyIFQFMrj5TK+GBNLfagwAY9utI2/PYagvo=;
 b=KgQr0E8lRb+kY+ksQxG5NC7yBZx3ZaqOrDBy/H4DqDRT+BWvIItLAV/1yecFPebGSU
 iwolHWnXfS1jfSiG8znquJ/5NUFxS5CRm8UUMrKO/kQ0WfFXlRxPUT6qrB6RC7ku9wiU
 AX9pwH4x3Lu9jJYZGoQeutei1I4MjtW6545LH4k7pkQFYvGag0GKLxjRtrAza253ykYJ
 xvNz4hq53zzK/mN1GjTwcPpNHaJd/d0qdLt//rUBoGH+Eon4jK0HYT6vCGW1L4VbWbOK
 orOH6RKLUnF/E4bvCus3OHny957Lh/zVyCdre2C9bpvTFRbA/WuEXfdj2svXJzaExqff
 yeJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758202165; x=1758806965;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SW4I0bHOJyIFQFMrj5TK+GBNLfagwAY9utI2/PYagvo=;
 b=pS/w3XBYshbQ9zZDdM2g8BDkJ3O6fCQOUi4ZtArWWw+cZzCS6Q1F1WhVvGjIB4LBAH
 MH+AqD9y9ofPtWYndY5aWzru8wKCQE81OH2YEgPCQyvGHZrxfy5YX/8sGAap6NRlbCSp
 Jko2pM0gQ0IhEHIUNJMi++ksIH0aeka6IWBgjFUd89NwCmS9hhSx98uYgDXrlrVMmvyB
 Ob/JEiohjXnMbHNS3PwouXa42qKIG44DxCLRSQbKnoHJKBhDdM56MZhjFKRKDDX0xlT4
 2JWX/IxdQ5Bk0kEVvrR5yzYv8dP+m2pQ7RWQsRwBrO/3iB/7rOqdkQtXOjm6/sgsF4HM
 dYbQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJImTVws3UYCL+lS1GOxK/yf2ufryzAQGOekkkMM6pR7Ms0dgfxAuM7UfapJsi5Nvr37GdUS3765M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwLHyiG/WGfQunu26DVA2qmwPoSfI9d9GW70sReh/hv5hzvwW6I
 KCw5RXJ9p4HPyM44HBAxNROSeSPTLWoYmHOdW83YkZAAwH/aH83Gntv+b5YsZisJhJs=
X-Gm-Gg: ASbGncsRpZXYya0UpXJgiWqCn6ax3Fjdx7WjwUokRh/uWo9Blk/DMgBUO7TvmkpKeRy
 Lh835U7KUq3/uwqWHyHykZKcSJ89hvIOLOjUbJonx+NVSkEITucSrOS+wSXMNZHyRtsXCshnw65
 ictZ9FvkdR6yIY+ykcWXNeMwtWx0CkYhQtuGpeVspPoUcXNwHV5FPjLWIj33FQsubfECs6B8xxx
 qea6srgxq1p8Jw03L9ZW6Ev89lg8VMHK+JczAmt8jUbQeHOx3undkcKCFyRq5Bz/xFjuU3sKBRK
 ZY7kaxwP2j9J6dn28gy+PkEp9QIUHiEgj1IhYtwL6O7mx61jWCSUsYN8rSf9cesrvOX15G56q6g
 s2yd8SaEuW1YLlD4s/Rs5bKl0WIK/9e9wUEE=
X-Google-Smtp-Source: AGHT+IH2BOShDFL1Cf1QibDMgt7GXFKPflGMs+oalRPNEjL00mKNm0WKOv0PuLnvFP5Kmrkq4BfVkQ==
X-Received: by 2002:a17:90b:2249:b0:32e:96b1:fb56 with SMTP id
 98e67ed59e1d1-32ee3eaf849mr7991245a91.16.1758202165117; 
 Thu, 18 Sep 2025 06:29:25 -0700 (PDT)
Received: from [127.0.1.1] ([112.64.61.5]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b54ff35cc76sm2331479a12.10.2025.09.18.06.29.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Sep 2025 06:29:24 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 18 Sep 2025 21:28:54 +0800
Subject: [PATCH v16 02/10] drm/msm/dpu: bind correct pingpong for quad pipe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250918-v6-16-rc2-quad-pipe-upstream-4-v16-2-ff6232e3472f@linaro.org>
References: <20250918-v6-16-rc2-quad-pipe-upstream-4-v16-0-ff6232e3472f@linaro.org>
In-Reply-To: <20250918-v6-16-rc2-quad-pipe-upstream-4-v16-0-ff6232e3472f@linaro.org>
To: Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758202147; l=1809;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=f/Sw/vwQEvrkF3u6LWBntZd5AAvvANHPgf3CTk8y8Jw=;
 b=8qMPBs6WF+TiriJSLAoXhaLroMMsTySRuEA3zKlrDBrgXsBMnBiUWxdE4gNtj85pxNPvLgUYl
 pLA2HenSuA0AB1x+Ez09YcdO34tmtXeFRknhiDPGQ92BmJDXLXq/hXM
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=
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

There are 2 interfaces and 4 pingpong in quad pipe. Map the 2nd
interface to 3rd PP instead of the 2nd PP.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 258edaa18fc02f837122c84842b59f2cee68d66e..1318f9e63ef1e7bab078ae17e39d9ed19c04f465 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1160,7 +1160,7 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 	struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_ENC];
 	struct dpu_hw_blk *hw_dsc[MAX_CHANNELS_PER_ENC];
 	struct dpu_hw_blk *hw_cwb[MAX_CHANNELS_PER_ENC];
-	int num_ctl, num_pp, num_dsc;
+	int num_ctl, num_pp, num_dsc, num_pp_per_intf;
 	int num_cwb = 0;
 	bool is_cwb_encoder;
 	unsigned int dsc_mask = 0;
@@ -1239,10 +1239,16 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 		dpu_enc->cur_master->hw_cdm = hw_cdm ? to_dpu_hw_cdm(hw_cdm) : NULL;
 	}
 
+	/*
+	 * There may be 4 PP and 2 INTF for quad pipe case, so INTF is not
+	 * mapped to PP 1:1. Let's calculate the stride with pipe/INTF
+	 */
+	num_pp_per_intf = num_pp / dpu_enc->num_phys_encs;
+
 	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
 		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
 
-		phys->hw_pp = dpu_enc->hw_pp[i];
+		phys->hw_pp = dpu_enc->hw_pp[num_pp_per_intf * i];
 		if (!phys->hw_pp) {
 			DPU_ERROR_ENC(dpu_enc,
 				"no pp block assigned at idx: %d\n", i);

-- 
2.34.1

