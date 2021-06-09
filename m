Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 217B23A1ECB
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 23:17:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B9BA6EB19;
	Wed,  9 Jun 2021 21:17:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6248B6E420
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jun 2021 21:17:30 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id bn21so1721497ljb.1
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Jun 2021 14:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9dgs04cWZ3Msqx0W8W8q6j1oCvkBtnZBWkKinotEoUY=;
 b=MjSGuvkj52+NlpRiGoEMHe2XcyMbHXdWIJJWE2M5Z06Lmbq34wKHLFa8JneKOyxT4T
 zPQnUk2WvpqaElBp2Kt++0dC3z1B0g0kZ6ivnLSHoDGpjw3MNOrdCcvR4C+O91dxKueb
 k7FsAycDiGW+0/StVBhfKgugAfjm+71Hhue8nXVlkxRvWfqHvZGwIyKxYq0CcSwSooMD
 LgZO6GseD3yq11IrONZkYunffe0mtj+x6AblEy57tb2J1N7FWnSMurP4GYaKX8GLQl6m
 wkv4GifRkcHPRRs+XTDFNZyxzRVSzlkMGGxfCWb8RNT7SrPMKi6xWkltr/+v6HrzIMII
 hfZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9dgs04cWZ3Msqx0W8W8q6j1oCvkBtnZBWkKinotEoUY=;
 b=GXE3Lj5qi51ghDqrZ7+1S0B5avmJefKi69G34P3P5Fpgcr9XGuJFb8p4Y652nt69aB
 qXh7ZQVPIudM2WxSJDyEJ45kSOplbffz71hTIn2RiWxyuibyJA0OCFr1kWF/i5yqK36p
 Y6XfbNcGneMp4pb0/PUZ7dUkkFI/UsrZEQPakcDpuLhBE7XGh60K+TaYgcZyox9NQLFq
 vraL40GXqAEizaZUDt98YaERkIIvIDKoyAI2ySC9EIAABPW8yk3vdtZ5w44gnrdGmIwt
 H67QN54e+4OgyyeoEKdmDGaKRoAkWyjLF9KGTo5Rb9gwxySbBX1vrSvSJfPJx2MGSGXQ
 6uYw==
X-Gm-Message-State: AOAM532Wb9eaza4KxrhYkScmerEvZ+Q2HF+ddCob/KNyE546ec5JJter
 AIjisgsbeA16D2oL5LZZaZYb6Q==
X-Google-Smtp-Source: ABdhPJwA6Th/FL1bvaEHObvbGAvSjDBwCyEftMmoigBEJSWVVDst/PLSoptXRuDpaYTAtZwJsLWdsA==
X-Received: by 2002:a2e:a48f:: with SMTP id h15mr1304167lji.252.1623273448317; 
 Wed, 09 Jun 2021 14:17:28 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id z20sm95329ljk.50.2021.06.09.14.17.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 14:17:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Subject: [RFC 3/6] drm/msm/mdp5: move mdp5_encoder_set_intf_mode after
 msm_dsi_modeset_init
Date: Thu, 10 Jun 2021 00:17:20 +0300
Message-Id: <20210609211723.2565105-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210609211723.2565105-1-dmitry.baryshkov@linaro.org>
References: <20210609211723.2565105-1-dmitry.baryshkov@linaro.org>
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

