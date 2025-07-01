Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9B8AEF323
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 11:22:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8E9310E56A;
	Tue,  1 Jul 2025 09:22:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="p72W9DaT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7903210E57E
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jul 2025 09:22:49 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-60707b740a6so5083446a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Jul 2025 02:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751361768; x=1751966568;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TUCqoUDneJro7iETMW+UlVbrddPjh3TOFBSvfBqoW8s=;
 b=p72W9DaTnLUw9CUfAKPlx4TMkB3g/T91lwRuxoMzM2ZrNevIJjKHhOpemwFv+MdsGU
 MvsQs/KKxLRm2qxHm1QX5l3Lg8lmRCY4UoyVG6D5MDRGBYktMJVf5aN86LwkulVDypwB
 CfRhix0jIoigBGz/tHh9UlVY8xG32UHtCrmgHyHJ5nWhpSpbaOGXq6ybOK7dmLqNKcvb
 AXbqopj9WRXKZnNFxKvynhX+LyK032wB9lrQ13+1g0GFJV9s+3qdTkfosurs7v8iaJ6O
 /XhfGFvIEDRW1H4VaLVh1cW7GBxSZR7jPgCbKNCWNsj8gllCZ00iJ0b9JE9gPSVUi8TS
 p8zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751361768; x=1751966568;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TUCqoUDneJro7iETMW+UlVbrddPjh3TOFBSvfBqoW8s=;
 b=wA32wLJbBD9V2RCt8+JWTXeuG6vq3AVyHytj3uXG1uQpU40+8mY4Ai554uavyHmr9Q
 IRKfb9KOKE40Rcs+lCAU6PGnCOSgv0fJ3yCZ8AO5q2ZSq+Cz0ciEEdl6ae3aT7ZgoSg4
 fF4jes6ganmmM8JXoEYtWr+rOYN8WLDUF1Q5drpGMJWf+kJ7u3lHHRo4kxFV/Oop113+
 TnDbyPW438SughvqR6JdrhEaAFa4w8A460gWmPYG7n5NPmsiebHsJsnkkRvycTPsa4Ie
 2BbgNQmXlXpsn8od6ezEMwQRXakcjyaBiFD7NPDZr9xqL/ZhGAKMxyr6rCcFYgnaO4Nv
 Aj9Q==
X-Gm-Message-State: AOJu0YwOIlBywCVGIs1ayJECYFSw4SvziadpyB0Okk/OdFFrGUELAmqO
 F23mOs/oO0GD658XDEohrrqLHeDw7soUVqnmc5yQSSbtrnNjAqf0ZnmIj4xpsrRQPsw=
X-Gm-Gg: ASbGncs5SsMtiO0dEjGiar+JjzkAjIVyLUHUBMaQ87OWZULzfGZ2fmvmW5zX7cz79bo
 +AwE+0ElZImuDaAkiYextdHHkL3MNX17lL3T0NttnLVUdBiOX4Gt7bvXtVOALXAynQHa+oyS5F3
 SaReMVmnf3Eth0gEcmIl2/T/MXyan2k8yAxyitg/QiU+irVrFiNVPo/K2S2ASh2QVl421m00vcZ
 2Y6xZqbuHWVHzzc3aa5dqq26njMh7DzP3/gIWhqiJWFdt7IyMoK20Lc+vFJ3GoInlj5IsgW5HA5
 S3G0CvMMu2txwUYjA2d2pnOyITu8Bkc1DyQ5U393MCzWLhbHoPmKiYYtzcHozY3iP9RYi/y0ZvO
 50iBL9+RMhSMCc7XlpfPsVpJn93AMx2nHAbqftbQ=
X-Google-Smtp-Source: AGHT+IGNkPdEmpZwCcvrjMGu50yM0BpyZDVCekNrVk7CymZh8/DBYnTbl8HbewnLrBo3HK0iDVXJOA==
X-Received: by 2002:a05:6402:510e:b0:602:3e3:dada with SMTP id
 4fb4d7f45d1cf-60c88e5a42cmr14195974a12.25.1751361767850; 
 Tue, 01 Jul 2025 02:22:47 -0700 (PDT)
Received: from localhost
 (p200300f65f06ab0400000000000001b9.dip0.t-ipconnect.de.
 [2003:f6:5f06:ab04::1b9]) by smtp.gmail.com with UTF8SMTPSA id
 4fb4d7f45d1cf-60c828bbd34sm7180438a12.9.2025.07.01.02.22.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jul 2025 02:22:47 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Flavio Suligoi <f.suligoi@asem.it>, Lee Jones <lee@kernel.org>,
 Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-pwm@vger.kernel.org
Subject: [PATCH 1/2] backlight: mp3309c: Drop pwm_apply_args()
Date: Tue,  1 Jul 2025 11:22:36 +0200
Message-ID: <2d1075f5dd45c7c135e4326e279468de699f9d17.1751361465.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1751361465.git.u.kleine-koenig@baylibre.com>
References: <cover.1751361465.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=956;
 i=u.kleine-koenig@baylibre.com; h=from:subject:message-id;
 bh=SvqlrEMtz9LJbvaRV1nJwjGYDMDWrjXzaQ+j9PwbG0E=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBoY6jeSs2B/0GJOrfWXLz92STYcWG2LA50BuCvG
 U8iwJaqxvSJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaGOo3gAKCRCPgPtYfRL+
 TtCpCACgUCBjnISaJ0LkEDzhTx366kGo8zu/zHb/myUGbmjg6BgfBCJy4XZXkJDlIQBFAxZfesh
 PTnwXU3MU2tOeKGrPvp8LR1qJJG3Fumu4/DUeHHhGFEZtO+qTd3v+i3mHPvcSuEt84mHh6V33bP
 AcAN1Ztvh8XA9M5ocRF9Rm8r/CIGDjbLOtNyHdySYlv+cI3Q5VpL8YgQBTmIqHg2T+XVBDcZYAW
 cxQsd1vvYQswRzBzdLMLjLjWqK5hvzBN6qOES0NqnFT4XJbVjvUQPfs8uzsT4n69IrWYT4lAFqp
 luD1DXSLkvLh0e5U6iLEMkqIT3xAORapXP89g/Y9sG+iBpb+
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

pwm_apply_args() sole purpose is to initialize all parameters specified
in the device tree for consumers that rely on pwm_config() and
pwm_enable(). The mp3309c backlight driver uses pwm_apply_might_sleep()
which gets passed the full configuration and so doesn't rely on the
default being explicitly applied.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/video/backlight/mp3309c.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/video/backlight/mp3309c.c b/drivers/video/backlight/mp3309c.c
index 372058e26129..bb4e85531cea 100644
--- a/drivers/video/backlight/mp3309c.c
+++ b/drivers/video/backlight/mp3309c.c
@@ -222,7 +222,6 @@ static int mp3309c_parse_fwnode(struct mp3309c_chip *chip,
 		if (IS_ERR(chip->pwmd))
 			return dev_err_probe(dev, PTR_ERR(chip->pwmd), "error getting pwm data\n");
 		pdata->dimming_mode = DIMMING_PWM;
-		pwm_apply_args(chip->pwmd);
 	}
 
 	/*
-- 
2.49.0

