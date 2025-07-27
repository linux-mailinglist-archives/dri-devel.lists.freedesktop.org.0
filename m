Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B9CB130CD
	for <lists+dri-devel@lfdr.de>; Sun, 27 Jul 2025 18:59:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B924310E301;
	Sun, 27 Jul 2025 16:58:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jXlz7fuH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDBA010E301
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Jul 2025 16:58:54 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-3a6cdc27438so3530192f8f.2
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Jul 2025 09:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753635533; x=1754240333; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g/kiDzvyftKmlvmgmzp66NSmD4VUsIwsnBr5sA9+BR0=;
 b=jXlz7fuH3k1RVaQl1SViqbFzbQmPewf0vhZjMqTB0/l7zaioTDs803I947D9IG47Ef
 YQejKzx6P0Fx1V0PIECxTQsT4nGC6MsoqkvhEHW6M0d4mbhpz2P0bKFO5NI6IX6b1wQ8
 aXdoyJlwsd4bro9A9sZjGwqlfAqiCz1JcTBPGS5gz6ue7Rl2XZq862ZBDlGSrSRkD31P
 QkdIuRlxBUTyRb2z1KlhgVoNFXRZu68WcL3JFhMfivwlulpSsYOwpyyRAeL7qPa0tJHr
 3FWc3j50y4eN3mrMg5HdPIYv5dLt5/83AH824om1d2CZyffWoSKn/c6MVHab+vxtIAZ0
 Zeyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753635533; x=1754240333;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g/kiDzvyftKmlvmgmzp66NSmD4VUsIwsnBr5sA9+BR0=;
 b=FjMGmDeAKilxHmpInhziidzXWh2nOGFC9O5JAS23E5n+G0RVO2v7/7rjg6qt1x7CF+
 25n6gLpNLo+aOPjJFq9mgtw6MGkYPVux5cLxOvXexoKo3k8ipOirEmdmI30tKePogCOf
 g25kTZFAe2i/x6FHqUYt+tM3M/3hhddupcoYkGlN7xs4XB8m4BUyh53nkOSRMoOKn9oK
 a6ou1l7QXrynh0KtMeSCxFMQVn2T1tzNOloOzmXVVWULCd1bEkXXVGiUx66DBzQ+VwCN
 dnZ+t+IOyyKN02R4/ssRajrEp/1qto5bTJifeK/9RkmKvZrWkb5cGqoAjoUPyWfuriOq
 4+6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmf0DCu0bASc7Ll+kLPXpOcd60CjF3T42rudTVcX/aZxjupA4LrocG/37QTQnCqrzDpORnXpN3flY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxgIbow9CCs4Jf2IkgobBuGSNDGat/BzTiIn+GyDJzIX/Dz68Do
 b7jyoJwHYljfl2ROei8Dxoz9hm/bikd+iZKqpQQrCiQDzj7RjlU8ASo=
X-Gm-Gg: ASbGnctSVnEC2J3BL9FNDEjilA90s/vIM3EGzfOQHGit+KQ6t6IWBLR7Jw6B/anz3yf
 zZ8YLXJGyNUcsxRpICnWfbTirfuFzMXWJ90XC/pP13q3H/FSgBsv9lo0OdGrkWhV81aXu/H0Jbz
 LYjrKCReKwfdzhLWfQNaVP5J+2xk+brTlHpUYGETBBSry/GGqjQvOBuJIUG1lZy3JCWSH4S0lAd
 lJTTr3rUf6qNcKE5ByF4nOiWrRN46iVKJJWwGVt+NOhbekkt9A0itCk5RfQWQ5a/7MDPFJ1CWVT
 FxB1G9quQQdnm9a3USL6hvJ3sQjC5pq6WPyLL8pPWcOqdgBdZfiyswU6VwqlKsuFgi3G4pizCWh
 CQLwu5vKKQHfrqZnJtcP9Z2XuFixI+plxYkVLPW6In1mIWRgylPw=
X-Google-Smtp-Source: AGHT+IFiFy0HoTKPsyrRmMVqfpprnRKLceLvittEYYUCTh9qJMlSsXMVnmfCRpsXilM43NrYJk4XXg==
X-Received: by 2002:a5d:6609:0:b0:3b7:82d3:ff90 with SMTP id
 ffacd0b85a97d-3b782d400ccmr1869031f8f.15.1753635533074; 
 Sun, 27 Jul 2025 09:58:53 -0700 (PDT)
Received: from alex-x1e.localdomain ([84.226.118.249])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458704aaf20sm128545745e9.0.2025.07.27.09.58.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Jul 2025 09:58:52 -0700 (PDT)
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
Subject: [PATCH v1 2/3] dt-bindings: display: panel: samsung,
 atna40ct06: document ATNA40CT06
Date: Sun, 27 Jul 2025 18:50:25 +0200
Message-ID: <20250727165846.38186-3-alex.vinarskis@gmail.com>
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

The Samsung ATNA40CT06 panel is a 14" AMOLED eDP panel. It is
similar to the ATNA33XC20 except that it is larger and has a
different resolution. It is found in some arm64 laptops, eg.
Asus Zenbook A14 UX3407QA.

Raw panel edid:

00 ff ff ff ff ff ff 00 4c 83 0d 42 00 00 00 00
00 22 01 04 b5 1e 13 78 02 0c f1 ae 52 3c b9 23
0c 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 42 3c 80 a0 70 b0 24 40 30 20
88 00 2e bd 10 00 00 1b 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 fc
00 41 54 4e 41 34 30 43 54 30 36 2d 30 20 01 7d

70 20 79 02 00 20 00 0c 4c 83 00 0d 42 00 00 00
00 00 22 00 21 00 1d ca 0b 5e 07 80 07 b0 04 00
e1 fa 51 cb 13 b9 3d d2 0c 01 45 54 40 5e d0 60
18 10 23 78 26 00 09 07 06 03 00 00 00 50 00 00
22 00 14 8d 5a 02 85 7f 07 9f 00 2f 00 1f 00 af
04 23 00 07 00 07 00 81 00 0b e3 05 80 00 e6 06
05 01 74 60 02 2e 00 06 00 45 40 5e d0 60 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 b0 90

Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
---
 .../devicetree/bindings/display/panel/samsung,atna33xc20.yaml   | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml b/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml
index 5e2ce200025f..ccb574caed28 100644
--- a/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml
+++ b/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml
@@ -21,6 +21,8 @@ properties:
           - enum:
               # Samsung 13" 3K (2880×1920 pixels) eDP AMOLED panel
               - samsung,atna30dw01
+              # Samsung 14" FHD+ (1920x1200 pixels) eDP AMOLED panel
+              - samsung,atna40ct06
               # Samsung 14" WQXGA+ (2880x1800 pixels) eDP AMOLED panel
               - samsung,atna40cu11
               # Samsung 14" WQXGA+ (2880×1800 pixels) eDP AMOLED panel
-- 
2.48.1

