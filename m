Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A679213FE2
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jul 2020 21:24:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C0946EBAA;
	Fri,  3 Jul 2020 19:24:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ACE76EBAA
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jul 2020 19:24:25 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id y13so19082662lfe.9
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jul 2020 12:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XBGvCIN3GXKX58JUUV1FDuYM+hwa1/Qtwp0f2OemBCY=;
 b=K9IICVRGPnM/vLm7qIYS+091XhHzwuwEv2iM0HZFTpEZ5edvw3H2hfdis5S37xqq9C
 4jFUiLCK38G9Mq5XRtFtsVp5LzwT+1L9X0ImJuZzF4ICWk7IQFpg5rQHGQTEQVJlNOe9
 jVkjbP+kt3TO9xAtYBm0bMh7AvsmOast771SOLCsUxMBYuoMmeI1db6nHkctLqxdgDUz
 xb1XLVyiS5sAivXeDbzemgF88pyRUQ1EU6vJWLNtUdI+iLViycD7lYxOC428VZeYmdp/
 YFArPBIaH0qtd8AdUleKS1HrHnhO5MWs1NWlE7xgo6460MqSBpwjLlz9iMYzLZt1ChFa
 qmhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=XBGvCIN3GXKX58JUUV1FDuYM+hwa1/Qtwp0f2OemBCY=;
 b=W7F0tK+aucv35Bqb3gAL6bYISRTRsi+WxQ7NNe7mbfDf726SfRc0KnD69khEkZyCw1
 U6iyvpP8OYZPvH74bWvViyh1/2xMeeHK8yYpsoDL2Lqc9YrYUxzsTdk3BjQPJ4/EI0M7
 JcZlpczukovkFfZ+rP7dD4ZwjjdXhXsEOtSxws4TOw9dVb4HepgQvElnwvyOOgdAcuAo
 HQnnuD1Pit7jQhslUU2i3WPFLeJfwdeOZaG15cjf9dFIJDJOJJ0KYidIVbE0JFaVaFlQ
 TDATrlTLOtZqyx8JaBZKP/eNTxjRRSdTO5lDI3mVOSazJGTseuAw8RJ0doPGagEOOZwu
 J+tg==
X-Gm-Message-State: AOAM530eiJb6yJSEKhTjkkbY+4K0BHvydmqQRotI8rCf3r+iHzeJ+UUj
 KsgPDpCZM+dw2Ea+dTcGF/ptUv57aV8=
X-Google-Smtp-Source: ABdhPJy0QRQHJPNx1pt7rfPNjCQjSmhDJS9i22TpLRSDYddVVrW2nBMseuFzWWPxGqOizeCJBFPnug==
X-Received: by 2002:ac2:5c49:: with SMTP id s9mr23301230lfp.90.1593804263252; 
 Fri, 03 Jul 2020 12:24:23 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:4025:a614:1d5c:b7bc])
 by smtp.gmail.com with ESMTPSA id y26sm4411791ljm.46.2020.07.03.12.24.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2020 12:24:22 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v3 0/21] drm/bridge: support chained bridges + panel updates
Date: Fri,  3 Jul 2020 21:23:56 +0200
Message-Id: <20200703192417.372164-1-sam@ravnborg.org>
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
 Martyn Welch <martyn.welch@collabora.co.uk>, Jonas Karlman <jonas@kwiboo.se>,
 Peter Senna Tschudin <peter.senna@gmail.com>,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, kbuild test robot <lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch-set aims to make connector creation optional
and prepare the bridge drivers for use in a chained setup.

The objective is that all bridge drivers shall support a chained setup
connector creation is moved to the display drivers.
This is just one step on this path.

Third iteration of this patchset covers several drivers,
and a few panel adjustments.

The general approach for the bridge drivers:
- Introduce drm_panel_brigde
- Introduce bridge operations
- Make connector creation optional

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

Sam Ravnborg (21):
      drm/panel: add connector type to boe,hv070wsa-100 panel
      drm/panel: panel-simple: add default connector_type
      drm/bridge: tc358764: drop drm_connector_(un)register
      drm/bridge: tc358764: add drm_panel_bridge support
      drm/bridge: tc358764: make connector creation optional
      drm/bridge: tc358767: add drm_panel_bridge support
      drm/bridge: tc358767: add detect bridge operation
      drm/bridge: tc358767: add get_edid bride operation
      drm/bridge: tc358767: make connector creation optional
      drm/bridge: ti-tpd12s015: make connector creation optional
      drm/bridge: parade-ps8622: add drm_panel_bridge support
      drm/bridge: parade-ps8622: make connector creation optional
      drm/bridge: megachips: add helper to create connector
      drm/bridge: megachips: get drm_device from bridge
      drm/bridge: megachips: enable detect bridge operation
      drm/bridge: megachips: add get_edid bridge operation
      drm/bridge: megachips: make connector creation optional
      drm/bridge: nxp-ptn3460: add drm_panel_bridge support
      drm/bridge: nxp-ptn3460: add get_modes bridge operation
      drm/bridge: nxp-ptn3460: make connector creation optional
      drm/bridge: ti-sn65dsi86: add drm_panel_bridge support

 .../drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c   |  92 +++++++++++-------
 drivers/gpu/drm/bridge/nxp-ptn3460.c               | 107 +++++++++------------
 drivers/gpu/drm/bridge/parade-ps8622.c             |  54 +++--------
 drivers/gpu/drm/bridge/tc358764.c                  |  66 +++----------
 drivers/gpu/drm/bridge/tc358767.c                  |  98 +++++++++++--------
 drivers/gpu/drm/bridge/ti-sn65dsi86.c              |  27 +++---
 drivers/gpu/drm/bridge/ti-tpd12s015.c              |   3 -
 drivers/gpu/drm/panel/panel-simple.c               |  13 ++-
 8 files changed, 216 insertions(+), 244 deletions(-)


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
