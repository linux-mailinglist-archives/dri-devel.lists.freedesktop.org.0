Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E32A5509F
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 17:26:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C5BD10E2F1;
	Thu,  6 Mar 2025 16:25:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kLVts2fy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CADE10E29C
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Mar 2025 16:25:58 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id
 98e67ed59e1d1-2fe9759e5c1so1446452a91.0
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Mar 2025 08:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741278358; x=1741883158; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=v1Sq6955SeW7fXdSe6bezpmzNTL9tmkfZyPLC9/YdtI=;
 b=kLVts2fyCjPUNDAXouX2zNlgI0JUSDRjyZrt682j1zdV99WBfHvfhuMWNU48JOAX3u
 Wb/qVQe1y2F8AQFhBV5kylIGBorAWkTrseYUWPcO39LxpF+BhFjs61Vv7BDXmm0dwE6K
 DLsVk3DFAia2LlMUwC6+PxkAm31xVMcuiX0pQ7gh12kJ5KeoL6RYceixszixS9XhJgvc
 QUYsVa3EbQx7jtaGuQTvBEmbcc817wq9YM1fFARd5v3EZrxvjXTlO29CybQtsH1tLfon
 JvrfjLQgMnc1vtE83LDTi/XjyjUYzLtkJLPa+eGxeYqxQYMnxjIxHMwIjBxiQf4XXJL7
 9x4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741278358; x=1741883158;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=v1Sq6955SeW7fXdSe6bezpmzNTL9tmkfZyPLC9/YdtI=;
 b=DpyR2URzuW1suReAgYwBCxUNjnilkvXtpvlg5b/s0Xm6rN5nOnOPsX95xgf9MSIbV8
 PHZHD/QPzFh1VfMDnm9E+oSqeV/ietNkhOC2R3xpnYs/G0Q0WR4ruoVMAMwDCs9c4vTV
 yZlbBNdv4TZByI7zdERa+t9bN9762FZQEJzQuKX2zLUIPMqTamtxhi5ybZ17uyDCjW47
 DTAnDMokQcQbn4sOC+JzsE0gxf3yS1/rEp04FLuvXxbOK55H+KvAnDX6fQ3/GzbRPp3y
 cF75vDraepd9iV0agNB3p3YE1vgSLRo43Rb1OQShjp5ONJYwVkVKqI2PJCI5YaTbCybH
 WRfA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVN4MVctrP5E5THLmM7xkEmX1KHcz5hpVttjsSP7TmuqoUr48cjDRJDiRGS1/01ZGe78wrvfeRPd34=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwUqk5Bicr+tscDqNFIZRtpCQJUMs89j6sMBj8g4XiDtHnxh6E9
 e9BSIIsQbvLNRbjqJxRO7j1/KETLxQXNPQOLuzDMYglCkZWTZQBj
X-Gm-Gg: ASbGnctPLV/PUITrrR7theiiQ0f7/7rSYG/ZHqDsJD+efAjWNr1mxPczyROc0uonkIJ
 ZGc+MtKdYZ7TJ50AJ8qBaWXktzWySNui/Ggz6NG7oXriwIwP1YEwhPhTUrBepf/cZPpTm2xXTae
 K2OILFX9OdN9tryBFKS2xteBcWCg2UFq97APuzMv0Zkwt1aimyh8guNRcSyJCJKVihWsqQNk1uK
 vPboOJRGWdmCHPVGH4OLPTyMsgnt5hFlDOP0DTmBAuFLqYWnsdFsoDvDFFxR4Ga+uvt5AiP1Ur9
 RSDco/WvjaTqIig1SZ2QN+bfYz+G0xQw2mf6DxcTaVdb8Vz8k8yOl0cGvWD14Gw8y1uJNM2GsKo
 =
X-Google-Smtp-Source: AGHT+IHx/FA9q9VeYWlT31tM+odxs15FTKCjv2n+9fQOLwshtfFtm1FM7EynPDhqEgIZlabXqJLing==
X-Received: by 2002:a17:90b:2702:b0:2fe:99cf:f566 with SMTP id
 98e67ed59e1d1-2ff49775b54mr11884816a91.13.1741278357585; 
 Thu, 06 Mar 2025 08:25:57 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2ff693e75bfsm1464298a91.33.2025.03.06.08.25.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Mar 2025 08:25:56 -0800 (PST)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, jk@ozlabs.org, joel@jms.id.au,
 eajames@linux.ibm.com, andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 rfoss@kernel.org, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dmitry.torokhov@gmail.com, mchehab@kernel.org, awalls@md.metrocast.net,
 hverkuil@xs4all.nl, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, louis.peens@corigine.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 parthiban.veerasooran@microchip.com, arend.vanspriel@broadcom.com,
 johannes@sipsolutions.net, gregkh@linuxfoundation.org,
 jirislaby@kernel.org, yury.norov@gmail.com, akpm@linux-foundation.org
Cc: hpa@zytor.com, alistair@popple.id.au, linux@rasmusvillemoes.dk,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, kuba@kernel.org, linux-kernel@vger.kernel.org,
 linux-fsi@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 linux-input@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mtd@lists.infradead.org, oss-drivers@corigine.com,
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com,
 linux-serial@vger.kernel.org, bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw,
 Kuan-Wei Chiu <visitorckw@gmail.com>, Yu-Chun Lin <eleanor15x@gmail.com>
Subject: [PATCH v3 00/16] Introduce and use generic parity16/32/64 helper
Date: Fri,  7 Mar 2025 00:25:25 +0800
Message-Id: <20250306162541.2633025-1-visitorckw@gmail.com>
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

Several parts of the kernel contain redundant implementations of parity
calculations for 16/32/64-bit values. Introduces generic
parity16/32/64() helpers in bitops.h, providing a standardized
and optimized implementation. 

Subsequent patches refactor various kernel components to replace
open-coded parity calculations with the new helpers, reducing code
duplication and improving maintainability.

Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
In v3, I use parityXX() instead of the parity() macro since the
parity() macro may generate suboptimal code and requires special hacks
to make GCC happy. If anyone still prefers a single parity() macro,
please let me know.

Additionally, I changed parityXX() << y users to !!parityXX() << y
because, unlike C++, C does not guarantee that true casts to int as 1.

Changes in v3:
- Avoid using __builtin_parity.
- Change return type to bool.
- Drop parity() macro.
- Change parityXX() << y to !!parityXX() << y.


Changes in v2:
- Provide fallback functions for __builtin_parity() when the compiler
  decides not to inline it
- Use __builtin_parity() when no architecture-specific implementation
  is available
- Optimize for constant folding when val is a compile-time constant
- Add a generic parity() macro
- Drop the x86 bootflag conversion patch since it has been merged into
  the tip tree

v1: https://lore.kernel.org/lkml/20250223164217.2139331-1-visitorckw@gmail.com/
v2: https://lore.kernel.org/lkml/20250301142409.2513835-1-visitorckw@gmail.com/

Kuan-Wei Chiu (16):
  bitops: Change parity8() return type to bool
  bitops: Add parity16(), parity32(), and parity64() helpers
  media: media/test_drivers: Replace open-coded parity calculation with
    parity8()
  media: pci: cx18-av-vbi: Replace open-coded parity calculation with
    parity8()
  media: saa7115: Replace open-coded parity calculation with parity8()
  serial: max3100: Replace open-coded parity calculation with parity8()
  lib/bch: Replace open-coded parity calculation with parity32()
  Input: joystick - Replace open-coded parity calculation with
    parity32()
  net: ethernet: oa_tc6: Replace open-coded parity calculation with
    parity32()
  wifi: brcm80211: Replace open-coded parity calculation with parity32()
  drm/bridge: dw-hdmi: Replace open-coded parity calculation with
    parity32()
  mtd: ssfdc: Replace open-coded parity calculation with parity32()
  fsi: i2cr: Replace open-coded parity calculation with parity32()
  fsi: i2cr: Replace open-coded parity calculation with parity64()
  Input: joystick - Replace open-coded parity calculation with
    parity64()
  nfp: bpf: Replace open-coded parity calculation with parity64()

 drivers/fsi/fsi-master-i2cr.c                 | 18 ++-----
 .../drm/bridge/synopsys/dw-hdmi-ahb-audio.c   |  8 +--
 drivers/input/joystick/grip_mp.c              | 17 +-----
 drivers/input/joystick/sidewinder.c           | 24 ++-------
 drivers/media/i2c/saa7115.c                   | 12 +----
 drivers/media/pci/cx18/cx18-av-vbi.c          | 12 +----
 .../media/test-drivers/vivid/vivid-vbi-gen.c  |  8 +--
 drivers/mtd/ssfdc.c                           | 20 ++-----
 drivers/net/ethernet/netronome/nfp/nfp_asm.c  |  7 +--
 drivers/net/ethernet/oa_tc6.c                 | 19 ++-----
 .../broadcom/brcm80211/brcmsmac/dma.c         | 16 +-----
 drivers/tty/serial/max3100.c                  |  3 +-
 include/linux/bitops.h                        | 52 +++++++++++++++++--
 lib/bch.c                                     | 14 +----
 14 files changed, 77 insertions(+), 153 deletions(-)

-- 
2.34.1

