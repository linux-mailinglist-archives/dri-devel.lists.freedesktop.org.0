Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 616D98C7978
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 17:28:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CE2710E41E;
	Thu, 16 May 2024 15:28:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OyVCtwPp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8E4210E2C9;
 Thu, 16 May 2024 15:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715873328; x=1747409328;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vGMuOuOLUrriNVNDog2dqJzKVgA4PjAjScWXH6j0Gt4=;
 b=OyVCtwPp28IyY4E+PB9BuVyjnPZFw5yJiRmga33ztrF2e5I1GyVADtj6
 BY8H5QI11iAMY+wFiYqVZaRdi/HgrVQ/vEHD7Dq9PU+gXPn4kCVFFtClg
 TyavayBGRQaeHCQ6/5oS8TaUw8+VpAQQajyGkuS1uhrZehRMD1zN+Yh5t
 iDb2K8mZGOqcUYHOvnPq8PVxMp6xHy2TgS0awJy/RMHgAY+rGcYIAUcSi
 o7OvrYsyqj+Wueun3V0Q/7E7DFy8+KKChqutAGmgtmfVROxnnlykVF11l
 xzBiCe5bx4EEPtJTnZjMy5jVGkZygb0zxu5UJvWADSUySGb/Ze79t1K9x g==;
X-CSE-ConnectionGUID: pW8qi7aGQ3SXJ3dFCZgVHw==
X-CSE-MsgGUID: 3TZPpaMxSganUgCxqaieEA==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="29495962"
X-IronPort-AV: E=Sophos;i="6.08,164,1712646000"; d="scan'208";a="29495962"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2024 08:28:47 -0700
X-CSE-ConnectionGUID: 6an2Ba7fTLmmCaewt5bKfA==
X-CSE-MsgGUID: sh2MCbhUQJWGlCGSGoPgQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,164,1712646000"; d="scan'208";a="31598970"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2024 08:28:44 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Nirmoy Das <nirmoy.das@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: [PATCH] drm/i915/selftests: Set always_coherent to false when reading
 from CPU
Date: Thu, 16 May 2024 17:14:03 +0200
Message-ID: <20240516151403.2875-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany, Commercial Register: Amtsgericht Muenchen HRB 186928
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

The previous commit 'commit 8d4ba9fc1c6c ("drm/i915/selftests: Pick
correct caching mode.")' was not complete as for non LLC  sharing platforms
cpu read can happen from LLC which probably doesn't have the latest
changes made by GPU.

Cc: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
index 65a931ea80e9..3527b8f446fe 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
@@ -196,7 +196,7 @@ static int verify_access(struct drm_i915_private *i915,
 	if (err)
 		goto out_file;
 
-	mode = intel_gt_coherent_map_type(to_gt(i915), native_obj, true);
+	mode = intel_gt_coherent_map_type(to_gt(i915), native_obj, false);
 	vaddr = i915_gem_object_pin_map_unlocked(native_obj, mode);
 	if (IS_ERR(vaddr)) {
 		err = PTR_ERR(vaddr);
-- 
2.42.0

