Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 924D481C109
	for <lists+dri-devel@lfdr.de>; Thu, 21 Dec 2023 23:28:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E2F810E724;
	Thu, 21 Dec 2023 22:28:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A611E10E718;
 Thu, 21 Dec 2023 22:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703197694; x=1734733694;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2vlhA0Z+yUURdiyoYIjeL3Dtqhk6Yo4zPyy/4tJp7E4=;
 b=gqCTzPW/wqFay8vz4BrjTD5KVvLOh+gwbECapwSaDna8uCqBtiBBo0PC
 CETPJQKHDm6PwgEoFruLy8jaljtPIpQx6S7bkJnJDlQFddlF05KJP/gKb
 O0j0J82Z+5YgvEl950MxbbSCG2Hx8TFqXcsdZk4/YafJYExkJPnTYxWoi
 +6QaQmYzaITDOEFtmX6lfl8fFVTtxbShXxrvrlstcA6F632pg6yv43kjX
 YBXj3vOjqsRUdnJUMJaAj/A2/3mgQm+qWhAwqj+kUQPGFdGSemO3ORXIc
 ChFGoA6xJk441DCreFa045/4xYsz4tHDH6jZALMn52waSR8G30Krxm1F+ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="2876523"
X-IronPort-AV: E=Sophos;i="6.04,294,1695711600"; 
   d="scan'208";a="2876523"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2023 14:28:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="920458216"
X-IronPort-AV: E=Sophos;i="6.04,294,1695711600"; d="scan'208";a="920458216"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2023 14:28:14 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 3/6] drm/xe/mmio: Cast to u64 when printing
Date: Thu, 21 Dec 2023 14:28:06 -0800
Message-Id: <20231221222809.4123220-4-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231221222809.4123220-1-lucas.demarchi@intel.com>
References: <20231221222809.4123220-1-lucas.demarchi@intel.com>
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
Cc: Matthew Brost <matthew.brost@intel.com>, thomas.hellstrom@linux.intel.com,
 daniel.vetter@ffwll.ch, ogabbay@kernel.org,
 Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org,
 "Michael J . Ruhl" <michael.j.ruhl@intel.com>, Oak Zeng <oak.zeng@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, airlied@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

resource_size_t uses %pa format in printk since the size varies
depending on build options. However to keep the io_size/physical_size
addition in the same call we can't pass the address without adding yet
another variable in these function. Simply cast it to u64 and keep using
%llx.

Fixes: 286089ce6929 ("drm/xe: Improve vram info debug printing")
Cc: Oak Zeng <oak.zeng@intel.com>
Cc: Michael J. Ruhl <michael.j.ruhl@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_mmio.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index f660cfb79f50..5c46f2d0b6dc 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -272,8 +272,8 @@ int xe_mmio_probe_vram(struct xe_device *xe)
 		drm_info(&xe->drm, "VRAM[%u, %u]: Actual physical size %pa, usable size exclude stolen %pa, CPU accessible size %pa\n", id,
 			 tile->id, &tile->mem.vram.actual_physical_size, &tile->mem.vram.usable_size, &tile->mem.vram.io_size);
 		drm_info(&xe->drm, "VRAM[%u, %u]: DPA range: [%pa-%llx], io range: [%pa-%llx]\n", id, tile->id,
-			 &tile->mem.vram.dpa_base, tile->mem.vram.dpa_base + tile->mem.vram.actual_physical_size,
-			 &tile->mem.vram.io_start, tile->mem.vram.io_start + tile->mem.vram.io_size);
+			 &tile->mem.vram.dpa_base, tile->mem.vram.dpa_base + (u64)tile->mem.vram.actual_physical_size,
+			 &tile->mem.vram.io_start, tile->mem.vram.io_start + (u64)tile->mem.vram.io_size);
 
 		/* calculate total size using tile size to get the correct HW sizing */
 		total_size += tile_size;
-- 
2.40.1

