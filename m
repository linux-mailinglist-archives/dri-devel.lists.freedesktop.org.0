Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FDFEC38851
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 01:53:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C57910E0F9;
	Thu,  6 Nov 2025 00:52:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mKRxAIwm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CC9710E7D8
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 00:52:45 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-640860f97b5so546976a12.2
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Nov 2025 16:52:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762390364; x=1762995164; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4TC3jknw27uusNIMn2p5lG+ecGQ+4uLN2sc869EijWA=;
 b=mKRxAIwmtAQgOxZ2IRS/G+HbMxInsNTVvGRf/l/+9UfxqTFjDFbx5zlf+bmoZubr1j
 V2b18u9fjGuR9fPRfU6iVRmvshkSdz/STshIL0e4jhIixV/tYru4jB4SiHWZVebJ6Oq1
 02xqwQS261J4JmZdR9okQjGIShpkf/z7U2hy7H/nvYWQhss+u1wRo0Vf6p5hBHWGuWM8
 HiPE5XnWAsv+m++K7e+MkFFQa+x2PpWNNYd57vtXzQZlgDYvYxBxDhNoLRfa9Y4s+f18
 LtYCXUrxxZ21Jxp6zaZJnt5IMbTMv2eyUw6T0r/9SmcXp7bkeB8kZQS/Cik+4D/bVFJE
 W9UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762390364; x=1762995164;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4TC3jknw27uusNIMn2p5lG+ecGQ+4uLN2sc869EijWA=;
 b=Wmk+XJVmw5mdCbQDGBh8WR6dNbWktKnAIVuPFqsCTTHs79c7Acrqs4sL5zyRPWwIA8
 C2nrnnSVrUTScsE1SRLtkvwf+kn+Mrj+jgJwBNnm59lbIeg8UfuTx4WGN4reXAUlUOd5
 HhLaAUHzKVZ5Tc/yF45dCtwbedqseeCvwAY6cwkFd79saQNYk9np3hl7cMSIOHMuDSRd
 956tiCqDKKXnZsyXN4UNRB3JXARrkN3bZr0S+4ASXGXZyTMpKgeGLnm6dEqnW257dnx5
 Ctt9jY47vaNg5U5M1ZaLfhJgBC8MLZAGxn3/g5JPhMx8BjwFXQvqp3XolpEvS93v1Wr0
 ip1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdBCCZXvYVOXKGDinE/CMNvIb07iViu1RbTiAZU1Qnu70x8oZdFZma6g4m8yCU5B4CSX95cl1nOnQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxpcTl2F8yIey6cGdHKcmui9bomc+q1zHCee/KIxw+CUncvV3t2
 3FTo0ZO2MhOj0UiOITU2IIFjU6AIKoTgVtzX+6igF7goM21VZs7n/3yT
X-Gm-Gg: ASbGnctD/txJ0KLQKr2L2SX5Ytz66UZNjYmgmFSP13AinpQ7dzOizjM9fYXkAI5Ovfc
 dvI/yylOw8EICa4p9vMyOEyeJSYXSHSed2Lwpay7p/QMa3fXWVmgiY7a7MdlGuGI/XSeqv6bGSl
 v8yZX/KZ2wQUHZu8v5yUbaYkxAgzPqbfFPdwCjxbeKppwvJai0iDyzDIfpLJtbq/Yjl4UWYlfyB
 iJ9MRbpcNCKwciQO0eWx6BrEsL3BpinWQ1jHJL8KMR1abp1KA4LPWkkb1F3nZwrJWSjTGrHWp1M
 9BZmJhSKrT23sztBWGLIy3WPtIBE+cMWLlWz7/Pm0lK+iYxO25KV+UWjy8tLCYoYKYIhEygloU3
 GuwDrpENiGME/lX0wU7onxBIjWeMYwL36PskSlY/iRF891S/IopdD4FTsd4WAjNxLVzpK173toX
 TcZVT+HfC7rR4rTrRzMsuMrQ==
X-Google-Smtp-Source: AGHT+IGyPw3/1ye6s+MutCB7GxPiniSAjUqQCYxPkECNVoFIt+LeekKL8kDCX7wiOXbyde9uL5l1lQ==
X-Received: by 2002:a05:6402:2417:b0:640:af04:d718 with SMTP id
 4fb4d7f45d1cf-64105a5c7c8mr4938545a12.30.1762390363532; 
 Wed, 05 Nov 2025 16:52:43 -0800 (PST)
Received: from archie.me ([210.87.74.117]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6411f862697sm476807a12.25.2025.11.05.16.52.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Nov 2025 16:52:42 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
 id D7F1D420A685; Thu, 06 Nov 2025 07:52:32 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Documentation <linux-doc@vger.kernel.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Intel Graphics <intel-gfx@lists.freedesktop.org>
Cc: Christian Koenig <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Zack Rusin <zack.rusin@broadcom.com>, Bagas Sanjaya <bagasdotme@gmail.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH] drm/ttm: Fix @alloc_flags description
Date: Thu,  6 Nov 2025 07:52:17 +0700
Message-ID: <20251106005217.14026-1-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3498; i=bagasdotme@gmail.com;
 h=from:subject; bh=6OeZWmkLzPTDm0Nogt0/O0+112Y2Ks/sc1xjGQfLCtE=;
 b=owGbwMvMwCX2bWenZ2ig32LG02pJDJncH/IOLdgTFFyjsmVl+3nljed/3uFbIm99O3GxYOe+J
 Yz/uRW9O0pZGMS4GGTFFFkmJfI1nd5lJHKhfa0jzBxWJpAhDFycAjCRDj2Gf1qX/599FxLc3dGx
 1uPH2qyjp6/3i5n+9A76y6zTvG+h0xKgCg67uoPm/TbK4WuldbNmSKTIGj6bW7dO4s5PFstb12V
 4AA==
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp;
 fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
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

Stephen Rothwell reports htmldocs warnings when merging drm-misc tree:

Documentation/gpu/drm-mm:40: include/drm/ttm/ttm_device.h:225: ERROR: Unknown target name: "ttm_allocation". [docutils]
Documentation/gpu/drm-mm:43: drivers/gpu/drm/ttm/ttm_device.c:202: ERROR: Unknown target name: "ttm_allocation". [docutils]
Documentation/gpu/drm-mm:73: include/drm/ttm/ttm_pool.h:68: ERROR: Unknown target name: "ttm_allocation_pool". [docutils]
Documentation/gpu/drm-mm:76: drivers/gpu/drm/ttm/ttm_pool.c:1070: ERROR: Unknown target name: "ttm_allocation_pool". [docutils]

Fix these by adding missing wildcard on TTM_ALLOCATION_* and
TTM_ALLOCATION_POOL_* in @alloc_flags description.

Fixes: 0af5b6a8f8dd ("drm/ttm: Replace multiple booleans with flags in pool init")
Fixes: 77e19f8d3297 ("drm/ttm: Replace multiple booleans with flags in device init")
Fixes: 402b3a865090 ("drm/ttm: Add an allocation flag to propagate -ENOSPC on OOM")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Closes: https://lore.kernel.org/linux-next/20251105161838.55b962a3@canb.auug.org.au/
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 drivers/gpu/drm/ttm/ttm_device.c | 2 +-
 drivers/gpu/drm/ttm/ttm_pool.c   | 2 +-
 include/drm/ttm/ttm_device.h     | 2 +-
 include/drm/ttm/ttm_pool.h       | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
index 5c10e5fbf43b7f..9a51afaf0749e2 100644
--- a/drivers/gpu/drm/ttm/ttm_device.c
+++ b/drivers/gpu/drm/ttm/ttm_device.c
@@ -199,7 +199,7 @@ EXPORT_SYMBOL(ttm_device_swapout);
  * @dev: The core kernel device pointer for DMA mappings and allocations.
  * @mapping: The address space to use for this bo.
  * @vma_manager: A pointer to a vma manager.
- * @alloc_flags: TTM_ALLOCATION_ flags.
+ * @alloc_flags: TTM_ALLOCATION_* flags.
  *
  * Initializes a struct ttm_device:
  * Returns:
diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
index 97e9ce505cf68d..18b6db015619c0 100644
--- a/drivers/gpu/drm/ttm/ttm_pool.c
+++ b/drivers/gpu/drm/ttm/ttm_pool.c
@@ -1067,7 +1067,7 @@ long ttm_pool_backup(struct ttm_pool *pool, struct ttm_tt *tt,
  * @pool: the pool to initialize
  * @dev: device for DMA allocations and mappings
  * @nid: NUMA node to use for allocations
- * @alloc_flags: TTM_ALLOCATION_POOL_ flags
+ * @alloc_flags: TTM_ALLOCATION_POOL_* flags
  *
  * Initialize the pool and its pool types.
  */
diff --git a/include/drm/ttm/ttm_device.h b/include/drm/ttm/ttm_device.h
index d016360e5cebbc..5618aef462f21b 100644
--- a/include/drm/ttm/ttm_device.h
+++ b/include/drm/ttm/ttm_device.h
@@ -221,7 +221,7 @@ struct ttm_device {
 	struct list_head device_list;
 
 	/**
-	 * @alloc_flags: TTM_ALLOCATION_ flags.
+	 * @alloc_flags: TTM_ALLOCATION_* flags.
 	 */
 	unsigned int alloc_flags;
 
diff --git a/include/drm/ttm/ttm_pool.h b/include/drm/ttm/ttm_pool.h
index 67c72de913bb9d..233581670e7825 100644
--- a/include/drm/ttm/ttm_pool.h
+++ b/include/drm/ttm/ttm_pool.h
@@ -64,7 +64,7 @@ struct ttm_pool_type {
  *
  * @dev: the device we allocate pages for
  * @nid: which numa node to use
- * @alloc_flags: TTM_ALLOCATION_POOL_ flags
+ * @alloc_flags: TTM_ALLOCATION_POOL_* flags
  * @caching: pools for each caching/order
  */
 struct ttm_pool {

base-commit: c553832116b8d0039b13ae84d1ed06e7ee4f1fdf
-- 
An old man doll... just what I always wanted! - Clara

