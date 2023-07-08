Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F0C74BAD9
	for <lists+dri-devel@lfdr.de>; Sat,  8 Jul 2023 03:04:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6CDC10E646;
	Sat,  8 Jul 2023 01:04:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A345410E171
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Jul 2023 01:04:16 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2b6ff1a637bso40576401fa.3
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jul 2023 18:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688778255; x=1691370255;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OvkDRRks7g8DySGasu3lXKMzrlSZVaCrNLVNV3AQolk=;
 b=ifWDV/xZ/NflqriQoy/Z+iUwbBprc7ttX3/6aI/mUGnvAICR+Y+k4gBdjgvOjNI5dL
 v73RQcQ9Yvcd4sWFr5PTJbgjq3bWTas2t5tSN9bQDmR2rKGQ7Knel+VEnAvpyka0RKES
 tlHsBDkTSTcrgqT0pVvVPtH51IHApKY1Wbz/a8MyL9e1DwNBKnVdpUiAIQcN2iFVKptx
 ieeapBeAg4pPBR6W0F3afWw0OdNqAZqMinaq15u/CdE9i7uZMAE9xLzCw8SYTw6k86FY
 YjT/2VPAnyQBwgll7vpK4HoABQ79ex/7E6fU9LU//9RTdYgXse6Hn2XlrPv60NcAwWm7
 HJ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688778255; x=1691370255;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OvkDRRks7g8DySGasu3lXKMzrlSZVaCrNLVNV3AQolk=;
 b=Zph2syi94URimGVVZBhZ4ukfJ4Dg7sDYqI5vlZAoZiewF9TknUx9Wr+U2xSRD+LWVI
 I7oZX+ww8nUvkVGswVDwHmYHMni8md4/1jdI8K4HRDnHkCE2ZlFpJ3ohGAdQL1iJwuBe
 wkF0J63aPI3ju4SxoiR99XV5Kf11bgpYgfr6jxfNdntFp524n+uDIhfK07su4dlwtsG6
 Iegs3O1sQHmUPLkG5kNLcU+IBvFw9WCWdQOd1Ktzyo/bNAntfsL341nkbMJNpXgU4eOt
 BW5ySAgXqxRKGpByLa1dHXBTjikJpBc+jYXTEXOtndb4JfsaOmv/706QZVvWjILcZnEU
 n1Mg==
X-Gm-Message-State: ABy/qLb+Cf9jxB4gZa4Fhrdu3rqQ1z5ViiWalpgI85ndOroJqL/axyae
 GHqPOuy/HgfiKZFkwH8vERIfMA==
X-Google-Smtp-Source: APBJJlH2oS9vjaxVN82h8YObqDf30t8jTKMDOlnJ86Im09XQHvKw1qwi5FpPGlvOK6RkEXe24D76NA==
X-Received: by 2002:a2e:95c2:0:b0:2b6:dbf6:6b38 with SMTP id
 y2-20020a2e95c2000000b002b6dbf66b38mr925721ljh.52.1688778255055; 
 Fri, 07 Jul 2023 18:04:15 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 l5-20020a2e8685000000b002b6ee99fff2sm1012807lji.34.2023.07.07.18.04.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jul 2023 18:04:14 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 09/17] drm/msm/mdp5: use drmm-managed allocation for
 mdp5_encoder
Date: Sat,  8 Jul 2023 04:03:59 +0300
Message-Id: <20230708010407.3871346-10-dmitry.baryshkov@linaro.org>
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

Change struct mdp5_encoder allocation to use drmm_encoder_alloc(). This
removes the need to perform any actions on encoder destruction.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_encoder.c | 29 +++-----------------
 1 file changed, 4 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_encoder.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_encoder.c
index 79d67c495780..8db97083e14d 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_encoder.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_encoder.c
@@ -16,17 +16,6 @@ static struct mdp5_kms *get_kms(struct drm_encoder *encoder)
 	return to_mdp5_kms(to_mdp_kms(priv->kms));
 }
 
-static void mdp5_encoder_destroy(struct drm_encoder *encoder)
-{
-	struct mdp5_encoder *mdp5_encoder = to_mdp5_encoder(encoder);
-	drm_encoder_cleanup(encoder);
-	kfree(mdp5_encoder);
-}
-
-static const struct drm_encoder_funcs mdp5_encoder_funcs = {
-	.destroy = mdp5_encoder_destroy,
-};
-
 static void mdp5_vid_encoder_mode_set(struct drm_encoder *encoder,
 				      struct drm_display_mode *mode,
 				      struct drm_display_mode *adjusted_mode)
@@ -342,13 +331,11 @@ struct drm_encoder *mdp5_encoder_init(struct drm_device *dev,
 	struct mdp5_encoder *mdp5_encoder;
 	int enc_type = (intf->type == INTF_DSI) ?
 		DRM_MODE_ENCODER_DSI : DRM_MODE_ENCODER_TMDS;
-	int ret;
 
-	mdp5_encoder = kzalloc(sizeof(*mdp5_encoder), GFP_KERNEL);
-	if (!mdp5_encoder) {
-		ret = -ENOMEM;
-		goto fail;
-	}
+	mdp5_encoder = drmm_encoder_alloc(dev, struct mdp5_encoder, base,
+					  NULL, enc_type, NULL);
+	if (IS_ERR(mdp5_encoder))
+		return ERR_CAST(mdp5_encoder);
 
 	encoder = &mdp5_encoder->base;
 	mdp5_encoder->ctl = ctl;
@@ -356,15 +343,7 @@ struct drm_encoder *mdp5_encoder_init(struct drm_device *dev,
 
 	spin_lock_init(&mdp5_encoder->intf_lock);
 
-	drm_encoder_init(dev, encoder, &mdp5_encoder_funcs, enc_type, NULL);
-
 	drm_encoder_helper_add(encoder, &mdp5_encoder_helper_funcs);
 
 	return encoder;
-
-fail:
-	if (encoder)
-		mdp5_encoder_destroy(encoder);
-
-	return ERR_PTR(ret);
 }
-- 
2.39.2

