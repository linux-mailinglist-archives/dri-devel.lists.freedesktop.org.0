Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E4415255B
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2020 04:49:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7A1A6F45C;
	Wed,  5 Feb 2020 03:49:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A5256F459;
 Wed,  5 Feb 2020 03:49:09 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id p14so463316pfn.4;
 Tue, 04 Feb 2020 19:49:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vuEm2HIzfORxBaF7Sullv2s7r/FUJ9zIHEgHHa10pSk=;
 b=fCkOn43C99OoRB2Fhs9Z8ilknGM+fIe6rMXzNw8DfEVFMkw1jcWGmHUoACvGV7Oaf+
 hwORpJBG4s6i+UraPxLWNK0vEn6V6qqoRoUlJlA9shwGcxPgTF8muADC8CxxH7RRWLvl
 PtKToLjEFSGw/ljwuJsgbb+anU5zEyctUnUVJ950DSULtxgyql6GRO6nMozm8UjMuIZE
 uqzsGNPYJSJKYvotbDpIr983rdWu6/dEekdBRMOK1TlrESFe94cpVA9/aJwT31w05VwF
 LROf1aKHSPbHm2cfvAabOvuYvY9HgVC0E+Xj5ycVeUGKZWB9dZ4bpp6foNzPWLB2JQMf
 tHUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vuEm2HIzfORxBaF7Sullv2s7r/FUJ9zIHEgHHa10pSk=;
 b=Vnqe3NDZ75JQ1nEp2ULMHzHVVkPPN38XJi67tPRJysGpRvosuvdD+uxdVfuRFIP/9P
 Cw3/fx/LWBekTdRKpXGsK7x2ksgPtDsGd7AKXEvR3o3z4uSco+d5KbSHHM7cp9I60GQi
 Ks7lHZkEB1uFBFzGHAIbfO1RJxB69H/TyxlgCytdGb0xR6QLCDpnjZu7mEWulQPoMIne
 dJuw4Uk7D6ZwmiHn0L5a2x8Mk3PjUOutNbyoJIi+B84ajMhQg/i/7Wani1d2NTF/uktY
 meIU/FthMPn7FtoToi3rDh/by4klstorBP0EkfsuJS9RrCJkB2zp+xKSJOlw6OHANwkj
 9KHw==
X-Gm-Message-State: APjAAAXAq7068mlXalYQVfQ6L9D6KV/puOL159h7gpv/yPsWGSE5bBcB
 EZ5nScVYhkab3ZAHONwEgt/HyHOD
X-Google-Smtp-Source: APXvYqy/VATuePuQxvum9YXMQmTT2XOWOMI/0SNAyG+CmMip0GhLq1nYXoXce3eIMHTUh1PpQtOKmg==
X-Received: by 2002:a63:cd43:: with SMTP id a3mr23758443pgj.247.1580874548555; 
 Tue, 04 Feb 2020 19:49:08 -0800 (PST)
Received: from localhost.localdomain ([71.219.59.120])
 by smtp.gmail.com with ESMTPSA id 200sm25320292pfz.121.2020.02.04.19.49.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Feb 2020 19:49:08 -0800 (PST)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 04/14] drm/amdgpu/sa: move debugfs init into core amdgpu
 debugfs
Date: Tue,  4 Feb 2020 22:48:42 -0500
Message-Id: <20200205034852.4157-5-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200205034852.4157-1-alexander.deucher@amd.com>
References: <20200205034852.4157-1-alexander.deucher@amd.com>
MIME-Version: 1.0
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In order to remove the load and unload drm callbacks,
we need to reorder the init sequence to move all the drm
debugfs file handling.  Do this for SA (sub allocator).

Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c | 4 ++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c      | 7 ++-----
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h  | 1 +
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
index c1d66cc6e6d8..84c5e9f23c76 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
@@ -1241,6 +1241,10 @@ int amdgpu_debugfs_init(struct amdgpu_device *adev)
 		return r;
 	}
 
+	if (amdgpu_debugfs_sa_init(adev)) {
+		dev_err(adev->dev, "failed to register debugfs file for SA\n");
+	}
+
 	return amdgpu_debugfs_add_files(adev, amdgpu_debugfs_list,
 					ARRAY_SIZE(amdgpu_debugfs_list));
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c
index 6e0f97afb030..abf286f2bc5e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c
@@ -48,7 +48,6 @@
  * produce command buffers which are send to the kernel and
  * put in IBs for execution by the requested ring.
  */
-static int amdgpu_debugfs_sa_init(struct amdgpu_device *adev);
 
 /**
  * amdgpu_ib_get - request an IB (Indirect Buffer)
@@ -295,9 +294,7 @@ int amdgpu_ib_pool_init(struct amdgpu_device *adev)
 	}
 
 	adev->ib_pool_ready = true;
-	if (amdgpu_debugfs_sa_init(adev)) {
-		dev_err(adev->dev, "failed to register debugfs file for SA\n");
-	}
+
 	return 0;
 }
 
@@ -421,7 +418,7 @@ static const struct drm_info_list amdgpu_debugfs_sa_list[] = {
 
 #endif
 
-static int amdgpu_debugfs_sa_init(struct amdgpu_device *adev)
+int amdgpu_debugfs_sa_init(struct amdgpu_device *adev)
 {
 #if defined(CONFIG_DEBUG_FS)
 	return amdgpu_debugfs_add_files(adev, amdgpu_debugfs_sa_list, 1);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
index 26a654cbd530..7d41f7b9a340 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
@@ -330,6 +330,7 @@ void amdgpu_sa_bo_free(struct amdgpu_device *adev,
 void amdgpu_sa_bo_dump_debug_info(struct amdgpu_sa_manager *sa_manager,
 					 struct seq_file *m);
 #endif
+int amdgpu_debugfs_sa_init(struct amdgpu_device *adev);
 
 bool amdgpu_bo_support_uswc(u64 bo_flags);
 
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
