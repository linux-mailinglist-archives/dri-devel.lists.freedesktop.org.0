Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 816D3B07748
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 15:47:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0165A10E3A2;
	Wed, 16 Jul 2025 13:47:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="RNBtuim0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB84F10E7C3
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jul 2025 13:47:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 27C29A573DC;
 Wed, 16 Jul 2025 13:47:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61E2AC4CEF0;
 Wed, 16 Jul 2025 13:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752673651;
 bh=gmdutkgfIQniQfWFrKfQBe9pqVMRsWjopT4us94/R4s=;
 h=From:To:Cc:Subject:Date:From;
 b=RNBtuim0eJlux30Hn+niJkRGONO1Ri9QpPMfiy8l4+53Xv32m5H2mySpMOT8XuiT/
 vOnly7BJRGqqOGtAhXq1bVQjjlqC1HjtZ5C/C9t2/tD9H+Bk+/Yc8DzTAliBLe8MwV
 SGmJf9t88fBEm9SXPgcZvN47SgOkcCzAkfZmpTbGEdkg7syA4s241wX8a175aGSl5o
 iuZrQCYnN2+mSFoo2ewX+pPwAxijUc6lPjQ2D5QgTW128GICYiy6rIvCbrALfFy7Sj
 XWNtDRn4kgN+xCZ7obi6R6awFR/nQGTlhd01QEC2ngrUAIO+/AmRJA/UmSx4zJNH9y
 cw6PFBkvj68XQ==
From: Michael Walle <mwalle@kernel.org>
To: Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Michael Walle <mwalle@kernel.org>
Subject: [RFC PATCH 0/3] drm/imagination: add AM62P/AM67A/J722S support
Date: Wed, 16 Jul 2025 15:47:14 +0200
Message-Id: <20250716134717.4085567-1-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.5
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

The AM62P and AM67A/J722S feature the same BXS-4 GPU as the J721S2.
In theory, one have to just add the DT node. But it turns out, that
the clock handling is not working. If I understood Nishan Menon
correct, it is working on the J721S2 because there, the clock is
shared, while on the AM62P the GPU has its own PLL.
In the latter case, the '#assigned-clocks' property of the GPU node
doesn't work properly. Linux will try to set the clock frequency
before probing the GPU. The clock handling firmware on the SoC won't
allow that if there is no user for it. To work around that
limitation, set the clock again in the .probe() of the GPU driver
after turning the device on.

This was tested on an AM67A.

Michael Walle (3):
  dt-bindings: gpu: img: Add AM62P SoC specific compatible
  drm/imagination: fix clock control on the J722S
  arm64: dts: ti: add GPU node

 .../devicetree/bindings/gpu/img,powervr-rogue.yaml  |  1 +
 .../boot/dts/ti/k3-am62p-j722s-common-main.dtsi     | 13 +++++++++++++
 drivers/gpu/drm/imagination/pvr_device.c            |  9 +++++++++
 3 files changed, 23 insertions(+)

-- 
2.39.5

