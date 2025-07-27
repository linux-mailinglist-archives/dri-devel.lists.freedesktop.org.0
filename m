Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0667B130CB
	for <lists+dri-devel@lfdr.de>; Sun, 27 Jul 2025 18:58:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C099910E307;
	Sun, 27 Jul 2025 16:58:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bpV5tXYC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D0F110E301
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Jul 2025 16:58:54 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4563cfac2d2so39621475e9.3
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Jul 2025 09:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753635533; x=1754240333; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OSNmwFYper35EjFwmUUh2UbfVWPJvEUcZ2PjzDYJk18=;
 b=bpV5tXYC7vo8rwrCAcdUpMOGJgpCkyGIcESE44cSq9pVVVX8S5nuvp7pp5AcmUNcAd
 X2zZNtkJp/u6p/FBVinyfha4hLkOOX+1ShOGgz8i05hYKlQqE3CyfckzwOUKk43l/d2l
 /jyVSyV0Nv+I5b0UklAaOHwNxZ9+cIrfucVyrtyLYspQzQ6N9mnRSqkfFWg3vTnqEzvY
 0H1uKjXpoe5WI+FP0JlYyySBUPsmeA6YY8/pPm1XyiQ0iHDpaF46j8i2mXfAIG+mbleW
 7deNU3soUSZ94TKao2L6hL/emt2aBYO7+WIRu+wsLXtaeFk9h5w9r5qPQEULOZ05Tqd2
 pocQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753635533; x=1754240333;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OSNmwFYper35EjFwmUUh2UbfVWPJvEUcZ2PjzDYJk18=;
 b=VEyqNiy9dMD+KrwyCo8W/5TLTQyxRudLDH6+7PgG6eWqtKCfARBHEEVigog9La7xjX
 hgvuczgeuxEGovdcs2zDUyn9I8eTrK1javgadbqA2qthYzAU+oMai6YcpNu2ksyVgS/c
 5A59oTTHiNBXlT2lqZ/pHP8mtoSMGuky9DOnv1Ofk8BGxcpajfnXmAVt0Ye+q4qaIT4F
 8Uw1kc4TYL4j7tc2JMYYK6gpJO4eZPJMuuCPe7YaX1XdoB2kpG7I6i+136QUumCf0gN2
 9U6rx/1v0PDcE/MkT6c4LVYSMmrFyZwvW6OIri6VK5glv8j6MDQUnCNSiVJMf+rHn27r
 iUuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlsdj7DN+dT2f0ABnW82+uN3R5Lo6M9hulrO8g0CSAoJeNRwYUk9zmmLqaNzJlwNgmIrZ+gsODovc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxLrMVNuyOU0dU+fYC6Fgvz9iIjg6fKqHLwjeqWLZvq24N1aPtQ
 9jcDj2f53PL/NubMSkMofjdbLZ4TAz3UJjUbcmjWb5aAwWKR3MkNcaQ=
X-Gm-Gg: ASbGnct+OnaYauR53ij/uEDzPiN/PN05Wcd0fgtUn3UqKX+gX9AqUAClagCGMSTJ0HP
 iJmzycMbYT+iCONteUpdL/ebAxKm2kCdrUP58QqWmdslJDwUu3A1oiEyY+VDs5Mi/e35FeWTJkx
 +7RC3B4lRYRvRUh05sG40BHS/VerJ1T5ezqRupuh1LnpcqefxIrjXB1kVDu+HSH3b4oyOzzVrp5
 iL7OeXI0AVoSrOJnoXKSj0QavoULZZl017+xGqBod598MgI0g8LKGP2kJSL9RMsDzcQLsXSIgSq
 Hzva9SbI2W7A8IUKH8ifkpQTIslDXsTt4QIjsd1wWKoyaeTwAlT890AcO15choE1jMwkVbQxLy6
 xY9cxzQi+68kEmGzJdFfs7nFpXHBr3qLLuFd5dklS
X-Google-Smtp-Source: AGHT+IFikEiKDy+6gL3L5K9C6PuqVBZ9IqjJUfuTz+zzyU0E6yfyNyRSgG35GbsusVUWoP9az6O5Nw==
X-Received: by 2002:a05:600c:6995:b0:456:dc0:7d4e with SMTP id
 5b1f17b1804b1-4587ff28b4fmr34996805e9.18.1753635532248; 
 Sun, 27 Jul 2025 09:58:52 -0700 (PDT)
Received: from alex-x1e.localdomain ([84.226.118.249])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458704aaf20sm128545745e9.0.2025.07.27.09.58.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Jul 2025 09:58:51 -0700 (PDT)
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
To: Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Subject: [PATCH v1 1/3] dt-bindings: display: panel: samsung,
 atna40cu11: document ATNA40CU11
Date: Sun, 27 Jul 2025 18:50:24 +0200
Message-ID: <20250727165846.38186-2-alex.vinarskis@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250727165846.38186-1-alex.vinarskis@gmail.com>
References: <20250727165846.38186-1-alex.vinarskis@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

The Samsung ATNA40CU11 panel is a 14" AMOLED eDP panel. It is
similar to the ATNA33XC20 except that it is larger and has a
different resolution. It is found in some arm64 laptops, eg.
Asus Zenbook A14 UX3407RA.

Raw panel edid:

00 ff ff ff ff ff ff 00 4c 83 9d 41 00 00 00 00
00 20 01 04 b5 1e 13 78 03 cf d1 ae 51 3e b6 23
0b 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 cb fe 40 64 b0 08 38 77 20 08
88 00 2e bd 10 00 00 1b 00 00 00 fd 00 30 78 da
da 42 01 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 fe
00 41 54 4e 41 34 30 43 55 31 31 2d 30 20 01 2a

70 20 79 02 00 20 00 0c 4c 83 00 9d 41 00 00 00
00 00 20 00 21 00 1d b8 0b 6c 07 40 0b 08 07 00
ee ea 50 ec d3 b6 3d 42 0b 01 45 54 40 5e d0 60
18 10 23 78 26 00 09 07 06 03 00 00 00 50 00 00
22 00 14 e7 f3 09 85 3f 0b 63 00 1f 00 07 00 07
07 17 00 07 00 07 00 81 00 1f 73 1a 00 00 03 03
30 78 00 a0 74 02 60 02 78 00 00 00 00 8d e3 05
80 00 e6 06 05 01 74 60 02 00 00 00 00 00 91 90

Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
---
 .../devicetree/bindings/display/panel/samsung,atna33xc20.yaml   | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml b/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml
index e36659340ef3..5e2ce200025f 100644
--- a/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml
+++ b/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml
@@ -21,6 +21,8 @@ properties:
           - enum:
               # Samsung 13" 3K (2880×1920 pixels) eDP AMOLED panel
               - samsung,atna30dw01
+              # Samsung 14" WQXGA+ (2880x1800 pixels) eDP AMOLED panel
+              - samsung,atna40cu11
               # Samsung 14" WQXGA+ (2880×1800 pixels) eDP AMOLED panel
               - samsung,atna40yk20
               # Samsung 14.5" WQXGA+ (2880x1800 pixels) eDP AMOLED panel
-- 
2.48.1

