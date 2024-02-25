Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4726186294B
	for <lists+dri-devel@lfdr.de>; Sun, 25 Feb 2024 07:21:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22DEF10E13C;
	Sun, 25 Feb 2024 06:21:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=atomide.com header.i=@atomide.com header.b="B+0drkF1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78D3B10E173
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Feb 2024 06:20:59 +0000 (UTC)
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
 by mail5.25mail.st (Postfix) with ESMTPSA id 670316058D;
 Sun, 25 Feb 2024 06:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
 s=25mailst; t=1708842058;
 bh=+rpL18yqRI3c4hJsKWPVZWuvuh21cVvrTCAU3cBZ4+0=;
 h=From:To:Cc:Subject:Date:From;
 b=B+0drkF15rcz63t4lnja7KW1fJg76X9yTxS2X5FEA9nH6efJytcqR44mACIl86/qx
 gwZhuJd62cxPXACQ2mAJMTHICssme7KEckBO93sZ+ZIHJ3KOAnCq/gepHueikDW4zV
 rvhrLoSv2vAByXrF6whx7ILFu9WiCH07LYGoAk6O2g9f7HYMO8G//SZVgJboXyOfKt
 SfEqtLKBKXixYCKcOJ8uoYJvk3G6OgM5QhrKrCTjX3lHxGY1CyTgCAfXsS67Rgl01V
 N/gcDAyLyYOpgTNC8qMSL8tiosugQ7NrQEwF6yNc8IVWUwa1RllFUDyz0uWS8KAmjH
 lYSZrZ5zRrclQ==
From: Tony Lindgren <tony@atomide.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Simha BN <simhavcs@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Michael Walle <mwalle@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: [PATCH v5 00/10] Improvments for tc358775 with support for tc358765
Date: Sun, 25 Feb 2024 08:19:29 +0200
Message-ID: <20240225062008.33191-1-tony@atomide.com>
X-Mailer: git-send-email 2.43.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

Here are v5 patches to improve tc358775 driver and add support for
tc358765.

Regards,

Tony

Changes since v4:
- Update devicetree binding to move allOf after required block
  as noted by Krzysztof

Changes since v3:
- Fixed dts binding warnings

Changes since v2:

- Only make stby-gpios optional for tc358775, and disallow them for
  tc358765 as noted by Krzysztof

- Added additionalProperties: false for port-base as noted by Krzysztof

- Updated patch description for why there can be a data-lanes property
  for both the DSI host and the bridge as noted by Dmitry

- Improved the old dtb data-lanes warning as suggested by Michael

- Fix warning on casting of_device_get_match_data() as noted by the
  kernel test robot

Changes since v1:

- After a brief offline discussion with Michael, merge series with
  Michael's patch series to make stby gpio and supplies optional as they
  may be hardwired

- Use Michael's better patch for the jeida timings change

- Parse lanes on the bridge side like other bridge devices do, and if not
  found, also parse on the DSI host side and warn

Michael Walle (3):
  dt-bindings: display: bridge: tc358775: make stby gpio optional
  drm/bridge: tc358775: fix support for jeida-18 and jeida-24
  drm/bridge: tc358775: make standby GPIO optional

Tony Lindgren (7):
  dt-bindings: display: bridge: tc358775: Add data-lanes
  dt-bindings: display: bridge: tc358775: Add support for tc358765
  drm/bridge: tc358775: Get bridge data lanes instead of the DSI host
    lanes
  drm/bridge: tc358775: Add burst and low-power modes
  drm/bridge: tc358775: Enable pre_enable_prev_first flag
  drm/bridge: tc358775: Add support for tc358765
  drm/bridge: tc358775: Configure hs_rate and lp_rate

 .../display/bridge/toshiba,tc358775.yaml      | 39 ++++++--
 drivers/gpu/drm/bridge/tc358775.c             | 98 ++++++++++++-------
 2 files changed, 94 insertions(+), 43 deletions(-)

-- 
2.43.1
