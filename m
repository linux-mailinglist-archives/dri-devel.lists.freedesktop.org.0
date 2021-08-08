Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 458003E3A89
	for <lists+dri-devel@lfdr.de>; Sun,  8 Aug 2021 15:45:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5592B89A7A;
	Sun,  8 Aug 2021 13:45:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60FCA89A7A
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Aug 2021 13:45:50 +0000 (UTC)
From: Paul Cercueil <paul@crapouillou.net>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>
Cc: "H . Nikolaus Schaller" <hns@goldelico.com>,
 Paul Boddie <paul@boddie.org.uk>, list@opendingux.net,
 Sam Ravnborg <sam@ravnborg.org>, linux-mips@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 0/8] gpu/drm: ingenic-drm: Various improvements
Date: Sun,  8 Aug 2021 15:45:18 +0200
Message-Id: <20210808134526.119198-1-paul@crapouillou.net>
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

Hi,

This patchset rework the ingenic-drm driver, improving the code in
various places.

The most important change is the last patch, which updates the
ingenic-drm driver to use a top-level bridge per output, making use of
the bus format and flag negociation implemented in the bridge code. All
the external bridges are now attached with
DRM_BRIDGE_ATTACH_NO_CONNECTOR.

Cheers,
-Paul

Paul Cercueil (8):
  drm/ingenic: Remove dead code
  drm/ingenic: Simplify code by using hwdescs array
  drm/ingenic: Use standard drm_atomic_helper_commit_tail
  drm/ingenic: Add support for private objects
  drm/ingenic: Move IPU scale settings to private state
  drm/ingenic: Set DMA descriptor chain register when starting CRTC
  drm/ingenic: Upload palette before frame
  drm/ingenic: Attach bridge chain to encoders

 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 287 ++++++++++++++++------
 drivers/gpu/drm/ingenic/ingenic-ipu.c     | 127 ++++++++--
 2 files changed, 322 insertions(+), 92 deletions(-)

-- 
2.30.2

