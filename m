Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F3A178E89
	for <lists+dri-devel@lfdr.de>; Wed,  4 Mar 2020 11:41:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D73F289B38;
	Wed,  4 Mar 2020 10:41:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDBBF89B38
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2020 10:40:59 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id 6so1444020wmi.5
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Mar 2020 02:40:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1JlFcWjm9Vm8w4kQfDp+PBY42FFj0ptnXlZTlbhd8U0=;
 b=K5bocECZ2MoMvdHotvU2FkMzlFRYvnrBwECmMz9wDY0nD1EEclrdprSb786JDFuH3T
 PHbNvBHm2cSf80mp+GyBiuDp+s65ctAK4z7YYLe5VC2WofzM7Bm5AKGQyL7KhLUKwSnD
 R8+eIZ+1Cmau90gQI6k4aoHpxddowX8DWoTrCQ7hDP5AM0cMPoDM8NGpxQ0dJxkc7U84
 hdh6XDpqooNhSf1rcFkWoG6qgTtS8Jzi+/3uTHI8+fz5xVEejSEL9qjl8kDqJFnFocuD
 m/MQt3AEU+o16otTyEzsu3oIUu1DDRBUCEYiLLvhepRbs+Ku+apCI3NLY7t9v2V6pnBb
 g+TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1JlFcWjm9Vm8w4kQfDp+PBY42FFj0ptnXlZTlbhd8U0=;
 b=pFProJNComaZ3UCo/D8+hBuUPlQfGC4AuVDiDuov8WrAVxTlBsu/5HY9tVpse3NrW0
 ontxvF98fQgMWuQZYttbC/+NlFSXvN7ot9gTUuijtkVXjnHPEoiYlB9fOu/M80tRo8Kw
 RlJBfBkuh/oBr/1RsFh9oE4yjLJ6NK+hwWgskxrHvWrXMFJ0WYH/H8A+x2VguoVXvJh8
 ROhrXBS9q1rLFbRVPSOgh6OktS6R4NEB5yhxbnO9UFa7Z1GQXpS3dwo9aBb5zy3YJtQt
 Cs1bIdV00mXRa0gtM2JR3xOUCKzmN/f6VKwr/xVEMkPQk73szG1r8RMOFxqcb3myItyX
 29Lg==
X-Gm-Message-State: ANhLgQ0iU7LU1yDuiJy4acCqe8HKqAkYagW4xLt9GhS+N6c5tgXhmVa2
 zpPee1lCTCdJJJuzwZ7u+cWgKg==
X-Google-Smtp-Source: ADFU+vsyB6OlySe3niT1au0qv1Y8sKilTlKJUImHjCFR50hCR/0l9PUEKsvn/ohlmYaTi1umVyOHOQ==
X-Received: by 2002:a1c:4d3:: with SMTP id 202mr3111868wme.172.1583318458189; 
 Wed, 04 Mar 2020 02:40:58 -0800 (PST)
Received: from bender.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id c14sm24006398wro.36.2020.03.04.02.40.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Mar 2020 02:40:57 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: p.zabel@pengutronix.de, heiko@sntech.de, a.hajda@samsung.com,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@siol.net, boris.brezillon@collabora.com
Subject: [PATCH v5 00/11] drm/bridge: dw-hdmi: implement bus-format
 negotiation and YUV420 support
Date: Wed,  4 Mar 2020 11:40:41 +0100
Message-Id: <20200304104052.17196-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Philippe, Heiko, Maxime, Laurent,

A bad negociation was detected on platforms not implementing a bridge on the
encoder side, which has been fixed in this version.

Could you check it doesn't break your platforms using dw-hdmi ? Especially
patches 1-5.

Thanks,
Neil

This patchset is based on Boris's merged "drm: Add support for bus-format negotiation"
patchset to implement full bus-format negotiation for DW-HDMI, including YUV420 support and
10/12/16bit YUV444, YUV422 and RGB. The Color Space Converter support is already implemented.

And the counterpart implementation in the Amlogic Meson VPU dw-hdmi glue :
- basic bus-format negotiation to select YUV444 bus-format as DW-HDMI input
- YUV420 support when HDMI2.0 YUV420 modeset

This is a follow-up from the previous attempts :
- "drm/meson: Add support for HDMI2.0 YUV420 4k60" at [2]
- "drm/meson: Add support for HDMI2.0 4k60" at [3]

Changes since v4 at [7]:
- Cleaned up patch 1
- Added comment on patch 2
- Added commit message on patch 3
- Fixed invalid negociation when encoder is not yet a bridge (seen on allwinner & rockchip platforms) on patch 4
- Fixed invalid defines, handled MEDIA_BUS_FMT_FIXED and cleaned negociation debug on patch 4
- Added tags on patch 5, 6
- Removed meson_venc_hdmi_encoder_get_out_bus_fmts on patch 7
- Add off-list r-b from Jernej

Changes since v3 at [6]:
- Added "Plug atomic state hooks to the default implementation" on drm/bridge: dw-hdmi
- Also added these atomic state hooks in meson-dw-hdmi in patch 7
- Rebased on latest drm-misc-next including patches 1-7 of [1]

Changes since RFC v2 at [5]:
- Added fixes from Jonas, who tested and integrated it for Rockchip SoCs
- Added support for 10/12/16bit tmds clock calculation
- Added support for max_bcp connector property
- Adapted to Boris's v4 patchset
- Fixed typos reported by boris

Changes since RFC v1 at [4]:
- Rewrote negociation using the v2 patchset, including full DW-HDMI fmt negociation

[2] https://patchwork.freedesktop.org/patch/msgid/20190520133753.23871-1-narmstrong@baylibre.com
[3] https://patchwork.freedesktop.org/patch/msgid/1549022873-40549-1-git-send-email-narmstrong@baylibre.com
[4] https://patchwork.freedesktop.org/patch/msgid/20190820084109.24616-1-narmstrong@baylibre.com
[5] https://patchwork.freedesktop.org/patch/msgid/20190827081425.15011-1-narmstrong@baylibre.com
[6] https://patchwork.freedesktop.org/patch/msgid/20191218154637.17509-1-narmstrong@baylibre.com
[7] https://patchwork.freedesktop.org/patch/msgid/20200206191834.6125-1-narmstrong@baylibre.com

Jonas Karlman (2):
  drm/bridge: dw-hdmi: set mtmdsclock for deep color
  drm/bridge: dw-hdmi: add max bpc connector property

Neil Armstrong (9):
  drm/bridge: dw-hdmi: Plug atomic state hooks to the default
    implementation
  drm/bridge: synopsys: dw-hdmi: add bus format negociation
  drm/bridge: synopsys: dw-hdmi: allow ycbcr420 modes for >= 0x200a
  drm/meson: venc: make drm_display_mode const
  drm/meson: meson_dw_hdmi: add bridge and switch to drm_bridge_funcs
  drm/meson: dw-hdmi: stop enforcing input_bus_format
  drm/meson: venc: add support for YUV420 setup
  drm/meson: vclk: add support for YUV420 setup
  drm/meson: Add YUV420 output support

 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 319 +++++++++++++++++++++-
 drivers/gpu/drm/meson/meson_dw_hdmi.c     | 180 +++++++++---
 drivers/gpu/drm/meson/meson_vclk.c        |  93 +++++--
 drivers/gpu/drm/meson/meson_vclk.h        |   7 +-
 drivers/gpu/drm/meson/meson_venc.c        |  10 +-
 drivers/gpu/drm/meson/meson_venc.h        |   4 +-
 drivers/gpu/drm/meson/meson_venc_cvbs.c   |   6 +-
 include/drm/bridge/dw_hdmi.h              |   1 +
 8 files changed, 544 insertions(+), 76 deletions(-)

-- 
2.22.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
