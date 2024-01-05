Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9459C8252AF
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jan 2024 12:22:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92D4210E5D5;
	Fri,  5 Jan 2024 11:22:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24FF210E5D5
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jan 2024 11:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704453753; x=1735989753;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+y8VfG/l9WdV1CV7VtLC4jsOLGvdb8I1j7iJFqV/4Qw=;
 b=SjYXvm8FtMGSjX8VQIpEMqGI+rL/S6B8ZLpCUiw6lczF8cduwx1tc32E
 Eg1G7bytvbemh08HHLtt7xPOTOd8OVeeA8c9aSP7UKm8qcKlAhaXxFtZb
 Q6toIIDWSuO9XSqn0LqCf70RchqS0SGbxy0LPOo9Qvs5dCZYtXf2kkYjD
 sW1K6THM4ELuskMjZAbJGStayY1P5XptJNamNPWllbyKadtA9xBfn1dMo
 y5bQvyW4F7j8gnJ7qAbGG/h1x55nHpt8W9/iTpqH9Sq0ALvfp1jkHt9JH
 IfGfnCgJLwvH3NQHiWJjT1lwHsp4MrieFBbgU2SnshyO3tKifaKmnO852 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="4255436"
X-IronPort-AV: E=Sophos;i="6.04,333,1695711600"; 
   d="scan'208";a="4255436"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2024 03:22:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="756918731"
X-IronPort-AV: E=Sophos;i="6.04,333,1695711600"; d="scan'208";a="756918731"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2024 03:22:31 -0800
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 06/10] accel/ivpu: Fix for missing lock around
 drm_gem_shmem_vmap()
Date: Fri,  5 Jan 2024 12:22:14 +0100
Message-ID: <20240105112218.351265-7-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240105112218.351265-1-jacek.lawrynowicz@linux.intel.com>
References: <20240105112218.351265-1-jacek.lawrynowicz@linux.intel.com>
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
Cc: quic_jhugo@quicinc.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_gem_shmem_vmap/vunmap requires dma resv lock to be held.
This was missed during conversion to shmem helper.

Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_gem.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/accel/ivpu/ivpu_gem.c b/drivers/accel/ivpu/ivpu_gem.c
index 1dda4f38ea25..6890d33cf352 100644
--- a/drivers/accel/ivpu/ivpu_gem.c
+++ b/drivers/accel/ivpu/ivpu_gem.c
@@ -361,7 +361,9 @@ ivpu_bo_alloc_internal(struct ivpu_device *vdev, u64 vpu_addr, u64 size, u32 fla
 	if (ret)
 		goto err_put;
 
+	dma_resv_lock(bo->base.base.resv, NULL);
 	ret = drm_gem_shmem_vmap(&bo->base, &map);
+	dma_resv_unlock(bo->base.base.resv);
 	if (ret)
 		goto err_put;
 
@@ -376,7 +378,10 @@ void ivpu_bo_free_internal(struct ivpu_bo *bo)
 {
 	struct iosys_map map = IOSYS_MAP_INIT_VADDR(bo->base.vaddr);
 
+	dma_resv_lock(bo->base.base.resv, NULL);
 	drm_gem_shmem_vunmap(&bo->base, &map);
+	dma_resv_unlock(bo->base.base.resv);
+
 	drm_gem_object_put(&bo->base.base);
 }
 
-- 
2.43.0

