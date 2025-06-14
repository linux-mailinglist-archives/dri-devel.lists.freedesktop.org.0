Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46396AD9A1F
	for <lists+dri-devel@lfdr.de>; Sat, 14 Jun 2025 06:57:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4992A10E16F;
	Sat, 14 Jun 2025 04:57:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mqiSDvQI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com
 [209.85.219.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B02E10E16F
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Jun 2025 04:57:43 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id
 3f1490d57ef6-e7d8eb10c06so2081387276.0
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 21:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749877062; x=1750481862; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=N3q2qVFEmbLsR2HxaXqu+Z2ORgyuH1IAkMrz+Hg3+zQ=;
 b=mqiSDvQI6PBhDxo0HKqS/48QyPKwXzvMgSkZw1cLBm0SozjCxmaFhdnouIYj8JuQgK
 /vXh1QD58anuwCn9QAGTGXH0g8fjvcGYgRn34qD2BKuZO3CVl7YzG34szrMgMIHCmoUw
 Orc/TBmnpPhyMGWcaVJD9+oRhkxlthbMFNKj1DWxxd9MRF0urT2zN+O42Kkm4jdEigFD
 tOfzLW5hIqEFr8LYiHyr6tn2ulEtqUsfNKdZ0yymEoWABSU/78835Yb3MmAjuubZLQai
 OinQn+/JTSsvF21qYGeZ28XTCmRIIhMBAM25gYXTep3eiTIjzIILOHOJwM1tcX4SiSga
 w8AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749877062; x=1750481862;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=N3q2qVFEmbLsR2HxaXqu+Z2ORgyuH1IAkMrz+Hg3+zQ=;
 b=m3aH7a4ueY8A3O+XI0aVFkj74dBzB/FedTr2m8SzG+R9jZxibauDM2qesyfqCD9PWs
 qbWNboGKYbHGNo9ffP5k1ShVX1V+NMxsgMKahSOE/fliGp8d3c07R5yCbyYP5ZAX7ndS
 iIcrTN3Xohl3r5SzlzH/G43k69BsKS7U+lBfEyaPTzkFspoDCSXk7O+TmiY6krwxbxpe
 Ec/aRPs8jyRgEGEguSlxhBY863WSrqEXHP8BgVvVKmpyTfbBnjY9c5pIxyu/DL4xg9E5
 qDcjOe8NpxI9KeKIl3M/wHHwTKpad4B78jQr07HrjmzFfg2EEgWO/VPd2C1a2HBEPEgW
 hYaw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5kkE03WzUddwrvUY132BdcXvadNrJxtMuiIPubjZGD0yafnc9ibb6CMM6ytf3mv0lTYp2OdHJmzY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyOSoYcu6WTnmKomFWulS4BEtJuU62Hcm5odSmopE3AM3ZYgvmw
 FKFtZRCXOPbVCHzx11MKz3nQoXRf9hiuNxU3vR/WOtcMlcLUYM76hMQt
X-Gm-Gg: ASbGncs0K+4+SBGvX3UAeAzO4Q2n169otGLSLtRLDHxnmer2CEmHvdFjeTb5IYLsWZm
 uaTGPIHOOfcncOHtwu5M1qhk5IPIO/oTNOMHxhDqJG8F6N1+sD4CGZlg7UN+sbNJC7n/ip6vvFC
 1tQ1Xxt3ucn1268X41pJPlpVafwH6USzehl+BeoXmJYgWVe0b7earZAmCg3b/XTy4kaEqHuar01
 KQzDlRcGT4kD85bPdxwdHkGVhBT6pHSAbxrpfMIa/TJbhCstusQMYka/GnWfSQBO2oOeuUmGZ/G
 0GjbvJjQEDJ/6u3hQ4SQknL7NwnNxBAj+7TMqJjskgjtxv+Z6BErlGdkBbanu1ISeinGZV5F5o6
 3
X-Google-Smtp-Source: AGHT+IEV9Mmky9tjHAWVSE87xT+lR7tm5Ix4w7VEXf3TOBtMRYoUueAgNI3kbcVipyWMqOI7pqqzZA==
X-Received: by 2002:a05:6902:1004:b0:e81:f2c1:60bb with SMTP id
 3f1490d57ef6-e822acc6e9emr2965920276.46.1749877061987; 
 Fri, 13 Jun 2025 21:57:41 -0700 (PDT)
Received: from trojai4.cs.purdue.edu ([128.210.0.165])
 by smtp.gmail.com with ESMTPSA id
 3f1490d57ef6-e820e315dc9sm1523330276.39.2025.06.13.21.57.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jun 2025 21:57:41 -0700 (PDT)
From: Alex Guo <alexguo1023@gmail.com>
To: deller@gmx.de
Cc: FlorianSchandinat@gmx.de, alexguo1023@gmail.com,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] fbdev: via: Fix potential divide by zero in get_var_refresh
Date: Sat, 14 Jun 2025 00:57:39 -0400
Message-Id: <20250614045739.3487259-1-alexguo1023@gmail.com>
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

Variable var->pixclock can be set by user. In case it equals to
zero, divide by zero would occur in get_var_refresh.
Similar crashes have happened in other fbdev drivers. We fix this
by checking whether 'pixclock' is zero.

Similar commit: commit 16844e58704 ("video: fbdev: tridentfb:
Error out if 'pixclock' equals zero")

Signed-off-by: Alex Guo <alexguo1023@gmail.com>
---
 drivers/video/fbdev/via/viafbdev.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/video/fbdev/via/viafbdev.c b/drivers/video/fbdev/via/viafbdev.c
index 6da5ae7d229a..5b58e93f8c28 100644
--- a/drivers/video/fbdev/via/viafbdev.c
+++ b/drivers/video/fbdev/via/viafbdev.c
@@ -179,6 +179,8 @@ static inline int get_var_refresh(struct fb_var_screeninfo *var)
 		+ var->hsync_len;
 	vtotal = var->upper_margin + var->yres + var->lower_margin
 		+ var->vsync_len;
+	if (!var->pixclock)
+		return -EINVAL;
 	return PICOS2KHZ(var->pixclock) * 1000 / (htotal * vtotal);
 }
 
-- 
2.34.1

