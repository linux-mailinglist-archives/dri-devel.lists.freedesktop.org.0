Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE96454861
	for <lists+dri-devel@lfdr.de>; Wed, 17 Nov 2021 15:19:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A39C76E051;
	Wed, 17 Nov 2021 14:19:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D2406E051
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 14:19:34 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id u18so5029327wrg.5
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 06:19:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lTpj41wlatlvEOOTWdJ86pNPmWOe3YwQkPPBmTMqboc=;
 b=JAdqxb+JXPDYkJ4L3U+qtUjTyDRVILudB+ekQB8hrB4HvMWoAyu17hDsX+UQu98u82
 gf+Q4Z8fa0Q9QcU05jSWkPodrCBusHbS53m0ihmeyl30Q174dCACsgAJzQ9UzbRjSWLa
 Z8pNp9stptvgYUsSLNWBAV81CWmclWaFXbOT8qh7ksthrzQ0CUvZbiDSaR+FqrEbePyD
 pKoRnk95KTO/FWCNxf/Rh+A0vk0+Gn+jqOUrFYppH9UdY1E4Tcr8pA2lV1FM/kgTx1Ct
 9uWZETSRtLCPhqeSGp6VCPVR1Pk9xFQFGfcP+h2Zd0Xn3bFv5lguVDsDPNNHPVwtsUQN
 OzGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lTpj41wlatlvEOOTWdJ86pNPmWOe3YwQkPPBmTMqboc=;
 b=Gt1ItHuR9QKPw6at4BLj+pRf+C0ikZ2yDZGHJ296M1boumXIyS/bJBgsd3FHIPl1X8
 tWms9W7KwrPeOF/lxh2OnuYCheZebmaaM3EfHmb4tl6bRYT67EWuOb4VROsjPgC83L0a
 5LfwXSsAaQqG8J3Kjp6cJBrr2F+TXof1Mmg3e5+vLd97PLu2N2eb2qmq9A7yY9Ka+YCA
 VwTcxzUPRlP8ZlkkiNUygFp9GBtWpAU4itIF6UmrdmUtD9XzKPoFdWZi8+lo4Vs/qFkY
 JJ9otRbR8ivaY48fLBD+rxMUtcb3Kr7aHWzY4fj4ji7PMUKgMPJXFYxbq7H3ueTDL4K/
 NHqw==
X-Gm-Message-State: AOAM531DOfHYCMr8URcjH8Q6YIDCrvz8Vei77Gs7iB/z4q8r0vBIkot+
 9kToh9l8NzR4BUMNaWcHii8ZtQ==
X-Google-Smtp-Source: ABdhPJyYPnJS7Jg9fL1Eq8HVSMnUZMbxBCIgntBBvJCs083MNBAlOxqTGfl9JHof6Nok6LbpWat1WA==
X-Received: by 2002:adf:cd02:: with SMTP id w2mr20112636wrm.269.1637158772243; 
 Wed, 17 Nov 2021 06:19:32 -0800 (PST)
Received: from localhost.localdomain ([2001:861:44c0:66c0:f98b:434c:566c:492d])
 by smtp.gmail.com with ESMTPSA id o10sm33803wri.15.2021.11.17.06.19.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Nov 2021 06:19:31 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: tomba@kernel.org
Subject: [PATCH v7 0/9] drm/omap: Add virtual-planes support
Date: Wed, 17 Nov 2021 15:19:19 +0100
Message-Id: <20211117141928.771082-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4068; h=from:subject;
 bh=IufT1SRAVR2kpm7z++ON7/GsKopsfuGddFs3YpdyjY8=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBhlQ9J5eEPQrJZXDY4Bc+LEhAr/2d0iETg/wocCPiz
 6hqEIzKJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCYZUPSQAKCRB33NvayMhJ0boYD/
 9VoM8FycW/3lBTMY4hPsXUmiRFFsczJBeiEPAXyCOiJpIgXyrM1VSHqYkSbjamfK7h0pM2rLBYssjt
 PA2gp4Pc3XVsRGQe9fgJCzR08253zi9dpMB93OXljmB9HmzTskuoPvf9zRzGl0asi77ozKY7649ZPH
 QLDCEe2kfGxdHI6B+P8MCNXPxNZVlVTxpKomH8T/BdgItHf7Xo4Rs/11qLHQFu3e8U72PXsJwti/Yp
 N8N22OpDYALfyUXM77qxRPrW91l9dnqMeC1sLouyOe+MWZ8TV+F0T+ZdDdZ0wl4e+aHq3MR0dwvmlv
 BNqgenY/2uTL1+B+7z/Ygj7oQ/QaVYFBWotSMusTd14wPWxhyyDhT3SwD4ybvfUu2rXFpjZ5i4cy03
 7rCbbPSXNX2DzUQ2lRD7iy2UZasnEACHnET8Mt+0D2I5S6wtP7CI1S8mAxMjN85I0dTHqVQqxIx29c
 YCbZatkx17/CgiHmZLXyGqTPZIIyq9JZuBalNqUQmxMHoxyKTs8Qc6qzjnFYNDv3s1CLEetUH+XNGV
 gnwrSIn+TA8FoB2+yvwcSupXAW+JHdaMhFmYqHJMe5fLo63fUB9UVwQCTm3ozHz7rY8vEAklUKmRT8
 xtasRzlm4jwywT52qn/iefCKVI/IXaZzFj2chlPWDSHMyV7asVS6BIlwAOKQ==
X-Developer-Key: i=narmstrong@baylibre.com; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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
Cc: khilman@baylibre.com, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Neil Armstrong <narmstrong@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patchset is the follow-up the v4 patchset from Benoit Parrot at [1].

This patch series adds virtual-plane support to omapdrm driver to allow the use
of display wider than 2048 pixels.

In order to do so we introduce the concept of hw_overlay which can then be
dynamically allocated to a plane. When the requested output width exceed what
be supported by one overlay a second is then allocated if possible to handle
display wider then 2048.

This series replaces an earlier series which was DT based and using statically
allocated resources.

This implementation is inspired from the work done in msm/disp/mdp5
driver.

Changes since v6 at [3]:
- Patch 1: Added comment for drm_atomic_helper_check_plane_state, added Reviewed-by
- Patch 2: added Reviewed-by
- Patch 3: added Reviewed-by
- Patch 4: added Reviewed-by
- Patch 5: added Reviewed-by
- Patch 6: No changes
- Patch 7: No changes
- Patch 8: Reformatted omap_plane_atomic_print_state() output for overlays
- Patch 9: Added a comment of the utility of the local omap_atomic_update_normalize_zpos() + atomic_print_state() reformat

Changes since v5 at [2]:
- Patch 1: renamed width/height_fp to max_width/height
- Patch 2: no changes
- Patch 3: removed possible_crtcs stuff,
	added cleanup on failure to allocate,
	removed name in omap_plane struct & plane_id_to_name in omap_plane.c,
	switched all omap_plane->name to plane->name or omap_plane->id
- Patch 4: aligned omap_plane_atomic_duplicate_state the the crtc style
- Patch 5: removed glob_obj_lock & reformated global state declaration in omap_drv.h
- Patch 6: moved drm_atomic_helper_check_plane_state() from atomic_check() in separate commit,
	removed zpos change, updated debug messages to be useful,
	renamed omap_overlay_disable() to omap_overlay_update_state(),
	added useful comments for omap_overlay_assign() & omap_overlay_update_state(),
	simplified omap_overlay_assign() & omap_overlay_update_state() for actual use-cases,
	refactored omap_plane_atomic_check() changes to be cleaner & simpler
- Patch 7: no changes (except possible_crtcs print removal)
- Patch 8: Reformated omap_plane_atomic_check() & omap_overlay_assign() changes to match previous patches layout 

Changes since v4 at [1]:
- rebased on v5.15-rc2
- adapted to drm_atomic_get_new/old_plane_state()
- tested on Beagle-x15
- checked for non-regression on Beagle-x15
- removed unused "state" variable in omap_global_state

[1] https://lore.kernel.org/all/20181012201703.29065-1-bparrot@ti.com/
[2] https://lore.kernel.org/all/20210923070701.145377-1-narmstrong@baylibre.com/
[3] https://lore.kernel.org/all/20211018142842.2511200-1-narmstrong@baylibre.com

Benoit Parrot (8):
  drm/omap: Add ability to check if requested plane modes can be
    supported
  drm/omap: Add ovl checking funcs to dispc_ops
  drm/omap: introduce omap_hw_overlay
  drm/omap: omap_plane: subclass drm_plane_state
  drm/omap: Add global state as a private atomic object
  drm/omap: dynamically assign hw overlays to planes
  drm/omap: add plane_atomic_print_state support
  drm/omap: Add a 'right overlay' to plane state

Neil Armstrong (1):
  drm/omap: add sanity plane state check

 drivers/gpu/drm/omapdrm/Makefile       |   1 +
 drivers/gpu/drm/omapdrm/dss/dispc.c    |  31 ++-
 drivers/gpu/drm/omapdrm/dss/dss.h      |   5 +
 drivers/gpu/drm/omapdrm/omap_drv.c     | 196 +++++++++++++-
 drivers/gpu/drm/omapdrm/omap_drv.h     |  24 ++
 drivers/gpu/drm/omapdrm/omap_fb.c      |  33 ++-
 drivers/gpu/drm/omapdrm/omap_fb.h      |   4 +-
 drivers/gpu/drm/omapdrm/omap_overlay.c | 212 +++++++++++++++
 drivers/gpu/drm/omapdrm/omap_overlay.h |  35 +++
 drivers/gpu/drm/omapdrm/omap_plane.c   | 349 +++++++++++++++++++++----
 drivers/gpu/drm/omapdrm/omap_plane.h   |   1 +
 11 files changed, 832 insertions(+), 59 deletions(-)
 create mode 100644 drivers/gpu/drm/omapdrm/omap_overlay.c
 create mode 100644 drivers/gpu/drm/omapdrm/omap_overlay.h


base-commit: 49c39ec4670a8f045729e3717af2e1a74caf89a5
-- 
2.25.1

