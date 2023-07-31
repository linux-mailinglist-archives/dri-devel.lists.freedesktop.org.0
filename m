Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EFCC1769BFC
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jul 2023 18:13:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 617B910E2BD;
	Mon, 31 Jul 2023 16:13:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (unknown [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F87110E2BD
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jul 2023 16:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690819983; x=1722355983;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=apcwDBqftbn7R5DWTI/WWTefjNGC4lmLRoy3ItTcqD0=;
 b=cHsrDE9RPg4lVUXtEfqwhp/ZmXUQaTi8TB+CxztvcuvF3PPraUeEM1Tx
 51v/IUrD0tseVLDc+spEVznunHzA5gJesaz4UbSdqszjiqF3nGpykgePm
 Q9TF7B3whsMKUGc8F+2Ah5WTswrdeW06nmcPXLrfGRlsq3iT6fyQ9WY/v
 RTv9pRp6rG7LlJ9vLZlqPEha1UOdhrBGsIGJbvHxzZOvM7W1kSLga7Tde
 N5M6i0GgvG3fX9pRU3eii/WICK+nn9+x1JZAgmM4sGzusx9crETIeoJCZ
 0gOdNNnNPenqWLUqz8aXdQAw3utpwCr9gty9XDDBBkllPje8yYkxYpRdt g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="400007832"
X-IronPort-AV: E=Sophos;i="6.01,244,1684825200"; d="scan'208";a="400007832"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 09:13:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="818396137"
X-IronPort-AV: E=Sophos;i="6.01,244,1684825200"; d="scan'208";a="818396137"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 09:13:00 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/6] accel/ivpu: Refactor driver code and support new hardware
Date: Mon, 31 Jul 2023 18:12:52 +0200
Message-Id: <20230731161258.2987564-1-stanislaw.gruszka@linux.intel.com>
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
 Oded Gabbay <ogabbay@kernel.org>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Various code additions and refactoring in order to add support for VPU IP 4,
which be included in Intel Lunar Lake CPUs.

Jacek Lawrynowicz (3):
  accel/ivpu: Rename sources to use generation based names
  accel/ivpu: Use generation based function and registers names
  accel/ivpu: Switch to generation based FW names

Karol Wachowski (1):
  accel/ivpu: Refactor memory ranges logic

Stanislaw Gruszka (2):
  accel/ivpu: Add param ioctl to identify capabilities
  accel/ivpu: Add initial support for VPU 4

 drivers/accel/ivpu/Makefile                   |    3 +-
 drivers/accel/ivpu/ivpu_drv.c                 |   35 +-
 drivers/accel/ivpu/ivpu_drv.h                 |   23 +-
 drivers/accel/ivpu/ivpu_fw.c                  |   41 +-
 drivers/accel/ivpu/ivpu_gem.c                 |   10 +-
 drivers/accel/ivpu/ivpu_hw.h                  |   12 +-
 .../ivpu/{ivpu_hw_mtl.c => ivpu_hw_37xx.c}    |  485 ++++---
 drivers/accel/ivpu/ivpu_hw_37xx_reg.h         |  281 ++++
 drivers/accel/ivpu/ivpu_hw_40xx.c             | 1178 +++++++++++++++++
 drivers/accel/ivpu/ivpu_hw_40xx_reg.h         |  267 ++++
 drivers/accel/ivpu/ivpu_hw_mtl_reg.h          |  281 ----
 drivers/accel/ivpu/ivpu_mmu.c                 |   84 +-
 drivers/accel/ivpu/ivpu_mmu_context.c         |    8 +-
 include/uapi/drm/ivpu_accel.h                 |    9 +-
 14 files changed, 2109 insertions(+), 608 deletions(-)
 rename drivers/accel/ivpu/{ivpu_hw_mtl.c => ivpu_hw_37xx.c} (52%)
 create mode 100644 drivers/accel/ivpu/ivpu_hw_37xx_reg.h
 create mode 100644 drivers/accel/ivpu/ivpu_hw_40xx.c
 create mode 100644 drivers/accel/ivpu/ivpu_hw_40xx_reg.h
 delete mode 100644 drivers/accel/ivpu/ivpu_hw_mtl_reg.h

-- 
2.25.1

