Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB30725E70C
	for <lists+dri-devel@lfdr.de>; Sat,  5 Sep 2020 12:36:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7C2F6ED40;
	Sat,  5 Sep 2020 10:35:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 261866ED3F
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Sep 2020 10:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject
 :Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GL7/Qfpql25Njk17chMypUW1y52LzwxHyj9gF+a0l7c=; b=K3we7NpP+JKWWtc2ERT00mGsBw
 aOIj5Z4hc+5dmehRhqtfV0HVv5H1jy4qVvoRqyJpBKlfGo5B6v43v0ehlOSo+WfHhuYfzbXgvciO0
 DNKOIa2Wx6YqNs4GLnBSYsvgyKwuxzSXkSV8qYQRL+ur4+JnfC3l8/L9p3c86AQgHfJXgIFo8xMmt
 4evz6km5x8uCbuR7jC0OnTbR/157farH9RsBdTjw+oAqrnH4QijFG8EGE2UMnpZDKVhHYZ+hfFf5q
 3sMYSJk/lglHB3VpgvoYhhRrWD+5OUczxh9eMsmXIv8mzSqvtgmyC2q7EQ+tUEMTqI/5/Xi9qwEJm
 s6jjCR5g==;
Received: from dsl-hkibng22-54faab-65.dhcp.inet.fi ([84.250.171.65]
 helo=toshino.localdomain)
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <mperttunen@nvidia.com>)
 id 1kEVXw-0003SS-BW; Sat, 05 Sep 2020 13:35:48 +0300
From: Mikko Perttunen <mperttunen@nvidia.com>
To: thierry.reding@gmail.com, jonathanh@nvidia.com, digetx@gmail.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [RFC PATCH v2 00/17] Host1x/TegraDRM UAPI
Date: Sat,  5 Sep 2020 13:34:03 +0300
Message-Id: <20200905103420.3021852-1-mperttunen@nvidia.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 84.250.171.65
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

here's a second revision of the Host1x/TegraDRM UAPI proposal,
hopefully with most issues from v1 resolved, and also with
an implementation. There are still open issues with the
implementation:

* Relocs are now handled on TegraDRM side instead of Host1x,
  so the firewall is not aware of them, causing submission
  failure where the firewall is enabled. Proposed solution
  is to move the firewall to TegraDRM side, but this hasn't
  been done yet.
* For the new UAPI, syncpoint recovery on job timeout is
  disabled. What this means is that upon job timeout,
  all further jobs using that syncpoint are cancelled,
  and the syncpoint is marked unusable until it is freed.
  However, there is currently a race between the timeout
  handler and job submission, where submission can observe
  the syncpoint in non-locked state and yet the job
  cancellations won't cancel the new job.
* Waiting for DMA reservation fences is not implemented yet.
* I have only tested on Tegra186.

The series consists of three parts:

* The first part contains some fixes and improvements to
  the Host1x driver of more general nature,
* The second part adds the Host1x side UAPI, as well as
  Host1x-side changes needed for the new TegraDRM UAPI,
* The third part adds the new TegraDRM UAPI.

I have written some tests to test the new interface,
see https://github.com/cyndis/uapi-test. Porting of proper
userspace (e.g. opentegra, vdpau-tegra) will come once
there is some degree of conclusion on the UAPI definition.

The series can be also found in
https://github.com/cyndis/linux/commits/work/host1x-uapi.

Older versions:
v1: https://www.spinics.net/lists/linux-tegra/msg51000.html

Thank you,
Mikko

Mikko Perttunen (17):
  gpu: host1x: Use different lock classes for each client
  gpu: host1x: Allow syncpoints without associated client
  gpu: host1x: Show number of pending waiters in debugfs
  gpu: host1x: Remove cancelled waiters immediately
  gpu: host1x: Use HW-equivalent syncpoint expiration check
  gpu: host1x: Cleanup and refcounting for syncpoints
  gpu: host1x: Introduce UAPI header
  gpu: host1x: Implement /dev/host1x device node
  gpu: host1x: DMA fences and userspace fence creation
  WIP: gpu: host1x: Add no-recovery mode
  gpu: host1x: Add job release callback
  gpu: host1x: Add support for syncpoint waits in CDMA pushbuffer
  gpu: host1x: Reset max value when freeing a syncpoint
  drm/tegra: Add new UAPI to header
  drm/tegra: Add power_on/power_off engine callbacks
  drm/tegra: Allocate per-engine channel in core code
  WIP: drm/tegra: Implement new UAPI

 drivers/gpu/drm/tegra/Makefile      |   2 +
 drivers/gpu/drm/tegra/dc.c          |   4 +-
 drivers/gpu/drm/tegra/drm.c         |  75 ++-
 drivers/gpu/drm/tegra/drm.h         |  20 +-
 drivers/gpu/drm/tegra/gr2d.c        |   4 +-
 drivers/gpu/drm/tegra/gr3d.c        |   4 +-
 drivers/gpu/drm/tegra/uapi.h        |  59 +++
 drivers/gpu/drm/tegra/uapi/submit.c | 687 ++++++++++++++++++++++++++++
 drivers/gpu/drm/tegra/uapi/uapi.c   | 328 +++++++++++++
 drivers/gpu/drm/tegra/vic.c         | 131 +++---
 drivers/gpu/host1x/Makefile         |   2 +
 drivers/gpu/host1x/bus.c            |   7 +-
 drivers/gpu/host1x/cdma.c           |  53 ++-
 drivers/gpu/host1x/debug.c          |  14 +-
 drivers/gpu/host1x/dev.c            |   9 +
 drivers/gpu/host1x/dev.h            |  10 +-
 drivers/gpu/host1x/fence.c          | 207 +++++++++
 drivers/gpu/host1x/fence.h          |  15 +
 drivers/gpu/host1x/hw/cdma_hw.c     |   2 +-
 drivers/gpu/host1x/hw/channel_hw.c  |  67 ++-
 drivers/gpu/host1x/hw/debug_hw.c    |  11 +-
 drivers/gpu/host1x/intr.c           |  23 +-
 drivers/gpu/host1x/intr.h           |   2 +
 drivers/gpu/host1x/job.c            |  79 +++-
 drivers/gpu/host1x/job.h            |  14 +
 drivers/gpu/host1x/syncpt.c         | 137 +++---
 drivers/gpu/host1x/syncpt.h         |  21 +-
 drivers/gpu/host1x/uapi.c           | 381 +++++++++++++++
 drivers/gpu/host1x/uapi.h           |  22 +
 include/linux/host1x.h              |  40 +-
 include/uapi/drm/tegra_drm.h        | 431 +++++++++++++++--
 include/uapi/linux/host1x.h         | 134 ++++++
 32 files changed, 2718 insertions(+), 277 deletions(-)
 create mode 100644 drivers/gpu/drm/tegra/uapi.h
 create mode 100644 drivers/gpu/drm/tegra/uapi/submit.c
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
