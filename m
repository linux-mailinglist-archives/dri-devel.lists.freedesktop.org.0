Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A20C3950F6
	for <lists+dri-devel@lfdr.de>; Sun, 30 May 2021 14:50:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C409A6E3F0;
	Sun, 30 May 2021 12:50:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF4D16E3F0
 for <dri-devel@lists.freedesktop.org>; Sun, 30 May 2021 12:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject
 :Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=h8eukrG8Zq6GuuTeu48GU5aheEI9PkUk7UzW+G2RwYY=; b=lCqXpAZSV4QniMwDFucOAPZ5uQ
 Bxnbo2DmM32tpLkxRAYyFR7HBJ/NE+9Xhsk31FCmfEqkgzoOmtwS4SFS6nOHRmge6Yz/3V1Qk8FI1
 bpt9tfZW2FgewtfciqF8TzMYDJN4h2mNUoCJhO0eya97efJLgUWIOeeysG5uHoyJ3xrzem+7I0qL8
 ewzoWgkjM7+FNc/DFDTldlPi19DcYf0RXf998Z4Znyr+VKqBNhUsW4vrHZjcRS4s8jmpw2WByvcfy
 Cvdb5tv+h2DqFHlGg6tVqeepeuRGFds21l4P3sag1gWgt52skfh8Lxlnlcz+BSJztmPI5gljXiL5W
 B799fxoQ==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236]
 helo=toshino.localdomain)
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <mperttunen@nvidia.com>)
 id 1lnKSP-000775-JO; Sun, 30 May 2021 15:22:17 +0300
From: Mikko Perttunen <mperttunen@nvidia.com>
To: thierry.reding@gmail.com, jonathanh@nvidia.com, digetx@gmail.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH v6 00/14] TegraDRM UAPI
Date: Sun, 30 May 2021 15:21:42 +0300
Message-Id: <20210530122156.3292479-1-mperttunen@nvidia.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: mperttunen@nvidia.com
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mikko Perttunen <mperttunen@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

here's the sixth revision of the TegraDRM UAPI proposal.
The biggest change is the removal of the /dev/host1x device.
Syncpoints are now allocated directly through the TegraDRM
API. Direct userspace fence interfaces have been removed
as there is currently no upstream use for them. Otherwise,
there's a whole lot of smaller fixes and cosmetic improvements.

Some previously discussed items that are not (fully) implemented
here:
- Per-job syncpoint allocation - this is easy to add in afterwards
  in a backwards compatible manner, so I left it out. I have
  prototyped it locally in case we need it.
- Full support for syncobjs - currently only two syncobjs
  are taken, one in and one out, as currently there is no
  userspace that would need more than that, and it is also
  relatively easy to extend.
- Constructing jobs in a non-CDMA pushbuffer. This should not
  cause any UAPI changes and will require further design work.

The following pieces of userspace have been updated to support
this revision of the UAPI:

* vaapi-tegra-driver - https://github.com/cyndis/vaapi-tegra-driver
  Experimental support for MPEG2 and H264 decoding on T210, T186
  and T194.

* xf86-video-opentegra - https://github.com/grate-driver/xf86-video-opentegra
  X11 userspace acceleration driver for Tegra20, Tegra30, and Tegra114.

* grate - https://github.com/grate-driver/grate
  3D rendering testbed for Tegra20, Tegra30, and Tegra114

The series can be also found in
https://github.com/cyndis/linux/commits/work/tegradrm-v6.

Older versions:
v1: https://www.spinics.net/lists/linux-tegra/msg51000.html
v2: https://www.spinics.net/lists/linux-tegra/msg53061.html
v3: https://www.spinics.net/lists/linux-tegra/msg54370.html
v4: https://www.spinics.net/lists/dri-devel/msg279897.html
v5: https://www.spinics.net/lists/linux-tegra/msg56353.html

Thank you,
Mikko

Mikko Perttunen (14):
  gpu: host1x: Add DMA fence implementation
  gpu: host1x: Add no-recovery mode
  gpu: host1x: Add job release callback
  gpu: host1x: Add support for syncpoint waits in CDMA pushbuffer
  drm/tegra: Extract tegra_gem_lookup
  drm/tegra: Add new UAPI to header
  drm/tegra: Boot VIC during runtime PM resume
  drm/tegra: Allocate per-engine channel in core code
  drm/tegra: Implement new UAPI
  drm/tegra: Implement syncpoint management UAPI
  drm/tegra: Implement syncpoint wait UAPI
  drm/tegra: Implement job submission part of new UAPI
  drm/tegra: Add job firewall
  drm/tegra: Bump driver version

 drivers/gpu/drm/tegra/Makefile             |   4 +
 drivers/gpu/drm/tegra/drm.c                |  82 +--
 drivers/gpu/drm/tegra/drm.h                |  12 +
 drivers/gpu/drm/tegra/firewall.c           | 254 ++++++++++
 drivers/gpu/drm/tegra/gather_bo.c          |  81 +++
 drivers/gpu/drm/tegra/gather_bo.h          |  22 +
 drivers/gpu/drm/tegra/gem.c                |  13 +
 drivers/gpu/drm/tegra/gem.h                |   2 +
 drivers/gpu/drm/tegra/submit.c             | 549 +++++++++++++++++++++
 drivers/gpu/drm/tegra/submit.h             |  21 +
 drivers/gpu/drm/tegra/uapi.c               | 374 ++++++++++++++
 drivers/gpu/drm/tegra/uapi.h               |  58 +++
 drivers/gpu/drm/tegra/vic.c                | 112 ++---
 drivers/gpu/host1x/Makefile                |   1 +
 drivers/gpu/host1x/cdma.c                  |  58 ++-
 drivers/gpu/host1x/fence.c                 | 211 ++++++++
 drivers/gpu/host1x/fence.h                 |  13 +
 drivers/gpu/host1x/hw/channel_hw.c         |  87 +++-
 drivers/gpu/host1x/hw/debug_hw.c           |   9 +-
 drivers/gpu/host1x/hw/hw_host1x02_uclass.h |  12 +
 drivers/gpu/host1x/hw/hw_host1x04_uclass.h |  12 +
 drivers/gpu/host1x/hw/hw_host1x05_uclass.h |  12 +
 drivers/gpu/host1x/hw/hw_host1x06_uclass.h |  12 +
 drivers/gpu/host1x/hw/hw_host1x07_uclass.h |  12 +
 drivers/gpu/host1x/intr.c                  |   9 +
 drivers/gpu/host1x/intr.h                  |   2 +
 drivers/gpu/host1x/job.c                   |  77 ++-
 drivers/gpu/host1x/job.h                   |  16 +
 drivers/gpu/host1x/syncpt.c                |   2 +
 drivers/gpu/host1x/syncpt.h                |  12 +
 include/linux/host1x.h                     |  22 +-
 include/uapi/drm/tegra_drm.h               | 414 +++++++++++++++-
 32 files changed, 2408 insertions(+), 169 deletions(-)
 create mode 100644 drivers/gpu/drm/tegra/firewall.c
 create mode 100644 drivers/gpu/drm/tegra/gather_bo.c
 create mode 100644 drivers/gpu/drm/tegra/gather_bo.h
 create mode 100644 drivers/gpu/drm/tegra/submit.c
 create mode 100644 drivers/gpu/drm/tegra/submit.h
 create mode 100644 drivers/gpu/drm/tegra/uapi.c
 create mode 100644 drivers/gpu/drm/tegra/uapi.h
 create mode 100644 drivers/gpu/host1x/fence.c
 create mode 100644 drivers/gpu/host1x/fence.h

-- 
2.30.1

