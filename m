Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA7598F3D0
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 18:13:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B52010E8AF;
	Thu,  3 Oct 2024 16:13:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XpWIq1p3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E799E10E8AF;
 Thu,  3 Oct 2024 16:13:15 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-2fad100dd9fso18690161fa.3; 
 Thu, 03 Oct 2024 09:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727971994; x=1728576794; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=C2upupBY1EQ+m1GezaBBUues2GRZBbvaKqjKTx4uDDU=;
 b=XpWIq1p3TERge4SxoKUYTKLMjWK6+E9S68cTFPv/Ol6s7fsPMoKR4myQBE8Y5e09+x
 Q8/3wm3XrKn/afUPuPL2oIWlv+DL75ZKllAeY3r3OqYaWqdX3HZyR6GmIO0XYZ2YicdE
 hn68T+4qYHO6nHo/PzQoYQh/dTh0L7MPOrecTmfJfZKHEOc50JQP8AB5IYrSwhWXh1pe
 BWLpff/Px2zoDUvRsn3czeuc+qZDlm7Lmplr2AtGz1VF1Z/bmcwS6Te2cTdcvi7x5eYG
 xiXmtjDqe+OCs0EvCvbM4GnBSJUgqkWD95cnqMFs3rNhSI3NKNfJ99ynJkBtXwTQvUu3
 FRdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727971994; x=1728576794;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C2upupBY1EQ+m1GezaBBUues2GRZBbvaKqjKTx4uDDU=;
 b=fewa1x44nbVOSEaBdeVbTni9F/zlbG04pUf5UWMdhauBaUvPCBXb+GLj/L2boVkVZM
 ZzPeCpLsVbAF1UQtcgLej3ACs+N10YBoMrmHXxYqPtefowqnh4blEY6nyI1wGuC5+XmV
 /UB8YCZySYBCB/HQYpEHXSoSRX7Ool0P63OClA+AlZyQEKVnaTnbkH0DNEE8PBjp58e2
 bPTvmRDz17VPiqEAsYWWwIFjkNWx3ibvqSErpJ2cyaL04oIvqDaWqkXfE6IOcHOuVXjj
 aWbabPofyl9WXw7PsaYJw5DGcWUtXl0NpSqu0kbCW/UxZIvxKu0LKwgegu3rN73OM0ZB
 G6ug==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQGA6DRlOHF6dvjBLwk44FmGARaUnEtF6Q78496fZfMbHg4BEzEoj5kTBguDQ91ltmsZkExiTkCmEc@lists.freedesktop.org,
 AJvYcCXzhBHV/IUOvxrdBlXi55TMIKY3e+KH0j20jXIPf950pUxploYjvH+PaeK4mpG7oQPtXwLaGQeEGmU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwmhNSNMGH6O77F9S7PjLEblkgMEhMFj6yV2sq3qNNX97bFj6ZW
 hhmar4l5zVollt7ZWq0O1LhBtKMGUmEOyfYoG68vUMW9+wh9kAkm8gxDprmtwko+Mg==
X-Google-Smtp-Source: AGHT+IF0W5cRRFhRz/ah9lJzvn2RM4GExTrptijifL3rkfJYDQHgNksG3VO3zAeIK1oRD98+oVW+YA==
X-Received: by 2002:a05:651c:2105:b0:2fa:c0c2:d311 with SMTP id
 38308e7fff4ca-2fae10226e4mr71691051fa.5.1727971993806; 
 Thu, 03 Oct 2024 09:13:13 -0700 (PDT)
Received: from [192.168.1.17] (host-79-12-161-203.retail.telecomitalia.it.
 [79.12.161.203]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a99103b314asm102382366b.103.2024.10.03.09.13.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Oct 2024 09:13:13 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Thu, 03 Oct 2024 18:12:58 +0200
Subject: [PATCH v8 09/12] drm/msm/a6xx: Add traces for preemption
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241003-preemption-a750-t-v8-9-5c6cb9f256e0@gmail.com>
References: <20241003-preemption-a750-t-v8-0-5c6cb9f256e0@gmail.com>
In-Reply-To: <20241003-preemption-a750-t-v8-0-5c6cb9f256e0@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Antonino Maniscalco <antomani103@gmail.com>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727971975; l=2885;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=ENWLkuWoPXJbSCb+Fdj53Lnk+HYvqRlKgvKGcqOgUfQ=;
 b=BYifA0HCTnV1SBDxv2uh5cnFadSH3IylIrgK3MlTIoPv+MTNomU2AFUL2B3A7HFhIry6Q5KwA
 JCATRofw8tQA5WX6+rltgPYxwxLwlK4ZT/kfbTAGII1h6IdNjgugnHa
X-Developer-Key: i=antomani103@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=
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

Add trace points corresponding to preemption being triggered and being
completed for latency measurement purposes.

Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
Tested-by: Rob Clark <robdclark@gmail.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8450-HDK
Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_preempt.c |  6 ++++++
 drivers/gpu/drm/msm/msm_gpu_trace.h       | 28 ++++++++++++++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
index 21e333cb6342d33425eb96f97bcc853e9b041b36..6803d5af60cc8fb0f2a52ee160ffdbf0e8ef0209 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
@@ -7,6 +7,7 @@
 #include "a6xx_gpu.h"
 #include "a6xx_gmu.xml.h"
 #include "msm_mmu.h"
+#include "msm_gpu_trace.h"
 
 /*
  * Try to transition the preemption state from old to new. Return
@@ -174,6 +175,8 @@ void a6xx_preempt_irq(struct msm_gpu *gpu)
 
 	set_preempt_state(a6xx_gpu, PREEMPT_NONE);
 
+	trace_msm_gpu_preemption_irq(a6xx_gpu->cur_ring->id);
+
 	/*
 	 * Retrigger preemption to avoid a deadlock that might occur when preemption
 	 * is skipped due to it being already in flight when requested.
@@ -294,6 +297,9 @@ void a6xx_preempt_trigger(struct msm_gpu *gpu)
 	 */
 	ring->restore_wptr = false;
 
+	trace_msm_gpu_preemption_trigger(a6xx_gpu->cur_ring->id,
+		ring ? ring->id : -1);
+
 	spin_unlock_irqrestore(&ring->preempt_lock, flags);
 
 	gpu_write64(gpu,
diff --git a/drivers/gpu/drm/msm/msm_gpu_trace.h b/drivers/gpu/drm/msm/msm_gpu_trace.h
index ac40d857bc4578377b03b4cedd138c87144997e4..7f863282db0d7812c8fd53b3f1fc0cd5635028ba 100644
--- a/drivers/gpu/drm/msm/msm_gpu_trace.h
+++ b/drivers/gpu/drm/msm/msm_gpu_trace.h
@@ -177,6 +177,34 @@ TRACE_EVENT(msm_gpu_resume,
 		TP_printk("%u", __entry->dummy)
 );
 
+TRACE_EVENT(msm_gpu_preemption_trigger,
+		TP_PROTO(int ring_id_from, int ring_id_to),
+		TP_ARGS(ring_id_from, ring_id_to),
+		TP_STRUCT__entry(
+			__field(int, ring_id_from)
+			__field(int, ring_id_to)
+			),
+		TP_fast_assign(
+			__entry->ring_id_from = ring_id_from;
+			__entry->ring_id_to = ring_id_to;
+			),
+		TP_printk("preempting %u -> %u",
+			  __entry->ring_id_from,
+			  __entry->ring_id_to)
+);
+
+TRACE_EVENT(msm_gpu_preemption_irq,
+		TP_PROTO(u32 ring_id),
+		TP_ARGS(ring_id),
+		TP_STRUCT__entry(
+			__field(u32, ring_id)
+			),
+		TP_fast_assign(
+			__entry->ring_id = ring_id;
+			),
+		TP_printk("preempted to %u", __entry->ring_id)
+);
+
 #endif
 
 #undef TRACE_INCLUDE_PATH

-- 
2.46.1

