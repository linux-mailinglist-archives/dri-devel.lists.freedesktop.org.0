Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C74F3F779A
	for <lists+dri-devel@lfdr.de>; Wed, 25 Aug 2021 16:43:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C76B46E24D;
	Wed, 25 Aug 2021 14:43:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9EDB86E24D
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Aug 2021 14:43:12 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EF2FA106F;
 Wed, 25 Aug 2021 07:43:11 -0700 (PDT)
Received: from 010265703453.arm.com (unknown [10.57.15.112])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8F6383F5A1;
 Wed, 25 Aug 2021 07:43:10 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de
Cc: airlied@linux.ie, daniel@ffwll.ch, alyssa.rosenzweig@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/cma-helper: Set VM_DONTEXPAND for mmap
Date: Wed, 25 Aug 2021 15:43:05 +0100
Message-Id: <1c68be0449aa3217e2bbc898dd8c7426748fc6b8.1629902585.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.25.1
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

drm_gem_cma_mmap() cannot assume every implementation of dma_mmap_wc()
will end up calling remap_pfn_range() (which happens to set the relevant
vma flag, among others), so in order to make sure expectations around
VM_DONTEXPAND are met, let it explicitly set the flag like most other
GEM mmap implementations do.

This avoids repeated warnings on a small minority of systems where the
display is behind an IOMMU, and has a simple driver which does not
override drm_gem_cma_default_funcs.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/gpu/drm/drm_gem_cma_helper.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/drm_gem_cma_helper.c b/drivers/gpu/drm/drm_gem_cma_helper.c
index d53388199f34..63e48d98263d 100644
--- a/drivers/gpu/drm/drm_gem_cma_helper.c
+++ b/drivers/gpu/drm/drm_gem_cma_helper.c
@@ -510,6 +510,7 @@ int drm_gem_cma_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
 	 */
 	vma->vm_pgoff -= drm_vma_node_start(&obj->vma_node);
 	vma->vm_flags &= ~VM_PFNMAP;
+	vma->vm_flags |= VM_DONTEXPAND;
 
 	cma_obj = to_drm_gem_cma_obj(obj);
 
-- 
2.25.1

