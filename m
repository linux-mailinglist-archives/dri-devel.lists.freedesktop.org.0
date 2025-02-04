Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6C6A26D81
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 09:46:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7B9310E29D;
	Tue,  4 Feb 2025 08:46:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jd/rSzS/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF74110E29D
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2025 08:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738658787; x=1770194787;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8JctRr8405bA95J4A5cFzMJX2g2Pl1AiNa+u5Tbk5xM=;
 b=Jd/rSzS/LKfNQhh6I47T6j7JxctevVhzOIsnKj/eWFwgPjKO9npXBbhM
 /rP0P9LDmUr9J6IHH1YpMHUZ7btXv8ZGajFXX9l66r5AsgZNiUThZQUyi
 5i4iUlklJQQZSDX+YJUlc39IUc4JjbnEGdKkfLZlkc1RdXhBIwL27Av93
 58XpanShLis096MlcFjBrBpbKq/D6J3K/IArBb5IkvyiJYVa1vnf5WdOT
 jBskKYvmMAfTLhTAXhSfe9VTOgO5IxDxEd7Dohg6cqxjWipEKPWBC+TRy
 e6H7Qd1e/fZ35xYuJWExG3TkFEIJZLq21kw+D1NMjIsmt9EOC0gdybE/D w==;
X-CSE-ConnectionGUID: ONnUHdTOQmuHZVcZQFZkfA==
X-CSE-MsgGUID: A/aKieB3QhusefeuqArSJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="39434706"
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; d="scan'208";a="39434706"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2025 00:46:26 -0800
X-CSE-ConnectionGUID: 0XBWyQK6TmqU6A2qIfH+ew==
X-CSE-MsgGUID: pSGdTxCHSlC0zamNxae/Vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; d="scan'208";a="115531554"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2025 00:46:25 -0800
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 maciej.falkowski@linux.intel.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH 0/6] accel/ivpu: Changes for 6.15 2025-02-04
Date: Tue,  4 Feb 2025 09:46:16 +0100
Message-ID: <20250204084622.2422544-1-jacek.lawrynowicz@linux.intel.com>
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

Add possibility to import single buffer into multiple contexts,
fix locking when aborting contexts and add some debug features.

Andrzej Kacprowski (2):
  accel/ivpu: Add missing locks around mmu queues
  accel/ivpu: Prevent runtime suspend during context abort work

Karol Wachowski (3):
  ccel/ivpu: Add debugfs interface for setting HWS priority bands
  accel/ivpu: Add test modes to toggle clock relinquish disable
  accel/ivpu: Implement D0i2 disable test modea

Tomasz Rusinowicz (1):
  accel/ivpu: Allow to import single buffer into multiple contexts

 drivers/accel/ivpu/ivpu_debugfs.c | 84 +++++++++++++++++++++++++++++++
 drivers/accel/ivpu/ivpu_drv.c     |  2 +-
 drivers/accel/ivpu/ivpu_drv.h     |  4 ++
 drivers/accel/ivpu/ivpu_fw.c      |  4 ++
 drivers/accel/ivpu/ivpu_gem.c     | 43 ++++++++++++++++
 drivers/accel/ivpu/ivpu_gem.h     |  1 +
 drivers/accel/ivpu/ivpu_hw.c      | 31 ++++++++++++
 drivers/accel/ivpu/ivpu_hw.h      |  5 ++
 drivers/accel/ivpu/ivpu_job.c     | 10 +++-
 drivers/accel/ivpu/ivpu_jsm_msg.c | 29 ++++-------
 drivers/accel/ivpu/ivpu_mmu.c     |  9 ++++
 11 files changed, 202 insertions(+), 20 deletions(-)

--
2.45.1
