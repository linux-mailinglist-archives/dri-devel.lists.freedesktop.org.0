Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E5AB86E69
	for <lists+dri-devel@lfdr.de>; Thu, 18 Sep 2025 22:25:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4982A10E1A8;
	Thu, 18 Sep 2025 20:25:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="GC/xuEH8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3D5D10E1A8;
 Thu, 18 Sep 2025 20:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 Message-Id:Date:Subject:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KSWSMnfsKClm3CO88jw/F2wXZZE8FuFNwsBo3LfrVLE=; b=GC/xuEH8Z2NhexrDp/215Iw+4X
 f1z996qAxQavumwdFkSFH3aG8BVR02CnMLnpCDz+7O81/pSHn5y+GWjpV+JBT+E5xsLMLo0BZL1C1
 zv4EM0SECk6tHLGHdMMKrf3ApbBL8/GtCMZ0PxADGO1gAw5CSCWW5R1BjNuoc6Z+mJtiY6zWlpjis
 vwD0bvxKj/heUoMW5uoRApfzxxQrSKButwethC4cVt4c+ZQ/T6ghpfmjH8qP3+M5ifMmmB21BltFs
 LKYYGPAwZLeuN5Gwr7470UTUqbdR2bhLO68YgetNTzfBnx6NQA7QoyABc4VaDoc+4yZyJpboetIcm
 T//wTLnA==;
Received: from 179-125-87-227-dinamico.pombonet.net.br ([179.125.87.227]
 helo=[127.0.0.1]) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uzLBf-00Dp3q-IW; Thu, 18 Sep 2025 22:25:03 +0200
From: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
Subject: [PATCH RFC v2 0/3] drm/ttm: allow direct reclaim to be skipped
Date: Thu, 18 Sep 2025 17:09:23 -0300
Message-Id: <20250918-ttm_pool_no_direct_reclaim-v2-0-135294e1f8a2@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPRmzGgC/32NwQqDMBBEf0X23JRNRNSeCoV+QK9FQqobXVAjS
 ZAW8d8b7L2XgTcDbzYI5JkCXLINPK0c2M0J1CmDdjBzT4K7xKBQFVhjLWKc9OLcqGenO/bURp1
 iNDwJIqywNKrLLUESLJ4svw/5Ex73GzSpHDhE5z/H4SqP6eeW+M+9SiFFkb/QmtJWKa/cm5HNu
 XUTNPu+fwG+xEa0ygAAAA==
X-Change-ID: 20250909-ttm_pool_no_direct_reclaim-ee0807a2d3fe
To: Christian Koenig <christian.koenig@amd.com>, 
 =?utf-8?q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>, 
 Huang Rui <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>, 
 Matthew Brost <matthew.brost@intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, kernel-dev@igalia.com, 
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
X-Mailer: b4 0.14.2
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

On certain workloads, like on ChromeOS when opening multiple tabs and
windows, and switching desktops, memory pressure can build up and latency
is observed as high order allocations result in memory reclaim. This was
observed when running on an amdgpu.

This is caused by TTM pool allocations and turning off direct reclaim when
doing those higher order allocations leads to lower memory pressure.

Since turning direct reclaim off might also lead to lower throughput,
make it tunable, both as a module parameter that can be changed in sysfs
and as a flag when allocating a GEM object.

A latency option will avoid direct reclaim for higher order allocations.

The throughput option could be later used to more agressively compact pages
or reclaim, by not using __GFP_NORETRY.

Other drivers can later opt to use this mechanism too.

Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
---
Changes in v2:
- Make disabling direct reclaim an option.
- Link to v1: https://lore.kernel.org/r/20250910-ttm_pool_no_direct_reclaim-v1-1-53b0fa7f80fa@igalia.com

---
Thadeu Lima de Souza Cascardo (3):
      ttm: pool: allow requests to prefer latency over throughput
      ttm: pool: add a module parameter to set latency preference
      drm/amdgpu: allow allocation preferences when creating GEM object

 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c    |  3 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c |  3 ++-
 drivers/gpu/drm/ttm/ttm_pool.c             | 23 +++++++++++++++++------
 drivers/gpu/drm/ttm/ttm_tt.c               |  2 +-
 include/drm/ttm/ttm_bo.h                   |  5 +++++
 include/drm/ttm/ttm_pool.h                 |  2 +-
 include/drm/ttm/ttm_tt.h                   |  2 +-
 include/uapi/drm/amdgpu_drm.h              |  9 +++++++++
 8 files changed, 38 insertions(+), 11 deletions(-)
---
base-commit: f83ec76bf285bea5727f478a68b894f5543ca76e
change-id: 20250909-ttm_pool_no_direct_reclaim-ee0807a2d3fe

Best regards,
-- 
Thadeu Lima de Souza Cascardo <cascardo@igalia.com>

