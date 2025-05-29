Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9DCAC77D3
	for <lists+dri-devel@lfdr.de>; Thu, 29 May 2025 07:42:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 279AC10E6EA;
	Thu, 29 May 2025 05:42:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mpgztUNu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAD1D10E6E8
 for <dri-devel@lists.freedesktop.org>; Thu, 29 May 2025 05:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748497369; x=1780033369;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ea45/wy6aelPF2+M9pYlfuxLHzoZNKixVvebPZ8V9YU=;
 b=mpgztUNueKIm5mQ4iYxy96/3vkvA8KdFmuvkrAWYptmlL4rUmE/fP9E1
 KqfwqVL0vXCuVpD6EUKDA+koUfhsO9gBDL/Pj6hLWvm1pvelHLC/CHw0l
 JJjs//x2Hyrr59+IjGdgc/7xmEDIbxn8mXxMm2BP8uCPgsodkb1+3/WH2
 M84rz1qXCKZ22dRxBAEUI0bRe/zi8RC8nPfgEqqy/4R7NUALacMIajlz4
 /fQ5+1W90rmuAnGDasV4/PWVY0XohxQhC3I0RFH34c9yde0KIuRcTyeDD
 x1aCjPGNIuq+2cfFd8xsn1YZIc2ZBGGccMraTDh1rhRlmvyPYn267riyK Q==;
X-CSE-ConnectionGUID: ZwDIuBxSQw2qA2GXkwh4jg==
X-CSE-MsgGUID: TsLKPT90RL2WqW1zkX52pg==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="67963066"
X-IronPort-AV: E=Sophos;i="6.15,323,1739865600"; d="scan'208";a="67963066"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 22:42:49 -0700
X-CSE-ConnectionGUID: lpReMSdNTTqVdLXtIvyWcg==
X-CSE-MsgGUID: rYdlzE95QFeNt+TED2GCkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,323,1739865600"; d="scan'208";a="144443355"
Received: from yilunxu-optiplex-7050.sh.intel.com ([10.239.159.165])
 by fmviesa009.fm.intel.com with ESMTP; 28 May 2025 22:42:42 -0700
From: Xu Yilun <yilun.xu@linux.intel.com>
To: kvm@vger.kernel.org, sumit.semwal@linaro.org, christian.koenig@amd.com,
 pbonzini@redhat.com, seanjc@google.com, alex.williamson@redhat.com,
 jgg@nvidia.com, dan.j.williams@intel.com, aik@amd.com,
 linux-coco@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, vivek.kasireddy@intel.com,
 yilun.xu@intel.com, yilun.xu@linux.intel.com, linux-kernel@vger.kernel.org,
 lukas@wunner.de, yan.y.zhao@intel.com, daniel.vetter@ffwll.ch,
 leon@kernel.org, baolu.lu@linux.intel.com, zhenzhong.duan@intel.com,
 tao1.su@intel.com, linux-pci@vger.kernel.org, zhiw@nvidia.com,
 simona.vetter@ffwll.ch, shameerali.kolothum.thodi@huawei.com,
 aneesh.kumar@kernel.org, iommu@lists.linux.dev, kevin.tian@intel.com
Subject: [RFC PATCH 11/30] KVM: vfio_dmabuf: Fetch VFIO specific dma-buf data
 for sanity check
Date: Thu, 29 May 2025 13:34:54 +0800
Message-Id: <20250529053513.1592088-12-yilun.xu@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250529053513.1592088-1-yilun.xu@linux.intel.com>
References: <20250529053513.1592088-1-yilun.xu@linux.intel.com>
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

Fetch VFIO specific dma-buf data to see if the dma-buf is eligible to
be assigned to CoCo VM as private MMIO.

KVM expects host unaccessible MMIO regions been mapped in private
roots. So need to identify VFIO dma-buf by successfully getting VFIO
specific dma-buf data. VFIO dma-buf also provides the struct kvm *kvm
handler for KVM to check if the owner device of the MMIO region is
already assigned to the same CoCo VM.

Signed-off-by: Xu Yilun <yilun.xu@linux.intel.com>
---
 virt/kvm/vfio_dmabuf.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/virt/kvm/vfio_dmabuf.c b/virt/kvm/vfio_dmabuf.c
index c427ab39c68a..ef695039402f 100644
--- a/virt/kvm/vfio_dmabuf.c
+++ b/virt/kvm/vfio_dmabuf.c
@@ -12,6 +12,22 @@ struct kvm_vfio_dmabuf {
 	struct kvm_memory_slot *slot;
 };
 
+static struct vfio_dma_buf_data *kvm_vfio_dma_buf_get_data(struct dma_buf *dmabuf)
+{
+	struct vfio_dma_buf_data *(*fn)(struct dma_buf *dmabuf);
+	struct vfio_dma_buf_data *ret;
+
+	fn = symbol_get(vfio_dma_buf_get_data);
+	if (!fn)
+		return ERR_PTR(-ENOENT);
+
+	ret = fn(dmabuf);
+
+	symbol_put(vfio_dma_buf_get_data);
+
+	return ret;
+}
+
 static void kv_dmabuf_move_notify(struct dma_buf_attachment *attach)
 {
 	struct kvm_vfio_dmabuf *kv_dmabuf = attach->importer_priv;
@@ -48,6 +64,7 @@ int kvm_vfio_dmabuf_bind(struct kvm *kvm, struct kvm_memory_slot *slot,
 	size_t size = slot->npages << PAGE_SHIFT;
 	struct dma_buf_attachment *attach;
 	struct kvm_vfio_dmabuf *kv_dmabuf;
+	struct vfio_dma_buf_data *data;
 	struct dma_buf *dmabuf;
 	int ret;
 
@@ -60,6 +77,15 @@ int kvm_vfio_dmabuf_bind(struct kvm *kvm, struct kvm_memory_slot *slot,
 		goto err_dmabuf;
 	}
 
+	data = kvm_vfio_dma_buf_get_data(dmabuf);
+	if (IS_ERR(data))
+		goto err_dmabuf;
+
+	if (data->kvm != kvm) {
+		ret = -EINVAL;
+		goto err_dmabuf;
+	}
+
 	kv_dmabuf = kzalloc(sizeof(*kv_dmabuf), GFP_KERNEL);
 	if (!kv_dmabuf) {
 		ret = -ENOMEM;
-- 
2.25.1

