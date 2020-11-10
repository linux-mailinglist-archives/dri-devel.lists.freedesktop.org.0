Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 235762ADE95
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 19:42:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E09B89ABA;
	Tue, 10 Nov 2020 18:42:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79EC789ABA;
 Tue, 10 Nov 2020 18:42:23 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id x15so6101033pll.2;
 Tue, 10 Nov 2020 10:42:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Aoj89WmcaMMxtRZJCP7ES6axMtLpeMz4nvf536ZBRdM=;
 b=UH+Sdgv4Jw0IYY6nICZUclvd441VpcOTKJSRDbN2UxfCyy+R6yhqyAdPsiy/FlEkef
 OdR6BJNAjslO9MjXZJPMmiRDyFOZ72i5feFG/pUUBogLQMLme2unL1+XgcHy/Edxk7I6
 Lf6sxh7MBZkKk9yrwrW07/Gkyqaf3fE4Emg/rw2GrqTAYtW9JoyTa8QZm+/Q+Kd7qoOm
 FAUBRJnVOLjAFHmyW/Sin8w8aGtqtabyBYCxKRh6BoarUTWarV3zccmWPzSCxQ0nyX7c
 2mm8NhVaBMdIlB3eGius33oxaVdcqhcN+Lu4ba79GcyZPXC3xLj5u0Ie/nlSX7ex2HEq
 e7hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Aoj89WmcaMMxtRZJCP7ES6axMtLpeMz4nvf536ZBRdM=;
 b=uQQ1y5kaAyrvkxQgujE87lupWgsbHwwutdqSyjKhSs82o3FyHmmXVBHVGL/gMCzQhJ
 FWvSLnAwQN3Y6DBPhhXPR7/WMWekhYxQnBFKRuuIXMDh9XFn6O6/Z91N4ESKH9ZCQQKr
 CudaiEv4kwTipNEv1v2NRQpacEw4mGV5uoNlQayMwgyhP/2fMQUf+MHw3928Nh2mMTKD
 2Nf46ihfMKX3ASS1aV3EX0gjU3+ELwdaAebzlViYOeA6nyZ3seUew9D2KnC1qH5LVwWv
 mRoEXroLoVLJtSTdakeGd4VFBD06FOAEk3NdTtmxFfD5keq+VtsQh03OeZ5tevUt9+32
 vAPA==
X-Gm-Message-State: AOAM531UOB2JZEoaG70oHssI4uxJupbVMi0+l3SzQJ0juxT6CNCeOjK5
 ByIMnBcCtLyFeTi+OggHC0jVT6o8pb0=
X-Google-Smtp-Source: ABdhPJwLq87EjJQigjjYbupc+fu/mpLvm2voU3nXL/VLwi8dNJibezorLF7yq2pa5oiLPbrVCfu5EQ==
X-Received: by 2002:a17:902:bb8c:b029:d2:2503:e458 with SMTP id
 m12-20020a170902bb8cb02900d22503e458mr17786908pls.18.1605033742518; 
 Tue, 10 Nov 2020 10:42:22 -0800 (PST)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id cv4sm4051283pjb.1.2020.11.10.10.42.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 10:42:21 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/msm/a5xx: Clear shadow on suspend
Date: Tue, 10 Nov 2020 10:44:00 -0800
Message-Id: <20201110184401.282982-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201110184401.282982-1-robdclark@gmail.com>
References: <20201110184401.282982-1-robdclark@gmail.com>
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
 <freedreno@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 "Kristian H. Kristensen" <hoegsberg@google.com>, Sean Paul <sean@poorly.run>,
 open list <linux-kernel@vger.kernel.org>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Similar to the previous patch, clear shadow on suspend to avoid timeouts
waiting for ringbuffer space.

Fixes: 8907afb476ac ("drm/msm: Allow a5xx to mark the RPTR shadow as privileged")
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index b0005ccd81c6..8fa5c917d017 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -1206,7 +1206,9 @@ static int a5xx_pm_resume(struct msm_gpu *gpu)
 static int a5xx_pm_suspend(struct msm_gpu *gpu)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a5xx_gpu *a5xx_gpu = to_a5xx_gpu(adreno_gpu);
 	u32 mask = 0xf;
+	int i, ret;
 
 	/* A510 has 3 XIN ports in VBIF */
 	if (adreno_is_a510(adreno_gpu))
@@ -1226,7 +1228,15 @@ static int a5xx_pm_suspend(struct msm_gpu *gpu)
 	gpu_write(gpu, REG_A5XX_RBBM_BLOCK_SW_RESET_CMD, 0x003C0000);
 	gpu_write(gpu, REG_A5XX_RBBM_BLOCK_SW_RESET_CMD, 0x00000000);
 
-	return msm_gpu_pm_suspend(gpu);
+	ret = msm_gpu_pm_suspend(gpu);
+	if (ret)
+		return ret;
+
+	if (a5xx_gpu->has_whereami)
+		for (i = 0; i < gpu->nr_rings; i++)
+			a5xx_gpu->shadow[i] = 0;
+
+	return 0;
 }
 
 static int a5xx_get_timestamp(struct msm_gpu *gpu, uint64_t *value)
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
