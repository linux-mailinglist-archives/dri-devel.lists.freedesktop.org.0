Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0260970EE
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2019 06:16:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0E2F6E8F1;
	Wed, 21 Aug 2019 04:16:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80DB36E8F1;
 Wed, 21 Aug 2019 04:16:46 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 46CvVx2lDPz9s3Z;
 Wed, 21 Aug 2019 14:16:41 +1000 (AEST)
Date: Wed, 21 Aug 2019 14:16:40 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Joerg Roedel <joro@8bytes.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>
Subject: linux-next: manual merge of the iommu tree with the drm-misc tree
Message-ID: <20190821141640.7967ddcc@canb.auug.org.au>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=canb.auug.org.au; s=201702; t=1566361003;
 bh=YnvDxWQMkwXci5nApLHjLHJ7S09LLcbKy26yMzcEK9s=;
 h=Date:From:To:Cc:Subject:From;
 b=Ifox4zovovh5uHxJhM5NmVCkWR388kOxuK6YxVCcqUvnL3JjsT1eI5lnIPNSiI7t2
 TsERwtaFDJiUy1LqrN0Z980QMNYpuihVg3XKk0oYWsHRpFz0xabvXk5AlEtwfv8G/d
 rDXFUvTncE0BM6PmS2slEKhA1jzIbx6tdvuP0GpT3chsg3m2b3mw4qt8xuNVCabIKA
 zjULZFKkzZMhphQdJSCbkbdKJ4m9CEjzauqYzm31ghjJ0hRf/kzpvlKS9vIX0eKv7X
 4/lZJLcx4l6uCb62NcPGegk3aqkjug6L+HVjqaMFS9aT8fGmam/o7AKuLBGpE4CUiB
 OiQblBcUnAQtg==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 Will Deacon <will@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: multipart/mixed; boundary="===============1155879091=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1155879091==
Content-Type: multipart/signed; boundary="Sig_/n04PXGM89qVzXJ9V2Le85iP";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/n04PXGM89qVzXJ9V2Le85iP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the iommu tree got a conflict in:

  drivers/gpu/drm/panfrost/panfrost_mmu.c

between commit:

  187d2929206e ("drm/panfrost: Add support for GPU heap allocations")

from the drm-misc tree and commit:

  a2d3a382d6c6 ("iommu/io-pgtable: Pass struct iommu_iotlb_gather to ->unma=
p()")

from the iommu tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/panfrost/panfrost_mmu.c
index 842bdd7cf6be,6e8145c36e93..000000000000
--- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
@@@ -310,18 -222,18 +310,18 @@@ void panfrost_mmu_unmap(struct panfrost
  		size_t unmapped_page;
  		size_t pgsize =3D get_pgsize(iova, len - unmapped_len);
 =20
 -		unmapped_page =3D ops->unmap(ops, iova, pgsize, NULL);
 -		if (!unmapped_page)
 -			break;
 -
 -		iova +=3D unmapped_page;
 -		unmapped_len +=3D unmapped_page;
 +		if (ops->iova_to_phys(ops, iova)) {
- 			unmapped_page =3D ops->unmap(ops, iova, pgsize);
++			unmapped_page =3D ops->unmap(ops, iova, pgsize, NULL);
 +			WARN_ON(unmapped_page !=3D pgsize);
 +		}
 +		iova +=3D pgsize;
 +		unmapped_len +=3D pgsize;
  	}
 =20
 -	mmu_hw_do_operation(pfdev, 0, bo->node.start << PAGE_SHIFT,
 +	mmu_hw_do_operation(pfdev, bo->mmu, bo->node.start << PAGE_SHIFT,
  			    bo->node.size << PAGE_SHIFT, AS_COMMAND_FLUSH_PT);
 =20
 -	mutex_unlock(&pfdev->mmu->lock);
 +	mutex_unlock(&bo->mmu->lock);
 =20
  	pm_runtime_mark_last_busy(pfdev->dev);
  	pm_runtime_put_autosuspend(pfdev->dev);
@@@ -330,184 -242,35 +330,192 @@@
 =20
  static void mmu_tlb_inv_context_s1(void *cookie)
  {
 -	struct panfrost_device *pfdev =3D cookie;
 +	struct panfrost_file_priv *priv =3D cookie;
 =20
 -	mmu_hw_do_operation(pfdev, 0, 0, ~0UL, AS_COMMAND_FLUSH_MEM);
 +	mmu_hw_do_operation(priv->pfdev, &priv->mmu, 0, ~0UL, AS_COMMAND_FLUSH_M=
EM);
  }
 =20
- static void mmu_tlb_inv_range_nosync(unsigned long iova, size_t size,
- 				     size_t granule, bool leaf, void *cookie)
- {}
-=20
  static void mmu_tlb_sync_context(void *cookie)
  {
  	//struct panfrost_device *pfdev =3D cookie;
  	// TODO: Wait 1000 GPU cycles for HW_ISSUE_6367/T60X
  }
 =20
- static const struct iommu_gather_ops mmu_tlb_ops =3D {
+ static void mmu_tlb_flush_walk(unsigned long iova, size_t size, size_t gr=
anule,
+ 			       void *cookie)
+ {
+ 	mmu_tlb_sync_context(cookie);
+ }
+=20
+ static void mmu_tlb_flush_leaf(unsigned long iova, size_t size, size_t gr=
anule,
+ 			       void *cookie)
+ {
+ 	mmu_tlb_sync_context(cookie);
+ }
+=20
+ static const struct iommu_flush_ops mmu_tlb_ops =3D {
  	.tlb_flush_all	=3D mmu_tlb_inv_context_s1,
- 	.tlb_add_flush	=3D mmu_tlb_inv_range_nosync,
- 	.tlb_sync	=3D mmu_tlb_sync_context,
+ 	.tlb_flush_walk =3D mmu_tlb_flush_walk,
+ 	.tlb_flush_leaf =3D mmu_tlb_flush_leaf,
  };
 =20
 +int panfrost_mmu_pgtable_alloc(struct panfrost_file_priv *priv)
 +{
 +	struct panfrost_mmu *mmu =3D &priv->mmu;
 +	struct panfrost_device *pfdev =3D priv->pfdev;
 +
 +	mutex_init(&mmu->lock);
 +	INIT_LIST_HEAD(&mmu->list);
 +	mmu->as =3D -1;
 +
 +	mmu->pgtbl_cfg =3D (struct io_pgtable_cfg) {
 +		.pgsize_bitmap	=3D SZ_4K | SZ_2M,
 +		.ias		=3D FIELD_GET(0xff, pfdev->features.mmu_features),
 +		.oas		=3D FIELD_GET(0xff00, pfdev->features.mmu_features),
 +		.tlb		=3D &mmu_tlb_ops,
 +		.iommu_dev	=3D pfdev->dev,
 +	};
 +
 +	mmu->pgtbl_ops =3D alloc_io_pgtable_ops(ARM_MALI_LPAE, &mmu->pgtbl_cfg,
 +					      priv);
 +	if (!mmu->pgtbl_ops)
 +		return -EINVAL;
 +
 +	return 0;
 +}
 +
 +void panfrost_mmu_pgtable_free(struct panfrost_file_priv *priv)
 +{
 +	struct panfrost_device *pfdev =3D priv->pfdev;
 +	struct panfrost_mmu *mmu =3D &priv->mmu;
 +
 +	spin_lock(&pfdev->as_lock);
 +	if (mmu->as >=3D 0) {
 +		clear_bit(mmu->as, &pfdev->as_alloc_mask);
 +		clear_bit(mmu->as, &pfdev->as_in_use_mask);
 +		list_del(&mmu->list);
 +	}
 +	spin_unlock(&pfdev->as_lock);
 +
 +	free_io_pgtable_ops(mmu->pgtbl_ops);
 +}
 +
 +static struct drm_mm_node *addr_to_drm_mm_node(struct panfrost_device *pf=
dev, int as, u64 addr)
 +{
 +	struct drm_mm_node *node =3D NULL;
 +	u64 offset =3D addr >> PAGE_SHIFT;
 +	struct panfrost_mmu *mmu;
 +
 +	spin_lock(&pfdev->as_lock);
 +	list_for_each_entry(mmu, &pfdev->as_lru_list, list) {
 +		struct panfrost_file_priv *priv;
 +		if (as !=3D mmu->as)
 +			continue;
 +
 +		priv =3D container_of(mmu, struct panfrost_file_priv, mmu);
 +		drm_mm_for_each_node(node, &priv->mm) {
 +			if (offset >=3D node->start && offset < (node->start + node->size))
 +				goto out;
 +		}
 +	}
 +
 +out:
 +	spin_unlock(&pfdev->as_lock);
 +	return node;
 +}
 +
 +#define NUM_FAULT_PAGES (SZ_2M / PAGE_SIZE)
 +
 +int panfrost_mmu_map_fault_addr(struct panfrost_device *pfdev, int as, u6=
4 addr)
 +{
 +	int ret, i;
 +	struct drm_mm_node *node;
 +	struct panfrost_gem_object *bo;
 +	struct address_space *mapping;
 +	pgoff_t page_offset;
 +	struct sg_table *sgt;
 +	struct page **pages;
 +
 +	node =3D addr_to_drm_mm_node(pfdev, as, addr);
 +	if (!node)
 +		return -ENOENT;
 +
 +	bo =3D drm_mm_node_to_panfrost_bo(node);
 +	if (!bo->is_heap) {
 +		dev_WARN(pfdev->dev, "matching BO is not heap type (GPU VA =3D %llx)",
 +			 node->start << PAGE_SHIFT);
 +		return -EINVAL;
 +	}
 +	WARN_ON(bo->mmu->as !=3D as);
 +
 +	/* Assume 2MB alignment and size multiple */
 +	addr &=3D ~((u64)SZ_2M - 1);
 +	page_offset =3D addr >> PAGE_SHIFT;
 +	page_offset -=3D node->start;
 +
 +	mutex_lock(&bo->base.pages_lock);
 +
 +	if (!bo->base.pages) {
 +		bo->sgts =3D kvmalloc_array(bo->base.base.size / SZ_2M,
 +				     sizeof(struct sg_table), GFP_KERNEL | __GFP_ZERO);
 +		if (!bo->sgts) {
 +			mutex_unlock(&bo->base.pages_lock);
 +			return -ENOMEM;
 +		}
 +
 +		pages =3D kvmalloc_array(bo->base.base.size >> PAGE_SHIFT,
 +				       sizeof(struct page *), GFP_KERNEL | __GFP_ZERO);
 +		if (!pages) {
 +			kfree(bo->sgts);
 +			bo->sgts =3D NULL;
 +			mutex_unlock(&bo->base.pages_lock);
 +			return -ENOMEM;
 +		}
 +		bo->base.pages =3D pages;
 +		bo->base.pages_use_count =3D 1;
 +	} else
 +		pages =3D bo->base.pages;
 +
 +	mapping =3D bo->base.base.filp->f_mapping;
 +	mapping_set_unevictable(mapping);
 +
 +	for (i =3D page_offset; i < page_offset + NUM_FAULT_PAGES; i++) {
 +		pages[i] =3D shmem_read_mapping_page(mapping, i);
 +		if (IS_ERR(pages[i])) {
 +			mutex_unlock(&bo->base.pages_lock);
 +			ret =3D PTR_ERR(pages[i]);
 +			goto err_pages;
 +		}
 +	}
 +
 +	mutex_unlock(&bo->base.pages_lock);
 +
 +	sgt =3D &bo->sgts[page_offset / (SZ_2M / PAGE_SIZE)];
 +	ret =3D sg_alloc_table_from_pages(sgt, pages + page_offset,
 +					NUM_FAULT_PAGES, 0, SZ_2M, GFP_KERNEL);
 +	if (ret)
 +		goto err_pages;
 +
 +	if (!dma_map_sg(pfdev->dev, sgt->sgl, sgt->nents, DMA_BIDIRECTIONAL)) {
 +		ret =3D -EINVAL;
 +		goto err_map;
 +	}
 +
 +	mmu_map_sg(pfdev, bo->mmu, addr, IOMMU_WRITE | IOMMU_READ | IOMMU_NOEXEC=
, sgt);
 +
 +	bo->is_mapped =3D true;
 +
 +	dev_dbg(pfdev->dev, "mapped page fault @ AS%d %llx", as, addr);
 +
 +	return 0;
 +
 +err_map:
 +	sg_free_table(sgt);
 +err_pages:
 +	drm_gem_shmem_put_pages(&bo->base);
 +	return ret;
 +}
 +
  static const char *access_type_name(struct panfrost_device *pfdev,
  		u32 fault_status)
  {

--Sig_/n04PXGM89qVzXJ9V2Le85iP
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1cxagACgkQAVBC80lX
0GwzYAf9GAsEjo5vhQgiQ5uGI/MqmbRSqmr0KmHxGvZlQLSjgPq3c2F9IH8yZOtb
azBGbf9FKUdiZphmkAtU56t11kezwbWUIOvdYDrOy2Q8zQOMSGorZNvEEk/cwTlv
hMJDECSchTPU3Do1HDVqusNggj3aYtkEsZsHmZb3k1skSHucYKkSYsf036ZUQKVa
sCRpkCyfRnTcouVgdDGHSaKldh8qtBrnLinhaW9lWX+W6Ezuc+fWhLujK4ym4tXA
vKyyiQREDiW4T1dvILErGTmT7e6jWcdx46+JSS02twLTk87ak5OtNi0AvpcmVjJR
6+N0zY9xTJUxJRMKGmfY6UH14M7nUQ==
=Hc8m
-----END PGP SIGNATURE-----

--Sig_/n04PXGM89qVzXJ9V2Le85iP--

--===============1155879091==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1155879091==--
