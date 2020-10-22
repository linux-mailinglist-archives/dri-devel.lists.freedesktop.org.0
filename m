Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6CEC296A46
	for <lists+dri-devel@lfdr.de>; Fri, 23 Oct 2020 09:23:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 476226E4C5;
	Fri, 23 Oct 2020 07:23:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCFD76F54C
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Oct 2020 13:17:15 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id d24so2210089lfa.8
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Oct 2020 06:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JmVKaqDJbIj1ObPBFRvm3kEt/2ALolZJ1yEXKws/Dq8=;
 b=C8kiBmQLGHtx57ogBT24njBN7gdf6AvHJAj0RFEqv7sW5WY2SXIhsemPnnwyWCbo7l
 HfdZ3QZV2FFIpQrdnjxtXLthfMPrhZTKRwTY62VbOGF7HigBs5mRrQIgpRNXD/oH/WQE
 Q6L8gVu+iRlalHDmNulRxo3nePU0s9RVd2e7SYDo613RlLoq9u9VIAKXHxR4+DaTLVG1
 KIXusjGQLJzeZXuQLyXr/PWykbjgUskBuLhNh47rLJJG/ZjJmT79AZR7BPiuTyY4hiw8
 PbZxRZWBr9AcCHTSTnBve4TIlDCE4+ncU+Qk4QOYCLTLm+YGefj1dbElmIH6eh+atMNN
 edkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JmVKaqDJbIj1ObPBFRvm3kEt/2ALolZJ1yEXKws/Dq8=;
 b=Q77MlESmXuFY3JfuQdP9KzAodn5KLp9QoDxLIUffcXBQvQmIWF83gG/wwW0H5ferk8
 sHJRnsNMMgi1ZRW5lqvsYC13CJfrDacZWt+Uz0hmalPDuRZqdJH9asbdNkbbaOyJ5ND1
 qID89o0GyVgzyC/POTJmuK43WyVv3uhaF4E8+wIHdZhY9Nh5zhpQ4CKNRAZ/Y3zrRS51
 auK7IC9AQJkNSSXftvtvQnUgGrCH/JoB/gmYvrybHmGgLm2uS92KrGpPVzLyxPSicWRp
 WyfxA3KeILJovGneWpn4pVyL3whyHbh1hVCIygitIIzXE7FQ8lZeYfkgfKo8ta4q2fgd
 qtSA==
X-Gm-Message-State: AOAM532PHnzgAOA7T90nxD5p0Jpvm4mdD4TKHS67H15BUjF215M+Czn4
 8LnvHn4juMlFLv5AKQzsJX3O/A==
X-Google-Smtp-Source: ABdhPJxsvKm0DlnseodCY9VzFXF3ux0nJQBCKFwLawjrW0Qkhrf9x4DngAWq3WNr/fgEH0zeQThujw==
X-Received: by 2002:ac2:4ec9:: with SMTP id p9mr823114lfr.428.1603372634275;
 Thu, 22 Oct 2020 06:17:14 -0700 (PDT)
Received: from eriador.lan ([188.162.64.195])
 by smtp.gmail.com with ESMTPSA id j10sm308514ljb.93.2020.10.22.06.17.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Oct 2020 06:17:13 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 5/5] drm/msm/dpu: enable merge_3d support on sm8150/sm8250
Date: Thu, 22 Oct 2020 16:16:58 +0300
Message-Id: <20201022131658.181363-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201022131658.181363-1-dmitry.baryshkov@linaro.org>
References: <20201022131658.181363-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 23 Oct 2020 07:22:29 +0000
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
Cc: David Airlie <airlied@linux.ie>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Handle new merge_3d block setup in dpu encoder code. Pass correct mode
and id. Note, that merge_3d blocks are not handled via usual RM
reservation mechanism, as each merge_3d block is tied to two PPs, so by
reserving PP you get merge_3d automatically.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 11 +++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h      |  1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c               |  2 ++
 3 files changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index a0d8aeec3e75..9a69fad832cd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -5,6 +5,7 @@
 #define pr_fmt(fmt)	"[drm:%s:%d] " fmt, __func__, __LINE__
 #include "dpu_encoder_phys.h"
 #include "dpu_hw_interrupts.h"
+#include "dpu_hw_merge3d.h"
 #include "dpu_core_irq.h"
 #include "dpu_formats.h"
 #include "dpu_trace.h"
@@ -282,6 +283,8 @@ static void dpu_encoder_phys_vid_setup_timing_engine(
 	intf_cfg.intf_mode_sel = DPU_CTL_MODE_SEL_VID;
 	intf_cfg.stream_sel = 0; /* Don't care value for video mode */
 	intf_cfg.mode_3d = dpu_encoder_helper_get_3d_blend_mode(phys_enc);
+	if (phys_enc->hw_pp->merge_3d)
+		intf_cfg.merge_3d = phys_enc->hw_pp->merge_3d->id;
 
 	spin_lock_irqsave(phys_enc->enc_spinlock, lock_flags);
 	phys_enc->hw_intf->ops.setup_timing_gen(phys_enc->hw_intf,
@@ -295,6 +298,12 @@ static void dpu_encoder_phys_vid_setup_timing_engine(
 				true,
 				phys_enc->hw_pp->idx);
 
+	if (phys_enc->hw_pp->merge_3d) {
+		struct dpu_hw_merge_3d *merge_3d = to_dpu_hw_merge_3d(phys_enc->hw_pp->merge_3d);
+
+		merge_3d->ops.setup_3d_mode(merge_3d, intf_cfg.mode_3d);
+	}
+
 	spin_unlock_irqrestore(phys_enc->enc_spinlock, lock_flags);
 
 	programmable_fetch_config(phys_enc, &timing_params);
@@ -451,6 +460,8 @@ static void dpu_encoder_phys_vid_enable(struct dpu_encoder_phys *phys_enc)
 		goto skip_flush;
 
 	ctl->ops.update_pending_flush_intf(ctl, phys_enc->hw_intf->idx);
+	if (ctl->ops.update_pending_flush_merge_3d && phys_enc->hw_pp->merge_3d)
+		ctl->ops.update_pending_flush_merge_3d(ctl, phys_enc->hw_pp->merge_3d->id);
 
 skip_flush:
 	DPU_DEBUG_VIDENC(phys_enc,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h
index 065996b3ece9..6902b9b95c8e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h
@@ -119,6 +119,7 @@ struct dpu_hw_pingpong {
 	/* pingpong */
 	enum dpu_pingpong idx;
 	const struct dpu_pingpong_cfg *caps;
+	struct dpu_hw_blk *merge_3d;
 
 	/* ops */
 	struct dpu_hw_pingpong_ops ops;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index 7ddc26f51d8e..0ae8a36ffcff 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -161,6 +161,8 @@ int dpu_rm_init(struct dpu_rm *rm,
 				rc);
 			goto fail;
 		}
+		if (pp->merge_3d && pp->merge_3d < MERGE_3D_MAX)
+			hw->merge_3d = rm->merge_3d_blks[pp->merge_3d - MERGE_3D_0];
 		rm->pingpong_blks[pp->id - PINGPONG_0] = &hw->base;
 	}
 
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
