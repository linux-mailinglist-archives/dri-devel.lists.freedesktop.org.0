Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BABBB34D173
	for <lists+dri-devel@lfdr.de>; Mon, 29 Mar 2021 15:39:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4563E6E439;
	Mon, 29 Mar 2021 13:39:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90AC46E435
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Mar 2021 13:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject
 :Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yl67bH94qy5Pt9ciMAHMDbLn2WQgXsoBoWQ8GOH12R4=; b=uF4MKBQKH3tsmSV6R3miwzTWnR
 c5e8ZijmAt19HeNUmo5G4rr3mF4P/fbM1XiQYXxFUeEgLRT/0daPOH5AHl3tcgThkMvgx+Yg3aQbH
 AHpRgNeAnStrFyuk0auI+pWw7ZPklp4BL/llXqE0Jtu26r2bbcvMKPllCYxZeta7L21RePlHM9nCQ
 zZfZP1jV1Th7ZPCVFb/ppS/2AnFtK7HGd3poHEPcw/XoRWT5cn+TCChMTwS+FOW2/+LcLxIIbpLjz
 RIcyfggNcomd0HbQat6TJwgSu9kWtAzuTVlAD78Ag5kfqdtLURupHK66HxoVFYCB1+HJh910vW7RD
 ugIcyXPg==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236]
 helo=toshino.localdomain)
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <mperttunen@nvidia.com>)
 id 1lQs6n-0000Yj-AG; Mon, 29 Mar 2021 16:39:09 +0300
From: Mikko Perttunen <mperttunen@nvidia.com>
To: thierry.reding@gmail.com,
	jonathanh@nvidia.com
Subject: [PATCH v6 00/10] Fixes and cleanups for Host1x
Date: Mon, 29 Mar 2021 16:38:26 +0300
Message-Id: <20210329133836.2115236-1-mperttunen@nvidia.com>
X-Mailer: git-send-email 2.30.1
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mikko Perttunen <mperttunen@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is the first part of the Host1x/TegraDRM UAPI series, split out
into a separate series that should be easier to merge. It contains
a number of Host1x-related cleanups and fixes. In addition to the
previous series there are a couple of new fixes.

Tested on Jetson TX2.

Thanks,
Mikko

Jon Hunter (1):
  gpu: host1x: Fix Tegra194 syncpt interrupt threshold

Mikko Perttunen (9):
  gpu: host1x: Use different lock classes for each client
  gpu: host1x: Allow syncpoints without associated client
  gpu: host1x: Show number of pending waiters in debugfs
  gpu: host1x: Remove cancelled waiters immediately
  gpu: host1x: Use HW-equivalent syncpoint expiration check
  gpu: host1x: Cleanup and refcounting for syncpoints
  gpu: host1x: Reset max value when freeing a syncpoint
  gpu: host1x: Reserve VBLANK syncpoints at initialization
  gpu: host1x: Assign intr waiter inside lock

 drivers/gpu/drm/tegra/dc.c             |  10 +-
 drivers/gpu/drm/tegra/drm.c            |  14 +-
 drivers/gpu/drm/tegra/gr2d.c           |   4 +-
 drivers/gpu/drm/tegra/gr3d.c           |   4 +-
 drivers/gpu/drm/tegra/vic.c            |   4 +-
 drivers/gpu/host1x/bus.c               |  10 +-
 drivers/gpu/host1x/cdma.c              |  11 +-
 drivers/gpu/host1x/debug.c             |  14 +-
 drivers/gpu/host1x/dev.c               |   6 +
 drivers/gpu/host1x/dev.h               |  13 +-
 drivers/gpu/host1x/hw/cdma_hw.c        |   2 +-
 drivers/gpu/host1x/hw/channel_hw.c     |  10 +-
 drivers/gpu/host1x/hw/debug_hw.c       |   2 +-
 drivers/gpu/host1x/hw/hw_host1x07_vm.h |   2 +-
 drivers/gpu/host1x/intr.c              |  28 +++-
 drivers/gpu/host1x/intr.h              |   4 +-
 drivers/gpu/host1x/job.c               |   5 +-
 drivers/gpu/host1x/syncpt.c            | 202 +++++++++++++++----------
 drivers/gpu/host1x/syncpt.h            |   4 +-
 drivers/staging/media/tegra-video/vi.c |   4 +-
 include/linux/host1x.h                 |  23 ++-
 21 files changed, 235 insertions(+), 141 deletions(-)

-- 
2.30.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
