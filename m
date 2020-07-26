Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D18F122E284
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jul 2020 22:33:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECCE389C0D;
	Sun, 26 Jul 2020 20:33:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F0BB89C0D
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jul 2020 20:33:33 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id v15so3343200lfg.6
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jul 2020 13:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=enBdScsUkoowW8Ol/ANqJ7dwXF4D6eicT/WJGyzcOzM=;
 b=rdFrSjjSoNIkLs9KHyYhnVT2IVxJQy0S8iSXf215yGgDPr67Vt2JVwB/dQkh58ErW3
 lmKZE/rniKSgi3A7R7UJ3/j4gBRUHqN2DHb7gl/SCL3GSIvT0ZfifXQK0Fj8C9sc4hjY
 5MZu+Go4+7AFkgePRP7AuAMkpM3PRGdcuf68vxSLUagFOmcXo11hCXZCsSrsDHAu0pVi
 OPMJMD8HrXkh8HP4/huzxw6oKfbS5jTdqcXYdpfXJqWXBu5ltgd186H35XULLRDXXktV
 m4XqiW0mbOinVUbBdrFXvN3/PNHBZAKfnORleoKXIzrpZpJD4bGws2e5pbkyTCYpjtoe
 WVvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=enBdScsUkoowW8Ol/ANqJ7dwXF4D6eicT/WJGyzcOzM=;
 b=HvbECzpiu4fzgBPA6H1KSz/NwX6p/YvNbM3yViDDj/FKbLDyC3zp18PYFMMfwV5Msn
 AcTooCT9cclTPff5xgxZTfXWSi40I6JtqOe7tubiCtYmPbId6/uU7lUhW8wGYrzwp+6b
 IzEK+NlwvwA3OAbKJ26IE+R0+hCxM84hwxhzw4jzDm25M06PsFn9QZYWJwxT4a/dI51z
 sy7ZDdtkWEv8/TcrbIfVd18hcX8B5Phfm4WPXR/n6P/hwH24wwo7d+kFY+Ck5to8KWRO
 065GuVPuNh734d5SjHh9OCi5tTRWMBA+c7I7dnomw2V/vPs9OUSnb7nmvdO2vJ7qcYaD
 un3Q==
X-Gm-Message-State: AOAM532LNy7CKsjUYTZvSvAiidcCBCY9CdfpvqAqJGBT63FTZGEv0GIb
 m9cEywrzfDUID0gt2YPq5ZjgwQVuml8=
X-Google-Smtp-Source: ABdhPJzHpUeCi6PsE3ijlQ5BBwTc14tpwpmRVbpY+enXfLuYAUUSxP69D8aAzJbnugOsPAWfKcHydA==
X-Received: by 2002:a19:8095:: with SMTP id
 b143mr10228027lfd.175.1595795611554; 
 Sun, 26 Jul 2020 13:33:31 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:955c:e8d3:9c9d:41af])
 by smtp.gmail.com with ESMTPSA id 203sm2538473lfk.49.2020.07.26.13.33.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jul 2020 13:33:30 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v4 0/15] drm/bridge: support chained bridges + panel updates
Date: Sun, 26 Jul 2020 22:33:09 +0200
Message-Id: <20200726203324.3722593-1-sam@ravnborg.org>
X-Mailer: git-send-email 2.25.1
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Peter Senna Tschudin <peter.senna@gmail.com>,
 Martyn Welch <martyn.welch@collabora.co.uk>, Jonas Karlman <jonas@kwiboo.se>,
 Neil Armstrong <narmstrong@baylibre.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>, kbuild test robot <lkp@intel.com>,
 Sam Ravnborg <sam@ravnborg.org>, Martin Donnelly <martin.donnelly@ge.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The objective is that all bridge drivers shall support a chained setup
connector creation is moved to the display drivers.
This is just one step on this path.

The general approach for the bridge drivers:
- Introduce bridge operations
- Introduce use of panel bridge and make connector creation optional

v4:
  - Dropped patch for ti-sn65dsi86. Await full conversion.
  - Dropped patch for ti-tpd12s015. It was wrong (Laurent)
  - Drop boe,hv070wsa-100 patch, it was applied
  - Combined a few patches to fix connector created twice (Laurent)
  - Fix memory leak in get_edid in several drivers (Laurent)
  - Added patch to validate panel descriptions in panel-simple
  - Set bridge.type in relevant drivers
 
v3:
  - Rebase on top of drm-misc-next
  - Address kbuild test robot feedback
 
v2:
  - Updated bus_flags for boe,hv070wsa-100
  - Collected r-b, but did not apply patches yet
  - On the panel side the panel-simple driver gained a default
    connector type for all the dumb panels that do not
    include so in their description.
    With this change panels always provide a connector type,
    and we have the potential to drop most uses of
    devm_drm_panel_bridge_add_typed().
  - Added conversion of a few more bridge drivers

Patches can build but no run-time testing.
So both test and review feedback appreciated!

	Sam

Sam Ravnborg (15):
      drm/panel: panel-simple: validate panel description
      drm/panel: panel-simple: add default connector_type
      drm/bridge: tc358764: drop drm_connector_(un)register
      drm/bridge: tc358764: add drm_panel_bridge support
      drm/bridge: tc358767: add detect bridge operation
      drm/bridge: tc358767: add get_edid bridge operation
      drm/bridge: tc358767: add drm_panel_bridge support
      drm/bridge: parade-ps8622: add drm_panel_bridge support
      drm/bridge: megachips: add helper to create connector
      drm/bridge: megachips: get drm_device from bridge
      drm/bridge: megachips: enable detect bridge operation
      drm/bridge: megachips: add get_edid bridge operation
      drm/bridge: megachips: make connector creation optional
      drm/bridge: nxp-ptn3460: add get_edid bridge operation
      drm/bridge: nxp-ptn3460: add drm_panel_bridge support

 .../drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c   |  97 +++++++++-------
 drivers/gpu/drm/bridge/nxp-ptn3460.c               | 103 ++++++++---------
 drivers/gpu/drm/bridge/parade-ps8622.c             | 100 +++-------------
 drivers/gpu/drm/bridge/tc358764.c                  | 110 +++---------------
 drivers/gpu/drm/bridge/tc358767.c                  | 126 +++++++++++----------
 drivers/gpu/drm/panel/panel-simple.c               |  48 +++++++-
 6 files changed, 242 insertions(+), 342 deletions(-)


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
