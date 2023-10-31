Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 307287DC752
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 08:32:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D252810E40F;
	Tue, 31 Oct 2023 07:32:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DACCE10E40F
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Oct 2023 07:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698737527; x=1730273527;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uMj7vKu7ko4jDtFqlXMC+jB6LQvi2aDa0n5U5u7hwRI=;
 b=Vx4XrNQNY5ztISvYvN/TdA+lX0eqccQpRZkpyiXeO6fqArHYY+sj66z4
 p+mh0S14aO/UIIThT1yh45ppYrqE7CRtlMz1le3s7atLgTSY/l2GhB8lN
 RWwwE2AN9J2nkcvBeYHEVVQLdtWIXx7gjOrHiAjwiwuU75887XSmbbJvY
 9LpHjpYpUOBBlleKHarq5tjsbJpLn1k7xq9QrFYIJ2lWuUE9TieDVx+uM
 LdYxyrnFtzDZ4/8p7uBSLYVGuvmiEmAQiBgRbIkA1yWdXvv4HZ1x82Re6
 mL7h2kS18wAvyBFfLBnoe0Ct9FCPUTic9VWTikbSMSKdIoJoJQYchWUq9 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="419342652"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; d="scan'208";a="419342652"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2023 00:32:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; 
   d="scan'208";a="1769264"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2023 00:31:58 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/4] accel/ivpu: Use GEM shmem
Date: Tue, 31 Oct 2023 08:31:52 +0100
Message-Id: <20231031073156.1301669-1-stanislaw.gruszka@linux.intel.com>
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

Use GEM shmem for buffer management code;

Previously sent as RFC:
https://lore.kernel.org/dri-devel/20230901164842.178654-1-stanislaw.gruszka@linux.intel.com/

Compared to RFC only changelog's were improved.

Jacek Lawrynowicz (4):
  accel/ivpu: Allocate vpu_addr in gem->open() callback
  accel/ivpu: Fix locking in ivpu_bo_remove_all_bos_from_context()
  accel/ivpu: Remove support for uncached buffers
  accel/ivpu: Use GEM shmem helper for all buffers

 drivers/accel/ivpu/Kconfig            |   2 +-
 drivers/accel/ivpu/ivpu_drv.c         |  13 +-
 drivers/accel/ivpu/ivpu_drv.h         |   3 +
 drivers/accel/ivpu/ivpu_fw.c          |   2 +-
 drivers/accel/ivpu/ivpu_gem.c         | 678 ++++++++------------------
 drivers/accel/ivpu/ivpu_gem.h         |  75 +--
 drivers/accel/ivpu/ivpu_job.c         |   8 +-
 drivers/accel/ivpu/ivpu_mmu.c         |   5 +-
 drivers/accel/ivpu/ivpu_mmu_context.c |  38 +-
 drivers/accel/ivpu/ivpu_mmu_context.h |  11 +-
 include/uapi/drm/ivpu_accel.h         |   2 +-
 11 files changed, 266 insertions(+), 571 deletions(-)

-- 
2.25.1

