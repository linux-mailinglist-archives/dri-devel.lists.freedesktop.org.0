Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1DE1A1493E
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2025 06:49:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 127A410E132;
	Fri, 17 Jan 2025 05:49:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AL+7GgM4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 082AB10E132;
 Fri, 17 Jan 2025 05:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737092992; x=1768628992;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=eqkc6TVqrQTlH+LQ6XNPudzYtAZ0iF78FOuAPA4q46k=;
 b=AL+7GgM4tg4c4vo7ErtWgPE/CAF5c7evqGeD8dY5C3L4I7R4RIniw8KK
 U/uq/MBugiawlsXvQ4EnJ8Rg7/dAYb1Xr48JgqJkopwfsAwL4gT6L8sbK
 CRAvNFMyYH5G2yVeInmUPO8e7xOJmahtqdBAQTVkGxyrNHv2FHgcVrowR
 akx02PAVsZYLoM777GAaCB9zL7ypDJ7aVEoaLA0QxAQ3h1c6iR5kMBHD8
 RbSXBmQ0+CQ7NdeDaUFhcpbT/MBkFgeJ6Ni+hLUAzXZI12oTU2UEhy1BM
 S/wR3Yw3hQqrzOZrMNs41bBNVtUW85WxB3KGkgr4KfTLz831UYnUu1jhS A==;
X-CSE-ConnectionGUID: hIAbOCOCQQaJztugFqKk1w==
X-CSE-MsgGUID: VBsOmdt7TtC/qyB6U3okew==
X-IronPort-AV: E=McAfee;i="6700,10204,11317"; a="48910435"
X-IronPort-AV: E=Sophos;i="6.13,211,1732608000"; d="scan'208";a="48910435"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2025 21:49:51 -0800
X-CSE-ConnectionGUID: E6dOhcURTmak8WRYCXlJhQ==
X-CSE-MsgGUID: BXb+jpOwQZiE1WVGDh10qA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,211,1732608000"; d="scan'208";a="136560350"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa002.jf.intel.com with ESMTP; 16 Jan 2025 21:49:50 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: arun.r.murthy@intel.com,
	Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 0/2] Extended Wake Timeout 
Date: Fri, 17 Jan 2025 11:18:48 +0530
Message-Id: <20250117054850.1189650-1-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
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

Retimers in H/w usually takes 30 to 40ms to wake up all the devices. To
get this we use the Extended Wake Time feature in which the sink device
tells us the minimum amount of time it requires to wake up and we need
to do a write to grant this request else we need to wake up within 1ms
of low power state exit.
DP source  device shall keep retying  the AUX tansaction upto the
extended timeout  that is being granted for LTTPRs from the sink device

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>

Suraj Kandpal (2):
  drm/dp: Add the DPCD register required for Extended wake timeout
  drm/i915/lttpr: Enable Extended Wake Timeout

 drivers/gpu/drm/i915/display/intel_ddi.c      |  2 +
 .../drm/i915/display/intel_dp_link_training.c | 49 +++++++++++++++++++
 .../drm/i915/display/intel_dp_link_training.h |  1 +
 include/drm/display/drm_dp.h                  | 14 ++++++
 4 files changed, 66 insertions(+)

-- 
2.34.1

