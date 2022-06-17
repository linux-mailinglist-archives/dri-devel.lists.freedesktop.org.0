Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E76B54FD5A
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 21:14:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D46CB10E3BB;
	Fri, 17 Jun 2022 19:14:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72E6F10E38D
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 19:14:34 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id w2so2335707lji.5
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 12:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ByYz0vZByrH5ZeGoDfGbZOJgTHhBJ8/LzLyyFMFujSk=;
 b=iKthKkfUcMM9o6hWQhqaRZjGA3ciJ2B05C3Bls4mHzjTIRIftqPJtaiV6fIQeq9yai
 sLo3XlmbG+XHAgDTNEIg+Je0X0ey6MInTh6f2rR9Vd8I8Pq/qFwOHUNqCMie4R1ne/Eo
 uMa4QyIyH4xnFaRRD3Jx44JZHei5FT9Jmx0mZ83rRJK71PFlVC3hekEWB08CmirZ1B7e
 1LvzyWC1J1XEdkT7ETVfEwRTygnrbJzvzarUIWjlUJ37TBfcwtZcmqoFDkrPu7q4cRbR
 Z7SCdyQojHDpy+Mf0gb1fO7KTVvumKpLwfouTr9cABBpdathOc8BYaqNyYkjqrwqAN3W
 EuvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ByYz0vZByrH5ZeGoDfGbZOJgTHhBJ8/LzLyyFMFujSk=;
 b=5WMfwvpgF4QBQ7LNE8sVFFCrffcnz5tMoGSb3on6uNGt9pgu0V7KIdZbDeUaZXpPqX
 7Vf1f+EaANzCW4yrPDgI5WACTVpoIay+AtaaMnGGvzoU9i3A8iNC5Hx0sYeLJhtMigBA
 VNWKVQNBQv7elxIKbV1lBObDiTlVLA0+QMQQWEIVHdXMnG2reEIym97pXKj/H1Kvh9qG
 BARFFfycqdt9veZn4PrltqmXptzuRyyJTkezdDlXw9n2LAtvFpaVBOa+0mVGipPER6Ai
 e4/b1+euaUzD1XLcdR4Oxz2AjoxIZnr+kQqYcfMlbYbAu8z2mEOxFeHiCFYmWd5N3MzQ
 AQ0w==
X-Gm-Message-State: AJIora8gx/SXBNg7zA30aq32Ei5/bsNMXV5Do5RbvAtHwfLQpeEV4mBb
 ZHeJkHbRIU7M17Jb83LVgRJcwQ==
X-Google-Smtp-Source: AGRyM1vjgsaW6RCmaejvfNFLPQyrVreNKfFxK18s1McHyaU9Rh3StfRKYgQ0ALeis8lysJYmm5zWTA==
X-Received: by 2002:a2e:9283:0:b0:253:e175:dd84 with SMTP id
 d3-20020a2e9283000000b00253e175dd84mr5608383ljh.221.1655493272726; 
 Fri, 17 Jun 2022 12:14:32 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([95.161.222.59])
 by smtp.gmail.com with ESMTPSA id
 k15-20020a2e920f000000b00253e1833e8bsm639680ljg.117.2022.06.17.12.14.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jun 2022 12:14:32 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v5 2/3] drm/msm/mdp5: convert to drm_crtc_handle_vblank()
Date: Fri, 17 Jun 2022 22:14:28 +0300
Message-Id: <20220617191429.1087634-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220617191429.1087634-1-dmitry.baryshkov@linaro.org>
References: <20220617191429.1087634-1-dmitry.baryshkov@linaro.org>
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
 drivers/gpu/drm/msm/disp/mdp5/mdp5_irq.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_irq.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_irq.c
index 9b4c8d92ff32..43443a435d59 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_irq.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_irq.c
@@ -82,8 +82,7 @@ irqreturn_t mdp5_irq(struct msm_kms *kms)
 	struct mdp_kms *mdp_kms = to_mdp_kms(kms);
 	struct mdp5_kms *mdp5_kms = to_mdp5_kms(mdp_kms);
 	struct drm_device *dev = mdp5_kms->dev;
-	struct msm_drm_private *priv = dev->dev_private;
-	unsigned int id;
+	struct drm_crtc *crtc;
 	uint32_t status, enable;
 
 	enable = mdp5_read(mdp5_kms, REG_MDP5_INTR_EN);
@@ -94,9 +93,9 @@ irqreturn_t mdp5_irq(struct msm_kms *kms)
 
 	mdp_dispatch_irqs(mdp_kms, status);
 
-	for (id = 0; id < priv->num_crtcs; id++)
-		if (status & mdp5_crtc_vblank(priv->crtcs[id]))
-			drm_handle_vblank(dev, id);
+	drm_for_each_crtc(crtc, dev)
+		if (status & mdp5_crtc_vblank(crtc))
+			drm_crtc_handle_vblank(crtc);
 
 	return IRQ_HANDLED;
 }
-- 
2.35.1

