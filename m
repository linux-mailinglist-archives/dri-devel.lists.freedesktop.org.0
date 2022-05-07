Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5610951E8D4
	for <lists+dri-devel@lfdr.de>; Sat,  7 May 2022 19:09:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C5BB10E96F;
	Sat,  7 May 2022 17:09:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 150C210E96F
 for <dri-devel@lists.freedesktop.org>; Sat,  7 May 2022 17:09:26 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id p10so17280027lfa.12
 for <dri-devel@lists.freedesktop.org>; Sat, 07 May 2022 10:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Fl5gRxPQwePsJhPtYdJYGhgQW5l6J6j4kwqCPdVck7I=;
 b=tQmFPaqB9Wjl+V8ASR5ujTk90TnQRMRKrZJq1wWao21lnAonDnDH1sLiiieAHNWwKr
 dfkPAQ8VipHgdgvwmiwuSd2PLt87xxgsdRpeScDn3PJTiJWXAcQm4Ekd3cViOg/E0WxI
 199FgXNZ1y+ugyHXORtg+jpnXpjgk38ykc0YGvCEChtHM/VKKzi7NoQOPKKAANfye4wi
 TzpqyTx006ncWPnEFz2r/c/xvaAdURw3EVo/ngT0GkMVgB+5SJRZg993W/iHvEW8TphC
 ODYzN4Jwail+j7CLKodJUl8WTwon9I3Zclqk1yPMBRrjdxnM0/bfScW+H081OwPNc81M
 FQ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Fl5gRxPQwePsJhPtYdJYGhgQW5l6J6j4kwqCPdVck7I=;
 b=Dnj2UMwXVWIZLAXiwOGfvAO0Zo+iiwM2Kr6thDI4yIKXIcfCHoIoBrEOI0Eo6Gh1Bf
 KQf26ngsk/K3fQtPohiiNBhJtXXg27WWLSthprjs2zO7xjCjqKviDassydx0C2w4fxXT
 Xo1vtn/6/oxZk/vaS6JQ0MR5KAmVrwvh1K9brxjmKlCg47tLiL7/p2B3evvKI0tQOpg5
 xzi4pllSG45XEN6tS6YXmxI8uHOygJnu9Vx39d9KViSTFy+wBlneCKWL81Zo8NiOdiCC
 aTWacfQD8IVGGCS6Sw+OFi0KUAtkqJaTsJ2Pd+UlMWiPgSqzGsVXO+4oh13lTjyceeNT
 QrxA==
X-Gm-Message-State: AOAM532L5BB5LF6J9ZWmEv9TANd+BPIE53OCwUzg15TUlFavTYs9hRwR
 8d/aUY5x8XF9yuiKRNDqjx/oiQ==
X-Google-Smtp-Source: ABdhPJxwRZ4sDrgrxB/oQOREsq+0eXzVLyq7Pkp+V1PlVr7UQIfmJVUYFBzgKY9UsfJ90edg5I75mw==
X-Received: by 2002:a05:6512:b0e:b0:44a:a5a0:f60e with SMTP id
 w14-20020a0565120b0e00b0044aa5a0f60emr6790155lfu.669.1651943364389; 
 Sat, 07 May 2022 10:09:24 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 n14-20020a05651203ee00b0047255d211f9sm1175308lfq.296.2022.05.07.10.09.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 May 2022 10:09:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v2 2/3] drm/msm/mdp5: convert to drm_crtc_handle_vblank()
Date: Sat,  7 May 2022 20:09:21 +0300
Message-Id: <20220507170922.1723712-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220507170922.1723712-1-dmitry.baryshkov@linaro.org>
References: <20220507170922.1723712-1-dmitry.baryshkov@linaro.org>
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

