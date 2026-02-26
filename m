Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2CqkIQTGoGnImQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 23:15:32 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B4A1B03FE
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 23:15:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4877210EA0B;
	Thu, 26 Feb 2026 22:15:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=meta.com header.i=@meta.com header.b="OZuPGg0X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F6B310E046
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 20:36:11 +0000 (UTC)
Received: from pps.filterd (m0148460.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61QG8R8c396710; Thu, 26 Feb 2026 12:22:54 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=s2048-2025-q2;
 bh=NKJHnGt6sTOYI+IgqMNni7UAaJMAwyCJvuNAQUwxgmw=; b=OZuPGg0XPM2q
 /Oz2pcVO0V63tGXrKqWNtXhlSoscr5+L01hQPBMYBARvYE9xFWCj3x8ii+JlSvB0
 IFaPoQhLdo0VXx1YEkBF7kmIEWqSNi1c4wktdnhxygVD35e9Ecbt6tY5ZDZdHfC2
 PktUxG2L5nFgnH7z2zRiBLs+UaV4xGfcFw7IRbpEc4bnjh5IqKpAJEPqfPgtCm5P
 +epsiKhqNIXv0IJv0M5QBN/bBccy4TVAFOfArsC2NBKnTQO2X7kyxfPsd9r6yCDH
 MzEMEqTedX5a4GCbyvrugMSRWCidDlenTeuIZ5HC/oYCZtKMkxtRGUsE+M3F0VQ3
 U8t/d7Tlyw==
Received: from maileast.thefacebook.com ([163.114.135.16])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4cjseeay19-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 26 Feb 2026 12:22:53 -0800 (PST)
Received: from localhost (2620:10d:c0a8:1c::11) by mail.thefacebook.com
 (2620:10d:c0a9:6f::237c) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.35; Thu, 26 Feb
 2026 20:22:53 +0000
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
Subject: [RFC PATCH 5/7] vfio/pci: Permanently revoke a DMABUF on request
Date: Thu, 26 Feb 2026 12:22:01 -0800
Message-ID: <20260226202211.929005-6-mattev@meta.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260226202211.929005-1-mattev@meta.com>
References: <20260226202211.929005-1-mattev@meta.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [2620:10d:c0a8:1c::11]
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDE4NiBTYWx0ZWRfX+qHDWMDAKJRM
 DqWV5o8u8Bw6FcD1AkBzm1ls8II2cYUZ1X4NBM5+UA5hZr5zEp4dL0MWuCRaymlIJYDBV+bRePD
 stgDjHV+uVfdLCaO0UX3VulOcNcXbJDOKHI8bP1EZXg22rDzhjwWn6g3Vy80XM7ZikM1KnaA7Zz
 LqFPA6bechejyKgRymib618ZzEOzWr/qG7pPrwRj3qp0zR7ye56JiMvIHtKn7LgzdnIQfCgWdCS
 KJ940CqbfYk/9lncC0Mg4eubvlbk1Y1a5AfMhu9zkl3LJFzA8S90fPruc8NzaJh/ovIC1sdD1od
 Ak//Y5awoRANnsHYnkl47wcdEFem1vDRlKzhc1vnNdEwKsMFGCXBYm0H0aYhWVwEoQfy6JTriTh
 Mlsf0I6+LKKehNMmYAeYSw+tMscEEO24iMmfh00zAIVdfkg8Ao905jB8Kcau8krfAVdCNrNMejl
 pLr6J637v/bqttvq8Ew==
X-Authority-Analysis: v=2.4 cv=df6NHHXe c=1 sm=1 tr=0 ts=69a0ab9d cx=c_pps
 a=MfjaFnPeirRr97d5FC5oHw==:117 a=MfjaFnPeirRr97d5FC5oHw==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=VabnemYjAAAA:8 a=gwrgxIBh24ckDezLgM0A:9
 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-GUID: EHCRFiXG_--2Hgqi2T8-qZJviE0D8Yxk
X-Proofpoint-ORIG-GUID: EHCRFiXG_--2Hgqi2T8-qZJviE0D8Yxk
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
	NEURAL_HAM(-0.00)[-0.991];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: F3B4A1B03FE
X-Rspamd-Action: no action

Expand the VFIO DMABUF revocation state to three states:
Not revoked, temporarily revoked, and permanently revoked.

The first two are for existing transient revocation, e.g. across a
function reset, and the DMABUF is put into the last in response to an
ioctl(DMA_BUF_IOCTL_REVOKE) request.

When triggered, dynamic imports are removed, PTEs zapped, and the
state changed such that no future mappings/imports are allowed.

This is useful to reclaim VFIO PCI BAR ranges previously delegated to
a subordinate process: The driver process can ensure that the loans
are closed down before repurposing exported ranges.

Signed-off-by: Matt Evans <mattev@meta.com>
---
 drivers/vfio/pci/vfio_pci_dmabuf.c | 64 +++++++++++++++++++++++++-----
 1 file changed, 53 insertions(+), 11 deletions(-)

diff --git a/drivers/vfio/pci/vfio_pci_dmabuf.c b/drivers/vfio/pci/vfio_pci_dmabuf.c
index bebb496bd0f2..af30ca205f31 100644
--- a/drivers/vfio/pci/vfio_pci_dmabuf.c
+++ b/drivers/vfio/pci/vfio_pci_dmabuf.c
@@ -9,6 +9,17 @@
 
 MODULE_IMPORT_NS("DMA_BUF");
 
+enum vfio_pci_dma_buf_status {
+	/*
+	 * A buffer can move freely between OK/accessible and revoked
+	 * states (for example, a device reset will temporarily revoke
+	 * it).  It can also be permanently revoked.
+	 */
+	VFIO_PCI_DMABUF_OK = 0,
+	VFIO_PCI_DMABUF_TEMP_REVOKED = 1,
+	VFIO_PCI_DMABUF_PERM_REVOKED = 2,
+};
+
 struct vfio_pci_dma_buf {
 	struct dma_buf *dmabuf;
 	struct vfio_pci_core_device *vdev;
@@ -17,9 +28,11 @@ struct vfio_pci_dma_buf {
 	struct dma_buf_phys_vec *phys_vec;
 	struct p2pdma_provider *provider;
 	u32 nr_ranges;
-	u8 revoked : 1;
+	enum vfio_pci_dma_buf_status status;
 };
 
+static int vfio_pci_dma_buf_revoke(struct dma_buf *dmabuf);
+
 static int vfio_pci_dma_buf_pin(struct dma_buf_attachment *attachment)
 {
 	return -EOPNOTSUPP;
@@ -38,7 +51,7 @@ static int vfio_pci_dma_buf_attach(struct dma_buf *dmabuf,
 	if (!attachment->peer2peer)
 		return -EOPNOTSUPP;
 
-	if (priv->revoked)
+	if (priv->status != VFIO_PCI_DMABUF_OK)
 		return -ENODEV;
 
 	return 0;
@@ -52,7 +65,7 @@ vfio_pci_dma_buf_map(struct dma_buf_attachment *attachment,
 
 	dma_resv_assert_held(priv->dmabuf->resv);
 
-	if (priv->revoked)
+	if (priv->status != VFIO_PCI_DMABUF_OK)
 		return ERR_PTR(-ENODEV);
 
 	return dma_buf_phys_vec_to_sgt(attachment, priv->provider,
@@ -205,7 +218,7 @@ static vm_fault_t vfio_pci_dma_buf_mmap_huge_fault(struct vm_fault *vmf,
 			 * revocation/unmap and status change occurs
 			 * whilst holding memory_lock.
 			 */
-			if (priv->revoked)
+			if (priv->status != VFIO_PCI_DMABUF_OK)
 				ret = VM_FAULT_SIGBUS;
 			else
 				ret = vfio_pci_vmf_insert_pfn(vdev, vmf, pfn, order);
@@ -246,7 +259,7 @@ static bool vfio_pci_dma_buf_is_mappable(struct dma_buf *dmabuf)
 	 * on: for example, users should not be mmap()ing a buffer
 	 * that's being moved [by a user-triggered activity].
 	 */
-	if (priv->revoked)
+	if (priv->status != VFIO_PCI_DMABUF_OK)
 		return false;
 
 	return true;
@@ -296,6 +309,7 @@ static const struct dma_buf_ops vfio_pci_dmabuf_ops = {
 	.unmap_dma_buf = vfio_pci_dma_buf_unmap,
 	.release = vfio_pci_dma_buf_release,
 	.mmap = vfio_pci_dma_buf_mmap,
+	.revoke = vfio_pci_dma_buf_revoke,
 };
 
 /*
@@ -320,7 +334,7 @@ int vfio_pci_dma_buf_iommufd_map(struct dma_buf_attachment *attachment,
 		return -EOPNOTSUPP;
 
 	priv = attachment->dmabuf->priv;
-	if (priv->revoked)
+	if (priv->status != VFIO_PCI_DMABUF_OK)
 		return -ENODEV;
 
 	/* More than one range to iommufd will require proper DMABUF support */
@@ -506,7 +520,8 @@ int vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
 	INIT_LIST_HEAD(&priv->dmabufs_elm);
 	down_write(&vdev->memory_lock);
 	dma_resv_lock(priv->dmabuf->resv, NULL);
-	priv->revoked = !__vfio_pci_memory_enabled(vdev);
+	priv->status = __vfio_pci_memory_enabled(vdev) ? VFIO_PCI_DMABUF_OK :
+		VFIO_PCI_DMABUF_TEMP_REVOKED;
 	list_add_tail(&priv->dmabufs_elm, &vdev->dmabufs);
 	dma_resv_unlock(priv->dmabuf->resv);
 	up_write(&vdev->memory_lock);
@@ -541,7 +556,7 @@ void vfio_pci_dma_buf_move(struct vfio_pci_core_device *vdev, bool revoked)
 	lockdep_assert_held_write(&vdev->memory_lock);
 	/*
 	 * Holding memory_lock ensures a racing
-	 * vfio_pci_dma_buf_mmap_*_fault() observes priv->revoked
+	 * vfio_pci_dma_buf_mmap_*_fault() observes priv->status
 	 * properly.
 	 */
 
@@ -549,9 +564,11 @@ void vfio_pci_dma_buf_move(struct vfio_pci_core_device *vdev, bool revoked)
 		if (!get_file_active(&priv->dmabuf->file))
 			continue;
 
-		if (priv->revoked != revoked) {
+		if ((priv->status == VFIO_PCI_DMABUF_OK && revoked) ||
+		    (priv->status == VFIO_PCI_DMABUF_TEMP_REVOKED && !revoked)) {
 			dma_resv_lock(priv->dmabuf->resv, NULL);
-			priv->revoked = revoked;
+			priv->status = revoked ? VFIO_PCI_DMABUF_TEMP_REVOKED :
+				VFIO_PCI_DMABUF_OK;
 			dma_buf_move_notify(priv->dmabuf);
 			dma_resv_unlock(priv->dmabuf->resv);
 
@@ -580,7 +597,7 @@ void vfio_pci_dma_buf_cleanup(struct vfio_pci_core_device *vdev)
 		dma_resv_lock(priv->dmabuf->resv, NULL);
 		list_del_init(&priv->dmabufs_elm);
 		priv->vdev = NULL;
-		priv->revoked = true;
+		priv->status = VFIO_PCI_DMABUF_PERM_REVOKED;
 		dma_buf_move_notify(priv->dmabuf);
 		dma_resv_unlock(priv->dmabuf->resv);
 		unmap_mapping_range(priv->dmabuf->file->f_mapping,
@@ -590,3 +607,28 @@ void vfio_pci_dma_buf_cleanup(struct vfio_pci_core_device *vdev)
 	}
 	up_write(&vdev->memory_lock);
 }
+
+static int vfio_pci_dma_buf_revoke(struct dma_buf *dmabuf)
+{
+	struct vfio_pci_dma_buf *priv = dmabuf->priv;
+	struct vfio_pci_core_device *vdev;
+
+	vdev = READ_ONCE(priv->vdev);
+
+	if (!vdev)
+		return -ENODEV;
+
+	scoped_guard(rwsem_read, &vdev->memory_lock) {
+		if (priv->status == VFIO_PCI_DMABUF_PERM_REVOKED)
+			return -EBADFD;
+
+		dma_resv_lock(priv->dmabuf->resv, NULL);
+		priv->status = VFIO_PCI_DMABUF_PERM_REVOKED;
+		dma_buf_move_notify(priv->dmabuf);
+		dma_resv_unlock(priv->dmabuf->resv);
+
+		unmap_mapping_range(priv->dmabuf->file->f_mapping,
+				    0, priv->size, 1);
+	}
+	return 0;
+}
-- 
2.47.3

