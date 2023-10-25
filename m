Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D45797D6721
	for <lists+dri-devel@lfdr.de>; Wed, 25 Oct 2023 11:43:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAD9910E61F;
	Wed, 25 Oct 2023 09:43:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE12110E61F
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Oct 2023 09:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698227031; x=1729763031;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7p1f21zKn1j7orltfdIcDc72Q2CdCWQxH+IJFRW3Pkw=;
 b=l355JPtk5eEQkUKgYc2qALASfQe/NtcDzxR+lsuwdlhHTsIZhoMU28bK
 OZpeJo9PIKNSzjXpS1RLSmikP22RkRThpeuT9/S+7yBuqjz9nz6Amfa8i
 3EpQPGZC2rbPi08LzSsZWfapxOglrjOJ41Y+5yOAXS1Qtz56XfBjeBJCB
 26fYdX4skrmwxczojhmpJbUtuUmatmobSkqW3rksts7EklBWTspshebnd
 FqE+r/Xdk/EBr3jc66P/hP08DZuv/h99cGGCKEC6fHhhFVNT/ahVnKp2x
 nVpiMljfIyWegS6AZrnlSbteKmLUXcHyywj5E5fZzxSmcIOWYkRgfttbC A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="387090631"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; d="scan'208";a="387090631"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 02:43:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="6477779"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 02:42:07 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 00/11] accel/ivpu: Update to -next 2023-10-25
Date: Wed, 25 Oct 2023 11:43:12 +0200
Message-Id: <20231025094323.989987-1-stanislaw.gruszka@linux.intel.com>
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
 
 - FW api update
 - suspend/resume optimizations 
 - dynamic valtage and freqency mode knob
 - new test modes

Andrzej Kacprowski (5):
  accel/ivpu: Add support for VPU_JOB_FLAGS_NULL_SUBMISSION_MASK
  accel/ivpu: Pass D0i3 residency time to the VPU firmware
  accel/ivpu/40xx: Capture D0i3 entry host and device timestamps
  accel/ivpu: Add support for delayed D0i3 entry message
  accel/ivpu: Wait for VPU to enter idle state after D0i3 entry message

Karol Wachowski (3):
  accel/ivpu: Remove reset from power up sequence
  accel/ivpu: Change test_mode module param to bitmask
  accel/ivpu: Introduce ivpu_ipc_send_receive_active()

Krystian Pradzynski (1):
  accel/ivpu: Update FW API

Stanislaw Gruszka (1):
  accel/ivpu: Remove unneeded drm_driver dectaration

Tomasz Rusinowicz (1):
  accel/ivpu: Add dvfs_mode file to debugfs

 drivers/accel/ivpu/ivpu_debugfs.c     |  28 +++
 drivers/accel/ivpu/ivpu_drv.c         |   6 +-
 drivers/accel/ivpu/ivpu_drv.h         |  10 +-
 drivers/accel/ivpu/ivpu_fw.c          |  70 +++++-
 drivers/accel/ivpu/ivpu_fw.h          |   1 +
 drivers/accel/ivpu/ivpu_hw.h          |   8 +
 drivers/accel/ivpu/ivpu_hw_37xx.c     |  28 ++-
 drivers/accel/ivpu/ivpu_hw_37xx_reg.h |   2 +
 drivers/accel/ivpu/ivpu_hw_40xx.c     |  24 +-
 drivers/accel/ivpu/ivpu_ipc.c         |  33 ++-
 drivers/accel/ivpu/ivpu_ipc.h         |   8 +-
 drivers/accel/ivpu/ivpu_job.c         |   4 +-
 drivers/accel/ivpu/ivpu_jsm_msg.c     |  38 ++++
 drivers/accel/ivpu/ivpu_jsm_msg.h     |   1 +
 drivers/accel/ivpu/ivpu_pm.c          |  11 +-
 drivers/accel/ivpu/vpu_boot_api.h     |  90 +++++++-
 drivers/accel/ivpu/vpu_jsm_api.h      | 309 ++++++++++++++++++++++++--
 17 files changed, 607 insertions(+), 64 deletions(-)

-- 
2.25.1

