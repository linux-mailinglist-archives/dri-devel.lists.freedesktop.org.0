Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CABB574BABF
	for <lists+dri-devel@lfdr.de>; Sat,  8 Jul 2023 03:04:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25D3510E05C;
	Sat,  8 Jul 2023 01:04:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FDAE10E052
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Jul 2023 01:04:13 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2b6fdaf6eefso38892681fa.0
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jul 2023 18:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688778251; x=1691370251;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cqj1zfTkSVBVi5MTMAUdf4BIRwAJVp5IKDlTTrfyBVo=;
 b=kJ1yMhnV18HiwIf59EEaYuVZdW/ZrgVW406HaxuPFBCSbJKBdkIpvYQoYGMrVbyWC7
 9aQkNT1KTxPu6m3txMr4Uq8shX/rXIaguisxKHg85LLz/hca5T6AIstl7+8yVuai08xh
 f+CuaqwsG9CvnkB0s/Hvi+o5qj+87M6+Hf7oPe9t289hMs+0yU6ffAnXBk/A3fBjVre9
 91/NWiqS48DKaIz8cl7oCMMZRYUDfIJHwaubUml4pMCXIhxnST/RVdlFx8OP8gutC29f
 7AsiaibzmkmuhPqnhwKa6l/fd/JlW7LSIkeP+i4dYVMfKJS/8dRvBDvJQCWtC7T6HLal
 bF0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688778251; x=1691370251;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cqj1zfTkSVBVi5MTMAUdf4BIRwAJVp5IKDlTTrfyBVo=;
 b=OyiDege4zC7pWMu/k98Z4rZEMuu6azTV6VJGXCwiCIbUoOgqsArRZl0Lj5HrbzORFz
 4u8Z5F2zP73UmPDJexKtjeFvsygrUDLfkfyC2HR1/NX+AdG/PQMk8kWGmvDyWxhHSc8p
 4gmS4oXaPJlow9mjv4ADPOka7wNSeFcYL6OZwW2lg2pDcSq6qzVhjb1uX0XrTNmy4PKO
 xWLXLPlDpDtTd5QYbaQEfRNQRMJdS0WxSxI6GEYKxPwA/p9sX7mO9DK6sbCSu9LNecF4
 oXwUyEuF+kWXPxynNf0IiQZ6ebRUOb1P0RYgo1kIhztEG9QMbGBlGNQsUSGyPE9Tz8Vm
 d2Pg==
X-Gm-Message-State: ABy/qLaZlIRmyXdaYvN4GjSapmxo61ZilVD5sQEIJZAtfj3PkI7l+ujF
 OmeEHnydb6usqIJXIpmjeUPOaQ==
X-Google-Smtp-Source: APBJJlHEdzppfaTBCM4pe0IaFvABpePK2NwTjEKLk1Fm2g3Lzzn4Q+O2ehaPn7/LWOwWPkV2Oh/TGg==
X-Received: by 2002:a2e:960a:0:b0:2b6:d733:b580 with SMTP id
 v10-20020a2e960a000000b002b6d733b580mr4605078ljh.37.1688778251621; 
 Fri, 07 Jul 2023 18:04:11 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 l5-20020a2e8685000000b002b6ee99fff2sm1012807lji.34.2023.07.07.18.04.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jul 2023 18:04:11 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 04/17] drm/msm/mdp5: use devres-managed allocation for mixer
 data
Date: Sat,  8 Jul 2023 04:03:54 +0300
Message-Id: <20230708010407.3871346-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230708010407.3871346-1-dmitry.baryshkov@linaro.org>
References: <20230708010407.3871346-1-dmitry.baryshkov@linaro.org>
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

Use devm_kzalloc to create mixer data structure. This allows us
to remove corresponding kfree and drop mdp5_mixer_destroy() function.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c   |  5 +----
 drivers/gpu/drm/msm/disp/mdp5/mdp5_mixer.c | 10 +++-------
 drivers/gpu/drm/msm/disp/mdp5/mdp5_mixer.h |  4 ++--
 3 files changed, 6 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index e20ead138602..b4a49d369f0d 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -211,9 +211,6 @@ static void mdp5_kms_destroy(struct msm_kms *kms)
 	struct msm_gem_address_space *aspace = kms->aspace;
 	int i;
 
-	for (i = 0; i < mdp5_kms->num_hwmixers; i++)
-		mdp5_mixer_destroy(mdp5_kms->hwmixers[i]);
-
 	for (i = 0; i < mdp5_kms->num_hwpipes; i++)
 		mdp5_pipe_destroy(mdp5_kms->hwpipes[i]);
 
@@ -720,7 +717,7 @@ static int hwmixer_init(struct mdp5_kms *mdp5_kms)
 	for (i = 0; i < hw_cfg->lm.count; i++) {
 		struct mdp5_hw_mixer *mixer;
 
-		mixer = mdp5_mixer_init(&hw_cfg->lm.instances[i]);
+		mixer = mdp5_mixer_init(dev, &hw_cfg->lm.instances[i]);
 		if (IS_ERR(mixer)) {
 			ret = PTR_ERR(mixer);
 			DRM_DEV_ERROR(dev->dev, "failed to construct LM%d (%d)\n",
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_mixer.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_mixer.c
index 2536def2a000..2822b533f807 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_mixer.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_mixer.c
@@ -140,20 +140,16 @@ int mdp5_mixer_release(struct drm_atomic_state *s, struct mdp5_hw_mixer *mixer)
 	return 0;
 }
 
-void mdp5_mixer_destroy(struct mdp5_hw_mixer *mixer)
-{
-	kfree(mixer);
-}
-
 static const char * const mixer_names[] = {
 	"LM0", "LM1", "LM2", "LM3", "LM4", "LM5",
 };
 
-struct mdp5_hw_mixer *mdp5_mixer_init(const struct mdp5_lm_instance *lm)
+struct mdp5_hw_mixer *mdp5_mixer_init(struct drm_device *dev,
+				      const struct mdp5_lm_instance *lm)
 {
 	struct mdp5_hw_mixer *mixer;
 
-	mixer = kzalloc(sizeof(*mixer), GFP_KERNEL);
+	mixer = devm_kzalloc(dev->dev, sizeof(*mixer), GFP_KERNEL);
 	if (!mixer)
 		return ERR_PTR(-ENOMEM);
 
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_mixer.h b/drivers/gpu/drm/msm/disp/mdp5/mdp5_mixer.h
index 545ee223b9d7..2bedd75835bc 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_mixer.h
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_mixer.h
@@ -25,8 +25,8 @@ struct mdp5_hw_mixer_state {
 	struct drm_crtc *hwmixer_to_crtc[8];
 };
 
-struct mdp5_hw_mixer *mdp5_mixer_init(const struct mdp5_lm_instance *lm);
-void mdp5_mixer_destroy(struct mdp5_hw_mixer *lm);
+struct mdp5_hw_mixer *mdp5_mixer_init(struct drm_device *dev,
+				      const struct mdp5_lm_instance *lm);
 int mdp5_mixer_assign(struct drm_atomic_state *s, struct drm_crtc *crtc,
 		      uint32_t caps, struct mdp5_hw_mixer **mixer,
 		      struct mdp5_hw_mixer **r_mixer);
-- 
2.39.2

