Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB9F49427C
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 22:30:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DCAA10E20E;
	Wed, 19 Jan 2022 21:30:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F123210E1FD;
 Wed, 19 Jan 2022 21:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642627809; x=1674163809;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mpe9gB541//AlFP8RLmA4Ew4Et3UTAh1YBR/JaCYBd0=;
 b=nJV8AEFgFzgyxNFZi6oyAxa5AEiZZPwgp4CkVhCNV6FNxBwvs/kFp4uP
 ta7mvql1ZPra3e2oynJ1jngZP6+slGJXWL3WEQj5Mnjpi1heMNF8NTSLL
 uG6CiCqAdvKjBaAAWIhwWHYkXTQrweH+WH3H4OfHwkxYlLsBsxQx5RaCg
 rvYjKQbYh1/Z5OQyfzg6dk84JLIK7lzFhh6IfP+vgF+UBNuFUICg3WRmU
 GSV2mWTORW2pzOCDANlqMxUMEIllgdYPXesE36FdtPhzEd7TCRMuC2P/N
 Pdu7Ppdn4nU6eY04BL4bbrGEVpmc469ZTrVjM5aAP4tZGVTp2G5FdwuMA A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10231"; a="331548313"
X-IronPort-AV: E=Sophos;i="5.88,300,1635231600"; d="scan'208";a="331548313"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2022 13:30:08 -0800
X-IronPort-AV: E=Sophos;i="5.88,300,1635231600"; d="scan'208";a="475289709"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2022 13:30:08 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <dri-devel@lists.freedesktop.org>,
	<intel-gfx@lists.freedesktop.org>
Subject: [PATCH 0/3] Flush G2H handler during a GT reset
Date: Wed, 19 Jan 2022 13:24:16 -0800
Message-Id: <20220119212419.23068-1-matthew.brost@intel.com>
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
Cc: john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

After a small fix to error capture code, we now can flush G2H during a
GT reset which simplifies code and seals some extreme corner case races. 

v2:
 (CI)
  - Don't trigger GT reset from G2H handler
v3:
  - Address John Harrison's comments

Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Matthew Brost (3):
  drm/i915: Allocate intel_engine_coredump_alloc with ALLOW_FAIL
  drm/i915/guc: Add work queue to trigger a GT reset
  drm/i915/guc: Flush G2H handler during a GT reset

 drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  9 +++
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 55 ++++++++++++-------
 drivers/gpu/drm/i915/i915_gpu_error.c         |  2 +-
 3 files changed, 44 insertions(+), 22 deletions(-)

-- 
2.34.1

