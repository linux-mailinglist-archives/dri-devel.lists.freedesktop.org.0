Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC1F5A21D60
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 13:59:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8306510E7E0;
	Wed, 29 Jan 2025 12:59:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aWOhHuLl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5E5F10E7E0
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 12:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738155588; x=1769691588;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SFciN9FYHN+9ENeKFe9lo9SIMiwCgpJA5pDOThA7HAo=;
 b=aWOhHuLlJAVfw+lh8bg9RsRX/lX69eRAE74hoXXHxj/oI7EZWgAgxyKL
 YxB8G/vpitV/MXMOPsAtMTB8UDCQmQ1iE/ohEIwDcUheLTvKZ3Efh9e2l
 SL7SttT3ZX1/nBEVA5X+7dF8rJT0cfLqQgOx3nUA1TFGMigHJQJbhGFKN
 ihOkodo+OiyXeP9qaLPHWATfGXHkQX+pgSWAwpSwlqCQ+NtlT3JP/Ndg6
 Bv3vG7JXpoqO1prru6lTeEQ77RwIwVv2+fjhUXp1TrUmGQl2CxpNGh0eC
 ALEetEU76HXb7vkovZ0BHQjcrToCzblciUA99rZGK3n14QNwOSMPFdeYu Q==;
X-CSE-ConnectionGUID: WfqKNGOJR9GOCWjMLUeRPA==
X-CSE-MsgGUID: nD/7uds7TgO9B3246WRYFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="50080706"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="50080706"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 04:59:48 -0800
X-CSE-ConnectionGUID: Jj3Zp7BlTgSO9wGou1s74Q==
X-CSE-MsgGUID: e4/Fx0j6SEO2WSyVHEgB6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="109936544"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 04:56:39 -0800
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 maciej.falkowski@linux.intel.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH 0/6] accel/ivpu: Changes for 6.15
Date: Wed, 29 Jan 2025 13:56:30 +0100
Message-ID: <20250129125636.1047413-1-jacek.lawrynowicz@linux.intel.com>
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

Most notable is the addition of hardware fault injection support which allows
to test error handling paths in the driver.

Jacek Lawrynowicz (2):
  accel/ivpu: Add support for hardware fault injection
  accel/ivpu: Update last_busy in IRQ handler

Karol Wachowski (3):
  accel/ivpu: Fix missing MMU events if file_priv is unbound
  accel/ivpu: Turn on HWS by default on all platforms
  accel/ivpu: Move recovery work to system_unbound_wq

Tomasz Rusinowicz (1):
  accel/ivpu: Enable recovery and adjust timeouts for fpga

 drivers/accel/ivpu/ivpu_debugfs.c   |  5 +++
 drivers/accel/ivpu/ivpu_fw.c        | 10 +----
 drivers/accel/ivpu/ivpu_hw.c        | 33 +++++++++++----
 drivers/accel/ivpu/ivpu_hw_ip.c     |  4 +-
 drivers/accel/ivpu/ivpu_hw_reg_io.h | 64 +++++++++++++++++------------
 drivers/accel/ivpu/ivpu_job.c       |  8 +++-
 drivers/accel/ivpu/ivpu_pm.c        |  7 +---
 7 files changed, 78 insertions(+), 53 deletions(-)

--
2.45.1
