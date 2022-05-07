Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B9451E8D2
	for <lists+dri-devel@lfdr.de>; Sat,  7 May 2022 19:09:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0C6810EB65;
	Sat,  7 May 2022 17:09:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FA5910E96F
 for <dri-devel@lists.freedesktop.org>; Sat,  7 May 2022 17:09:25 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id bu29so17352780lfb.0
 for <dri-devel@lists.freedesktop.org>; Sat, 07 May 2022 10:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NzygQfKaqxUN99VFssPvB6WUeLsx3+QcBbNDEkCRpbg=;
 b=nOqdkoUfgDzqeU7e9JGMkBSD98aE1d0/dRdjv/WiNhyhZ7lqXjBAyR8Yoy/lHpiJLJ
 NBJlFx6eUoU6SnInFQCqCIFsj5HvOmjOvBCiG71quFYNJ0HnFdHULLg4pcil4x0DJpit
 CHFRYXPncMLcOnSx7Xl0CY5TmHv8ByLPLpD4x28op0b9MsK3IjK7F7Kb7UBcugZ/xVGr
 xVjzH/iL9hThP4WjOmp1hgNLQXYEiU1oQFSJkCkZPJeW8RyIa8ErGmRiCcbYYZ+IJh8Q
 1aGBZ6BfHh2o9/kAELh7t92wZds0pLp4Vd5YVXvBxb1im37HeqgkKo2wrMDnBZRAsFWI
 W1lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NzygQfKaqxUN99VFssPvB6WUeLsx3+QcBbNDEkCRpbg=;
 b=Pj5LpYNvXvceR9YkdtE70+sGooW63SkD+49W43n/gdBO7L83aZGypi3XS9ThDBKu4q
 jte77/NBS5EiL8xs72ARUJV0r22LCaoQBhVwEFqMpbGjRY0roqEA3Cp0UVGE1xPkDJGZ
 8XsJERViqDWks4rnANanXGqaWanCf7+3FtuS0xvoWZfOowvEGBd4plK14CjPv0RaZVX7
 g/+9LUqesIZ2ks/9MHxM0vGxfRGmlDguD4aKEBv81T1jjp0wtNo3fX3hh+rHctBFsEjb
 pImcgy/6W3uz0BgjR+JnqJW9SSq1N0nBOjwrDxbSuqeWYOxigqQV618TNbMjK4tSqGHw
 oAEQ==
X-Gm-Message-State: AOAM530F8kmxMTQkDJ+eJwSIJsCdb9BIFrwM2gcQB9eRK13rq+wTFzn3
 KOblMQkc3CF9ceoPHzmm+earPA==
X-Google-Smtp-Source: ABdhPJyHWSoma8yU9uXEMXFj4Hng1G6xTNnzJFh+/QHTS715VFATXhoOiPi+VVoUddbzqC9+fRto3A==
X-Received: by 2002:a05:6512:3f0e:b0:471:acdd:590c with SMTP id
 y14-20020a0565123f0e00b00471acdd590cmr6712966lfa.520.1651943363758; 
 Sat, 07 May 2022 10:09:23 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 n14-20020a05651203ee00b0047255d211f9sm1175308lfq.296.2022.05.07.10.09.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 May 2022 10:09:23 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v2 1/3] drm/msm/mdp4: convert to drm_crtc_handle_vblank()
Date: Sat,  7 May 2022 20:09:20 +0300
Message-Id: <20220507170922.1723712-1-dmitry.baryshkov@linaro.org>
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

