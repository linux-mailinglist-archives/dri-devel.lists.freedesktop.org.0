Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B98B28362D0
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 13:10:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0875110EE2D;
	Mon, 22 Jan 2024 12:09:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38CE210EE2B
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 12:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705925390; x=1737461390;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lnJBLFP5vCQQnL8McoWAh6ghTKCvq/Nj9mSq9OGO2Bc=;
 b=ceaGvQggxgjovbRvLJCQtsM95CpPM1NUKocyHCE3n+g58cuGfwqkI/91
 i/ApMfPfYsx30n2xFIm46zlKsEl0UvhTcza8Y2L8UlJbsUasmY9S52Qtm
 knG3OuYKl/8IO4kFSJIm/DPUven1p6ZItCbRboJOr/UncRMS+7VzOU16d
 ZVlDt5tZ/rxRFwIim9uo2whV0zdkMfyl7IBR/wyJxC2UNS+f41FQy3qUm
 jW/9Utt0IIWEvTPepf2kzsMAT1baSOGBTYh3CX3pDvagA4Pj9JxoVY9xn
 QfCxzEdedB0ezmGeaNKxeH7B+H02OueD6CloFE+SPWe4qqSlF1QCJSH/P w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="432353258"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; d="scan'208";a="432353258"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 04:09:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="904834001"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; d="scan'208";a="904834001"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 04:09:47 -0800
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/3] accel/ivpu fixes for 6.8-rc1
Date: Mon, 22 Jan 2024 13:09:42 +0100
Message-ID: <20240122120945.1150728-1-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
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
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Stability fixes for reset, recovery and unbind.

Jacek Lawrynowicz (3):
  accel/ivpu: Fix dev open/close races with unbind
  accel/ivpu: Improve stability of ivpu_submit_ioctl()
  accel/ivpu: Improve recovery and reset support

 drivers/accel/ivpu/ivpu_debugfs.c |  20 +++-
 drivers/accel/ivpu/ivpu_drv.c     | 110 +++++++++++++--------
 drivers/accel/ivpu/ivpu_drv.h     |   3 +-
 drivers/accel/ivpu/ivpu_gem.c     |  18 ++--
 drivers/accel/ivpu/ivpu_gem.h     |   2 +-
 drivers/accel/ivpu/ivpu_hw_37xx.c |  14 +--
 drivers/accel/ivpu/ivpu_hw_40xx.c |   8 +-
 drivers/accel/ivpu/ivpu_ipc.c     |   6 +-
 drivers/accel/ivpu/ivpu_job.c     | 157 +++++++++++++-----------------
 drivers/accel/ivpu/ivpu_job.h     |   3 +-
 drivers/accel/ivpu/ivpu_mmu.c     |  14 ++-
 drivers/accel/ivpu/ivpu_pm.c      |  48 ++++++---
 drivers/accel/ivpu/ivpu_pm.h      |   6 +-
 13 files changed, 218 insertions(+), 191 deletions(-)

--
2.43.0
