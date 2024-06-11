Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC3A903B5B
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2024 14:04:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56C8D10E5D1;
	Tue, 11 Jun 2024 12:04:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gnDpN+3N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D500210E5D1
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2024 12:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718107478; x=1749643478;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CHdu7/456IEmbdbBmdE6oG/zfWxoeVwrZK6odzAmpls=;
 b=gnDpN+3Nv6Zmc/RYoSAE4Ivs2YnsxDSYalBwKmN/qPLZdEJ6/ixqn/mT
 nXgTd78biD33SXklNHRDL1282ztG7oykqE/gk+py2uNkkRVOvS7LOV1/7
 FXZxwNlP9TYh6RQHrYLiUfaEtj8H5WsRUgg36HbuipZ8dekESlkijeG+4
 DF87NnT5a+GAjzX9DNjhRj380IxeuUfUSfD09zkRcK0CygnL/WJl42T+V
 7bhGH8ZOaLou7V7JglyPn+fcaJDY30U4BbY8CIfMI4AcTtS19ZTn5x8E2
 orEJf0houDIT0LKrQIRRZR2SGJq6FHYny+T0ANRLogZ221V0Yc27jk4e1 w==;
X-CSE-ConnectionGUID: xJ/JdblDR4aoh8hph7vO0Q==
X-CSE-MsgGUID: fejv4HNtTi6RpmLyMp8jYw==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="32296013"
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="32296013"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 05:04:37 -0700
X-CSE-ConnectionGUID: IBXOgEpmQ5WeYW7jShFlNg==
X-CSE-MsgGUID: 1nHogmBkT6GEeOraUYMoIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="39876925"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 05:04:35 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH 00/15] accel/ivpu: Changes for 6.11
Date: Tue, 11 Jun 2024 14:04:17 +0200
Message-ID: <20240611120433.1012423-1-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.45.1
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

Power usage and security fixes along with some cleanup.

Andrzej Kacprowski (1):
  accel/ivpu: Increase autosuspend delay to 100ms on 40xx

Jacek Lawrynowicz (6):
  accel/ivpu: Remove suspend_reschedule_counter
  accel/ivpu: Implement DCT handling
  accel/ivpu: Make selected params read-only
  accel/ivpu: Disable MMU before checking for idle
  accel/ivpu: Remove duplicated debug messages
  accel/ivpu: Remove unused ivpu_rpm_get_if_active()

Maciej Falkowski (2):
  accel/ivpu: Abort jobs of faulty context
  accel/ivpu: Add test mode flag for disabling timeouts

Wachowski, Karol (6):
  accel/ivpu: Add wp0_during_power_up WA
  accel/ivpu: Disable disable_clock_relinquish WA for LNL B0+
  accel/ivpu: Disable clock relinquish for MMIO reset
  accel/ivpu: Update FW BOOT API headers
  accel/ivpu: Make parts of FW image read-only
  accel/ivpu: Synchronize device unbind with recovery work

 drivers/accel/ivpu/ivpu_debugfs.c         |  39 +++++++-
 drivers/accel/ivpu/ivpu_drv.c             |  41 ++++++++-
 drivers/accel/ivpu/ivpu_drv.h             |   6 +-
 drivers/accel/ivpu/ivpu_fw.c              |  31 ++++++-
 drivers/accel/ivpu/ivpu_fw.h              |   2 +
 drivers/accel/ivpu/ivpu_hw.c              |  30 ++++--
 drivers/accel/ivpu/ivpu_hw.h              |   4 +-
 drivers/accel/ivpu/ivpu_hw_btrs.c         |  44 +++++++--
 drivers/accel/ivpu/ivpu_hw_btrs.h         |   6 +-
 drivers/accel/ivpu/ivpu_hw_btrs_lnl_reg.h |  10 +-
 drivers/accel/ivpu/ivpu_ipc.c             |   3 +-
 drivers/accel/ivpu/ivpu_ipc.h             |   4 +-
 drivers/accel/ivpu/ivpu_job.c             |  29 +++++-
 drivers/accel/ivpu/ivpu_job.h             |   4 +-
 drivers/accel/ivpu/ivpu_jsm_msg.c         |  52 +++++++----
 drivers/accel/ivpu/ivpu_jsm_msg.h         |   2 +
 drivers/accel/ivpu/ivpu_mmu.c             |  10 +-
 drivers/accel/ivpu/ivpu_mmu_context.c     |  86 ++++++++++++++++++
 drivers/accel/ivpu/ivpu_mmu_context.h     |   2 +
 drivers/accel/ivpu/ivpu_pm.c              | 106 ++++++++++++++++------
 drivers/accel/ivpu/ivpu_pm.h              |  10 +-
 drivers/accel/ivpu/vpu_boot_api.h         |  16 +++-
 22 files changed, 447 insertions(+), 90 deletions(-)

--
2.45.1
