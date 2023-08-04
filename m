Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD40F76FEB1
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 12:44:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3CBA10E6CC;
	Fri,  4 Aug 2023 10:44:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4524E10E6CB
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 10:44:39 +0000 (UTC)
Received: from [127.0.1.1] (91-154-35-171.elisa-laajakaista.fi [91.154.35.171])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9E84F2E4;
 Fri,  4 Aug 2023 12:43:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1691145813;
 bh=ec+E8wh10rTaYnjVd1fUIk4t7tXWKF9z3ngkuGu00y0=;
 h=From:Subject:Date:To:Cc:From;
 b=N6qSUObe49EJZwIYLC5D06tzMhL/pIgcZb83zyVK70/4PSj7CgX8QTTiFf+gZby75
 /RxSnMJ7rC21yQqVZis4aWIoUVoNPE94v6IKEUP0PveHpKSwFxvq3W1CvubDWQR6qe
 bNnpLAHHFp7hAcYzWNQHtY+x3tpkjht3g6OootjM=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH 00/11] drm/bridge: tc358768: Fixes and timings improvements
Date: Fri, 04 Aug 2023 13:44:05 +0300
Message-Id: <20230804-tc358768-v1-0-1afd44b7826b@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHXWzGQC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI2MDCwMT3ZJkY1MLczMLXcMkM0sTy9Q0o1TjFCWg8oKi1LTMCrBR0bG1tQC
 Z9mO/WgAAAA==
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 =?utf-8?q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>, 
 Francesco Dolcini <francesco@dolcini.it>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1452;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=ec+E8wh10rTaYnjVd1fUIk4t7tXWKF9z3ngkuGu00y0=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBkzNaNljbbUNDMOkcnzROAG9dzBPvp0n+U4KrJI
 NnEwdQg3SyJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZMzWjQAKCRD6PaqMvJYe
 9YkRD/wO66ceb4plELU/Cr2ySadEAsZDWKtMN85jgtyFNlOen+4smHFqxwqnd9Gz1CaxCjyPLDH
 Ti9FSLn4C5GZDUwFjpvW8ATvgoWRRT9QfCEYoChuPvPGGHbDvm881d/BqqIhWMnu2eQYp61G8yX
 WZgyEg/HFdGeCnlnhP/yQ1SBUwj4WyQkfQzuDiNi/ShtVdOqY+iU2dcYZ28z7tGUPwK+pQCzVa0
 Sgh5IAv1di3DOpU7JyqvrlEtQAPMb8m85LHO66R3m60tJV3DQzTdtBit6poI9LqdkKTMjEl+4N2
 c2DYcg6vHJm8sbQGTR0/utqfMbBqtGuFLDm7Qau/sZszknYcqVFd+IrLkUWAtN+3r5Gf4SFkDKO
 tIL7RJ5bQVExivwdHecyDwxJNnEuVTsyi6UwvdUtNTteT7OjO7PY1EufucNHk4RIxjSTC48qXhE
 wXzUaL0YUEqKlLCRBd8gZsJFraukZkUaKestpTSeBTFvyrEbkmzKbjP1jx40wfNM1euzda1iqfD
 mmaoThjToyFzQHtKOGCDZsvzzi4HMlYf8wwmkeirI2PtS64VeGz57sOtUG4j0ITvOtoWhTTr7Q3
 pvGYtYKV2ZGRHmLppjhzCJJXvuuilgSBOrxqO0DAkLPoHaKC7928BmNzS+MNNZWc44ur2wUn8+o
 e8VJyc4tu4j3Ttg==
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
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Aradhya Bhatia <a-bhatia1@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series contains various fixes and cleanups for TC358768. The target
of this work is to get TC358768 working on Toradex's AM62 based board,
which has the following display pipeline:

AM62 DPI -> TC358768 -> LT8912B -> HDMI connector

The two main things the series does:
- Improves DSI HSW, HFP and VSDly calculations
- Adds DRM_BRIDGE_ATTACH_NO_CONNECTOR support

 Tomi

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
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
      drm/bridge: tc358768: Add DRM_BRIDGE_ATTACH_NO_CONNECTOR support

 drivers/gpu/drm/bridge/tc358768.c | 427 +++++++++++++++++++++++++++-----------
 1 file changed, 309 insertions(+), 118 deletions(-)
---
base-commit: b0e9267d4ccce9be9217337f4bc364ca24cf7f73
change-id: 20230804-tc358768-1b6949ef2e3d

Best regards,
-- 
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

