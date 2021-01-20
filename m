Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B803D2FE56A
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jan 2021 09:52:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B9C86E528;
	Thu, 21 Jan 2021 08:52:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FD226E054
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jan 2021 12:35:52 +0000 (UTC)
From: Paul Cercueil <paul@crapouillou.net>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 0/3] Fixes to bridge/panel and ingenic-drm
Date: Wed, 20 Jan 2021 12:35:32 +0000
Message-Id: <20210120123535.40226-1-paul@crapouillou.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 21 Jan 2021 08:52:31 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Paul Cercueil <paul@crapouillou.net>, od@zcrc.me,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
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

Changes from v1:
- patch [1/3]: the connector is cleaned up only if it was initialized in
  the first place;
- patch [2/3]: use __drmm_simple_encoder_alloc;
- patch [3/3] is unmodified.

Note to linux-stable guys: patch [v2 2/3] will only apply on the current
drm-misc-next branch, to fix it for v5.11 and older kernels, use the V1
of that patch.

Cheers,
-Paul

Paul Cercueil (3):
  drm: bridge/panel: Cleanup connector on bridge detach
  drm/ingenic: Register devm action to cleanup encoders
  drm/ingenic: Fix non-OSD mode

 drivers/gpu/drm/bridge/panel.c            |  6 +++++
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 27 ++++++++++++-----------
 2 files changed, 20 insertions(+), 13 deletions(-)

-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
