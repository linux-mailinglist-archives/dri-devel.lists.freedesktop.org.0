Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D61DA54FC94
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 19:55:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F3D910E7D5;
	Fri, 17 Jun 2022 17:55:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B35310E4AE
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 17:55:43 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id w20so7997958lfa.11
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 10:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ByYz0vZByrH5ZeGoDfGbZOJgTHhBJ8/LzLyyFMFujSk=;
 b=pFNBrgDNFMoKFY+eA39lRfdk74cdnJtBhZgaKF1GspL5uviGX9jw4u8XOb45LKZC5N
 JF83Q5vubro2ZJ8D4SHNC/FFmvtcWUBBAU9M9LV9zJQ9hHdPfv+rtf4Hku662gQktazG
 awRrRG21cnAutAgO7OS5HYjELHSEFNoFYGO9wabJ6+V2JyT5xP5GCpy/AUfOe7LWoJ0s
 2WxMY514oRbpiGtcQFw7Tq20GufXm9p1dpBmurLXrlpKBuHIYz5hsolaqLTXkPVUuCa/
 PY4GnMNsBYFnP3TRfYnp1L9kXybNWHn2ACBIxM67EX8OZRqxvChSQQqfHEQ+nwCxsxd7
 sm8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ByYz0vZByrH5ZeGoDfGbZOJgTHhBJ8/LzLyyFMFujSk=;
 b=J6ZAIEX/aSdUZQNlOUp6rk3fLZaWoJ+ZjUFnDb8KUaomMMdwGVW+4r4BNWSIHM2wG7
 hyV1ZmTon/f9WMQw+c9lVDHdjgvW1/yepNkKVDKevQMOiags/IO9EFK/yk4GnTJ3+uru
 6pwumXcY5M/opRnzDxEYcxWmUta7LfFNxt2ADH6zG9hmYdEDn1Cr6Wi2Lu2sInaqduwX
 2TfgWlW+XuJXE/Elw3YOlpSPGCw+wkwbZLvEySRjIOfGrUqduntH3xHmmMd5jL1p7/63
 4saEVWAXviUcEHHCnOXz+9QANK7kEUUbHobW6Pj2f05zYTp3dumlBFBydKlsuDJflsgG
 rU3A==
X-Gm-Message-State: AJIora9hMcypYsmQzq/B/x/TNutA0788d5YyEU35uUmXMGFs3KEItc+h
 kmUtzFhIjWFAjUXRF+1o9BzUWVgXv4K94drj
X-Google-Smtp-Source: AGRyM1smkVEeZdqzeINbgdR4nuuAyiDE+8c3FrrmoTGdPTvnuqpIOglqUu7CpMHr4HJf/ynHxA/ZGw==
X-Received: by 2002:ac2:55a4:0:b0:47d:aab8:a67c with SMTP id
 y4-20020ac255a4000000b0047daab8a67cmr6136167lfg.301.1655488541357; 
 Fri, 17 Jun 2022 10:55:41 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 u19-20020a05651220d300b0047968606114sm712747lfr.111.2022.06.17.10.55.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jun 2022 10:55:40 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v4 2/3] drm/msm/mdp5: convert to drm_crtc_handle_vblank()
Date: Fri, 17 Jun 2022 20:55:37 +0300
Message-Id: <20220617175538.1080351-3-dmitry.baryshkov@linaro.org>
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

