Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E559A54FC7A
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 19:50:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F025710E6A3;
	Fri, 17 Jun 2022 17:50:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CD6610E6A3
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 17:50:23 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id c4so7973180lfj.12
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 10:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=v5Xfd/lShJ436Gkh8UHXXgQps7qSsu2XxGEcqIQNHeg=;
 b=wtB0Bo7MIsJ7+OPzpfl05X+sDYAE+gl8xK15W2twX4nyEyKCKgCt7fizZOsyqZGes7
 VMe0bI0baS12/w9GMjCh6GoCsR7jsc4R+A6piCspN8IFwTigTwow1oNqqx/2uXWtrApg
 pOKTX+zmCDBGfP0Ll80Emf6jaOnnOcY/ko9Se+HGfgh3EAMZ34P+CQX1B3yg0A4SMuxc
 XF0toEgLfiu3GbcUsTKSa6w6KmQ4YOZxL2iark/0P9By6eCVVF0nqD6HL4EAV6OER0R0
 emVdtdbCqacDKLAiX1Wt9SpeTAfRfcdPXHsYxanqdrqr318qLVe363/wG9mELFm/eF9n
 crkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=v5Xfd/lShJ436Gkh8UHXXgQps7qSsu2XxGEcqIQNHeg=;
 b=Q7BbQh8DS49nocGHeDdvXMKcZS/kB6vK5G+5wp34oXYTllUdlZySA+cpbZ4zs9KHFj
 4gf1yyku0uUF9W7KWePidggZEiDPqeuA14Gnf4dwi36dvLv2Q4sXLuPqoViRVZWX/ExT
 XaYmMLIXk/Ly+e67JmPQcIcxq68HzveMpMWZaIgK8Kupc+VGceY6sak2Ub2IjtGHu78x
 s/eH31LSSiHUiLmIsl06paVy/n1Y+kjD9DGHNlzIMNCf0lEmAeEqQagRIXv/gHc620LT
 /jA2wOibG5dRRIkzv2VuoExdBc0EBZgDLafgs8EkXPvrNpiD86vQlLZm7h6EPrKDu3jV
 3J2Q==
X-Gm-Message-State: AJIora+ffKJqh1xPySYZtxhPYTDCN8xwQhH9/7SoX4MpJHq3ucAtQLwk
 7wuK7PE0Y/x/tCDzYv7ddcCbwg==
X-Google-Smtp-Source: AGRyM1sVWbcs49gGGE8BJpLz9BHq37J9II5hNgIZISFkmv9Xdm/bGWIWiEiUnwNPcSZ1LXFS3UFuBQ==
X-Received: by 2002:a05:6512:4015:b0:479:cb6:f8da with SMTP id
 br21-20020a056512401500b004790cb6f8damr6447901lfb.484.1655488221904; 
 Fri, 17 Jun 2022 10:50:21 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 y24-20020a199158000000b0047255d21128sm713399lfj.87.2022.06.17.10.50.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jun 2022 10:50:20 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v3 1/3] drm/msm/mdp4: convert to drm_crtc_handle_vblank()
Date: Fri, 17 Jun 2022 20:50:18 +0300
Message-Id: <20220617175020.1080118-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
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

