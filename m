Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C741259497
	for <lists+dri-devel@lfdr.de>; Tue,  1 Sep 2020 17:41:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 038256E876;
	Tue,  1 Sep 2020 15:41:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 934336E879;
 Tue,  1 Sep 2020 15:41:19 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id 31so862611pgy.13;
 Tue, 01 Sep 2020 08:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7KqqN6K3kTsWHUwp2VvfDs43IyNlxmbh5Rz2H4DpXUY=;
 b=MvTcpkuWrabD04S1aEsSpjZHdD73NAt33h8AERs424BwAOPPWupOWGhDL8C4WysYQZ
 41ggRfkqK0UZfEMslBFKEbSzQSlVvulfxCMW2E8xy8hHHHhiiQGx3Ha3D1WYaa9sTc3X
 s/YwgBWcXjCh81KUhuirw1ap/a5dJKqgzvFkBGWkqZUUiYltChmcA5pNtKY66JE0QK5j
 C7fgThG8sVRMDUYVNo/tpLW7DsYRZkU8IHMcjqCStaOQdfkLIR/duqoLgVRLC3b+z595
 rojXUfSiBvSTUXpOs/l0T8gTL9JwVkWdLEbzoXC0wAD///WBr4JCzivhk11lGUsGqCGU
 C8IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7KqqN6K3kTsWHUwp2VvfDs43IyNlxmbh5Rz2H4DpXUY=;
 b=eZqHMVsMzh9j9N0ZFPIaifHds7xnSd6dEIdiOZQ7ijaLhxDn8gPEcE0xtmt4+8E8V7
 iGE1bvv3nbw6sL/pKV1iRUGMu/ZfkRPozY53OPaa1fr06dXU7IqgIUHRun21y7GiLqKK
 nBYN5Xf2SnN7dsBepBVN779wd2Ka9pTwXXz7nKLV21gHQJoYY6cgGTCnaP1tq6eUOvH7
 mrPdYfkxbBObwgFVci0xSx7gK9BOjDdl8F2xqeNebakz8wzjkVnJ6ku0GO81VFYS2+TL
 K5a/7BPpUTpT/1WXkRojIfXzsxVGhjcMtJDY1Wvo6wMKC1UYAz+RLnN+76+QGOv2oxoB
 0GHA==
X-Gm-Message-State: AOAM530cKS/M0dw9zcBOgpHJSNuSRIeGroldvu6k3SFrYpGHxFV2QMOP
 aBBshvuGnsQFzMt2c9M/uJOceIUTGhsIng==
X-Google-Smtp-Source: ABdhPJx/KUf682r2Q/Pzf9hmQEXca9myE+iw7tLtWfLbi+QoMiwtNbP5nGWRrF9YVDIFr3rsJZy7dA==
X-Received: by 2002:aa7:9556:: with SMTP id w22mr2393992pfq.245.1598974878560; 
 Tue, 01 Sep 2020 08:41:18 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id w3sm2487343pff.56.2020.09.01.08.41.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2020 08:41:17 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] drm/msm/gpu: Add suspend/resume tracepoints
Date: Tue,  1 Sep 2020 08:41:56 -0700
Message-Id: <20200901154200.2451899-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200901154200.2451899-1-robdclark@gmail.com>
References: <20200901154200.2451899-1-robdclark@gmail.com>
MIME-Version: 1.0
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
I'm not sure if there is a better way to do no-arg tracepoints?  The
trace framework seems to go out of it's way to make this difficult.
Or maybe there is a more obvious thing that I'm not seeing.

 drivers/gpu/drm/msm/adreno/a6xx_gpu.c |  4 ++++
 drivers/gpu/drm/msm/msm_gpu.c         |  2 ++
 drivers/gpu/drm/msm/msm_gpu_trace.h   | 26 ++++++++++++++++++++++++++
 3 files changed, 32 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index c5a3e4d4c007..2de280e45077 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -923,6 +923,8 @@ static int a6xx_pm_resume(struct msm_gpu *gpu)
 
 	gpu->needs_hw_init = true;
 
+	trace_msm_gpu_resume(0);
+
 	ret = a6xx_gmu_resume(a6xx_gpu);
 	if (ret)
 		return ret;
@@ -937,6 +939,8 @@ static int a6xx_pm_suspend(struct msm_gpu *gpu)
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
 
+	trace_msm_gpu_suspend(0);
+
 	devfreq_suspend_device(gpu->devfreq.devfreq);
 
 	return a6xx_gmu_stop(a6xx_gpu);
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index b02866527386..5ceb2a966a87 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -202,6 +202,7 @@ int msm_gpu_pm_resume(struct msm_gpu *gpu)
 	int ret;
 
 	DBG("%s", gpu->name);
+	trace_msm_gpu_resume(0);
 
 	ret = enable_pwrrail(gpu);
 	if (ret)
@@ -227,6 +228,7 @@ int msm_gpu_pm_suspend(struct msm_gpu *gpu)
 	int ret;
 
 	DBG("%s", gpu->name);
+	trace_msm_gpu_suspend(0);
 
 	devfreq_suspend_device(gpu->devfreq.devfreq);
 
diff --git a/drivers/gpu/drm/msm/msm_gpu_trace.h b/drivers/gpu/drm/msm/msm_gpu_trace.h
index 1079fe551279..03e0c2536b94 100644
--- a/drivers/gpu/drm/msm/msm_gpu_trace.h
+++ b/drivers/gpu/drm/msm/msm_gpu_trace.h
@@ -140,6 +140,32 @@ TRACE_EVENT(msm_gem_purge_vmaps,
 		TP_printk("Purging %u vmaps", __entry->unmapped)
 );
 
+
+TRACE_EVENT(msm_gpu_suspend,
+		TP_PROTO(int dummy),
+		TP_ARGS(dummy),
+		TP_STRUCT__entry(
+			__field(u32, dummy)
+			),
+		TP_fast_assign(
+			__entry->dummy = dummy;
+			),
+		TP_printk("%u", __entry->dummy)
+);
+
+
+TRACE_EVENT(msm_gpu_resume,
+		TP_PROTO(int dummy),
+		TP_ARGS(dummy),
+		TP_STRUCT__entry(
+			__field(u32, dummy)
+			),
+		TP_fast_assign(
+			__entry->dummy = dummy;
+			),
+		TP_printk("%u", __entry->dummy)
+);
+
 #endif
 
 #undef TRACE_INCLUDE_PATH
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
