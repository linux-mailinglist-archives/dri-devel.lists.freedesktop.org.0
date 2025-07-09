Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 581DCAFF36D
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 23:01:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D966F10E85E;
	Wed,  9 Jul 2025 21:01:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="YpYTXG7Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E329210E85F
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jul 2025 21:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1752094888;
 bh=kzWB2OH30J0P4Kym4GxrIAQEztbUTee1hXQn/eF6cEE=;
 h=From:Subject:Date:To:Cc:From;
 b=YpYTXG7Z9N8Udk9MOvejUr3SGFs6JBAW6kumWTARcHqCtYrB4llIhjQE1JqFwOZtZ
 ktyRYvMuNbLtW2HOT6i5P2eVUr1rEGShKuotIUc05/Ar8N6y82rd6LDBxTrElt2DnL
 AW9/ZT3QSR2Qxk/9fbKzrZrq2P0YHeF3up6+VmXnNylRu9PbIHD59ZXphy2TciFnGg
 nutCcjjtuoXxBKkG3oUriOvawnuFQxcTJcMzuh38TCKGIIT9QoCfFjvas6UtcRhk9U
 tdAzcgVqezTjB2Zjjk4hA2kbm/K8TEplyyAtfFemxHe7aLwJpEwmTZni+/d8e3ZmbM
 2AyyUQONWdU3w==
Received: from localhost (unknown [212.93.144.165])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 1308717E0456;
 Wed,  9 Jul 2025 23:01:28 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: [PATCH v2 0/6] Add HDMI CEC support to Rockchip RK3588/RK3576 SoCs
Date: Thu, 10 Jul 2025 00:01:11 +0300
Message-Id: <20250710-rk3588-hdmi-cec-v2-0-f5884be34bc1@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJfYbmgC/2WNQQrDIBRErxL+uhajkUhXvUfJwuhP/TSJQYu0B
 O9eG+iqi1m8gXmzQ8JImODS7BAxU6KwVhCnBqw36x0ZucoguFC855LFh1RaM+8WYhZtjdGTEtJ
 NnYa62iJO9DqMt6Gyp/QM8X0c5Pbb/lzdnyu3jDMxOu1Q95xbd7Vhns0YojnbsMBQSvkAj17gC
 rIAAAA=
X-Change-ID: 20250703-rk3588-hdmi-cec-cea8f523df48
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Algea Cao <algea.cao@rock-chips.com>, 
 Derek Foreman <derek.foreman@collabora.com>
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

The first patch in the series implements the CEC capability of the
Synopsys DesignWare HDMI QP TX controller found in RK3588 & RK3576 Socs.
This is based on the downstream code, but rewritten on top of the CEC
helpers added recently to the DRM HDMI connector framework.

The second patch is needed for RK3576 in order to fixup the timer base
setup according to the actual reference clock rate, which differs
slightly from RK3588.

The following three patches setup platform data with the new information
expected by the HDMI QP transmitter library, while improving the error
handling in the probe path.

Please note the CEC helpers are currently affected by a resource
deallocation issue which may crash the kernel and freeze the system
under certain test conditions.  I've already submitted a patch [1] that
seems to correct the problem.

[1] https://lore.kernel.org/all/20250703-hdmi-cec-helper-unreg-fix-v1-1-7e7b0eb578bb@collabora.com/

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
Changes in v2:
- Collected R-b tag from Dmitry
- Restructured the generic bridge patches to not depend on the
  platform-specific changes and updated cover letter accordingly (Heiko)
- Replaced the loop searching for "ref" clock with clk_get() (Maxime)
- Added new patch "drm/rockchip: dw_hdmi_qp: Improve error handling with
  dev_err_probe()"
- Link to v1: https://lore.kernel.org/r/20250704-rk3588-hdmi-cec-v1-0-2bd8de8700cd@collabora.com

---
Cristian Ciocaltea (6):
      drm/bridge: dw-hdmi-qp: Add CEC support
      drm/bridge: dw-hdmi-qp: Fixup timer base setup
      drm/rockchip: dw_hdmi_qp: Improve error handling with dev_err_probe()
      drm/rockchip: dw_hdmi_qp: Provide CEC IRQ in dw_hdmi_qp_plat_data
      drm/rockchip: dw_hdmi_qp: Provide ref clock rate in dw_hdmi_qp_plat_data
      arm64: defconfig: Enable DW HDMI QP CEC support

 arch/arm64/configs/defconfig                   |   1 +
 drivers/gpu/drm/bridge/synopsys/Kconfig        |   8 +
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c   | 231 ++++++++++++++++++++++++-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.h   |  14 ++
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c |  77 ++++-----
 include/drm/bridge/dw_hdmi_qp.h                |   2 +
 6 files changed, 291 insertions(+), 42 deletions(-)
---
base-commit: 8d6c58332c7a8ba025fcfa76888b6c37dbce9633
change-id: 20250703-rk3588-hdmi-cec-cea8f523df48

