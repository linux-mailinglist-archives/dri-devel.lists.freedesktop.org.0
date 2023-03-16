Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2496BDB4F
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 23:07:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A9B410E394;
	Thu, 16 Mar 2023 22:07:38 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D057E10E2FD;
 Thu, 16 Mar 2023 22:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679004449; x=1710540449;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZX8ynRBKRM7FQvOH+/w2s8T5ZLBlgxDsIn2UK+r5Xmc=;
 b=bsxxtFIFS4bRsb+S2EjFnKa//qZsRM1Orgcgz7+vveywrkDjA7SEgGSB
 LRZi3E9/7qYbSLHGvdNpy44Uqze2q24f0wumI+Sxc8PKzVFuIa+pigni1
 xJc9+e4Uf9d6gw5prpATAWeemzl7T12JiDcX9Tvq8QYpx+dlMo6PXK1jK
 9tl3O5Ia0cVHQkg4E187E0o+235Qk3xdMsPz2IzvgRXPCBiFyDhFWo7P4
 xRHRwsdEeXxyDnG+IMBDHGb+yS4l3f0O31KN0manABZXDjvVpnjh6QyYU
 EOOUQjaR2Go1wV7Kf6fU4TEKOX7OJNnpvySffj9J+E1dbQ7+R1ANjH4pC Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="326490514"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; d="scan'208";a="326490514"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2023 15:07:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="712515381"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; d="scan'208";a="712515381"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orsmga001.jf.intel.com with ESMTP; 16 Mar 2023 15:07:25 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH v2 0/2] Improvements to GuC load failure handling
Date: Thu, 16 Mar 2023 15:06:30 -0700
Message-Id: <20230316220632.3312218-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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
Cc: John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

Add more decoding of the GuC load failures. Also include information
about GT frequency to see if timeouts are due to a failure to boost
the clocks. Finally, increase the timeout to accommodate situations
where the clock boost does fail.

v2: Reduce timeout in release builds, add bug references, make usage
of 'success' variable a litte clearer (review feedback from Daniele).

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


John Harrison (2):
  drm/i915/guc: Improve GuC load error reporting
  drm/i915/guc: Allow for very slow GuC loading

 .../gpu/drm/i915/gt/uc/abi/guc_errors_abi.h   |  17 +++
 drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c     | 141 +++++++++++++++---
 drivers/gpu/drm/i915/gt/uc/intel_guc_reg.h    |   4 +-
 3 files changed, 140 insertions(+), 22 deletions(-)

-- 
2.39.1

