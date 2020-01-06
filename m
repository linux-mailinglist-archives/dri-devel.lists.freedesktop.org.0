Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FBBA131398
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2020 15:30:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 803F98935C;
	Mon,  6 Jan 2020 14:30:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from www413.your-server.de (www413.your-server.de [88.198.28.140])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C4236E456;
 Mon,  6 Jan 2020 14:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=cyberus-technology.de; s=default1911; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
 :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=w+pIu/3oaXxlHoG+1cSQ2586tRtDQrVswD9ISb1/EfM=; b=QxIjfc1QcHSxw+9OP4aYMM5IQq
 J/ir7dyTMMF8XvpbFNHcV3SgHjNoPcklqoGf+SRXJBWpYBJwiWbKNNLzMrauIf4ZxQjR1HkMk7kpn
 fSTV/zmluSn6ElsFQbSx+FRnLkRYa97ACDLIi2sCl23jNI6D480GVQ7Kd9+myB9cUVVp7oE3pMbga
 No+CCUMYbNK0baBTJAwQN+R+6W5HKIZ9YZ9Gj1q3D+vFosSNPGYl+E6LOLrNOZaE6kjmllgTQDivs
 XpL7nEHAtu2y2orunhba0XwA7KVipHQUjpnvRijq+Vdbv23AbSAQE0CZqiyddRp0FFiMTJTI5FnQa
 kbgXkXUg==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
 by www413.your-server.de with esmtpsa (TLSv1.2:DHE-RSA-AES256-GCM-SHA384:256)
 (Exim 4.89_1)
 (envelope-from <julian.stecklina@cyberus-technology.de>)
 id 1ioT1j-0008Hc-0a; Mon, 06 Jan 2020 15:06:39 +0100
Received: from [188.25.180.214] (helo=192-168-0-109.rdsnet.ro)
 by sslproxy06.your-server.de with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
 (Exim 4.89) (envelope-from <julian.stecklina@cyberus-technology.de>)
 id 1ioT1i-0000Xx-Ng; Mon, 06 Jan 2020 15:06:38 +0100
From: Julian Stecklina <julian.stecklina@cyberus-technology.de>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH 2/3] drm/i915/gvt: make gvt oblivious of kvmgt data structures
Date: Mon,  6 Jan 2020 16:06:21 +0200
Message-Id: <20200106140622.14393-2-julian.stecklina@cyberus-technology.de>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200106140622.14393-1-julian.stecklina@cyberus-technology.de>
References: <20200106140622.14393-1-julian.stecklina@cyberus-technology.de>
MIME-Version: 1.0
X-Authenticated-Sender: julian.stecklina@cyberus-technology.de
X-Virus-Scanned: Clear (ClamAV 0.101.4/25686/Mon Jan  6 10:55:07 2020)
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
Cc: Julian Stecklina <julian.stecklina@cyberus-technology.de>,
 linux-kernel@vger.kernel.org, hang.yuan@intel.com,
 dri-devel@lists.freedesktop.org, zhiyuan.lv@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Instead of defining KVMGT per-device state in struct intel_vgpu
directly, add an indirection. This makes the GVT code oblivious of
what state KVMGT needs to keep.

The intention here is to eventually make it possible to build
hypervisor backends for the mediator, without having to touch the
mediator itself. This is a first step.

Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
Cc: zhiyuan.lv@intel.com
Cc: hang.yuan@intel.com

Signed-off-by: Julian Stecklina <julian.stecklina@cyberus-technology.de>
---
 drivers/gpu/drm/i915/gvt/gvt.h   |  32 +---
 drivers/gpu/drm/i915/gvt/kvmgt.c | 287 +++++++++++++++++++------------
 2 files changed, 184 insertions(+), 135 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/gvt.h b/drivers/gpu/drm/i915/gvt/gvt.h
index 0081b051d3e0..2604739e5680 100644
--- a/drivers/gpu/drm/i915/gvt/gvt.h
+++ b/drivers/gpu/drm/i915/gvt/gvt.h
@@ -196,31 +196,8 @@ struct intel_vgpu {
 
 	struct dentry *debugfs;
 
-#if IS_ENABLED(CONFIG_DRM_I915_GVT_KVMGT)
-	struct {
-		struct mdev_device *mdev;
-		struct vfio_region *region;
-		int num_regions;
-		struct eventfd_ctx *intx_trigger;
-		struct eventfd_ctx *msi_trigger;
-
-		/*
-		 * Two caches are used to avoid mapping duplicated pages (eg.
-		 * scratch pages). This help to reduce dma setup overhead.
-		 */
-		struct rb_root gfn_cache;
-		struct rb_root dma_addr_cache;
-		unsigned long nr_cache_entries;
-		struct mutex cache_lock;
-
-		struct notifier_block iommu_notifier;
-		struct notifier_block group_notifier;
-		struct kvm *kvm;
-		struct work_struct release_work;
-		atomic_t released;
-		struct vfio_device *vfio_device;
-	} vdev;
-#endif
+	/* Hypervisor-specific device state. */
+	void *vdev;
 
 	struct list_head dmabuf_obj_list_head;
 	struct mutex dmabuf_lock;
@@ -231,6 +208,11 @@ struct intel_vgpu {
 	u32 scan_nonprivbb;
 };
 
+static inline void *intel_vgpu_vdev(struct intel_vgpu *vgpu)
+{
+	return vgpu->vdev;
+}
+
 /* validating GM healthy status*/
 #define vgpu_is_vm_unhealthy(ret_val) \
 	(((ret_val) == -EBADRQC) || ((ret_val) == -EFAULT))
diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index bd79a9718cc7..d725a4fb94b9 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -108,6 +108,36 @@ struct gvt_dma {
 	struct kref ref;
 };
 
+struct kvmgt_vdev {
+	struct intel_vgpu *vgpu;
+	struct mdev_device *mdev;
+	struct vfio_region *region;
+	int num_regions;
+	struct eventfd_ctx *intx_trigger;
+	struct eventfd_ctx *msi_trigger;
+
+	/*
+	 * Two caches are used to avoid mapping duplicated pages (eg.
+	 * scratch pages). This help to reduce dma setup overhead.
+	 */
+	struct rb_root gfn_cache;
+	struct rb_root dma_addr_cache;
+	unsigned long nr_cache_entries;
+	struct mutex cache_lock;
+
+	struct notifier_block iommu_notifier;
+	struct notifier_block group_notifier;
+	struct kvm *kvm;
+	struct work_struct release_work;
+	atomic_t released;
+	struct vfio_device *vfio_device;
+};
+
+static inline struct kvmgt_vdev *kvmgt_vdev(struct intel_vgpu *vgpu)
+{
+	return intel_vgpu_vdev(vgpu);
+}
+
 static inline bool handle_valid(unsigned long handle)
 {
 	return !!(handle & ~0xff);
@@ -129,7 +159,7 @@ static void gvt_unpin_guest_page(struct intel_vgpu *vgpu, unsigned long gfn,
 	for (npage = 0; npage < total_pages; npage++) {
 		unsigned long cur_gfn = gfn + npage;
 
-		ret = vfio_unpin_pages(mdev_dev(vgpu->vdev.mdev), &cur_gfn, 1);
+		ret = vfio_unpin_pages(mdev_dev(kvmgt_vdev(vgpu)->mdev), &cur_gfn, 1);
 		WARN_ON(ret != 1);
 	}
 }
@@ -152,7 +182,7 @@ static int gvt_pin_guest_page(struct intel_vgpu *vgpu, unsigned long gfn,
 		unsigned long cur_gfn = gfn + npage;
 		unsigned long pfn;
 
-		ret = vfio_pin_pages(mdev_dev(vgpu->vdev.mdev), &cur_gfn, 1,
+		ret = vfio_pin_pages(mdev_dev(kvmgt_vdev(vgpu)->mdev), &cur_gfn, 1,
 				     IOMMU_READ | IOMMU_WRITE, &pfn);
 		if (ret != 1) {
 			gvt_vgpu_err("vfio_pin_pages failed for gfn 0x%lx, ret %d\n",
@@ -219,7 +249,7 @@ static void gvt_dma_unmap_page(struct intel_vgpu *vgpu, unsigned long gfn,
 static struct gvt_dma *__gvt_cache_find_dma_addr(struct intel_vgpu *vgpu,
 		dma_addr_t dma_addr)
 {
-	struct rb_node *node = vgpu->vdev.dma_addr_cache.rb_node;
+	struct rb_node *node = kvmgt_vdev(vgpu)->dma_addr_cache.rb_node;
 	struct gvt_dma *itr;
 
 	while (node) {
@@ -237,7 +267,7 @@ static struct gvt_dma *__gvt_cache_find_dma_addr(struct intel_vgpu *vgpu,
 
 static struct gvt_dma *__gvt_cache_find_gfn(struct intel_vgpu *vgpu, gfn_t gfn)
 {
-	struct rb_node *node = vgpu->vdev.gfn_cache.rb_node;
+	struct rb_node *node = kvmgt_vdev(vgpu)->gfn_cache.rb_node;
 	struct gvt_dma *itr;
 
 	while (node) {
@@ -258,6 +288,7 @@ static int __gvt_cache_add(struct intel_vgpu *vgpu, gfn_t gfn,
 {
 	struct gvt_dma *new, *itr;
 	struct rb_node **link, *parent = NULL;
+	struct kvmgt_vdev *vdev = kvmgt_vdev(vgpu);
 
 	new = kzalloc(sizeof(struct gvt_dma), GFP_KERNEL);
 	if (!new)
@@ -270,7 +301,7 @@ static int __gvt_cache_add(struct intel_vgpu *vgpu, gfn_t gfn,
 	kref_init(&new->ref);
 
 	/* gfn_cache maps gfn to struct gvt_dma. */
-	link = &vgpu->vdev.gfn_cache.rb_node;
+	link = &vdev->gfn_cache.rb_node;
 	while (*link) {
 		parent = *link;
 		itr = rb_entry(parent, struct gvt_dma, gfn_node);
@@ -281,11 +312,11 @@ static int __gvt_cache_add(struct intel_vgpu *vgpu, gfn_t gfn,
 			link = &parent->rb_right;
 	}
 	rb_link_node(&new->gfn_node, parent, link);
-	rb_insert_color(&new->gfn_node, &vgpu->vdev.gfn_cache);
+	rb_insert_color(&new->gfn_node, &vdev->gfn_cache);
 
 	/* dma_addr_cache maps dma addr to struct gvt_dma. */
 	parent = NULL;
-	link = &vgpu->vdev.dma_addr_cache.rb_node;
+	link = &vdev->dma_addr_cache.rb_node;
 	while (*link) {
 		parent = *link;
 		itr = rb_entry(parent, struct gvt_dma, dma_addr_node);
@@ -296,46 +327,51 @@ static int __gvt_cache_add(struct intel_vgpu *vgpu, gfn_t gfn,
 			link = &parent->rb_right;
 	}
 	rb_link_node(&new->dma_addr_node, parent, link);
-	rb_insert_color(&new->dma_addr_node, &vgpu->vdev.dma_addr_cache);
+	rb_insert_color(&new->dma_addr_node, &vdev->dma_addr_cache);
 
-	vgpu->vdev.nr_cache_entries++;
+	vdev->nr_cache_entries++;
 	return 0;
 }
 
 static void __gvt_cache_remove_entry(struct intel_vgpu *vgpu,
 				struct gvt_dma *entry)
 {
-	rb_erase(&entry->gfn_node, &vgpu->vdev.gfn_cache);
-	rb_erase(&entry->dma_addr_node, &vgpu->vdev.dma_addr_cache);
+	struct kvmgt_vdev *vdev = kvmgt_vdev(vgpu);
+
+	rb_erase(&entry->gfn_node, &vdev->gfn_cache);
+	rb_erase(&entry->dma_addr_node, &vdev->dma_addr_cache);
 	kfree(entry);
-	vgpu->vdev.nr_cache_entries--;
+	vdev->nr_cache_entries--;
 }
 
 static void gvt_cache_destroy(struct intel_vgpu *vgpu)
 {
 	struct gvt_dma *dma;
 	struct rb_node *node = NULL;
+	struct kvmgt_vdev *vdev = kvmgt_vdev(vgpu);
 
 	for (;;) {
-		mutex_lock(&vgpu->vdev.cache_lock);
-		node = rb_first(&vgpu->vdev.gfn_cache);
+		mutex_lock(&vdev->cache_lock);
+		node = rb_first(&vdev->gfn_cache);
 		if (!node) {
-			mutex_unlock(&vgpu->vdev.cache_lock);
+			mutex_unlock(&vdev->cache_lock);
 			break;
 		}
 		dma = rb_entry(node, struct gvt_dma, gfn_node);
 		gvt_dma_unmap_page(vgpu, dma->gfn, dma->dma_addr, dma->size);
 		__gvt_cache_remove_entry(vgpu, dma);
-		mutex_unlock(&vgpu->vdev.cache_lock);
+		mutex_unlock(&vdev->cache_lock);
 	}
 }
 
 static void gvt_cache_init(struct intel_vgpu *vgpu)
 {
-	vgpu->vdev.gfn_cache = RB_ROOT;
-	vgpu->vdev.dma_addr_cache = RB_ROOT;
-	vgpu->vdev.nr_cache_entries = 0;
-	mutex_init(&vgpu->vdev.cache_lock);
+	struct kvmgt_vdev *vdev = kvmgt_vdev(vgpu);
+
+	vdev->gfn_cache = RB_ROOT;
+	vdev->dma_addr_cache = RB_ROOT;
+	vdev->nr_cache_entries = 0;
+	mutex_init(&vdev->cache_lock);
 }
 
 static void kvmgt_protect_table_init(struct kvmgt_guest_info *info)
@@ -409,16 +445,18 @@ static void kvmgt_protect_table_del(struct kvmgt_guest_info *info,
 static size_t intel_vgpu_reg_rw_opregion(struct intel_vgpu *vgpu, char *buf,
 		size_t count, loff_t *ppos, bool iswrite)
 {
+	struct kvmgt_vdev *vdev = kvmgt_vdev(vgpu);
 	unsigned int i = VFIO_PCI_OFFSET_TO_INDEX(*ppos) -
 			VFIO_PCI_NUM_REGIONS;
-	void *base = vgpu->vdev.region[i].data;
+	void *base = vdev->region[i].data;
 	loff_t pos = *ppos & VFIO_PCI_OFFSET_MASK;
 
-	if (pos >= vgpu->vdev.region[i].size || iswrite) {
+
+	if (pos >= vdev->region[i].size || iswrite) {
 		gvt_vgpu_err("invalid op or offset for Intel vgpu OpRegion\n");
 		return -EINVAL;
 	}
-	count = min(count, (size_t)(vgpu->vdev.region[i].size - pos));
+	count = min(count, (size_t)(vdev->region[i].size - pos));
 	memcpy(buf, base + pos, count);
 
 	return count;
@@ -512,7 +550,7 @@ static size_t intel_vgpu_reg_rw_edid(struct intel_vgpu *vgpu, char *buf,
 	unsigned int i = VFIO_PCI_OFFSET_TO_INDEX(*ppos) -
 			VFIO_PCI_NUM_REGIONS;
 	struct vfio_edid_region *region =
-		(struct vfio_edid_region *)vgpu->vdev.region[i].data;
+		(struct vfio_edid_region *)kvmgt_vdev(vgpu)->region[i].data;
 	loff_t pos = *ppos & VFIO_PCI_OFFSET_MASK;
 
 	if (pos < region->vfio_edid_regs.edid_offset) {
@@ -544,32 +582,34 @@ static int intel_vgpu_register_reg(struct intel_vgpu *vgpu,
 		const struct intel_vgpu_regops *ops,
 		size_t size, u32 flags, void *data)
 {
+	struct kvmgt_vdev *vdev = kvmgt_vdev(vgpu);
 	struct vfio_region *region;
 
-	region = krealloc(vgpu->vdev.region,
-			(vgpu->vdev.num_regions + 1) * sizeof(*region),
+	region = krealloc(vdev->region,
+			(vdev->num_regions + 1) * sizeof(*region),
 			GFP_KERNEL);
 	if (!region)
 		return -ENOMEM;
 
-	vgpu->vdev.region = region;
-	vgpu->vdev.region[vgpu->vdev.num_regions].type = type;
-	vgpu->vdev.region[vgpu->vdev.num_regions].subtype = subtype;
-	vgpu->vdev.region[vgpu->vdev.num_regions].ops = ops;
-	vgpu->vdev.region[vgpu->vdev.num_regions].size = size;
-	vgpu->vdev.region[vgpu->vdev.num_regions].flags = flags;
-	vgpu->vdev.region[vgpu->vdev.num_regions].data = data;
-	vgpu->vdev.num_regions++;
+	vdev->region = region;
+	vdev->region[vdev->num_regions].type = type;
+	vdev->region[vdev->num_regions].subtype = subtype;
+	vdev->region[vdev->num_regions].ops = ops;
+	vdev->region[vdev->num_regions].size = size;
+	vdev->region[vdev->num_regions].flags = flags;
+	vdev->region[vdev->num_regions].data = data;
+	vdev->num_regions++;
 	return 0;
 }
 
 static int kvmgt_get_vfio_device(void *p_vgpu)
 {
 	struct intel_vgpu *vgpu = (struct intel_vgpu *)p_vgpu;
+	struct kvmgt_vdev *vdev = kvmgt_vdev(vgpu);
 
-	vgpu->vdev.vfio_device = vfio_device_get_from_dev(
-		mdev_dev(vgpu->vdev.mdev));
-	if (!vgpu->vdev.vfio_device) {
+	vdev->vfio_device = vfio_device_get_from_dev(
+		mdev_dev(vdev->mdev));
+	if (!vdev->vfio_device) {
 		gvt_vgpu_err("failed to get vfio device\n");
 		return -ENODEV;
 	}
@@ -637,10 +677,12 @@ static int kvmgt_set_edid(void *p_vgpu, int port_num)
 
 static void kvmgt_put_vfio_device(void *vgpu)
 {
-	if (WARN_ON(!((struct intel_vgpu *)vgpu)->vdev.vfio_device))
+	struct kvmgt_vdev *vdev = kvmgt_vdev((struct intel_vgpu *)vgpu);
+
+	if (WARN_ON(!vdev->vfio_device))
 		return;
 
-	vfio_device_put(((struct intel_vgpu *)vgpu)->vdev.vfio_device);
+	vfio_device_put(vdev->vfio_device);
 }
 
 static int intel_vgpu_create(struct kobject *kobj, struct mdev_device *mdev)
@@ -669,9 +711,9 @@ static int intel_vgpu_create(struct kobject *kobj, struct mdev_device *mdev)
 		goto out;
 	}
 
-	INIT_WORK(&vgpu->vdev.release_work, intel_vgpu_release_work);
+	INIT_WORK(&kvmgt_vdev(vgpu)->release_work, intel_vgpu_release_work);
 
-	vgpu->vdev.mdev = mdev;
+	kvmgt_vdev(vgpu)->mdev = mdev;
 	mdev_set_drvdata(mdev, vgpu);
 
 	gvt_dbg_core("intel_vgpu_create succeeded for mdev: %s\n",
@@ -696,9 +738,10 @@ static int intel_vgpu_remove(struct mdev_device *mdev)
 static int intel_vgpu_iommu_notifier(struct notifier_block *nb,
 				     unsigned long action, void *data)
 {
-	struct intel_vgpu *vgpu = container_of(nb,
-					struct intel_vgpu,
-					vdev.iommu_notifier);
+	struct kvmgt_vdev *vdev = container_of(nb,
+					       struct kvmgt_vdev,
+					       iommu_notifier);
+	struct intel_vgpu *vgpu = vdev->vgpu;
 
 	if (action == VFIO_IOMMU_NOTIFY_DMA_UNMAP) {
 		struct vfio_iommu_type1_dma_unmap *unmap = data;
@@ -708,7 +751,7 @@ static int intel_vgpu_iommu_notifier(struct notifier_block *nb,
 		iov_pfn = unmap->iova >> PAGE_SHIFT;
 		end_iov_pfn = iov_pfn + unmap->size / PAGE_SIZE;
 
-		mutex_lock(&vgpu->vdev.cache_lock);
+		mutex_lock(&vdev->cache_lock);
 		for (; iov_pfn < end_iov_pfn; iov_pfn++) {
 			entry = __gvt_cache_find_gfn(vgpu, iov_pfn);
 			if (!entry)
@@ -718,7 +761,7 @@ static int intel_vgpu_iommu_notifier(struct notifier_block *nb,
 					   entry->size);
 			__gvt_cache_remove_entry(vgpu, entry);
 		}
-		mutex_unlock(&vgpu->vdev.cache_lock);
+		mutex_unlock(&vdev->cache_lock);
 	}
 
 	return NOTIFY_OK;
@@ -727,16 +770,16 @@ static int intel_vgpu_iommu_notifier(struct notifier_block *nb,
 static int intel_vgpu_group_notifier(struct notifier_block *nb,
 				     unsigned long action, void *data)
 {
-	struct intel_vgpu *vgpu = container_of(nb,
-					struct intel_vgpu,
-					vdev.group_notifier);
+	struct kvmgt_vdev *vdev = container_of(nb,
+					       struct kvmgt_vdev,
+					       group_notifier);
 
 	/* the only action we care about */
 	if (action == VFIO_GROUP_NOTIFY_SET_KVM) {
-		vgpu->vdev.kvm = data;
+		vdev->kvm = data;
 
 		if (!data)
-			schedule_work(&vgpu->vdev.release_work);
+			schedule_work(&vdev->release_work);
 	}
 
 	return NOTIFY_OK;
@@ -745,15 +788,16 @@ static int intel_vgpu_group_notifier(struct notifier_block *nb,
 static int intel_vgpu_open(struct mdev_device *mdev)
 {
 	struct intel_vgpu *vgpu = mdev_get_drvdata(mdev);
+	struct kvmgt_vdev *vdev = kvmgt_vdev(vgpu);
 	unsigned long events;
 	int ret;
 
-	vgpu->vdev.iommu_notifier.notifier_call = intel_vgpu_iommu_notifier;
-	vgpu->vdev.group_notifier.notifier_call = intel_vgpu_group_notifier;
+	vdev->iommu_notifier.notifier_call = intel_vgpu_iommu_notifier;
+	vdev->group_notifier.notifier_call = intel_vgpu_group_notifier;
 
 	events = VFIO_IOMMU_NOTIFY_DMA_UNMAP;
 	ret = vfio_register_notifier(mdev_dev(mdev), VFIO_IOMMU_NOTIFY, &events,
-				&vgpu->vdev.iommu_notifier);
+				&vdev->iommu_notifier);
 	if (ret != 0) {
 		gvt_vgpu_err("vfio_register_notifier for iommu failed: %d\n",
 			ret);
@@ -762,7 +806,7 @@ static int intel_vgpu_open(struct mdev_device *mdev)
 
 	events = VFIO_GROUP_NOTIFY_SET_KVM;
 	ret = vfio_register_notifier(mdev_dev(mdev), VFIO_GROUP_NOTIFY, &events,
-				&vgpu->vdev.group_notifier);
+				&vdev->group_notifier);
 	if (ret != 0) {
 		gvt_vgpu_err("vfio_register_notifier for group failed: %d\n",
 			ret);
@@ -781,50 +825,52 @@ static int intel_vgpu_open(struct mdev_device *mdev)
 
 	intel_gvt_ops->vgpu_activate(vgpu);
 
-	atomic_set(&vgpu->vdev.released, 0);
+	atomic_set(&vdev->released, 0);
 	return ret;
 
 undo_group:
 	vfio_unregister_notifier(mdev_dev(mdev), VFIO_GROUP_NOTIFY,
-					&vgpu->vdev.group_notifier);
+					&vdev->group_notifier);
 
 undo_iommu:
 	vfio_unregister_notifier(mdev_dev(mdev), VFIO_IOMMU_NOTIFY,
-					&vgpu->vdev.iommu_notifier);
+					&vdev->iommu_notifier);
 out:
 	return ret;
 }
 
 static void intel_vgpu_release_msi_eventfd_ctx(struct intel_vgpu *vgpu)
 {
+	struct kvmgt_vdev *vdev = kvmgt_vdev(vgpu);
 	struct eventfd_ctx *trigger;
 
-	trigger = vgpu->vdev.msi_trigger;
+	trigger = vdev->msi_trigger;
 	if (trigger) {
 		eventfd_ctx_put(trigger);
-		vgpu->vdev.msi_trigger = NULL;
+		vdev->msi_trigger = NULL;
 	}
 }
 
 static void __intel_vgpu_release(struct intel_vgpu *vgpu)
 {
+	struct kvmgt_vdev *vdev = kvmgt_vdev(vgpu);
 	struct kvmgt_guest_info *info;
 	int ret;
 
 	if (!handle_valid(vgpu->handle))
 		return;
 
-	if (atomic_cmpxchg(&vgpu->vdev.released, 0, 1))
+	if (atomic_cmpxchg(&vdev->released, 0, 1))
 		return;
 
 	intel_gvt_ops->vgpu_release(vgpu);
 
-	ret = vfio_unregister_notifier(mdev_dev(vgpu->vdev.mdev), VFIO_IOMMU_NOTIFY,
-					&vgpu->vdev.iommu_notifier);
+	ret = vfio_unregister_notifier(mdev_dev(vdev->mdev), VFIO_IOMMU_NOTIFY,
+					&vdev->iommu_notifier);
 	WARN(ret, "vfio_unregister_notifier for iommu failed: %d\n", ret);
 
-	ret = vfio_unregister_notifier(mdev_dev(vgpu->vdev.mdev), VFIO_GROUP_NOTIFY,
-					&vgpu->vdev.group_notifier);
+	ret = vfio_unregister_notifier(mdev_dev(vdev->mdev), VFIO_GROUP_NOTIFY,
+					&vdev->group_notifier);
 	WARN(ret, "vfio_unregister_notifier for group failed: %d\n", ret);
 
 	/* dereference module reference taken at open */
@@ -835,7 +881,7 @@ static void __intel_vgpu_release(struct intel_vgpu *vgpu)
 
 	intel_vgpu_release_msi_eventfd_ctx(vgpu);
 
-	vgpu->vdev.kvm = NULL;
+	vdev->kvm = NULL;
 	vgpu->handle = 0;
 }
 
@@ -848,10 +894,10 @@ static void intel_vgpu_release(struct mdev_device *mdev)
 
 static void intel_vgpu_release_work(struct work_struct *work)
 {
-	struct intel_vgpu *vgpu = container_of(work, struct intel_vgpu,
-					vdev.release_work);
+	struct kvmgt_vdev *vdev = container_of(work, struct kvmgt_vdev,
+					       release_work);
 
-	__intel_vgpu_release(vgpu);
+	__intel_vgpu_release(vdev->vgpu);
 }
 
 static u64 intel_vgpu_get_bar_addr(struct intel_vgpu *vgpu, int bar)
@@ -933,12 +979,13 @@ static ssize_t intel_vgpu_rw(struct mdev_device *mdev, char *buf,
 			size_t count, loff_t *ppos, bool is_write)
 {
 	struct intel_vgpu *vgpu = mdev_get_drvdata(mdev);
+	struct kvmgt_vdev *vdev = kvmgt_vdev(vgpu);
 	unsigned int index = VFIO_PCI_OFFSET_TO_INDEX(*ppos);
 	u64 pos = *ppos & VFIO_PCI_OFFSET_MASK;
 	int ret = -EINVAL;
 
 
-	if (index >= VFIO_PCI_NUM_REGIONS + vgpu->vdev.num_regions) {
+	if (index >= VFIO_PCI_NUM_REGIONS + vdev->num_regions) {
 		gvt_vgpu_err("invalid index: %u\n", index);
 		return -EINVAL;
 	}
@@ -967,11 +1014,11 @@ static ssize_t intel_vgpu_rw(struct mdev_device *mdev, char *buf,
 	case VFIO_PCI_ROM_REGION_INDEX:
 		break;
 	default:
-		if (index >= VFIO_PCI_NUM_REGIONS + vgpu->vdev.num_regions)
+		if (index >= VFIO_PCI_NUM_REGIONS + vdev->num_regions)
 			return -EINVAL;
 
 		index -= VFIO_PCI_NUM_REGIONS;
-		return vgpu->vdev.region[index].ops->rw(vgpu, buf, count,
+		return vdev->region[index].ops->rw(vgpu, buf, count,
 				ppos, is_write);
 	}
 
@@ -1224,7 +1271,7 @@ static int intel_vgpu_set_msi_trigger(struct intel_vgpu *vgpu,
 			gvt_vgpu_err("eventfd_ctx_fdget failed\n");
 			return PTR_ERR(trigger);
 		}
-		vgpu->vdev.msi_trigger = trigger;
+		kvmgt_vdev(vgpu)->msi_trigger = trigger;
 	} else if ((flags & VFIO_IRQ_SET_DATA_NONE) && !count)
 		intel_vgpu_release_msi_eventfd_ctx(vgpu);
 
@@ -1276,6 +1323,7 @@ static long intel_vgpu_ioctl(struct mdev_device *mdev, unsigned int cmd,
 			     unsigned long arg)
 {
 	struct intel_vgpu *vgpu = mdev_get_drvdata(mdev);
+	struct kvmgt_vdev *vdev = kvmgt_vdev(vgpu);
 	unsigned long minsz;
 
 	gvt_dbg_core("vgpu%d ioctl, cmd: %d\n", vgpu->id, cmd);
@@ -1294,7 +1342,7 @@ static long intel_vgpu_ioctl(struct mdev_device *mdev, unsigned int cmd,
 		info.flags = VFIO_DEVICE_FLAGS_PCI;
 		info.flags |= VFIO_DEVICE_FLAGS_RESET;
 		info.num_regions = VFIO_PCI_NUM_REGIONS +
-				vgpu->vdev.num_regions;
+				vdev->num_regions;
 		info.num_irqs = VFIO_PCI_NUM_IRQS;
 
 		return copy_to_user((void __user *)arg, &info, minsz) ?
@@ -1385,22 +1433,22 @@ static long intel_vgpu_ioctl(struct mdev_device *mdev, unsigned int cmd,
 					.header.version = 1 };
 
 				if (info.index >= VFIO_PCI_NUM_REGIONS +
-						vgpu->vdev.num_regions)
+						vdev->num_regions)
 					return -EINVAL;
 				info.index =
 					array_index_nospec(info.index,
 							VFIO_PCI_NUM_REGIONS +
-							vgpu->vdev.num_regions);
+							vdev->num_regions);
 
 				i = info.index - VFIO_PCI_NUM_REGIONS;
 
 				info.offset =
 					VFIO_PCI_INDEX_TO_OFFSET(info.index);
-				info.size = vgpu->vdev.region[i].size;
-				info.flags = vgpu->vdev.region[i].flags;
+				info.size = vdev->region[i].size;
+				info.flags = vdev->region[i].flags;
 
-				cap_type.type = vgpu->vdev.region[i].type;
-				cap_type.subtype = vgpu->vdev.region[i].subtype;
+				cap_type.type = vdev->region[i].type;
+				cap_type.subtype = vdev->region[i].subtype;
 
 				ret = vfio_info_add_capability(&caps,
 							&cap_type.header,
@@ -1740,13 +1788,15 @@ static int kvmgt_guest_init(struct mdev_device *mdev)
 {
 	struct kvmgt_guest_info *info;
 	struct intel_vgpu *vgpu;
+	struct kvmgt_vdev *vdev;
 	struct kvm *kvm;
 
 	vgpu = mdev_get_drvdata(mdev);
 	if (handle_valid(vgpu->handle))
 		return -EEXIST;
 
-	kvm = vgpu->vdev.kvm;
+	vdev = kvmgt_vdev(vgpu);
+	kvm = vdev->kvm;
 	if (!kvm || kvm->mm != current->mm) {
 		gvt_vgpu_err("KVM is required to use Intel vGPU\n");
 		return -ESRCH;
@@ -1776,7 +1826,7 @@ static int kvmgt_guest_init(struct mdev_device *mdev)
 	info->debugfs_cache_entries = debugfs_create_ulong(
 						"kvmgt_nr_cache_entries",
 						0444, vgpu->debugfs,
-						&vgpu->vdev.nr_cache_entries);
+						&vdev->nr_cache_entries);
 	return 0;
 }
 
@@ -1793,9 +1843,17 @@ static bool kvmgt_guest_exit(struct kvmgt_guest_info *info)
 	return true;
 }
 
-static int kvmgt_attach_vgpu(void *vgpu, unsigned long *handle)
+static int kvmgt_attach_vgpu(void *p_vgpu, unsigned long *handle)
 {
-	/* nothing to do here */
+	struct intel_vgpu *vgpu = (struct intel_vgpu *)p_vgpu;
+
+	vgpu->vdev = kzalloc(sizeof(struct kvmgt_vdev), GFP_KERNEL);
+
+	if (!vgpu->vdev)
+		return -ENOMEM;
+
+	kvmgt_vdev(vgpu)->vgpu = vgpu;
+
 	return 0;
 }
 
@@ -1803,29 +1861,34 @@ static void kvmgt_detach_vgpu(void *p_vgpu)
 {
 	int i;
 	struct intel_vgpu *vgpu = (struct intel_vgpu *)p_vgpu;
+	struct kvmgt_vdev *vdev = kvmgt_vdev(vgpu);
 
-	if (!vgpu->vdev.region)
+	if (!vdev->region)
 		return;
 
-	for (i = 0; i < vgpu->vdev.num_regions; i++)
-		if (vgpu->vdev.region[i].ops->release)
-			vgpu->vdev.region[i].ops->release(vgpu,
-					&vgpu->vdev.region[i]);
-	vgpu->vdev.num_regions = 0;
-	kfree(vgpu->vdev.region);
-	vgpu->vdev.region = NULL;
+	for (i = 0; i < vdev->num_regions; i++)
+		if (vdev->region[i].ops->release)
+			vdev->region[i].ops->release(vgpu,
+					&vdev->region[i]);
+	vdev->num_regions = 0;
+	kfree(vdev->region);
+	vdev->region = NULL;
+
+	kfree(vdev);
 }
 
 static int kvmgt_inject_msi(unsigned long handle, u32 addr, u16 data)
 {
 	struct kvmgt_guest_info *info;
 	struct intel_vgpu *vgpu;
+	struct kvmgt_vdev *vdev;
 
 	if (!handle_valid(handle))
 		return -ESRCH;
 
 	info = (struct kvmgt_guest_info *)handle;
 	vgpu = info->vgpu;
+	vdev = kvmgt_vdev(vgpu);
 
 	/*
 	 * When guest is poweroff, msi_trigger is set to NULL, but vgpu's
@@ -1836,10 +1899,10 @@ static int kvmgt_inject_msi(unsigned long handle, u32 addr, u16 data)
 	 * enabled by guest. so if msi_trigger is null, success is still
 	 * returned and don't inject interrupt into guest.
 	 */
-	if (vgpu->vdev.msi_trigger == NULL)
+	if (vdev->msi_trigger == NULL)
 		return 0;
 
-	if (eventfd_signal(vgpu->vdev.msi_trigger, 1) == 1)
+	if (eventfd_signal(vdev->msi_trigger, 1) == 1)
 		return 0;
 
 	return -EFAULT;
@@ -1865,26 +1928,26 @@ static unsigned long kvmgt_gfn_to_pfn(unsigned long handle, unsigned long gfn)
 static int kvmgt_dma_map_guest_page(unsigned long handle, unsigned long gfn,
 		unsigned long size, dma_addr_t *dma_addr)
 {
-	struct kvmgt_guest_info *info;
 	struct intel_vgpu *vgpu;
+	struct kvmgt_vdev *vdev;
 	struct gvt_dma *entry;
 	int ret;
 
 	if (!handle_valid(handle))
 		return -EINVAL;
 
-	info = (struct kvmgt_guest_info *)handle;
-	vgpu = info->vgpu;
+	vgpu = ((struct kvmgt_guest_info *)handle)->vgpu;
+	vdev = kvmgt_vdev(vgpu);
 
-	mutex_lock(&info->vgpu->vdev.cache_lock);
+	mutex_lock(&vdev->cache_lock);
 
-	entry = __gvt_cache_find_gfn(info->vgpu, gfn);
+	entry = __gvt_cache_find_gfn(vgpu, gfn);
 	if (!entry) {
 		ret = gvt_dma_map_page(vgpu, gfn, dma_addr, size);
 		if (ret)
 			goto err_unlock;
 
-		ret = __gvt_cache_add(info->vgpu, gfn, *dma_addr, size);
+		ret = __gvt_cache_add(vgpu, gfn, *dma_addr, size);
 		if (ret)
 			goto err_unmap;
 	} else if (entry->size != size) {
@@ -1896,7 +1959,7 @@ static int kvmgt_dma_map_guest_page(unsigned long handle, unsigned long gfn,
 		if (ret)
 			goto err_unlock;
 
-		ret = __gvt_cache_add(info->vgpu, gfn, *dma_addr, size);
+		ret = __gvt_cache_add(vgpu, gfn, *dma_addr, size);
 		if (ret)
 			goto err_unmap;
 	} else {
@@ -1904,19 +1967,20 @@ static int kvmgt_dma_map_guest_page(unsigned long handle, unsigned long gfn,
 		*dma_addr = entry->dma_addr;
 	}
 
-	mutex_unlock(&info->vgpu->vdev.cache_lock);
+	mutex_unlock(&vdev->cache_lock);
 	return 0;
 
 err_unmap:
 	gvt_dma_unmap_page(vgpu, gfn, *dma_addr, size);
 err_unlock:
-	mutex_unlock(&info->vgpu->vdev.cache_lock);
+	mutex_unlock(&vdev->cache_lock);
 	return ret;
 }
 
 static int kvmgt_dma_pin_guest_page(unsigned long handle, dma_addr_t dma_addr)
 {
 	struct kvmgt_guest_info *info;
+	struct kvmgt_vdev *vdev;
 	struct gvt_dma *entry;
 	int ret = 0;
 
@@ -1924,14 +1988,15 @@ static int kvmgt_dma_pin_guest_page(unsigned long handle, dma_addr_t dma_addr)
 		return -ENODEV;
 
 	info = (struct kvmgt_guest_info *)handle;
+	vdev = kvmgt_vdev(info->vgpu);
 
-	mutex_lock(&info->vgpu->vdev.cache_lock);
+	mutex_lock(&vdev->cache_lock);
 	entry = __gvt_cache_find_dma_addr(info->vgpu, dma_addr);
 	if (entry)
 		kref_get(&entry->ref);
 	else
 		ret = -ENOMEM;
-	mutex_unlock(&info->vgpu->vdev.cache_lock);
+	mutex_unlock(&vdev->cache_lock);
 
 	return ret;
 }
@@ -1947,19 +2012,21 @@ static void __gvt_dma_release(struct kref *ref)
 
 static void kvmgt_dma_unmap_guest_page(unsigned long handle, dma_addr_t dma_addr)
 {
-	struct kvmgt_guest_info *info;
+	struct intel_vgpu *vgpu;
+	struct kvmgt_vdev *vdev;
 	struct gvt_dma *entry;
 
 	if (!handle_valid(handle))
 		return;
 
-	info = (struct kvmgt_guest_info *)handle;
+	vgpu = ((struct kvmgt_guest_info *)handle)->vgpu;
+	vdev = kvmgt_vdev(vgpu);
 
-	mutex_lock(&info->vgpu->vdev.cache_lock);
-	entry = __gvt_cache_find_dma_addr(info->vgpu, dma_addr);
+	mutex_lock(&vdev->cache_lock);
+	entry = __gvt_cache_find_dma_addr(vgpu, dma_addr);
 	if (entry)
 		kref_put(&entry->ref, __gvt_dma_release);
-	mutex_unlock(&info->vgpu->vdev.cache_lock);
+	mutex_unlock(&vdev->cache_lock);
 }
 
 static int kvmgt_rw_gpa(unsigned long handle, unsigned long gpa,
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
