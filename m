Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0FF470E8F
	for <lists+dri-devel@lfdr.de>; Sat, 11 Dec 2021 00:24:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8D2D10E574;
	Fri, 10 Dec 2021 23:24:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E505610E57F;
 Fri, 10 Dec 2021 23:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639178651; x=1670714651;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aqh3fjrZFwZQdyV8F2E3MUV9jSvhWsBpM7NLkE5MlFc=;
 b=NjVDNRkTWKV2nh/os6rPFZGayLvVr7+HHXJwqnUHzqaWaKeJJexqsYOx
 SvcnGCAk9kqh0+0RR69I3WMEoIpL+aHWPlGggp53mja4dAzLQoVd+nEig
 uIto9jJ5GGvql+y0HMi3cyQLiid7fKjK7QS5pLic9MEtNjCTQUWs4Vn4q
 kJUltbhs3efjFe7crWrGR/GD1w6tek1IE0Uj9jWrt9VuBmHkJWTYbg81D
 hCJKTwCZh7XUzeuNUcB9P9Z3VCpGCKfAlq2u9jqfaYB2r56NFfCDfiTJg
 Kk7yGSJt42iAYLmisEsXICN/CPBqvKdaM7Gs4CBsJLZHURWZp4VXt5cZ3 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10194"; a="237212365"
X-IronPort-AV: E=Sophos;i="5.88,196,1635231600"; d="scan'208";a="237212365"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2021 15:24:10 -0800
X-IronPort-AV: E=Sophos;i="5.88,196,1635231600"; d="scan'208";a="463861444"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2021 15:24:09 -0800
From: ira.weiny@intel.com
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Subject: [PATCH 2/7] drm/amd: Replace kmap() with kmap_local_page()
Date: Fri, 10 Dec 2021 15:23:59 -0800
Message-Id: <20211210232404.4098157-3-ira.weiny@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211210232404.4098157-1-ira.weiny@intel.com>
References: <20211210232404.4098157-1-ira.weiny@intel.com>
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
index c875f1cdd2af..a3a2c73a44bb 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -2281,9 +2281,9 @@ static ssize_t amdgpu_iomem_read(struct file *f, char __user *buf,
 		if (p->mapping != adev->mman.bdev.dev_mapping)
 			return -EPERM;
 
-		ptr = kmap(p);
+		ptr = kmap_local_page(p);
 		r = copy_to_user(buf, ptr + off, bytes);
-		kunmap(p);
+		kunmap_local(ptr);
 		if (r)
 			return -EFAULT;
 
@@ -2332,9 +2332,9 @@ static ssize_t amdgpu_iomem_write(struct file *f, const char __user *buf,
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

