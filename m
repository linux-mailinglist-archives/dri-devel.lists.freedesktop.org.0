Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A48FB2C2E7
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 14:16:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FF9410E153;
	Tue, 19 Aug 2025 12:16:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="eUBhSdei";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B53C710E153
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 12:16:43 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-afcb79f659aso788126566b.2
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 05:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755605802; x=1756210602; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OTZBF2cKOGdV37BgNxVIad8RxVSZEEHpIkQVHokH8Wo=;
 b=eUBhSdei90GTg49YhXBmrjNMCg/ap/sFBZSOb17pI60SgyjProe8kp2de0QozQGZ5C
 dh+jJtOuPEYydtu4mH3al8cLttoo7Ckt5wcH4sUy9iQrjQfrVfnvvq4fYmwJq1Eg1Dfe
 xcmwNi6wUCZfdRKxxPeO40RitNYZv7DfnYsFzv63RGhdQhlif1qC8I9+LhHdYT28cWbZ
 pRK6EOeBl3zXiiMzmC+aODWyVT+b8A4FDG1YTQvR6hKHkdlDT66P5iV1XIoHJ8hR4en9
 nqLhQ86B4s7Ujz+FR004vNX5Q66YulzZ7pjsR/2AS48bROCmXAK43FIx7uvoFiNI/yOt
 6EeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755605802; x=1756210602;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OTZBF2cKOGdV37BgNxVIad8RxVSZEEHpIkQVHokH8Wo=;
 b=UHyc4KAQqf9aslSXZ6FGDRn90VVCSfbGvNtyhAN0TRwHrwz9SEW3Zrlm5w2+4jjcsF
 Jd1EDOE7KbRC+KrM9JNvLY7a9w9jMEqF9t/cc6KktlG3R6qh5A3C8sLa8Yjbzi/lopQa
 qvabAd9+koHcYPcS7ftqTMP9T+VObIVkB4HX6vTRFvB0HqoVgayUZ6Hf6xfoOOjIb+Fz
 egEpcREUqNMrqH2w+7mbU1RsO0XLMZbQRai9jMxnOMSMYHWz+ReaLZQUO1jTkXP7Pfuk
 vq70jEDvllLK3UuTPYYKso+4wG7hHMWKotwD7yJYJyPecWGB4UchSEVRfRS0GjA6KQgr
 VRbQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4vkTr7j7D9jFNx1UMTOuL6WVomYlRHfBeLdkwB8Pve7zt8jQ6Ypp/opv8fwpw5hRcBm5KTew5EME=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzLH9lRR0P0V5R9Lh8+09eR6l+mj33qTMz0v6Gi32E4qgitC/QT
 s0eL//zoOvwrxahkvH5rFvsz2aC1r0msWOeTl2tJVUJp90iEB6qFbF/z
X-Gm-Gg: ASbGncshZ2INcy9e47M3omnbayVff9j6hQSF9AE7nFqczzLnCwYSlgnwLzk1+N0cSVa
 3aHoA0ad755jwbFKi/QVSBvEra6JHWS784LSb5V0T+/mwN/lQIHTwfU52GcvOcr20bVrrngRCbU
 mOgVUf5DESrmlnLUQf0z1jGZxlgdVVKK/+pBnc4ZDDZvgylDuQCQF+SAbz/JnInPcRVaYnMWvvr
 6AEEukPJQbHVPvhjYyzh2hL43CWLFc9wrE+IP/WSgFqn7UQUcahqS74kYRSVWkl78t6T7Xf+8mg
 ZR2g7aWHATMU/th5GIjAERKe5fqrm6qbdzvE1Z5TVvxpWzT/Y7BURbIHr7aaK1aS13ho4yQ9U9e
 nv9C1HDGVHFwnKA==
X-Google-Smtp-Source: AGHT+IFOn/TJHFwwAXjt/aa4+DjS3IYy277UAXO/A/XxXv0w3obUkySSlcaEnmlY0FxNsalKHy8ajQ==
X-Received: by 2002:a17:907:971d:b0:af9:44fe:dea1 with SMTP id
 a640c23a62f3a-afddccd40afmr224499366b.23.1755605801830; 
 Tue, 19 Aug 2025 05:16:41 -0700 (PDT)
Received: from xeon.. ([188.163.112.76]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afcdce72cbbsm1012018666b.35.2025.08.19.05.16.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Aug 2025 05:16:41 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Dmitry Osipenko <digetx@gmail.com>,
 Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-staging@lists.linux.dev
Subject: [PATCH v1 00/19] tegra-video: add CSI support for Tegra20 and Tegra30
Date: Tue, 19 Aug 2025 15:16:12 +0300
Message-ID: <20250819121631.84280-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Add support for MIPI CSI device found in Tegra20 and Tegra30 SoC along
with a set of changes required for that.

Svyatoslav Ryhel (19):
  clk: tegra: init CSUS clock for Tegra20 and Tegra30
  dt-bindings: clock: tegra20: Add IDs for CSI PAD clocks
  clk: tegra30: add CSI PAD clock gates
  dt-bindings: display: tegra: document Tegra30 VIP
  staging: media: tegra-video: expand VI and VIP support to Tegra30
  staging: media: tegra-video: csi: move CSI helpers to header
  staging: media: tegra-video: csi: parametrize MIPI calibration device
    presence
  staging: media: tegra-video: vi: adjust get_selection op check
  staging: media: tegra-video: vi: add flip controls only if no source
    controls are provided
  staging: media: tegra-video: tegra20: set correct maximum width and
    height
  staging: media: tegra-video: tegra20: add support for second output of
    VI
  staging: media: tegra-video: tegra20: simplify format align
    calculations
  staging: media: tegra-video: tegra20: set VI HW revision
  staging: media: tegra-video: tegra20: increase maximum VI clock
    frequency
  staging: media: tegra-video: tegra20: expand format support with
    RAW8/10 and YUV422 1X16
  staging: media: tegra-video: tegra20: adjust luma buffer stride
  dt-bindings: display: tegra: document Tegra20 and Tegra30 CSI
  ARM: tegra: add CSI binding for Tegra20 and Tegra30
  staging: media: tegra-video: add CSI support for Tegra20 and Tegra30

 .../display/tegra/nvidia,tegra20-vip.yaml     |   1 +
 .../display/tegra/nvidia,tegra210-csi.yaml    |  78 +-
 arch/arm/boot/dts/nvidia/tegra20.dtsi         |  17 +-
 arch/arm/boot/dts/nvidia/tegra30.dtsi         |  19 +-
 drivers/clk/tegra/clk-tegra20.c               |   1 +
 drivers/clk/tegra/clk-tegra30.c               |  16 +-
 drivers/staging/media/tegra-video/Makefile    |   1 +
 drivers/staging/media/tegra-video/csi.c       |  35 +-
 drivers/staging/media/tegra-video/csi.h       |  11 +
 drivers/staging/media/tegra-video/tegra20.c   | 771 +++++++++++++++---
 drivers/staging/media/tegra-video/tegra210.c  |   1 +
 drivers/staging/media/tegra-video/vi.c        |  20 +-
 drivers/staging/media/tegra-video/vi.h        |   4 +-
 drivers/staging/media/tegra-video/video.c     |   6 +
 drivers/staging/media/tegra-video/vip.c       |   5 +-
 include/dt-bindings/clock/tegra30-car.h       |   4 +-
 16 files changed, 842 insertions(+), 148 deletions(-)

-- 
2.48.1

