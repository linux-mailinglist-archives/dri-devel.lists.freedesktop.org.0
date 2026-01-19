Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D170D3AA49
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 14:26:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D52F10E459;
	Mon, 19 Jan 2026 13:26:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="jqV9Qe0B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E76D10E459
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 13:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1768829159;
 bh=sqfQDshehqB1xMQVflYLdFdf0im+HgX16id1D1XuhGA=;
 h=From:Subject:Date:To:Cc:From;
 b=jqV9Qe0BxvrMoVgNxRaEVH+SP6bxkzyDX7XEU7WG+LBEtQhMzm17p89B6t0oOvDHv
 9HLQMgom53Ao11Uwjn4+TcyEeCJWdjBnmeLTMiR5clxqJsx5PsMDHAbwg6G7JR7FEu
 CrupbsODbkc3g4qADK7PII3aNL498ji74SGfFrnKfgVBJMwaCp2Au2ItvizHFQmHMI
 QAVGXe2VO7w8m41hqE9yx5RmAepUIkcPf6rcWQbKK5NkCvwGyc4xHmKnqnEIBsMF2P
 o81aKui/k+6TcKa5dZnK2XAJAwe0idtIqRXIAlhf5lqigI8VRZx4wHS3orrMvUlEWF
 ex+aEnWq3g+eA==
Received: from localhost (unknown [82.79.138.145])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id B9AC117E0117;
 Mon, 19 Jan 2026 14:25:59 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: [PATCH v3 0/4] Add HDMI 2.0 support to DW HDMI QP TX
Date: Mon, 19 Jan 2026 15:25:56 +0200
Message-Id: <20260119-dw-hdmi-qp-scramb-v3-0-bd8611730fc1@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOQwbmkC/33NTQrCMBCG4auUrB1Jpr+68h7iIpmkNtA2NZGol
 N7dtOBGxOX7wTwzs2C8NYEds5l5E22wbkyR7zJGnRyvBqxOzZBjKZDnoB/Q6cHCbYJAXg4KSCv
 dqLImag8s3U3etPa5medL6s6Gu/Ov7UUU6/pPiwI4NHnVmrrgQlaHE7m+l8p5uSc3sFWM+FEqL
 sRPBZMiTa2QykZjob+VZVneOnAAbfwAAAA=
X-Change-ID: 20251203-dw-hdmi-qp-scramb-cdbd8b57ccf9
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Diederik de Haas <diederik@cknow-tech.com>, 
 Maud Spierings <maud_spierings@hotmail.com>
X-Mailer: b4 0.14.3
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

This patch series provides the missing support for high TMDS clock ratio
and scrambling to DW HDMI QP TX library, required for handling HDMI 2.0
display modes on RK3576 & RK3588 SoCs.

In order to allow addressing the SCDC status lost on sink disconnects,
it adds an atomic variant of the drm_bridge_funcs.detect callback and a
new drm_bridge_detect_ctx() helper, which is further used in
drm_bridge_connector to switch to ->detect_ctx hook.

Furthermore, it optimizes HPD event handling in dw_hdmi_qp Rockchip
platform driver to run the detect cycle on the affected connector only.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
Changes in v3:
- Used drm_bridge_helper_reset_crtc() helper to reset the display
  pipeline and got rid of some boilerplate code (Maxime)
- Rebased onto latest drm-misc-next
- Link to v2: https://lore.kernel.org/r/20260113-dw-hdmi-qp-scramb-v2-0-ae7b2c58d24d@collabora.com

Changes in v2:
- Collected Tested-by tags from Diederik and Maud
- Rebased onto latest drm-misc-next
- Ensured the recently introduced 'no-hpd' support for dealing with
  unconnected/repurposed/broken HPD pin is limited to HDMI 1.4 rates
- Link to v1: https://lore.kernel.org/r/20251203-dw-hdmi-qp-scramb-v1-0-836fe7401a69@collabora.com

---
Cristian Ciocaltea (4):
      drm/bridge: Add ->detect_ctx hook and drm_bridge_detect_ctx()
      drm/bridge-connector: Switch to using ->detect_ctx hook
      drm/bridge: dw-hdmi-qp: Add high TMDS clock ratio and scrambling support
      drm/rockchip: dw_hdmi_qp: Do not send HPD events for all connectors

 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c   | 167 ++++++++++++++++++++++---
 drivers/gpu/drm/display/drm_bridge_connector.c |  73 +++++------
 drivers/gpu/drm/drm_bridge.c                   |  58 +++++++++
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c |  44 +++----
 include/drm/drm_bridge.h                       |  30 +++++
 5 files changed, 296 insertions(+), 76 deletions(-)
---
base-commit: 1c21f240fbc1e47b94e68abfa2da2c01ed29a74d
change-id: 20251203-dw-hdmi-qp-scramb-cdbd8b57ccf9

