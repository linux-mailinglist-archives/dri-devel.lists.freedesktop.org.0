Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 825A6132ECC
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2020 19:58:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CAC86E125;
	Tue,  7 Jan 2020 18:58:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 431166E125
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2020 18:58:18 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id D930B2904A1;
 Tue,  7 Jan 2020 18:58:16 +0000 (GMT)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 0/5] drm/bridge: Revert all bridge_state related changes
Date: Tue,  7 Jan 2020 19:58:02 +0100
Message-Id: <20200107185807.606999-1-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.23.0
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
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello

Sorry for the noise. I realize the v1 didn't contain any explanation
about why those commits were reverted and were missing my SoB.

The addition of a bridge_state object introduced a circular dependency
between drm.ko and drm_kms_helper.ko which uncovered a misdesign in how
the whole thing was implemented. Let's revert all patches for now.

Regards,

Boris

P.S.: Daniel, I'd appreciate if you could find some time to look at the
patch series introducing the faulty patches [1]. Those have been
reviewed by Laurent and Neil who didn't seem to notice the problem you
reported (improper core/helper separation and improper use of atomic
helpers from the core). I don't know if Laurent and Neil were aware of
these rule, but I definitely wasn't. I'm pretty sure it's clearly
stated somewhere in the doc, so it's likely all my fault (RTFM).
To sum-up, I'm no denying my responsibility in this mess and I'm fine
taking the blame for not noticing the regression before pushing
those patches to drm-misc-next and for not reading the doc, but this
also proves one thing: no matter how good the doc is, we need reviews
from those who design/drive the subsystem (AKA you) if we want to catch
such design issues before merging things. And I'm not talking about
regressions that can be detected/reported with a good CI infrastructure
here (though we definitely want a good CI too :-)).

[1]https://patchwork.freedesktop.org/series/64915/

Boris Brezillon (5):
  Revert "drm/bridge: Fix a NULL pointer dereference in
    drm_atomic_bridge_chain_check()"
  Revert "drm/bridge: Add the necessary bits to support bus format
    negotiation"
  Revert "drm/bridge: Add an ->atomic_check() hook"
  Revert "drm/bridge: Patch atomic hooks to take a drm_bridge_state"
  Revert "drm/bridge: Add a drm_bridge_state object"

 .../drm/bridge/analogix/analogix_dp_core.c    |  41 +-
 drivers/gpu/drm/drm_atomic.c                  |  39 --
 drivers/gpu/drm/drm_atomic_helper.c           |  32 +-
 drivers/gpu/drm/drm_bridge.c                  | 531 +-----------------
 drivers/gpu/drm/rcar-du/rcar_lvds.c           |   8 +-
 include/drm/drm_atomic.h                      |   3 -
 include/drm/drm_bridge.h                      | 275 +--------
 7 files changed, 49 insertions(+), 880 deletions(-)

-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
