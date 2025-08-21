Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD310B2EB90
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 05:01:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DA5910E36E;
	Thu, 21 Aug 2025 03:01:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="O1MLVRWv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACF4C10E36E;
 Thu, 21 Aug 2025 03:01:35 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-245f19aab6aso3465975ad.0; 
 Wed, 20 Aug 2025 20:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755745295; x=1756350095; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2VBfgPDwHJj9xeq+UdTpIXwDQvBU8YAhfbNleYLr6cA=;
 b=O1MLVRWv4VbAAOAHr47jGPq4UQxe/q0XJqei0vo0KEONtyNEXPFSDRQQpR+eCoWwQJ
 kGNR7JelO4gEwXY37qlhOPgmPyCV4vuaNehVgcAPQTIVESaMPYwOmeMeTemAf/JxVjQe
 JdlqEd5kEe6+Clw51kqUZjQdCw3N/ndXAA0iS2MqUe7J9Hlz7UvsYCVlZHSvkBq4IE74
 Sh5GOGvI3dSLa8riYsm3vyzvBW1mSEDFMx6JXnmwW3ZfXoFCGiILgEiv3bqOFPahm2Pb
 TaHn7yrPwrD0vxtm6kBRJVPbYw8guCLKASUHfMmH6iEYGve4n14eKt8RUuFkl5xrscSp
 rEsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755745295; x=1756350095;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2VBfgPDwHJj9xeq+UdTpIXwDQvBU8YAhfbNleYLr6cA=;
 b=e1xh89EXPto6eGWZ7Nnw25oYvbWXRR+kBhEFesgREQ+YMujrhfaNmvx/dIen99lJ4H
 OBuLinb7R+BKUuM8a++7+V2x5SdURphMaAWMcJueDFJbdqV27qVzd1PBSxqxbmQZiNUA
 gOs+OvmheMkFQoyEP9wkyPFIPUH5ka362YWmF2j34XseCaJQA185JpytOL8DG8OxFszl
 PY6hHhCVWI4Bz5rIcp7JWWRr6kTDBTPRxW/cv0FPJwi7qXr25WJLRVscHDJINc9bDxEj
 vYu9Z5xTqT6xw+0StaO3LdFwU3F73GcbIY4c5jnV6smfTIgcB0c7peJWj1zLPeewgjpy
 Ke1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVbTx5M28WWIoay1OIgRHtIrpMaegjNRS7zRTFRNzDpHinVRl+njCXTnrA4vO5yOf7mBt8aeIBx@lists.freedesktop.org,
 AJvYcCXPU650gpyAY/9Ga5iwWrpSTogRiQHWx8hPGuy2cLmLaLP9UTsFbNymSocL5U+BMmkCK8OR59SDq2tK@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzGT9x4TjpWdrU3sl4oxUQA1gHDwOVqP5PtFjo01XaFDUsCiadD
 5IWBF/1MqGjDLCz8K9cAwQWyu1f6jl+D64s3uU3cON0ijC5JVtClMZnR
X-Gm-Gg: ASbGnct9I904g31W+M417MFpX4en1Tq1ipZhaCtCgnfsbtIhSNa0FCBODGI95eJZGVA
 ipOZXHjsNWkB6TjfvwH3Q6DA2bPtu1g/9cxynKcLjrl/ntgBLXoi4Mm3MMFzfmJC7xqpuXGtpM8
 +M7fGsOIGJUKNkzAlKhJssB/ibdj1bUAPi3OhE+LRJEjIcSSG44Js4ku5XWvm413Z8xUU8WozZS
 zq1xdgMPNQPGtcIdAW75RSyuZhE9HoZIKJpEtswRTesGTxQU2NY5ODl6f1AmX95/6SmsJJanOEi
 k0PJpQO2OFQojRed6Nuhe8C1uA4T+W/mPAxs/s6l337UiDVMmA0G4az+dXS/qh3Wsm6Id+5c5aZ
 05UUJaJ0pMH7yBpPp9n1ACEZ+3B+GdydWch65Hw==
X-Google-Smtp-Source: AGHT+IEV1Zcxig6B84KjoGLmnQxYJfI8WE6NEw3RyN2c/rW4MMbT3R26Q1g5buZcviTpIuDd25neeA==
X-Received: by 2002:a17:902:db07:b0:234:9656:7db9 with SMTP id
 d9443c01a7336-245fedcc650mr13272515ad.32.1755745294859; 
 Wed, 20 Aug 2025 20:01:34 -0700 (PDT)
Received: from lkmp.. ([49.37.161.210]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-245ed4c73f2sm40160695ad.94.2025.08.20.20.01.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Aug 2025 20:01:34 -0700 (PDT)
From: Rakuram Eswaran <rakuram.e96@gmail.com>
To: linux-doc@vger.kernel.org, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@gmail.com, corbet@lwn.net
Cc: tzimmermann@suse.de, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 simona@ffwll.ch, siqueira@igalia.com, harry.wentland@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, skhan@linuxfoundation.org,
 rakuram.e96@gmail.com, Randy Dunlap <rdunlap@infradead.org>,
 Alexander Deucher <Alexander.Deucher@amd.com>
Subject: [PATCH v2 1/2] docs: gpu: amdgpu: Fix spelling in amdgpu documentation
Date: Thu, 21 Aug 2025 08:29:55 +0530
Message-ID: <20250821025957.22546-2-rakuram.e96@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250821025957.22546-1-rakuram.e96@gmail.com>
References: <20250821025957.22546-1-rakuram.e96@gmail.com>
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

Fixed following typos reported by Codespell

1. propogated ==> propagated
   aperatures ==> apertures
In Documentation/gpu/amdgpu/debugfs.rst

2. parition ==> partition
In Documentation/gpu/amdgpu/process-isolation.rst

3. conections ==> connections
In Documentation/gpu/amdgpu/display/programming-model-dcn.rst

In addition to above,
Fixed wrong bit-partition naming in gpu/amdgpu/process-isolation.rst
from "fourth" partition to "third" partition.

Suggested-by: Randy Dunlap <rdunlap@infradead.org>
Suggested-by: Alexander Deucher <Alexander.Deucher@amd.com>
Signed-off-by: Rakuram Eswaran <rakuram.e96@gmail.com>
---
 Documentation/gpu/amdgpu/debugfs.rst                       | 4 ++--
 Documentation/gpu/amdgpu/display/programming-model-dcn.rst | 2 +-
 Documentation/gpu/amdgpu/process-isolation.rst             | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

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
index 6b6d70e357a7..25b06ffefc33 100644
--- a/Documentation/gpu/amdgpu/process-isolation.rst
+++ b/Documentation/gpu/amdgpu/process-isolation.rst
@@ -26,7 +26,7 @@ Example of enabling enforce isolation on a GPU with multiple partitions:
     $ cat /sys/class/drm/card0/device/enforce_isolation
     1 0 1 0
 
-The output indicates that enforce isolation is enabled on zeroth and second parition and disabled on first and fourth parition.
+The output indicates that enforce isolation is enabled on zeroth and second partition and disabled on first and third partition.
 
 For devices with a single partition or those that do not support partitions, there will be only one element:
 
-- 
2.43.0

