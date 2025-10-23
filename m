Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3BDEC00F7A
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 14:05:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0A5910E3E8;
	Thu, 23 Oct 2025 12:05:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ySKt7OTT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E81CB10E3E7
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 12:05:17 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-378cfd75fb0so7852961fa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 05:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761221116; x=1761825916; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=DqelzF++SRo5yLaNXUQGPgYYMPiGFZi9g01t7Yxskpc=;
 b=ySKt7OTTTy+4kbI/B94G7meNWxd3C+ZDYer7RWenrye79vkiNiJzI6mgdRYx9ZV9bm
 4NFC2pVvRoWrHPdkkR9IvsD5maHhqRoq6sUwsPhlqQ1Bi5bJALtkx4q8wKPVnlYoazip
 19VCrOkqI6mfTkesJktMhNOLeQUqILMfXpCcp3Q2eESffbJ8xqj0USORL8HsLezRkuUe
 iKvBmLNou5dLMHPRujkLfk9gyXJxEBmJjYA9DiDYjucGmuiDzS5PpTJx2qAIN2jvL+pM
 ZJdS0bDemvUWINFdDriZGliye9rOAMvyaiRgmuPqjy1d0ZRlTk7LXqxmJPY5NeM3mA9R
 47wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761221116; x=1761825916;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DqelzF++SRo5yLaNXUQGPgYYMPiGFZi9g01t7Yxskpc=;
 b=bYottkDcxGeJwP7LBbTfHpDSHv7ix9cwomXefQjZN7CYvjymwJFF76nvdPqOSexnpZ
 ZNmavdcxcqkX7zugROtDSzyhJjpmvkG5Ar44EaqKoTzIbEiaHcnGOcFrkl95rmVl8kr/
 AQtO1bTh1lTvE5De7hVjcLFefCrp9uTJgBndGuRK4SMKSL1rFZSnRV9/o3SwESXS/fyD
 XjK8Zyqanr3QiGWAQ3qhNNrYiM7JqszsxlBaPJLp/LElR8NGrwDbrqj5m1AZIsZO281T
 HGWIdt6ViALJq+zZZmtBW58yVVM1FyjrwhAA+CEKXvdJHhbvOVvLnQMrDDK4IC3LIixL
 7bZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXiRIqbVlKhGAiHuxVbeLmRjRCRxgqZiEzIw4bGFOLTJYZX1nixm19TBlhPbJQJ1GoqfTFaqdcN0eU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw4q4m0N6ucLBY1ljw5ATx7Kim5geUi15M/uNRWfiSre1AJhMzp
 ouHOIasjrxiSj2YvovvkWUFQl4XoMYQxkvq8lKy0P0FXVHs8CdwcEaKbBZzPUWDVJf8=
X-Gm-Gg: ASbGncusMCaQOC+t3na5T5haGTlxpwMu5OEmWXQR2sPAqUZP2QMt/ArMOrSvNz1bHaI
 j/jODmT+iaP8WeA7bdUL4LY3rPEaibOgu/YTq/ofMWSG9PSULmEuGvP1CuKbQCA6jRdBTzEyq9E
 D3xueYYHGoV79/9QvqgFg8HbkSv3cSYAKLFlqdTA6RbosvboRCpBiV8VWIk83+1I70uX7gyEW4Q
 RM1nY2/erM4xgM8wXeUOu13Dn3kuTLdomEyDkJlz6/mx/bYO434PtbumBog03k0aA9Ab15wGlzE
 UZwy17xxy3cL1J4MP1uFoGFpdpwwdmRvCnADYJOaQtX0yyPMdGCVYn/1p+t1OaFqxfL2IPdf1uf
 hpnScgCsM2tPhLnRPpzfDJNCxq7WuAucmOf+o4RNu0NCP+DIcmNh1Fh/nVYklkA0LYOAfgC851I
 F7CZHzUfO83x8TPPI12uDFBcb0tZmvHFC1j52LFJktEYdUJDYI/VEmFrg=
X-Google-Smtp-Source: AGHT+IG1ThP/lu0Wv1TjprZcNt7QoYkjsETnejHt3qE3WqrgVRFV3YZFbFdBpYJFVeAX7eNU5ebG9Q==
X-Received: by 2002:a2e:a916:0:b0:378:de30:74e6 with SMTP id
 38308e7fff4ca-378de307629mr3482701fa.25.1761221116209; 
 Thu, 23 Oct 2025 05:05:16 -0700 (PDT)
Received: from [192.168.1.2] (c-92-34-217-190.bbcust.telenor.se.
 [92.34.217.190]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-378d680322dsm4070701fa.47.2025.10.23.05.05.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Oct 2025 05:05:15 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 23 Oct 2025 14:05:12 +0200
Subject: [PATCH 4/4] drm: panel: s6e63m0: Move DSI commands to enable/disable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251023-fix-mcde-drm-regression-v1-4-ed9a925db8c7@linaro.org>
References: <20251023-fix-mcde-drm-regression-v1-0-ed9a925db8c7@linaro.org>
In-Reply-To: <20251023-fix-mcde-drm-regression-v1-0-ed9a925db8c7@linaro.org>
To: Aradhya Bhatia <a-bhatia1@ti.com>, 
 Stefan Hansson <newbyte@postmarketos.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 dri-devel@lists.freedesktop.org
Cc: Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.3
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

Due to semantic changes in the bridge core, panels cannot send
any DSI commands in the prepare/unprepare callbacks: there is
no guarantee that the DSI transmitter is available at this
point.

This will affect also SPI-based S6E63M0 displays, but that
should be fine.

Tested on the Samsung Golden (GT-I8190).

Cc: Aradhya Bhatia <a-bhatia1@ti.com>
Fixes: c9b1150a68d9 ("drm/atomic-helper: Re-order bridge chain pre-enable and post-disable")
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpu/drm/panel/panel-samsung-s6e63m0.c | 31 +++++++++++----------------
 1 file changed, 12 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e63m0.c b/drivers/gpu/drm/panel/panel-samsung-s6e63m0.c
index ea241c89593b..7e000f30b124 100644
--- a/drivers/gpu/drm/panel/panel-samsung-s6e63m0.c
+++ b/drivers/gpu/drm/panel/panel-samsung-s6e63m0.c
@@ -508,32 +508,30 @@ static int s6e63m0_disable(struct drm_panel *panel)
 	s6e63m0_dcs_write_seq_static(ctx, MIPI_DCS_ENTER_SLEEP_MODE);
 	msleep(120);
 
+	s6e63m0_clear_error(ctx);
+
 	return 0;
 }
 
 static int s6e63m0_unprepare(struct drm_panel *panel)
 {
 	struct s6e63m0 *ctx = panel_to_s6e63m0(panel);
-	int ret;
 
-	s6e63m0_clear_error(ctx);
+	return s6e63m0_power_off(ctx);
+}
 
-	ret = s6e63m0_power_off(ctx);
-	if (ret < 0)
-		return ret;
+static int s6e63m0_prepare(struct drm_panel *panel)
+{
+	struct s6e63m0 *ctx = panel_to_s6e63m0(panel);
 
-	return 0;
+	return s6e63m0_power_on(ctx);
 }
 
-static int s6e63m0_prepare(struct drm_panel *panel)
+static int s6e63m0_enable(struct drm_panel *panel)
 {
 	struct s6e63m0 *ctx = panel_to_s6e63m0(panel);
 	int ret;
 
-	ret = s6e63m0_power_on(ctx);
-	if (ret < 0)
-		return ret;
-
 	/* Magic to unlock level 2 control of the display */
 	s6e63m0_dcs_write_seq_static(ctx, MCS_LEVEL_2_KEY, 0x5a, 0x5a);
 	/* Magic to unlock MTP reading */
@@ -547,15 +545,10 @@ static int s6e63m0_prepare(struct drm_panel *panel)
 
 	ret = s6e63m0_clear_error(ctx);
 
-	if (ret < 0)
+	if (ret < 0) {
 		s6e63m0_unprepare(panel);
-
-	return ret;
-}
-
-static int s6e63m0_enable(struct drm_panel *panel)
-{
-	struct s6e63m0 *ctx = panel_to_s6e63m0(panel);
+		return ret;
+	}
 
 	s6e63m0_dcs_write_seq_static(ctx, MIPI_DCS_EXIT_SLEEP_MODE);
 	msleep(120);

-- 
2.51.0

