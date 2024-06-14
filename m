Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B729082F0
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 06:26:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E793210EC27;
	Fri, 14 Jun 2024 04:26:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G/3gAjrT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A164D10EC1B;
 Fri, 14 Jun 2024 04:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718339156; x=1749875156;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3AbDm2jUUNLaIxg13g0AmBY24t4nDzNQb8+M/XZ1dMA=;
 b=G/3gAjrT0ojOefnstwDSP3fE+YU34oAthV91QsGUxCDT3C20uhnU6Cae
 SkQimNTVPdAh48hJF7+53YpAp0Tnbl+zIc8ZQBh6+/F/SJlT2ql3ScKij
 GcBll9w0avipxJBe/VifbVf6gQrlpe0YXHuahDj1zdcQ8PRS7z1xwNLBu
 63wRHrITAW60YGDzLuUfZEJvGEfDVM7Ked/Hq5rmT23qj/DOoBvSA2bUI
 E2MbPoAJPjiUGs3k7WEQh1BK4MUFcJjYSoh+KjNjs6awmrnRKXNZ2kM+t
 ZyxsDKeQkUSz9x5ntkbBQt/yjcqvLMWT3E57kNqvnJUOCBp0U8nQQtDrp A==;
X-CSE-ConnectionGUID: bqdcx28pTdCrhjS56+RCBQ==
X-CSE-MsgGUID: pxKxqdFaTe6zEeZ4zd0K5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="37731518"
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; d="scan'208";a="37731518"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 21:25:50 -0700
X-CSE-ConnectionGUID: Bv0UInopStarZ2v1rr3gLA==
X-CSE-MsgGUID: PXfAv/FgSJuSYQ0EiMstjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; d="scan'208";a="40343338"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by fmviesa008.fm.intel.com with ESMTP; 13 Jun 2024 21:25:45 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: mitulkumar.ajitkumar.golani@intel.com, ankit.k.nautiyal@intel.com,
 suraj.kandpal@intel.com, jani.nikula@linux.intel.com, sfr@canb.auug.org.au,
 lucas.demarchi@intel.com
Subject: [PATCH v2 0/2] CMRR patch fixes
Date: Fri, 14 Jun 2024 09:55:56 +0530
Message-ID: <20240614042558.376983-1-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.45.2
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

Address following issues regarding CMRR

1. Describe target_rr_divider in struct drm_dp_as_sdp.
2. Use required macro to avoid overflow.

-v2:
- Remove extra line from commit message.

Mitul Golani (2):
  drm/dp: Describe target_rr_divider in struct drm_dp_as_sdp
  drm/i915/display: Update calculation to avoid overflow

 drivers/gpu/drm/i915/display/intel_vrr.c | 9 +++++----
 include/drm/display/drm_dp_helper.h      | 1 +
 2 files changed, 6 insertions(+), 4 deletions(-)

-- 
2.45.2

