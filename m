Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37520124BF9
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2019 16:46:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55BD36E7D4;
	Wed, 18 Dec 2019 15:46:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F26B16E7D4
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 15:46:41 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id b19so2332962wmj.4
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 07:46:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MYOvH0H7ibv1Fa6fIrfwGLVBI8jr1NdK0W3XvJiQ49I=;
 b=qn5PFyKE3DoNYy2lkj45emUmQkf0FvtM3hIZDbyNAv6BIrMS9+Q5a7ZjD+eDdyGgK9
 mT6spRojz3xx/PkGBBbORTygEn1qyDpK+cPZx6tIQSa1v1i0UGrUPKV6iEKlgJF33woI
 IFw6VwqFrprWCXoY+k4c+SlRsefk4DsvzbFVTi0C7Z0dftniGS8/Ng4y3c4uLXgW/C2d
 WtwKQcCGci9AlmTR1A9jMn2mGeUY3r+CnLAtvOZsn4huMJeVVpArVJZF5nSCbur9dXWH
 J2V0ywVyLcLjKi3kGUN52iSvmEqwgq1zIV9UKhIHJj6zEJ6L+ntOZersakaqSO2G2TMR
 jEIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MYOvH0H7ibv1Fa6fIrfwGLVBI8jr1NdK0W3XvJiQ49I=;
 b=LQSRH4sU1TjSL/dn24lsBIArXMlXgGSBXS+Zz8ybaDMwqs0wE7lkpqs0NOwiVUfqAx
 +YQAZvHjztD4ANh0O89mpSlIWLEjtd6QF4lItCv8tqOcUPu16pjL818icMJSrV7DOTCV
 ghADoIWmpzPCoieqKiQ2y7FmgOj7IFuzghKpJ8R3ihbw/PfapGIKsfh9ZZPWOhA6BsYS
 t3EtuTw/lJ10UubTAJmzPcEKwotR2HTsTJryOdoHC1ORxZqgBKW1U9yr238LVkAMRIyh
 hZ1e47ZjA+OqY+Xch+jemNBarZ7VQ5vh/pW2e3VH9ZNabm7P66jnPTHFbmEOAstE/bgW
 A4kA==
X-Gm-Message-State: APjAAAV1Rwj1yAFoqc3kizXW0KWI3+2OaJuBkVj/OyjZ22nr/cwsGOnc
 UfL7z4Shy6A6ch+pmT7svC6C9Q==
X-Google-Smtp-Source: APXvYqynj1gVzQckDYJahebhiIXEraU4mydUqgfPMFSx/RvYApGRfUTi0R6a4jGnTRdhXKN439p/7A==
X-Received: by 2002:a1c:4c10:: with SMTP id z16mr4253923wmf.136.1576684000195; 
 Wed, 18 Dec 2019 07:46:40 -0800 (PST)
Received: from bender.baylibre.local
 (lfbn-nic-1-505-157.w90-116.abo.wanadoo.fr. [90.116.92.157])
 by smtp.gmail.com with ESMTPSA id x1sm2891492wru.50.2019.12.18.07.46.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2019 07:46:39 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@siol.net, boris.brezillon@collabora.com
Subject: [PATCH v3 00/10] drm/bridge: dw-hdmi: implement bus-format
 negotiation and YUV420 support
Date: Wed, 18 Dec 2019 16:46:27 +0100
Message-Id: <20191218154637.17509-1-narmstrong@baylibre.com>
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

This patchset is based on Boris's v4 "drm: Add support for bus-format negotiation" at [1]
patchset to implement full bus-format negotiation for DW-HDMI, including YUV420 support and
10/12/16bit YUV444, YUV422 and RGB. The Color Space Converter support is already implemented.

And the counterpart implementation in the Amlogic Meson VPU dw-hdmi glue :
- basic bus-format negotiation to select YUV444 bus-format as DW-HDMI input
- YUV420 support when HDMI2.0 YUV420 modeset

This is a follow-up from the previous attempts :
- "drm/meson: Add support for HDMI2.0 YUV420 4k60" at [2]
- "drm/meson: Add support for HDMI2.0 4k60" at [3]

Changes since RFC v2 at [5]:
- Added fixes from Jonas, who tested and integrated it for Rockchip SoCs
- Added support for 10/12/16bit tmds clock calculation
- Added support for max_bcp connector property
- Adapted to Boris's v4 patchset
- Fixed typos reported by boris

Changes since RFC v1 at [4]:
- Rewrote negociation using the v2 patchset, including full DW-HDMI fmt negociation

[1] https://patchwork.freedesktop.org/patch/msgid/20191203141515.3597631-1-boris.brezillon@collabora.com
[2] https://patchwork.freedesktop.org/patch/msgid/20190520133753.23871-1-narmstrong@baylibre.com
[3] https://patchwork.freedesktop.org/patch/msgid/1549022873-40549-1-git-send-email-narmstrong@baylibre.com
[4] https://patchwork.freedesktop.org/patch/msgid/20190820084109.24616-1-narmstrong@baylibre.com
[5] https://patchwork.freedesktop.org/patch/msgid/ 20190827081425.15011-1-narmstrong@baylibre.com

Jonas Karlman (2):
  drm/bridge: dw-hdmi: set mtmdsclock for deep color
  drm/bridge: dw-hdmi: add max bpc connector property

Neil Armstrong (8):
  drm/bridge: synopsys: dw-hdmi: add bus format negociation
  drm/bridge: synopsys: dw-hdmi: allow ycbcr420 modes for >= 0x200a
  drm/meson: venc: make drm_display_mode const
  drm/meson: meson_dw_hdmi: add bridge and switch to drm_bridge_funcs
  drm/meson: dw-hdmi: stop enforcing input_bus_format
  drm/meson: venc: add support for YUV420 setup
  drm/meson: vclk: add support for YUV420 setup
  drm/meson: Add YUV420 output support

 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 299 +++++++++++++++++++++-
 drivers/gpu/drm/meson/meson_dw_hdmi.c     | 193 +++++++++++---
 drivers/gpu/drm/meson/meson_vclk.c        |  93 +++++--
 drivers/gpu/drm/meson/meson_vclk.h        |   7 +-
 drivers/gpu/drm/meson/meson_venc.c        |  10 +-
 drivers/gpu/drm/meson/meson_venc.h        |   4 +-
 drivers/gpu/drm/meson/meson_venc_cvbs.c   |   3 +-
 include/drm/bridge/dw_hdmi.h              |   1 +
 8 files changed, 538 insertions(+), 72 deletions(-)

-- 
2.22.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
