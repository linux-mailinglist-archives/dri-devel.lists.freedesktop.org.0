Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 478B631DE07
	for <lists+dri-devel@lfdr.de>; Wed, 17 Feb 2021 18:18:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ABB06E1D5;
	Wed, 17 Feb 2021 17:18:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1082 seconds by postgrey-1.36 at gabe;
 Wed, 17 Feb 2021 17:18:04 UTC
Received: from fanzine.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F6E86E1D5
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Feb 2021 17:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From;
 bh=0ldIuOzQlKtFIEXTlCeuo+xGUzoeEnub3CvLDF2/bLU=; 
 b=GmIjeUb7eA9bcpUKY/FwnFFYJ+aOrzvmEKE6YPz1skHrdoZncBsXk6mNpjQBz2ukSDW1tzY0ia4eVxii/m4x9yUjwOF9bpNH5dTwb32CdpYjhsyqelTHkQKv1x04H8AmyosVNjEVp6K73qTdGhYbVklphEnD0fzbCLi3VQgnXm5jB92eWRpVV2+uTkE0YMuA0wRs5bgdEHL//ROFt3dhhXsv7Mtr3qqdVf8Tczl5UG7y2c/mSswrWBvTStPAXpHlSsBXx2XYUh8M4YRe3c3T2qnRQVugzjNwS3JebiSRVAQ59ta0n5i+8OfYXpxBiM56QtR3cUyZ8jXOk73LVXKgIw==;
Received: from lneuilly-657-1-8-171.w81-250.abo.wanadoo.fr ([81.250.147.171]
 helo=masxo.routerf36dc8.com) by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1lCQB6-00021d-KF; Wed, 17 Feb 2021 17:59:52 +0100
From: Neil Roberts <nroberts@igalia.com>
To: Rob Herring <robh+dt@kernel.org>, Tomeu Vizoso <tomeu@tomeuvizoso.net>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Steven Price <steven.price@arm.com>
Subject: [PATCH] drm/shmem-helper: Don't remove the offset in vm_area_struct
 pgoff
Date: Wed, 17 Feb 2021 17:59:10 +0100
Message-Id: <20210217165910.3820374-1-nroberts@igalia.com>
X-Mailer: git-send-email 2.29.2
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When mmapping the shmem, it would previously adjust the pgoff in the
vm_area_struct to remove the fake offset that is added to be able to
identify the buffer. This patch removes the adjustment and makes the
fault handler use the vm_fault address to calculate the page offset
instead. Although using this address is apparently discouraged, several
DRM drivers seem to be doing it anyway.

The problem with removing the pgoff is that it prevents
drm_vma_node_unmap from working because that searches the mapping tree
by address. That doesn't work because all of the mappings are at offset
0. drm_vma_node_unmap is being used by the shmem helpers when purging
the buffer.

It looks like panfrost is using drm_gem_shmem_purge so this might fix a
potential bug there.

Signed-off-by: Neil Roberts <nroberts@igalia.com>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index 9825c378dfa6..4b14157f1962 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -526,11 +526,16 @@ static vm_fault_t drm_gem_shmem_fault(struct vm_fault *vmf)
 	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
 	loff_t num_pages = obj->size >> PAGE_SHIFT;
 	struct page *page;
+	pgoff_t page_offset;
 
-	if (vmf->pgoff >= num_pages || WARN_ON_ONCE(!shmem->pages))
+	/* We don't use vmf->pgoff since that has the fake offset */
+	page_offset = (vmf->address - vma->vm_start) >> PAGE_SHIFT;
+
+	if (page_offset < 0 || page_offset >= num_pages ||
+	    WARN_ON_ONCE(!shmem->pages))
 		return VM_FAULT_SIGBUS;
 
-	page = shmem->pages[vmf->pgoff];
+	page = shmem->pages[page_offset];
 
 	return vmf_insert_page(vma, vmf->address, page);
 }
@@ -581,9 +586,6 @@ int drm_gem_shmem_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
 	struct drm_gem_shmem_object *shmem;
 	int ret;
 
-	/* Remove the fake offset */
-	vma->vm_pgoff -= drm_vma_node_start(&obj->vma_node);
-
 	if (obj->import_attach) {
 		/* Drop the reference drm_gem_mmap_obj() acquired.*/
 		drm_gem_object_put(obj);
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
