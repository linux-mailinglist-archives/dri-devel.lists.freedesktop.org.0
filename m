Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 343E78687DC
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 04:46:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC6A210F2B0;
	Tue, 27 Feb 2024 03:45:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UFWP96Zb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com
 [209.85.166.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56C5410F2B0
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 03:45:58 +0000 (UTC)
Received: by mail-il1-f170.google.com with SMTP id
 e9e14a558f8ab-36523b9fa11so13192945ab.3
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 19:45:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709005557; x=1709610357; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wl0bBkvRiqQeuBTLPhRoK2WWUUi11l8F15u5KFX7dWY=;
 b=UFWP96ZbeCixTurniVGn7XAzZV2OCo9QEM3lgN8NQ46izV2Lb/a/LjlUmYqlcPNbMU
 lhM1qwYRobnU7EWMo41F3Vz69qJzVvpo1o96Ois3joboEA/9DIEXNlAWTx6c0uq/WGh1
 TQUEifMYLHWYFSNRv++FKq9xzvi09DqjEG8j72U0X1zfowsZkPlWRRSFUVNk+iTlAZoj
 DT9BdqkTZTmOCuYHKxKFfD6vrVWPPA73DO2Gezv1A4OB+Eysjrzji6NRZPEv2Sc6cm7I
 NE832OQP9hsoY4sFetxtjH4WmZJTlYhOknDSsWg/940zk34mGat4aDDrR4I8eu3zmq4Z
 0kwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709005557; x=1709610357;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wl0bBkvRiqQeuBTLPhRoK2WWUUi11l8F15u5KFX7dWY=;
 b=Ad91JO8Wmh+iSms5q0Rl5eYUNTcXvL1UbjD4wzRkEVcJk2g6aO/ZP1WP7byKXurTca
 0jL1cECM7fbkvUv/KjLHlcWf0rDc0f9TbANd0TPkT/k+ymP/SslOnayy1IMkqSV+03yM
 mlOL5p/e/ELKWKz0r5EaahL3z+l1iXPIlvHYYbw1CsELt7c/i1b6WXOiCxQ3zrZ7fr+Y
 0oz7qADUa0hp7ZhOdE1qsHDf7wSK1V7pUzsSmjC+LyjC5Spa9MmGafJtbbWVLNtcRyP7
 j+zgc0g91+JB8ZbETcMhXEUaZZhrdqPXIRNcyOSnYxOQoXGiZhS0Kv+L0UAbVJICt6UT
 mplA==
X-Gm-Message-State: AOJu0YyhVnFjXlDp9Hy7L37xy6RY/ibu+QShb2qTN/RNO1zieG0FwHOn
 ASq1+dUFq9y15BhhjwdZjJvy8eHqS/lsNt8BWtaYBvh1qAYgxl2RBLGtz6IC+fj23WPG
X-Google-Smtp-Source: AGHT+IF5iCsGO7Lh19DB7/toWuvvr5zyzgW6mtDlHlNqxuxd8xI4191wlLaB8IhucWBfHVJ3P+Nsjw==
X-Received: by 2002:a92:ab03:0:b0:365:858:d6d1 with SMTP id
 v3-20020a92ab03000000b003650858d6d1mr8892141ilh.1.1709005556933; 
 Mon, 26 Feb 2024 19:45:56 -0800 (PST)
Received: from aford-System-Version.lan
 ([2601:447:d002:5be:1712:c48b:aaa0:cd8b])
 by smtp.gmail.com with ESMTPSA id
 w4-20020a92ad04000000b00362b4d251a5sm1891566ilh.25.2024.02.26.19.45.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Feb 2024 19:45:56 -0800 (PST)
From: Adam Ford <aford173@gmail.com>
To: dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org
Cc: aford@beaconembedded.com, Adam Ford <aford173@gmail.com>,
 Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 0/6] gpu: powervr-rogue: Add PowerVR support for some Renesas
 devices
Date: Mon, 26 Feb 2024 21:45:30 -0600
Message-ID: <20240227034539.193573-1-aford173@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Renesas has used a few variants of the Power VR GPU in their R-Car
and RZ/G2 families.  While there is still some work to do at the Mesa
level,  adding these device tree nodes allows the Power VR driver
to enumerate and load the respective firmware located:

https://gitlab.freedesktop.org/imagination/linux-firmware/-/tree/powervr/powervr?ref_type=heads

Adam Ford (6):
  dt-bindings: gpu: powervr-rogue: Add PowerVR support for some Renesas
    GPUs
  arm64: dts: renesas: r8a774a1: Enable GPU
  arm64: dts: renesas: r8a774e1: Enable GPU
  arm64: dts: renesas: r8a77951: Enable GPU
  arm64: dts: renesas: r8a77960: Enable GPU
  arm64: dts: renesas: r8a77961: Enable GPU

 .../devicetree/bindings/gpu/img,powervr-rogue.yaml  | 13 ++++++++++++-
 arch/arm64/boot/dts/renesas/r8a774a1.dtsi           | 10 ++++++++++
 arch/arm64/boot/dts/renesas/r8a774e1.dtsi           | 10 ++++++++++
 arch/arm64/boot/dts/renesas/r8a77951.dtsi           | 10 ++++++++++
 arch/arm64/boot/dts/renesas/r8a77960.dtsi           | 10 ++++++++++
 arch/arm64/boot/dts/renesas/r8a77961.dtsi           | 10 ++++++++++
 6 files changed, 62 insertions(+), 1 deletion(-)

-- 
2.43.0

