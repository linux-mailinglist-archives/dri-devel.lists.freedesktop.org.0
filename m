Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42BEF966595
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 17:33:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0BC810E41E;
	Fri, 30 Aug 2024 15:33:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gHwDy/u1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06A4910E41E;
 Fri, 30 Aug 2024 15:33:26 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-5c210e23573so2023475a12.0; 
 Fri, 30 Aug 2024 08:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725032004; x=1725636804; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=onX9TgMztS+AtRtuVAlzrC/CqJy3l7QYXITQ0rkQ9ek=;
 b=gHwDy/u1UMyL/IeG9rIG+0IZDKrLe1HgLdAJaXB9lWhJPWTE9QHzvVbA33qpXBQvsN
 ayi5zTK6yp0YLxr3scvzbLZOvLwtnvzuaYW2qYsmvPRR1pYK7DgjRKTmxj5ls2alHcT2
 Kf6WihHxOgTFRqaTQtrEdGI/Li561xhiqBigdWSFJJTBzeDrqNTYsh8JwbJxUv7SEdYo
 1/0xVFwH/Ha9CHXu7RRAtWUYXBA8WGCHNs9+CW19CPaP2+mxVsNYjoP7fP5NBF9mMy3z
 JY7b/4GLRzNVTBsh3+sFE+iBd1ccpwKVOhq92e7YZ+NUiiFOoET/e/aa9omHUJk8h8BG
 7gWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725032004; x=1725636804;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=onX9TgMztS+AtRtuVAlzrC/CqJy3l7QYXITQ0rkQ9ek=;
 b=gl2SAZBEBzLZlvOTLzxQ7Ffy+QcITY2a1U3wiEkHRSqpKFYF/TTqewudKwGonlLHyw
 Ui4bkP7wpsh7wDZjfxPIAnGu28F81BpL/BMj3RbBqF9xvyITCtyv45ZfFndJRuZzp4QO
 uS9/i2Ewo9Q7YpH0VYPkBU4paRIde7W6MoQiJxGPQ/x1MsZLvMgP8EqDTTo1q2vCaCrR
 NZSJ5N9mX0K2CkP76g16Ja2XkhuYTNfzHMn46U1CPGVM3ye8ks0/FNX3l17cZXX8FePu
 kI5GUZ1etW2dQ6Xfb+icwSigviDc2VrcWiX+er2MP+DYVG9e8JM1Fw+FIHQ75robOQCG
 yfPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHPjecYwEND5n6zy/xSmkR27fk0iO9IRcoHPxk5UyFXj1PQEGsJoNxpuj3Q6igIPIMWOrs9q3WmPnx@lists.freedesktop.org,
 AJvYcCVTL1WEHqthO4Z9htRxObcGwfXHcUEAU1QQyajukeH8O7gMODvgfRndrICObCr3uE+SBYzn2Ss+paw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy6bWAcSOTVE2tN4ACOr36465g1Vr/hyDTfanV4j97MGjWKTXLE
 BhgciHq2KQ8HHu+eru71clcNvRdY1/Ju4lfjSoGDkji1W8W8W5Oy
X-Google-Smtp-Source: AGHT+IHB9ZPg55v/n2gXnxLNAL/25EVlhOMMgf95PotCactG2GY4cOFnR6rGlkPeRCLnJSMprzu+9w==
X-Received: by 2002:a17:907:7e92:b0:a86:7c6e:2bb9 with SMTP id
 a640c23a62f3a-a897f7892e8mr585327566b.2.1725032003525; 
 Fri, 30 Aug 2024 08:33:23 -0700 (PDT)
Received: from [192.168.1.14] (host-95-234-170-37.retail.telecomitalia.it.
 [95.234.170.37]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8988ff4233sm227157866b.25.2024.08.30.08.33.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Aug 2024 08:33:23 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Fri, 30 Aug 2024 17:32:49 +0200
Subject: [PATCH v2 7/9] drm/msm/A6xx: Add traces for preemption
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240830-preemption-a750-t-v2-7-86aeead2cd80@gmail.com>
References: <20240830-preemption-a750-t-v2-0-86aeead2cd80@gmail.com>
In-Reply-To: <20240830-preemption-a750-t-v2-0-86aeead2cd80@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Antonino Maniscalco <antomani103@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725031992; l=2568;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=/bmgkVC8rwc+TKtP3FRRWyhSKs+gBwS10uVvQNNUJKk=;
 b=cNQ1g0uB3jnEUtvQCKAHkyBnle3q4/z7/VO8HWkhRDPvCwPMksowqk5vCBIKbaf9+iaOyecmo
 zVTGu+CSJzLA6JWM+asHnoTbbVZ9rwCV4exkmNVQmBQSu2wv+naHf6k
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

Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
---
 drivers/gpu/drm/msm/adreno/a6xx_preempt.c |  7 +++++++
 drivers/gpu/drm/msm/msm_gpu_trace.h       | 28 ++++++++++++++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
index f586615db97e..bf05f987d3a2 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
@@ -7,6 +7,7 @@
 #include "a6xx_gpu.h"
 #include "a6xx_gmu.xml.h"
 #include "msm_mmu.h"
+#include "msm_gpu_trace.h"
 
 /*
  * Try to transition the preemption state from old to new. Return
@@ -143,6 +144,8 @@ void a6xx_preempt_irq(struct msm_gpu *gpu)
 
 	set_preempt_state(a6xx_gpu, PREEMPT_NONE);
 
+	trace_msm_gpu_preemption_irq(a6xx_gpu->cur_ring->id);
+
 	/*
 	 * Retrigger preemption to avoid a deadlock that might occur when preemption
 	 * is skipped due to it being already in flight when requested.
@@ -259,6 +262,10 @@ void a6xx_preempt_trigger(struct msm_gpu *gpu)
 	 */
 	ring->skip_inline_wptr = false;
 
+	trace_msm_gpu_preemption_trigger(
+		a6xx_gpu->cur_ring ? a6xx_gpu->cur_ring->id : -1,
+		ring ? ring->id : -1);
+
 	spin_unlock_irqrestore(&ring->preempt_lock, flags);
 
 	gpu_write64(gpu,
diff --git a/drivers/gpu/drm/msm/msm_gpu_trace.h b/drivers/gpu/drm/msm/msm_gpu_trace.h
index ac40d857bc45..7f863282db0d 100644
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
2.46.0

