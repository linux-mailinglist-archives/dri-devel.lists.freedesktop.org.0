Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 619256C68EA
	for <lists+dri-devel@lfdr.de>; Thu, 23 Mar 2023 13:55:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C195F10E51A;
	Thu, 23 Mar 2023 12:55:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F4F510E529
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Mar 2023 12:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679576113; x=1711112113;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LZuoc9npjzazrQYoqcpnaBd0GhldBk0qKZ5WMC4uuGc=;
 b=L0aSwiiZdHm2t062O07ORM3Dgb1FG1qF3wBVhdvfgog3Nu3YgHYkSKbN
 BKD/Liz7rzwQE0xfd1m5zWITP9Yyuxte1mMusgiJhq2+TKTc2DPer/rkw
 vz1dLjtki5yayrKcktfRmrVe6UsALtav8taH/A7yJjkD4qOug+pyMU/8c
 xXF/HMHWsgV2xR8cDlAtgdGE4M7DX8w+91ofbiiHxZwgjCcXo0TgJvVSe
 DXkU/dy3BQGiefdn7jeHRnYafRPQF7tSvheRDp1RHkJ2+xhddmGWVUJXE
 c8IRj3PzCb1X+FTlZO2eCc9/DNDMkqHFReGmBywYALUi1zj9Uu++bZLui g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="404362701"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; d="scan'208";a="404362701"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 05:55:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="682294638"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; d="scan'208";a="682294638"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 05:55:11 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/8] accel/ivpu: Fixes for 6.3
Date: Thu, 23 Mar 2023 13:54:56 +0100
Message-Id: <20230323125504.2586442-1-stanislaw.gruszka@linux.intel.com>
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

Various fixes intended for linux 6.3 relase.

Patch 6 is dependency for patch 7.

v2:
- add Fixes tags
- fix printing error on unplug
- clarify that SSID=65 is valid in the commit message
- change commit messages for patch 4 and 7
- add patch 8 with new fix
 
Andrzej Kacprowski (1):
  accel/ivpu: Fix IPC buffer header status field value

Stanislaw Gruszka (7):
  accel/ivpu: Do not access HW registers after unbind
  accel/ivpu: Cancel recovery work
  accel/ivpu: Do not use SSID 1
  accel/ivpu: Fix power down sequence
  accel/ivpu: Disable buttress on device removal
  accel/ivpu: Remove support for 1 tile SKUs
  accel/ivpu: Fix VPU clock calculation

 drivers/accel/ivpu/ivpu_drv.c    |  18 +++--
 drivers/accel/ivpu/ivpu_drv.h    |   7 +-
 drivers/accel/ivpu/ivpu_hw_mtl.c | 113 ++++++++++---------------------
 drivers/accel/ivpu/ivpu_ipc.h    |   2 +-
 drivers/accel/ivpu/ivpu_job.c    |  11 ++-
 drivers/accel/ivpu/ivpu_pm.c     |  17 ++++-
 drivers/accel/ivpu/ivpu_pm.h     |   1 +
 7 files changed, 80 insertions(+), 89 deletions(-)

-- 
2.25.1

