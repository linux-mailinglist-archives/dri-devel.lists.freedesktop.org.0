Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D22600280
	for <lists+dri-devel@lfdr.de>; Sun, 16 Oct 2022 19:42:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72B8410E65A;
	Sun, 16 Oct 2022 17:42:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E29AC10E8CA;
 Sun, 16 Oct 2022 17:42:05 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id j7so15114337wrr.3;
 Sun, 16 Oct 2022 10:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=eBoyZFJd/AMWfSTDdNDFLh542tiq7KT1lMhtwEfLBl4=;
 b=cyxXVAEqs04ujc9hmfAVf30HVL/pCnILfipPspTFlkQBjzFFQhNOx+3Hsnzv8IBT5Q
 mKEvizN9ZqA35pVXIw+GnMESFPCSiwgqiFLfLgeFQnvtyFNuAjpc5GCL4mrlNm6layTT
 tfKBWW0JurCzaM0BbS5VuSKwloE83tjuPMpK4CwXtoV1MMeTgVT1ms7B1Pvn5ROcOGB2
 SkafGbGxB2jHqrTZaiTeYenHuoz4h7csoYTfWJxsVMuLmwu3efBD4YWun6Q0xYkebQe2
 ZGrPENmNa2okAP3iFZNF+4OO8IfxofZNsEwgG4ir3pkbao1kcw9L0KinBv55MTRKeKK+
 /hUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eBoyZFJd/AMWfSTDdNDFLh542tiq7KT1lMhtwEfLBl4=;
 b=gd9O+QMaTmeFgqqHLYiOTFNIHZfzZ7PDy8gCpJP6N1l53hEqgmRvlUxBVAFkDvD/8a
 bgfScxFtUuWR5jevV3T7nZNgAW1PmgbfFPhWSaxBG9UyoqAWnlP7Aj/ZGT+GusQV0a8H
 Imkev+gy80FjH8yIA2hSrP7ywiAax2tapqIC8hLUbZ7uFediIKbDmfL8Y/20HISp2HOb
 uuW1MBuQ57BdI3YEQA9GHClu8AZRPupxl2GD/eeEpCVeMs+9UO+WrMKDh5Yb3QgA1B0H
 ooOV4Iz6YtLM7DroIGilQ4GLqWtu8ZJixL5fjHn+FShBzrP7kI1Dd3XvwuqJEhv6eQQ5
 Gu0A==
X-Gm-Message-State: ACrzQf1LqGFRkHXASPEIFq3bL0bZQykY1LRN2hVBvqRtt5A+i0Kp//m1
 krzRWoVkShrk5Cun+IPRFVM=
X-Google-Smtp-Source: AMsMyM6FtrFrf3Ic4dkdXt5cwMkRyUmfIFJPYxWdF1OUS04XhPgPbujAr60TrkylIRaojiJMB3TjZw==
X-Received: by 2002:a05:6000:1689:b0:22e:2c03:36e7 with SMTP id
 y9-20020a056000168900b0022e2c0336e7mr4464896wrd.252.1665942124233; 
 Sun, 16 Oct 2022 10:42:04 -0700 (PDT)
Received: from localhost.localdomain
 (host-95-250-231-122.retail.telecomitalia.it. [95.250.231.122])
 by smtp.gmail.com with ESMTPSA id
 p14-20020a05600c468e00b003c6f3e5ba42sm2820940wmo.46.2022.10.16.10.42.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Oct 2022 10:42:03 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Hawking Zhang <Hawking.Zhang@amd.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>, Tao Zhou <tao.zhou1@amd.com>,
 Jack Xiao <Jack.Xiao@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [RESEND PATCH] drm/amd/amdgpu: Replace kmap() with kmap_local_page()
Date: Sun, 16 Oct 2022 19:41:58 +0200
Message-Id: <20221016174158.16638-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.38.0
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
Cc: Ira Weiny <ira.weiny@intel.com>,
 "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

kmap() is being deprecated in favor of kmap_local_page().

There are two main problems with kmap(): (1) It comes with an overhead as
mapping space is restricted and protected by a global lock for
synchronization and (2) it also requires global TLB invalidation when the
kmap’s pool wraps and it might block when the mapping space is fully
utilized until a slot becomes available.

With kmap_local_page() the mappings are per thread, CPU local, can take
page faults, and can be called from any context (including interrupts).
It is faster than kmap() in kernels with HIGHMEM enabled. Furthermore,
the tasks can be preempted and, when they are scheduled to run again, the
kernel virtual addresses are restored and are still valid.

Since its use in amdgpu/amdgpu_ttm.c is safe, it should be preferred.

Therefore, replace kmap() with kmap_local_page() in amdgpu/amdgpu_ttm.c.

Suggested-by: Ira Weiny <ira.weiny@intel.com>
Acked-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---

I'm resending because I suspect that this patch might have been lost. In
the meantime I added an "Acked-by" tag from Christian K.. Obviviously,
there are no further changes in the code.

 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 3b4c19412625..c11657b5915f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -2301,9 +2301,9 @@ static ssize_t amdgpu_iomem_read(struct file *f, char __user *buf,
 		if (p->mapping != adev->mman.bdev.dev_mapping)
 			return -EPERM;
 
-		ptr = kmap(p);
+		ptr = kmap_local_page(p);
 		r = copy_to_user(buf, ptr + off, bytes);
-		kunmap(p);
+		kunmap_local(ptr);
 		if (r)
 			return -EFAULT;
 
@@ -2352,9 +2352,9 @@ static ssize_t amdgpu_iomem_write(struct file *f, const char __user *buf,
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
2.37.1

