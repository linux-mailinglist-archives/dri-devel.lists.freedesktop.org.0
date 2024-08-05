Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8BE94799A
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2024 12:26:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C27D510E19C;
	Mon,  5 Aug 2024 10:26:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KyUMD/eF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E847F10E19C;
 Mon,  5 Aug 2024 10:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722853587; x=1754389587;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=X1ZFFRFIhMBs5KT2PsG5UXEe4EuK7kxomaYoyvQO7xg=;
 b=KyUMD/eFi7Hy2rN8o8dQNNdRyv3vm0zaJzntIxB4dISE8cUXX5aXpjHr
 ZJV8foU4TG4vwRguJLDtoi5JhDjZZZfQvOZF+nlubca5uDNzTtQn0rSvp
 YXI0crhdYVhj7xNFzo9TsoRaE62HxLpuiMcDZyVcr9cfFPErrIWM44jTT
 BGHmEfUH2RqGQYN5DR6nxbnJen3IDiZKIWJd7tPo+kGghzqbE0DuOPxfW
 IimNy/jt4XYC+PjaYyOeoAXkRp4ovG98mskpwfjW/E3rH5UQM0hFsyQEb
 NOAQCpcmjjqDhOA1AAbV9i1BCiElLkGk80yjs0AuDlaQ/EelrnDT9L+49 g==;
X-CSE-ConnectionGUID: fa9CDqvvT7aWblNogubDyQ==
X-CSE-MsgGUID: 24nrur7aSnu5Xhaq84qDaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11154"; a="20948794"
X-IronPort-AV: E=Sophos;i="6.09,264,1716274800"; d="scan'208";a="20948794"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2024 03:26:26 -0700
X-CSE-ConnectionGUID: fCOFMRYFSbuM2eaDZjlMfw==
X-CSE-MsgGUID: HMBgVM99SkiCZMif7Q66/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,264,1716274800"; d="scan'208";a="93647552"
Received: from fpallare-mobl3.ger.corp.intel.com (HELO intel.com)
 ([10.245.245.249])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2024 03:26:22 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Jann Horn <jannh@google.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 Andi Shyti <andi.shyti@kernel.org>, Andi Shyti <andi.shyti@linux.intel.com>
Subject: [PATCH v2 1/2] drm/i915/gem: Adjust vma offset for framebuffer mmap
 offset
Date: Mon,  5 Aug 2024 11:25:53 +0100
Message-ID: <20240805102554.154464-2-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240805102554.154464-1-andi.shyti@linux.intel.com>
References: <20240805102554.154464-1-andi.shyti@linux.intel.com>
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

When mapping a framebuffer object, the virtual memory area (VMA)
offset ('vm_pgoff') should be adjusted by the start of the
'vma_node' associated with the object. This ensures that the VMA
offset is correctly aligned with the corresponding offset within
the GGTT aperture.

Increment vm_pgoff by the start of the vma_node with the offset=
provided by the user.

Suggested-by: Chris Wilson <chris.p.wilson@linux.intel.com>
Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_mman.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
index a2195e28b625..ce10dd259812 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
@@ -1084,6 +1084,8 @@ int i915_gem_fb_mmap(struct drm_i915_gem_object *obj, struct vm_area_struct *vma
 		mmo = mmap_offset_attach(obj, mmap_type, NULL);
 		if (IS_ERR(mmo))
 			return PTR_ERR(mmo);
+
+		vma->vm_pgoff += drm_vma_node_start(&mmo->vma_node);
 	}
 
 	/*
-- 
2.45.2

