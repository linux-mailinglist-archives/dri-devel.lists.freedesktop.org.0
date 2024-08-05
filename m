Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 748159485B4
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2024 00:59:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6572010E0E0;
	Mon,  5 Aug 2024 22:59:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="E1OrAtrZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com
 [209.85.128.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A492810E0E0
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2024 22:59:03 +0000 (UTC)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-66a048806e6so1034667b3.3
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Aug 2024 15:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722898742; x=1723503542; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZsX0vPn3VODiXEEmMvN5E790VYxq/T9uwkFRTYpicVI=;
 b=E1OrAtrZAp+T9my11tP3Wxl+puhhoHS5NJWPIpmEHJsBCfgw743i4gK4cV8UNpS4l5
 jmNFjxhDQRY3F3T5TTPcF5KsgXqycOJyjRiJM/J3xiNJ5KooMcNr77BQXnsIidOII8DP
 YQkjfi9Qkdfs1x7hXfKAxgrTblm5V7DCdH9kRaLdwX3IoCsPevQxYxvcnUCpUQlu3H68
 /Wyruj2hdP+XJoL4/gBQBnSZ+ut/bH4Si+lk/D5J8UYlb/guCgJwujo2Q+NbrXVcu2j3
 FBnW5Szc+PcbMNPpiO9K27NK4h78gXvEQdwdu9DZgnm0UGxj7nLa1rRoS6ugZDi7Pxpz
 5BsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722898742; x=1723503542;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZsX0vPn3VODiXEEmMvN5E790VYxq/T9uwkFRTYpicVI=;
 b=C9c0Ev7XdRhrTwfP38bsSm+HkegLKhv2/ndFVIHSoz2gB54L+0nMGM9jPvS2yd3M+H
 2U4DdNRgTl2JvmPXzeKAOrS313EPUCNffIMl4MQxGa1IZzBLLhZsr/9T2b1r0/GUOC/n
 2fos1up0Hn0CyGY2+xEgUuDqz6N4vbH5l7HLeNLXNWcP96PiSMxKO7fXbsThcUXX2aFF
 9zWfYwyy6R+5pXkJnMsWSGYnRRSiRwKe0WIBI2IUwzTnr5Ekb2B4c1aJ9k4AgA+yOp9m
 Z5b7eIraXrxOQC33DA4eT0hIbYw6PnMPoXfiMcZLUkmAyq68cfXyNqtC5j2EL1Ez9eGj
 LNiA==
X-Gm-Message-State: AOJu0YyFws8tUuVRNBrRpWEdRuVzAlzF+5b/NodPqbMsbgbEv8zeL34a
 +MV//NlRcnmLKIQJmeuwhfHVvDbw11C8ekgY0/BQwqyGGIhuoW8A
X-Google-Smtp-Source: AGHT+IGy/Om6ctOSzeiK84WCNRq/re9u8Dd9Ybzu5JIMD5CNiQ98Qwg8YKY2V+kt5KaTtEfnqq4gtw==
X-Received: by 2002:a81:b407:0:b0:649:b0ca:2c9b with SMTP id
 00721157ae682-68964584b14mr154483367b3.40.1722898742435; 
 Mon, 05 Aug 2024 15:59:02 -0700 (PDT)
Received: from localhost.localdomain (ool-1826d901.dyn.optonline.net.
 [24.38.217.1]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6bb9c78ad54sm40028016d6.31.2024.08.05.15.59.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Aug 2024 15:59:01 -0700 (PDT)
From: Alex Lanzano <lanzano.alex@gmail.com>
To: christophe.jaillet@wanadoo.fr, Alex Lanzano <lanzano.alex@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Mehdi Djait <mehdi.djait@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/2] Add driver for Sharp Memory LCD
Date: Mon,  5 Aug 2024 18:57:49 -0400
Message-ID: <20240805225820.13798-2-lanzano.alex@gmail.com>
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
Changes in v4:
- Remove redundant dev_err

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
 drivers/gpu/drm/tiny/sharp-memory.c           | 682 ++++++++++++++++++
 5 files changed, 801 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/sharp,ls010b7dh04.yaml
 create mode 100644 drivers/gpu/drm/tiny/sharp-memory.c

-- 
2.45.2

