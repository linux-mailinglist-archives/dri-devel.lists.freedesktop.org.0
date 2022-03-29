Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC004EA9AB
	for <lists+dri-devel@lfdr.de>; Tue, 29 Mar 2022 10:50:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7102D89A91;
	Tue, 29 Mar 2022 08:50:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BCC989A91
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Mar 2022 08:50:37 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 8F17D83FAF;
 Tue, 29 Mar 2022 10:50:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1648543836;
 bh=w9cR4M5/uruA/pw3hEW93Q+NpXi167hv413IPQwgXhg=;
 h=From:To:Cc:Subject:Date:From;
 b=mQVqVlx/KxwVm9l371IyccDMKVks7vUE9RTL8cbFX4dxCa8FjdoPcH3TJQiRCNTQ1
 3QCbOFeRcPS99YX7PzekD3NBLaY0ePV9uMs85lXVPIrRNP3gyrKtIL0BzttcBilt3O
 Ft5m+6+MM0xxHeDea3/5o2BLa1U4SM7mdImuBOT/53SfFCOtL4sCXlTmujmdrcXR2k
 aUAAwGqubtbPpjvwRoCpHe1tKlXELHL4fZnZbYZvqVLjFj35uvm3I3eKrS5R59lapQ
 xoQdVNqQcV0LWNR1JXogY87ZQQ0wzkoJEI7+RwpvZL9eejXFhqbeSqoyNHIroIAxM6
 KqV6GbBoKlZ8A==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 00/11] drm/bridge: tc358767: Add DSI-to-DPI mode support
Date: Tue, 29 Mar 2022 10:50:04 +0200
Message-Id: <20220329085015.39159-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <narmstrong@baylibre.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The TC358767/TC358867/TC9595 are all capable of operating in multiple
modes, DPI-to-(e)DP, DSI-to-(e)DP, DSI-to-DPI. Clean up the driver,
switch to atomic ops, and add support for the DSI-to-DPI mode in
addition to already supported DPI-to-(e)DP mode.

Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Maxime Ripard <maxime@cerno.tech>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org

Marek Vasut (11):
  dt-bindings: display: bridge: tc358867: Document DPI output support
  dt-bindings: display: bridge: tc358867: Document DSI data-lanes
    property
  drm/bridge: tc358767: Change tc_ prefix to tc_edp_ for (e)DP specific
    functions
  drm/bridge: tc358767: Convert to atomic ops
  drm/bridge: tc358767: Implement atomic_check callback
  drm/bridge: tc358767: Move (e)DP bridge endpoint parsing into
    dedicated function
  drm/bridge: tc358767: Wrap (e)DP aux I2C registration into
    tc_aux_link_setup()
  drm/bridge: tc358767: Move bridge ops setup into
    tc_probe_edp_bridge_endpoint()
  drm/bridge: tc358767: Detect bridge mode from connected endpoints in
    DT
  drm/bridge: tc358767: Split tc_set_video_mode() into common and (e)DP
    part
  drm/bridge: tc358767: Add DSI-to-DPI mode support

 .../display/bridge/toshiba,tc358767.yaml      |  22 +-
 drivers/gpu/drm/bridge/Kconfig                |   1 +
 drivers/gpu/drm/bridge/tc358767.c             | 583 +++++++++++++++---
 3 files changed, 530 insertions(+), 76 deletions(-)

-- 
2.35.1

