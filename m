Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E43D78C1975
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 00:37:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4D3F10ECEF;
	Thu,  9 May 2024 22:37:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="NB+W4fIM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31E9B10ECEF
 for <dri-devel@lists.freedesktop.org>; Thu,  9 May 2024 22:37:40 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-2e521817c1fso4986671fa.0
 for <dri-devel@lists.freedesktop.org>; Thu, 09 May 2024 15:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1715294258; x=1715899058; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=MJY1WdpDYNtMmaPK1COHpoOEPTHjLRXGYqacL5vf5B8=;
 b=NB+W4fIM3WbI0x66cSH1JoNfUU80KsDjRPeHRhp7KpkUYHzl6DH4AvGyi0zEgVMaVr
 WKsinojDEhrcMhWMCywtXa3ukftjcyQ68R5sBU3beop+YQUYrncmsv9BWELFtCBbSvf4
 YtZ/d2gLh8sWhF7RKcebOOaFDqXxni9XhD7/MFnZ5wfC/B8VM0tPRNl6tovlf9dc7g4X
 /L4oxiuEi0Kl9yXWLzb2s/Sto+YTMbf427U0dsc4A73z1+Dcw0eICDrMBxmheSB+aT3S
 iA/2oi7Gkzp2NWGaXRkGhoU8HOAPaqO81AZ1BNaeDmNqOZmv/oWseIGuvOhCj77d1ohB
 J0JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715294258; x=1715899058;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MJY1WdpDYNtMmaPK1COHpoOEPTHjLRXGYqacL5vf5B8=;
 b=iYoV2JRkmnQigYdCLzi8eFYBnnm3XT5d2Y0rZOlSHQ+IR88eMxrlsMhHPOLFfpcRzZ
 e6D22MLNUocIzeR5csS0zOepQPjF5dPQjdp6n+k7edLlU6Yyioa0NM4K9I1PW2n08X1C
 SP9xkIBIxtCn24Sma+gJFHocjlu8B25uwApRtT9KdzfhwUXLpTl2RIwXzS5h2MOh6ll1
 oorLafKBBh7WrbKNoDKcfps4F8Tz/XgSXNzwqP1lXFxbbw8xXbeyvL1ra01nkMUhy6Uo
 FFJeskciA/Xt4/usnU9PtXlxnMK+WzXj92rW9VyfmW1TOJWMncDKZTY5QquxbZYEIvUf
 USuw==
X-Gm-Message-State: AOJu0YxCBtLrK7Z+5FIZLpPItT7FEYtIcevk+iKAtpfT3g07RKCH8yPv
 LVwM13oDHfXPz/OQRNTGR/XGC3ogrHA2fIhsj9oi7kmb1rn+ibk0Mj9j43g6vvQ=
X-Google-Smtp-Source: AGHT+IGFTvw1vxx85dKbJll5ZaDg39l0SDuhBFDjN3HTXmrCOzJmUUBmBQXdeARfZ/bdKcDF52kWww==
X-Received: by 2002:a05:6512:451:b0:51e:ff32:16a8 with SMTP id
 2adb3069b0e04-52210273f01mr460200e87.62.1715294258223; 
 Thu, 09 May 2024 15:37:38 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-521f38d32f1sm457974e87.181.2024.05.09.15.37.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 May 2024 15:37:37 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 10 May 2024 01:37:36 +0300
Subject: [PATCH RFC 3/7] drm/panel: ilitek-ili9882t: use wrapped MIPI DCS
 functions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240510-dsi-panels-upd-api-v1-3-317c78a0dcc8@linaro.org>
References: <20240510-dsi-panels-upd-api-v1-0-317c78a0dcc8@linaro.org>
In-Reply-To: <20240510-dsi-panels-upd-api-v1-0-317c78a0dcc8@linaro.org>
To: Douglas Anderson <dianders@chromium.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Caleb Connolly <caleb.connolly@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Vinod Koul <vkoul@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2005;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=LbXKWqiDtaK+AQ1NXY6dRRGJIa5nbJ3JMjRjO+iNdK4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmPVAuGD8s+0CZnKan0NSsgk22yRkq0bYPJEx4s
 J4D6SGoo62JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZj1QLgAKCRCLPIo+Aiko
 1U1QB/9jf6h6hbySFkd5s3YSe7Rk72+e2cx8A9V4vSgxt24eApZJ8tUZarJ3aHGtZ2fr2/pPdLz
 /Eq6giUUMEAURLyx956TTierWY5J7Ifq9AVSoQDdyxcmMMiXdclrpBzeR/fPA3br+R+xqBoXhHb
 DAKhaiXm776JWUDqglqM6VoEaH+ciW2ZQG1Wa1jKU92K3EHRzTaDFa3xruoems2yPxoQvy69N+k
 E7hAEAhb9IF5gVcFYPUWKKyUHsPRB6jIJ2xMeuNX2WkR7G15sr33GQvQLlaSVdAnEm4nMIyBn7h
 X4myAKi0Qf2VNKhrFKpGwzMDBu9PkLnkloCNcZZaRHBlc2xY
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove conditional code and always use mipi_dsi_dcs_*multi() wrappers to
simplify driver's init/exit code.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/panel/panel-ilitek-ili9882t.c | 30 +++++++++------------------
 1 file changed, 10 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c b/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c
index 58fc1d799371..e7a74d5443b0 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c
@@ -402,19 +402,15 @@ static int starry_ili9882t_init(struct ili9882t *ili)
 	mipi_dsi_dcs_write_seq_multi(&ctx, 0x92, 0x22);
 
 	ili9882t_switch_page(&ctx, 0x00);
-	mipi_dsi_dcs_write_seq_multi(&ctx, MIPI_DCS_EXIT_SLEEP_MODE);
-	if (ctx.accum_err)
-		return ctx.accum_err;
+	mipi_dsi_dcs_exit_sleep_mode_multi(&ctx);
 
-	msleep(120);
+	mipi_dsi_msleep(&ctx, 120);
 
-	mipi_dsi_dcs_write_seq_multi(&ctx, MIPI_DCS_SET_DISPLAY_ON);
-	if (ctx.accum_err)
-		return ctx.accum_err;
+	mipi_dsi_dcs_set_display_on_multi(&ctx);
 
-	msleep(20);
+	mipi_dsi_msleep(&ctx, 20);
 
-	return 0;
+	return ctx.accum_err;
 };
 
 static inline struct ili9882t *to_ili9882t(struct drm_panel *panel)
@@ -424,20 +420,14 @@ static inline struct ili9882t *to_ili9882t(struct drm_panel *panel)
 
 static int ili9882t_enter_sleep_mode(struct ili9882t *ili)
 {
-	struct mipi_dsi_device *dsi = ili->dsi;
-	int ret;
-
-	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
+	struct mipi_dsi_multi_context ctx = { .dsi = ili->dsi };
 
-	ret = mipi_dsi_dcs_set_display_off(dsi);
-	if (ret < 0)
-		return ret;
+	ili->dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
 
-	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
-	if (ret < 0)
-		return ret;
+	mipi_dsi_dcs_set_display_off_multi(&ctx);
+	mipi_dsi_dcs_enter_sleep_mode_multi(&ctx);
 
-	return 0;
+	return ctx.accum_err;
 }
 
 static int ili9882t_disable(struct drm_panel *panel)

-- 
2.39.2

