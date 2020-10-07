Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76FEA2865B1
	for <lists+dri-devel@lfdr.de>; Wed,  7 Oct 2020 19:17:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEF116E977;
	Wed,  7 Oct 2020 17:17:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 450E36E969
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Oct 2020 17:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject
 :Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OWB9oYJ2lEQmBgcL+D6Ju904VEv0gloYK4r0Btw4ZHM=; b=iEdwn1VrQzzfvW3PIJ7jz0Qirc
 goaYVJ5ZzZowUcKlIeXZksb0pEnU4qgaSlCywzOHYqW4ExgpXMuhFtu74Yedi+0jUDX9KiklH9LEC
 OROKshvGZjGnN5b72ItCI8AV0H814Q4nG2GMbnGLHKbVpXf52DJtRYTrMyVaX2LlEbjXE8+nEU1JC
 qExN1/AOtEl1zPKrqX/uCzpnmp5bDm645RRm6R6G8hifQAr4pt4Bv7ffDbryU9wXFuqO8S0mCDwF8
 HOO9RAibV3mpmIZMZAU8BJe/3czsSYsRfuGjZrHYfYp0hm9/kjDJe8++itjKVPvelHPluZhpSOHIl
 nNYpUNUA==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236]
 helo=toshino.localdomain)
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <mperttunen@nvidia.com>)
 id 1kQD3z-0006P9-G3; Wed, 07 Oct 2020 20:17:15 +0300
From: Mikko Perttunen <mperttunen@nvidia.com>
To: thierry.reding@gmail.com, jonathanh@nvidia.com, digetx@gmail.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH v3 00/20] Host1x/TegraDRM UAPI
Date: Wed,  7 Oct 2020 20:12:18 +0300
Message-Id: <20201007171238.1795964-1-mperttunen@nvidia.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
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
Cc: linux-tegra@vger.kernel.org, talho@nvidia.com, bhuntsman@nvidia.com,
 dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

here's the third revision of the Host1x/TegraDRM UAPI proposal.
The open issues from RFCv2 should be resolved now, so I'm
dropping the RFC tag. The series is still only tested with Tegra186
so I'm hoping for people with devices with other chips to test this
out.

The test suite[1] has been updated for the changes in this revision,
and also includes tests for the newly added DMA reservation support.
If there are no further issues with the UAPI definition, I'll
look at porting other userspace next - hoping for some help with that
as well since most of it is for chips I don't have easy access to.

The series can be also found in
https://github.com/cyndis/linux/commits/work/host1x-uapi-v3.

Older versions:
v1: https://www.spinics.net/lists/linux-tegra/msg51000.html
v2: https://www.spinics.net/lists/linux-tegra/msg53061.html

Thank you,
Mikko

[1] https://github.com/cyndis/uapi-test

Mikko Perttunen (20):
  gpu: host1x: Use different lock classes for each client
  gpu: host1x: Allow syncpoints without associated client
  gpu: host1x: Show number of pending waiters in debugfs
  gpu: host1x: Remove cancelled waiters immediately
  gpu: host1x: Use HW-equivalent syncpoint expiration check
  gpu: host1x: Cleanup and refcounting for syncpoints
  gpu: host1x: Introduce UAPI header
  gpu: host1x: Implement /dev/host1x device node
  gpu: host1x: DMA fences and userspace fence creation
  gpu: host1x: Add no-recovery mode
  gpu: host1x: Add job release callback
  gpu: host1x: Add support for syncpoint waits in CDMA pushbuffer
  gpu: host1x: Reset max value when freeing a syncpoint
  gpu: host1x: Reserve VBLANK syncpoints at initialization
  drm/tegra: Add new UAPI to header
  drm/tegra: Boot VIC during runtime PM resume
  drm/tegra: Set resv fields when importing/exporting GEMs
  drm/tegra: Allocate per-engine channel in core code
  drm/tegra: Implement new UAPI
  drm/tegra: Add job firewall

 drivers/gpu/drm/tegra/Makefile         |   4 +
 drivers/gpu/drm/tegra/dc.c             |  10 +-
 drivers/gpu/drm/tegra/drm.c            |  75 ++-
 drivers/gpu/drm/tegra/drm.h            |   9 +
 drivers/gpu/drm/tegra/gem.c            |   2 +
 drivers/gpu/drm/tegra/gr2d.c           |   4 +-
 drivers/gpu/drm/tegra/gr3d.c           |   4 +-
 drivers/gpu/drm/tegra/uapi.h           |  63 +++
 drivers/gpu/drm/tegra/uapi/firewall.c  | 197 +++++++
 drivers/gpu/drm/tegra/uapi/gather_bo.c |  86 ++++
 drivers/gpu/drm/tegra/uapi/gather_bo.h |  22 +
 drivers/gpu/drm/tegra/uapi/submit.c    | 679 +++++++++++++++++++++++++
 drivers/gpu/drm/tegra/uapi/submit.h    |  20 +
 drivers/gpu/drm/tegra/uapi/uapi.c      | 326 ++++++++++++
 drivers/gpu/drm/tegra/vic.c            | 118 ++---
 drivers/gpu/host1x/Makefile            |   2 +
 drivers/gpu/host1x/bus.c               |   7 +-
 drivers/gpu/host1x/cdma.c              |  69 ++-
 drivers/gpu/host1x/debug.c             |  14 +-
 drivers/gpu/host1x/dev.c               |  15 +
 drivers/gpu/host1x/dev.h               |  16 +-
 drivers/gpu/host1x/fence.c             | 207 ++++++++
 drivers/gpu/host1x/fence.h             |  13 +
 drivers/gpu/host1x/hw/cdma_hw.c        |   2 +-
 drivers/gpu/host1x/hw/channel_hw.c     |  63 ++-
 drivers/gpu/host1x/hw/debug_hw.c       |  11 +-
 drivers/gpu/host1x/intr.c              |  23 +-
 drivers/gpu/host1x/intr.h              |   2 +
 drivers/gpu/host1x/job.c               |  79 ++-
 drivers/gpu/host1x/job.h               |  14 +
 drivers/gpu/host1x/syncpt.c            | 185 ++++---
 drivers/gpu/host1x/syncpt.h            |  16 +-
 drivers/gpu/host1x/uapi.c              | 382 ++++++++++++++
 drivers/gpu/host1x/uapi.h              |  22 +
 include/linux/host1x.h                 |  47 +-
 include/uapi/drm/tegra_drm.h           | 420 ++++++++++++++-
 include/uapi/linux/host1x.h            | 134 +++++
 37 files changed, 3076 insertions(+), 286 deletions(-)
 create mode 100644 drivers/gpu/drm/tegra/uapi.h
 create mode 100644 drivers/gpu/drm/tegra/uapi/firewall.c
 create mode 100644 drivers/gpu/drm/tegra/uapi/gather_bo.c
 create mode 100644 drivers/gpu/drm/tegra/uapi/gather_bo.h
 create mode 100644 drivers/gpu/drm/tegra/uapi/submit.c
 create mode 100644 drivers/gpu/drm/tegra/uapi/submit.h
 create mode 100644 drivers/gpu/drm/tegra/uapi/uapi.c
 create mode 100644 drivers/gpu/host1x/fence.c
 create mode 100644 drivers/gpu/host1x/fence.h
 create mode 100644 drivers/gpu/host1x/uapi.c
 create mode 100644 drivers/gpu/host1x/uapi.h
 create mode 100644 include/uapi/linux/host1x.h

-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
