Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F41F1A050B1
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 03:29:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 728C610E7DE;
	Wed,  8 Jan 2025 02:29:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HorjPr1m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D2E910E7DE
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 02:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736303360; x=1767839360;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aXS00hvcLCx/JNYY8Pz9dnfD+e6/gpdHuhaWAk8Hj8w=;
 b=HorjPr1mPYLXqBrhfegF/sTkEJfNdfMr1lwF3zNvHUb+xsXkzKhr5IQQ
 rotNAVliAWt3eMBk3illVtEeo8UBZqb3fVm6m46o5BF0/ux+E89Iujk9D
 dJHIt8f+lYEodnwYt0k4Aw1LDKQAAk8HM9VFMNr2uOMdWLFBtIDQ+UiNK
 Uz0kzogAujKf131GkWou+M/vzDfdvUWgE3u6avSzPJm1p+E1GZg99o85m
 oyc+OqTf6jF583aSYLsV9I5kOdViHf7RFPrq7M/QFKRsb1WLkqiejkwe4
 wd6NxgBUS0SYVgCUZsVB8Ht/WzzURGeUxizpQw6ZYZJKGP8NDDRRqr2Gt w==;
X-CSE-ConnectionGUID: FQpmjjwYT8up4ubL+HsOrw==
X-CSE-MsgGUID: SUGWY7i2S7+q9bE5WTSk8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="47010618"
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; d="scan'208";a="47010618"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 18:29:20 -0800
X-CSE-ConnectionGUID: sBlHVtLsRvylvXu/hmJb0w==
X-CSE-MsgGUID: YQy6dSo0QA2bbZy+yHWL6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="103793822"
Received: from yilunxu-optiplex-7050.sh.intel.com ([10.239.159.165])
 by orviesa008.jf.intel.com with ESMTP; 07 Jan 2025 18:29:14 -0800
From: Xu Yilun <yilun.xu@linux.intel.com>
To: kvm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 sumit.semwal@linaro.org, christian.koenig@amd.com, pbonzini@redhat.com,
 seanjc@google.com, alex.williamson@redhat.com, jgg@nvidia.com,
 vivek.kasireddy@intel.com, dan.j.williams@intel.com, aik@amd.com
Cc: yilun.xu@intel.com, yilun.xu@linux.intel.com, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, lukas@wunner.de, yan.y.zhao@intel.com,
 daniel.vetter@ffwll.ch, leon@kernel.org, baolu.lu@linux.intel.com,
 zhenzhong.duan@intel.com, tao1.su@intel.com
Subject: [RFC PATCH 10/12] KVM: vfio_dmabuf: Fetch VFIO specific dma-buf data
 for sanity check
Date: Tue,  7 Jan 2025 22:27:17 +0800
Message-Id: <20250107142719.179636-11-yilun.xu@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250107142719.179636-1-yilun.xu@linux.intel.com>
References: <20250107142719.179636-1-yilun.xu@linux.intel.com>
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

KVM expects host unaccessible dma-buf for private MMIO mapping. So need
the exporter provide this information. VFIO also provides the
struct kvm *kvm handler for KVM to check if the owner device of the
MMIO region is already assigned to the same CoCo VM.

Signed-off-by: Xu Yilun <yilun.xu@linux.intel.com>
---
 virt/kvm/vfio_dmabuf.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/virt/kvm/vfio_dmabuf.c b/virt/kvm/vfio_dmabuf.c
index c427ab39c68a..26e01b815ebf 100644
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
+	if (!data->is_private || data->kvm != kvm) {
+		ret = -EINVAL;
+		goto err_dmabuf;
+	}
+
 	kv_dmabuf = kzalloc(sizeof(*kv_dmabuf), GFP_KERNEL);
 	if (!kv_dmabuf) {
 		ret = -ENOMEM;
-- 
2.25.1

