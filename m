Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 551B774B9F2
	for <lists+dri-devel@lfdr.de>; Sat,  8 Jul 2023 01:13:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9570C10E62C;
	Fri,  7 Jul 2023 23:13:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0BD710E61A
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jul 2023 23:13:02 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2b6c5ede714so45203941fa.1
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jul 2023 16:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688771581; x=1691363581;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dFv3+lcwDk1Uuq+D2295Ys294X/whCt/s/teT4doCsU=;
 b=gMsIIQmw3HT15vvgXXf2yEbURrTsTF5xr/Z7LrCnA0nteYlyAoIh+zGoWYdorLbA74
 yACKFgeBOurrwg+SB1COlF5/IOnSilRSDl8JwDS+BdkSvxZ2HUMkjkMgCyrksFFpols8
 AJ9X/CLsHrufi5FuhyJ5PSlf3+UDWT+Jgn7xjv8DF3J+DUIXrEsbw8wr+cP1ymKMgXFo
 SCMoAjUrtQWq/yOpVPvF1lJ4REDn0toKrNyj6FFAPE6XCed1zdY+TLRXtyE3+kR+R4Nd
 +b3hNvTNF9rOTImeNC0NRNJ5Kx/GmPjtUr7lF7rETbJP9kapk0fAjit5AcGE4yR8dnoL
 BowQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688771581; x=1691363581;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dFv3+lcwDk1Uuq+D2295Ys294X/whCt/s/teT4doCsU=;
 b=daV2bKoyTVieXtokj0MNOBQAYI+h7fkJ/b+C6pNOcuLNk/NMF8AcTRPouhdF8Feaps
 G/twiqbnpchmKtqg2re3nzuZlRvur9tv1Jpb2QbAWPzBc9MgaEOe5PRB+xMNPwhguHI7
 8AOtVmfgNQOb9cmQcqjZm7UDyFgfNAGAQjynAp5NCkNc9bfkVVACM1JHOC8xBOsHUggK
 Tn2WuD38ugQbK18eiqDBD4CNEd1Yr9LmI9QPY0XVzW7DDcL7rXKe9ORmJ5gyaDpENrXi
 5tjE3ptTTyCts2Zs6SC0dChuUX7meie1BXbyku35UpA+3FWRLzGwoXevpVwFBN5Sr+xC
 Gx1A==
X-Gm-Message-State: ABy/qLYuE+NlEJ+0f1Drdvgc9TTWDgihgdt2AXKhtFg+moe5R/Tqre/K
 Nz8YbrlWgXxn6SrCU7GXadIiqg==
X-Google-Smtp-Source: APBJJlENFWwIHBaP96UtrPHupIC8v+VytTGCZZ3ACyuvKgYhj2DmQjIoJofwkYO9jXsr1gHOyZdcoQ==
X-Received: by 2002:a05:6512:3111:b0:4f8:52a8:d123 with SMTP id
 n17-20020a056512311100b004f852a8d123mr2198733lfb.12.1688771581156; 
 Fri, 07 Jul 2023 16:13:01 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 d1-20020ac25441000000b004fb7388360esm841643lfn.188.2023.07.07.16.13.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jul 2023 16:13:00 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v2 12/13] drm/msm/dpu: drop dpu_encoder_phys_ops::destroy
Date: Sat,  8 Jul 2023 02:12:50 +0300
Message-Id: <20230707231251.3849701-13-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230707231251.3849701-1-dmitry.baryshkov@linaro.org>
References: <20230707231251.3849701-1-dmitry.baryshkov@linaro.org>
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

Drop the dpu_encoder_phys_ops' destroy() callback. No phys backend
implements it anymore, so it is useless.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c    | 18 ------------------
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   |  2 --
 2 files changed, 20 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 7c2cd9ce8acd..b42176ce4a3a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -456,24 +456,6 @@ static void dpu_encoder_destroy(struct drm_encoder *drm_enc)
 	dpu_enc = to_dpu_encoder_virt(drm_enc);
 	DPU_DEBUG_ENC(dpu_enc, "\n");
 
-	mutex_lock(&dpu_enc->enc_lock);
-
-	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
-		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
-
-		if (phys->ops.destroy) {
-			phys->ops.destroy(phys);
-			--dpu_enc->num_phys_encs;
-			dpu_enc->phys_encs[i] = NULL;
-		}
-	}
-
-	if (dpu_enc->num_phys_encs)
-		DPU_ERROR_ENC(dpu_enc, "expected 0 num_phys_encs not %d\n",
-				dpu_enc->num_phys_encs);
-	dpu_enc->num_phys_encs = 0;
-	mutex_unlock(&dpu_enc->enc_lock);
-
 	drm_encoder_cleanup(drm_enc);
 	mutex_destroy(&dpu_enc->enc_lock);
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
index 4fb0d95f3061..757ce58f958b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
@@ -72,7 +72,6 @@ struct dpu_encoder_phys;
  * @enable:			DRM Call. Enable a DRM mode.
  * @disable:			DRM Call. Disable mode.
  * @atomic_check:		DRM Call. Atomic check new DRM state.
- * @destroy:			DRM Call. Destroy and release resources.
  * @control_vblank_irq		Register/Deregister for VBLANK IRQ
  * @wait_for_commit_done:	Wait for hardware to have flushed the
  *				current pending frames to hardware
@@ -102,7 +101,6 @@ struct dpu_encoder_phys_ops {
 	int (*atomic_check)(struct dpu_encoder_phys *encoder,
 			    struct drm_crtc_state *crtc_state,
 			    struct drm_connector_state *conn_state);
-	void (*destroy)(struct dpu_encoder_phys *encoder);
 	int (*control_vblank_irq)(struct dpu_encoder_phys *enc, bool enable);
 	int (*wait_for_commit_done)(struct dpu_encoder_phys *phys_enc);
 	int (*wait_for_tx_complete)(struct dpu_encoder_phys *phys_enc);
-- 
2.39.2

