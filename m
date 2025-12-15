Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 915E7CBD402
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 10:48:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64AA310E039;
	Mon, 15 Dec 2025 09:47:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RPyJwmuO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14A6210E039
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 09:47:43 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-598efcf3a89so3112479e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 01:47:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765792062; x=1766396862; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tVpOQHvvv3K/ICVRbr+RowOMf/UbaFQPOMfQT7F9GV4=;
 b=RPyJwmuOvhgZ3uYsfkB9hoSCkIe2nwRfT32joCR8HN3XvBzXZ3JcoeLGDadyrtGos+
 k5MP/pqdq4NNn1tdckyeqRx0s+SE2db4lDMS1ILZDG5gCH8RgtUE6PXl9mHYPdOm0GHh
 dPvT4AAw1YaQTbRq343MEqqAc41pi0D+BXe4oEsOQifivuWxlPkXVSd7+NMHhvGCdFYY
 bigAQ2k3CugFabgw0YF04eG1WyK6UxR0Vy/9vF0UTJmPXfLrggbtS/m2saKoqWqhH5xw
 NESUOWLfSHZ3dcM/BRocP+UZLecRsB/KSVMANXOVk0zOWmNjYuV52q5XVOL7vV7gHrzR
 FXiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765792062; x=1766396862;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tVpOQHvvv3K/ICVRbr+RowOMf/UbaFQPOMfQT7F9GV4=;
 b=oIgpXxVgYJb17HWqNk69856AOrLj+3rWWoXElGqn4aHepojf5oJEvQlyx2JYzyO7pl
 ca2E2IjYgtmM8VwRUc9uPDTa9gX38jM21+8zaPBAVAhkuf+VvhiL2SqEQpWeCJSKowim
 1kTP5nf/pUR2GTx1HsXX7nkttb7b46BcXvrgHgyaaHrn65/28TGlruCODvF1zoZ4zVQ/
 w7v3Iatx7yUA6i+jsc04EQAoLfEH664f3aeyEhr2KooG6jkygEuuQpKjsRv3Id+OGRQ/
 nRWGxdDcJbChFwOJToMTUtR0vDKwJU1C+mn6buzbthEFjaJ3wautRcI5Dw9nS+HPiCFi
 lJZQ==
X-Gm-Message-State: AOJu0Ywzm+LvnagZyUB/5ezFtkSVjC2RVv6mo6t6ettwsNYHPW7Ip6tF
 QGfXFlZlNXeZ6h2xUS5aBUdDAE0kb7PDcs9fHwEhwqgA1dnQeHouEXlD
X-Gm-Gg: AY/fxX4xMWML1DprI690JHtg+HpzoLgYsr3BE/jMp3JDw2CdZtpVrFixpwkom31yUkz
 ehCpaT7kfMEAL/a0cWoGh7r+Yquf3kOCw1ptiDsEev4nnA9pDGsHUFMSneg9O5qi+alciqZyJcy
 rAuz9sqTLSSmr2dEURKtQymmmEvB+2SYdp+F58DmPprHy41xUNB5ChziFq/A6D0Yo7L6hyAkvzR
 j8LJG5njvvwf0KCtvHgtpBt3A6iiJC61PGvEMGjlPmn77FRU9sU2/U4UdGm24Ws+4xgV408Z3mK
 JlPKbXmAxWLRs3UVncZaHfJBcj9mpTeLtlV1Y0PJPUfFqNe7uQFxHKvodG5LfAN8smNKVXPWiml
 K8GzfmVzH6tlWsd3jCKD1Ol9TkFYrUzsrSBS9IAGxEkObGqUNg9yjGGShl7dP7d05prI7TqL3vj
 We2N/TBnc4qiiJpkyI0Vf5HyZBwaRBoWJvy7FLauBVW0KwW/T4XMGZTIjZ
X-Google-Smtp-Source: AGHT+IHoPZVnm9BbXcgInP2ilGSzLiPiaclXBBpn9sYk9dbDCEc44kZPqVVYud9+2sVsXAttyWunMA==
X-Received: by 2002:a05:6512:1154:b0:598:8f91:a03e with SMTP id
 2adb3069b0e04-598faa9a579mr3684964e87.50.1765792061998; 
 Mon, 15 Dec 2025 01:47:41 -0800 (PST)
Received: from [192.168.1.168] (83-233-6-197.cust.bredband2.com.
 [83.233.6.197]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-598f2f37ae8sm5397546e87.15.2025.12.15.01.47.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Dec 2025 01:47:41 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Subject: [PATCH v3 0/7] drm/sitronix/st7571: split up driver to support
 both I2C and SPI
Date: Mon, 15 Dec 2025 10:46:42 +0100
Message-Id: <20251215-st7571-split-v3-0-d5f3205c3138@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAALZP2kC/3XMywqDMBCF4VeRWTdlMlGjrvoepQsvUQe8kUhoE
 d+90ZUUujwHvn8DZywbB0W0gTWeHc9TGOoWQd2XU2cEN2EDISUSKRZu1YmWwi0Dr6LWKq4wlZi
 WMQSyWNPy+8w9X2H37NbZfs66l8f7J+SlQNEozKnKM6mwfXRjycO9nkc4Qp6uWP9gCjhTCbUV6
 awhecX7vn8BvYGANuUAAAA=
X-Change-ID: 20251024-st7571-split-c734b06106a4
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2062;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=W8UkbOAiAE9bqzVX8Qv9TxY5BA/gH8P0iaLknphwwlM=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBpP9kXqsDsKrB5XoyS4zF7twRJHLomiAKaEXtkA
 HdAZR7UbJWJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaT/ZFwAKCRCIgE5vWV1S
 MuS/D/9akjh2+4q6Cm56D/b1gZ/YczdpAaSTMkyr655bVSWCmc3ash9RJ+xJXil/9mjTOFyQMa2
 5goIOE7TinPim6MmXS18Euk3PHQMucxpDP2JTJabRmRCjirRnUbxwVIwtwPNQMN4ciAkz0bx4a3
 cZE6+6PnbfSwugFrLOlS/2+mrJK8P82+7vjBzwbkqZ1GCvbg5xJS3IgAkkAAgwXxYOoysOAObhb
 inaflnBUEGdqvaEW2m4/5hxqmd29eL3AiaixG+/YLZB0YdxdWZk/7irecbc8tBSvQvRYitgUQNQ
 UUkPexIc/jVx69v0/IXmLdW40yc0ZuXGY8aXaIfijSvf8jI1xK/XaWth31x9fqTAU3Imv54VzR2
 7vlzvaHmNakQ3Z2VDBVDfgI5OdArX0biKHBNzlxTRZwu9IQYnF2/0b0fM7xwlGBFhExWNjYW3vy
 05il9zG87hyex5McRP+/txkHIR4tT4NOUekOO5fxmxGccxr4oVz9z0W4cCZvMWekhimAhNsU7vD
 63VY6lZcwz9RQ9Z96aaGvcuBrYxSp6kmGJ6QQ2NGQewt9dkX9DiC5x3KV4dK/1H2esHX7K4IVp6
 CJvx955eDjcrvRmlYD8k3Htx9J8t2P7/MMbNMBZyjRzl8TlJY4P7PT7nyKVALEl6Rncsg0Wkz03
 u8N+nmHOzAE3RQQ==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
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

This series splits up the driver and finally implements
support for ST7571/ST7561 connected to a SPI bus.

I've not tested the SPI interface myself as I lack HW, but the
implementation should be okay from what I've read in the datasheet.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
Changes in v3:
- Add SPI example to the bindings doc (Thanks Javier)
- Select REGMAP rather than REGMAP_I2C (Thanks Javier)
- Fix gramatical errors in patch description (Thanks Javier)
- Link to v2: https://lore.kernel.org/r/20251027-st7571-split-v2-0-8352fb278d21@gmail.com

Changes in v2:
- Add MODULE_IMPORT_NS to st7571-i2c.c st7571-spi.c (Kernel test robot)
- Link to v1: https://lore.kernel.org/r/20251024-st7571-split-v1-0-d3092b98130f@gmail.com

---
Marcus Folkesson (7):
      drm/sitronix/st7571-i2c: rename 'struct drm_device' in st7571_device
      drm/sitronix/st7571-i2c: add 'struct device' to st7571_device
      drm/sitronix/st7571-i2c: move common structures to st7571.h
      drm/sitronix/st7571-i2c: make probe independent of hw interface
      drm/sitronix/st7571: split up the driver into a common and an i2c part
      drm/sitronix/st7571-spi: add support for SPI interface
      dt-bindings: display: sitronix,st7571: add example for SPI

 .../bindings/display/sitronix,st7571.yaml          |   25 +
 MAINTAINERS                                        |    3 +
 drivers/gpu/drm/sitronix/Kconfig                   |   38 +-
 drivers/gpu/drm/sitronix/Makefile                  |    2 +
 drivers/gpu/drm/sitronix/st7571-i2c.c              | 1003 +-------------------
 drivers/gpu/drm/sitronix/st7571-spi.c              |   76 ++
 drivers/gpu/drm/sitronix/st7571.c                  |  918 ++++++++++++++++++
 drivers/gpu/drm/sitronix/st7571.h                  |   91 ++
 8 files changed, 1187 insertions(+), 969 deletions(-)
---
base-commit: 6a7cef9f953e9edb2364edb769ac116126e6b98e
change-id: 20251024-st7571-split-c734b06106a4

Best regards,
-- 
Marcus Folkesson <marcus.folkesson@gmail.com>

