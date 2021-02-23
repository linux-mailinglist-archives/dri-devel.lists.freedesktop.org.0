Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4875D322DFC
	for <lists+dri-devel@lfdr.de>; Tue, 23 Feb 2021 16:52:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A06A89836;
	Tue, 23 Feb 2021 15:52:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E38B789819
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Feb 2021 15:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=5tI+sZNQYIETnp4rYXjL4EveSfFBxhwH4qjXFiTVuDs=; 
 b=FDFgOtEWu402Gtl/VM3DyRZ0wZO8KHmnrASAVoLAmvPrdzCXSEpvjmTNJMKJI8mXn+2s5RGY8wBOhgSa8ak4a6KFKS0OE4NEMdVQh8DVtFk6qY20p9WYYO6syoc+p7QGq2uF1vNk0timdNSA0veQd9VkEHipKN3geuxoh8q8eFIZoNuyanLv26rOKNi7MB6Y6K8zfC4Fq5wFObCXvjujMr6JHAPV+adZkrqpXcLJa/wNewKHIEe7mGm2xEsuzLhAyMOwLbF7YvXguSX94UmLvBW/ZzF0Oz7/2LsBjmYo4yAuViE6z6klFYKEoVHkjIU0NESCo6fZjBn1t6d3Ghjx0A==;
Received: from lneuilly-657-1-8-171.w81-250.abo.wanadoo.fr ([81.250.147.171]
 helo=masxo.routerf36dc8.com) by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1lEZyj-00036t-Vs; Tue, 23 Feb 2021 16:52:02 +0100
From: Neil Roberts <nroberts@igalia.com>
To: Rob Herring <robh+dt@kernel.org>, Tomeu Vizoso <tomeu@tomeuvizoso.net>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Steven Price <steven.price@arm.com>, Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH 1/2] drm/shmem-helper: Check for purged buffers in fault
 handler
Date: Tue, 23 Feb 2021 16:51:24 +0100
Message-Id: <20210223155125.199577-2-nroberts@igalia.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210223155125.199577-1-nroberts@igalia.com>
References: <20210223155125.199577-1-nroberts@igalia.com>
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
Cc: stable@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When a buffer is madvised as not needed and then purged, any attempts to
access the buffer from user-space should cause a bus fault. This patch
adds a check for that.

Cc: stable@vger.kernel.org
Fixes: 17acb9f35ed7 ("drm/shmem: Add madvise state and purge helpers")
Signed-off-by: Neil Roberts <nroberts@igalia.com>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index 9825c378dfa6..b26139b1dc35 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -525,14 +525,24 @@ static vm_fault_t drm_gem_shmem_fault(struct vm_fault *vmf)
 	struct drm_gem_object *obj = vma->vm_private_data;
 	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
 	loff_t num_pages = obj->size >> PAGE_SHIFT;
+	vm_fault_t ret;
 	struct page *page;
 
-	if (vmf->pgoff >= num_pages || WARN_ON_ONCE(!shmem->pages))
-		return VM_FAULT_SIGBUS;
+	mutex_lock(&shmem->pages_lock);
+
+	if (vmf->pgoff >= num_pages ||
+	    WARN_ON_ONCE(!shmem->pages) ||
+	    shmem->madv < 0) {
+		ret = VM_FAULT_SIGBUS;
+	} else {
+		page = shmem->pages[vmf->pgoff];
 
-	page = shmem->pages[vmf->pgoff];
+		ret = vmf_insert_page(vma, vmf->address, page);
+	}
 
-	return vmf_insert_page(vma, vmf->address, page);
+	mutex_unlock(&shmem->pages_lock);
+
+	return ret;
 }
 
 static void drm_gem_shmem_vm_open(struct vm_area_struct *vma)
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
