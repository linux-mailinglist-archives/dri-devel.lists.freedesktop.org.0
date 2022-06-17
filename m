Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6066C54FC80
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 19:50:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC5E910E6A9;
	Fri, 17 Jun 2022 17:50:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 982B710E6A3
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 17:50:24 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id p18so8032810lfr.1
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 10:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ByYz0vZByrH5ZeGoDfGbZOJgTHhBJ8/LzLyyFMFujSk=;
 b=CKvz/GriIH+hEOT15P8Uh4F/FUDSVlCSm+i9tRYV/fjdnz4TFyeW7fbrHm1fqOS7jJ
 HG2M8wmSY1plXlfrzBSUzbDQPRahn8RSMQLKJ0vt2tP1Bt5cW0dWc/0LQa+8VF5Qt9CS
 bb/6AgCcuWDr5IEMJ/1VJTh7yvJ6OJU5YAwYHCYPFeMCcCWA+J1RTgtnhzWQdB9JCydW
 CA+V1N03UNuuKakVylvMQzWdYb7hmk02hGsuqesjLPzfwGLWjaN/wqa/cb+a2cQ6A8yF
 59HhFhQPfdNQ4y+G2jF4OWG7yv/v/cP7AYqzej+PlJm3TjusswXr4oK6Aqv3YVCwNLk4
 ORlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ByYz0vZByrH5ZeGoDfGbZOJgTHhBJ8/LzLyyFMFujSk=;
 b=zsa+5mnIw8LJ6HPqtRW5O2Jl6/lJ1hytTO8bF0CuhA+PldIA5prDdwjmk37Hr3k+Hz
 OCHYjCOuRUc1RlxOeMnw8Ahf2XS+6lE815e9abH9sbF9q/3owZkL3I+eQZOQg9aN9yHp
 9XG5QVzOZrKK7KFeZl+dgyeVZhpakxA6CwDDXUAHdvkE2GVrKcHzEwSjkWeMjHSK+XCx
 Q21iyAUINsVRIZhoL6V4AGOtNLepalKrK4fVO0hWRsno5IlaMiC9cPi8pTn6CnMYz5P2
 hzPxyNxyT5sbCblML1Xkfvd+Usb8VkYpBcPluk3yh1Jk86fwgGTGy8XOS0D5K0n7eqve
 0dYA==
X-Gm-Message-State: AJIora+0yFD+0ANOY3YClVknD7l0emn78naiEO0haXotC6Pq7OZACXm1
 3Jhy4/uZOjKaz9Zrr2FOiBBsGg==
X-Google-Smtp-Source: AGRyM1tZhFrKVRy9m5OskQvHdrD2PyFdD3h0DVSSQJE/IcEpF+CX33+qcx9o1UVkt07CxgaPADFeug==
X-Received: by 2002:a05:6512:108f:b0:479:48b0:b650 with SMTP id
 j15-20020a056512108f00b0047948b0b650mr6264516lfg.33.1655488222770; 
 Fri, 17 Jun 2022 10:50:22 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 y24-20020a199158000000b0047255d21128sm713399lfj.87.2022.06.17.10.50.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jun 2022 10:50:22 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v3 2/3] drm/msm/mdp5: convert to drm_crtc_handle_vblank()
Date: Fri, 17 Jun 2022 20:50:19 +0300
Message-Id: <20220617175020.1080118-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220617175020.1080118-1-dmitry.baryshkov@linaro.org>
References: <20220617175020.1080118-1-dmitry.baryshkov@linaro.org>
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

