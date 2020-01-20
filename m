Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C64CB1423BF
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2020 07:45:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FE806E0A8;
	Mon, 20 Jan 2020 06:45:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 406496E029;
 Mon, 20 Jan 2020 06:45:11 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Jan 2020 22:45:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,340,1574150400"; 
 d="asc'?scan'208";a="258602729"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.14])
 by fmsmga002.fm.intel.com with ESMTP; 19 Jan 2020 22:45:08 -0800
Date: Mon, 20 Jan 2020 14:33:18 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Julian Stecklina <julian.stecklina@cyberus-technology.de>
Subject: Re: [RFC PATCH 1/4] drm/i915/gvt: make gvt oblivious of kvmgt data
 structures
Message-ID: <20200120063318.GC14597@zhen-hp.sh.intel.com>
References: <4079ce7c26a2d2a3c7e0828ed1ea6008d6e2c805.camel@cyberus-technology.de>
 <20200109171357.115936-1-julian.stecklina@cyberus-technology.de>
 <20200109171357.115936-2-julian.stecklina@cyberus-technology.de>
 <20200120062210.GA14597@zhen-hp.sh.intel.com>
MIME-Version: 1.0
In-Reply-To: <20200120062210.GA14597@zhen-hp.sh.intel.com>
User-Agent: Mutt/1.10.0 (2018-05-17)
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
Reply-To: Zhenyu Wang <zhenyuw@linux.intel.com>
Cc: zhiyuan.lv@intel.com, intel-gvt-dev@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 hang.yuan@intel.com
Content-Type: multipart/mixed; boundary="===============1858825642=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1858825642==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="f+W+jCU1fRNres8c"
Content-Disposition: inline


--f+W+jCU1fRNres8c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020.01.20 14:22:10 +0800, Zhenyu Wang wrote:
> On 2020.01.09 19:13:54 +0200, Julian Stecklina wrote:
> > Instead of defining KVMGT per-device state in struct intel_vgpu
> > directly, add an indirection. This makes the GVT code oblivious of
> > what state KVMGT needs to keep.
> >=20
> > The intention here is to eventually make it possible to build
> > hypervisor backends for the mediator, without having to touch the
> > mediator itself. This is a first step.
> >=20
> > Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
> >=20
> > Signed-off-by: Julian Stecklina <julian.stecklina@cyberus-technology.de>
> > ---
>=20
> Acked-by: Zhenyu Wang <zhenyuw@linux.intel.com>
>

hmm, I failed to apply this one, could you refresh against gvt-staging bran=
ch
on https://github.com/intel/gvt-linux?

thanks

> >  drivers/gpu/drm/i915/gvt/gvt.h   |  32 +---
> >  drivers/gpu/drm/i915/gvt/kvmgt.c | 287 +++++++++++++++++++------------
> >  2 files changed, 184 insertions(+), 135 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/i915/gvt/gvt.h b/drivers/gpu/drm/i915/gvt/=
gvt.h
> > index 0081b051d3e0..2604739e5680 100644
> > --- a/drivers/gpu/drm/i915/gvt/gvt.h
> > +++ b/drivers/gpu/drm/i915/gvt/gvt.h
> > @@ -196,31 +196,8 @@ struct intel_vgpu {
> > =20
> >  	struct dentry *debugfs;
> > =20
> > -#if IS_ENABLED(CONFIG_DRM_I915_GVT_KVMGT)
> > -	struct {
> > -		struct mdev_device *mdev;
> > -		struct vfio_region *region;
> > -		int num_regions;
> > -		struct eventfd_ctx *intx_trigger;
> > -		struct eventfd_ctx *msi_trigger;
> > -
> > -		/*
> > -		 * Two caches are used to avoid mapping duplicated pages (eg.
> > -		 * scratch pages). This help to reduce dma setup overhead.
> > -		 */
> > -		struct rb_root gfn_cache;
> > -		struct rb_root dma_addr_cache;
> > -		unsigned long nr_cache_entries;
> > -		struct mutex cache_lock;
> > -
> > -		struct notifier_block iommu_notifier;
> > -		struct notifier_block group_notifier;
> > -		struct kvm *kvm;
> > -		struct work_struct release_work;
> > -		atomic_t released;
> > -		struct vfio_device *vfio_device;
> > -	} vdev;
> > -#endif
> > +	/* Hypervisor-specific device state. */
> > +	void *vdev;
> > =20
> >  	struct list_head dmabuf_obj_list_head;
> >  	struct mutex dmabuf_lock;
> > @@ -231,6 +208,11 @@ struct intel_vgpu {
> >  	u32 scan_nonprivbb;
> >  };
> > =20
> > +static inline void *intel_vgpu_vdev(struct intel_vgpu *vgpu)
> > +{
> > +	return vgpu->vdev;
> > +}
> > +
> >  /* validating GM healthy status*/
> >  #define vgpu_is_vm_unhealthy(ret_val) \
> >  	(((ret_val) =3D=3D -EBADRQC) || ((ret_val) =3D=3D -EFAULT))
> > diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gv=
t/kvmgt.c
> > index bd79a9718cc7..d725a4fb94b9 100644
> > --- a/drivers/gpu/drm/i915/gvt/kvmgt.c
> > +++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
> > @@ -108,6 +108,36 @@ struct gvt_dma {
> >  	struct kref ref;
> >  };
> > =20
> > +struct kvmgt_vdev {
> > +	struct intel_vgpu *vgpu;
> > +	struct mdev_device *mdev;
> > +	struct vfio_region *region;
> > +	int num_regions;
> > +	struct eventfd_ctx *intx_trigger;
> > +	struct eventfd_ctx *msi_trigger;
> > +
> > +	/*
> > +	 * Two caches are used to avoid mapping duplicated pages (eg.
> > +	 * scratch pages). This help to reduce dma setup overhead.
> > +	 */
> > +	struct rb_root gfn_cache;
> > +	struct rb_root dma_addr_cache;
> > +	unsigned long nr_cache_entries;
> > +	struct mutex cache_lock;
> > +
> > +	struct notifier_block iommu_notifier;
> > +	struct notifier_block group_notifier;
> > +	struct kvm *kvm;
> > +	struct work_struct release_work;
> > +	atomic_t released;
> > +	struct vfio_device *vfio_device;
> > +};
> > +
> > +static inline struct kvmgt_vdev *kvmgt_vdev(struct intel_vgpu *vgpu)
> > +{
> > +	return intel_vgpu_vdev(vgpu);
> > +}
> > +
> >  static inline bool handle_valid(unsigned long handle)
> >  {
> >  	return !!(handle & ~0xff);
> > @@ -129,7 +159,7 @@ static void gvt_unpin_guest_page(struct intel_vgpu =
*vgpu, unsigned long gfn,
> >  	for (npage =3D 0; npage < total_pages; npage++) {
> >  		unsigned long cur_gfn =3D gfn + npage;
> > =20
> > -		ret =3D vfio_unpin_pages(mdev_dev(vgpu->vdev.mdev), &cur_gfn, 1);
> > +		ret =3D vfio_unpin_pages(mdev_dev(kvmgt_vdev(vgpu)->mdev), &cur_gfn,=
 1);
> >  		WARN_ON(ret !=3D 1);
> >  	}
> >  }
> > @@ -152,7 +182,7 @@ static int gvt_pin_guest_page(struct intel_vgpu *vg=
pu, unsigned long gfn,
> >  		unsigned long cur_gfn =3D gfn + npage;
> >  		unsigned long pfn;
> > =20
> > -		ret =3D vfio_pin_pages(mdev_dev(vgpu->vdev.mdev), &cur_gfn, 1,
> > +		ret =3D vfio_pin_pages(mdev_dev(kvmgt_vdev(vgpu)->mdev), &cur_gfn, 1,
> >  				     IOMMU_READ | IOMMU_WRITE, &pfn);
> >  		if (ret !=3D 1) {
> >  			gvt_vgpu_err("vfio_pin_pages failed for gfn 0x%lx, ret %d\n",
> > @@ -219,7 +249,7 @@ static void gvt_dma_unmap_page(struct intel_vgpu *v=
gpu, unsigned long gfn,
> >  static struct gvt_dma *__gvt_cache_find_dma_addr(struct intel_vgpu *vg=
pu,
> >  		dma_addr_t dma_addr)
> >  {
> > -	struct rb_node *node =3D vgpu->vdev.dma_addr_cache.rb_node;
> > +	struct rb_node *node =3D kvmgt_vdev(vgpu)->dma_addr_cache.rb_node;
> >  	struct gvt_dma *itr;
> > =20
> >  	while (node) {
> > @@ -237,7 +267,7 @@ static struct gvt_dma *__gvt_cache_find_dma_addr(st=
ruct intel_vgpu *vgpu,
> > =20
> >  static struct gvt_dma *__gvt_cache_find_gfn(struct intel_vgpu *vgpu, g=
fn_t gfn)
> >  {
> > -	struct rb_node *node =3D vgpu->vdev.gfn_cache.rb_node;
> > +	struct rb_node *node =3D kvmgt_vdev(vgpu)->gfn_cache.rb_node;
> >  	struct gvt_dma *itr;
> > =20
> >  	while (node) {
> > @@ -258,6 +288,7 @@ static int __gvt_cache_add(struct intel_vgpu *vgpu,=
 gfn_t gfn,
> >  {
> >  	struct gvt_dma *new, *itr;
> >  	struct rb_node **link, *parent =3D NULL;
> > +	struct kvmgt_vdev *vdev =3D kvmgt_vdev(vgpu);
> > =20
> >  	new =3D kzalloc(sizeof(struct gvt_dma), GFP_KERNEL);
> >  	if (!new)
> > @@ -270,7 +301,7 @@ static int __gvt_cache_add(struct intel_vgpu *vgpu,=
 gfn_t gfn,
> >  	kref_init(&new->ref);
> > =20
> >  	/* gfn_cache maps gfn to struct gvt_dma. */
> > -	link =3D &vgpu->vdev.gfn_cache.rb_node;
> > +	link =3D &vdev->gfn_cache.rb_node;
> >  	while (*link) {
> >  		parent =3D *link;
> >  		itr =3D rb_entry(parent, struct gvt_dma, gfn_node);
> > @@ -281,11 +312,11 @@ static int __gvt_cache_add(struct intel_vgpu *vgp=
u, gfn_t gfn,
> >  			link =3D &parent->rb_right;
> >  	}
> >  	rb_link_node(&new->gfn_node, parent, link);
> > -	rb_insert_color(&new->gfn_node, &vgpu->vdev.gfn_cache);
> > +	rb_insert_color(&new->gfn_node, &vdev->gfn_cache);
> > =20
> >  	/* dma_addr_cache maps dma addr to struct gvt_dma. */
> >  	parent =3D NULL;
> > -	link =3D &vgpu->vdev.dma_addr_cache.rb_node;
> > +	link =3D &vdev->dma_addr_cache.rb_node;
> >  	while (*link) {
> >  		parent =3D *link;
> >  		itr =3D rb_entry(parent, struct gvt_dma, dma_addr_node);
> > @@ -296,46 +327,51 @@ static int __gvt_cache_add(struct intel_vgpu *vgp=
u, gfn_t gfn,
> >  			link =3D &parent->rb_right;
> >  	}
> >  	rb_link_node(&new->dma_addr_node, parent, link);
> > -	rb_insert_color(&new->dma_addr_node, &vgpu->vdev.dma_addr_cache);
> > +	rb_insert_color(&new->dma_addr_node, &vdev->dma_addr_cache);
> > =20
> > -	vgpu->vdev.nr_cache_entries++;
> > +	vdev->nr_cache_entries++;
> >  	return 0;
> >  }
> > =20
> >  static void __gvt_cache_remove_entry(struct intel_vgpu *vgpu,
> >  				struct gvt_dma *entry)
> >  {
> > -	rb_erase(&entry->gfn_node, &vgpu->vdev.gfn_cache);
> > -	rb_erase(&entry->dma_addr_node, &vgpu->vdev.dma_addr_cache);
> > +	struct kvmgt_vdev *vdev =3D kvmgt_vdev(vgpu);
> > +
> > +	rb_erase(&entry->gfn_node, &vdev->gfn_cache);
> > +	rb_erase(&entry->dma_addr_node, &vdev->dma_addr_cache);
> >  	kfree(entry);
> > -	vgpu->vdev.nr_cache_entries--;
> > +	vdev->nr_cache_entries--;
> >  }
> > =20
> >  static void gvt_cache_destroy(struct intel_vgpu *vgpu)
> >  {
> >  	struct gvt_dma *dma;
> >  	struct rb_node *node =3D NULL;
> > +	struct kvmgt_vdev *vdev =3D kvmgt_vdev(vgpu);
> > =20
> >  	for (;;) {
> > -		mutex_lock(&vgpu->vdev.cache_lock);
> > -		node =3D rb_first(&vgpu->vdev.gfn_cache);
> > +		mutex_lock(&vdev->cache_lock);
> > +		node =3D rb_first(&vdev->gfn_cache);
> >  		if (!node) {
> > -			mutex_unlock(&vgpu->vdev.cache_lock);
> > +			mutex_unlock(&vdev->cache_lock);
> >  			break;
> >  		}
> >  		dma =3D rb_entry(node, struct gvt_dma, gfn_node);
> >  		gvt_dma_unmap_page(vgpu, dma->gfn, dma->dma_addr, dma->size);
> >  		__gvt_cache_remove_entry(vgpu, dma);
> > -		mutex_unlock(&vgpu->vdev.cache_lock);
> > +		mutex_unlock(&vdev->cache_lock);
> >  	}
> >  }
> > =20
> >  static void gvt_cache_init(struct intel_vgpu *vgpu)
> >  {
> > -	vgpu->vdev.gfn_cache =3D RB_ROOT;
> > -	vgpu->vdev.dma_addr_cache =3D RB_ROOT;
> > -	vgpu->vdev.nr_cache_entries =3D 0;
> > -	mutex_init(&vgpu->vdev.cache_lock);
> > +	struct kvmgt_vdev *vdev =3D kvmgt_vdev(vgpu);
> > +
> > +	vdev->gfn_cache =3D RB_ROOT;
> > +	vdev->dma_addr_cache =3D RB_ROOT;
> > +	vdev->nr_cache_entries =3D 0;
> > +	mutex_init(&vdev->cache_lock);
> >  }
> > =20
> >  static void kvmgt_protect_table_init(struct kvmgt_guest_info *info)
> > @@ -409,16 +445,18 @@ static void kvmgt_protect_table_del(struct kvmgt_=
guest_info *info,
> >  static size_t intel_vgpu_reg_rw_opregion(struct intel_vgpu *vgpu, char=
 *buf,
> >  		size_t count, loff_t *ppos, bool iswrite)
> >  {
> > +	struct kvmgt_vdev *vdev =3D kvmgt_vdev(vgpu);
> >  	unsigned int i =3D VFIO_PCI_OFFSET_TO_INDEX(*ppos) -
> >  			VFIO_PCI_NUM_REGIONS;
> > -	void *base =3D vgpu->vdev.region[i].data;
> > +	void *base =3D vdev->region[i].data;
> >  	loff_t pos =3D *ppos & VFIO_PCI_OFFSET_MASK;
> > =20
> > -	if (pos >=3D vgpu->vdev.region[i].size || iswrite) {
> > +
> > +	if (pos >=3D vdev->region[i].size || iswrite) {
> >  		gvt_vgpu_err("invalid op or offset for Intel vgpu OpRegion\n");
> >  		return -EINVAL;
> >  	}
> > -	count =3D min(count, (size_t)(vgpu->vdev.region[i].size - pos));
> > +	count =3D min(count, (size_t)(vdev->region[i].size - pos));
> >  	memcpy(buf, base + pos, count);
> > =20
> >  	return count;
> > @@ -512,7 +550,7 @@ static size_t intel_vgpu_reg_rw_edid(struct intel_v=
gpu *vgpu, char *buf,
> >  	unsigned int i =3D VFIO_PCI_OFFSET_TO_INDEX(*ppos) -
> >  			VFIO_PCI_NUM_REGIONS;
> >  	struct vfio_edid_region *region =3D
> > -		(struct vfio_edid_region *)vgpu->vdev.region[i].data;
> > +		(struct vfio_edid_region *)kvmgt_vdev(vgpu)->region[i].data;
> >  	loff_t pos =3D *ppos & VFIO_PCI_OFFSET_MASK;
> > =20
> >  	if (pos < region->vfio_edid_regs.edid_offset) {
> > @@ -544,32 +582,34 @@ static int intel_vgpu_register_reg(struct intel_v=
gpu *vgpu,
> >  		const struct intel_vgpu_regops *ops,
> >  		size_t size, u32 flags, void *data)
> >  {
> > +	struct kvmgt_vdev *vdev =3D kvmgt_vdev(vgpu);
> >  	struct vfio_region *region;
> > =20
> > -	region =3D krealloc(vgpu->vdev.region,
> > -			(vgpu->vdev.num_regions + 1) * sizeof(*region),
> > +	region =3D krealloc(vdev->region,
> > +			(vdev->num_regions + 1) * sizeof(*region),
> >  			GFP_KERNEL);
> >  	if (!region)
> >  		return -ENOMEM;
> > =20
> > -	vgpu->vdev.region =3D region;
> > -	vgpu->vdev.region[vgpu->vdev.num_regions].type =3D type;
> > -	vgpu->vdev.region[vgpu->vdev.num_regions].subtype =3D subtype;
> > -	vgpu->vdev.region[vgpu->vdev.num_regions].ops =3D ops;
> > -	vgpu->vdev.region[vgpu->vdev.num_regions].size =3D size;
> > -	vgpu->vdev.region[vgpu->vdev.num_regions].flags =3D flags;
> > -	vgpu->vdev.region[vgpu->vdev.num_regions].data =3D data;
> > -	vgpu->vdev.num_regions++;
> > +	vdev->region =3D region;
> > +	vdev->region[vdev->num_regions].type =3D type;
> > +	vdev->region[vdev->num_regions].subtype =3D subtype;
> > +	vdev->region[vdev->num_regions].ops =3D ops;
> > +	vdev->region[vdev->num_regions].size =3D size;
> > +	vdev->region[vdev->num_regions].flags =3D flags;
> > +	vdev->region[vdev->num_regions].data =3D data;
> > +	vdev->num_regions++;
> >  	return 0;
> >  }
> > =20
> >  static int kvmgt_get_vfio_device(void *p_vgpu)
> >  {
> >  	struct intel_vgpu *vgpu =3D (struct intel_vgpu *)p_vgpu;
> > +	struct kvmgt_vdev *vdev =3D kvmgt_vdev(vgpu);
> > =20
> > -	vgpu->vdev.vfio_device =3D vfio_device_get_from_dev(
> > -		mdev_dev(vgpu->vdev.mdev));
> > -	if (!vgpu->vdev.vfio_device) {
> > +	vdev->vfio_device =3D vfio_device_get_from_dev(
> > +		mdev_dev(vdev->mdev));
> > +	if (!vdev->vfio_device) {
> >  		gvt_vgpu_err("failed to get vfio device\n");
> >  		return -ENODEV;
> >  	}
> > @@ -637,10 +677,12 @@ static int kvmgt_set_edid(void *p_vgpu, int port_=
num)
> > =20
> >  static void kvmgt_put_vfio_device(void *vgpu)
> >  {
> > -	if (WARN_ON(!((struct intel_vgpu *)vgpu)->vdev.vfio_device))
> > +	struct kvmgt_vdev *vdev =3D kvmgt_vdev((struct intel_vgpu *)vgpu);
> > +
> > +	if (WARN_ON(!vdev->vfio_device))
> >  		return;
> > =20
> > -	vfio_device_put(((struct intel_vgpu *)vgpu)->vdev.vfio_device);
> > +	vfio_device_put(vdev->vfio_device);
> >  }
> > =20
> >  static int intel_vgpu_create(struct kobject *kobj, struct mdev_device =
*mdev)
> > @@ -669,9 +711,9 @@ static int intel_vgpu_create(struct kobject *kobj, =
struct mdev_device *mdev)
> >  		goto out;
> >  	}
> > =20
> > -	INIT_WORK(&vgpu->vdev.release_work, intel_vgpu_release_work);
> > +	INIT_WORK(&kvmgt_vdev(vgpu)->release_work, intel_vgpu_release_work);
> > =20
> > -	vgpu->vdev.mdev =3D mdev;
> > +	kvmgt_vdev(vgpu)->mdev =3D mdev;
> >  	mdev_set_drvdata(mdev, vgpu);
> > =20
> >  	gvt_dbg_core("intel_vgpu_create succeeded for mdev: %s\n",
> > @@ -696,9 +738,10 @@ static int intel_vgpu_remove(struct mdev_device *m=
dev)
> >  static int intel_vgpu_iommu_notifier(struct notifier_block *nb,
> >  				     unsigned long action, void *data)
> >  {
> > -	struct intel_vgpu *vgpu =3D container_of(nb,
> > -					struct intel_vgpu,
> > -					vdev.iommu_notifier);
> > +	struct kvmgt_vdev *vdev =3D container_of(nb,
> > +					       struct kvmgt_vdev,
> > +					       iommu_notifier);
> > +	struct intel_vgpu *vgpu =3D vdev->vgpu;
> > =20
> >  	if (action =3D=3D VFIO_IOMMU_NOTIFY_DMA_UNMAP) {
> >  		struct vfio_iommu_type1_dma_unmap *unmap =3D data;
> > @@ -708,7 +751,7 @@ static int intel_vgpu_iommu_notifier(struct notifie=
r_block *nb,
> >  		iov_pfn =3D unmap->iova >> PAGE_SHIFT;
> >  		end_iov_pfn =3D iov_pfn + unmap->size / PAGE_SIZE;
> > =20
> > -		mutex_lock(&vgpu->vdev.cache_lock);
> > +		mutex_lock(&vdev->cache_lock);
> >  		for (; iov_pfn < end_iov_pfn; iov_pfn++) {
> >  			entry =3D __gvt_cache_find_gfn(vgpu, iov_pfn);
> >  			if (!entry)
> > @@ -718,7 +761,7 @@ static int intel_vgpu_iommu_notifier(struct notifie=
r_block *nb,
> >  					   entry->size);
> >  			__gvt_cache_remove_entry(vgpu, entry);
> >  		}
> > -		mutex_unlock(&vgpu->vdev.cache_lock);
> > +		mutex_unlock(&vdev->cache_lock);
> >  	}
> > =20
> >  	return NOTIFY_OK;
> > @@ -727,16 +770,16 @@ static int intel_vgpu_iommu_notifier(struct notif=
ier_block *nb,
> >  static int intel_vgpu_group_notifier(struct notifier_block *nb,
> >  				     unsigned long action, void *data)
> >  {
> > -	struct intel_vgpu *vgpu =3D container_of(nb,
> > -					struct intel_vgpu,
> > -					vdev.group_notifier);
> > +	struct kvmgt_vdev *vdev =3D container_of(nb,
> > +					       struct kvmgt_vdev,
> > +					       group_notifier);
> > =20
> >  	/* the only action we care about */
> >  	if (action =3D=3D VFIO_GROUP_NOTIFY_SET_KVM) {
> > -		vgpu->vdev.kvm =3D data;
> > +		vdev->kvm =3D data;
> > =20
> >  		if (!data)
> > -			schedule_work(&vgpu->vdev.release_work);
> > +			schedule_work(&vdev->release_work);
> >  	}
> > =20
> >  	return NOTIFY_OK;
> > @@ -745,15 +788,16 @@ static int intel_vgpu_group_notifier(struct notif=
ier_block *nb,
> >  static int intel_vgpu_open(struct mdev_device *mdev)
> >  {
> >  	struct intel_vgpu *vgpu =3D mdev_get_drvdata(mdev);
> > +	struct kvmgt_vdev *vdev =3D kvmgt_vdev(vgpu);
> >  	unsigned long events;
> >  	int ret;
> > =20
> > -	vgpu->vdev.iommu_notifier.notifier_call =3D intel_vgpu_iommu_notifier;
> > -	vgpu->vdev.group_notifier.notifier_call =3D intel_vgpu_group_notifier;
> > +	vdev->iommu_notifier.notifier_call =3D intel_vgpu_iommu_notifier;
> > +	vdev->group_notifier.notifier_call =3D intel_vgpu_group_notifier;
> > =20
> >  	events =3D VFIO_IOMMU_NOTIFY_DMA_UNMAP;
> >  	ret =3D vfio_register_notifier(mdev_dev(mdev), VFIO_IOMMU_NOTIFY, &ev=
ents,
> > -				&vgpu->vdev.iommu_notifier);
> > +				&vdev->iommu_notifier);
> >  	if (ret !=3D 0) {
> >  		gvt_vgpu_err("vfio_register_notifier for iommu failed: %d\n",
> >  			ret);
> > @@ -762,7 +806,7 @@ static int intel_vgpu_open(struct mdev_device *mdev)
> > =20
> >  	events =3D VFIO_GROUP_NOTIFY_SET_KVM;
> >  	ret =3D vfio_register_notifier(mdev_dev(mdev), VFIO_GROUP_NOTIFY, &ev=
ents,
> > -				&vgpu->vdev.group_notifier);
> > +				&vdev->group_notifier);
> >  	if (ret !=3D 0) {
> >  		gvt_vgpu_err("vfio_register_notifier for group failed: %d\n",
> >  			ret);
> > @@ -781,50 +825,52 @@ static int intel_vgpu_open(struct mdev_device *md=
ev)
> > =20
> >  	intel_gvt_ops->vgpu_activate(vgpu);
> > =20
> > -	atomic_set(&vgpu->vdev.released, 0);
> > +	atomic_set(&vdev->released, 0);
> >  	return ret;
> > =20
> >  undo_group:
> >  	vfio_unregister_notifier(mdev_dev(mdev), VFIO_GROUP_NOTIFY,
> > -					&vgpu->vdev.group_notifier);
> > +					&vdev->group_notifier);
> > =20
> >  undo_iommu:
> >  	vfio_unregister_notifier(mdev_dev(mdev), VFIO_IOMMU_NOTIFY,
> > -					&vgpu->vdev.iommu_notifier);
> > +					&vdev->iommu_notifier);
> >  out:
> >  	return ret;
> >  }
> > =20
> >  static void intel_vgpu_release_msi_eventfd_ctx(struct intel_vgpu *vgpu)
> >  {
> > +	struct kvmgt_vdev *vdev =3D kvmgt_vdev(vgpu);
> >  	struct eventfd_ctx *trigger;
> > =20
> > -	trigger =3D vgpu->vdev.msi_trigger;
> > +	trigger =3D vdev->msi_trigger;
> >  	if (trigger) {
> >  		eventfd_ctx_put(trigger);
> > -		vgpu->vdev.msi_trigger =3D NULL;
> > +		vdev->msi_trigger =3D NULL;
> >  	}
> >  }
> > =20
> >  static void __intel_vgpu_release(struct intel_vgpu *vgpu)
> >  {
> > +	struct kvmgt_vdev *vdev =3D kvmgt_vdev(vgpu);
> >  	struct kvmgt_guest_info *info;
> >  	int ret;
> > =20
> >  	if (!handle_valid(vgpu->handle))
> >  		return;
> > =20
> > -	if (atomic_cmpxchg(&vgpu->vdev.released, 0, 1))
> > +	if (atomic_cmpxchg(&vdev->released, 0, 1))
> >  		return;
> > =20
> >  	intel_gvt_ops->vgpu_release(vgpu);
> > =20
> > -	ret =3D vfio_unregister_notifier(mdev_dev(vgpu->vdev.mdev), VFIO_IOMM=
U_NOTIFY,
> > -					&vgpu->vdev.iommu_notifier);
> > +	ret =3D vfio_unregister_notifier(mdev_dev(vdev->mdev), VFIO_IOMMU_NOT=
IFY,
> > +					&vdev->iommu_notifier);
> >  	WARN(ret, "vfio_unregister_notifier for iommu failed: %d\n", ret);
> > =20
> > -	ret =3D vfio_unregister_notifier(mdev_dev(vgpu->vdev.mdev), VFIO_GROU=
P_NOTIFY,
> > -					&vgpu->vdev.group_notifier);
> > +	ret =3D vfio_unregister_notifier(mdev_dev(vdev->mdev), VFIO_GROUP_NOT=
IFY,
> > +					&vdev->group_notifier);
> >  	WARN(ret, "vfio_unregister_notifier for group failed: %d\n", ret);
> > =20
> >  	/* dereference module reference taken at open */
> > @@ -835,7 +881,7 @@ static void __intel_vgpu_release(struct intel_vgpu =
*vgpu)
> > =20
> >  	intel_vgpu_release_msi_eventfd_ctx(vgpu);
> > =20
> > -	vgpu->vdev.kvm =3D NULL;
> > +	vdev->kvm =3D NULL;
> >  	vgpu->handle =3D 0;
> >  }
> > =20
> > @@ -848,10 +894,10 @@ static void intel_vgpu_release(struct mdev_device=
 *mdev)
> > =20
> >  static void intel_vgpu_release_work(struct work_struct *work)
> >  {
> > -	struct intel_vgpu *vgpu =3D container_of(work, struct intel_vgpu,
> > -					vdev.release_work);
> > +	struct kvmgt_vdev *vdev =3D container_of(work, struct kvmgt_vdev,
> > +					       release_work);
> > =20
> > -	__intel_vgpu_release(vgpu);
> > +	__intel_vgpu_release(vdev->vgpu);
> >  }
> > =20
> >  static u64 intel_vgpu_get_bar_addr(struct intel_vgpu *vgpu, int bar)
> > @@ -933,12 +979,13 @@ static ssize_t intel_vgpu_rw(struct mdev_device *=
mdev, char *buf,
> >  			size_t count, loff_t *ppos, bool is_write)
> >  {
> >  	struct intel_vgpu *vgpu =3D mdev_get_drvdata(mdev);
> > +	struct kvmgt_vdev *vdev =3D kvmgt_vdev(vgpu);
> >  	unsigned int index =3D VFIO_PCI_OFFSET_TO_INDEX(*ppos);
> >  	u64 pos =3D *ppos & VFIO_PCI_OFFSET_MASK;
> >  	int ret =3D -EINVAL;
> > =20
> > =20
> > -	if (index >=3D VFIO_PCI_NUM_REGIONS + vgpu->vdev.num_regions) {
> > +	if (index >=3D VFIO_PCI_NUM_REGIONS + vdev->num_regions) {
> >  		gvt_vgpu_err("invalid index: %u\n", index);
> >  		return -EINVAL;
> >  	}
> > @@ -967,11 +1014,11 @@ static ssize_t intel_vgpu_rw(struct mdev_device =
*mdev, char *buf,
> >  	case VFIO_PCI_ROM_REGION_INDEX:
> >  		break;
> >  	default:
> > -		if (index >=3D VFIO_PCI_NUM_REGIONS + vgpu->vdev.num_regions)
> > +		if (index >=3D VFIO_PCI_NUM_REGIONS + vdev->num_regions)
> >  			return -EINVAL;
> > =20
> >  		index -=3D VFIO_PCI_NUM_REGIONS;
> > -		return vgpu->vdev.region[index].ops->rw(vgpu, buf, count,
> > +		return vdev->region[index].ops->rw(vgpu, buf, count,
> >  				ppos, is_write);
> >  	}
> > =20
> > @@ -1224,7 +1271,7 @@ static int intel_vgpu_set_msi_trigger(struct inte=
l_vgpu *vgpu,
> >  			gvt_vgpu_err("eventfd_ctx_fdget failed\n");
> >  			return PTR_ERR(trigger);
> >  		}
> > -		vgpu->vdev.msi_trigger =3D trigger;
> > +		kvmgt_vdev(vgpu)->msi_trigger =3D trigger;
> >  	} else if ((flags & VFIO_IRQ_SET_DATA_NONE) && !count)
> >  		intel_vgpu_release_msi_eventfd_ctx(vgpu);
> > =20
> > @@ -1276,6 +1323,7 @@ static long intel_vgpu_ioctl(struct mdev_device *=
mdev, unsigned int cmd,
> >  			     unsigned long arg)
> >  {
> >  	struct intel_vgpu *vgpu =3D mdev_get_drvdata(mdev);
> > +	struct kvmgt_vdev *vdev =3D kvmgt_vdev(vgpu);
> >  	unsigned long minsz;
> > =20
> >  	gvt_dbg_core("vgpu%d ioctl, cmd: %d\n", vgpu->id, cmd);
> > @@ -1294,7 +1342,7 @@ static long intel_vgpu_ioctl(struct mdev_device *=
mdev, unsigned int cmd,
> >  		info.flags =3D VFIO_DEVICE_FLAGS_PCI;
> >  		info.flags |=3D VFIO_DEVICE_FLAGS_RESET;
> >  		info.num_regions =3D VFIO_PCI_NUM_REGIONS +
> > -				vgpu->vdev.num_regions;
> > +				vdev->num_regions;
> >  		info.num_irqs =3D VFIO_PCI_NUM_IRQS;
> > =20
> >  		return copy_to_user((void __user *)arg, &info, minsz) ?
> > @@ -1385,22 +1433,22 @@ static long intel_vgpu_ioctl(struct mdev_device=
 *mdev, unsigned int cmd,
> >  					.header.version =3D 1 };
> > =20
> >  				if (info.index >=3D VFIO_PCI_NUM_REGIONS +
> > -						vgpu->vdev.num_regions)
> > +						vdev->num_regions)
> >  					return -EINVAL;
> >  				info.index =3D
> >  					array_index_nospec(info.index,
> >  							VFIO_PCI_NUM_REGIONS +
> > -							vgpu->vdev.num_regions);
> > +							vdev->num_regions);
> > =20
> >  				i =3D info.index - VFIO_PCI_NUM_REGIONS;
> > =20
> >  				info.offset =3D
> >  					VFIO_PCI_INDEX_TO_OFFSET(info.index);
> > -				info.size =3D vgpu->vdev.region[i].size;
> > -				info.flags =3D vgpu->vdev.region[i].flags;
> > +				info.size =3D vdev->region[i].size;
> > +				info.flags =3D vdev->region[i].flags;
> > =20
> > -				cap_type.type =3D vgpu->vdev.region[i].type;
> > -				cap_type.subtype =3D vgpu->vdev.region[i].subtype;
> > +				cap_type.type =3D vdev->region[i].type;
> > +				cap_type.subtype =3D vdev->region[i].subtype;
> > =20
> >  				ret =3D vfio_info_add_capability(&caps,
> >  							&cap_type.header,
> > @@ -1740,13 +1788,15 @@ static int kvmgt_guest_init(struct mdev_device =
*mdev)
> >  {
> >  	struct kvmgt_guest_info *info;
> >  	struct intel_vgpu *vgpu;
> > +	struct kvmgt_vdev *vdev;
> >  	struct kvm *kvm;
> > =20
> >  	vgpu =3D mdev_get_drvdata(mdev);
> >  	if (handle_valid(vgpu->handle))
> >  		return -EEXIST;
> > =20
> > -	kvm =3D vgpu->vdev.kvm;
> > +	vdev =3D kvmgt_vdev(vgpu);
> > +	kvm =3D vdev->kvm;
> >  	if (!kvm || kvm->mm !=3D current->mm) {
> >  		gvt_vgpu_err("KVM is required to use Intel vGPU\n");
> >  		return -ESRCH;
> > @@ -1776,7 +1826,7 @@ static int kvmgt_guest_init(struct mdev_device *m=
dev)
> >  	info->debugfs_cache_entries =3D debugfs_create_ulong(
> >  						"kvmgt_nr_cache_entries",
> >  						0444, vgpu->debugfs,
> > -						&vgpu->vdev.nr_cache_entries);
> > +						&vdev->nr_cache_entries);
> >  	return 0;
> >  }
> > =20
> > @@ -1793,9 +1843,17 @@ static bool kvmgt_guest_exit(struct kvmgt_guest_=
info *info)
> >  	return true;
> >  }
> > =20
> > -static int kvmgt_attach_vgpu(void *vgpu, unsigned long *handle)
> > +static int kvmgt_attach_vgpu(void *p_vgpu, unsigned long *handle)
> >  {
> > -	/* nothing to do here */
> > +	struct intel_vgpu *vgpu =3D (struct intel_vgpu *)p_vgpu;
> > +
> > +	vgpu->vdev =3D kzalloc(sizeof(struct kvmgt_vdev), GFP_KERNEL);
> > +
> > +	if (!vgpu->vdev)
> > +		return -ENOMEM;
> > +
> > +	kvmgt_vdev(vgpu)->vgpu =3D vgpu;
> > +
> >  	return 0;
> >  }
> > =20
> > @@ -1803,29 +1861,34 @@ static void kvmgt_detach_vgpu(void *p_vgpu)
> >  {
> >  	int i;
> >  	struct intel_vgpu *vgpu =3D (struct intel_vgpu *)p_vgpu;
> > +	struct kvmgt_vdev *vdev =3D kvmgt_vdev(vgpu);
> > =20
> > -	if (!vgpu->vdev.region)
> > +	if (!vdev->region)
> >  		return;
> > =20
> > -	for (i =3D 0; i < vgpu->vdev.num_regions; i++)
> > -		if (vgpu->vdev.region[i].ops->release)
> > -			vgpu->vdev.region[i].ops->release(vgpu,
> > -					&vgpu->vdev.region[i]);
> > -	vgpu->vdev.num_regions =3D 0;
> > -	kfree(vgpu->vdev.region);
> > -	vgpu->vdev.region =3D NULL;
> > +	for (i =3D 0; i < vdev->num_regions; i++)
> > +		if (vdev->region[i].ops->release)
> > +			vdev->region[i].ops->release(vgpu,
> > +					&vdev->region[i]);
> > +	vdev->num_regions =3D 0;
> > +	kfree(vdev->region);
> > +	vdev->region =3D NULL;
> > +
> > +	kfree(vdev);
> >  }
> > =20
> >  static int kvmgt_inject_msi(unsigned long handle, u32 addr, u16 data)
> >  {
> >  	struct kvmgt_guest_info *info;
> >  	struct intel_vgpu *vgpu;
> > +	struct kvmgt_vdev *vdev;
> > =20
> >  	if (!handle_valid(handle))
> >  		return -ESRCH;
> > =20
> >  	info =3D (struct kvmgt_guest_info *)handle;
> >  	vgpu =3D info->vgpu;
> > +	vdev =3D kvmgt_vdev(vgpu);
> > =20
> >  	/*
> >  	 * When guest is poweroff, msi_trigger is set to NULL, but vgpu's
> > @@ -1836,10 +1899,10 @@ static int kvmgt_inject_msi(unsigned long handl=
e, u32 addr, u16 data)
> >  	 * enabled by guest. so if msi_trigger is null, success is still
> >  	 * returned and don't inject interrupt into guest.
> >  	 */
> > -	if (vgpu->vdev.msi_trigger =3D=3D NULL)
> > +	if (vdev->msi_trigger =3D=3D NULL)
> >  		return 0;
> > =20
> > -	if (eventfd_signal(vgpu->vdev.msi_trigger, 1) =3D=3D 1)
> > +	if (eventfd_signal(vdev->msi_trigger, 1) =3D=3D 1)
> >  		return 0;
> > =20
> >  	return -EFAULT;
> > @@ -1865,26 +1928,26 @@ static unsigned long kvmgt_gfn_to_pfn(unsigned =
long handle, unsigned long gfn)
> >  static int kvmgt_dma_map_guest_page(unsigned long handle, unsigned lon=
g gfn,
> >  		unsigned long size, dma_addr_t *dma_addr)
> >  {
> > -	struct kvmgt_guest_info *info;
> >  	struct intel_vgpu *vgpu;
> > +	struct kvmgt_vdev *vdev;
> >  	struct gvt_dma *entry;
> >  	int ret;
> > =20
> >  	if (!handle_valid(handle))
> >  		return -EINVAL;
> > =20
> > -	info =3D (struct kvmgt_guest_info *)handle;
> > -	vgpu =3D info->vgpu;
> > +	vgpu =3D ((struct kvmgt_guest_info *)handle)->vgpu;
> > +	vdev =3D kvmgt_vdev(vgpu);
> > =20
> > -	mutex_lock(&info->vgpu->vdev.cache_lock);
> > +	mutex_lock(&vdev->cache_lock);
> > =20
> > -	entry =3D __gvt_cache_find_gfn(info->vgpu, gfn);
> > +	entry =3D __gvt_cache_find_gfn(vgpu, gfn);
> >  	if (!entry) {
> >  		ret =3D gvt_dma_map_page(vgpu, gfn, dma_addr, size);
> >  		if (ret)
> >  			goto err_unlock;
> > =20
> > -		ret =3D __gvt_cache_add(info->vgpu, gfn, *dma_addr, size);
> > +		ret =3D __gvt_cache_add(vgpu, gfn, *dma_addr, size);
> >  		if (ret)
> >  			goto err_unmap;
> >  	} else if (entry->size !=3D size) {
> > @@ -1896,7 +1959,7 @@ static int kvmgt_dma_map_guest_page(unsigned long=
 handle, unsigned long gfn,
> >  		if (ret)
> >  			goto err_unlock;
> > =20
> > -		ret =3D __gvt_cache_add(info->vgpu, gfn, *dma_addr, size);
> > +		ret =3D __gvt_cache_add(vgpu, gfn, *dma_addr, size);
> >  		if (ret)
> >  			goto err_unmap;
> >  	} else {
> > @@ -1904,19 +1967,20 @@ static int kvmgt_dma_map_guest_page(unsigned lo=
ng handle, unsigned long gfn,
> >  		*dma_addr =3D entry->dma_addr;
> >  	}
> > =20
> > -	mutex_unlock(&info->vgpu->vdev.cache_lock);
> > +	mutex_unlock(&vdev->cache_lock);
> >  	return 0;
> > =20
> >  err_unmap:
> >  	gvt_dma_unmap_page(vgpu, gfn, *dma_addr, size);
> >  err_unlock:
> > -	mutex_unlock(&info->vgpu->vdev.cache_lock);
> > +	mutex_unlock(&vdev->cache_lock);
> >  	return ret;
> >  }
> > =20
> >  static int kvmgt_dma_pin_guest_page(unsigned long handle, dma_addr_t d=
ma_addr)
> >  {
> >  	struct kvmgt_guest_info *info;
> > +	struct kvmgt_vdev *vdev;
> >  	struct gvt_dma *entry;
> >  	int ret =3D 0;
> > =20
> > @@ -1924,14 +1988,15 @@ static int kvmgt_dma_pin_guest_page(unsigned lo=
ng handle, dma_addr_t dma_addr)
> >  		return -ENODEV;
> > =20
> >  	info =3D (struct kvmgt_guest_info *)handle;
> > +	vdev =3D kvmgt_vdev(info->vgpu);
> > =20
> > -	mutex_lock(&info->vgpu->vdev.cache_lock);
> > +	mutex_lock(&vdev->cache_lock);
> >  	entry =3D __gvt_cache_find_dma_addr(info->vgpu, dma_addr);
> >  	if (entry)
> >  		kref_get(&entry->ref);
> >  	else
> >  		ret =3D -ENOMEM;
> > -	mutex_unlock(&info->vgpu->vdev.cache_lock);
> > +	mutex_unlock(&vdev->cache_lock);
> > =20
> >  	return ret;
> >  }
> > @@ -1947,19 +2012,21 @@ static void __gvt_dma_release(struct kref *ref)
> > =20
> >  static void kvmgt_dma_unmap_guest_page(unsigned long handle, dma_addr_=
t dma_addr)
> >  {
> > -	struct kvmgt_guest_info *info;
> > +	struct intel_vgpu *vgpu;
> > +	struct kvmgt_vdev *vdev;
> >  	struct gvt_dma *entry;
> > =20
> >  	if (!handle_valid(handle))
> >  		return;
> > =20
> > -	info =3D (struct kvmgt_guest_info *)handle;
> > +	vgpu =3D ((struct kvmgt_guest_info *)handle)->vgpu;
> > +	vdev =3D kvmgt_vdev(vgpu);
> > =20
> > -	mutex_lock(&info->vgpu->vdev.cache_lock);
> > -	entry =3D __gvt_cache_find_dma_addr(info->vgpu, dma_addr);
> > +	mutex_lock(&vdev->cache_lock);
> > +	entry =3D __gvt_cache_find_dma_addr(vgpu, dma_addr);
> >  	if (entry)
> >  		kref_put(&entry->ref, __gvt_dma_release);
> > -	mutex_unlock(&info->vgpu->vdev.cache_lock);
> > +	mutex_unlock(&vdev->cache_lock);
> >  }
> > =20
> >  static int kvmgt_rw_gpa(unsigned long handle, unsigned long gpa,
> > --=20
> > 2.24.1
> >=20
> > _______________________________________________
> > intel-gvt-dev mailing list
> > intel-gvt-dev@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
>=20
> --=20
> Open Source Technology Center, Intel ltd.
>=20
> $gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827



> _______________________________________________
> intel-gvt-dev mailing list
> intel-gvt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev


--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--f+W+jCU1fRNres8c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXiVJrgAKCRCxBBozTXgY
J3z+AJ0aI5tlZ2YRMEEeN0BXMcr8DCF/dQCfZ5hZezfdT6EEAw2HDF2f33ty5Gc=
=E8zu
-----END PGP SIGNATURE-----

--f+W+jCU1fRNres8c--

--===============1858825642==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1858825642==--
