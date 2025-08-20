Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E22EB2E51D
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 20:39:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E2AF10E7CE;
	Wed, 20 Aug 2025 18:39:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="G+ZW4dsx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61F4710E7BF;
 Wed, 20 Aug 2025 18:23:26 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id
 41be03b00d2f7-b474e8d6d04so99590a12.0; 
 Wed, 20 Aug 2025 11:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755714206; x=1756319006; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qJD17dHXBpBddqd9ZQM59zYB7xSPsARGmN3EqdaDYYk=;
 b=G+ZW4dsxJZQPg81EEiK3kpnWvfZg7pjGS915eVbge//OuyTO/Qb5jtCOb+zGu0Pzvb
 mkaig3R80cDJIR3S9K/gehO6HZ9aKcSyP98NJiwlAmsN1Chu9erai6VDNbeCDPqHgp9A
 z8UfGM1gT4evW7y3GxiCoYgJEk2j+uBY0aApYGWoeNocVmotvs62IWaR/C7mucYyWmDc
 PpsQoJw/HRemFsJ25BlxMstTpDdvHOLPNf5FBy7QBgyc4yggJTKPIdjLy6wD3WgToDHn
 ZRiNclbTm9GO9PgVyBObFuZVyayqWZxOV6c16UlTSDYY8IzIXRmV5yadszcVeDbszGfb
 bRQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755714206; x=1756319006;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qJD17dHXBpBddqd9ZQM59zYB7xSPsARGmN3EqdaDYYk=;
 b=L1MufdrXX1S1rWdsuC41UVkldAk9lbqI9mCrQtk7YhoKhEZ2BAqf+KKZTp6klMa4RG
 G9RFyrUL/tIGVtXdvY0Ibiv71lfgRRWlYbhYZ9F4zmiy6urJlKRyHxUfCIypDicuzEVj
 rHbb0c9UwA9Hj8L8rZbfGGrFE1O2r5GFXu6LN95mO+o8AmUlnWGDe+dMt5LZKFoRz85x
 6DdD5cv9CK5sdejahLXT2R/4yafe0yKtau9FQD7hWglUpwzqIUz70FC4LyuNVdTCC5JS
 Cxo/yAdK2h9NSbbM53AhOBeenQpxdmo6AeO+kzk0Gcod7oeeK+Y6qjyskldNitXBoxGv
 Yfdw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1I2Hj1/4096g2M22xnkGAMsiD3E6QQFlrUopLsBI+fM0N1cJ3Q+ov5/npTRdc9Rx12YXXrR6Lvl3I@lists.freedesktop.org,
 AJvYcCXFPDzLmxvoVCEdZ2e4wQFTsFkeX+DER3tCLzhxxwpRIvWdM1YVyP2GCky0LBRvU3D7nDYPjLvF@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy021MGE8EWR67sCJ9xs4JcbwCJHA6lJNaBFUXOI7h5S8RmZpGh
 lx5xQVgscQpImPiuYIR0BxQLFQsCGwsttNwviBNSsY/Ld0T3g/SxUUXo
X-Gm-Gg: ASbGncuym7iXpOlbvTgw3YVANc92l9NICw+gIqGYFqAn376GyVVa3OzdyVIYOK19WEb
 dPg3WKawyrNr+hzeRi25YOrrGFaIP4/1JljaZb1F+mSH1WOwgW8Q/MPdqT2McQfcWzGI5KyJudh
 WsMdMIboSS/y3s+lIbn3v3QE5J82Gl8syQbH+c6cgrBKiIIRykC8Gw8gPVsfSaYAJpGsOfypTQ9
 gkmmqD3pHDGJV4maAKTGx9mVFxJTVm4oWQWw9SG14/lJjAhC8YDMaFsBgqw9BwTSsjQc8fnYr26
 uqsfb35igCkey3kSZhQh3TfYGmkzE9a6a0sXoWKf2TPTKYgMEd47pat0pZUgr0J8D0YbpNGcFHy
 oo3+UTsn7vdHNk0tx/wBgnZKKBGU=
X-Google-Smtp-Source: AGHT+IGxVHwxWzd0VLZskRkya2/ny1iDGS9Hg+m0NaghOzwqRevtboYxJh4mBs1hCDsOMv5cLgK6Fg==
X-Received: by 2002:a17:903:13cf:b0:240:150e:57ba with SMTP id
 d9443c01a7336-245ef0d5a4dmr50329185ad.3.1755714205396; 
 Wed, 20 Aug 2025 11:23:25 -0700 (PDT)
Received: from lkmp.. ([49.37.163.128]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-324e2643bafsm2956636a91.23.2025.08.20.11.23.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Aug 2025 11:23:25 -0700 (PDT)
From: Rakuram Eswaran <rakuram.e96@gmail.com>
To: linux-doc@vger.kernel.org, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@gmail.com, corbet@lwn.net
Cc: tzimmermann@suse.de, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 simona@ffwll.ch, siqueira@igalia.com, harry.wentland@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, skhan@linuxfoundation.org,
 rakuram.e96@gmail.com
Subject: [PATCH] docs: gpu: Fix spelling mistakes
Date: Wed, 20 Aug 2025 23:52:58 +0530
Message-ID: <20250820182259.11227-1-rakuram.e96@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 20 Aug 2025 18:39:50 +0000
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

Fixed following typos reported by Codespell

1. filp ==> flip
In Documentation/gpu/drm-mm.rst

2. complection ==> completion
   implementions ==> implementations
In Documentation/gpu/todo.rst

3. unpriviledged ==> unprivileged
In Documentation/gpu/drm-uapi.rst

4. propogated ==> propagated
   aperatures ==> apertures
In Documentation/gpu/amdgpu/debugfs.rst

5. parition ==> partition
In Documentation/gpu/amdgpu/process-isolation.rst

6. conections ==> connections
In Documentation/gpu/amdgpu/display/programming-model-dcn.rst

Signed-off-by: Rakuram Eswaran <rakuram.e96@gmail.com>
---
 Documentation/gpu/amdgpu/debugfs.rst                       | 4 ++--
 Documentation/gpu/amdgpu/display/programming-model-dcn.rst | 2 +-
 Documentation/gpu/amdgpu/process-isolation.rst             | 2 +-
 Documentation/gpu/drm-mm.rst                               | 2 +-
 Documentation/gpu/drm-uapi.rst                             | 2 +-
 Documentation/gpu/todo.rst                                 | 4 ++--
 6 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/Documentation/gpu/amdgpu/debugfs.rst b/Documentation/gpu/amdgpu/debugfs.rst
index 5150d0a95658..151d8bfc79e2 100644
--- a/Documentation/gpu/amdgpu/debugfs.rst
+++ b/Documentation/gpu/amdgpu/debugfs.rst
@@ -94,7 +94,7 @@ amdgpu_error_<name>
 -------------------
 
 Provides an interface to set an error code on the dma fences associated with
-ring <name>.  The error code specified is propogated to all fences associated
+ring <name>.  The error code specified is propagated to all fences associated
 with the ring.  Use this to inject a fence error into a ring.
 
 amdgpu_pm_info
@@ -165,7 +165,7 @@ GTT memory.
 amdgpu_regs_*
 -------------
 
-Provides direct access to various register aperatures on the GPU.  Used
+Provides direct access to various register apertures on the GPU.  Used
 by tools like UMR to access GPU registers.
 
 amdgpu_regs2
diff --git a/Documentation/gpu/amdgpu/display/programming-model-dcn.rst b/Documentation/gpu/amdgpu/display/programming-model-dcn.rst
index c1b48d49fb0b..bc7de97a746f 100644
--- a/Documentation/gpu/amdgpu/display/programming-model-dcn.rst
+++ b/Documentation/gpu/amdgpu/display/programming-model-dcn.rst
@@ -100,7 +100,7 @@ represents the connected display.
    For historical reasons, we used the name `dc_link`, which gives the
    wrong impression that this abstraction only deals with physical connections
    that the developer can easily manipulate. However, this also covers
-   conections like eDP or cases where the output is connected to other devices.
+   connections like eDP or cases where the output is connected to other devices.
 
 There are two structs that are not represented in the diagram since they were
 elaborated in the DCN overview page  (check the DCN block diagram :ref:`Display
diff --git a/Documentation/gpu/amdgpu/process-isolation.rst b/Documentation/gpu/amdgpu/process-isolation.rst
index 6b6d70e357a7..c1297a9e4d09 100644
--- a/Documentation/gpu/amdgpu/process-isolation.rst
+++ b/Documentation/gpu/amdgpu/process-isolation.rst
@@ -26,7 +26,7 @@ Example of enabling enforce isolation on a GPU with multiple partitions:
     $ cat /sys/class/drm/card0/device/enforce_isolation
     1 0 1 0
 
-The output indicates that enforce isolation is enabled on zeroth and second parition and disabled on first and fourth parition.
+The output indicates that enforce isolation is enabled on zeroth and second partition and disabled on first and fourth partition.
 
 For devices with a single partition or those that do not support partitions, there will be only one element:
 
diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
index d55751cad67c..3496ef28b15c 100644
--- a/Documentation/gpu/drm-mm.rst
+++ b/Documentation/gpu/drm-mm.rst
@@ -153,7 +153,7 @@ size in bytes.
 GEM uses shmem to allocate anonymous pageable memory.
 drm_gem_object_init() will create an shmfs file of the
 requested size and store it into the struct :c:type:`struct
-drm_gem_object <drm_gem_object>` filp field. The memory is
+drm_gem_object <drm_gem_object>` flip field. The memory is
 used as either main storage for the object when the graphics hardware
 uses system memory directly or as a backing store otherwise.
 
diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
index 843facf01b2d..7435664a1ffe 100644
--- a/Documentation/gpu/drm-uapi.rst
+++ b/Documentation/gpu/drm-uapi.rst
@@ -535,7 +535,7 @@ ENOSPC:
 EPERM/EACCES:
         Returned for an operation that is valid, but needs more privileges.
         E.g. root-only or much more common, DRM master-only operations return
-        this when called by unpriviledged clients. There's no clear
+        this when called by unprivileged clients. There's no clear
         difference between EACCES and EPERM.
 
 ENODEV:
diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index be8637da3fe9..1d064e617699 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -319,7 +319,7 @@ everything after it has done the write-protect/mkwrite trickery:
 
       vma->vm_page_prot = pgprot_wrprotect(vma->vm_page_prot);
 
-- Set the mkwrite and fsync callbacks with similar implementions to the core
+- Set the mkwrite and fsync callbacks with similar implementations to the core
   fbdev defio stuff. These should all work on plain ptes, they don't actually
   require a struct page.  uff. These should all work on plain ptes, they don't
   actually require a struct page.
@@ -854,7 +854,7 @@ Querying errors from drm_syncobj
 ================================
 
 The drm_syncobj container can be used by driver independent code to signal
-complection of submission.
+completion of submission.
 
 One minor feature still missing is a generic DRM IOCTL to query the error
 status of binary and timeline drm_syncobj.
-- 
2.43.0

