Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF7A168FBE
	for <lists+dri-devel@lfdr.de>; Sat, 22 Feb 2020 16:24:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7F036E05A;
	Sat, 22 Feb 2020 15:24:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B15836E05A
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Feb 2020 15:24:55 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id CD9AC33E;
 Sat, 22 Feb 2020 16:24:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1582385094;
 bh=ilDCvLDvFbjHjXvnAb/eqCXyyqnKAG9hH3M6gIzgmo8=;
 h=From:To:Cc:Subject:Date:From;
 b=gJ79XxoChdjtTKZnFzoYBQ3Q+s4oWoGefewITMYxAYh7x+DlOmSpiurq/EDtycr4j
 owiNfTHQKrEtSr1MT+nSNTOrD/9ic8MN9Is4p9INuBXKjFV2ZPWmuv7AxLe3ESoqMb
 uWUAXYvRCyynvvpUg6a4DT/eQhJRu4sbL6mXXndc=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH/RFC 0/3] Constify drm_driver
Date: Sat, 22 Feb 2020 17:24:27 +0200
Message-Id: <20200222152430.2984-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
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
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

This patch series makes it possible for DRM drivers to declare their
struct drm_driver as a static const. This improves security by avoiding
function pointers in writable memory.

The change turned out to be fairly easy, with preparation in patch 1/3
that moves the only non-const field out of drm_driver, and patch 2/3
that performs the constification in the DRM core. Patch 3/3 is an
example of driver conversion to const drm_driver. If the series is
accepted, I'll write a coccinelle patch that handles all drivers.

Laurent Pinchart (3):
  drm: Move legacy device list out of drm_driver
  drm: Use a const drm_driver through the DRM core
  drm: rcar_du: Constify drm_driver

 drivers/gpu/drm/drm_drv.c                | 10 +++----
 drivers/gpu/drm/drm_pci.c                | 38 +++++++++++++++++-------
 drivers/gpu/drm/drm_vram_helper_common.c |  4 +--
 drivers/gpu/drm/rcar-du/rcar_du_drv.c    |  2 +-
 include/drm/drm_device.h                 |  4 ++-
 include/drm/drm_drv.h                    |  8 ++---
 include/drm/drm_legacy.h                 | 10 ++++---
 include/drm/drm_pci.h                    |  4 +--
 8 files changed, 49 insertions(+), 31 deletions(-)

-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
