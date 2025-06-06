Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1950ACFC91
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jun 2025 08:29:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 276BE10E031;
	Fri,  6 Jun 2025 06:29:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4664E10E031
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jun 2025 06:28:57 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-6071ac9dc3eso2789762a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Jun 2025 23:28:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749191336; x=1749796136;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Azp50qUoKvhWib2z96ivM3bk0Xe8grvpHixajVtU5v4=;
 b=uubCgkX3Nd3YFXsNvrfFakZupNwD1/Kn5iN4w2j9G2JqBXNuh/lsBMGdi/GQZFh4nn
 da0nvsPqYOsbb8C1tLslATEouW5Tiz4HerR5B0jIYQ5HJEgB9YHbOuRQ2Hg42uY6GJ6n
 0lO214LUR6DZKGYz5CpjrptjExCdXTU5gA6TdpA/TPGRRFkERgH+xAwKMhEX5NXqJCIO
 SPIVA9Y9ot46GLetl8Z82rrU2scb3NVP0XIG50SAqRrWl1KD49VjXCUWLVAWDaNyzH5P
 Oy5Tnd2WkrB+gBCs7Wcmh8Hh3+O3cZw3Ye9dH2zVmlVpspx39RwcW3QTPywIlty341hR
 +bSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWnaqBfqiYzpR373fXVoHYqCS+pWEixBPBjfymw0vm7uzUFJ1167KenWYjHiM3x/IbgIZPhF6Ikq/s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw6T+sogRDreDAK0iN/gCPH/dueVb2LAqOzWpdQ54ff+W4KlJ3S
 qfMJSn4VA46oK+6sxi2a7FBXe+KNf1tSLOXvuK5WoS1ZbESzqfm5e/IM
X-Gm-Gg: ASbGncsJzt4kjXwsS9YApx+WYWAUj2XwPl5mqOSVl2EAIAkwmJmYPNAQGjzsb8xca/h
 4CEVo3MKsbqrrBmNBTHrMdBbw9nzAUeHUEToogHW2q0BDPS+ygDZQPPaCy15SeNrS2Hw+U7oX0z
 CkBiGxlkZpEU0A7KUwwu+GLPTP6SZqRZB4MOAXpeLSJnCFQTO+3bvuUMFf7eYA5ubCNUUTMG37p
 yDlscsziG2mJHLmvi86gQKbBNqtnq+jDeZPANUZ75ZGPkDjro7tvsfi1wDT+CL4wJZZT8a5ucIX
 YjJR4yjJKk+k69l2Eqiqzse4o6Z937jEazT5PPZh9IM0k7kY347c7G4vEEu8QVm3fo5FuErDWE9
 2d2/T9mqKdSxVNUHe9bV+h3+a2ILVuCU=
X-Google-Smtp-Source: AGHT+IGXNQ/Kv/GAHaZTlEm0PZukBBO2kWUNKuvYaAwM9uxr8U9d/fuebZy2jBADIT8dDmhYUoCnRw==
X-Received: by 2002:a17:906:eecb:b0:ad8:8efe:31fe with SMTP id
 a640c23a62f3a-ade1ab876f7mr153758766b.43.1749191335712; 
 Thu, 05 Jun 2025 23:28:55 -0700 (PDT)
Received: from [10.42.0.1] (cst-prg-46-162.cust.vodafone.cz. [46.135.46.162])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ade1d754653sm67989966b.20.2025.06.05.23.28.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jun 2025 23:28:55 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Subject: [PATCH v7 00/10] New DRM accel driver for Rockchip's RKNN NPU
Date: Fri, 06 Jun 2025 08:28:20 +0200
Message-Id: <20250606-6-10-rocket-v7-0-dc16cfe6fe4e@tomeuvizoso.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAISKQmgC/23OzWrDMBAE4FcJOldl9R/31PcIPUirVSNKrWK7J
 m3wu1cOlESg4wzMx1zZTFOmmb0crmyiNc+5jDW4pwPDsx/fiedYM5MgNVghueUC+FTwgxY+KGE
 jJRQaHauLr4lSvty001vN5zwvZfq54avY276zCg4cLJA+Enlp4HUpn/S95t8yl+eRFrZrq/wXD
 EhpWkFWIeoYMPn9j+gL6i4YYVtBVcHV2uNQ9Rj6gn4UhlbQ+wcbU7JBI3jqC+ZBkNAKpgriiAN
 6SBgU9gV7FyzoVrBVkMp5dCbGYDoftm37AzYXVxT2AQAA
X-Change-ID: 20240612-6-10-rocket-9316defc14c7
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Kever Yang <kever.yang@rock-chips.com>, Robin Murphy <robin.murphy@arm.com>, 
 Daniel Stone <daniel@fooishbar.org>, Da Xue <da@libre.computer>, 
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
 Tomeu Vizoso <tomeu@tomeuvizoso.net>, 
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
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
Changes in v7:
- Actually enable process isolation by allocating its own IOMMU domain
  to each DRM client.
- Link to v6: https://lore.kernel.org/r/20250604-6-10-rocket-v6-0-237ac75ddb5e@tomeuvizoso.net

Changes in v6:
- Make all cores depend on pclk and npu clocks
- Fix BO sync direction logic
- Misc. cleanups
- Link to v5: https://lore.kernel.org/r/20250520-6-10-rocket-v5-0-18c9ca0fcb3c@tomeuvizoso.net

Changes in v5:
- Use bulk clk API
- Rename bindings file
- Syntax improvement to bindings
- Link to v4: https://lore.kernel.org/r/20250519-6-10-rocket-v4-0-d6dff6b4c0ae@tomeuvizoso.net

Changes in v4:
- Several fixes to DT bindings.
- Link to v3: https://lore.kernel.org/r/20250516-6-10-rocket-v3-0-7051ac9225db@tomeuvizoso.net

Changes in v3:
- Reference in the device tree only the register blocks that are
  actually used.
- Several style and robustness fixes suggested in the mailing list.
- Added patches from Nicolas Frattaroli that add support to the NPU for
  the Rock 5B board.
- Link to v2: https://lore.kernel.org/r/20250225-6-10-rocket-v2-0-d4dbcfafc141@tomeuvizoso.net

Changes in v2:
- Drop patch adding the rk3588 compatible to rockchip-iommu (Sebastian Reichel)
- Drop patch adding support for multiple power domains to rockchip-iommu (Sebastian Reichel)
- Link to v1: https://lore.kernel.org/r/20240612-6-10-rocket-v1-0-060e48eea250@tomeuvizoso.net

---
Nicolas Frattaroli (2):
      arm64: dts: rockchip: add pd_npu label for RK3588 power domains
      arm64: dts: rockchip: enable NPU on ROCK 5B

Tomeu Vizoso (8):
      accel/rocket: Add registers header
      accel/rocket: Add a new driver for Rockchip's NPU
      accel/rocket: Add IOCTL for BO creation
      accel/rocket: Add job submission IOCTL
      accel/rocket: Add IOCTLs for synchronizing memory accesses
      dt-bindings: npu: rockchip,rknn: Add bindings
      arm64: dts: rockchip: Add nodes for NPU and its MMU to rk3588-base
      arm64: dts: rockchip: Enable the NPU on quartzpro64

 Documentation/accel/index.rst                      |    1 +
 Documentation/accel/rocket/index.rst               |   19 +
 .../bindings/npu/rockchip,rk3588-rknn-core.yaml    |  118 +
 MAINTAINERS                                        |   10 +
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi      |   89 +-
 .../arm64/boot/dts/rockchip/rk3588-quartzpro64.dts |   30 +
 arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts    |   56 +
 drivers/accel/Kconfig                              |    1 +
 drivers/accel/Makefile                             |    1 +
 drivers/accel/rocket/Kconfig                       |   25 +
 drivers/accel/rocket/Makefile                      |   10 +
 drivers/accel/rocket/rocket_core.c                 |   80 +
 drivers/accel/rocket/rocket_core.h                 |   59 +
 drivers/accel/rocket/rocket_device.c               |   31 +
 drivers/accel/rocket/rocket_device.h               |   30 +
 drivers/accel/rocket/rocket_drv.c                  |  301 ++
 drivers/accel/rocket/rocket_drv.h                  |   19 +
 drivers/accel/rocket/rocket_gem.c                  |  197 +
 drivers/accel/rocket/rocket_gem.h                  |   32 +
 drivers/accel/rocket/rocket_job.c                  |  700 ++++
 drivers/accel/rocket/rocket_job.h                  |   52 +
 drivers/accel/rocket/rocket_registers.h            | 4425 ++++++++++++++++++++
 include/uapi/drm/rocket_accel.h                    |  145 +
 23 files changed, 6430 insertions(+), 1 deletion(-)
---
base-commit: a6d708809579ed3d902465785666085ff07a1d7c
change-id: 20240612-6-10-rocket-9316defc14c7

Best regards,
-- 
Tomeu Vizoso <tomeu@tomeuvizoso.net>

