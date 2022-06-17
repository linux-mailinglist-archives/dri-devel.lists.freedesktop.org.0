Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 708875500DB
	for <lists+dri-devel@lfdr.de>; Sat, 18 Jun 2022 01:33:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6C6610FB21;
	Fri, 17 Jun 2022 23:33:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C32E610F9D5
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 23:33:35 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id l18so6182684lje.13
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 16:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fFbdKaDNYDUS6tXkTIVt1gzmoptlTns1Lqe5DDTL1yY=;
 b=AaI2o7I8i1Jk4DfUsTY5N8kSi16bKmrARdQhA2mpyByoZt3ILIiW0rbvw71J1kq512
 GdpVbS1jNiAK6IthLJWT5N81nDXHe54NEUGJX7d5I+duKvES5GOSE4j/wWFX0w6oOuuW
 kaSMdNqOg3d1P0ybFZ+K/gwoizN0Es+D8EhmgVi4sGgGXIi7OSXBCC5iaJ3ei//7czib
 2S2Qk5eR1N3PCSABqztTG6mDxr7R5Kjiyw9TzwaJ1hb+GxO09VOLD3u4GrjOV3WcR059
 keuZeE2dJ25BpHD+cVdWWftHTqSOBNfrgM25hWF74/oZSp/kCBdc1nFXJNxyC+lEV3IE
 +dfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fFbdKaDNYDUS6tXkTIVt1gzmoptlTns1Lqe5DDTL1yY=;
 b=Mf+bUF0lqjJ5UAcEeFVjuugkQjRvHyBTa7i82xhE4ts+istVFbafl/5JoAo5dn3cTy
 qq1/rUikg9I1/9M1wpnFhfhsMACI4oAaQVAYuGcN63dDxXYnXeaADZORsaSsBHncythV
 5z9KSOQ7GjBM5DGRbejlOPxjgbFER/2l/bNB+ornVrzOx3bopjxDUQ+xRqR8lbugowJo
 FdKFyNtol/1NSNJywrL+ZlGcHhzxv9eXKowLIT0Wtic2mQ0UzH+ZD5a3jMeOu2jZ8evj
 +HHoityI0BvdgtHzXovxH2tyh+aEYe1y09fLujrYLYfAGBL6g6tGj8yx551rsXafQ10N
 U6Yw==
X-Gm-Message-State: AJIora/NyBfuXs9BAKJSJbns3wZ6xJnGlcruRMzGlTEjx2vAfJbo+kF/
 sCkwWHzq/CO905Ept903sNN+Ew==
X-Google-Smtp-Source: AGRyM1vjvkOoYL/nCDVN8KS+ijL2/HK/m6fxMKHTRPXtCXY6yAc+T8QdOSUMolU+Z5OQQv5iXO4/aQ==
X-Received: by 2002:a2e:99c7:0:b0:255:6913:9039 with SMTP id
 l7-20020a2e99c7000000b0025569139039mr6088903ljj.127.1655508813916; 
 Fri, 17 Jun 2022 16:33:33 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 b2-20020a056512060200b004787d3cbc67sm800138lfe.219.2022.06.17.16.33.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jun 2022 16:33:33 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v6 3/4] drm/msm/mdp5: convert to drm_crtc_handle_vblank()
Date: Sat, 18 Jun 2022 02:33:27 +0300
Message-Id: <20220617233328.1143665-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220617233328.1143665-1-dmitry.baryshkov@linaro.org>
References: <20220617233328.1143665-1-dmitry.baryshkov@linaro.org>
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
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
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

