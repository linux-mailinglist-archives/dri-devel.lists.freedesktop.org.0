Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4991508F3D
	for <lists+dri-devel@lfdr.de>; Wed, 20 Apr 2022 20:16:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C3D010F160;
	Wed, 20 Apr 2022 18:16:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0247010F0C6;
 Wed, 20 Apr 2022 18:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650478589; x=1682014589;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Q1/mJKKYNUjIp6VsGHLq+zW5dpH68asDqzLG+kPoEwg=;
 b=kzuFtXaecDCy5xOO2PsNdaWwF4h3SB9ViJ0aTBib+sf0nQqiUbwkkXtY
 j06ASshHevm0pnUALpSsMf+Z4ay247fWYxfDA+QV2sRyOquPnSZtviPUN
 AdD7ofgKgWY+gro3nQOd+OEJQpYn0ya1R9fHi2K940EBhWF5rZ6AEZF1y
 SGXBaXgROoFtJcHW8Ai6TwDC/UqnKICzBOpE1SDlKyf1auWuCGbgcBMt0
 4bZMJalFDkUbC5z6wR/IgYjZl6Dxk0cDWle62Je0W7iKr/99aTPhqPdns
 YK30hYKF0Nd4eU5UJ9iYDTEaJPp2QCKSJTwG0wTSM5G9JCcsk5f5aZPT5 g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10323"; a="261723159"
X-IronPort-AV: E=Sophos;i="5.90,276,1643702400"; d="scan'208";a="261723159"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2022 11:16:28 -0700
X-IronPort-AV: E=Sophos;i="5.90,276,1643702400"; d="scan'208";a="593286110"
Received: from briansim-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.3.144])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2022 11:16:27 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [CI 3/4] drm/i915/selftests: fixup min_alignment usage
Date: Wed, 20 Apr 2022 19:16:12 +0100
Message-Id: <20220420181613.70033-3-matthew.auld@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220420181613.70033-1-matthew.auld@intel.com>
References: <20220420181613.70033-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Nirmoy Das <nirmoy.das@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Trying to cast the region id into the region type doesn't work too well,
since the i915_vm_min_alignment() won't give us the correct value for
the stolen-lmem case.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Nirmoy Das <nirmoy.das@linux.intel.com>
Cc: Ramalingam C <ramalingam.c@intel.com>
---
 drivers/gpu/drm/i915/selftests/i915_gem_gtt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
index 5c9bfa409ff5..bccc49a8ab5e 100644
--- a/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
+++ b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
@@ -1150,7 +1150,7 @@ static int misaligned_pin(struct i915_address_space *vm,
 		flags |= PIN_GLOBAL;
 
 	for_each_memory_region(mr, vm->i915, id) {
-		u64 min_alignment = i915_vm_min_alignment(vm, (enum intel_memory_type)id);
+		u64 min_alignment = i915_vm_min_alignment(vm, mr->type);
 		u64 size = min_alignment;
 		u64 addr = round_down(hole_start + (hole_size / 2), min_alignment);
 
-- 
2.34.1

