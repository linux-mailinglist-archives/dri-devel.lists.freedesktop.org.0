Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5F8415365
	for <lists+dri-devel@lfdr.de>; Thu, 23 Sep 2021 00:26:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E986C6E063;
	Wed, 22 Sep 2021 22:26:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B67CD6E062;
 Wed, 22 Sep 2021 22:26:12 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id k24so4289005pgh.8;
 Wed, 22 Sep 2021 15:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=G/zb0HSEtwt+TuMHQ23TE4WThN1tewxp8QdQarat10c=;
 b=IMGDv8ubtfUpAMuwcf3oxRLCRWUZ2KL/o71nRIj0mqJDBGor0+iBXo6iPgB68+3wPl
 G2ai7d1f/T0PH3JkT3cHSHTq/k9c+MPr+qq+WX0SSLgz+WdkVvB2IJPnFNgm3Ca3WZ8b
 Nsy61GteFFUOjko7X+TEsPIC7Bxz1EpPNJJg5Z1/P+8PZnWXyKMv/w7dEzYjkjnj/GaF
 i5CUhG9vGeLZNc/Jd3ByJbqysFz80Yw4bGAiZki3A/QKt6W2Tt0R+E+vvGArU0Xue0+q
 kEzC4InGpdfZfHr5NwK8z+Jh2cJm+POzCy+L/jrrwTFDc7firFRoAQQFOqoTh9C/oqII
 hyJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=G/zb0HSEtwt+TuMHQ23TE4WThN1tewxp8QdQarat10c=;
 b=yyRjFH9wjaw1uQWfg84NRg6+pELirWgSoQjTVrbPiQ+8hMWH7/J/OJ5UaNol0eENZM
 5OET+zdzbJ4wFuYmlclU0UG2ttarw5vzwK7IfFkDz+OLz1aIwnGIVgFLnEUkzq9p888N
 IRl0Z667B64+MoNg8nPpKgen+nR6/oR8gzeZJn7CLsmypaasdnpW2Wt1rDHtuISv5QEX
 Vwo2QEJ0UPCYDw6ht6gvovCz9SDw0t+5JSb1geeqE3xjssY1LKIAMLMAqM87IITjhg6U
 UVXIHpCMh6DbYQUStmdzzV3yTvfHsGoOf/1wfO5/rm1dlIO1csZ70j1zk3wlt8ieFais
 +lJw==
X-Gm-Message-State: AOAM5310MxPVQh4mEEVGBQYO5TqrkTNUx3/aJkde3Dda7wNL/OJ50SbV
 RE9EI1ZJuXKtuiqbQ5pyePYqF8/P76o=
X-Google-Smtp-Source: ABdhPJyEaxrISg1ldQ3XTH74HWEYwS2LTHtSYOQ6mkIiBPEOwgUTxUANK6gqv131WSnaaXiHO1NVEw==
X-Received: by 2002:a63:2b4b:: with SMTP id r72mr1120554pgr.57.1632349571580; 
 Wed, 22 Sep 2021 15:26:11 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 9sm7100234pjs.14.2021.09.22.15.26.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Sep 2021 15:26:10 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Rob Clark <robdclark@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Jordan Crouse <jordan@cosmicpenguin.net>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 Jonathan Marek <jonathan@marek.ca>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Douglas Anderson <dianders@chromium.org>, Dave Airlie <airlied@redhat.com>,
 Stephen Boyd <swboyd@chromium.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/3] drm/msm: Show all smmu info for iova fault devcore dumps
Date: Wed, 22 Sep 2021 15:30:22 -0700
Message-Id: <20210922223029.495772-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210922223029.495772-1-robdclark@gmail.com>
References: <20210922223029.495772-1-robdclark@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   |  2 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 25 +++++++++++++++++--------
 drivers/gpu/drm/msm/msm_gpu.h           |  2 +-
 3 files changed, 19 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 4ac652c35c43..f6a4dbef796b 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1269,7 +1269,7 @@ static int a6xx_fault_handler(void *arg, unsigned long iova, int flags, void *da
 		/* Turn off the hangcheck timer to keep it from bothering us */
 		del_timer(&gpu->hangcheck_timer);
 
-		gpu->fault_info.ttbr0 = info->ttbr0;
+		gpu->fault_info.smmu_info = *info;
 		gpu->fault_info.iova  = iova;
 		gpu->fault_info.flags = flags;
 		gpu->fault_info.type  = type;
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 748665232d29..42e522a60623 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -685,19 +685,28 @@ void adreno_show(struct msm_gpu *gpu, struct msm_gpu_state *state,
 			adreno_gpu->rev.major, adreno_gpu->rev.minor,
 			adreno_gpu->rev.patchid);
 	/*
-	 * If this is state collected due to iova fault, so fault related info
+	 * If this is state collected due to iova fault, show fault related
+	 * info
 	 *
-	 * TTBR0 would not be zero, so this is a good way to distinguish
+	 * TTBR0 would not be zero in this case, so this is a good way to
+	 * distinguish
 	 */
-	if (state->fault_info.ttbr0) {
+	if (state->fault_info.smmu_info.ttbr0) {
 		const struct msm_gpu_fault_info *info = &state->fault_info;
+		const struct adreno_smmu_fault_info *smmu_info = &info->smmu_info;
 
 		drm_puts(p, "fault-info:\n");
-		drm_printf(p, "  - ttbr0=%.16llx\n", info->ttbr0);
-		drm_printf(p, "  - iova=%.16lx\n", info->iova);
-		drm_printf(p, "  - dir=%s\n", info->flags & IOMMU_FAULT_WRITE ? "WRITE" : "READ");
-		drm_printf(p, "  - type=%s\n", info->type);
-		drm_printf(p, "  - source=%s\n", info->block);
+		drm_printf(p, "  - far: %.16llx\n", smmu_info->far);
+		drm_printf(p, "  - ttbr0: %.16llx\n", smmu_info->ttbr0);
+		drm_printf(p, "  - contextidr: %.8x\n", smmu_info->contextidr);
+		drm_printf(p, "  - fsr: %.8x\n", smmu_info->fsr);
+		drm_printf(p, "  - fsynr0: %.8x\n", smmu_info->fsynr0);
+		drm_printf(p, "  - fsynr1: %.8x\n", smmu_info->fsynr1);
+		drm_printf(p, "  - cbfrsynra: %.8x\n", smmu_info->cbfrsynra);
+		drm_printf(p, "  - iova: %.16lx\n", info->iova);
+		drm_printf(p, "  - dir: %s\n", info->flags & IOMMU_FAULT_WRITE ? "WRITE" : "READ");
+		drm_printf(p, "  - type: %s\n", info->type);
+		drm_printf(p, "  - source: %s\n", info->block);
 	}
 
 	drm_printf(p, "rbbm-status: 0x%08x\n", state->rbbm_status);
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index e031c9b495ed..a7a5a53536a8 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -73,7 +73,7 @@ struct msm_gpu_funcs {
 
 /* Additional state for iommu faults: */
 struct msm_gpu_fault_info {
-	u64 ttbr0;
+	struct adreno_smmu_fault_info smmu_info;
 	unsigned long iova;
 	int flags;
 	const char *type;
-- 
2.31.1

