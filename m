Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F4E128E20
	for <lists+dri-devel@lfdr.de>; Sun, 22 Dec 2019 14:29:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F200D6E19A;
	Sun, 22 Dec 2019 13:29:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 856D26E19A
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Dec 2019 13:29:26 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id a6so5379038plm.3
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Dec 2019 05:29:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LWZqcIgXzVjxh5QO9iqiielSvIWzDSYtzjB+sutWZrE=;
 b=XcW78meMsHm0SpaX4VrEA6E4dieJGP37g5HDR1y6DPqGx8T31EVyv2759+sjQgyXBo
 zKe5IZITHQmhWhUS1fJYiGKuBbLHTC+aTNrSnhGFPDyUBXtW44LDMvlK/r/+FOQE8M+R
 XUFHsmUeMKxQlxxdHNGeBujV8sNd+fgHDD5No=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LWZqcIgXzVjxh5QO9iqiielSvIWzDSYtzjB+sutWZrE=;
 b=annbBfLD+avKBGUZwNnzNhqmf2LjZ6REkqyLCzz+UDYpaF9sBToekjfoCvFmHdtbYr
 AkPDJXO7XpQj/V3GH9SNnjxV/UzdfKieg4luCQ1t6OqgXYtn4qPyGEc33Bgtv8fvLzWW
 XPL1IGjWY4lzHptB+nUBdTFztGuugoMLh/9954SSOAy5TUgMAEmZg0X1vlqIf0z9NiZI
 j4Mt/EZ55eOwQ0jUbtitAMjjg86ApqNyfSOj2/H/YjHs2Z93BR4u8IW2WRfe3xK5a3Va
 DHAKB0WzMSI0s5rIqRAfVQkpI+kG32qSMLESSmNAlfQJjq0Ne3eVKR3pxBLesS0SMuQV
 Uuag==
X-Gm-Message-State: APjAAAWDvXgk4kMoqn/8oAQI22qRCtp+hqUn4CpCxJo9MHmBoRrWllRH
 JB0lobAnNqBgMU4QAGNVUeUk5A==
X-Google-Smtp-Source: APXvYqzcNJuWc8MTuhe7A8pH5TeATr3P+P2XEUlqmG+YPokbTDnm72De/WEtbLWj75YMaAAOnnqb+A==
X-Received: by 2002:a17:902:ac97:: with SMTP id
 h23mr26261351plr.237.1577021365959; 
 Sun, 22 Dec 2019 05:29:25 -0800 (PST)
Received: from localhost.localdomain ([49.206.202.16])
 by smtp.gmail.com with ESMTPSA id o2sm12073058pjo.26.2019.12.22.05.29.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Dec 2019 05:29:25 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v14 0/7] drm/sun4i: Allwinner A64 MIPI-DSI support
Date: Sun, 22 Dec 2019 18:52:22 +0530
Message-Id: <20191222132229.30276-1-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sunxi <linux-sunxi@googlegroups.com>,
 Jagan Teki <jagan@amarulasolutions.com>, michael@amarulasolutions.com,
 linux-amarula@amarulasolutions.com, linux-arm-kernel@lists.infradead.org,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is v14 version for Allwinner A64 MIPI-DSI support
and here is the previous version set[1]

Changes for v14:
- drop explicit regmap_exit, clk_put
Changes for v13:
- update dt-bindings for A64
- drop has_mod_clk variant
- use regmap bus clock properly
Changes for v12:
- use enum insted of oneOf+const
- handle bus clock using regmap attach clk
- tested on A64, A33 boards.
Changes for v11:
- fix dt-bindings for dphy
- fix dt-bindings for dsi controller
- add bus clock handling code
- tested on A64, A33 boards.
Changes for v10:
- updated dt-bindings as per .yaml format
- rebased on drm-misc/for-linux-next
Changes for v9:
- moved dsi fixes in separate series on top of A33
- rebase on linux-next
Changes for v8:
- rebased on drm-misc change along with linux-next
- reworked video start delay patch
- tested on 4 different dsi panels
- reworked commit messages
Changes for v7:
- moved vcc-dsi binding to required filed.
- drop quotes on fallback dphy bindings.
- drop min_rate clock pll-mipi patches.
- introduce dclk divider computation as like A64 BSP.
- add A64 DSI quark patches.
- fixed A64 DSI pipeline.
- add proper commit messages.
- collect Merlijn Wajer Tested-by credits.
Changes for v6:
- dropped unneeded changes, patches
- fixed all burst mode patches as per previous version comments
- rebase on master
- update proper commit message
- dropped unneeded comments
- order the patches that make review easy
Changes for v5:
- collect Rob, Acked-by
- droped "Fix VBP size calculation" patch
- updated vblk timing calculation.
- droped techstar, bananapi dsi panel drivers which may require
  bridge or other setup. it's under discussion.
Changes for v4:
- droppoed untested CCU_FEATURE_FIXED_POSTDIV check code in
  nkm min, max rate patches
- create two patches for "Add Allwinner A64 MIPI DSI support"
  one for has_mod_clk quirk and other one for A64 support
- use existing driver code construct for hblk computation
- dropped "Increase hfp packet overhead" patch [2], though BSP added
  this but we have no issues as of now.
  (no issues on panel side w/o this change)
- create separate function for vblk computation 
- enable vcc-dsi regulator in dsi_runtime_resume
- collect Rob, Acked-by
- update MAINTAINERS file for panel drivers
- cleanup commit messages
- fixed checkpatch warnings/errors

[1] https://patchwork.freedesktop.org/series/71131/

Any inputs?
Jagan.

Jagan Teki (7):
  dt-bindings: sun6i-dsi: Document A64 MIPI-DSI controller
  dt-bindings: sun6i-dsi: Add A64 DPHY compatible (w/ A31 fallback)
  drm/sun4i: dsi: Get the mod clock for A31
  drm/sun4i: dsi: Handle bus clock via regmap_mmio_attach_clk
  drm/sun4i: dsi: Add Allwinner A64 MIPI DSI support
  arm64: dts: allwinner: a64: Add MIPI DSI pipeline
  [DO NOT MERGE] arm64: dts: allwinner: bananapi-m64: Enable Bananapi S070WV20-CT16 DSI
    panel

 .../display/allwinner,sun6i-a31-mipi-dsi.yaml | 33 ++++++++++++-
 .../phy/allwinner,sun6i-a31-mipi-dphy.yaml    |  6 ++-
 .../dts/allwinner/sun50i-a64-bananapi-m64.dts | 31 ++++++++++++
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 37 +++++++++++++++
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c        | 47 ++++++++++++++-----
 5 files changed, 140 insertions(+), 14 deletions(-)

-- 
2.18.0.321.gffc6fa0e3

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
