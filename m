Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB30F8C9AF7
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2024 12:06:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF03E10E158;
	Mon, 20 May 2024 10:06:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nX+MRs3Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D572010E158
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2024 10:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716199587; x=1747735587;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=f+kxv1VP9WWwG2js3OtiAgghZ/gIsZO1woNErtz9lSw=;
 b=nX+MRs3QRS5egdJdSfe3HmH0cfh/gj6ZsSdM62GQMnvL0vz+vYkOTxyn
 iVDp1IJJfYrsJnBMnjuwY8PcQxfGYaO871EvXbuGfF0NyYXYlt7Y6bJq2
 2y/UKYCdOC9onRWHfGetZNeT6UnkHk3sxEtafo7qOOGZiEvQup4HEXKld
 JefsIvev/Lznx2mGdLPUUVVgTrvfMfAQLHGpmWPfJHc82l6ubdFx94wt2
 1MwOBUiR7XQVo6MFHfRd9ijOHRqCj/9GfSh42xRScfwdV+V4YKFJgNpU9
 625vd4Z8Is2wcXhtZXn00OBidQcPrl3dBsPNlNQRZEgHJFLG79PDskGqP A==;
X-CSE-ConnectionGUID: ooQ7jzxhSL+jT/kq6X4pJg==
X-CSE-MsgGUID: 9yNiXC+ARLKwNgGlDDZ5yg==
X-IronPort-AV: E=McAfee;i="6600,9927,11077"; a="23725901"
X-IronPort-AV: E=Sophos;i="6.08,174,1712646000"; d="scan'208";a="23725901"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2024 03:05:19 -0700
X-CSE-ConnectionGUID: B9ISHHPDTvuFEru4+jxzsg==
X-CSE-MsgGUID: a0Vb7++0QYGn+ASfxWs+Kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,174,1712646000"; d="scan'208";a="32469419"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2024 03:05:16 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: "Wachowski, Karol" <karol.wachowski@intel.com>,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Eric Anholt <eric@anholt.net>, Rob Herring <robh@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, stable@vger.kernel.org,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH] drm/shmem-helper: Fix BUG_ON() on mmap(PROT_WRITE,
 MAP_PRIVATE)
Date: Mon, 20 May 2024 12:05:14 +0200
Message-ID: <20240520100514.925681-1-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.45.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: "Wachowski, Karol" <karol.wachowski@intel.com>

Lack of check for copy-on-write (COW) mapping in drm_gem_shmem_mmap
allows users to call mmap with PROT_WRITE and MAP_PRIVATE flag
causing a kernel panic due to BUG_ON in vmf_insert_pfn_prot:
BUG_ON((vma->vm_flags & VM_PFNMAP) && is_cow_mapping(vma->vm_flags));

Return -EINVAL early if COW mapping is detected.

This bug affects all drm drivers using default shmem helpers.
It can be reproduced by this simple example:
void *ptr = mmap(0, size, PROT_WRITE, MAP_PRIVATE, fd, mmap_offset);
ptr[0] = 0;

Fixes: 2194a63a818d ("drm: Add library for shmem backed GEM objects")
Cc: Noralf Trønnes <noralf@tronnes.org>
Cc: Eric Anholt <eric@anholt.net>
Cc: Rob Herring <robh@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v5.2+
Signed-off-by: Wachowski, Karol <karol.wachowski@intel.com>
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index 177773bcdbfd..885a62c2e1be 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -611,6 +611,9 @@ int drm_gem_shmem_mmap(struct drm_gem_shmem_object *shmem, struct vm_area_struct
 		return ret;
 	}
 
+	if (is_cow_mapping(vma->vm_flags))
+		return -EINVAL;
+
 	dma_resv_lock(shmem->base.resv, NULL);
 	ret = drm_gem_shmem_get_pages(shmem);
 	dma_resv_unlock(shmem->base.resv);
-- 
2.45.1

