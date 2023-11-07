Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4BAE7E3E34
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 13:35:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 365F210E5E7;
	Tue,  7 Nov 2023 12:35:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB77810E5E7
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Nov 2023 12:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699360518; x=1730896518;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3lyRNrOH0klWPo8tA3ks7S685y70M1D/cYVq99GJXBI=;
 b=f2HHSfnXaonD/V9cusZPJJSULECMxhfuOnXbAL2OpwhBVsuDQeHhF3ye
 w4wrjMm7oL1tjAaDajTsJM7evlCQmnknra60Cu3bjuvJ5Kyi6a0gVnzgO
 87M4GYIrGSFDvseMRJeI64gKlH1VHgCPdyhfRDKFAKQ+9nFaZO35zsUAQ
 DSNQFklp/JbXC0mMz50AtUb98ZJCug1ysoRZGKTEqPoFCPafyUCBgwmxW
 HyoI4/FgyztSYjUWqJIYbn+i1Ejbt53qIgqkwvrrlMzTkh6+3GwcBH/Wg
 8jnUcAGzIjylTdupmOk8gsgdN7fhN7cn1I0fgwOZZqyQzkDsWmd5RhOD4 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="393396708"
X-IronPort-AV: E=Sophos;i="6.03,283,1694761200"; d="scan'208";a="393396708"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2023 04:35:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,283,1694761200"; 
   d="scan'208";a="3979122"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2023 04:35:17 -0800
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/5] accel/ivpu: Replace IPC kthread with threaded IRQ
Date: Tue,  7 Nov 2023 13:35:09 +0100
Message-ID: <20231107123514.2218850-1-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.42.0
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
Cc: quic_jhugo@quicinc.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use threaded IRQ to handle incoming IPC messages. IPC consumers can now
provide optional callback that will be executed once message is received.
This allows to handle multiple message types in a generic manner.

Removing kthread also simplifies synchronization as disable_irq() will block
until all pending messages are handled.

Jacek Lawrynowicz (1):
  accel/ivpu: Use threaded IRQ to handle JOB done messages

Stanislaw Gruszka (4):
  accel/ivpu: Rename cons->rx_msg_lock
  accel/ivpu: Do not use irqsave in ivpu_ipc_dispatch
  accel/ivpu: Do not use cons->aborted for job_done_thread
  accel/ivpu: Use dedicated work for job timeout detection

 drivers/accel/ivpu/ivpu_drv.c     |  30 ++--
 drivers/accel/ivpu/ivpu_drv.h     |   3 +-
 drivers/accel/ivpu/ivpu_hw_37xx.c |  29 ++--
 drivers/accel/ivpu/ivpu_ipc.c     | 222 +++++++++++++++++-------------
 drivers/accel/ivpu/ivpu_ipc.h     |  24 +++-
 drivers/accel/ivpu/ivpu_job.c     |  99 ++++---------
 drivers/accel/ivpu/ivpu_job.h     |   6 +-
 drivers/accel/ivpu/ivpu_pm.c      |  31 +++++
 drivers/accel/ivpu/ivpu_pm.h      |   3 +
 9 files changed, 237 insertions(+), 210 deletions(-)

--
2.42.0
