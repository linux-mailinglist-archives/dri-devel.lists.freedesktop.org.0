Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A35F1A3028
	for <lists+dri-devel@lfdr.de>; Thu,  9 Apr 2020 09:34:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 052F66EB6C;
	Thu,  9 Apr 2020 07:33:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A75C46EB4F
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Apr 2020 06:52:56 +0000 (UTC)
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 08 Apr 2020 23:52:55 -0700
Received: from gurus-linux.qualcomm.com ([10.46.162.81])
 by ironmsg01-sd.qualcomm.com with ESMTP; 08 Apr 2020 23:52:54 -0700
Received: by gurus-linux.qualcomm.com (Postfix, from userid 383780)
 id 6E4744C4D; Wed,  8 Apr 2020 23:52:54 -0700 (PDT)
From: Guru Das Srinagesh <gurus@codeaurora.org>
To: linux-pwm@vger.kernel.org
Subject: [PATCH v12 09/11] backlight: pwm_bl: Use 64-bit division function
Date: Wed,  8 Apr 2020 23:52:38 -0700
Message-Id: <e2139a83008e9f301889f9384487c55de475a6a2.1586414867.git.gurus@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1586414867.git.gurus@codeaurora.org>
References: <cover.1586414867.git.gurus@codeaurora.org>
In-Reply-To: <cover.1586414867.git.gurus@codeaurora.org>
References: <cover.1586414867.git.gurus@codeaurora.org>
X-Mailman-Approved-At: Thu, 09 Apr 2020 07:33:24 +0000
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
Cc: Guru Das Srinagesh <gurus@codeaurora.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 David Collins <collinsd@codeaurora.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-fbdev@vger.kernel.org,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Subbaraman Narayanamurthy <subbaram@codeaurora.org>,
 Lee Jones <lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since the PWM framework is switching struct pwm_state.period's datatype
to u64, prepare for this transition by using div_u64 to handle a 64-bit
dividend instead of a straight division operation.

Cc: Lee Jones <lee.jones@linaro.org>
Cc: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Jingoo Han <jingoohan1@gmail.com>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: linux-pwm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-fbdev@vger.kernel.org

Signed-off-by: Guru Das Srinagesh <gurus@codeaurora.org>
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
---
 drivers/video/backlight/pwm_bl.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/video/backlight/pwm_bl.c b/drivers/video/backlight/pwm_bl.c
index efb4efc..3e5dbcf 100644
--- a/drivers/video/backlight/pwm_bl.c
+++ b/drivers/video/backlight/pwm_bl.c
@@ -625,7 +625,8 @@ static int pwm_backlight_probe(struct platform_device *pdev)
 		pb->scale = data->max_brightness;
 	}
 
-	pb->lth_brightness = data->lth_brightness * (state.period / pb->scale);
+	pb->lth_brightness = data->lth_brightness * (div_u64(state.period,
+				pb->scale));
 
 	props.type = BACKLIGHT_RAW;
 	props.max_brightness = data->max_brightness;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
