Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5ED93BFA33
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jul 2021 14:29:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D76F86E8BF;
	Thu,  8 Jul 2021 12:28:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1519889FD1
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jul 2021 12:28:50 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id p16so15025949lfc.5
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jul 2021 05:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9dgs04cWZ3Msqx0W8W8q6j1oCvkBtnZBWkKinotEoUY=;
 b=B4zG8Ky92qLBbFlZhH+U2h2FVRIBjLTciaEZqKkabPvWU9yPHX5GrQ25COexC/rebA
 b0f2GFcF2nOlq/HUvn6PVoM7v+tRdBqzlU4zg5sVX1vmDS211dl3cnIJXKHtCNVpmRnt
 7Hp9BmdZwatvPcfikCotZm0XkrtLO0LujPQ/WbyzD6JLoteh4QhJcBesHAyyCvTAgIdl
 bx/Wom/LhH7TnXVV/XkoSKJLU40LDMUz2mbDTNFBr8h+4/EgWOdil4pK/QQoejqqh1j7
 a0BlOi3C5MwNrcfR0BsLqTIBEOwFU0RSyj/1f23gn1zglpAZUbW/H+MKS/j3+Y70I4rp
 IdoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9dgs04cWZ3Msqx0W8W8q6j1oCvkBtnZBWkKinotEoUY=;
 b=VLUX9gwuEzjwjP5qBuSb1b3Gl7bxrvsRHgo3W5aRiQLtE3ymePhAHTuYcvvIbSu1fa
 95fRXwdGp4D4bvhH11wL4/QLFP6wKQwX62Ra70K1/cA5QVahoBnMh1w/0PG9OrrcuPsx
 hyTi6CJ+3EaZV2WaAMbJOuTmObVry44uWA9Ig7nSLmkqQrtWCGjDZ64r4fYtQjPWm2l9
 PJQ6GPcAZrkbpgdwurt1lXCuKD02xszScySa8MOsyGy3p7tqewBLiSXiVEJK5HPCnEZ7
 WgN1Idtfur3UtLFmT7+TURK5Re7nloXimkax+K+Y7GWfy34TvJDasKBW8ahK2dHQsEk0
 ICJA==
X-Gm-Message-State: AOAM530IZ1kbZh1CE0Y9M9MpoXUl/26pEEF0pWOQZ2Uh0hcTVxJ7D9n5
 0tWSAPQmQy/lNMAu9OUqNs4kiA==
X-Google-Smtp-Source: ABdhPJw++sWzNmdENu5ts00eacjxt1C/Vguw+xsjeG7hfxU6wYobPRW3x6NaHOoLJ3dadUoRNM2KBA==
X-Received: by 2002:ac2:4896:: with SMTP id x22mr15612187lfc.600.1625747328534; 
 Thu, 08 Jul 2021 05:28:48 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id f1sm184368lfs.211.2021.07.08.05.28.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 05:28:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Subject: [PATCH v1 4/7] drm/msm/mdp5: move mdp5_encoder_set_intf_mode after
 msm_dsi_modeset_init
Date: Thu,  8 Jul 2021 15:28:30 +0300
Message-Id: <20210708122833.363451-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210708122833.363451-1-dmitry.baryshkov@linaro.org>
References: <20210708122833.363451-1-dmitry.baryshkov@linaro.org>
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

Move a call to mdp5_encoder_set_intf_mode() after
msm_dsi_modeset_init(), removing set_encoder_mode callback.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 15aed45022bc..b3b42672b2d4 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -209,13 +209,6 @@ static int mdp5_set_split_display(struct msm_kms *kms,
 							  slave_encoder);
 }
 
-static void mdp5_set_encoder_mode(struct msm_kms *kms,
-				  struct drm_encoder *encoder,
-				  bool cmd_mode)
-{
-	mdp5_encoder_set_intf_mode(encoder, cmd_mode);
-}
-
 static void mdp5_kms_destroy(struct msm_kms *kms)
 {
 	struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(kms));
@@ -287,7 +280,6 @@ static const struct mdp_kms_funcs kms_funcs = {
 		.get_format      = mdp_get_format,
 		.round_pixclk    = mdp5_round_pixclk,
 		.set_split_display = mdp5_set_split_display,
-		.set_encoder_mode = mdp5_set_encoder_mode,
 		.destroy         = mdp5_kms_destroy,
 #ifdef CONFIG_DEBUG_FS
 		.debugfs_init    = mdp5_kms_debugfs_init,
@@ -448,6 +440,9 @@ static int modeset_init_intf(struct mdp5_kms *mdp5_kms,
 		}
 
 		ret = msm_dsi_modeset_init(priv->dsi[dsi_id], dev, encoder);
+		if (!ret)
+			mdp5_encoder_set_intf_mode(encoder, msm_dsi_is_cmd_mode(priv->dsi[dsi_id]));
+
 		break;
 	}
 	default:
-- 
2.30.2

