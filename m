Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1DB17D3E45
	for <lists+dri-devel@lfdr.de>; Mon, 23 Oct 2023 19:47:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E24A10E225;
	Mon, 23 Oct 2023 17:47:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 611 seconds by postgrey-1.36 at gabe;
 Mon, 23 Oct 2023 17:47:37 UTC
Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA02C10E121
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 17:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: Message-ID: Date: Subject: Cc:
 To: From; q=dns/txt; s=fe-e1b5cab7be; t=1698083255;
 bh=bw+oJl8a4emYyVVF8XnSKkK9A1IjjDgr8zM8RdIaZMg=;
 b=oyAeEohwVkOLyrto8jhiIqWlLlxSkEv1Hsfr8zSkJJYPlECWCGB6TgMlv2t2n+kjTf8dkLSZL
 ecPduqloiJO5VqLR6Dm+E4Oiy9MD9AkZ7xX8nMCet5DPVE9M/kZLLGmsKFs9qrtmCUasEOdldWU
 glKcS4u2zPNDnJTo5OCQVMK70FeU/WPB8oiXzSmMxnMTwcKMi1H4MEjDHC8t2dqzUm8ngTIfKQI
 lC4qwLyu3kDrFiLyrqL0gtlhUkDQo/s7FXaZpYKUkJ+KQcB2fwgfA7mN0r2SV8Fhf/oaA+veV9H
 2R6d7X3sXd9QGftBjeFahLwOTGZ9VSBUaTJ9L+5zS7sg==
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v5 0/2] drm/rockchip: vop: Add NV15, NV20 and NV30 support
Date: Mon, 23 Oct 2023 17:37:13 +0000
Message-ID: <20231023173718.188102-1-jonas@kwiboo.se>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Report-Abuse-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-ForwardEmail-Version: 0.4.40
X-ForwardEmail-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-ForwardEmail-ID: 6536af54288c5302e78a77d6
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
Cc: Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 Christopher Obbard <chris.obbard@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series add support for displaying 10-bit 4:2:0 and 4:2:2 formats produced
by the Rockchip Video Decoder on RK322X, RK3288, RK3328, RK3368 and RK3399.
Also include 10-bit 4:4:4 support since VOP can support that also.

First patch adds new fourcc 10-bit YUV formats with 4:2:2/4:4:4 sub-sampling.
Second patch adds support for displaying the new fourcc formats.

These patches have been in use by LibreELEC and other distros for the
past 3+ years, hoping they can be merged this time around.

A rough libdrm/modetest patch [2] have been used to validate use of
NV15, NV20 and NV30 formats on RK3288, RK3328 and RK3399 boards.

  modetest -s <connector_id>@<crtc_id>:<mode>-<vrefresh>@<format>

Tinker Board R2.0 (rk3288w):
  modetest -s 50:1920x1080-60@NV15

Rock Pi 4 (rk3399):
  modetest -s 52@44:1920x1080-60@NV15

Rock64 (rk3328):
  modetest -s 42:1920x1080-60@NV15

Changes in v5:
- Use drm_format_info_min_pitch() for correct bpp
- Add missing NV21, NV61 and NV42 formats

Changes in v4:
- Rework RK3328/RK3399 win0/1 data to not affect RK3368

Changes in v3:
- No changes, rebased on next-20230616
- R-B tags was collected

Changes in v2:
- Add NV30 format
- R-B tags was not collected due to NV30 changes

This series is also available at [1] and libdrm/modetest patch at [2].

[1] https://github.com/Kwiboo/linux-rockchip/commits/v6.6-rc7-vop-nv15
[2] https://github.com/Kwiboo/libdrm/commits/nv15

Jonas Karlman (2):
  drm/fourcc: Add NV20 and NV30 YUV formats
  drm/rockchip: vop: Add NV15, NV20 and NV30 support

 drivers/gpu/drm/drm_fourcc.c                |  8 +++
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c | 36 ++++++++---
 drivers/gpu/drm/rockchip/rockchip_drm_vop.h |  1 +
 drivers/gpu/drm/rockchip/rockchip_vop_reg.c | 66 +++++++++++++++++----
 include/uapi/drm/drm_fourcc.h               |  2 +
 5 files changed, 96 insertions(+), 17 deletions(-)

-- 
2.42.0

