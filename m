Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4662A716E9
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 13:52:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1C3910E134;
	Wed, 26 Mar 2025 12:52:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JEpTaZ5K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C756710E134;
 Wed, 26 Mar 2025 12:52:14 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4394036c0efso43495785e9.2; 
 Wed, 26 Mar 2025 05:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742993533; x=1743598333; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=VwyiSIykfOMTFP9Glhet0fsRm/PA8s+JphWFgIm15/U=;
 b=JEpTaZ5KW+Dq0dReX6VsEc1HlKaw8fAswj00uid7WxYnSwYAbEKa1A4cStg1aiRGYd
 N5MlvLNLns2HIJ3Oh2vaIVbz7x8e4XHu8tdt1nnQfWe7/ZxBpbn5/xHhwYKGOE9qV8BW
 L4YglY8IgVfQM7kj8e0hP69tfk5UjY+Hnhp/hRZqee5O+WoDzubuADg1ghDItjIjCRPV
 /zOuyMRrknZxRTX6UMCqnkOoaidKhvM+ICsHpFiyRTHBIKguWnsJ2MR46oWSlZPYwR3y
 AML+WCOlKziX1cxKUPflTO0xHZVHD7Is69MhMjUpWMGQuOMjkUfLg2RZ4EbNOvofKO48
 2XrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742993533; x=1743598333;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VwyiSIykfOMTFP9Glhet0fsRm/PA8s+JphWFgIm15/U=;
 b=BXwHraKNp1Si6oEDF4jaq+WHWovxynDzSoXupP4XSfUR5ClS8LtMJbNVms0rEceDRB
 eU+8FKtELnvDWVn/w+xjDQLw3fx2Wx7d+w4vZqBBPoslqsoBWP69c8oKZ08w/71gMA3u
 pmullZIO7//xJCazNuS/aLYv5Cu3q2aNsGwlxZgA4uf1PmghaTcyVH3q4hYGrRzjZ+Hu
 6sIVufQZC6ilZjpX8vwEuwWv3MuR+MgsqKvxL/n/30T33+sszMGMCLI1c0aRszx/ZjYb
 XBi4PUHBaz8GqlQ7x4FID0s3pGttlzOLBXi/npFM1hIZN3udeYpMRLkTjpUUCsh7//uB
 CvAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwMk9goSSFyBqjxArFfWJSQ7jdwRvI4D05oTZcbms/jS79omyNEEE+5WAdJhbMWnWktAihBj7Dlg==@lists.freedesktop.org,
 AJvYcCVY8lI04w3GHEBgaQ/13KPEWGoCL+fCb8nLMo7mwt2+uQGgtNGpYtRFv4i92BkAAB6ivX6WLb6OjXA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxGKZPwYtcBmLjQ0moxIIfcX1AFfEnADyMmvshgJZVcO2wKuszE
 M9W7SFGXzFubR6KxH3/duma7j5m/sGgjzgyjBO/MvB7km3cNwjza
X-Gm-Gg: ASbGncsYyFl0sQe7gndQo4p6Grs/muX4qjKf4i02uiiyB0usw/v1796uANgRludA1vl
 Qo40CWeM9ezEBwDz3+OqeN9Ev8pqPi83q+xm4q6D28xMokLYgSnYWutrXYOPs/A3VafZwDCBD56
 OyRMUECB8ZDsCcl6/7I54WnIDQQPtADCtfmqGBwQ0FvjCGKU19IJ/R5yOAKPyjURYqUEJB5G8iK
 6vUHLYfT58hHNtfXkwEgaz7PkuibXRUtP0eXs7QHLiOXvxgeGdbApbwV2t9g+uu/gEz0dSYHeXp
 7dQY3BNy+BPk681MwupIiY0Sp9wE1Hd8FGNTjri5oZi8yYI8ApNI1q+n
X-Google-Smtp-Source: AGHT+IGcTlIycYodg67QYlVQjgNPDS68QFaDqKlEuvleRpjGOkZDEWYNZY5cUwYW2nHxjKcverj1vw==
X-Received: by 2002:a05:600c:5488:b0:43d:db5:7af8 with SMTP id
 5b1f17b1804b1-43d50a31981mr155787395e9.21.1742993532805; 
 Wed, 26 Mar 2025 05:52:12 -0700 (PDT)
Received: from debian.local ([2a0a:ef40:4d4:f101:e41a:977a:f788:910f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d82dedc88sm1252805e9.1.2025.03.26.05.52.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Mar 2025 05:52:12 -0700 (PDT)
Date: Wed, 26 Mar 2025 12:52:10 +0000
From: Chris Bainbridge <chris.bainbridge@gmail.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 nouveau@lists.freedesktop.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, lyude@redhat.com, sumit.semwal@linaro.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3] drm/nouveau: prime: fix ttm_bo_delayed_delete oops
Message-ID: <Z-P4epVK8k7tFZ7C@debian.local>
References: <Z9GHj-edWJmyzpdY@debian.local>
 <00e4d9c4-ecfc-4784-b603-12db04cda806@amd.com>
 <Z9q-ggKKgTsvW-Rz@debian.local> <Z9rA0G2urlVHFOSx@cassiopeiae>
 <1f4a534f-8883-4793-b191-60c2773f6217@amd.com>
 <Z9rSTkXlub-JZAz0@cassiopeiae>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z9rSTkXlub-JZAz0@cassiopeiae>
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

Fix an oops in ttm_bo_delayed_delete which results from dererencing a
dangling pointer:

Oops: general protection fault, probably for non-canonical address 0x6b6b6b6b6b6b6b7b: 0000 [#1] PREEMPT SMP
CPU: 4 UID: 0 PID: 1082 Comm: kworker/u65:2 Not tainted 6.14.0-rc4-00267-g505460b44513-dirty #216
Hardware name: LENOVO 82N6/LNVNB161216, BIOS GKCN65WW 01/16/2024
Workqueue: ttm ttm_bo_delayed_delete [ttm]
RIP: 0010:dma_resv_iter_first_unlocked+0x55/0x290
Code: 31 f6 48 c7 c7 00 2b fa aa e8 97 bd 52 ff e8 a2 c1 53 00 5a 85 c0 74 48 e9 88 01 00 00 4c 89 63 20 4d 85 e4 0f 84 30 01 00 00 <41> 8b 44 24 10 c6 43 2c 01 48 89 df 89 43 28 e8 97 fd ff ff 4c 8b
RSP: 0018:ffffbf9383473d60 EFLAGS: 00010202
RAX: 0000000000000001 RBX: ffffbf9383473d88 RCX: 0000000000000000
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: ffffbf9383473d78 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: 6b6b6b6b6b6b6b6b
R13: ffffa003bbf78580 R14: ffffa003a6728040 R15: 00000000000383cc
FS:  0000000000000000(0000) GS:ffffa00991c00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000758348024dd0 CR3: 000000012c259000 CR4: 0000000000f50ef0
PKRU: 55555554
Call Trace:
 <TASK>
 ? __die_body.cold+0x19/0x26
 ? die_addr+0x3d/0x70
 ? exc_general_protection+0x159/0x460
 ? asm_exc_general_protection+0x27/0x30
 ? dma_resv_iter_first_unlocked+0x55/0x290
 dma_resv_wait_timeout+0x56/0x100
 ttm_bo_delayed_delete+0x69/0xb0 [ttm]
 process_one_work+0x217/0x5c0
 worker_thread+0x1c8/0x3d0
 ? apply_wqattrs_cleanup.part.0+0xc0/0xc0
 kthread+0x10b/0x240
 ? kthreads_online_cpu+0x140/0x140
 ret_from_fork+0x40/0x70
 ? kthreads_online_cpu+0x140/0x140
 ret_from_fork_asm+0x11/0x20
 </TASK>

The cause of this is:

- drm_prime_gem_destroy calls dma_buf_put(dma_buf) which releases the
  reference to the shared dma_buf. The reference count is 0, so the
  dma_buf is destroyed, which in turn decrements the corresponding
  amdgpu_bo reference count to 0, and the amdgpu_bo is destroyed -
  calling drm_gem_object_release then dma_resv_fini (which destroys the
  reservation object), then finally freeing the amdgpu_bo.

- nouveau_bo obj->bo.base.resv is now a dangling pointer to the memory
  formerly allocated to the amdgpu_bo.

- nouveau_gem_object_del calls ttm_bo_put(&nvbo->bo) which calls
  ttm_bo_release, which schedules ttm_bo_delayed_delete.

- ttm_bo_delayed_delete runs and dereferences the dangling resv pointer,
  resulting in a general protection fault.

Fix this by moving the drm_prime_gem_destroy call from
nouveau_gem_object_del to nouveau_bo_del_ttm. This ensures that it will
be run after ttm_bo_delayed_delete.

Signed-off-by: Chris Bainbridge <chris.bainbridge@gmail.com>
Suggested-by: Christian König <christian.koenig@amd.com>
Fixes: 22b33e8ed0e3 ("22b33e8ed0e3nouveau: add PRIME support")
Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/3937
Cc: <Stable@vger.kernel.org>
---
 drivers/gpu/drm/nouveau/nouveau_bo.c  | 3 +++
 drivers/gpu/drm/nouveau/nouveau_gem.c | 3 ---
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index db961eade225..2016c1e7242f 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -144,6 +144,9 @@ nouveau_bo_del_ttm(struct ttm_buffer_object *bo)
 	nouveau_bo_del_io_reserve_lru(bo);
 	nv10_bo_put_tile_region(dev, nvbo->tile, NULL);
 
+	if (bo->base.import_attach)
+		drm_prime_gem_destroy(&bo->base, bo->sg);
+
 	/*
 	 * If nouveau_bo_new() allocated this buffer, the GEM object was never
 	 * initialized, so don't attempt to release it.
diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index 9ae2cee1c7c5..67e3c99de73a 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -87,9 +87,6 @@ nouveau_gem_object_del(struct drm_gem_object *gem)
 		return;
 	}
 
-	if (gem->import_attach)
-		drm_prime_gem_destroy(gem, nvbo->bo.sg);
-
 	ttm_bo_put(&nvbo->bo);
 
 	pm_runtime_mark_last_busy(dev);
-- 
2.47.2

