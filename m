Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A1E6DE0DA
	for <lists+dri-devel@lfdr.de>; Tue, 11 Apr 2023 18:19:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ACDB10E5BE;
	Tue, 11 Apr 2023 16:19:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EB8610E23A
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Apr 2023 16:19:07 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id d7so22211803lfj.3
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Apr 2023 09:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681229946;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Zg2u5cQudfufm2tiNQqtM0BKS2NlQC2p1HPqtvrONfo=;
 b=aO/DfLCbvLl3InM0XhqmTdm87KLkEBZ/lUMnyWl8gXki92fKRivzLJ900Gt89BhcIB
 WB5sNprVSvcyEc8Ge6zC0jr9CDC7byZo614m1AkhiWRcRNwYewqasjJgTckBhZQH93yg
 W1sqXclacOyx2bz8Ts2CbF41xEQ/BaSkskCXmKEnEHXPGtAw1V1ReNlML2XKPZ5elerS
 o0cMHbhSkwIsirC4za7WafZpcgSEdaTUIUXZgk6qr0rWMqGyFXYUG7cTey1WcL4uM/q7
 2v2APmeTotxdGe0dQSSH5PuL9zMi8R3H/SbiiVc7vc5P+DZ+FBdibmenxFf1/Fxt7m7O
 ttHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681229946;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Zg2u5cQudfufm2tiNQqtM0BKS2NlQC2p1HPqtvrONfo=;
 b=p61iA+JJwBarbfZSSY/DwCpW5Z8QKCGN4Ey25HZ1EpYM9x/W//u+eodQieM0F+vtwx
 1oj676YZJS6hv0V0bqmyIB2lJ0o9HMWvHPnMET3b0/VOtV7dSHwzmYYLgaqNC9AfNcFh
 t+AJnrwezazA0AOSvgXUn7k+NVPHVxc5ZxMsh1Oj/z6k22nfnOT9gvmeEVaul92NPlyK
 Z2Ao+PVUs7bYBH5hQpS6V+oLSsS4x6MPX9nsAtbLutB8m8qus/FCTx0Fivqxzv1rJFVM
 XXnKeQZkfjLT5u475cEHDWlHYpaI7hgA2YkNtLCqUHEfFf0ua5KuTo4yHLgfsWL6Ik8q
 wl4g==
X-Gm-Message-State: AAQBX9fI7JhHWV3ty0qPDWhoS4+CmfV44H8WvuO6RWhXZRwu6yp15mYV
 hZQxfc4FC1JA73oo2osTe19S+g==
X-Google-Smtp-Source: AKy350YCKfAeOxIRnegs7LlJ8yQz2YQv/KwMyHgsavnBuSu6PvdZISFQuv8GnHkXMWA7b7FWRZYNiQ==
X-Received: by 2002:ac2:530a:0:b0:4eb:1361:895c with SMTP id
 c10-20020ac2530a000000b004eb1361895cmr5071091lfh.55.1681229945786; 
 Tue, 11 Apr 2023 09:19:05 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 b30-20020a056512025e00b004ec55ac6cd1sm2426467lfo.136.2023.04.11.09.19.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Apr 2023 09:19:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v2 2/2] drm/msm/adreno: change adreno_is_* functions to accept
 const argument
Date: Tue, 11 Apr 2023 19:19:03 +0300
Message-Id: <20230411161903.599222-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230411161903.599222-1-dmitry.baryshkov@linaro.org>
References: <20230411161903.599222-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

All adreno_is_*() functions do not modify their argument in any way, so
they can be changed to accept const struct adreno_gpu pointer.

Suggested-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.h | 56 ++++++++++++-------------
 1 file changed, 28 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index cf3b7abf201a..9857314295f9 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -152,140 +152,140 @@ static inline bool adreno_is_revn(const struct adreno_gpu *gpu, uint32_t revn)
 	return gpu->revn == revn;
 }
 
-static inline bool adreno_is_a2xx(struct adreno_gpu *gpu)
+static inline bool adreno_is_a2xx(const struct adreno_gpu *gpu)
 {
 	WARN_ON_ONCE(!gpu->revn);
 
 	return (gpu->revn < 300);
 }
 
-static inline bool adreno_is_a20x(struct adreno_gpu *gpu)
+static inline bool adreno_is_a20x(const struct adreno_gpu *gpu)
 {
 	WARN_ON_ONCE(!gpu->revn);
 
 	return (gpu->revn < 210);
 }
 
-static inline bool adreno_is_a225(struct adreno_gpu *gpu)
+static inline bool adreno_is_a225(const struct adreno_gpu *gpu)
 {
 	return adreno_is_revn(gpu, 225);
 }
 
-static inline bool adreno_is_a305(struct adreno_gpu *gpu)
+static inline bool adreno_is_a305(const struct adreno_gpu *gpu)
 {
 	return adreno_is_revn(gpu, 305);
 }
 
-static inline bool adreno_is_a306(struct adreno_gpu *gpu)
+static inline bool adreno_is_a306(const struct adreno_gpu *gpu)
 {
 	/* yes, 307, because a305c is 306 */
 	return adreno_is_revn(gpu, 307);
 }
 
-static inline bool adreno_is_a320(struct adreno_gpu *gpu)
+static inline bool adreno_is_a320(const struct adreno_gpu *gpu)
 {
 	return adreno_is_revn(gpu, 320);
 }
 
-static inline bool adreno_is_a330(struct adreno_gpu *gpu)
+static inline bool adreno_is_a330(const struct adreno_gpu *gpu)
 {
 	return adreno_is_revn(gpu, 330);
 }
 
-static inline bool adreno_is_a330v2(struct adreno_gpu *gpu)
+static inline bool adreno_is_a330v2(const struct adreno_gpu *gpu)
 {
 	return adreno_is_a330(gpu) && (gpu->rev.patchid > 0);
 }
 
-static inline int adreno_is_a405(struct adreno_gpu *gpu)
+static inline int adreno_is_a405(const struct adreno_gpu *gpu)
 {
 	return adreno_is_revn(gpu, 405);
 }
 
-static inline int adreno_is_a420(struct adreno_gpu *gpu)
+static inline int adreno_is_a420(const struct adreno_gpu *gpu)
 {
 	return adreno_is_revn(gpu, 420);
 }
 
-static inline int adreno_is_a430(struct adreno_gpu *gpu)
+static inline int adreno_is_a430(const struct adreno_gpu *gpu)
 {
 	return adreno_is_revn(gpu, 430);
 }
 
-static inline int adreno_is_a506(struct adreno_gpu *gpu)
+static inline int adreno_is_a506(const struct adreno_gpu *gpu)
 {
 	return adreno_is_revn(gpu, 506);
 }
 
-static inline int adreno_is_a508(struct adreno_gpu *gpu)
+static inline int adreno_is_a508(const struct adreno_gpu *gpu)
 {
 	return adreno_is_revn(gpu, 508);
 }
 
-static inline int adreno_is_a509(struct adreno_gpu *gpu)
+static inline int adreno_is_a509(const struct adreno_gpu *gpu)
 {
 	return adreno_is_revn(gpu, 509);
 }
 
-static inline int adreno_is_a510(struct adreno_gpu *gpu)
+static inline int adreno_is_a510(const struct adreno_gpu *gpu)
 {
 	return adreno_is_revn(gpu, 510);
 }
 
-static inline int adreno_is_a512(struct adreno_gpu *gpu)
+static inline int adreno_is_a512(const struct adreno_gpu *gpu)
 {
 	return adreno_is_revn(gpu, 512);
 }
 
-static inline int adreno_is_a530(struct adreno_gpu *gpu)
+static inline int adreno_is_a530(const struct adreno_gpu *gpu)
 {
 	return adreno_is_revn(gpu, 530);
 }
 
-static inline int adreno_is_a540(struct adreno_gpu *gpu)
+static inline int adreno_is_a540(const struct adreno_gpu *gpu)
 {
 	return adreno_is_revn(gpu, 540);
 }
 
-static inline int adreno_is_a618(struct adreno_gpu *gpu)
+static inline int adreno_is_a618(const struct adreno_gpu *gpu)
 {
 	return adreno_is_revn(gpu, 618);
 }
 
-static inline int adreno_is_a619(struct adreno_gpu *gpu)
+static inline int adreno_is_a619(const struct adreno_gpu *gpu)
 {
 	return adreno_is_revn(gpu, 619);
 }
 
-static inline int adreno_is_a630(struct adreno_gpu *gpu)
+static inline int adreno_is_a630(const struct adreno_gpu *gpu)
 {
 	return adreno_is_revn(gpu, 630);
 }
 
-static inline int adreno_is_a640_family(struct adreno_gpu *gpu)
+static inline int adreno_is_a640_family(const struct adreno_gpu *gpu)
 {
 	return adreno_is_revn(gpu, 640) ||
 		adreno_is_revn(gpu, 680);
 }
 
-static inline int adreno_is_a650(struct adreno_gpu *gpu)
+static inline int adreno_is_a650(const struct adreno_gpu *gpu)
 {
 	return adreno_is_revn(gpu, 650);
 }
 
-static inline int adreno_is_7c3(struct adreno_gpu *gpu)
+static inline int adreno_is_7c3(const struct adreno_gpu *gpu)
 {
 	/* The order of args is important here to handle ANY_ID correctly */
 	return adreno_cmp_rev(ADRENO_REV(6, 3, 5, ANY_ID), gpu->rev);
 }
 
-static inline int adreno_is_a660(struct adreno_gpu *gpu)
+static inline int adreno_is_a660(const struct adreno_gpu *gpu)
 {
 	return adreno_is_revn(gpu, 660);
 }
 
 /* check for a615, a616, a618, a619 or any derivatives */
-static inline int adreno_is_a615_family(struct adreno_gpu *gpu)
+static inline int adreno_is_a615_family(const struct adreno_gpu *gpu)
 {
 	return adreno_is_revn(gpu, 615) ||
 		adreno_is_revn(gpu, 616) ||
@@ -293,13 +293,13 @@ static inline int adreno_is_a615_family(struct adreno_gpu *gpu)
 		adreno_is_revn(gpu, 619);
 }
 
-static inline int adreno_is_a660_family(struct adreno_gpu *gpu)
+static inline int adreno_is_a660_family(const struct adreno_gpu *gpu)
 {
 	return adreno_is_a660(gpu) || adreno_is_7c3(gpu);
 }
 
 /* check for a650, a660, or any derivatives */
-static inline int adreno_is_a650_family(struct adreno_gpu *gpu)
+static inline int adreno_is_a650_family(const struct adreno_gpu *gpu)
 {
 	return adreno_is_revn(gpu, 650) ||
 		adreno_is_revn(gpu, 620) ||
-- 
2.30.2

