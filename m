Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +PwjHigxemkx4gEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 16:54:16 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95689A4AEB
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 16:54:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9EB710E1F0;
	Wed, 28 Jan 2026 15:54:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="XpfRv2kS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B073710E1F0
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 15:54:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 63E9F418F2;
 Wed, 28 Jan 2026 15:54:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C602EC4CEF1;
 Wed, 28 Jan 2026 15:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1769615650;
 bh=1pe81fLvU9qKpDSCb4Dl4EyA1UsvI1qVEPQ7U3/y3lY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XpfRv2kS+m0ynsv4LAZOeS+Gjq+z4b0gkd4l/AkM3XZKQ4O2iIycgthuTgr/xR9Oz
 iEWtKxj5m57fPgUFZUZl0ZVUX4iKoOmpmCVzWU2AQ0D0+9fNLrZcMUsw1NI6euf+Xl
 A6Q4B/tL/hmcg9+/2ZGstDRjkD+RCZABnBTSnnVM=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, patches@lists.linux.dev,
 Matthew Auld <matthew.auld@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH 6.18 073/227] drm,
 drm/xe: Fix xe userptr in the absence of CONFIG_DEVICE_PRIVATE
Date: Wed, 28 Jan 2026 16:21:58 +0100
Message-ID: <20260128145346.969913989@linuxfoundation.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260128145344.331957407@linuxfoundation.org>
References: <20260128145344.331957407@linuxfoundation.org>
User-Agent: quilt/0.69
X-stable: review
X-Patchwork-Hint: ignore
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:stable@vger.kernel.org,m:gregkh@linuxfoundation.org,m:patches@lists.linux.dev,m:matthew.auld@intel.com,m:himal.prasad.ghimiray@intel.com,m:thomas.hellstrom@linux.intel.com,m:matthew.brost@intel.com,m:rodrigo.vivi@intel.com,m:maarten.lankhorst@linux.intel.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER(0.00)[gregkh@linuxfoundation.org,dri-devel-bounces@lists.freedesktop.org]
X-Rspamd-Queue-Id: 95689A4AEB
X-Rspamd-Action: no action

6.18-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Thomas Hellström <thomas.hellstrom@linux.intel.com>

commit bdcdf968be314b6fc8835b99fb4519e7619671e6 upstream.

CONFIG_DEVICE_PRIVATE is not selected by default by some distros,
for example Fedora, and that leads to a regression in the xe driver
since userptr support gets compiled out.

It turns out that DRM_GPUSVM, which is needed for xe userptr support
compiles also without CONFIG_DEVICE_PRIVATE, but doesn't compile
without CONFIG_ZONE_DEVICE.
Exclude the drm_pagemap files from compilation with !CONFIG_ZONE_DEVICE,
and remove the CONFIG_DEVICE_PRIVATE dependency from CONFIG_DRM_GPUSVM and
the xe driver's selection of it, re-enabling xe userptr for those configs.

v2:
- Don't compile the drm_pagemap files unless CONFIG_ZONE_DEVICE is set.
- Adjust the drm_pagemap.h header accordingly.

Fixes: 9e9787414882 ("drm/xe/userptr: replace xe_hmm with gpusvm")
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: dri-devel@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v6.18+
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Acked-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Link: https://patch.msgid.link/20260121091048.41371-2-thomas.hellstrom@linux.intel.com
(cherry picked from commit 1e372b246199ca7a35f930177fea91b557dac16e)
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/Kconfig    |    2 +-
 drivers/gpu/drm/Makefile   |    4 +++-
 drivers/gpu/drm/xe/Kconfig |    2 +-
 include/drm/drm_pagemap.h  |   19 +++++++++++++++++--
 4 files changed, 22 insertions(+), 5 deletions(-)

--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -210,7 +210,7 @@ config DRM_GPUVM
 
 config DRM_GPUSVM
 	tristate
-	depends on DRM && DEVICE_PRIVATE
+	depends on DRM
 	select HMM_MIRROR
 	select MMU_NOTIFIER
 	help
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -106,8 +106,10 @@ obj-$(CONFIG_DRM_EXEC) += drm_exec.o
 obj-$(CONFIG_DRM_GPUVM) += drm_gpuvm.o
 
 drm_gpusvm_helper-y := \
-	drm_gpusvm.o\
+	drm_gpusvm.o
+drm_gpusvm_helper-$(CONFIG_ZONE_DEVICE) += \
 	drm_pagemap.o
+
 obj-$(CONFIG_DRM_GPUSVM) += drm_gpusvm_helper.o
 
 obj-$(CONFIG_DRM_BUDDY) += drm_buddy.o
--- a/drivers/gpu/drm/xe/Kconfig
+++ b/drivers/gpu/drm/xe/Kconfig
@@ -39,7 +39,7 @@ config DRM_XE
 	select DRM_TTM
 	select DRM_TTM_HELPER
 	select DRM_EXEC
-	select DRM_GPUSVM if !UML && DEVICE_PRIVATE
+	select DRM_GPUSVM if !UML
 	select DRM_GPUVM
 	select DRM_SCHED
 	select MMU_NOTIFIER
--- a/include/drm/drm_pagemap.h
+++ b/include/drm/drm_pagemap.h
@@ -209,6 +209,19 @@ struct drm_pagemap_devmem_ops {
 			   struct dma_fence *pre_migrate_fence);
 };
 
+#if IS_ENABLED(CONFIG_ZONE_DEVICE)
+
+struct drm_pagemap *drm_pagemap_page_to_dpagemap(struct page *page);
+
+#else
+
+static inline struct drm_pagemap *drm_pagemap_page_to_dpagemap(struct page *page)
+{
+	return NULL;
+}
+
+#endif /* IS_ENABLED(CONFIG_ZONE_DEVICE) */
+
 /**
  * struct drm_pagemap_devmem - Structure representing a GPU SVM device memory allocation
  *
@@ -233,6 +246,8 @@ struct drm_pagemap_devmem {
 	struct dma_fence *pre_migrate_fence;
 };
 
+#if IS_ENABLED(CONFIG_ZONE_DEVICE)
+
 int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
 				  struct mm_struct *mm,
 				  unsigned long start, unsigned long end,
@@ -243,8 +258,6 @@ int drm_pagemap_evict_to_ram(struct drm_
 
 const struct dev_pagemap_ops *drm_pagemap_pagemap_ops_get(void);
 
-struct drm_pagemap *drm_pagemap_page_to_dpagemap(struct page *page);
-
 void drm_pagemap_devmem_init(struct drm_pagemap_devmem *devmem_allocation,
 			     struct device *dev, struct mm_struct *mm,
 			     const struct drm_pagemap_devmem_ops *ops,
@@ -256,4 +269,6 @@ int drm_pagemap_populate_mm(struct drm_p
 			    struct mm_struct *mm,
 			    unsigned long timeslice_ms);
 
+#endif /* IS_ENABLED(CONFIG_ZONE_DEVICE) */
+
 #endif


