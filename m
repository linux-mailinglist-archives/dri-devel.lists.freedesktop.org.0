Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A80B1D30F
	for <lists+dri-devel@lfdr.de>; Thu,  7 Aug 2025 09:13:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7750C10E7E5;
	Thu,  7 Aug 2025 07:13:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TC7Se0rx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 606A010E28D
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Aug 2025 12:48:23 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-459d7726ee6so23250775e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Aug 2025 05:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754484502; x=1755089302; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=D53t7Gt4BgTj27r6S11MtMrbQ1+uu9jwiGO/fo4z3ao=;
 b=TC7Se0rxl73S9vW6yyPcUeDafA2PIQSmvmvdJ1+jQSb+xeOYIz+7OrQGeoDHDT/oxG
 IYvyOXQ/xpR2gWBcMUipce5QMheeHuENOCMCpXZpmL3kVwFJcOqM2YOqAAU7PWvpExGe
 ztxEFUpnbdadCwM+scD5kvKSP3vVxi3KYIp8n0/VSu6H8Q+WjRTLKh3e7KWPGq22E9WS
 OnfpM1Xsb//W4NjwJmQbbneiarV5lxJOvIBRoU0G7KJBd83qUbk9N/RlU+w8pZBE5r4N
 iD9aa/ta0OkTsEteIZfyhzfKPlqjjh7fY6Ezb5BsTQ5eEvEaUP5USTsU373ISsiuda33
 OBMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754484502; x=1755089302;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=D53t7Gt4BgTj27r6S11MtMrbQ1+uu9jwiGO/fo4z3ao=;
 b=lS9RRiHobVNrlSYmWcHUh/8JjNbxQxBxhffdYFphN+rMmzqsZzG26S0ENHM+f36Xf+
 8yXqYvRIevVY5JeWvAyqIMPe/0G09zmQ+F2GxDc2BKKnKp6RW9lskOvpY5etjultFXB3
 qGkfnKjkNxW5bBmADhLjsKs2elfZoBSkpsGd6YQFfgK5m3Jdai/KhvDyc1qrwDGEqeA3
 q166+CIUAdGQrrCk2KwmucSjcXhCDf4r6WNVZQSOj5JaFw5Q9eskYAvwTFgEpLh1CrDN
 vEu1iNR66a97kuEwoVVhWR8VaslmjhTCWIE0NyM1XZQvOqHoAAMo8PWmVYtRyHEREPod
 X+Sg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6VsLgVR/B42Qksf5Ly60/rbnntsLKTsQqm8TKhgRAPcJHWshiRUnvniqzxojChn3BfU6kh2YnowE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxUZJwpC21/f9uEhMGoAEhqg4wwCZn1De+1w6YEIuYYW0LWwuIW
 yrP8AxCj7GBEn/DZw+7Z5xPNmRgTj2zgIpQNFRLDDaoOaG+P8O083oG3
X-Gm-Gg: ASbGnctdoty94zciLNCMO2Lbng3NddCzoou2O9Sjv+4/Efm2TO7B3Idv/S0hO9mcxrl
 zTN4itW7mFRrraS1aaaYaDFWstN7TJKdRg9RspX8d2q8DTyz38tTBq/1HxJ2NlLyoqnYu9CBqYs
 YZC0/qQLOIeBEx+yIB/WjllNWDiL5Zzj9IaNwsCv5NF+BZ2cLgmSCCfuYMSeMfAytdGkJhnYS0j
 BtQHh0Q/IzRiew2ohxLmN7qq4yzDqJXbsGU+GEl5pH18yVxi7wQMF2MLgvZ9dgOtE4PGmEbVk6x
 NW1kks39EI2orjNZxw6gCBwjfQFHCUaqpZEyyIJzZ3vnfH/6knFpfY+8X1EnijRYNkGVY7bduZ8
 lI+CQY8riOIXda8quxrWKRg91Vh1NIPZxtu+NBuyJo0zXqlbSRotbs1LmXd4wu38/tQ0R1yu9uR
 w=
X-Google-Smtp-Source: AGHT+IEMGRZoqIzd1YpdMiOznQ3MbLmfPYCb+cml25DJJ2TOqFLSOHhSTx31kwUALgscCaGAHNC6BA==
X-Received: by 2002:a05:600c:4ec6:b0:456:29ae:3dbe with SMTP id
 5b1f17b1804b1-459e7103684mr22614175e9.24.1754484501337; 
 Wed, 06 Aug 2025 05:48:21 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([91.116.162.236])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458be70c5f7sm170110045e9.26.2025.08.06.05.48.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Aug 2025 05:48:21 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Subject: [PATCH 0/3] drm/sitronix/st7920: Add support for the ST7920 controller
Date: Wed, 06 Aug 2025 14:48:08 +0200
Message-Id: <20250806-st7920-v1-0-64ab5a34f9a0@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAhPk2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDCwMz3eISc0sjA91U88SkRGOjJOPEJDMloOKCotS0zAqwQdGxtbUAg49
 2xFgAAAA=
X-Change-ID: 20250806-st7920-e7aba32b3ab6
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Javier Martinez Canillas <javierm@redhat.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Iker Pedrosa <ikerpedrosam@gmail.com>
X-Mailer: b4 0.14.2
X-Mailman-Approved-At: Thu, 07 Aug 2025 07:13:37 +0000
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

This patch-series adds support for the Sitronix ST7920 controller, which
is a monochrome dot-matrix graphical LCD controller that has SPI and
parallel interfaces.

The st7920 driver only has support for SPI so displays using other
transport protocols are currently not supported.

* Patch #1 adds the driver.
* Patch #2 adds the DT binding schema.
* Patch #3 adds the MAINTAINERS information.

Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
Iker Pedrosa (3):
      drm: Add driver for Sitronix ST7920 LCD displays
      dt-bindings: display: sitronix,st7920: Add DT schema
      MAINTAINERS: Add entry for Sitronix ST7920 driver

 .../bindings/display/sitronix,st7920.yaml          |  55 ++
 MAINTAINERS                                        |   7 +
 drivers/gpu/drm/sitronix/Kconfig                   |  10 +
 drivers/gpu/drm/sitronix/Makefile                  |   1 +
 drivers/gpu/drm/sitronix/st7920.c                  | 869 +++++++++++++++++++++
 drivers/gpu/drm/sitronix/st7920.h                  |  55 ++
 6 files changed, 997 insertions(+)
---
base-commit: c571cb70e1ed43ee543c70151e61a001ab2eefa2
change-id: 20250806-st7920-e7aba32b3ab6

Best regards,
-- 
Iker Pedrosa <ikerpedrosam@gmail.com>

