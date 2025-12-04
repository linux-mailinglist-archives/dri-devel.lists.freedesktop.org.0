Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED84CA27C5
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 07:17:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18AFB10E84B;
	Thu,  4 Dec 2025 06:17:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="end19F4M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC7F610E847
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Dec 2025 06:17:12 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-640c1fda178so903849a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Dec 2025 22:17:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764829031; x=1765433831; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=o5cPONIgu6mzYa/WMF+RelFJ2K/lRyJPaqEbFSvDOqU=;
 b=end19F4MkcuqNsJEWm/BAM/2/Yx9SGgDiEzF0zfjrXBh6JY19a4p2/o8H58XIg1ySK
 UjrWHhKjQpfCumJpZSholzmKby+OnnUhgy7X2ykXGy7BW6TyDRubdQNvhgCQbgEkXRvm
 mySYHVaMAHnU751WSzfQDVzT9i050OSMuqFTzyiV9mpinM40SUY0MHHYMPMkqpgGBYqM
 bIAZ/lFHvWi+Hdaj+4FhHmFs8CZy9+Q2Ho8CNWczj6UBgzEnywfTPrCnPiTvP3+iep7x
 4lRSGsLm8UeMbpx5LSzdjEM2dQVz7n+EhtuuAb7V2eVzSvO9rT02bFT1Xps9TXyy0oQr
 H5fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764829031; x=1765433831;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o5cPONIgu6mzYa/WMF+RelFJ2K/lRyJPaqEbFSvDOqU=;
 b=rMRFzlQKlk8u+pkQMPRyqRRQ9ZdEDtuXvCK6Oq3C/A8jXdUFSCO1IMSzV4V6Nfcv1N
 aAsxywIW/m5qK7tbhbcEgnU3tM6Ruu1KcQLX+K8hJLK/oXY6BzQD4ysYvJ9D70XPzIEH
 sMMMBqFD1R+adWb4XRgebbcT8bZ5YYrgfX/dhheDz3rydqMcvdYjPZyA1Q+gejC7nX2k
 LNgS5mBiu2U/lADWdLzABPn1c1trmme+ntOdINVTBwhdq4FNJ90bmKjyknPN7KfAw05T
 DTIHuYGDa9JYgLCRmIL2/AkQJbYnOjJzt+xje0NCnfR8WoNuJPnNPJLthyPmjaghSr2Z
 yC6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUsY7n/TZv1Dv2iYstU+Dm/jH/EZ3yABxHPaANYStfXzl5NU6uyaNXiZ5UAT0YyjAR8aqAo0CVQHU0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywbd+xAGLG/7iOQdRoSt3P3uCpxPDpWTJKPuwC1ycxE80+mPzvd
 nkGBlr87edIQxANbVc79yh7u+GpmXJAvZTSnP5sUMRhM4sapo7B5GLCH
X-Gm-Gg: ASbGncusWXfVihVPIqxqiUGvCzEs/A8vaKwSrpu2CRkvVZtLbclBwHfGlub1r+eO77p
 7KTjY5XbNrzl3pWqeFyMwPVq/DI5M2apk/hBJMVal+l23hRTv4oDrg8kZt9ybsqxqI+coAlXG8r
 9lC6MGaSyKTCjH6toUJQ9rrsxX940R9CfTMMj+mDBeNGsixfdzVv1VLzex3lvO/ohq+Q4Owdvve
 GEyHtDjUQ5+uhWbBF1n5bD3KlXz+DX4k3vnkLhFVhrg3ZFc6ya4NkUGCX/c7ZR4Zn1e4wzH46LG
 VzE0r2fHi8et2NCxCMldYmkM7fJ0LVHb47u667mSzFefqY0F0zA8iUvUgaw0L7PjKoEsv7wiFYX
 ipEJERNjtQkYuFsihLOdOeKXMRiKUJ4A7ZjbUYWK9hsnuFf6AN+4y+xjGYJC6VaTor5+DYQv2TP
 E=
X-Google-Smtp-Source: AGHT+IE96b/uxsEEqrl87S6Pg6TRMB1JugG4AhVEQkgPU/uciaxk7pEZZBKrlSNBh92a+3pEa9CVUQ==
X-Received: by 2002:a05:6402:1ecd:b0:647:57db:c997 with SMTP id
 4fb4d7f45d1cf-6479c4f6d31mr4107684a12.21.1764829031175; 
 Wed, 03 Dec 2025 22:17:11 -0800 (PST)
Received: from xeon ([188.163.112.74]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-647b2ec2d8csm490159a12.5.2025.12.03.22.17.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Dec 2025 22:17:10 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Dmitry Osipenko <digetx@gmail.com>,
 Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/4 RESEND] gpu/drm: tegra: add DSI support for
 Tegra20/Tegra30
Date: Thu,  4 Dec 2025 08:16:59 +0200
Message-ID: <20251204061703.5579-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
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

Tegra20/Tegra30 DSI is quite similar to Tegra114+ apart MIPI calibration
logic and clocks. With a few minor tweaks, existing tegra DSI driver
should work on Tegra20/Tegra30 devices just fine. Tested on
Motorola Atrix 4G (T20) and ASUS VivoTab RT TF600T (T30).

This patchset depends on Tegra20/Tegra30 CSI bringup since both share
MIPI calibration logic. Ideally these patches should be picked after
CSI bringup but they will not break anything even if picked before
CSI patches.

---
Changes in v2:
- removed all MIPI calibration, it is handled within CSI bringup
- added per-soc structures into of_match
- added fix for hang caused by register access with uninited hw
---

Svyatoslav Ryhel (4):
  clk: tegra20: reparent dsi clock to pll_d_out0
  gpu/drm: tegra: dsi: move prepare function at the top of encoder
    enable
  gpu/drm: tegra: dsi: add support for Tegra20/Tegra30
  ARM: tegra: adjust DSI nodes for Tegra20/Tegra30

 arch/arm/boot/dts/nvidia/tegra20.dtsi |   4 ++
 arch/arm/boot/dts/nvidia/tegra30.dtsi |   8 +++
 drivers/clk/tegra/clk-tegra20.c       |   6 +-
 drivers/gpu/drm/tegra/drm.c           |   2 +
 drivers/gpu/drm/tegra/dsi.c           | 100 ++++++++++++++++----------
 drivers/gpu/drm/tegra/dsi.h           |  15 ++++
 6 files changed, 95 insertions(+), 40 deletions(-)

-- 
2.48.1

