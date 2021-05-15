Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0943E381AB9
	for <lists+dri-devel@lfdr.de>; Sat, 15 May 2021 21:09:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05EB46E437;
	Sat, 15 May 2021 19:09:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AADD6E437
 for <dri-devel@lists.freedesktop.org>; Sat, 15 May 2021 19:09:15 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id v9so1677249lfa.4
 for <dri-devel@lists.freedesktop.org>; Sat, 15 May 2021 12:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eMBcKmm8yE2cOuLCEAY4tFKnMIM8Fg6P3y5+AbqZ1+w=;
 b=quGJGkpdX43yncm1z48eYe1q1Sh5/UFm/Keb9+b1UrZ/36ywT2cmG7mjaFaN6qgXXp
 iqLNFJYS3cLT1d83MnLXf7iB22JSQktuOoZ2mbMTRnLcMbuo34SjxgycS3IuukE4923B
 ekbTYeMNY25j23JP2YBiOsKAO+urd9cCk9b0ckFQBh6uMU9EVMSsHISbBz1DYCFKchZQ
 yiWfgtkH9gDg8F8y7LNMPgEjfBS9Ch98EpYBEEg4FQtAdJSPtpaA+rhEXpD/Ua6iii+C
 UZS/k6WVWbn8x3B7mhUjwFt+wqU3xPtyb5Xp9xbQILGzboNB7S/PxUapIibGODoKpkc2
 iPPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eMBcKmm8yE2cOuLCEAY4tFKnMIM8Fg6P3y5+AbqZ1+w=;
 b=dSoakxQAEnmjOhDKm5m94vmDNVhuhjGXRf+tMp3OOa3PD3zcSzppbEpTlZm+wl1LQI
 uVYCJQjpPGOpu2+grx5PSnMTt2CJogYfDtsF+30gqQD/6SpVzZ4tg28D3sImObIQ1o/V
 yXxW6JVwUUH28wsCYPG+6V6PLs4Oqaw+gVrnV6RjSl1FNzMctomrrpeOCnwrPEhuqfm1
 Fea/2up6cZzOaHRcJ2bJOs4gylkQk+GyKzRNETe1xheGNZUbfFLBIaL3Q/5R28m7eqPk
 Y4Rm9+kMJNnZ2+nose9uh9vVZZ19ur0hWYUarU2gMo2d/ehXlgnCWQv0f5r8lzf/hOaf
 h5UQ==
X-Gm-Message-State: AOAM533ygkctqSJ3MWxMpxAhgWNV1PATyt/j7gCRXZ9wgbDIDmbLfbGV
 osac3Enr8IgaHShG6DD36eJI2A==
X-Google-Smtp-Source: ABdhPJwyv4yeWp0KY34Wilzaw3tw5jIWYk+4p5lgChzk2NA7vyIlfc6vrxo99YiJh934kA8PEkoMwA==
X-Received: by 2002:a05:6512:689:: with SMTP id
 t9mr35945279lfe.262.1621105753924; 
 Sat, 15 May 2021 12:09:13 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id t15sm2184107ljk.99.2021.05.15.12.09.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 May 2021 12:09:13 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Subject: [PATCH v3 3/4] drm/msm/dpu: use struct dpu_hw_merge_3d in
 dpu_hw_pingpong
Date: Sat, 15 May 2021 22:09:08 +0300
Message-Id: <20210515190909.1809050-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210515190909.1809050-1-dmitry.baryshkov@linaro.org>
References: <20210515190909.1809050-1-dmitry.baryshkov@linaro.org>
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
Cc: Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use struct dpu_hw_merge_3d pointer in struct dpu_hw_pingpong rather
than using struct dpu_hw_blk. This is the only user of dpu_hw_blk.id,
which will be cleaned in the next patch.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 11 ++++-------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h      |  4 +++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c               |  2 +-
 3 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index 0e06b7e73c7a..4feec24162bc 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -284,7 +284,7 @@ static void dpu_encoder_phys_vid_setup_timing_engine(
 	intf_cfg.stream_sel = 0; /* Don't care value for video mode */
 	intf_cfg.mode_3d = dpu_encoder_helper_get_3d_blend_mode(phys_enc);
 	if (phys_enc->hw_pp->merge_3d)
-		intf_cfg.merge_3d = phys_enc->hw_pp->merge_3d->id;
+		intf_cfg.merge_3d = phys_enc->hw_pp->merge_3d->idx;
 
 	spin_lock_irqsave(phys_enc->enc_spinlock, lock_flags);
 	phys_enc->hw_intf->ops.setup_timing_gen(phys_enc->hw_intf,
@@ -298,11 +298,8 @@ static void dpu_encoder_phys_vid_setup_timing_engine(
 				true,
 				phys_enc->hw_pp->idx);
 
-	if (phys_enc->hw_pp->merge_3d) {
-		struct dpu_hw_merge_3d *merge_3d = to_dpu_hw_merge_3d(phys_enc->hw_pp->merge_3d);
-
-		merge_3d->ops.setup_3d_mode(merge_3d, intf_cfg.mode_3d);
-	}
+	if (phys_enc->hw_pp->merge_3d)
+		phys_enc->hw_pp->merge_3d->ops.setup_3d_mode(phys_enc->hw_pp->merge_3d, intf_cfg.mode_3d);
 
 	spin_unlock_irqrestore(phys_enc->enc_spinlock, lock_flags);
 
@@ -461,7 +458,7 @@ static void dpu_encoder_phys_vid_enable(struct dpu_encoder_phys *phys_enc)
 
 	ctl->ops.update_pending_flush_intf(ctl, phys_enc->hw_intf->idx);
 	if (ctl->ops.update_pending_flush_merge_3d && phys_enc->hw_pp->merge_3d)
-		ctl->ops.update_pending_flush_merge_3d(ctl, phys_enc->hw_pp->merge_3d->id);
+		ctl->ops.update_pending_flush_merge_3d(ctl, phys_enc->hw_pp->merge_3d->idx);
 
 skip_flush:
 	DPU_DEBUG_VIDENC(phys_enc,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h
index 845b9ce80e31..89d08a715c16 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h
@@ -126,6 +126,8 @@ struct dpu_hw_pingpong_ops {
 			struct dpu_hw_dither_cfg *cfg);
 };
 
+struct dpu_hw_merge_3d;
+
 struct dpu_hw_pingpong {
 	struct dpu_hw_blk base;
 	struct dpu_hw_blk_reg_map hw;
@@ -133,7 +135,7 @@ struct dpu_hw_pingpong {
 	/* pingpong */
 	enum dpu_pingpong idx;
 	const struct dpu_pingpong_cfg *caps;
-	struct dpu_hw_blk *merge_3d;
+	struct dpu_hw_merge_3d *merge_3d;
 
 	/* ops */
 	struct dpu_hw_pingpong_ops ops;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index fd2d104f0a91..c0eec12498e7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -162,7 +162,7 @@ int dpu_rm_init(struct dpu_rm *rm,
 			goto fail;
 		}
 		if (pp->merge_3d && pp->merge_3d < MERGE_3D_MAX)
-			hw->merge_3d = rm->merge_3d_blks[pp->merge_3d - MERGE_3D_0];
+			hw->merge_3d = to_dpu_hw_merge_3d(rm->merge_3d_blks[pp->merge_3d - MERGE_3D_0]);
 		rm->pingpong_blks[pp->id - PINGPONG_0] = &hw->base;
 	}
 
-- 
2.30.2

