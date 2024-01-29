Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E3F840508
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jan 2024 13:29:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 085E110EA03;
	Mon, 29 Jan 2024 12:29:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com
 [209.85.167.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98FB910EA03
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jan 2024 12:29:38 +0000 (UTC)
Received: by mail-oi1-f172.google.com with SMTP id
 5614622812f47-3bba50cd318so2564495b6e.0
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jan 2024 04:29:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706531318; x=1707136118; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qQ1Xaz14ZyQBYq37o+9XH+aMANQ9nM3T0nzw2efla60=;
 b=YhLj5KLs45wL1IYoDfuhn0WPCp1e8qnw9BFd96ds2TmqMCIuEZuw/dncSJJrYYsb2p
 kNrb9r2kjL1BkrtGZuwoKVzRwbRGCJhyjK4oWCxxKLJn783Xdspy/j3whi+Bm8qHfBEJ
 32ZaYVWZUYXMDOsidBKwszYPoA5RIsfslAsBjyrDpl2ZuqIgHk4gagt0EBsQ45CR7bIj
 xRjgxnbKedizvTit8deLhlNXHWQUvzVj49In5cRC5iSzFK8ADM/+zFPXI456BnZARpM5
 HAhh54rW5F9qnSsuuMXAS2WRy02wwXgtiy/1moA2u3c6pfButf0p9esKNHEPOyuN5T++
 YfQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706531318; x=1707136118;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qQ1Xaz14ZyQBYq37o+9XH+aMANQ9nM3T0nzw2efla60=;
 b=Dy2WvMzJdryB5kJ8MEggQpD0uhvzq0aMuiF3pT63+zvLTquCvEmejAhmG04Tmhkvyx
 dHxCiq1z5v1yYnsHHec0pILDPJpiwvvbgBrh+lA7lKp9JxJPTJtIsAh+z7t6O3EdtbE3
 0oV3mWbwf41jEpmDK5r+3FkUpVU/b9x9Um5aYVOzkNPP0PaRYzG5WdGHFuFdI3lYW6tF
 61IvPOE4pOQNNQUm8Nq+l4BCIwd4QqJCaHZydXZEqb9LMlDl6g4dwigMZ3LyXX1i3m+4
 kld0zNHmQ4hNqBnZeW2nZvKzdHiutWglvqung3w8x1oEauJ4siKlPLroeRFZRniRCsDY
 oXBw==
X-Gm-Message-State: AOJu0YwwsqKnY1pw2+oYiOA8s4ORaFYP+HFBcQqt8YSaiV4lUuLcBmeE
 0dhO9FaeLZg/forQYzB+9CweiMmQ9rFqVa5T2KX/4BWLzBm1YDeF
X-Google-Smtp-Source: AGHT+IEpxyGkK3I2qfH0QfxhhGtyGzTOgWR/vf9S3KraxhEmCgG+oBGIvP2QSme6hM9sn60woT/VlQ==
X-Received: by 2002:a05:6808:114d:b0:3bd:bba6:9b14 with SMTP id
 u13-20020a056808114d00b003bdbba69b14mr9693174oiu.27.1706531317785; 
 Mon, 29 Jan 2024 04:28:37 -0800 (PST)
Received: from 192.168.10.7 ([2409:8a6a:542c:83f1:d1e7:d095:b7df:289d])
 by smtp.gmail.com with ESMTPSA id
 c38-20020a630d26000000b005cfb6b8e471sm5833300pgl.14.2024.01.29.04.28.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jan 2024 04:28:37 -0800 (PST)
From: Jianhua Lu <lujianhua000@gmail.com>
To: Jianhua Lu <lujianhua000@gmail.com>, Lee Jones <lee@kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>
Subject: [PATCH] backlight: ktz8866: Correct the check for of_property_read_u32
Date: Mon, 29 Jan 2024 20:28:29 +0800
Message-ID: <20240129122829.16248-1-lujianhua000@gmail.com>
X-Mailer: git-send-email 2.43.0
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

of_property_read_u32 returns 0 when success, so reverse the
return value to get the true value.

Fixes: f8449c8f7355 ("backlight: ktz8866: Add support for Kinetic KTZ8866 backlight")
Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
---
 drivers/video/backlight/ktz8866.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/video/backlight/ktz8866.c b/drivers/video/backlight/ktz8866.c
index 9c980f2571ee..014877b5a984 100644
--- a/drivers/video/backlight/ktz8866.c
+++ b/drivers/video/backlight/ktz8866.c
@@ -97,20 +97,20 @@ static void ktz8866_init(struct ktz8866 *ktz)
 {
 	unsigned int val = 0;
 
-	if (of_property_read_u32(ktz->client->dev.of_node, "current-num-sinks", &val))
+	if (!of_property_read_u32(ktz->client->dev.of_node, "current-num-sinks", &val))
 		ktz8866_write(ktz, BL_EN, BIT(val) - 1);
 	else
 		/* Enable all 6 current sinks if the number of current sinks isn't specified. */
 		ktz8866_write(ktz, BL_EN, BIT(6) - 1);
 
-	if (of_property_read_u32(ktz->client->dev.of_node, "kinetic,current-ramp-delay-ms", &val)) {
+	if (!of_property_read_u32(ktz->client->dev.of_node, "kinetic,current-ramp-delay-ms", &val)) {
 		if (val <= 128)
 			ktz8866_write(ktz, BL_CFG2, BIT(7) | (ilog2(val) << 3) | PWM_HYST);
 		else
 			ktz8866_write(ktz, BL_CFG2, BIT(7) | ((5 + val / 64) << 3) | PWM_HYST);
 	}
 
-	if (of_property_read_u32(ktz->client->dev.of_node, "kinetic,led-enable-ramp-delay-ms", &val)) {
+	if (!of_property_read_u32(ktz->client->dev.of_node, "kinetic,led-enable-ramp-delay-ms", &val)) {
 		if (val == 0)
 			ktz8866_write(ktz, BL_DIMMING, 0);
 		else {
-- 
2.43.0

