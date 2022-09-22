Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F295E67F6
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 18:00:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 038EC10EC52;
	Thu, 22 Sep 2022 16:00:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-bc0c.mail.infomaniak.ch (smtp-bc0c.mail.infomaniak.ch
 [IPv6:2001:1600:4:17::bc0c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1A2810EB05
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 12:52:46 +0000 (UTC)
Received: from smtp-3-0000.mail.infomaniak.ch (unknown [10.4.36.107])
 by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4MYFLr1PmfzMpvN6;
 Thu, 22 Sep 2022 14:43:16 +0200 (CEST)
Received: from philippe-pc.toradex.int (unknown [31.10.206.125])
 by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4MYFLq2MC1z3j;
 Thu, 22 Sep 2022 14:43:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=pschenker.ch;
 s=20220412; t=1663850596;
 bh=z7Nwkz4f2nnqgpQRo0kF4EVkY9iPrvs7qh3XJsxIRM0=;
 h=From:To:Cc:Subject:Date:From;
 b=xTlau66oGWLT+Sq2Lsc4CdpYpW+0Mt8ScE0kWcKruIbALEKsW1wFHw2UhslmvNt7/
 nAnArJugwSNn4FAlM97WB/PZ4QEES9YAV5mU98DvmfCBTvb4ODfs3c81iHjzaKeae4
 jK06Kjlvrw1lyLXBXw654NY0/LE+CeEH+GVinj08=
From: Philippe Schenker <dev@pschenker.ch>
To: dri-devel@lists.freedesktop.org,
 Adrien Grassein <adrien.grassein@gmail.com>
Subject: [PATCH 0/4] drm/bridge: lt8912b: Fix corrupt display output due to
 wrong bridge config
Date: Thu, 22 Sep 2022 14:43:02 +0200
Message-Id: <20220922124306.34729-1-dev@pschenker.ch>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 22 Sep 2022 16:00:00 +0000
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Robert Foss <robert.foss@linaro.org>,
 Philippe Schenker <philippe.schenker@toradex.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Philippe Schenker <philippe.schenker@toradex.com>

This patch-set fixes the lt8912b driver that currently does not take
care whether or not the attached display has postiive or negative syncs
and or reports on EDID if it needs HDMI mode or DVI.

This series addresses also an issue where the LVDS startup sequence was
written to the wrong I2C address (the lt8912 has three). This caused
writing into reserved registers and causing an unstable HDMI picture
that manifests itself only sometimes and depending on the monitor with a
flickering and a repeating of going black and coming up again. While at
it move also some sensible comments to the sequence.


Francesco Dolcini (2):
  drm/bridge: lt8912b: fix corrupted image output
  drm/bridge: lt8912b: clarify lvds output status

Philippe Schenker (2):
  drm/bridge: lt8912b: add vsync hsync
  drm/bridge: lt8912b: set hdmi or dvi mode

 drivers/gpu/drm/bridge/lontium-lt8912b.c | 39 +++++++++++++++++-------
 1 file changed, 28 insertions(+), 11 deletions(-)

-- 
2.37.3

