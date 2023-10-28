Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD0A7DA7E3
	for <lists+dri-devel@lfdr.de>; Sat, 28 Oct 2023 18:00:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8F5110E04E;
	Sat, 28 Oct 2023 15:59:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0352F10E04E
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Oct 2023 15:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698508794; x=1730044794;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cSIk/jpV9kPlKwqxv92sS1nN9jAFfwlfP+oBOzOraIk=;
 b=MnB3+oXXFGW9L6oA3K7XjiXjqbRul1DjuAbUaq+dDa7bbHn9DuWI1e17
 R0OAF0ooYVJ2QwVFSGjYCYERG28grg2SaWjO4w5oVctdRQ9CuhVkfmMWQ
 whCfk+2UT6Nniu20vCpyFmywRDk+PqM/erXrdi41grYYMx3bxVmNUlh55
 5B91nE8RNFY6Cps1UiH0GdBpff22jGEvWBzIRz0s955W5Uy7f6aDUN0ft
 9trJW+36bEx0+7t4rm0onpO4sx+n3XdK2eOAGDfa7USXZrH8V/Xq6QBoJ
 usnMJvOKxe8IEEOTXhepQrPeuTeDVerrlx6tfxQs4A/vcEeZDXfmeWJlE A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10877"; a="452152634"
X-IronPort-AV: E=Sophos;i="6.03,259,1694761200"; d="scan'208";a="452152634"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2023 08:59:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10877"; a="763516381"
X-IronPort-AV: E=Sophos;i="6.03,259,1694761200"; d="scan'208";a="763516381"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2023 08:59:38 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/8] accel/ivpu: Update for -next 2023-10-28
Date: Sat, 28 Oct 2023 17:59:28 +0200
Message-Id: <20231028155936.1183342-1-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Various driver updates:
 - MMU page tables handling optimizations
 - Rebrand to NPU
 - FW profiling frequency knob
 - job done thread suspend handling

This is based on top of previous update:
https://lore.kernel.org/dri-devel/20231028133415.1169975-1-stanislaw.gruszka@linux.intel.com/

Jacek Lawrynowicz (2):
  accel/ivpu: Simplify MMU SYNC command
  accel/ivpu: Rename VPU to NPU in product strings

Karol Wachowski (2):
  accel/ivpu: Print CMDQ errors after consumer timeout
  accel/ivpu: Make DMA allocations for MMU600 write combined

Krystian Pradzynski (1):
  accel/ivpu/40xx: Allow to change profiling frequency

Stanislaw Gruszka (3):
  accel/ivpu: Assure device is off if power up sequence fail
  accel/ivpu: Stop job_done_thread on suspend
  accel/ivpu: Abort pending rx ipc on reset

 drivers/accel/ivpu/Kconfig            |   9 +-
 drivers/accel/ivpu/ivpu_debugfs.c     |  29 +++++++
 drivers/accel/ivpu/ivpu_drv.c         |   4 +-
 drivers/accel/ivpu/ivpu_drv.h         |   2 +-
 drivers/accel/ivpu/ivpu_fw.c          |   7 ++
 drivers/accel/ivpu/ivpu_hw.h          |  12 +++
 drivers/accel/ivpu/ivpu_hw_37xx.c     |  13 +++
 drivers/accel/ivpu/ivpu_hw_40xx.c     |  15 ++++
 drivers/accel/ivpu/ivpu_ipc.c         |  35 +++++++-
 drivers/accel/ivpu/ivpu_ipc.h         |   3 +-
 drivers/accel/ivpu/ivpu_job.c         |  21 ++++-
 drivers/accel/ivpu/ivpu_job.h         |   2 +
 drivers/accel/ivpu/ivpu_mmu.c         |  39 +++++++--
 drivers/accel/ivpu/ivpu_mmu_context.c | 115 ++++++++++++++------------
 drivers/accel/ivpu/ivpu_pm.c          |  30 ++++---
 15 files changed, 249 insertions(+), 87 deletions(-)

-- 
2.25.1

