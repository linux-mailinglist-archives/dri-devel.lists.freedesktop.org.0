Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 328B334B6E6
	for <lists+dri-devel@lfdr.de>; Sat, 27 Mar 2021 12:57:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 728066E02A;
	Sat, 27 Mar 2021 11:57:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9EF86E02A
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Mar 2021 11:57:53 +0000 (UTC)
From: Paul Cercueil <paul@crapouillou.net>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Subject: [PATCH v4 0/3] Fixes to bridge/panel and ingenic-drm
Date: Sat, 27 Mar 2021 11:57:39 +0000
Message-Id: <20210327115742.18986-1-paul@crapouillou.net>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>, od@zcrc.me,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

This is the V4 of my patchset that attempts to fix use-after-free errors
in bridge/panel.c and in the ingenic-drm driver.

Changes from v3:
- [1/3]: the code now checks (connector->dev) instead of
  (!!panel_bridge->connector.dev)
- [2/3]: the macro is now called drmm_plain_encoder_alloc(), and moved
  to <drm/drm_encoder.h>. It also takes funcs/name parameters to be more
  similar to drmm_encoder_alloc(), although these parameters can very
  well be NULL.
- [3/3] uses the new macro.

V3 had a 4th patch, which was already applied as it received a
reviewed-by tag and could be applied independently.

Cheers,
-Paul

Paul Cercueil (3):
  drm: bridge/panel: Cleanup connector on bridge detach
  drm/encoder: Add macro drmm_plain_encoder_alloc()
  drm/ingenic: Register devm action to cleanup encoders

 drivers/gpu/drm/bridge/panel.c            | 12 ++++++++++++
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 17 +++++++----------
 include/drm/drm_encoder.h                 | 18 ++++++++++++++++++
 3 files changed, 37 insertions(+), 10 deletions(-)

-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
