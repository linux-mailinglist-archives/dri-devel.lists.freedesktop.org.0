Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C640177E03B
	for <lists+dri-devel@lfdr.de>; Wed, 16 Aug 2023 13:25:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3AE910E347;
	Wed, 16 Aug 2023 11:25:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5629D10E347
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Aug 2023 11:25:47 +0000 (UTC)
Received: from [127.0.1.1] (91-154-35-171.elisa-laajakaista.fi [91.154.35.171])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id A6B842C6;
 Wed, 16 Aug 2023 13:24:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1692185072;
 bh=rDtSbCFK4Vgju6/miaeziwh9ZHaoTMTPVjC2mZd4HU8=;
 h=From:Subject:Date:To:Cc:From;
 b=SZQoKKzkT7/Vd/GP8Usm8CqZBOf52reqeGijecZADVCJDA0BNNnIyDhu0S6iN2aQW
 1YL8Es1yNik8s8XtLbwgNsiR+Qofh2wMgRukoaECozSG66xRr0KJorqN7SidthIN8Q
 +WnSB4wKkWr/fpM/p2qqqfU8iD1lc7VYwaPV13hU=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v2 00/12] drm/bridge: tc358768: Fixes and timings improvements
Date: Wed, 16 Aug 2023 14:25:03 +0300
Message-Id: <20230816-tc358768-v2-0-242b9d5f703a@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABCy3GQC/23MOw7CMBBF0a1EU2PkH45DxT5QCn/GZApiZEcRK
 MreMakp79PT2aBiIaxw7TYouFKlPLeQpw7C5OYHMoqtQXKpuOWaLUFdbG8sE94MesAkUUVo91f
 BRO+Duo+tJ6pLLp9DXsVv/YOsgnEmXIpa+95K428U0dU8++xKPIf8hHHf9y+Lz4wFpwAAAA==
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 =?utf-8?q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>, 
 Maxim Schwalm <maxim.schwalm@gmail.com>, 
 Francesco Dolcini <francesco@dolcini.it>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2032;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=rDtSbCFK4Vgju6/miaeziwh9ZHaoTMTPVjC2mZd4HU8=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBk3LIvVkXSNQGsHo5ZVWtDf5BPepuuKTTJ+aos0
 TDv6F7TDcOJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZNyyLwAKCRD6PaqMvJYe
 9a7lD/9ZXEPLzbglC3iST/q7zVGJgUg29lHDChq27pJ6Y66/M1cyQBvqEMtZgeS8fb8hM+TDVmw
 Qr4NhUMviBl14gzAOzJAgxBxIlIVVBIQIo7jnPixrBt0/fNFlj91fjsZY3rJKdnvz0Vy5qf0chz
 8FZuTjz1wFjJeROo9Pc6SIAh3l+2wUFZVK3DzWr6qbrJJIjjOaMqx0kIC9TZ/OuMzjYEL5gSTYA
 2N0T2hjGj28CeDdOKJchvCwnJy0AjrmnylMUYNvO5/bQZGiF/AG1R0ppWwfrMePwmNmIDiY6Z0s
 76HM7IcAdOCQOvz9+2AI7nBdpn2wg0YgR1QBJzUHECcN0/Ryqay884Q5mpRpVdGafHF/103B7t5
 lNlzp56NxPW8m87xMvDMWFsDBOYQ2npwlh3D/CcXN6S7rPJKZuiI6sDdQS6a08W7eGXdAyCFO7Y
 KEvBefMMVz+HDPh9TLUBkJ1rLZUesLJX5zOSqpMNMsT36Z5nPV7lzrKQd3BDDa/ZhP8zeWXg8n3
 WZu47eOHyxD1dftLqExAdaJ3v7GHcK1I9sZgoyvMXkc0lamPkvYRC3Qt3l1jg8Wa2GajfdzokFO
 +es86uMpop4UvVespYnC40KICgQCSJ29e2TKM/hOofvtdMAk0qJ1gXcL0k5OzKbReOUa6v5Cdod
 2EPwgJO5eVEvVvw==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
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
Cc: Aradhya Bhatia <a-bhatia1@ti.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series contains various fixes and cleanups for TC358768. The target
of this work is to get TC358768 working on Toradex's AM62 based board,
which has the following display pipeline:

AM62 DPI -> TC358768 -> LT8912B -> HDMI connector

The main thing the series does is to improve the DSI HSW, HFP and VSDly
calculations.

 Tomi

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
Changes in v2:
- Add "drm/tegra: rgb: Parameterize V- and H-sync polarities" so that
  Tegra can configure the polarities correctly.
- Add "drm/bridge: tc358768: Default to positive h/v syncs" as we don't
  (necessarily) have the polarities set in the mode.
- Drop "drm/bridge: tc358768: Add DRM_BRIDGE_ATTACH_NO_CONNECTOR
  support" as it's not needed for DRM_BRIDGE_ATTACH_NO_CONNECTOR
  support.
- Link to v1: https://lore.kernel.org/r/20230804-tc358768-v1-0-1afd44b7826b@ideasonboard.com

---
Thierry Reding (1):
      drm/tegra: rgb: Parameterize V- and H-sync polarities

Tomi Valkeinen (11):
      drm/bridge: tc358768: Fix use of uninitialized variable
      drm/bridge: tc358768: Fix bit updates
      drm/bridge: tc358768: Cleanup PLL calculations
      drm/bridge: tc358768: Use struct videomode
      drm/bridge: tc358768: Print logical values, not raw register values
      drm/bridge: tc358768: Use dev for dbg prints, not priv->dev
      drm/bridge: tc358768: Rename dsibclk to hsbyteclk
      drm/bridge: tc358768: Clean up clock period code
      drm/bridge: tc358768: Fix tc358768_ns_to_cnt()
      drm/bridge: tc358768: Attempt to fix DSI horizontal timings
      drm/bridge: tc358768: Default to positive h/v syncs

 drivers/gpu/drm/bridge/tc358768.c | 381 ++++++++++++++++++++++++++++----------
 drivers/gpu/drm/tegra/rgb.c       |  16 +-
 2 files changed, 295 insertions(+), 102 deletions(-)
---
base-commit: 4d49d87b3606369c6e29b9d051892ee1a6fc4e75
change-id: 20230804-tc358768-1b6949ef2e3d

Best regards,
-- 
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

