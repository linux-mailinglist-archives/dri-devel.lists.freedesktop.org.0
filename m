Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B4893EAA5
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2024 03:44:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA7D910E0F4;
	Mon, 29 Jul 2024 01:44:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Zd3r79pM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6077B10E0F4
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2024 01:44:05 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id
 d75a77b69052e-44ff6dd158cso17599741cf.3
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jul 2024 18:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722217444; x=1722822244; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wuth67ftmePdj07hmFU5SpHSfVn1GlIZOSwGwoav3KI=;
 b=Zd3r79pMobwwLSp5V1dpv6YbtcC8CckYSj6p1lOadiVmbg8L2GtKN5xclBz3Eib6Ww
 YWK5briW7ccMWvGPSzF+axuNHAtn+KiLE2x1gbpJFdWorUmTo+3wmoi6SrqF/0nsKPrU
 8wpHD2/5oKSaPdF7MdnWdyZK5rfFseKSvHJuCCTx90puUfMVB0jSGFbscEqax6KXogOX
 izOeogkUvY7sA4Mo7msvbfEOmd6CmjPJSedlM7p160L/PJ/S5Sj2nkGCSpAxNTyK7jCY
 qgfkom+f6dvxm3s9AJYS+d5NwUdhH/Chqwn3vK1jRC7TwYOjsv1IIDrMYORlrTQP1+gy
 qkpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722217444; x=1722822244;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wuth67ftmePdj07hmFU5SpHSfVn1GlIZOSwGwoav3KI=;
 b=KO7R4o4hzyQ0aC4Hlui1NN3eq5paZ1Ht6GETJ1ypbK/pIl/NwP+4l2khPqbbRmhfpF
 exnqopJ5xgHxfqt9TuMdoyCPdIDa6a4n9Go24VXlGZbaY6vwFmuEoYli6XknS34SDPHi
 0tQpa5Gyha+BxCz5tWvj+thpVN7pdvfpjV7grGbWgtJbJBfEEeMmM2pjwBxTTaP1XWhK
 FRDAriuTt7ejiXftT/3z1ITIJWUPevFboAtS4pQkn609aUALTnvkdOSYZZMRMg9TU8r5
 fqSysQsmaNoH7Xz75Ycy1zJiTHpYph1pc74MWWeFBIBbzC3vGbnmX/cCWFkS8aEPjVqc
 U+8g==
X-Gm-Message-State: AOJu0Yy2Aqgl9boHqhaEodA0OkrecFACqE+Ghct9If4769mliryjRj2I
 UKUuYn2q7TwqEfANWmSvkk4NReM9C9vCIeDoqwSV9V5fxB4id8hi
X-Google-Smtp-Source: AGHT+IFHl3+hOoC1WMdUWwOo9snFlWAX46otYQMaNmsyv3yiTJmX+D0F8IHpfFxZOjYQecFKUmincw==
X-Received: by 2002:ac8:7f14:0:b0:440:6345:257f with SMTP id
 d75a77b69052e-45004f5e77amr99749301cf.60.1722217444077; 
 Sun, 28 Jul 2024 18:44:04 -0700 (PDT)
Received: from localhost.localdomain (ool-1826d901.dyn.optonline.net.
 [24.38.217.1]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-44fe8199a6fsm37191171cf.58.2024.07.28.18.44.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Jul 2024 18:44:03 -0700 (PDT)
From: Alex Lanzano <lanzano.alex@gmail.com>
To: christophe.jaillet@wanadoo.fr, Alex Lanzano <lanzano.alex@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Mehdi Djait <mehdi.djait@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] Add driver for Sharp Memory LCD
Date: Sun, 28 Jul 2024 21:42:40 -0400
Message-ID: <20240729014311.1746371-1-lanzano.alex@gmail.com>
X-Mailer: git-send-email 2.45.2
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

This patch series add support for the monochrome Sharp Memory LCD
panels. This series is based off of the work done by Mehdi Djait.

References:
https://lore.kernel.org/dri-devel/71a9dbf4609dbba46026a31f60261830163a0b99.1701267411.git.mehdi.djait@bootlin.com/
https://www.sharpsde.com/fileadmin/products/Displays/2016_SDE_App_Note_for_Memory_LCD_programming_V1.3.pdf

Co-developed-by: Mehdi Djait <mehdi.djait@bootlin.com>
Signed-off-by: Mehdi Djait <mehdi.djait@bootlin.com>
Signed-off-by: Alex Lanzano <lanzano.alex@gmail.com>
---
Changes in v3:
- Fix file path in MAINTAINERS file
- Address review comments
- Simplify mode selection based on match data instead of model

Changes in v2:
- Credited Mehdi Djait in commit messages
- Renamed sharp,sharp-memory.yaml to sharp,ls010b7dh04.yaml
- Using strings instead of int for vcom-mode in dt-binding
- Fixed indentation of binding example
- Removed binding header
- Removed extra whitespace in sharp-memory.c
- Fixed error handling in sharp-memory.c
- Added match data to of_device_id table to be in-sync with spi_device_id table
- Replaced redundant function with spi_get_device_match_data
- Sorted header files in sharp-memory.c
---

Alex Lanzano (2):
  dt-bindings: display: Add Sharp Memory LCD bindings
  drm/tiny: Add driver for Sharp Memory LCD

 .../bindings/display/sharp,ls010b7dh04.yaml   |  92 +++
 MAINTAINERS                                   |   6 +
 drivers/gpu/drm/tiny/Kconfig                  |  20 +
 drivers/gpu/drm/tiny/Makefile                 |   1 +
 drivers/gpu/drm/tiny/sharp-memory.c           | 684 ++++++++++++++++++
 5 files changed, 803 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/sharp,ls010b7dh04.yaml
 create mode 100644 drivers/gpu/drm/tiny/sharp-memory.c

-- 
2.45.2

