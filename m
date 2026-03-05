Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WDdfIH16qWl77wAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 13:43:41 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 367C0211E7D
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 13:43:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 453F110EB0C;
	Thu,  5 Mar 2026 12:43:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="R6gSwi45";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E40BD10EB09
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2026 12:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1772714615;
 bh=gNFOlP818JxFLtxS40lAqdtj5enaiNbekGjHdKswy+c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=R6gSwi45B4Oo/TDxzAiSGNgEm8ky59PdA26UmaA9eHQSCKot+rNlbtfiL01MFGgjh
 NavLCmz3LyZpuhTV30QH6NvuloJjF7d5GVZ/pHkZ02ncmP0ZH52L3kd8skzLW5Ap97
 Xd0pVE6w7yT+FATkf7GG55G8qwfIzdWT2C8TGOdAehQCikPGO2mr1Xl4nqEJb7jcOh
 StI8SOhCLwYFCkYTpXUiAon2mDFxplX3sX8/trA0DzEYKuqEtjIkFEpB3X1lMPn6Et
 6vHPTqpd0H4OauC/G/90mQaNQz8htH+m4PJ783r7eIFWZlz4hA8EsE5np3MmMq3+Cw
 mP/9qEFE+K6cw==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:a2a7:f53:ebb0:945e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id F11D617E04D6;
 Thu,  5 Mar 2026 13:43:34 +0100 (CET)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Akash Goel <akash.goel@arm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Chris Diamand <chris.diamand@arm.com>, Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Alice Ryhl <aliceryhl@google.com>, Chia-I Wu <olvaffe@gmail.com>,
 kernel@collabora.com
Subject: [PATCH v4 8/9] drm/panthor: Track the number of mmap on a BO
Date: Thu,  5 Mar 2026 13:43:19 +0100
Message-ID: <20260305124320.156606-9-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260305124320.156606-1-boris.brezillon@collabora.com>
References: <20260305124320.156606-1-boris.brezillon@collabora.com>
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
X-Rspamd-Queue-Id: 367C0211E7D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,gmail.com,ffwll.ch,arm.com,oss.qualcomm.com,poorly.run,kernel.org,linux.intel.com,suse.de,collabora.com,intel.com,google.com];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:boris.brezillon@collabora.com,m:steven.price@arm.com,m:liviu.dudau@arm.com,m:adrian.larumbe@collabora.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:akash.goel@arm.com,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:akhilpo@oss.qualcomm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:dmitry.osipenko@collabora.com,m:chris.diamand@arm.com,m:dakr@kernel.org,m:matthew.brost@intel.com,m:thomas.hellstrom@linux.intel.com,m:aliceryhl@google.com,m:olvaffe@gmail.com,m:kernel@collabora.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,collabora.com:dkim,collabora.com:email,collabora.com:mid,arm.com:email]
X-Rspamd-Action: no action

This will be used to order things by reclaimability.

v2:
- Fix refcounting

v3:
- Fix refcounting (again)

v4:
- Collect R-b

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Steven Price <steven.price@arm.com>
---
 drivers/gpu/drm/panthor/panthor_gem.c | 45 +++++++++++++++++++++++++--
 drivers/gpu/drm/panthor/panthor_gem.h |  3 ++
 2 files changed, 46 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
index 906ecf62275a..b052266b5294 100644
--- a/drivers/gpu/drm/panthor/panthor_gem.c
+++ b/drivers/gpu/drm/panthor/panthor_gem.c
@@ -488,6 +488,7 @@ static void panthor_gem_print_info(struct drm_printer *p, unsigned int indent,
 	drm_printf_indent(p, indent, "vmap_use_count=%u\n",
 			  refcount_read(&bo->cmap.vaddr_use_count));
 	drm_printf_indent(p, indent, "vaddr=%p\n", bo->cmap.vaddr);
+	drm_printf_indent(p, indent, "mmap_count=%u\n", refcount_read(&bo->cmap.mmap_count));
 }
 
 static int panthor_gem_pin_locked(struct drm_gem_object *obj)
@@ -604,6 +605,13 @@ static int panthor_gem_mmap(struct drm_gem_object *obj, struct vm_area_struct *v
 	if (is_cow_mapping(vma->vm_flags))
 		return -EINVAL;
 
+	if (!refcount_inc_not_zero(&bo->cmap.mmap_count)) {
+		dma_resv_lock(obj->resv, NULL);
+		if (!refcount_inc_not_zero(&bo->cmap.mmap_count))
+			refcount_set(&bo->cmap.mmap_count, 1);
+		dma_resv_unlock(obj->resv);
+	}
+
 	vm_flags_set(vma, VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP);
 	vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
 	if (should_map_wc(bo))
@@ -730,10 +738,43 @@ static vm_fault_t panthor_gem_fault(struct vm_fault *vmf)
 	return blocking_page_setup(vmf, bo, page_offset, true);
 }
 
+static void panthor_gem_vm_open(struct vm_area_struct *vma)
+{
+	struct panthor_gem_object *bo = to_panthor_bo(vma->vm_private_data);
+
+	/* mmap_count must have been incremented at mmap time, so it can't be
+	 * zero here.
+	 */
+	if (!drm_gem_is_imported(&bo->base))
+		drm_WARN_ON(bo->base.dev, !refcount_inc_not_zero(&bo->cmap.mmap_count));
+
+	drm_gem_vm_open(vma);
+}
+
+static void panthor_gem_vm_close(struct vm_area_struct *vma)
+{
+	struct panthor_gem_object *bo = to_panthor_bo(vma->vm_private_data);
+
+	if (drm_gem_is_imported(&bo->base))
+		goto out;
+
+	if (refcount_dec_not_one(&bo->cmap.mmap_count))
+		goto out;
+
+	dma_resv_lock(bo->base.resv, NULL);
+	if (refcount_dec_and_test(&bo->cmap.mmap_count)) {
+		/* Nothing to do, pages are reclaimed lazily. */
+	}
+	dma_resv_unlock(bo->base.resv);
+
+out:
+	drm_gem_object_put(&bo->base);
+}
+
 const struct vm_operations_struct panthor_gem_vm_ops = {
 	.fault = panthor_gem_fault,
-	.open = drm_gem_vm_open,
-	.close = drm_gem_vm_close,
+	.open = panthor_gem_vm_open,
+	.close = panthor_gem_vm_close,
 };
 
 static const struct drm_gem_object_funcs panthor_gem_funcs = {
diff --git a/drivers/gpu/drm/panthor/panthor_gem.h b/drivers/gpu/drm/panthor/panthor_gem.h
index b66478c9590c..c0a18dca732c 100644
--- a/drivers/gpu/drm/panthor/panthor_gem.h
+++ b/drivers/gpu/drm/panthor/panthor_gem.h
@@ -80,6 +80,9 @@ struct panthor_gem_cpu_map {
 
 	/** @vaddr_use_count: Number of active vmap() requests on this GEM */
 	refcount_t vaddr_use_count;
+
+	/** @mmap_count: Number of active mmap() requests on this GEM */
+	refcount_t mmap_count;
 };
 
 /**
-- 
2.53.0

