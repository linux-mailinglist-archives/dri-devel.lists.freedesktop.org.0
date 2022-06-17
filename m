Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F50954FC92
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 19:55:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AF0610E7B9;
	Fri, 17 Jun 2022 17:55:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ADDB10E449
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 17:55:42 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id h23so5506208ljl.3
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 10:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v5Xfd/lShJ436Gkh8UHXXgQps7qSsu2XxGEcqIQNHeg=;
 b=OFQ+NwTd1oExO/YyvBg1+/3FGralOW4TyMBglEdNEOpDf9HJp2Ga4zpaxbiOeVNffp
 PAL/DnazJ/2VaJuuUj68s5PNICR/ZeLV5J1kFbCWCeZjhNk9qUSAULPFiFq/b2l9KKYd
 CW7DKojbNYU4l1aVC+zf87IyL+hBBhWYFjr5HwXokg+2pu+ZLRJ5Jy/2jKVln08wndDj
 tRh0QX9f0AbgeJDALfviFfJWsVk+p+OFTGg066XUkoOP6XtlL/OdprHevu7L4CvD5FyQ
 qqqdSMM7uk2Pp2yeIRM79yNlfdHnybf3yowLN9LSeN8WssI5ln7sqnL3SwYtr6qby+ks
 2rwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v5Xfd/lShJ436Gkh8UHXXgQps7qSsu2XxGEcqIQNHeg=;
 b=kiwn6CCTTkGbzOpyyR/jCkhUIcTQf5A3eGWm9n9zgduBHGeTHz2UqmuXH6DY5uzM7s
 bCtNo/J4lz3Jsz2zaZklsVW3H4z/RPjTl0xQS3Zdf19AzjYorUihLlDHCv8qJbgCc+Ph
 erTvQHk/zUww1tuO4CbFYf1sdyFZZxYS7D6WQh9suwlK3cT77RbJW9PnJIPzFEceyiCY
 4oXFrh6xyrXdfhkgaa4NQaty+jgCiMh6dknVlXRunzYJ65ql0WRtw46ddkbphHfvP5LS
 diRhHNnpoMA+sSqcTDlhaxSVepIF0sGOW4JpLtBPamjZ3NFUjCdRTjn0WWSgZ8Fpg3GD
 eV4A==
X-Gm-Message-State: AJIora/JyhGbCfwcN2cf6+9fvmltZLNgTNFL/kEaLC6Kf6Z6uN0AaiIq
 468TJEu6ANVsA187YlAL5qxThw==
X-Google-Smtp-Source: AGRyM1v7Lf7iL11gGJO9hWjwiKs8CTU3aUv0bV2QJaVFm7d1+ScfU6J92dpugvqkuIkvs8Ulyrpi+Q==
X-Received: by 2002:a2e:b052:0:b0:255:9565:c6fa with SMTP id
 d18-20020a2eb052000000b002559565c6famr5526581ljl.529.1655488540496; 
 Fri, 17 Jun 2022 10:55:40 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 u19-20020a05651220d300b0047968606114sm712747lfr.111.2022.06.17.10.55.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jun 2022 10:55:39 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v4 1/3] drm/msm/mdp4: convert to drm_crtc_handle_vblank()
Date: Fri, 17 Jun 2022 20:55:36 +0300
Message-Id: <20220617175538.1080351-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220617175538.1080351-1-dmitry.baryshkov@linaro.org>
References: <20220617175538.1080351-1-dmitry.baryshkov@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Stop using deprecated drm_handle_vblank(), use drm_crtc_handle_vblank()
instead.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_irq.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_irq.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_irq.c
index 4d49f3ba6a96..ddcdd5e87853 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_irq.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_irq.c
@@ -69,8 +69,7 @@ irqreturn_t mdp4_irq(struct msm_kms *kms)
 	struct mdp_kms *mdp_kms = to_mdp_kms(kms);
 	struct mdp4_kms *mdp4_kms = to_mdp4_kms(mdp_kms);
 	struct drm_device *dev = mdp4_kms->dev;
-	struct msm_drm_private *priv = dev->dev_private;
-	unsigned int id;
+	struct drm_crtc *crtc;
 	uint32_t status, enable;
 
 	enable = mdp4_read(mdp4_kms, REG_MDP4_INTR_ENABLE);
@@ -81,9 +80,9 @@ irqreturn_t mdp4_irq(struct msm_kms *kms)
 
 	mdp_dispatch_irqs(mdp_kms, status);
 
-	for (id = 0; id < priv->num_crtcs; id++)
-		if (status & mdp4_crtc_vblank(priv->crtcs[id]))
-			drm_handle_vblank(dev, id);
+	drm_for_each_crtc(crtc, dev)
+		if (status & mdp4_crtc_vblank(crtc))
+			drm_crtc_handle_vblank(crtc);
 
 	return IRQ_HANDLED;
 }
-- 
2.35.1

