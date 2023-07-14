Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B864C753A7C
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 14:14:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74BD610E881;
	Fri, 14 Jul 2023 12:14:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 375F910E87E
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 12:14:51 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-51e590a8ab5so2319647a12.2
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 05:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689336889; x=1691928889;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TgPMyqhcYOSoB/wLOssO63qlIlM49Q140+nxqiBvG58=;
 b=EbmcQKgul6r57U77VkLKxO0Std3+UK3ldoAw+5il/pbmMcEIV1j+yevY/ZXv9VkR1J
 +/4YKAtOae75xN9J3tA3yU6G/kVO8Gp0bFwl5dIJuAwF2wZIh3TyV4U7YEdginHL/7Wb
 7Q1POHwuTeLeqtDaHV/M3Jf86N/52phGiATyqOFX3N/F+/oJdH8fEQuZ8P4tssx7VF0i
 cnKyIvsUWZ8cnnyPsUwLjS0mxRidx3JCST4tNTSARsNIg+Uq4qVposX3W9wSB2mTqIYb
 deDgxSM8kXx180pIPlKeKPAAvQEkHfxRwlsp0RxiOIOL/chzdSVfhdoEG8qejnhK4qJg
 EGMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689336889; x=1691928889;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TgPMyqhcYOSoB/wLOssO63qlIlM49Q140+nxqiBvG58=;
 b=IA1xmknX+HzPKXEbOiq3uM4GR6exhsxeve3Ek/lI/wU86d42DmOHrX8KS6Ym167DGw
 ajE09YiZPSPxKTbOc5URarOEHh4xhh7+7bkToun/cLLA1qUXyBR/9jvqCKYQ1Jk4nN9z
 wuAsppXPpVd5E1ucsMHFDZ2q/TnnoUN1GTQVez3solit2dsv3yHL1egS768/0oHRGxsu
 AcKJzZKdb34C6djfn1Tfs8XAy9w3dbriLfR3JN3FObRxI7Sq8SEsr5HaOjoMtamkbd4S
 sa5RmQ8J4dWF37nU1spwuYXGd5xHLDDMVjfNuawNWLXCaAz4r780/WRWdKLyWE6q26S3
 hNow==
X-Gm-Message-State: ABy/qLbu31aUGbXLmjIu2ELE+UdW7Ev8++qamhvsAC+rvc59Z7N03thQ
 0pZC6IYsbfY8i3LN1PPzKRk=
X-Google-Smtp-Source: APBJJlGCZk5eIAzsAIRe5sakyckPhJ0aqKFTBus5ia20xD48WrEFzxV5rsu/e+vLMLzskRlnKNWdwQ==
X-Received: by 2002:a50:fa98:0:b0:51e:4bc7:3976 with SMTP id
 w24-20020a50fa98000000b0051e4bc73976mr5022133edr.10.1689336888953; 
 Fri, 14 Jul 2023 05:14:48 -0700 (PDT)
Received: from tablet.my.domain
 (ip-37-248-157-105.multi.internet.cyfrowypolsat.pl. [37.248.157.105])
 by smtp.gmail.com with ESMTPSA id
 r16-20020aa7d150000000b0051e19bf66a4sm5680666edo.83.2023.07.14.05.14.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jul 2023 05:14:48 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
To: Lee Jones <lee@kernel.org>
Subject: [PATCH 2/2] backlight: lp855x: Catch errors when changing brightness
Date: Fri, 14 Jul 2023 14:14:40 +0200
Message-ID: <20230714121440.7717-3-aweber.kernel@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230714121440.7717-1-aweber.kernel@gmail.com>
References: <20230714121440.7717-1-aweber.kernel@gmail.com>
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
Cc: linux-pwm@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 Artur Weber <aweber.kernel@gmail.com>, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 ~postmarketos/upstreaming@lists.sr.ht,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The lp855x_bl_update_status function's return type is int, but
it always returns 0, without checking for the results of the
write_byte/pwm_ctrl functions called within.

Make this function return the return values of the functions it
calls, and modify the lp855x_pwm_ctrl function to return errors.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
 drivers/video/backlight/lp855x_bl.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/video/backlight/lp855x_bl.c b/drivers/video/backlight/lp855x_bl.c
index 349ec324bc1e..61a7f45bfad8 100644
--- a/drivers/video/backlight/lp855x_bl.c
+++ b/drivers/video/backlight/lp855x_bl.c
@@ -217,7 +217,7 @@ static int lp855x_configure(struct lp855x *lp)
 	return ret;
 }
 
-static void lp855x_pwm_ctrl(struct lp855x *lp, int br, int max_br)
+static int lp855x_pwm_ctrl(struct lp855x *lp, int br, int max_br)
 {
 	struct pwm_state state;
 
@@ -234,23 +234,26 @@ static void lp855x_pwm_ctrl(struct lp855x *lp, int br, int max_br)
 	state.duty_cycle = div_u64(br * state.period, max_br);
 	state.enabled = state.duty_cycle;
 
-	pwm_apply_state(lp->pwm, &state);
+	return pwm_apply_state(lp->pwm, &state);
 }
 
 static int lp855x_bl_update_status(struct backlight_device *bl)
 {
 	struct lp855x *lp = bl_get_data(bl);
 	int brightness = bl->props.brightness;
+	int ret;
 
 	if (bl->props.state & (BL_CORE_SUSPENDED | BL_CORE_FBBLANK))
 		brightness = 0;
 
 	if (lp->mode == PWM_BASED)
-		lp855x_pwm_ctrl(lp, brightness, bl->props.max_brightness);
+		ret = lp855x_pwm_ctrl(lp, brightness,
+				      bl->props.max_brightness);
 	else if (lp->mode == REGISTER_BASED)
-		lp855x_write_byte(lp, lp->cfg->reg_brightness, (u8)brightness);
+		ret = lp855x_write_byte(lp, lp->cfg->reg_brightness,
+					(u8)brightness);
 
-	return 0;
+	return ret;
 }
 
 static const struct backlight_ops lp855x_bl_ops = {
-- 
2.41.0

