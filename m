Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A7557FC5B
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jul 2022 11:27:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D3252B454;
	Mon, 25 Jul 2022 09:26:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B85B32BA8A;
 Mon, 25 Jul 2022 09:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658741197; x=1690277197;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3/KYF6zMSfA8GMeQGkJ+lLvI5E2TF0sPmk9vV/KyNZw=;
 b=QZlh2QXPuCMleyMeGoF0n7bSJ2MaIolQnUpDXuDh/eHXzf15uVmeuxHN
 xdfOuJZeYy7ib8LX09KF+ggklssw+S1F6E+GEUIOpJ6shcftD0XFS8JGf
 QC2SMXG35iWcGW9GDlp9aK8n3sV8cJQ0tGoeGV7bgwXaGPmtX9+cRSfWg
 JJdwZLaQBl9+Pfplep3RYx/ZbNejIwXIfs8QZI+nZLtbPln12LxuitpF+
 i5uHrkmSQ6cFLI1P07Fyu3lEqom+QppgqSY2CO8gxmVrbUhOZagijv8qR
 ly/JcEgfXuR2yqO+12zovccx+3pFG5HzfdK3SF9Xo/OBWv98w9srsmJRj A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10418"; a="268047821"
X-IronPort-AV: E=Sophos;i="5.93,192,1654585200"; d="scan'208";a="268047821"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2022 02:26:32 -0700
X-IronPort-AV: E=Sophos;i="5.93,192,1654585200"; d="scan'208";a="926823860"
Received: from abaruah-mobl.gar.corp.intel.com (HELO hades.ger.corp.intel.com)
 ([10.249.37.11])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2022 02:26:30 -0700
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v5 5/7] drm/i915: Check if the size is too big while creating
 shmem file
Date: Mon, 25 Jul 2022 12:25:26 +0300
Message-Id: <20220725092528.1281487-6-gwan-gyeong.mun@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220725092528.1281487-1-gwan-gyeong.mun@intel.com>
References: <20220725092528.1281487-1-gwan-gyeong.mun@intel.com>
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
Cc: thomas.hellstrom@linux.intel.com, jani.nikula@intel.com,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk, airlied@linux.ie,
 matthew.auld@intel.com, mchehab@kernel.org, nirmoy.das@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The __shmem_file_setup() function returns -EINVAL if size is greater than
MAX_LFS_FILESIZE. To handle the same error as other code that returns
-E2BIG when the size is too large, it add a code that returns -E2BIG when
the size is larger than the size that can be handled.

v4: If BITS_PER_LONG is 32, size > MAX_LFS_FILESIZE is always false, so it
    checks only when BITS_PER_LONG is 64.

Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>
Reported-by: kernel test robot <lkp@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
index 604e8829e8ea..d41569ca6999 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
@@ -541,6 +541,20 @@ static int __create_shmem(struct drm_i915_private *i915,
 
 	drm_gem_private_object_init(&i915->drm, obj, size);
 
+	/* XXX: The __shmem_file_setup() function returns -EINVAL if size is
+	 * greater than MAX_LFS_FILESIZE.
+	 * To handle the same error as other code that returns -E2BIG when
+	 * the size is too large, we add a code that returns -E2BIG when the
+	 * size is larger than the size that can be handled.
+	 * If BITS_PER_LONG is 32, size > MAX_LFS_FILESIZE is always false,
+	 * so we only needs to check when BITS_PER_LONG is 64.
+	 * If BITS_PER_LONG is 32, E2BIG checks are processed when
+	 * i915_gem_object_size_2big() is called before init_object() callback
+	 * is called.
+	 */
+	if (BITS_PER_LONG == 64 && size > MAX_LFS_FILESIZE)
+		return -E2BIG;
+
 	if (i915->mm.gemfs)
 		filp = shmem_file_setup_with_mnt(i915->mm.gemfs, "i915", size,
 						 flags);
-- 
2.34.1

