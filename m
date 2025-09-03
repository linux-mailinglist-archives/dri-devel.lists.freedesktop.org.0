Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5CD5B42D0D
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 00:55:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFA4210E95C;
	Wed,  3 Sep 2025 22:55:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MbtHjJ6W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 518E410E95C
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Sep 2025 22:55:09 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-24a9cc916b3so5093535ad.0
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Sep 2025 15:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756940109; x=1757544909; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=o7SdCGQ3OtPL4C8i+CiT/i+Gun3C1uxaqDOYUaITvFM=;
 b=MbtHjJ6WiZDtVdc5ZEc7VRflVSoYRjSzbPuoNDr0rDJU+SECThRQbWBkhKgPsFUAI0
 JbZEJa86vyovJZ6iaa1ofOylET8vPr8IHsS6pjPl0mnCVUIo8SFqovZAk4XOB9CtqqCo
 1kpmhwkowNvVNsjcXvqVLw8jm/FZyDpIPRTY/PGoY/r6zjm72aAS37YplO9LAEeEySbx
 UWOWAR4P1rY/pZpYbVTqx73cg4B5ElbtN54EJ2vVHMtYmiUyKoH8IJBNHUe+woz6uOYH
 ujR4oeS7qCJdme7ij/q4NpIQ2Gqa07gxJUTn/bPdxbflcbJ2mWHFndPHYsDse4Ht4GFd
 udUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756940109; x=1757544909;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=o7SdCGQ3OtPL4C8i+CiT/i+Gun3C1uxaqDOYUaITvFM=;
 b=hZxc9a+mfJmNEmTc28nKvl9JYfiWJz6YXzqW7Vr+2GNZtLJp1oWIRhLXZXPT1bpRvC
 Q8k9VpG50AcOQe0L1jqlG6ttfXgJtGSqMzXlUQ8U6NNxieKrEy4tZeXLDB0DJsIIXRSa
 f/+KYoL3R7epQAj5LC+Q9WpYVesYPBxBjOw7i+cMehtfTI2NUund4UPKVms0wTkgSkFP
 4cNfn1PoVd0mygtUgP1M5hLdTOE4wKAWAv1gGhSLyaTIDbvzjtO2en/1m1GKEElWKIGg
 WiuqQKfLaJaOgwbMHUA23PF508j3AcoL0HymxeW0wdY+1Xlq0IGQbjGF8a+ecFhOp9UG
 rI7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/dBeCBOatm5KgYwV/FCzoE8u+oG/k2ZEYAkzN3Bb/2YDyMmIpJuFOv2EFKISl2SkZbqYUj1OLIf8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxwJpJsyV760WWJ/3FDglpvDqVjSNgwdZkrREn+Fe8pqCjADZZ5
 D18B2hvdaBqtTQ/VfUpXS6h0pEVX361wca+oMa4SBq56HWrODsDTyyFL
X-Gm-Gg: ASbGncsedYr4d6BUzn46r8eWNtnNXs6uVbdwxOm+Ph8BRXJ5JB1mDNB+FlhlQwZcfiE
 VLhPBsLSBu/mD54HXhq2W0AyZZUZiktJXZLD6Vgx58/38ws8LDFTcjWHRHwx5ysrOAVbqzC+XbG
 WN9qZ8aXRaU8pXu0dbtCmw1rCvAKMSmoNB1v/dqHoWAaLP4bAIfdF8iBrcdCCnXooj6tZ2slu29
 O8KXDf2bWlJeehcNH8dwjT1NG6ENeMF0fxjyKeiOJcFs71C1GqOzhGQOHB+RcohBhyVMru+cMhA
 seThKMwpQRYK76ZA4KJyBu6Pm6ZPSAV29Vv6syoCS21EdC/rJvHlEM+4LhgddPoqYymI4o7Qxtg
 T82UhrVWkxZBhjw2C0QOranFO5v8aFgx3pLS/mkLiuEWE/kOR+xypHEWf7kDx2JKeyYdZdQyHvN
 mKOU8jQAXZYw==
X-Google-Smtp-Source: AGHT+IEhFktIMvpmJbrvjWFLTT5A3+FgRNJriwkj5RePnhU8700uH0+euhIJE/haVIpx1TPUCmOLqw==
X-Received: by 2002:a17:902:e848:b0:246:a90e:9179 with SMTP id
 d9443c01a7336-24944ab7df2mr226213595ad.28.1756940108651; 
 Wed, 03 Sep 2025 15:55:08 -0700 (PDT)
Received: from localhost (185.3.125.34.bc.googleusercontent.com.
 [34.125.3.185]) by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-24a92f897d8sm131162215ad.24.2025.09.03.15.55.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Sep 2025 15:55:08 -0700 (PDT)
From: Chia-I Wu <olvaffe@gmail.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [RFC PATCH 0/2] drm/panthor: initial mt8196 support
Date: Wed,  3 Sep 2025 15:55:02 -0700
Message-ID: <20250903225504.542268-1-olvaffe@gmail.com>
X-Mailer: git-send-email 2.51.0.338.gd7d06c2dae-goog
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

MediaTek MT8196 has Mali-G925-Immortalis, for which panthor gained
support recently. But the soc also requires custom ASN hash to be
enabled. This series introduces panthor_soc_data for per-soc data and
uses it to enable custom ASN hash on MT8196.

The clk/regulator provider on MT8196 is GPUEB, whose driver[1] needs to
be cleaned up and upstreamed separately.

This initial support also lacks support for some hw configs. On some
configs, panthor is expected to query a mask from efuse to mask out
unavailable shader cores from ptdev->gpu_info.shader_present. This
requires extending panthor_soc_data with a callback to read the mask.

This is an RFC because the dependent drivers are not ready yet. But I
would like to gather opinions on having panthor_soc_data for
soc-specific data and having CONFIG_DRM_PANTHOR_SOC_MT8196 for
soc-specific code.

[1] https://gitlab.freedesktop.org/olv/kernel/-/commit/170d5fc90f817dc90bde54b32872c59cf5c77779

Chia-I Wu (2):
  dt-bindings: gpu: mali-valhall-csf: add MediaTek MT8196 compatible
  drm/panthor: add initial mt8196 support

 .../bindings/gpu/arm,mali-valhall-csf.yaml    |  1 +
 drivers/gpu/drm/panthor/Kconfig               |  6 +++++
 drivers/gpu/drm/panthor/Makefile              |  2 ++
 drivers/gpu/drm/panthor/panthor_device.c      |  2 ++
 drivers/gpu/drm/panthor/panthor_device.h      |  4 +++
 drivers/gpu/drm/panthor/panthor_drv.c         |  4 +++
 drivers/gpu/drm/panthor/panthor_gpu.c         | 26 ++++++++++++++++++-
 drivers/gpu/drm/panthor/panthor_regs.h        |  4 +++
 drivers/gpu/drm/panthor/panthor_soc.h         | 26 +++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_soc_mt8196.c  |  9 +++++++
 10 files changed, 83 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/panthor/panthor_soc.h
 create mode 100644 drivers/gpu/drm/panthor/panthor_soc_mt8196.c

-- 
2.51.0.338.gd7d06c2dae-goog

