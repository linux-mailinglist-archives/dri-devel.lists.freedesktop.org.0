Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4287F801B35
	for <lists+dri-devel@lfdr.de>; Sat,  2 Dec 2023 08:56:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C47510E101;
	Sat,  2 Dec 2023 07:56:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38E9810E101
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Dec 2023 07:56:14 +0000 (UTC)
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
 by mail5.25mail.st (Postfix) with ESMTPSA id 8C2D260406;
 Sat,  2 Dec 2023 07:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
 s=25mailst; t=1701503773;
 bh=eeDVYKNNskoc7bZ6ea4jecMFc83wT7zP11ziZ/DpyS0=;
 h=From:To:Cc:Subject:Date:From;
 b=iFjNZjo1PQuxttEnfnx5sx2rzNkzLtGjjklhtHMU/2EQ+X3EkRwvnkvcmv+M/OdMH
 UQgndHRj3pCQ9nZW4AQqg5q5JAZ2qVW+mspl9lv0KgHtvtZ6+3IhSB0MCwdJmCnWzZ
 WSmYBUkCn3zzn9WDzqN4yR76OEEZH7sl4MkQ6wY03Vr1Mhu+JXRkbnHUkyG7U8aNxD
 UdeYghlevs3zcSZUo1oSpXVT+kw/lzsk3wsYxEhIk47l1+490FAEvVjGpr2DBbYjbe
 kTRs8mmXsVvpjO5+65jkXvjFThHVfBfAxaksTNAD7DcWgrMlRKN0ZbTRMlOaWD4Lxm
 PdWV4hP3bQdbw==
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
Subject: [PATCH v2 00/10] Improvments for tc358775 with support for tc358765
Date: Sat,  2 Dec 2023 09:54:39 +0200
Message-ID: <20231202075514.44474-1-tony@atomide.com>
X-Mailer: git-send-email 2.43.0
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
Cc: Carl Philipp Klemm <philipp@uvos.xyz>, devicetree@vger.kernel.org,
 Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
 Merlijn Wajer <merlijn@wizzup.org>, Sebastian Reichel <sre@kernel.org>,
 dri-devel@lists.freedesktop.org, Pavel Machek <pavel@ucw.cz>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Here's v2 of these changes merged with patches from Michael.

Regards,

Tony

Changes since v1:

- After a brief offline discussion with Michael, merge series with
  Michael's patch series to make stby gpio and supplies optional as they
  may be hardwired

- Use Michael's better patch for the jeida timings change

- Parse lanes on the bridge side like other bridge devices do, and if not
  found, also parse on the DSI host side and warn

Michael Walle (3):
  dt-bindings: display: bridge: tc358775: make stby gpio and vdd
    supplies optional
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

 .../display/bridge/toshiba,tc358775.yaml      | 30 +++++--
 drivers/gpu/drm/bridge/tc358775.c             | 90 +++++++++++--------
 2 files changed, 75 insertions(+), 45 deletions(-)

-- 
2.43.0
