Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2253832631
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jan 2024 10:06:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0822810E8E6;
	Fri, 19 Jan 2024 09:06:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FE1610E1AB;
 Fri, 19 Jan 2024 09:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705655174; x=1737191174;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=o73iEqrgJvfnEtEE/wQO0OvRA1HWpqUm6O+8IKSLMto=;
 b=BI3TTdbA14nJ951zS1LPZOadR3h5IJvgS2HThGNYCBm+PnlHnJay78Gu
 Jh0pbKmrCEhHxOJMbjNo3iDusFuxnPHPSjXJgJ6EQPNOUvsak9KWfLGCG
 Ukva7Xrgw1PjrmQwcm6SHjdJwsGirauOblVln4ZaKVj4Od3EzIhSikn66
 ZqCc+jV2MkKzmv8zsiZPK7a0/IR6pofJq5nzmxSJqxxX0rJSmYx+XP/nr
 MKev4Z+alO8T5dpYp4hvCf97Z8QQS84tpAfhLP62ct/yDjEEg1j/w0nu6
 7t/9qEIvVAW/AoJFGaXnwY8wv+kOvnaZ2clsBcKi1HmSVJbW/ne6+Bhb9 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="7794622"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; 
   d="scan'208";a="7794622"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2024 01:06:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="904098845"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; d="scan'208";a="904098845"
Received: from mstribae-mobl.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.61])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2024 01:06:08 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/exec, drm/gpuvm: Prefer u32 over uint32_t
Date: Fri, 19 Jan 2024 10:05:57 +0100
Message-ID: <20240119090557.6360-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.43.0
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Danilo Krummrich <dakr@redhat.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The relatively recently introduced drm/exec utility was using uint32_t
in its interface, which was then also carried over to drm/gpuvm.

Prefer u32 in new code and update drm/exec and drm/gpuvm accordingly.

Cc: Christian König <christian.koenig@amd.com>
Cc: Danilo Krummrich <dakr@redhat.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/drm_exec.c | 2 +-
 include/drm/drm_exec.h     | 4 ++--
 include/drm/drm_gpuvm.h    | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_exec.c b/drivers/gpu/drm/drm_exec.c
index 5d2809de4517..20e59d88218d 100644
--- a/drivers/gpu/drm/drm_exec.c
+++ b/drivers/gpu/drm/drm_exec.c
@@ -72,7 +72,7 @@ static void drm_exec_unlock_all(struct drm_exec *exec)
  *
  * Initialize the object and make sure that we can track locked objects.
  */
-void drm_exec_init(struct drm_exec *exec, uint32_t flags)
+void drm_exec_init(struct drm_exec *exec, u32 flags)
 {
 	exec->flags = flags;
 	exec->objects = kmalloc(PAGE_SIZE, GFP_KERNEL);
diff --git a/include/drm/drm_exec.h b/include/drm/drm_exec.h
index b5bf0b6da791..187c3ec44606 100644
--- a/include/drm/drm_exec.h
+++ b/include/drm/drm_exec.h
@@ -18,7 +18,7 @@ struct drm_exec {
 	/**
 	 * @flags: Flags to control locking behavior
 	 */
-	uint32_t		flags;
+	u32                     flags;
 
 	/**
 	 * @ticket: WW ticket used for acquiring locks
@@ -135,7 +135,7 @@ static inline bool drm_exec_is_contended(struct drm_exec *exec)
 	return !!exec->contended;
 }
 
-void drm_exec_init(struct drm_exec *exec, uint32_t flags);
+void drm_exec_init(struct drm_exec *exec, u32 flags);
 void drm_exec_fini(struct drm_exec *exec);
 bool drm_exec_cleanup(struct drm_exec *exec);
 int drm_exec_lock_obj(struct drm_exec *exec, struct drm_gem_object *obj);
diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
index 48311e6d664c..554046321d24 100644
--- a/include/drm/drm_gpuvm.h
+++ b/include/drm/drm_gpuvm.h
@@ -514,7 +514,7 @@ struct drm_gpuvm_exec {
 	/**
 	 * @flags: the flags for the struct drm_exec
 	 */
-	uint32_t flags;
+	u32 flags;
 
 	/**
 	 * @vm: the &drm_gpuvm to lock its DMA reservations
-- 
2.43.0

