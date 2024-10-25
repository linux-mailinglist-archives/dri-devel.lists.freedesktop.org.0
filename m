Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 132EA9B0AB3
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 19:16:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 255CB10E3F1;
	Fri, 25 Oct 2024 17:16:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="LtX80gOI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB2C610E3ED
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 17:16:02 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-37ed3bd6114so1362744f8f.2
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 10:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1729876561; x=1730481361;
 darn=lists.freedesktop.org; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=D8BkQHxl/jl98jZceXhfQCyyW7/L0TBeWdJpzjggPMw=;
 b=LtX80gOIeHgAy1Q3Tfore0X+P7vtK4ArAO0kkwI/+HT/TGorIw/YTvTBpFbRkJvrXz
 4lrsMlsC2vlMppF/Oov6G7+C95W56US6ARDMKGxsNh/hnmCEQT6lTdfmru0xd4gCuP7C
 tAZu+ksaxkcm8aSptgV9BXt6WIUYdHajzrhoZEB34HT71rr79LG9C6qtJcV6YFouZwrm
 jtAa52ZnnRUIsoGc1btpOeOWsdOCFlm6wGBodLWGQOrED562AbUPdNWxNo/H0iAlM4iR
 4kuGIN+HFUqPLcUW/0RM2aal+riZXmeUixQwwP5UK373Z3m8IiRcCegQFeVk/IMs7yDe
 tAVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729876561; x=1730481361;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=D8BkQHxl/jl98jZceXhfQCyyW7/L0TBeWdJpzjggPMw=;
 b=kSwuhQjXnnRRlM8wUj3PH/acpZaUOBEV031YpRILHYCfuQfrNXqy5HPcyOio/WQGnz
 2iFSmPIGzEIDFB/b+pwB5lq4JFy4CpE3cTk0Sp83S3yo+/mANag9ZKWUF4oJ1LKWs5jL
 gUUvYl2tRKVlLRy/bfxSwqkqg9Bjb9un0fmL+ii2dME4FKSBeOJgBXzYIXiRUtNxxduI
 +JFjK4BfGx5JsC9/J+/p059xIWb2n0Vo1yhyqqlCIOW/0gUCEWxjERewnblK2Tsi97C2
 6bx5zFzxH+1E1b/pI8j7BW/z4dmcjD/w5lHrykdC9v4Bux3GY9tIYJyjXTp5ve/1zOwM
 xLzQ==
X-Gm-Message-State: AOJu0YzJbrnKfvgB/dVtBOWQeJ68ib1rGhEAq8wZyMYLhsSRV7UzWQ53
 tLdHdbkPYxDVc7URKd5vd5NSD77avb5B6PVS42+BZNlF1lkwHXeQlSiRrxGvNqs=
X-Google-Smtp-Source: AGHT+IFmFpJPOGOxqboe3FSCJG1p90kkm0iTmlWq/Ni/uCdlNc+9cgBNSEFM0DbQDQceCqmCnrSi6Q==
X-Received: by 2002:a05:6000:11cc:b0:37d:3650:fae5 with SMTP id
 ffacd0b85a97d-380611f5202mr113855f8f.52.1729876560748; 
 Fri, 25 Oct 2024 10:16:00 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-38058b91f50sm2013649f8f.94.2024.10.25.10.15.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2024 10:16:00 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 00/36] drm/vc4: Add support for BCM2712 / Pi5 display
 hardware
Date: Fri, 25 Oct 2024 18:15:31 +0100
Message-Id: <20241025-drm-vc4-2712-support-v2-0-35efa83c8fc0@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADTSG2cC/22NQQ6CMBBFr0Jm7Zh2ChJceQ/DorZFuoA2U2wkh
 LtbiUuX7yX//Q2SY+8SXKsN2GWffJgL0KkCM+r56dDbwkCCaikEoeUJs6mRWkmYXjEGXrDTVpG
 6OGX0AGUa2Q3+fWTvfeHRpyXwerxk+bW/IKn/wSxRoDSGbNN0dSfaG+sUH455jf5swgT9vu8fY
 xbB6b4AAAA=
To: Maxime Ripard <mripard@kernel.org>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Dom Cobley <popcornmix@gmail.com>
X-Mailer: b4 0.14.1
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

This series adds the required DRM, clock, and DT changes
required to support the display hardware on Pi5.
There are a couple of minor fixes first before the main patches.

Many of the patches were authored by Maxime whilst working
for us, however there have been a number of fixes squashed
into his original patches as issues have been found. I also
reworked the way UBM allocations are done to avoid double
buffering of the handles as they are quite a limited resource.

There are 2 variants of the IP. Most Pi5's released to date
have used the C1 step of the SoC, whilst the 2GB Pi5 released
in August is using the D0 step, as will other boards in future.

Due to various reasons the register map got reworked between
the steps, so there is extra code to handle the differences.
Which step is in use is read out of the hardware, so they
share a compatible string.

Thanks!

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
Changes in v2:
- Collected Acks and R-b tags
- Dropped patch 1 "drm/vc4: Limit max_bpc to 8 on Pi0-3". Already fixed as
  noted by Maxime.
- Fix unintialised var "mux" in vc6_hvs_pv_muxing_commit.
- Fixed uninitialised var "reg" in vc4_hvs_cob_init.
- Make bcm2712_mop_data and bcm2712_moplet_data static.
- Removed the "disable_turbo" line from the struct in
  raspberrypi_clock_property
- I'm confused by the CI error "performing pointer arithmetic on a null
  pointer has undefined behavior" for PCI_IOBASE as I'm not using it.
- Link to v1: https://lore.kernel.org/r/20241023-drm-vc4-2712-support-v1-0-1cc2d5594907@raspberrypi.com

---
Dave Stevenson (11):
      drm/vc4: Use of_device_get_match_data to set generation
      drm/vc4: Fix reading of frame count on GEN5 / Pi4
      drm/vc4: drv: Add support for 2712 D-step
      drm/vc4: hvs: Add in support for 2712 D-step.
      drm/vc4: plane: Add support for 2712 D-step.
      drm/vc4: hdmi: Support 2712 D-step register map
      drm/vc4: Enable bg_fill if there are no planes enabled
      drm/vc4: Drop planes that are completely off-screen or 0 crtc size
      arm64: dts: broadcom: Add firmware clocks and power nodes to Pi5 DT
      arm64: dts: broadcom: Add display pipeline support to BCM2712
      arm64: dts: broadcom: Add DT for D-step version of BCM2712

Dom Cobley (3):
      clk: bcm: rpi: Add ISP to exported clocks
      clk: bcm: rpi: Allow cpufreq driver to also adjust gpu clocks
      clk: bcm: rpi: Enable minimize for all firmware clocks

Maxime Ripard (22):
      dt-bindings: display: Add BCM2712 HDMI bindings
      dt-bindings: display: Add BCM2712 HVS bindings
      dt-bindings: display: Add BCM2712 PixelValve bindings
      dt-bindings: display: Add BCM2712 MOP bindings
      dt-bindings: display: Add BCM2712 MOPLET bindings
      dt-bindings: display: Add BCM2712 KMS driver bindings
      drm/vc4: drv: Support BCM2712
      drm/vc4: hvs: Add support for BCM2712 HVS
      drm/vc4: crtc: Add support for BCM2712 PixelValves
      drm/vc4: hdmi: Add support for BCM2712 HDMI controllers
      drm/vc4: txp: Introduce structure to deal with revision differences
      drm/vc4: txp: Rename TXP data structure
      drm/vc4: txp: Add byte enable toggle bit
      drm/vc4: txp: Add horizontal and vertical size offset toggle bit
      drm/vc4: txp: Handle 40-bits DMA Addresses
      drm/vc4: txp: Move the encoder type in the variant structure
      drm/vc4: txp: Add a new TXP encoder type
      drm/vc4: txp: Add support for BCM2712 MOP
      drm/vc4: txp: Add BCM2712 MOPLET support
      drm/vc4: Add additional warn_on for incorrect revisions
      clk: bcm: rpi: Create helper to retrieve private data
      clk: bcm: rpi: Add disp clock

 .../bindings/display/brcm,bcm2711-hdmi.yaml        |   2 +
 .../bindings/display/brcm,bcm2835-hvs.yaml         |   5 +-
 .../bindings/display/brcm,bcm2835-pixelvalve0.yaml |   3 +
 .../bindings/display/brcm,bcm2835-txp.yaml         |   5 +-
 .../bindings/display/brcm,bcm2835-vc4.yaml         |   1 +
 arch/arm64/boot/dts/broadcom/Makefile              |   1 +
 arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts |  37 +
 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts   |  42 +
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi          | 188 +++++
 drivers/clk/bcm/clk-raspberrypi.c                  |  33 +-
 drivers/gpu/drm/vc4/tests/vc4_mock.c               |   8 +-
 drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c     | 106 +--
 drivers/gpu/drm/vc4/vc4_crtc.c                     |  96 ++-
 drivers/gpu/drm/vc4/vc4_drv.c                      |  19 +-
 drivers/gpu/drm/vc4/vc4_drv.h                      |  54 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c                     | 107 ++-
 drivers/gpu/drm/vc4/vc4_hdmi.h                     |   4 +
 drivers/gpu/drm/vc4/vc4_hdmi_phy.c                 | 640 +++++++++++++++
 drivers/gpu/drm/vc4/vc4_hdmi_regs.h                | 217 ++++++
 drivers/gpu/drm/vc4/vc4_hvs.c                      | 737 ++++++++++++++++--
 drivers/gpu/drm/vc4/vc4_kms.c                      | 105 ++-
 drivers/gpu/drm/vc4/vc4_plane.c                    | 866 ++++++++++++++++++++-
 drivers/gpu/drm/vc4/vc4_regs.h                     | 297 +++++++
 drivers/gpu/drm/vc4/vc4_txp.c                      |  91 ++-
 include/soc/bcm2835/raspberrypi-firmware.h         |   1 +
 25 files changed, 3461 insertions(+), 204 deletions(-)
---
base-commit: 3ae80b375739495e36fc6143ff27716fe390a13e
change-id: 20241002-drm-vc4-2712-support-9ad3236e3caf

Best regards,
-- 
Dave Stevenson <dave.stevenson@raspberrypi.com>

