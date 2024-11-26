Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 737EE9D9B31
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2024 17:18:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC04710E91F;
	Tue, 26 Nov 2024 16:18:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iLRH+z00";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D23D810E939;
 Tue, 26 Nov 2024 16:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732637903; x=1764173903;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Pg58iHEv4vNChp+AxRNWtMz72kHmjxfXTESQx790scA=;
 b=iLRH+z00O4zGzCS37d89KxywzSW9IAkTvv8iJeWtGvUNT2/EexcE2vVh
 mQqRESJgzDg3+qD0rtWiA8C0PP40R304FGD4k9YxCQqdkwYc/Hi70Vo2V
 oHcwalwwnYpT8XHLVq5K+HC3x9MbwnKrqoRghS2kvWgQD6/olqtA2lob6
 d+h+Fgxcpjjb8vS7+BkYtB5fYbRGrhCWFKOoxDUaqgjcjAOm8PV3cXG3n
 oLPSCwDQDb//GKQsAR46piNyqbYC3bYNoD0HMp2Qq3YYTemJEKyrmCLMq
 A+vdJ3Aje0xeN0qmJ7wf9X1sELxBRRCvzG0BdnFcsDUCZWSkzWZk2IWKc g==;
X-CSE-ConnectionGUID: xRk3XK45SUOmSk9d1agjYg==
X-CSE-MsgGUID: SJ7Eu1P0TbOhATLbARdVWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="32181796"
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="32181796"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 08:18:23 -0800
X-CSE-ConnectionGUID: g5VtOv6UQcencYRhvUxiSw==
X-CSE-MsgGUID: pgd75W5aRJKJJ/ufamBogQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="91606372"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 08:18:21 -0800
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH v2 0/4] drm/dp: Expose only a properly inited connector
Date: Tue, 26 Nov 2024 18:18:55 +0200
Message-ID: <20241126161859.1858058-1-imre.deak@intel.com>
X-Mailer: git-send-email 2.44.2
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

This patchset is v2 of [1], without the first patch which is already
merged, adding Rodrigo's R-bs and addressing Jani's review comments in
patch 1 of this patchset and the newly added patch 4.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>

[1] https://lore.kernel.org/all/20241115164159.1081675-1-imre.deak@intel.com

Imre Deak (4):
  drm/dp: Add a way to init/add a connector in separate steps
  drm/i915/dp_mst: Expose a connector to kernel users after it's
    properly initialized
  drm/i915/dp_mst: Fix error handling while adding a connector
  drm/i915/dp_mst: Use intel_connector vs. drm_connector pointer in
    intel_dp_mst.c

 drivers/gpu/drm/drm_connector.c             | 111 +++++++++--
 drivers/gpu/drm/i915/display/intel_dp_mst.c | 210 ++++++++++----------
 include/drm/drm_connector.h                 |   6 +
 3 files changed, 197 insertions(+), 130 deletions(-)

-- 
2.44.2

