Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 798A697B9C5
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2024 11:03:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4F6110E56E;
	Wed, 18 Sep 2024 09:03:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MwXPvpqO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DF0D10E56F
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2024 09:03:14 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-2053616fa36so80062315ad.0
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2024 02:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726650194; x=1727254994; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BtpllJHNUz1+PFWJNLO9JzEhzmqZygXKijwiaiZ1tHY=;
 b=MwXPvpqOFgDjyWsnuN6gd3lUBahhGrglzJvasBj4w9/5C356ABeB6fCo60U7JNumNw
 OsL36YKmNMtCUe0w3Ja9CPU+AgIyKPOOuvpG9VUG872U8E3vKGdMx0+Xop89lYg7ifz9
 H8DA4rz+plj32Z+yDeJOMVh3C+dVw22q51OBa3Vxi3F0B95blUMLJAa9BIySR/6KWfbW
 Xxzqu3UEyi6ahlZLM9xnWD74r4oUUeEqxtI3/ro08GBsfZmFf8IMMWL7DDNvTFhDWB4F
 odk3LNmZeKxmqu/LrtutStWAs9apjoSjPsIlXuodZfhFywBTEjilQOajRp0NILybZc5F
 1PTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726650194; x=1727254994;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BtpllJHNUz1+PFWJNLO9JzEhzmqZygXKijwiaiZ1tHY=;
 b=H7+oSqmAIeTNNGte3Zpho/6BWESn1lWTFWUxNwYGm4QDqtGkfbjansszZminWszeij
 V44iXKNYmbktrqzYdKHWp5s51pjw6/XqUdoBgazrTlUDK62jViSEp5ezaLHsJwAKLajp
 HAEo7fnEFnp6+r6johv6AZwVWOa5m1U2n24u44AV05kSJwg0FllzCSBkQvuicrrcTrP0
 XtMJ+da6DJA0AVe60y4uRAVHVe9iQ0CNeLyNPuGY1XltxDIHHIfFcvgF+B5Fhi+pdGnF
 ehRBwicmvJa3Xa2m7XVynR0sC4PordDYoSPe5FxAPPxQ1M9tbsgair2sY6/mJ0E5QBSz
 uXFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZwNgPTLQdK4zLBE8m18oUnBQwTmFUb1kTW8HquZC/U4cvg7uZ2abm801hNJxVPIv1Fm5p9bMDYGo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzeo8KtdWMXiJrkK4kMaeHDNQYZ1DX+siOD73aN1BLG7a71KsPT
 s0fWZUOqUDVqI11pyEbmZh40LSyl3ebVrHRJ+oqTnvfYg7But/F6
X-Google-Smtp-Source: AGHT+IEgKeGF0I2bdpp/cgx+mruhYWLhI+QOokE5lajRXPVK3arbWkJ4oOi07uUO/2JQxL6qVPiYpQ==
X-Received: by 2002:a17:902:e812:b0:206:c75a:29d9 with SMTP id
 d9443c01a7336-2076e3eb0cbmr345072275ad.42.1726650193788; 
 Wed, 18 Sep 2024 02:03:13 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net.
 [60.250.196.139]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-207946010f9sm61021875ad.84.2024.09.18.02.03.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Sep 2024 02:03:13 -0700 (PDT)
From: Hui-Ping Chen <hpchen0nvt@gmail.com>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 sumit.semwal@linaro.org, christian.koenig@amd.com, esben@geanix.com
Cc: linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Hui-Ping Chen <hpchen0nvt@gmail.com>
Subject: [PATCH v4 0/2] Add support for nuvoton ma35 nand controller
Date: Wed, 18 Sep 2024 09:03:06 +0000
Message-Id: <20240918090308.292617-1-hpchen0nvt@gmail.com>
X-Mailer: git-send-email 2.25.1
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

This patch series adds the mtd nand driver for the nuvoton ma35 ARMv8 SoC.
It includes DT binding documentation and the ma35 mtd nand driver.

v4:
  - Update nuvoton,ma35d1-nand.yaml
    - rename 'nuvoton,ma35d1-nand' to 'nuvoton,ma35d1-nand-controller'.
  - Update ma35d1 mtd nand driver
    - Rewrite the NAND driver using the exec_op API.

v3:
  - Update ma35d1 mtd nand driver
    - Release IRQ handler.
    - Remove unused functions.
    - Remove '.owner'.

v2:
  - Update nuvoton,ma35d1-nand.yaml
    - Adjust the order and remove any unnecessary items.
    - Add 'nand-ecc-step-size' and 'nand-ecc-strength' to the required list.
  - Update ma35d1 mtd nand driver
    - Fix coding style.
    - Use 'devm_clk_get' instead of 'of_clk_get'.
    - Use 'dev_err_probe' instead of 'dev_err'.
    - Remove 'pr_info' and 'of_match_ptr'.
    - Remove 'module_init' and 'module_exit'.


Hui-Ping Chen (2):
  dt-bindings: mtd: nuvoton,ma35d1-nand: add new bindings
  mtd: rawnand: nuvoton: add new driver for the Nuvoton MA35 SoC

 .../bindings/mtd/nuvoton,ma35d1-nand.yaml     |  93 ++
 drivers/mtd/nand/raw/Kconfig                  |   8 +
 drivers/mtd/nand/raw/Makefile                 |   1 +
 drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c    | 935 ++++++++++++++++++
 4 files changed, 1037 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/nuvoton,ma35d1-nand.yaml
 create mode 100644 drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c

-- 
2.25.1

