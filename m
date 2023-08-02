Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C3C76DA73
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 00:11:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C549410E06A;
	Wed,  2 Aug 2023 22:10:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1451F10E05D;
 Wed,  2 Aug 2023 22:10:57 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-686f94328a4so230451b3a.0; 
 Wed, 02 Aug 2023 15:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691014256; x=1691619056;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZS7jKywCwzPEYTek2DVZfa+QW/jrs4EVMkt69yjjB4g=;
 b=DM5GmrSrp7pkb96vFp0am+4e0FOtX8mlij/Tn+iVrr8Ot2sIwBau8udRx3G/H77fGB
 xuqQ6Zg/gZv/DNaq+ZWWWPcR2KmOVYyev64d3HQV6c+LGsiKZruxPXKKGaPr8nmLuztM
 mGseP5Re6VhyufBN1pVpf/Dca5YRxjO3wnkSlvveH72a86YvDYY4f+fuePY3H1tvnPBz
 FzSyXTfclNUFncdAMwlPtT/+gJqZn2M6VYbuOODH5jS8bLjv0WFcA6p2GAX/g2Wq+Xs3
 kkB7H7BOxODlq5DMtwOlNB4uNVFSbAA7I/dDzpYXI50vm3g/Coxii9wJe0prkhOh1td6
 ggsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691014256; x=1691619056;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZS7jKywCwzPEYTek2DVZfa+QW/jrs4EVMkt69yjjB4g=;
 b=WE++pz/HHRoEH9JcUzUzMl5SYmS/foqtunBZjLZQknIfu/xu2f7MdgxZkpAeEkSdgE
 ATmFhvpaF1zboP4Ko/cYPnwmiNfEdD6uiyu2ZnBRkGFLASYVUD6mkKfCi5n/L/IADuOv
 wMP466ew5H7fEez+kVcV8+WaTXNJCGzzGJ9dfYVo14H+ITnrZcPBbyMiWfgZApmzV3nR
 fW7M40Ix14Oi4h8ycChuS+/XxMyvdouNs7P+g86+66fgAXDCWLhRFgBhDH72S5hcfOYN
 YKW729a85aePKuQk1ajbEAhzIqxg3/KjrlQ6KEaw6RvhYWegiUZ3+Oqwr+b78HDdD9Y/
 tAAQ==
X-Gm-Message-State: ABy/qLa9yP6pXW5Rk2XbHNSSw1o+ep9oABhDg/QIcXPtCg3BHUUBq0R/
 uNtlEV59MhkZ+Zj0Nmouw3i3ZfOYAZQ=
X-Google-Smtp-Source: APBJJlFEQNzOIOSaw5Pe1VIp3Muf2+ySX824Yhcd2Q2fgmtJ9+vtqc93rg73zYoliwszPRCir3NZjw==
X-Received: by 2002:a05:6a00:847:b0:67a:52a7:b278 with SMTP id
 q7-20020a056a00084700b0067a52a7b278mr22331335pfk.9.1691014255942; 
 Wed, 02 Aug 2023 15:10:55 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:33de:aac3:fe1d:788])
 by smtp.gmail.com with ESMTPSA id
 ey2-20020a056a0038c200b006829969e3b0sm11460134pfb.85.2023.08.02.15.10.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Aug 2023 15:10:55 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC] drm/msm: Disallow relocs on a6xx+
Date: Wed,  2 Aug 2023 15:10:44 -0700
Message-ID: <20230802221047.9944-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.41.0
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
 Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Mesa stopped using these pretty early in a6xx bringup.  Take advantage
of this to disallow some legacy UABI.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
So, it was late 2018 when mesa stopped using relocs.  At that point a6xx
support was still in a pretty early state.  I guess you _could_ use such
an old version of mesa with a6xx hw.. but you really shouldn't.

 drivers/gpu/drm/msm/adreno/adreno_gpu.c |  2 ++
 drivers/gpu/drm/msm/msm_gem_submit.c    | 10 ++++++++++
 drivers/gpu/drm/msm/msm_gpu.h           |  9 +++++++++
 3 files changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index ba35c2a87021..695cce82d914 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -1078,6 +1078,8 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 	adreno_gpu->info = config->info;
 	adreno_gpu->chip_id = config->chip_id;
 
+	gpu->allow_relocs = config->info->family < ADRENO_6XX_GEN1;
+
 	/* Only handle the core clock when GMU is not in use (or is absent). */
 	if (adreno_has_gmu_wrapper(adreno_gpu) ||
 	    adreno_gpu->info->family < ADRENO_6XX_GEN1) {
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 63c96416e183..3b908f9f5493 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -882,6 +882,16 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 		if (submit->valid)
 			continue;
 
+		if (!gpu->allow_relocs) {
+			if (submit->cmd[i].nr_relocs) {
+				DRM_ERROR("relocs not allowed\n");
+				ret = -EINVAL;
+				goto out;
+			}
+
+			continue;
+		}
+
 		ret = submit_reloc(submit, msm_obj, submit->cmd[i].offset * 4,
 				submit->cmd[i].nr_relocs, submit->cmd[i].relocs);
 		if (ret)
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 7a4fa1b8655b..4252e3839fbc 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -285,6 +285,15 @@ struct msm_gpu {
 	/* True if the hardware supports expanded apriv (a650 and newer) */
 	bool hw_apriv;
 
+	/**
+	 * @allow_relocs: allow relocs in SUBMIT ioctl
+	 *
+	 * Mesa won't use relocs for driver version 1.4.0 and later.  This
+	 * switch-over happened early enough in mesa a6xx bringup that we
+	 * can disallow relocs for a6xx and newer.
+	 */
+	bool allow_relocs;
+
 	struct thermal_cooling_device *cooling;
 };
 
-- 
2.41.0

