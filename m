Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C75F383DA23
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jan 2024 13:28:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E57710F9F4;
	Fri, 26 Jan 2024 12:28:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED56B10F9F4
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jan 2024 12:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706272089; x=1737808089;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4CC4hny4hUGBv69gnQBIz5VLjfSE6AixzbB4bj5ODnU=;
 b=kd3vZKnVT7JB4POTaX7OCi6C0gUtv/hTNdd2MdZrtYIx2GBRHXMlueD4
 nel3uZqGb6s7gbVDsjb6xRwC8ROfgL1j82Esdhb5/f3A0t0hDgfFzaLFN
 lbN0KihDmZIKXF91X0+IgGAdW/XA13Loip6dQq6WkFHcGaNC3ULFS8q4i
 udYpqC//PVd+hW0S+Vp//ExGo7mhPrfl4s8nbERScsQPOazEl5D/j+it2
 wJPA9sqxYE807/TocERsDts5ilG7FwkhIPxfvrLwx5NsApzMJoyhLt7Xi
 VsUwgBwqxGcOjGaGpA09mWDopdOBsMicnKX2VVcmxvoUsLTJO+Zn4EK72 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="9207401"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="9207401"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2024 04:28:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="2731880"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2024 04:28:07 -0800
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/7] accel/ivpu fixes for 6.8-rc3
Date: Fri, 26 Jan 2024 13:27:57 +0100
Message-ID: <20240126122804.2169129-1-jacek.lawrynowicz@linux.intel.com>
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

A couple of small patches focused on improving driver stability.
In addition d3hot_delay patch improves LNL inference latency.

Grzegorz Trzebiatowski (1):
  accel/ivpu: Add job status for jobs aborted by the driver

Jacek Lawrynowicz (1):
  accel/ivpu: Disable d3hot_delay on all NPU generations

Krystian Pradzynski (2):
  accel/ivpu/40xx: Enable D0i3 message
  accel/ivpu/40xx: Stop passing SKU boot parameters to FW

Wachowski, Karol (3):
  accel/ivpu: Force snooping for MMU writes
  accel/ivpu: Correct MMU queue size checking functions
  accel/ivpu: Gracefully shutdown NPU before reset

 drivers/accel/ivpu/ivpu_drv.c     |   5 +-
 drivers/accel/ivpu/ivpu_fw.c      |   1 -
 drivers/accel/ivpu/ivpu_hw_37xx.c | 124 +++++++++++++++---------------
 drivers/accel/ivpu/ivpu_hw_40xx.c |   7 +-
 drivers/accel/ivpu/ivpu_job.c     |   4 +-
 drivers/accel/ivpu/ivpu_mmu.c     |  36 +++++----
 include/uapi/drm/ivpu_accel.h     |   1 +
 7 files changed, 89 insertions(+), 89 deletions(-)

--
2.43.0
