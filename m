Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE7464C95E
	for <lists+dri-devel@lfdr.de>; Wed, 14 Dec 2022 13:58:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A068410E3D8;
	Wed, 14 Dec 2022 12:58:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31CF710E3D8
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Dec 2022 12:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1671022715; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:references; bh=sGAjnNepMrCgYWT6mOSCtwJtcZMS7t4JmZsZFydq0BA=;
 b=MO8HbhoMBh88PRegjcQluAqZmQBvadj4N0dK2mpqcA3WRr3b7E7bj6iRhEQie1GwHmSZ2e
 8qWKIxc05ATjxJcLZD2wCUCUejfWK5lNXu9wD4RZb3XUnW+zf+k0RMoDB75mfz+9aPPKG+
 I0UPzWivmdBvQFcrI5bRWBpdmpzi0KY=
From: Paul Cercueil <paul@crapouillou.net>
To: Phong LE <ple@baylibre.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 00/10] drm: bridge: it66121: IT6610 support and cleanups
Date: Wed, 14 Dec 2022 13:58:11 +0100
Message-Id: <20221214125821.12489-1-paul@crapouillou.net>
MIME-Version: 1.0
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
Cc: Paul Cercueil <paul@crapouillou.net>, devicetree@vger.kernel.org,
 list@opendingux.net, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

This patchset adds a few cleanups to the IT66121 HDMI chip driver, and
most importantly adds support for the IT6610 chip.

The driver was tested with both chips, but as I only own a HDMI monitor
without speakers, HDMI audio may not be working on the IT6610.

Cheers,
-Paul

Paul Cercueil (10):
  dt-bindings: display: bridge: it66121: Add compatible string for
    IT6610
  drm: bridge: it66121: Use devm_regulator_bulk_get_enable()
  drm: bridge: it66121: Use regmap_noinc_read()
  drm: bridge: it66121: Write AVI infoframe with regmap_bulk_write()
  drm: bridge: it66121: Fix wait for DDC ready
  drm: bridge: it66121: Don't use DDC error IRQs
  drm: bridge: it66121: Don't clear DDC FIFO twice
  drm: bridge: it66121: Set DDC preamble only once before reading EDID
  drm: bridge: it66121: Move VID/PID to new it66121_chip_info structure
  drm: bridge: it66121: Add support for the IT6610

 .../bindings/display/bridge/ite,it66121.yaml  |   4 +-
 drivers/gpu/drm/bridge/ite-it66121.c          | 315 +++++++++---------
 2 files changed, 157 insertions(+), 162 deletions(-)

-- 
2.35.1

