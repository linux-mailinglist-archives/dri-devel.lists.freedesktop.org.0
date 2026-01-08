Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35027D023B1
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 11:56:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DA8110E337;
	Thu,  8 Jan 2026 10:56:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GIdDMNjZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49A5A10E6D9
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 09:47:22 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-7aa9be9f03aso1893629b3a.2
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jan 2026 01:47:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767865642; x=1768470442; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qHueD//8AAJamdtTx3KncyHUFlVGKxTPD0kTSQsmSD0=;
 b=GIdDMNjZ+gPPaMEWiPoC5z0Vxq9Yo3IgXeAuVB4V2TGUyEfs0KfjvepZH9VXhu3WO4
 CL2ZOfqOlAUVNI68JDLqc1OBagUBl3r0zSoBxfotGXtjjv0YOJigr330a6kjK/939lgn
 cxNVCw1GDQEe8Zddxb1y2camldomeJdKtYvV3XztaVHdLVhdw7cg/5efNI55Bl+O+Z6x
 hLArAT0xp7caFQlBnmq6VNnzqiWGz+caqrV8CQEbEgSuToPQBcpMXNyJq2cYjylcCKyv
 4a9ney4dlixmj3Yr/Bns15nGonMYvUfOJ0+bo2xbKpgIzq9lI64NwzDRJyjOdV7iG1Nl
 8PKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767865642; x=1768470442;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qHueD//8AAJamdtTx3KncyHUFlVGKxTPD0kTSQsmSD0=;
 b=UaJR3AmgjjCZdGFHO9DF85jYmVTduh0t9WRwVsOxW96MsiRrYM90d9FlBBR7M05fhQ
 wlmz9XVjGiF49+6oUsyYgUWelyjzumI0lXzmXaATUmQRpJlVoGzK33EwbJ9b7Vb30dnI
 R6LIGdm1NmptZ2JBGIVBLY55i+5BdfLEe0OupFDikZ5JWcVT9A45+A9e57SYKLRmp7kg
 +r2am+YzMb7sag/CWw4RUfru4u/WtOraf1J/4PpmP2gEb8+H5kJoGWC5fYAS9JmFCusL
 udimVLPRTCyaiDTqwKjjQavufz5DsiNfR3f373FanJQ77pMkE/yahbmUvncR2Y3dTmO6
 aUCQ==
X-Gm-Message-State: AOJu0YzxT1Is5XA3teezUcZoUiM2gYZIii+K9Otx+7aSoSd4I9RtFPpy
 mpzk5GqhAhnjwdItj89AzYr4MzUdrIeghos77tak2IbG/uAO05YIPC3jkoNW3L0m
X-Gm-Gg: AY/fxX79pUdKv6nF3gAQiqKD9eShfGDuulxpfCXeLwvwbGoRy6bS/hge1aKPhYu3re6
 7XlMqlp96ylhNk5swCHbLkENH93huYHIJoQ3+gadbwDFlpJWDswiq7IEzrznqzewj1YvClU/p5S
 u1fJmQApI71vJ1q58pzctqNkxuKIJ2cIvtCVsm7ccsfSd0OAqfFh1U2CZK9SKIhdAEiAA+Su+g6
 GzD7bdyMU+ucB2eTa5oU8yhvGIAYzktz8eK6fnQyi9MdXqu6ZFpU6Jaqqj4vvv5l43lyM+XwiBF
 rL9fCStM/v+vSJZjQN81jj0maFR5uH0cx9gW8BVwSl2D01xHVyNOXksTKvE1yTtOo8UlxqCAS7a
 51LnC/1UJo5vCnxvgAOxV2AGdo89RtgWEsL9DfgLaHlVnISk+bE1OTYnlpnk2080fISkLEtaOhk
 KdhKGqq8mMYEp/BP0yrB479gQ3iLwGx8BzWZFc24yl6mTlQRfSNc+KChQwRUfXl2aonV+Otw==
X-Google-Smtp-Source: AGHT+IEbE+jBmq+j0BRN5nADLvU8jxL1ZMAc9aObMxYhpM+qu+5ZyALvccqrtar+8Lm5985P6axv3Q==
X-Received: by 2002:a05:6a20:9184:b0:34f:2f38:cad9 with SMTP id
 adf61e73a8af0-3898f976c60mr5324357637.53.1767865641705; 
 Thu, 08 Jan 2026 01:47:21 -0800 (PST)
Received: from localhost.localdomain ([2409:40e3:44:c9c0:8d34:cc3d:a8c9:1a48])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a3e3cc88c2sm73602135ad.79.2026.01.08.01.47.18
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 08 Jan 2026 01:47:20 -0800 (PST)
From: Chaitanya Mishra <chaitanyamishra.ai@gmail.com>
To: andy@kernel.org,
	gregkh@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 chaitanyamishra.ai@gmail.com
Subject: [PATCH] staging: fbtft: align tinylcd write_reg args
Date: Thu,  8 Jan 2026 15:17:09 +0530
Message-ID: <20260108094709.92561-1-chaitanyamishra.ai@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 08 Jan 2026 10:56:33 +0000
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

Checkpatch reports a misaligned continuation line in the

fb_tinylcd init_display() write_reg() gamma table. Align the

continuation line with the open parenthesis to match kernel style.

No functional change.

Signed-off-by: Chaitanya Mishra <chaitanyamishra.ai@gmail.com>
---
 drivers/staging/fbtft/fb_tinylcd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/fbtft/fb_tinylcd.c b/drivers/staging/fbtft/fb_tinylcd.c
index 9469248f2c50..60cda57bcb33 100644
--- a/drivers/staging/fbtft/fb_tinylcd.c
+++ b/drivers/staging/fbtft/fb_tinylcd.c
@@ -38,7 +38,7 @@ static int init_display(struct fbtft_par *par)
 	write_reg(par, 0xE5, 0x00);
 	write_reg(par, 0xF0, 0x36, 0xA5, 0x53);
 	write_reg(par, 0xE0, 0x00, 0x35, 0x33, 0x00, 0x00, 0x00,
-		       0x00, 0x35, 0x33, 0x00, 0x00, 0x00);
+		  0x00, 0x35, 0x33, 0x00, 0x00, 0x00);
 	write_reg(par, MIPI_DCS_SET_PIXEL_FORMAT, 0x55);
 	write_reg(par, MIPI_DCS_EXIT_SLEEP_MODE);
 	udelay(250);
-- 
2.50.1 (Apple Git-155)

