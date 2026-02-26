Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AOQxMPXFoGnImQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 23:15:17 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CFF81B03D4
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 23:15:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76F3A10E9FE;
	Thu, 26 Feb 2026 22:15:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=meta.com header.i=@meta.com header.b="JkuK1lla";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7536710E046
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 20:34:31 +0000 (UTC)
Received: from pps.filterd (m0109332.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61QH7RIh1891443; Thu, 26 Feb 2026 12:23:02 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=s2048-2025-q2;
 bh=4pcW/NWjzbNIWAsTEVkV5MDbaa7KgPXPuivmfTCyiik=; b=JkuK1llaFTM/
 x+M4io9R69lEge2o1xUbabzu+pFp7vKwQcRi+TIxqA8ekeLfPMYLfAaXEIh4qPeo
 zK9bOBo7c0jXskyrY0LSCPGWi+V8nJ+2xv6rBZn1O9VxOwfS3MQ6j31NsilqElO9
 p9PiZYkRDcVkVSKIYfDIjjDHAT9DZivg8TVwm0k3jk5+iLv6Igr7d0+KUCERAl/Q
 9+oQayeCpBxFUqVV8gqjL5rsnKKrMdShVLSdl9ymEN5rOl6sBKW3dufnKybLN+4C
 Xa+xutxHgsCErgd2CbcZwcdni9zBoDoZk2M4LCPvPFB7J4yy/8Ai13mWqmmE9zrP
 nVEgbiIzEw==
Received: from maileast.thefacebook.com ([163.114.135.16])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4cjmp9dnms-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 26 Feb 2026 12:23:02 -0800 (PST)
Received: from localhost (2620:10d:c0a8:1b::2d) by mail.thefacebook.com
 (2620:10d:c0a9:6f::8fd4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.35; Thu, 26 Feb
 2026 20:22:49 +0000
From: Matt Evans <mattev@meta.com>
To: Alex Williamson <alex@shazbot.org>, Leon Romanovsky <leon@kernel.org>,
 Jason Gunthorpe <jgg@nvidia.com>, Alex Mastro <amastro@fb.com>,
 Mahmoud Adam <mngyadam@amazon.de>, David Matlack <dmatlack@google.com>
CC: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>, Sumit Semwal
 <sumit.semwal@linaro.org>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>,
 Kevin Tian <kevin.tian@intel.com>, Ankit Agrawal <ankita@nvidia.com>,
 Pranjal Shrivastava <praan@google.com>, Alistair Popple
 <apopple@nvidia.com>, Vivek Kasireddy <vivek.kasireddy@intel.com>,
 <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>,
 <kvm@vger.kernel.org>
Subject: [RFC PATCH 3/7] vfio/pci: Support mmap() of a DMABUF
Date: Thu, 26 Feb 2026 12:21:59 -0800
Message-ID: <20260226202211.929005-4-mattev@meta.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260226202211.929005-1-mattev@meta.com>
References: <20260226202211.929005-1-mattev@meta.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [2620:10d:c0a8:1b::2d]
X-Proofpoint-GUID: bo-yooN7D0hXen55CgCeotpAvMNRfdcN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDE4NiBTYWx0ZWRfXx2R/GJyuvV5T
 K5TukSw7N8Ug142bKFLuFSR0o4MQURhJ8Vuyk6l1XnmNpwq0blWsl3Jc0WlUjkdvPcV22SFZtAi
 PMrfRg2cKG87t0g2vExkU2dNBg8BD4hzSs+WZ3/5nAfPL7nfDmbt7KyVWsd74oc++0QPtJQDqyz
 T1wjiD7aU1N+JPRKtZ0R6evMWaIbolHNceKztQwXP0AL3fx0wIl9QPuA+g6hab8pMcfkvt7CoFp
 cjueyRZsP/qRbssITWt8W/6ObUypK1vJ36NLIaWXCK1tbHOJggJO2bzm5G7GogTOZ8tnidR9OGe
 5hf+PBKISrmAL/nMosZNE91aJzRuQns+Yll/dAeqlRvWUaI0AelGWw429teCDx4IM88fMY3in1q
 rXZYR3YUTPnOp8yr5LliMWAeTF8MbWLV8KmlRnafj9azYwCNDjc6WSnG6++VWqjm5O9F6w98QJP
 SoSfAMRwDjcsEOHKzCg==
X-Proofpoint-ORIG-GUID: bo-yooN7D0hXen55CgCeotpAvMNRfdcN
X-Authority-Analysis: v=2.4 cv=abZsXBot c=1 sm=1 tr=0 ts=69a0aba6 cx=c_pps
 a=MfjaFnPeirRr97d5FC5oHw==:117 a=MfjaFnPeirRr97d5FC5oHw==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=VabnemYjAAAA:8 a=mBpQAGpv64ugA0MnHpoA:9
 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-26_02,2026-02-26_01,2025-10-01_01
X-Mailman-Approved-At: Thu, 26 Feb 2026 22:15:13 +0000
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
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[meta.com,reject];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[meta.com:s=s2048-2025-q2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alex@shazbot.org,m:leon@kernel.org,m:jgg@nvidia.com,m:amastro@fb.com,m:mngyadam@amazon.de,m:dmatlack@google.com,m:bjorn@kernel.org,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:kevin.tian@intel.com,m:ankita@nvidia.com,m:praan@google.com,m:apopple@nvidia.com,m:vivek.kasireddy@intel.com,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:kvm@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[mattev@meta.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mattev@meta.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[meta.com:+];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-0.989];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 2CFF81B03D4
X-Rspamd-Action: no action

A VFIO DMABUF can export a subset of a BAR to userspace by fd; add
support for mmap() of this fd.  This provides another route for a
process to map BARs, except one where the process can only map a specific
subset of a BAR represented by the exported DMABUF.

mmap() support enables userspace driver designs that safely delegate
access to BAR sub-ranges to other client processes by sharing a DMABUF
fd, without having to share the (omnipotent) VFIO device fd with them.

The mmap callback installs vm_ops callbacks for .fault and .huge_fault;
they find a PFN by searching the DMABUF's physical ranges.  That is,
DMABUFs with multiple ranges are supported for mmap().

Signed-off-by: Matt Evans <mattev@meta.com>
---
 drivers/vfio/pci/vfio_pci_dmabuf.c | 219 +++++++++++++++++++++++++++++
 1 file changed, 219 insertions(+)

diff --git a/drivers/vfio/pci/vfio_pci_dmabuf.c b/drivers/vfio/pci/vfio_pci_dmabuf.c
index 46ab64fbeb19..bebb496bd0f2 100644
--- a/drivers/vfio/pci/vfio_pci_dmabuf.c
+++ b/drivers/vfio/pci/vfio_pci_dmabuf.c
@@ -85,6 +85,209 @@ static void vfio_pci_dma_buf_release(struct dma_buf *dmabuf)
 	kfree(priv);
 }
 
+static int vfio_pci_dma_buf_find_pfn(struct device *dev,
+				     struct vfio_pci_dma_buf *vpdmabuf,
+				     struct vm_area_struct *vma,
+				     unsigned long address,
+				     unsigned int order,
+				     unsigned long *out_pfn)
+{
+	/*
+	 * Given a VMA (start, end, pgoffs) and a fault address,
+	 * search phys_vec[] to find the range representing the
+	 * address's offset into the VMA (and so a PFN).
+	 *
+	 * The phys_vec ranges represent contiguous spans of VAs
+	 * upwards from the buffer offset 0; the actual PFNs might be
+	 * in any order, overlap/alias, etc.  Calculate an offset of
+	 * the desired page given VMA start/pgoff and address, then
+	 * search upwards from 0 to find which span contains it.
+	 *
+	 * On success, a valid PFN for a page sized by 'order' is
+	 * returned into out_pfn.
+	 *
+	 * Failure occurs if:
+	 * - The page would cross the edge of the VMA
+	 * - The page isn't entirely contained within a range
+	 * - We find a range, but the final PFN isn't aligned to the
+	 *   requested order.
+	 *
+	 * (Upon failure, the caller is expected to try again with a
+	 * smaller order; the tests above will always succeed for
+	 * order=0 as the limit case.)
+	 *
+	 * It's suboptimal if DMABUFs are created with neigbouring
+	 * ranges that are physically contiguous, since hugepages
+	 * can't straddle range boundaries.  (The construction of the
+	 * ranges vector should merge such ranges.)
+	 */
+
+	unsigned long rounded_page_addr = address & ~((PAGE_SIZE << order) - 1);
+	unsigned long rounded_page_end = rounded_page_addr + (PAGE_SIZE << order);
+	unsigned long buf_page_offset;
+	unsigned long buf_offset = 0;
+	unsigned int i;
+
+	if (rounded_page_addr < vma->vm_start || rounded_page_end > vma->vm_end)
+		return -EAGAIN;
+
+	if (unlikely(check_add_overflow(rounded_page_addr - vma->vm_start,
+					vma->vm_pgoff << PAGE_SHIFT, &buf_page_offset)))
+		return -EFAULT;
+
+	for (i = 0; i < vpdmabuf->nr_ranges; i++) {
+		unsigned long range_len = vpdmabuf->phys_vec[i].len;
+		unsigned long range_start = vpdmabuf->phys_vec[i].paddr;
+
+		if (buf_page_offset >= buf_offset &&
+		    buf_page_offset + (PAGE_SIZE << order) <= buf_offset + range_len) {
+			/*
+			 * The faulting page is wholly contained
+			 * within the span represented by the range.
+			 * Validate PFN alignment for the order:
+			 */
+			unsigned long pfn = (range_start >> PAGE_SHIFT) +
+				((buf_page_offset - buf_offset) >> PAGE_SHIFT);
+
+			if (IS_ALIGNED(pfn, 1 << order)) {
+				*out_pfn = pfn;
+				return 0;
+			}
+			/* Retry with smaller order */
+			return -EAGAIN;
+		}
+		buf_offset += range_len;
+	}
+
+	/*
+	 * If we get here, the address fell outside of the span
+	 * represented by the (concatenated) ranges.  This can
+	 * never happen because vfio_pci_dma_buf_mmap() checks that
+	 * the VMA is <= the total size of the ranges.
+	 *
+	 * But if it does, force SIGBUS for the access, and warn.
+	 */
+	WARN_ONCE(1, "No range for addr 0x%lx, order %d: VMA 0x%lx-0x%lx pgoff 0x%lx, %d ranges, size 0x%lx\n",
+		  address, order, vma->vm_start, vma->vm_end, vma->vm_pgoff,
+		  vpdmabuf->nr_ranges, vpdmabuf->size);
+
+	return -EFAULT;
+}
+
+static vm_fault_t vfio_pci_dma_buf_mmap_huge_fault(struct vm_fault *vmf,
+						   unsigned int order)
+{
+	struct vm_area_struct *vma = vmf->vma;
+	struct vfio_pci_dma_buf *priv = vma->vm_private_data;
+	struct vfio_pci_core_device *vdev;
+	unsigned long pfn;
+	vm_fault_t ret = VM_FAULT_FALLBACK;
+
+	vdev = READ_ONCE(priv->vdev);
+
+	/*
+	 * A fault for an existing mmap might occur after
+	 * vfio_pci_dma_buf_cleanup() has revoked and destroyed the
+	 * vdev's DMABUFs, and annulled vdev.  After creation, vdev is
+	 * only ever written in cleanup.
+	 */
+	if (!vdev)
+		return VM_FAULT_SIGBUS;
+
+	int r = vfio_pci_dma_buf_find_pfn(&vdev->pdev->dev, priv, vma,
+					  vmf->address, order, &pfn);
+
+	if (r == 0) {
+		scoped_guard(rwsem_read, &vdev->memory_lock) {
+			/* Deal with the possibility of a fault racing
+			 * with vfio_pci_dma_buf_move() revoking and
+			 * then unmapping the buffer.  The
+			 * revocation/unmap and status change occurs
+			 * whilst holding memory_lock.
+			 */
+			if (priv->revoked)
+				ret = VM_FAULT_SIGBUS;
+			else
+				ret = vfio_pci_vmf_insert_pfn(vdev, vmf, pfn, order);
+		}
+	} else if (r != -EAGAIN) {
+		ret = VM_FAULT_SIGBUS;
+	}
+
+	dev_dbg_ratelimited(&vdev->pdev->dev,
+			    "%s(order = %d) PFN 0x%lx, VA 0x%lx, pgoff 0x%lx: 0x%x\n",
+			    __func__, order, pfn, vmf->address, vma->vm_pgoff, (unsigned int)ret);
+
+	return ret;
+}
+
+static vm_fault_t vfio_pci_dma_buf_mmap_page_fault(struct vm_fault *vmf)
+{
+	return vfio_pci_dma_buf_mmap_huge_fault(vmf, 0);
+}
+
+static const struct vm_operations_struct vfio_pci_dma_buf_mmap_ops = {
+	.fault = vfio_pci_dma_buf_mmap_page_fault,
+#ifdef CONFIG_ARCH_SUPPORTS_HUGE_PFNMAP
+	.huge_fault = vfio_pci_dma_buf_mmap_huge_fault,
+#endif
+};
+
+static bool vfio_pci_dma_buf_is_mappable(struct dma_buf *dmabuf)
+{
+	struct vfio_pci_dma_buf *priv = dmabuf->priv;
+
+	/*
+	 * Sanity checks at mmap() time; alignment has already been
+	 * asserted by validate_dmabuf_input().
+	 *
+	 * Although the revoked state is transient, refuse to map a
+	 * revoked buffer to flag early that something odd is going
+	 * on: for example, users should not be mmap()ing a buffer
+	 * that's being moved [by a user-triggered activity].
+	 */
+	if (priv->revoked)
+		return false;
+
+	return true;
+}
+
+/*
+ * Similar to vfio_pci_core_mmap() for a regular VFIO device fd, but
+ * differs by pre-checks performed and ultimately the vm_ops installed.
+ */
+static int vfio_pci_dma_buf_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma)
+{
+	struct vfio_pci_dma_buf *priv = dmabuf->priv;
+	u64 req_len, req_start;
+
+	if (!vfio_pci_dma_buf_is_mappable(dmabuf))
+		return -ENODEV;
+	if ((vma->vm_flags & VM_SHARED) == 0)
+		return -EINVAL;
+
+	req_len = vma->vm_end - vma->vm_start;
+	req_start = vma->vm_pgoff << PAGE_SHIFT;
+
+	if (req_start + req_len > priv->size)
+		return -EINVAL;
+
+	vma->vm_private_data = priv;
+	vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
+	vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);
+
+	/*
+	 * See comments in vfio_pci_core_mmap() re VM_ALLOW_ANY_UNCACHED.
+	 *
+	 * FIXME: get mapping attributes from dmabuf?
+	 */
+	vm_flags_set(vma, VM_ALLOW_ANY_UNCACHED | VM_IO | VM_PFNMAP |
+		     VM_DONTEXPAND | VM_DONTDUMP);
+	vma->vm_ops = &vfio_pci_dma_buf_mmap_ops;
+
+	return 0;
+}
+
 static const struct dma_buf_ops vfio_pci_dmabuf_ops = {
 	.pin = vfio_pci_dma_buf_pin,
 	.unpin = vfio_pci_dma_buf_unpin,
@@ -92,6 +295,7 @@ static const struct dma_buf_ops vfio_pci_dmabuf_ops = {
 	.map_dma_buf = vfio_pci_dma_buf_map,
 	.unmap_dma_buf = vfio_pci_dma_buf_unmap,
 	.release = vfio_pci_dma_buf_release,
+	.mmap = vfio_pci_dma_buf_mmap,
 };
 
 /*
@@ -335,6 +539,11 @@ void vfio_pci_dma_buf_move(struct vfio_pci_core_device *vdev, bool revoked)
 	struct vfio_pci_dma_buf *tmp;
 
 	lockdep_assert_held_write(&vdev->memory_lock);
+	/*
+	 * Holding memory_lock ensures a racing
+	 * vfio_pci_dma_buf_mmap_*_fault() observes priv->revoked
+	 * properly.
+	 */
 
 	list_for_each_entry_safe(priv, tmp, &vdev->dmabufs, dmabufs_elm) {
 		if (!get_file_active(&priv->dmabuf->file))
@@ -345,6 +554,14 @@ void vfio_pci_dma_buf_move(struct vfio_pci_core_device *vdev, bool revoked)
 			priv->revoked = revoked;
 			dma_buf_move_notify(priv->dmabuf);
 			dma_resv_unlock(priv->dmabuf->resv);
+
+			/*
+			 * Unmap any possible userspace mappings for a
+			 * now-revoked DMABUF:
+			 */
+			if (revoked)
+				unmap_mapping_range(priv->dmabuf->file->f_mapping,
+						    0, priv->size, 1);
 		}
 		fput(priv->dmabuf->file);
 	}
@@ -366,6 +583,8 @@ void vfio_pci_dma_buf_cleanup(struct vfio_pci_core_device *vdev)
 		priv->revoked = true;
 		dma_buf_move_notify(priv->dmabuf);
 		dma_resv_unlock(priv->dmabuf->resv);
+		unmap_mapping_range(priv->dmabuf->file->f_mapping,
+				    0, priv->size, 1);
 		vfio_device_put_registration(&vdev->vdev);
 		fput(priv->dmabuf->file);
 	}
-- 
2.47.3

