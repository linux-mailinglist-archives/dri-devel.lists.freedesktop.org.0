Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2C97EA19F
	for <lists+dri-devel@lfdr.de>; Mon, 13 Nov 2023 18:03:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C947A10E172;
	Mon, 13 Nov 2023 17:03:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8AEC10E171
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 17:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699895015; x=1731431015;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Cex74w3wyj8UBoi+UOqprXll7DQA6Fpr/7Q4rxudm8c=;
 b=OIvumb7RH5ZMUbkjLdVqCP8nhpVcaUgcKKDNz2s/gMWeU0IuLQbc9oYg
 gKykSHLIPEOcHEGgs1ZSpMPTzre1SdZ5xpIpsjq15X7raQn4EGNq9yDom
 bJ/l3bzGyFtlXsVbKCe5euaTsn7klmRsexc6RU2XJnHWrTIsEjZlQcW1J
 J1rChVRzs23L5In8nDmZ9e2/ZFWTX8JKbJD7mvCfnSoO2VpJWSs1dH9j/
 uSbp07CaPqoc8fhe24zNBjUK1E0LwpPFzBatqOjlISThydLw16CzneuIr
 +57UGvlguUPW2IXq8QcMUEOzNm5nS27KN8VYP5vjgoEe1jj2IVQa82JTN Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="3520643"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="3520643"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2023 09:02:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="937788057"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; d="scan'208";a="937788057"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2023 09:02:54 -0800
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/5] accel/ivpu: Replace IPC kthread with threaded IRQ
Date: Mon, 13 Nov 2023 18:02:47 +0100
Message-ID: <20231113170252.758137-1-jacek.lawrynowicz@linux.intel.com>
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

v2:
  - Don't do bit operations on enum irqreturn

v1: https://lore.kernel.org/all/20231107123514.2218850-1-jacek.lawrynowicz@linux.intel.com

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
 drivers/accel/ivpu/ivpu_hw_40xx.c |  30 ++--
 drivers/accel/ivpu/ivpu_ipc.c     | 223 +++++++++++++++++-------------
 drivers/accel/ivpu/ivpu_ipc.h     |  24 +++-
 drivers/accel/ivpu/ivpu_job.c     |  99 +++----------
 drivers/accel/ivpu/ivpu_job.h     |   6 +-
 drivers/accel/ivpu/ivpu_pm.c      |  31 +++++
 drivers/accel/ivpu/ivpu_pm.h      |   3 +
 10 files changed, 251 insertions(+), 227 deletions(-)

--
2.42.0
