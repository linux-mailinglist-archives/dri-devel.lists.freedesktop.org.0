Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 101CB2DB523
	for <lists+dri-devel@lfdr.de>; Tue, 15 Dec 2020 21:31:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E6FB89C6E;
	Tue, 15 Dec 2020 20:31:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5DD189BA9
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 20:31:38 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9FD5F593;
 Tue, 15 Dec 2020 21:31:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1608064296;
 bh=o76gf0+U8aYc70fxIF0/MNUKYs+COMCe8Yu/zuLcOXQ=;
 h=From:To:Cc:Subject:Date:From;
 b=YP0H6JpUgdlmFX4t+RduKZ8Cs1dTiFfDIuCHlaF4NEpJLvbUXLBlVuc7XG5kfHZr/
 zVfOT439O38/kTKaFbsoo687cbH5QF4Kqibfv7uLDdwF0NosS+Lj5RVpYUCjw8WFPa
 3i5LrFcwSpiftal0csA+DbsN7zWoyx0zA24cEo5A=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/3] Finish constification of drm_driver in DRM core
Date: Tue, 15 Dec 2020 22:31:23 +0200
Message-Id: <20201215203126.10175-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
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
Cc: Edmund Dea <edmund.j.dea@intel.com>, Alexey Brodkin <abrodkin@synopsys.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

This patch series finishes the constification of struct drm_driver in
the DRM core by avoiding modifications to the structure for legacy PCI
drivers. This improves security by avoiding function pointers in
writable memory.

The change turned out to be fairly easy, with preparation in patch 1/3
that moves the only non-const field out of drm_driver, and patch 2/3
that finishes the constification in the DRM core. Patch 3/3 is a
low-hanging fruit that constifies the structure in a few drivers.

The remaining non-const drivers modify the structure internally to set
the num_ioctls fields, and in a few cases, change the driver features.
This will require a bit more work to fix these cases.

Laurent Pinchart (3):
  drm: Move legacy device list out of drm_driver
  drm: Use a const drm_driver for legacy PCI devices
  drm: Constify drm_driver in drivers that don't modify it

 drivers/gpu/drm/arc/arcpgu_drv.c |  2 +-
 drivers/gpu/drm/drm_drv.c        |  4 ----
 drivers/gpu/drm/drm_pci.c        | 33 +++++++++++++++++++++-----------
 drivers/gpu/drm/kmb/kmb_drv.c    |  2 +-
 drivers/gpu/drm/tdfx/tdfx_drv.c  |  2 +-
 include/drm/drm_device.h         | 14 +++-----------
 include/drm/drm_drv.h            |  2 --
 include/drm/drm_legacy.h         | 10 ++++++----
 8 files changed, 34 insertions(+), 35 deletions(-)

-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
