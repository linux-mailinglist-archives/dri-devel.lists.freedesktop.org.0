Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 134C651E2DD
	for <lists+dri-devel@lfdr.de>; Sat,  7 May 2022 03:00:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02D5A10F006;
	Sat,  7 May 2022 01:00:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9434710F006
 for <dri-devel@lists.freedesktop.org>; Sat,  7 May 2022 01:00:47 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id bq30so15168734lfb.3
 for <dri-devel@lists.freedesktop.org>; Fri, 06 May 2022 18:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bbmCDtr+s7sU7U2DzR9HyFUOOK+AZ9mHXobR+YuUukY=;
 b=S4fWE6cToix3IrUwEdSdjlJMpkGe3zBnnhDbfNhBHfUc8NVYF1LCaE88zKEbaoTWBM
 6CCuMw5YY8m1o1WcBSAAfwqoLuFQo+VjhVAnVX/Wo/WAaFqw4siH1EZCjs6TKOGOCtPH
 IcoIEg+uQ02a0+OReTK2ewLOEbqj3eCkA0qgtCbKGhCI8h8zyvEAq3txhFE5zgOZA9t8
 06kbuCEnsyNCadgvKVgBrNS1MUD3i5UH/+uD8OtWmlB1iREu0KWsJI/PXrerd93SGEsW
 KR4hHcRbfi36fXFQkAKf0mRoWt8ehPkylUFeUuR/jIxcUvMyVCVIvJTY/Hy/uvnwd/mr
 IYgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bbmCDtr+s7sU7U2DzR9HyFUOOK+AZ9mHXobR+YuUukY=;
 b=SQ+kAa6CBiEWQlmWSl4hzIYWG7joFojgdM85kC/Fqw027+UOWY/+PQuc0m+0aXgcvX
 +3SFuTAEqyM3LDWXpi9oobA9yfjmcHW4RLWUsN+LVXfcorEnfBy1fI+pGjSsPaBOj1AS
 taIYbDGFWx/z01qs6wcwgBS/FrOZsOnWJyG9b1aVU827YT/81kUf/STfvmb6jUNJd/SG
 o7UJNDQKuZLFZP80sp+rLq2AfrhtgA8DSR4a9eUqM+XbNiFpa8Vz087uXgH1ySaCN4EK
 DZjY5RRcszCJng+tYop9XZeSKP2KgW0ivmURYMHQDpyvoRvkN2/RpJxCL/REPYAIXVn7
 d6fA==
X-Gm-Message-State: AOAM533Dlt47YHQhJGR+heD/2Wq50nZTA9QMv+THCBy4+u3qbIhH4GyX
 JTS3pBMVeyOzwxeVKMPnDQJCeA==
X-Google-Smtp-Source: ABdhPJw4hX89GyYjec7dVISjZoAnB97kSOaFNSp9tHTSGNmwmxKLBjswpYqXoEiXK6CJvYmo+/JX9A==
X-Received: by 2002:a05:6512:3405:b0:473:a5e5:1659 with SMTP id
 i5-20020a056512340500b00473a5e51659mr4208479lfr.379.1651885247159; 
 Fri, 06 May 2022 18:00:47 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 m8-20020a0565120a8800b0047255d21123sm886335lfu.82.2022.05.06.18.00.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 May 2022 18:00:46 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 1/3] drm/msm/mdp4: convert to drm_crtc_handle_vblank()
Date: Sat,  7 May 2022 04:00:44 +0300
Message-Id: <20220507010046.1667809-1-dmitry.baryshkov@linaro.org>
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

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_irq.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_irq.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_irq.c
index 87675c162eea..62cc566756e8 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_irq.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_irq.c
@@ -72,8 +72,7 @@ static irqreturn_t mdp4_irq(int irq, void *arg)
 	struct mdp_kms *mdp_kms = to_mdp_kms(kms);
 	struct mdp4_kms *mdp4_kms = to_mdp4_kms(mdp_kms);
 	struct drm_device *dev = mdp4_kms->dev;
-	struct msm_drm_private *priv = dev->dev_private;
-	unsigned int id;
+	struct drm_crtc *crtc;
 	uint32_t status, enable;
 
 	enable = mdp4_read(mdp4_kms, REG_MDP4_INTR_ENABLE);
@@ -84,9 +83,9 @@ static irqreturn_t mdp4_irq(int irq, void *arg)
 
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

