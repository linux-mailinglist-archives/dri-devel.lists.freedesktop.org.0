Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A388A905433
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 15:53:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82A5210E193;
	Wed, 12 Jun 2024 13:53:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6B6610E193
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 13:53:04 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-35f1a7386d5so3463473f8f.3
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 06:53:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718200383; x=1718805183;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TGBcr2RK+U/upO1TBgkbMQlKphC74REv/dCO0ULM5Bc=;
 b=LpowZq6zY7hZfA134I7GDcO7yCrPWLiebIQAMAGI6EyBDAuhK2gNGfwVV3mbfjqemx
 yka3nWMOsJMc0+U4rtcn8gPXNUjOk4Bxph8LK+/1vxu853MifCq36XMzyX7hNSJNhYo3
 q56Pc3QjBlrxemW+DgPTedpOpxSU9t+TvqD2SYBk4y2gwAvFT9HkA6Ul2Bs3QgD8uYgc
 v5zckzgIgFEbJmHJbJ5PLfG3J5t/zhcooy8xGy4m4VwPztAFzgqi9uMpDAGtNQuDyZz1
 tk0P1m5iyjtdAcGQ2F0y1fJmpYuuYeS4nKF7oGC1ysV0Rry98rwHX9k+HMIf2kXJdGIg
 crjQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWCJ29ABQApnergB5dirwJS6HAP83Y6F7mQ7vxSDcZc35KUBysN/1kBX3gfTu2awVHvFOg3p4M2WFShd+Vc4vbrIbUeMN24szmzpwLLcy6/
X-Gm-Message-State: AOJu0Yzc+oc6vASbSBU60EY+8OernmshvLm33fusI1e3IvdW2C84ZJwJ
 TumWjtb6fNlazGAXls+z2FomA6MAtdjV+22ELR69c5fN5L63hZr+
X-Google-Smtp-Source: AGHT+IFpLlhCxjJHPHBYfibghuC2LyUOVhxW9VizojTuoZbWMakCG+/4bvOBPIPTBmnYXt2VZXwpnA==
X-Received: by 2002:a5d:45c7:0:b0:35f:2161:1fc0 with SMTP id
 ffacd0b85a97d-35fe892bddamr1198669f8f.70.1718200382941; 
 Wed, 12 Jun 2024 06:53:02 -0700 (PDT)
Received: from ramallet.home (cst-prg-45-36.cust.vodafone.cz. [46.135.45.36])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-422871ec9e6sm28201695e9.38.2024.06.12.06.53.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jun 2024 06:53:02 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Subject: [PATCH 0/9] New DRM accel driver for Rockchip's RKNN NPU
Date: Wed, 12 Jun 2024 15:52:53 +0200
Message-Id: <20240612-6-10-rocket-v1-0-060e48eea250@tomeuvizoso.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADaoaWYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDM0MjXTNdQwPdovzk7NQSXUtjQ7OU1LRkQ5NkcyWgjoKi1LTMCrBp0bG
 1tQDVw8QnXQAAAA==
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Heiko Stuebner <heiko@sntech.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, 
 Tomeu Vizoso <tomeu.vizoso@tomeuvizoso.net>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
 Tomeu Vizoso <tomeu@tomeuvizoso.net>
X-Mailer: b4 0.13.0
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

This series adds a new driver for the NPU that Rockchip includes in its
newer SoCs, developed by them on the NVDLA base.

In its current form, it supports the specific NPU in the RK3588 SoC.

The userspace driver is part of Mesa and an initial draft can be found at:

https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/29698

Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
Tomeu Vizoso (9):
      iommu/rockchip: Add compatible for rockchip,rk3588-iommu
      iommu/rockchip: Attach multiple power domains
      dt-bindings: mailbox: rockchip,rknn: Add bindings
      arm64: dts: rockchip: Add nodes for NPU and its MMU to rk3588s
      arm64: dts: rockchip: Enable the NPU on quartzpro64
      accel/rocket: Add a new driver for Rockchip's NPU
      accel/rocket: Add IOCTL for BO creation
      accel/rocket: Add job submission IOCTL
      accel/rocket: Add IOCTLs for synchronizing memory accesses

 .../devicetree/bindings/npu/rockchip,rknn.yaml     |  123 +
 MAINTAINERS                                        |    8 +
 .../arm64/boot/dts/rockchip/rk3588-quartzpro64.dts |    8 +
 arch/arm64/boot/dts/rockchip/rk3588s.dtsi          |   53 +
 drivers/accel/Kconfig                              |    1 +
 drivers/accel/Makefile                             |    1 +
 drivers/accel/rocket/Kconfig                       |   13 +
 drivers/accel/rocket/Makefile                      |   10 +
 drivers/accel/rocket/rocket_core.c                 |  155 +
 drivers/accel/rocket/rocket_core.h                 |   48 +
 drivers/accel/rocket/rocket_device.c               |   39 +
 drivers/accel/rocket/rocket_device.h               |   40 +
 drivers/accel/rocket/rocket_drv.c                  |  243 ++
 drivers/accel/rocket/rocket_drv.h                  |   16 +
 drivers/accel/rocket/rocket_gem.c                  |  136 +
 drivers/accel/rocket/rocket_gem.h                  |   33 +
 drivers/accel/rocket/rocket_job.c                  |  708 ++++
 drivers/accel/rocket/rocket_job.h                  |   49 +
 drivers/accel/rocket/rocket_registers.h            | 4449 ++++++++++++++++++++
 drivers/iommu/rockchip-iommu.c                     |   39 +
 include/uapi/drm/rocket_accel.h                    |  116 +
 21 files changed, 6288 insertions(+)
---
base-commit: 83a7eefedc9b56fe7bfeff13b6c7356688ffa670
change-id: 20240612-6-10-rocket-9316defc14c7

Best regards,
-- 
Tomeu Vizoso <tomeu@tomeuvizoso.net>

