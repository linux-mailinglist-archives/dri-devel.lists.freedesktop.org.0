Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9307900EE
	for <lists+dri-devel@lfdr.de>; Fri,  1 Sep 2023 18:48:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C01C910E1B8;
	Fri,  1 Sep 2023 16:48:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 359DE10E1B8
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Sep 2023 16:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693586927; x=1725122927;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8/hjScWRzCHP06vHAIrdrn75PI2CwadDmZ1qR2BtQxE=;
 b=FktG28QoO1ZCpu1Pp15wsdji/r2NzVBOk5mQv568kcvpuc1n4wpA5zUB
 1kHyLyWWlXJoMI71bQHcrdB486ElTUkGV3TKlwRlsg6UmLAWQRw/SzFe2
 js+h5zTvW7L1RFanQdGoLZ3tNw43xI8YS0yX5pl0mYO3bLRRPRUmWLE9F
 3jznb9vsFvA1EAj7qEXXySbsa6jafwaSzhrI6fn+ozwoNcC4n704XSVKi
 YBXLxDyl5STDKQ0JWbrxOrNdTF90TDLYl1tsf1hRR0OUJlh7e8kMx8n9I
 QRyYwcAuKb/z7YfRTdsZAU5elve3vO5YQZvBS/vMKHePfjuqIPai9FWT9 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="375164073"
X-IronPort-AV: E=Sophos;i="6.02,220,1688454000"; d="scan'208";a="375164073"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2023 09:48:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="769246391"
X-IronPort-AV: E=Sophos;i="6.02,220,1688454000"; d="scan'208";a="769246391"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2023 09:48:44 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC 0/4] accel/ivpu: Use GEM shmem 
Date: Fri,  1 Sep 2023 18:48:38 +0200
Message-Id: <20230901164842.178654-1-stanislaw.gruszka@linux.intel.com>
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

Use GEM shmem for buffer management code

Jacek Lawrynowicz (4):
  accel/ivpu: Allocate vpu_addr in gem->open() callback
  accel/ivpu: Fix locking in ivpu_bo_remove_all_bos_from_context()
  accel/ivpu: Remove support for uncached buffers
  accel/ivpu: Use GEM shmem helper for all buffers

 drivers/accel/ivpu/Kconfig            |   2 +-
 drivers/accel/ivpu/TODO               |   1 -
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
 12 files changed, 266 insertions(+), 572 deletions(-)

-- 
2.25.1

