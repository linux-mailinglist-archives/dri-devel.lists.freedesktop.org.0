Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7F749770F
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 02:54:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD09B10E57B;
	Mon, 24 Jan 2022 01:54:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FA1410E343;
 Mon, 24 Jan 2022 01:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642989254; x=1674525254;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RJ38NFsCxCGkkXpWENl1lI1EVp6t2oKoNxmZY3ee8wg=;
 b=CgThPryLL8fp3ibUG6UG81aSWGm1CglCZj5jOmTBcIV/lDwvongHh8hv
 nFKqwDR1YXjvdz9/dor7RZo21sDHCd6B0pKBl2KPnwe0GApP6uQ6cMma5
 m84gkiKPTSl8gQct6vujrOn6SYoaMDRJCjqjopEjNGchmk0Njo5eSDXyl
 CMCv77cs1q+8AXHe4+E443UbgG/XJxIn93arbjBVNNozeyIJM972kHOOG
 +Pk9Uqp0H+mF5GXfoFObT4tdrZIL0su5QmhrmfLgHsaUV8p7G3Rhv+SGI
 pbtRrYXmGXQnlqiCZ2RWM/TWXMj92lYmOkqHVj+ichdxnclPy++sdgw0g w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10236"; a="226616218"
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; d="scan'208";a="226616218"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2022 17:54:13 -0800
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; d="scan'208";a="627320389"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2022 17:54:13 -0800
From: ira.weiny@intel.com
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Subject: [PATCH V2 2/7] drm/amd: Replace kmap() with kmap_local_page()
Date: Sun, 23 Jan 2022 17:54:04 -0800
Message-Id: <20220124015409.807587-3-ira.weiny@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220124015409.807587-1-ira.weiny@intel.com>
References: <20220124015409.807587-1-ira.weiny@intel.com>
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
Cc: linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Ira Weiny <ira.weiny@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ira Weiny <ira.weiny@intel.com>

kmap() is being deprecated.  These maps are thread local and can be
replaced with kmap_local_page().

Replace kmap() with kmap_local_page()

Signed-off-by: Ira Weiny <ira.weiny@intel.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 5c3f24069f2a..54973824f8f9 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -2272,9 +2272,9 @@ static ssize_t amdgpu_iomem_read(struct file *f, char __user *buf,
 		if (p->mapping != adev->mman.bdev.dev_mapping)
 			return -EPERM;
 
-		ptr = kmap(p);
+		ptr = kmap_local_page(p);
 		r = copy_to_user(buf, ptr + off, bytes);
-		kunmap(p);
+		kunmap_local(ptr);
 		if (r)
 			return -EFAULT;
 
@@ -2323,9 +2323,9 @@ static ssize_t amdgpu_iomem_write(struct file *f, const char __user *buf,
 		if (p->mapping != adev->mman.bdev.dev_mapping)
 			return -EPERM;
 
-		ptr = kmap(p);
+		ptr = kmap_local_page(p);
 		r = copy_from_user(ptr + off, buf, bytes);
-		kunmap(p);
+		kunmap_local(ptr);
 		if (r)
 			return -EFAULT;
 
-- 
2.31.1

