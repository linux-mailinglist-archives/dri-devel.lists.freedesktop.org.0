Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A66301B58
	for <lists+dri-devel@lfdr.de>; Sun, 24 Jan 2021 12:04:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C76AF89E47;
	Sun, 24 Jan 2021 11:04:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 713E189FDB
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Jan 2021 08:56:06 +0000 (UTC)
From: Paul Cercueil <paul@crapouillou.net>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v3 0/4] Fixes to bridge/panel and ingenic-drm
Date: Sun, 24 Jan 2021 08:55:48 +0000
Message-Id: <20210124085552.29146-1-paul@crapouillou.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 24 Jan 2021 11:04:21 +0000
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
Cc: linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>, od@zcrc.me,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Here are three independent fixes. The first one addresses a
use-after-free in bridge/panel.c; the second one addresses a
use-after-free in the ingenic-drm driver; finally, the third one makes
the ingenic-drm driver work again on older Ingenic SoCs.

Changes from v2:
- patch [1/4] added a FIXME.
- patch [2/4] is new. It introduces a drmm_plain_simple_encoder_alloc()
  macro that will be used in patch [3/4].
- patch [3/4] uses the macro introduced in patch [2/4].
- patch [4/4] is unmodified.

Note to linux-stable guys: patch [v2 2/3] will only apply on the current
drm-misc-next branch, to fix it for v5.11 and older kernels, use the V1
of that patch.

Cheers,
-Paul

Paul Cercueil (4):
  drm: bridge/panel: Cleanup connector on bridge detach
  drm/simple_kms_helper: Add macro drmm_plain_simple_encoder_alloc()
  drm/ingenic: Register devm action to cleanup encoders
  drm/ingenic: Fix non-OSD mode

 drivers/gpu/drm/bridge/panel.c            | 12 +++++++++++
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 26 +++++++++++------------
 include/drm/drm_simple_kms_helper.h       | 17 +++++++++++++++
 3 files changed, 42 insertions(+), 13 deletions(-)

-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
