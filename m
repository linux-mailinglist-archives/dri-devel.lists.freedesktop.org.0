Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D28634DEBC
	for <lists+dri-devel@lfdr.de>; Tue, 30 Mar 2021 04:54:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C522D6E81F;
	Tue, 30 Mar 2021 02:54:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E131F6E81E
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Mar 2021 02:54:00 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id g15so11181541pfq.3
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Mar 2021 19:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Pyzpcly5+oL22ifqA9LcP9BWqlXKnbYel2OHd9y5j2k=;
 b=kvMdz9ZBBO2CD3j+PC6tdVvNoYqpgwii81QhShzrYQgX8quKvl6YgQEHZtzMQ4wyZM
 GSfXE8Q2D4AECcXNk+RA7NWljGszHvrR11DgRy0GA0mIXlhx8DYWJMVsKIttJwLT0Es5
 m/5ZuBbBDE3VdZqM4XsmavbD8gkXnU1kozoX0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Pyzpcly5+oL22ifqA9LcP9BWqlXKnbYel2OHd9y5j2k=;
 b=VoxoM49CPLMKyMB1y2jJs7US6p1ymhWhzQ5SUmngSqHbY9gbGBNJ3wDEY9ZRL+5al+
 4ewfvrLN59G0YiPoGeLjieXkFXuIQbC1NqnaR9cm1utwlvLyHky8jS+qXhP7+PRPB3d9
 6HKT+Ub1dGjIE5eCQBbGpbC6hNdm2A8SS2FCJJCeUzFOz/cItPIu5sqaEr6fcNpbXuyj
 ShkhnKVtBRi0//b3GQEE4aXevuIAHbUSTqDEp13IeX4O9Wftlam3MGP/icgIzy01kGaI
 89uCNVAOdQeAvdJMgaLQODF+uG3XkSLTXyb/F4a4A4LMITvsn9pSoFEXH6SHjpgvy0ll
 gVZg==
X-Gm-Message-State: AOAM533Lhe/KFEeW6Jy1YD+F7HGRVsRHEb+d7LtRYJyaUl1JpEtTwf4Z
 BGxEBq9o/J3SLHqm1+q/upr5OA==
X-Google-Smtp-Source: ABdhPJxSUvOXB9xrV/3JE5ZxT6ZkmAYWYDE+3PyLVvxsATrMI2E+/vKGASjep6ASrmsst+pXmFjlqg==
X-Received: by 2002:a63:1e56:: with SMTP id p22mr26342059pgm.375.1617072840452; 
 Mon, 29 Mar 2021 19:54:00 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:f599:1ca7:742d:6b50])
 by smtp.gmail.com with ESMTPSA id t17sm19152706pgk.25.2021.03.29.19.53.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Mar 2021 19:54:00 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v2 00/14] drm: Fix EDID reading on ti-sn65dsi86
Date: Mon, 29 Mar 2021 19:53:31 -0700
Message-Id: <20210330025345.3980086-1-dianders@chromium.org>
X-Mailer: git-send-email 2.31.0.291.g576ba9dcdaf-goog
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
Cc: robdclark@chromium.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>, Steev Klimaszewski <steev@kali.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Robert Foss <robert.foss@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The primary goal of this series is to try to properly fix EDID reading
for eDP panels using the ti-sn65dsi86 bridge.

Previously we had a patch that added EDID reading but it turned out
not to work at bootup. This caused some extra churn at bootup as we
tried (and failed) to read the EDID several times and also ended up
forcing us to use the hardcoded mode at boot. With this patch series I
believe EDID reading is reliable at boot now and we never use the
hardcoded mode.

This series is the logical successor to the 3-part series containing
the patch ("drm/bridge: ti-sn65dsi86: Properly get the EDID, but only
if refclk") [1] though only one actual patch is the same between the
two.

This series starts out with some general / obvious fixes and moves on
to some more specific and maybe controversial ones. I wouldn't object
to some of the earlier ones landing if they look ready.

This patch was developed against drm-misc-next on a
sc7180-trogdor-lazor device. To get things booting for me, I had to
use Stephen's patch [2] to keep from crashing but otherwise all the
patches I needed were here.

[1] https://lore.kernel.org/r/20210304155144.3.I60a7fb23ce4589006bc95c64ab8d15c74b876e68@changeid/
[2] https://lore.kernel.org/r/161706912161.3012082.17313817257247946143@swboyd.mtv.corp.google.com/

Changes in v2:
- Removed 2nd paragraph in commit message.

Douglas Anderson (14):
  drm/bridge: Fix the stop condition of drm_bridge_chain_pre_enable()
  drm/bridge: ti-sn65dsi86: Simplify refclk handling
  drm/bridge: ti-sn65dsi86: Remove incorrectly tagged kerneldoc comment
  drm/bridge: ti-sn65dsi86: Reorder remove()
  drm/bridge: ti-sn65dsi86: Move MIPI detach() / unregister() to
    detach()
  drm/bridge: ti-sn65dsi86: Move drm_panel_unprepare() to post_disable()
  drm/bridge: ti-sn65dsi86: Get rid of the useless detect() function
  drm/bridge: ti-sn65dsi86: Remove extra call:
    drm_connector_update_edid_property()
  drm/edid: Use the cached EDID in drm_get_edid() if eDP
  drm/bridge: ti-sn65dsi86: Stop caching the EDID ourselves
  drm/bridge: ti-sn65dsi86: Power things properly for reading the EDID
  drm/bridge: ti-sn65dsi86: Read the EDID only if refclk was provided
  drm/bridge: ti-sn65dsi86: Print an error if we fallback to panel modes
  drm/panel: panel-simple: Use runtime pm to avoid excessive unprepare /
    prepare

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 125 ++++++++++++++++----------
 drivers/gpu/drm/drm_bridge.c          |   3 +
 drivers/gpu/drm/drm_edid.c            |  32 ++++++-
 drivers/gpu/drm/panel/Kconfig         |   1 +
 drivers/gpu/drm/panel/panel-simple.c  |  93 ++++++++++++++-----
 5 files changed, 184 insertions(+), 70 deletions(-)

-- 
2.31.0.291.g576ba9dcdaf-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
