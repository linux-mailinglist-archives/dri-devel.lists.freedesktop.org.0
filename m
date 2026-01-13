Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E08FD1B915
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 23:17:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0977710E252;
	Tue, 13 Jan 2026 22:17:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LxRVIvmj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2395110E252
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 22:17:33 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-432d2c7a8b9so4336332f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 14:17:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768342651; x=1768947451; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=adkzvRDq3qVFPYxqcikdCLTY3yBHVJYfnHghvFsSO8k=;
 b=LxRVIvmj2kBnNMvPbIRmpssaZDbAyiu94M1xo0uA8lPmW3StYtbD234BjWougmGRdQ
 WvE580iYXZv97AILd4EoszlX2HbzMt07m3spo6SanT+HFk0LiYE+c/J1Imb9U8lHVc4K
 NnOgdbI5DJ5XvzoMZ0Dulj+FNx4hgQ7yZLS9DJkVkYIW3nAZYKW3TBiwZ1ZAoLepfnL8
 hl+RsHRsf9ymOUbGsPMdU89hXyW6/RAOeYHFG4Sn47sg4DCSVJwut7Ry1H1ErjlNqOCg
 mrbOLGV3nAoyC+jXDYIZpG9xEdm8fPkjwfEtvBBe8nN76o7nviSBVcQFFPap3imJjkvs
 qSXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768342651; x=1768947451;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=adkzvRDq3qVFPYxqcikdCLTY3yBHVJYfnHghvFsSO8k=;
 b=d9TXMa4z2PNZEnoPYctz1wiFyAQ+NtBX1jL+rt3WW87CUsI6I35lBjMVSoLIK8Sgfl
 unpNOmSFsdXyDPG/9E7kkiVGKxift+i1w0+E+eL1GigvjAtT10M4nNL3GdGDZ66Tz4MH
 EOhIU0hEUt1BKNDN34iiwEPdXE5h0T1ldkDoD8mWt9PUh2YWRPMEdjifh0algzezR0tC
 ydfPb2fMpVUsNLo8vUwoQ5VtJmPJlImwiRg6GmI1K2E5juFyzSMMHRYPHn7sg/JfznQ8
 wIjBl+6JOUCTYare6Q/zYrnxRSotk8rMSmOcJ38caQpW+7XQ6Wf+MLomPUYOHnC4a84J
 F2Pg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXloYXtUcBiXyfDewCWA8z9lw1AcVViRRilNqMlzQtzAFzPah1fkeNYfvrczFnT3OL1PxRwYxgpKQE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzaLq/zOSebUcLY8RT5wF8/zlbwZodLXuxXpa+icxhXzD4TZ6NA
 IpxZx9wb2hWmlIl8flr8Z/HzjLxWiY5KgjPcjWLi7QRb2kkG1OJOZX0b
X-Gm-Gg: AY/fxX6rg6SOjYniiSa2tMN8uy62dhgixRFBQbtJolXkgSLbmvvIdBr7NLCWD8FX3/V
 GNvpVYpHue+Z5z22W6suZgXo3jtteedZUlkW40bmeLVuX97ItLbK6Gsr+VGwCfTuwZNyZN/OIJZ
 VqfiPZWUNn2ErqxogMMYRdPwO2LFlUTg+c9eo/jWTaM1AIeLMFoZXPmSO16qYrxEC6Rcdt6dQec
 wLqghyHHuRis1o5mb+6H3xvej7cxdWzsR6gpUlLi585ajWp9gfqnV+Ck/8kNSJnzKcuMv7tMi9e
 6sF3HI/rWE5SYdC/CS7uuFe1moKP6EJALCj6Z1LxX94rxCeH3PsYvuDOJT1T0UohvPQafoCK4fj
 n5amdBXNl5a7QJHQhG/T9OwCkkq5LMSajxIqDiOoEqNizzbQIjCnwr1gLGQN1M8HWO6Rd/t4gsK
 EbGo4ETDPHdSfcGriEE8POCzkbWIpY8D/yt9opLy4mUIx1uQ==
X-Received: by 2002:a05:6000:3101:b0:431:abb:942f with SMTP id
 ffacd0b85a97d-4342c557b93mr412443f8f.54.1768342651409; 
 Tue, 13 Jan 2026 14:17:31 -0800 (PST)
Received: from ubuntu.localdomain ([154.161.44.196])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd5ee893sm46148930f8f.37.2026.01.13.14.17.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jan 2026 14:17:30 -0800 (PST)
From: Gideon Adjei <gideonadjei.dev@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Abdun Nihaal <abdun.nihaal@gmail.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Jianglei Nie <niejianglei2021@163.com>,
 Matthew Wilcox <willy@infradead.org>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, Gideon Adjei <gideonadjei.dev@gmail.com>
Subject: [PATCH v3] staging: fbtft: Change udelay() to fsleep()
Date: Tue, 13 Jan 2026 14:17:22 -0800
Message-Id: <20260113221722.5157-1-gideonadjei.dev@gmail.com>
X-Mailer: git-send-email 2.34.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace udelay() calls >= 100us with fsleep() to avoid busy-waiting.

The delays are used in init_display() callbacks. These callbacks are
invoked by fbtft_probe_common() during the driver's probe path. The
probe path runs in process context which already uses sleeping APIs.
This makes fsleep() safe to use in these situations.

Signed-off-by: Gideon Adjei <gideonadjei.dev@gmail.com>
---
 drivers/staging/fbtft/fb_tinylcd.c   | 2 +-
 drivers/staging/fbtft/fb_upd161704.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/fbtft/fb_tinylcd.c b/drivers/staging/fbtft/fb_tinylcd.c
index 9469248f2c50..3fb15df31592 100644
--- a/drivers/staging/fbtft/fb_tinylcd.c
+++ b/drivers/staging/fbtft/fb_tinylcd.c
@@ -41,7 +41,7 @@ static int init_display(struct fbtft_par *par)
 		       0x00, 0x35, 0x33, 0x00, 0x00, 0x00);
 	write_reg(par, MIPI_DCS_SET_PIXEL_FORMAT, 0x55);
 	write_reg(par, MIPI_DCS_EXIT_SLEEP_MODE);
-	udelay(250);
+	fsleep(250);
 	write_reg(par, MIPI_DCS_SET_DISPLAY_ON);
 
 	return 0;
diff --git a/drivers/staging/fbtft/fb_upd161704.c b/drivers/staging/fbtft/fb_upd161704.c
index c680160d6380..7fe2b556e17c 100644
--- a/drivers/staging/fbtft/fb_upd161704.c
+++ b/drivers/staging/fbtft/fb_upd161704.c
@@ -32,7 +32,7 @@ static int init_display(struct fbtft_par *par)
 
 	/* oscillator start */
 	write_reg(par, 0x003A, 0x0001);	/*Oscillator 0: stop, 1: operation */
-	udelay(100);
+	fsleep(100);
 
 	/* y-setting */
 	write_reg(par, 0x0024, 0x007B);	/* amplitude setting */
@@ -60,7 +60,7 @@ static int init_display(struct fbtft_par *par)
 
 	/* Power supply setting */
 	write_reg(par, 0x0019, 0x0000);	/* DC/DC output setting */
-	udelay(200);
+	fsleep(200);
 	write_reg(par, 0x001A, 0x1000);	/* DC/DC frequency setting */
 	write_reg(par, 0x001B, 0x0023);	/* DC/DC rising setting */
 	write_reg(par, 0x001C, 0x0C01);	/* Regulator voltage setting */
-- 
2.34.1

