Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3828A45CF42
	for <lists+dri-devel@lfdr.de>; Wed, 24 Nov 2021 22:37:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4A0A6EDED;
	Wed, 24 Nov 2021 21:37:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5C426EDEC;
 Wed, 24 Nov 2021 21:37:37 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 nh10-20020a17090b364a00b001a69adad5ebso3940015pjb.2; 
 Wed, 24 Nov 2021 13:37:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yTbQCjulQBoWfNm8VTWUyI1TCP6QzxDwt8c6rBboG24=;
 b=DsPEv8IFzOcaBYcPcOuPtreqIjaPeD5EwaiB3duk9luTEQXdzyPAXIDMnaJi3GFhd1
 D7w6FO0/xirYyx23Z8xpBv8maclCfpEnIlwcOS5D3EpetpaJpUiagNGbRGF4DfPHjWKp
 nTa4yun0rieNXobyXeFVvZO0EseyH+8puKHJo4tFHCj3pOecldjNsDaiXf3Z7KkbFiIe
 0LsJKKbz5QlPfLLjsa8DBT4r/HftW6oJT3IJnQ90J6eHgLy6t/4Y86XDczuhfM8oTrGW
 z/axZh0kFLf9nptE1cRE0iDFtqdduNaUwwqDaNbcpDmI3S13QK7MjuAhCp77TNv+i+aj
 JUNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yTbQCjulQBoWfNm8VTWUyI1TCP6QzxDwt8c6rBboG24=;
 b=fttZElWpFUfI2gJltxWGyh+5aTPBT8Wp5SSlHgqkbfxPLGXehwWgn8WeNhVWkeiovv
 q/TpdqdGIh+ybaQg3gYwUecjXNV6A2iUn00YDImI5ysWZSUVOfcSW5YOJZEDUNn5uer9
 mlHh/HnUaKPYW8Y1AbO+z3VdX+i7AHeNdNk1n5YmAolUzyY8u0JqqppV7hP4pwLZgNQ0
 JC/6fINyH7QLSGeMex6JeDgQNVSfNcl+MrMfEExONyqDn1FD9H+N4jzdWPlMkEi5fBtt
 3UMWSr6Y0NTGO1AZrBiC4DHcMP0D7RWicGqjyDOByCwW6gJHm+4ttQL2hNAA813QCbsO
 WUwg==
X-Gm-Message-State: AOAM531cD/3+x/8fgGlkAEa58o52jJZBSEJUy1GfZKKODyNmlp9ggtdW
 +migyp0NGc47K6Ljzenewx53UVXSN9E=
X-Google-Smtp-Source: ABdhPJz9Mmil4+4+Ed7DAslPNuwEoe+cRh9O085x7A67qlbViJUVHCJ3XNrVOV78FUCiia3X+45mNQ==
X-Received: by 2002:a17:903:248c:b0:142:9bf:8b0 with SMTP id
 p12-20020a170903248c00b0014209bf08b0mr23087864plw.70.1637789856787; 
 Wed, 24 Nov 2021 13:37:36 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 h3sm691398pfi.207.2021.11.24.13.37.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Nov 2021 13:37:35 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 6/7] drm/msm/gpu: Snapshot GMU debug buffer
Date: Wed, 24 Nov 2021 13:41:34 -0800
Message-Id: <20211124214151.1427022-10-robdclark@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211124214151.1427022-1-robdclark@gmail.com>
References: <20211124214151.1427022-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Douglas Anderson <dianders@chromium.org>, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Lee Jones <lee.jones@linaro.org>, freedreno@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

It appears to be a GMU fw build option whether it does anything with
debug and log buffers, but if they are all zeros it won't add anything
to the devcore size.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index a84ba8982cb8..bdd0059a81ff 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -44,6 +44,7 @@ struct a6xx_gpu_state {
 
 	struct msm_gpu_state_bo *gmu_log;
 	struct msm_gpu_state_bo *gmu_hfi;
+	struct msm_gpu_state_bo *gmu_debug;
 
 	s32 hfi_queue_history[2][HFI_HISTORY_SZ];
 
@@ -983,6 +984,7 @@ struct msm_gpu_state *a6xx_gpu_state_get(struct msm_gpu *gpu)
 
 	a6xx_state->gmu_log = a6xx_snapshot_gmu_bo(a6xx_state, &a6xx_gpu->gmu.log);
 	a6xx_state->gmu_hfi = a6xx_snapshot_gmu_bo(a6xx_state, &a6xx_gpu->gmu.hfi);
+	a6xx_state->gmu_debug = a6xx_snapshot_gmu_bo(a6xx_state, &a6xx_gpu->gmu.debug);
 
 	a6xx_snapshot_gmu_hfi_history(gpu, a6xx_state);
 
@@ -1274,6 +1276,16 @@ void a6xx_show(struct msm_gpu *gpu, struct msm_gpu_state *state,
 				&gmu_hfi->encoded);
 	}
 
+	drm_puts(p, "gmu-debug:\n");
+	if (a6xx_state->gmu_debug) {
+		struct msm_gpu_state_bo *gmu_debug = a6xx_state->gmu_debug;
+
+		drm_printf(p, "    iova: 0x%016llx\n", gmu_debug->iova);
+		drm_printf(p, "    size: %zu\n", gmu_debug->size);
+		adreno_show_object(p, &gmu_debug->data, gmu_debug->size,
+				&gmu_debug->encoded);
+	}
+
 	drm_puts(p, "registers:\n");
 	for (i = 0; i < a6xx_state->nr_registers; i++) {
 		struct a6xx_gpu_state_obj *obj = &a6xx_state->registers[i];
-- 
2.33.1

