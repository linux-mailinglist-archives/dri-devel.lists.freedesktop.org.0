Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B2DF9F0484
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 07:03:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8272A10EEFA;
	Fri, 13 Dec 2024 06:03:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nfI3cDDy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8344810E18B;
 Fri, 13 Dec 2024 06:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734069806; x=1765605806;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ufXldPvJ7JrSFy3TBryhmuw3tQ1Ea3aFcmRZm0SRbNE=;
 b=nfI3cDDyOxzdGDGSRqoGttCelA/JGvPIvlNhrJ/Nf5BR+I3SLnoO3hxY
 inVf5NFawUjqLPAoGynRGe1VFC4/W3sVRu62CiDvoW945Pin6N5jB1KoQ
 uvfdWAyhwwSzaLkvboRsVHm7qtJjUIgRrNunWmujQdzHrWdQ1pClWJC70
 rZ4IHY6tMRHqfTBRuCvIpjYZ0jwrpuwIw8MW8eugQ8UFoYmUXEEc/rl9j
 Dx544PeDM7NRUoJqloqT+egMGGDpbtBPsjvZh4J6eNzEn3nsltnlozaYL
 pghn0De1EkyZhgcNO3brezBzZrOpbw+SOBR5qvs1qrntgvoQWmD84Hsmr Q==;
X-CSE-ConnectionGUID: hPnjTP9jSVWpjkWBg2rO1g==
X-CSE-MsgGUID: zT4tUe+JR3KwxoaSz2LMbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="34646448"
X-IronPort-AV: E=Sophos;i="6.12,230,1728975600"; d="scan'208";a="34646448"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 22:03:25 -0800
X-CSE-ConnectionGUID: hvhphDguStSsV1YVeAbT8g==
X-CSE-MsgGUID: QKxxe6jhQp20wpPF9hkPaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="96883949"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa007.jf.intel.com with ESMTP; 12 Dec 2024 22:03:23 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: uma.shankar@intel.com, arun.r.murthy@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 0/2] Extended Wake Timeout 
Date: Fri, 13 Dec 2024 11:33:15 +0530
Message-Id: <20241213060317.2674290-1-suraj.kandpal@intel.com>
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

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>

Suraj Kandpal (2):
  drm/dp: Add the DPCD register required for Extended wake timeout
  drm/i915/lttpr: Enable Extended Wake Timeout

 drivers/gpu/drm/i915/display/intel_ddi.c      |  2 +
 .../drm/i915/display/intel_dp_link_training.c | 46 +++++++++++++++++++
 .../drm/i915/display/intel_dp_link_training.h |  1 +
 include/drm/display/drm_dp.h                  | 14 ++++++
 4 files changed, 63 insertions(+)

-- 
2.34.1

