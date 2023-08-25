Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6687887A6
	for <lists+dri-devel@lfdr.de>; Fri, 25 Aug 2023 14:41:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F18F10E145;
	Fri, 25 Aug 2023 12:41:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81B5110E145
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 12:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692967300; x=1724503300;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xUSjjWnsC0qKUG/iRGC0U7vOEs2u8e48Y2oPrLu4jqI=;
 b=dVdSEfaxzgfylGUjQyYD4BbDO8SwgO4IOMS/07Zw6rUe29id2ANfPbxz
 8gDqzba8EmclpRXTd39wQgfqtKhR5yHworHYcl+XjnELtQPLR44Nyc6zt
 j1Q1lCeoSKeRioVXcaz2YtIcpLBllqIuhVotF8RbuKSQYc3b5VoH3o4AC
 ArXSBln2n2S/iN0h5m6dQmpuaxL9HxU7BCVSlDN6iY4UnmxkP6urZns78
 w35lb2WiLCzMiwnFsVsjmfjao+9ajCQlWudd26BLToP3rSmdkqMLFkkla
 y5bJlX3MEOMZqiaPZvbS1OFnGsy0gytd6lc9+5orgibZmusI/jIlouuXF w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="373573870"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="373573870"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2023 05:41:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="911272233"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="911272233"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2023 05:41:37 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/9] accel/ivpu: Update for -next 2023.08.25
Date: Fri, 25 Aug 2023 14:41:26 +0200
Message-Id: <20230825124135.4086628-1-stanislaw.gruszka@linux.intel.com>
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

Update for -next:
 - various cleanups
 - begin preparation for conversion to GEM SHMEM
 - print information about used workarounds

Jacek Lawrynowicz (4):
  accel/ivpu: Remove duplicated error messages
  accel/ivpu: Move ivpu_fw_load() to ivpu_fw_init()
  accel/ivpu: Add ivpu_bo_vaddr() and ivpu_bo_size()
  accel/ivpu: Move MMU register definitions to ivpu_mmu.c

Karol Wachowski (1):
  accel/ivpu: Initialize context with SSID = 1

Krystian Pradzynski (1):
  accel/ivpu: Move set autosuspend delay to HW specific code

Stanislaw Gruszka (3):
  accel/ivpu: Print information about used workarounds
  accel/ivpu/37xx: Change register rename leftovers
  accel/ivpu/37xx: White space cleanup

 drivers/accel/ivpu/ivpu_drv.c         |  65 +++------
 drivers/accel/ivpu/ivpu_drv.h         |  18 ++-
 drivers/accel/ivpu/ivpu_fw.c          |  26 ++--
 drivers/accel/ivpu/ivpu_fw.h          |   2 +-
 drivers/accel/ivpu/ivpu_fw_log.c      |   6 +-
 drivers/accel/ivpu/ivpu_gem.c         |  30 ++---
 drivers/accel/ivpu/ivpu_gem.h         |  22 ++-
 drivers/accel/ivpu/ivpu_hw_37xx.c     |  75 ++++++-----
 drivers/accel/ivpu/ivpu_hw_37xx_reg.h | 187 +++++++++++---------------
 drivers/accel/ivpu/ivpu_hw_40xx.c     |   7 +
 drivers/accel/ivpu/ivpu_ipc.c         |  19 ++-
 drivers/accel/ivpu/ivpu_job.c         |   8 +-
 drivers/accel/ivpu/ivpu_mmu.c         | 117 ++++++++++------
 drivers/accel/ivpu/ivpu_mmu_context.c |  16 ++-
 drivers/accel/ivpu/ivpu_mmu_context.h |   2 +
 drivers/accel/ivpu/ivpu_pm.c          |  10 +-
 drivers/accel/ivpu/ivpu_pm.h          |   2 +-
 17 files changed, 318 insertions(+), 294 deletions(-)

-- 
2.25.1

