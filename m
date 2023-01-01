Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C37FE65AA85
	for <lists+dri-devel@lfdr.de>; Sun,  1 Jan 2023 16:58:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F94310E040;
	Sun,  1 Jan 2023 15:57:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D747510E040
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Jan 2023 15:57:56 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id v23so16856684ljj.9
 for <dri-devel@lists.freedesktop.org>; Sun, 01 Jan 2023 07:57:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GmK50Derhy8DG3OEtg+Hdtx1MePNgHpvvawb/+qSrcA=;
 b=vv+CroYTfi4XhaSiDivLJutNM/bh6h4ubCFIUTFFCDONFWDUezkNerULBB1QsCkNV1
 uwZ98sRzTY0FRQZgNCy0GztcgDlPnnBzAv1oCwXEVCuSBZ6duc+eMbMdto9/0qD2ZJ+s
 n+orpr8FeOdZgahdIcbdRvENj55iiUQBccj/uGmma2/UipHijhtsBcPQr9QMGngGyvr5
 UPE+uXJNigD0eC3Y+AewlkVTEdFon5FwD2wau/qfAOnnIJuMo/vWNdIkHfyh+ZmHdECp
 NXxzyjympdl+Jxu5a0LZHQHv+LvHj3L8uFhZoF5fIWqjvqbXAJBADeDNaJ0mjBWbwArB
 NFDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GmK50Derhy8DG3OEtg+Hdtx1MePNgHpvvawb/+qSrcA=;
 b=yNPgJTOFZDShlqJgTgD2t74JwcZs+bgf9avSARCVZGXdA3E0F65Dzbyyqu2dZQHjWv
 HiJnp8aJQ44tHaRtvhc0bMMIDWhjWXEsofSxRtU+N3cBLo57SSmDudFWt7qVpxiJVSq9
 OFRr4yFnsAzDyva9W8VWNhRoUHBlbY5jyHrdsw4yOTx82TZ4mu/dXc7X/1NNbIjDcU1r
 q5bNLhVhPBZA4pgu2aBme1njR2RE812k5qDS+PP3Sq3pIUxPVY8iE1gGo3HXcywwkxSs
 oiQanFCWxGaimyHylrG8VM58R00/ZNqWoXYs2EIvW/h/y2QfBkglMZuK5mHO98ZjWabE
 8M4Q==
X-Gm-Message-State: AFqh2krsu5pjwA3CcLwJnwoXetA53nCrtXBJCdVom1y6rFHwyG7/o5yS
 dNn6P+qWdYE1fF0mpwFIn4b1eQ==
X-Google-Smtp-Source: AMrXdXstXPRodKuCWK+cyMtVFd6+Xv8DqjKIHZuh2IreSxkwjxM8YPz/l6FoN7QDz69VYozWeeOwBQ==
X-Received: by 2002:a05:651c:1c9:b0:279:fc43:e704 with SMTP id
 d9-20020a05651c01c900b00279fc43e704mr11653099ljn.47.1672588674859; 
 Sun, 01 Jan 2023 07:57:54 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 a17-20020a05651c031100b0027738fd1eb6sm3107821ljp.110.2023.01.01.07.57.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Jan 2023 07:57:54 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH] drm/msm/a2xx: support loading legacy (iMX) firmware
Date: Sun,  1 Jan 2023 17:57:53 +0200
Message-Id: <20230101155753.779176-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
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
Cc: freedreno@lists.freedesktop.org, Jonathan Marek <jonathan@marek.ca>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Support loading A200 firmware generated from the iMX firmware header
files. The firmware lacks protection support, however it allows GPU to
function properly while using the firmware files with clear license
which allows redistribution.

Cc: Jonathan Marek <jonathan@marek.ca>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a2xx_gpu.c | 27 +++++++++++++++++++++++----
 drivers/gpu/drm/msm/adreno/a2xx_gpu.h |  1 +
 2 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
index 6c9a747eb4ad..c67089a7ebc1 100644
--- a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
@@ -53,6 +53,8 @@ static void a2xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 
 static bool a2xx_me_init(struct msm_gpu *gpu)
 {
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a2xx_gpu *a2xx_gpu = to_a2xx_gpu(adreno_gpu);
 	struct msm_ringbuffer *ring = gpu->rb[0];
 
 	OUT_PKT3(ring, CP_ME_INIT, 18);
@@ -84,15 +86,20 @@ static bool a2xx_me_init(struct msm_gpu *gpu)
 	/* NQ and External Memory Swap */
 	OUT_RING(ring, 0x00000000);
 	/* protected mode error checking (0x1f2 is REG_AXXX_CP_INT_CNTL) */
-	OUT_RING(ring, 0x200001f2);
+	if (a2xx_gpu->protection_disabled)
+		OUT_RING(ring, 0x00000000);
+	else
+		OUT_RING(ring, 0x200001f2);
 	/* Disable header dumping and Header dump address */
 	OUT_RING(ring, 0x00000000);
 	/* Header dump size */
 	OUT_RING(ring, 0x00000000);
 
-	/* enable protected mode */
-	OUT_PKT3(ring, CP_SET_PROTECTED_MODE, 1);
-	OUT_RING(ring, 1);
+	if (!a2xx_gpu->protection_disabled) {
+		/* enable protected mode */
+		OUT_PKT3(ring, CP_SET_PROTECTED_MODE, 1);
+		OUT_RING(ring, 1);
+	}
 
 	adreno_flush(gpu, ring, REG_AXXX_CP_RB_WPTR);
 	return a2xx_idle(gpu);
@@ -101,6 +108,7 @@ static bool a2xx_me_init(struct msm_gpu *gpu)
 static int a2xx_hw_init(struct msm_gpu *gpu)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a2xx_gpu *a2xx_gpu = to_a2xx_gpu(adreno_gpu);
 	dma_addr_t pt_base, tran_error;
 	uint32_t *ptr, len;
 	int i, ret;
@@ -221,6 +229,17 @@ static int a2xx_hw_init(struct msm_gpu *gpu)
 	len = adreno_gpu->fw[ADRENO_FW_PM4]->size / 4;
 	DBG("loading PM4 ucode version: %x", ptr[1]);
 
+	/*
+	 * New firmware files seem to have GPU and firmware version in this
+	 * word (0x20xxxx for A200, 0x220xxx for A220, 0x225xxx for A225).
+	 * Older firmware files, which lack protection support, have 0 instead.
+	 */
+	if (ptr[1] == 0) {
+		dev_warn(gpu->dev->dev,
+			 "Legacy firmware detected, disabling protection support\n");
+		a2xx_gpu->protection_disabled = true;
+	}
+
 	gpu_write(gpu, REG_AXXX_CP_DEBUG,
 			AXXX_CP_DEBUG_MIU_128BIT_WRITE_ENABLE);
 	gpu_write(gpu, REG_AXXX_CP_ME_RAM_WADDR, 0);
diff --git a/drivers/gpu/drm/msm/adreno/a2xx_gpu.h b/drivers/gpu/drm/msm/adreno/a2xx_gpu.h
index 02fba2cb8932..161a075f94af 100644
--- a/drivers/gpu/drm/msm/adreno/a2xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a2xx_gpu.h
@@ -15,6 +15,7 @@
 struct a2xx_gpu {
 	struct adreno_gpu base;
 	bool pm_enabled;
+	bool protection_disabled;
 };
 #define to_a2xx_gpu(x) container_of(x, struct a2xx_gpu, base)
 
-- 
2.39.0

