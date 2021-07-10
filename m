Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0762D3C371B
	for <lists+dri-devel@lfdr.de>; Sun, 11 Jul 2021 00:20:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A72416EB6E;
	Sat, 10 Jul 2021 22:20:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5A826EB73
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jul 2021 22:20:13 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id r16so15226173ljk.9
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jul 2021 15:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TR8ndGweFJ1zlT+mXoJoL5P2xKgyplXAag8kXZdug0c=;
 b=fENDnaOf/UP/RMKJFYxauZAcyuS6+LC9ElBy6sBFJckE4FkoINX7w/pLhlpwRb4LoH
 XS7790rHbisHZYZ4cPkK628jgpa/blwWMmDhdysWbQfPlHl7/YMP+ESJAtaCLENjNwrJ
 Dr9YIrK5QvICN/LOqmnkhbxvYiTdRGirUbBsAtjJvY3QnQ+cGowPilRnDUQjtOma3it/
 JTeE/JLC0WsvYAgyAe44aYh7uWetQxjpzHRwxW4ig7m6/cP900djixGACrWpPId/5jys
 V3fMnGQ7vF5nmdiYsH/IVynAN8DRFh7VEAB+ZzoSWpLuCmPIgimJ0IEJaKfZ1ESTTQA/
 rV6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TR8ndGweFJ1zlT+mXoJoL5P2xKgyplXAag8kXZdug0c=;
 b=HiAOpgg2mf4XZ6JtJkg6k99bzdZG/nXSofEKF/avAn39tGWkl100s2aFxf+vg8MJoz
 Mm5PpAWeYE2LDQLINFUgn6fjPqyZKlG/QaaONUFJTp7uQcL5sUFFr3aVKQ+poyhDFOk3
 Ea9u9RzpLbcJr7OB+BZYONBjMwMv2H8+hGvFMSPqOijHSModJrbQFcsc5F/KuxEPQ/9Q
 RnLNQ7rzHE/IsTcXVP4qai+Yg2CFpDdCKnz6bdKX4w0RZdidiPKIMLruBJKa3ogn/oDR
 K5Ul6GPmsjlE7mXTuuRP6oA5jhMoZAxzpk5PiHF3Xl6mIsulmmZ/hn/eGcxGUQ5v2YM1
 c60A==
X-Gm-Message-State: AOAM531T8ZUVtJD050Q2Ze+RiOm7irCRbMJw5p+YoPzXGQcpaIR/GpyO
 q5ZwDj7B6kDPKK3A1b/9xJw7ow==
X-Google-Smtp-Source: ABdhPJz0KbTfdTPuQA7RGX6XRfCQOgs7wgEMdI9iLQdfZVyS+bMtCRlrYXKmytfRxjRqvDUwt3V3YQ==
X-Received: by 2002:a2e:9e53:: with SMTP id g19mr36997908ljk.58.1625955612418; 
 Sat, 10 Jul 2021 15:20:12 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id s15sm795466lfp.216.2021.07.10.15.20.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jul 2021 15:20:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Subject: [PATCH v3 5/7] drm/msm/dp: stop calling set_encoder_mode callback
Date: Sun, 11 Jul 2021 01:20:03 +0300
Message-Id: <20210710222005.1334734-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210710222005.1334734-1-dmitry.baryshkov@linaro.org>
References: <20210710222005.1334734-1-dmitry.baryshkov@linaro.org>
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
Cc: Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

None of the display drivers now implement set_encoder_mode callback.
Stop calling it from the modeset init code.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 051c1be1de7e..70b319a8fe83 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -102,8 +102,6 @@ struct dp_display_private {
 	struct dp_display_mode dp_mode;
 	struct msm_dp dp_display;
 
-	bool encoder_mode_set;
-
 	/* wait for audio signaling */
 	struct completion audio_comp;
 
@@ -283,20 +281,6 @@ static void dp_display_send_hpd_event(struct msm_dp *dp_display)
 }
 
 
-static void dp_display_set_encoder_mode(struct dp_display_private *dp)
-{
-	struct msm_drm_private *priv = dp->dp_display.drm_dev->dev_private;
-	struct msm_kms *kms = priv->kms;
-
-	if (!dp->encoder_mode_set && dp->dp_display.encoder &&
-				kms->funcs->set_encoder_mode) {
-		kms->funcs->set_encoder_mode(kms,
-				dp->dp_display.encoder, false);
-
-		dp->encoder_mode_set = true;
-	}
-}
-
 static int dp_display_send_hpd_notification(struct dp_display_private *dp,
 					    bool hpd)
 {
@@ -369,8 +353,6 @@ static void dp_display_host_init(struct dp_display_private *dp, int reset)
 	if (dp->usbpd->orientation == ORIENTATION_CC2)
 		flip = true;
 
-	dp_display_set_encoder_mode(dp);
-
 	dp_power_init(dp->power, flip);
 	dp_ctrl_host_init(dp->ctrl, flip, reset);
 	dp_aux_init(dp->aux);
-- 
2.30.2

