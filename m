Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B566A2068C
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2025 09:52:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E927C10E20D;
	Tue, 28 Jan 2025 08:52:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l4og8gwm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A171910E20D;
 Tue, 28 Jan 2025 08:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738054326; x=1769590326;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=arBYayUBa7gh3GjVgWUJEeFHyqwuLt462GaAYBUJ17A=;
 b=l4og8gwmAe3EYYUkzaATZRxK+xnEmkjVpm6amWYnksjyJW4OiQDmR/Za
 Jf8dyjDGvSh+D5RILsm5LqV07EuMK7O06UhZSbm/RNpH8rzHvbhFBxXYI
 U47d2cnjQFkn4sUHrq93BeMxzmJyIt7zUXaLxptyNfW5tkZtRpE6UHL8y
 tK9ynbP5eAbjjLKeElVxpBP23vud5xQ/VshlA1h6Ee0pmidiifzer3wtw
 Hrb9Xk8kfuHUVNgg9/brzMMbAVfyFROnjO6sGGNVZTz2mBsswZo2N5BZc
 A2YYZXoOW8Uc30mYm/NxyPlnpY2BU4zPoRi2VEO6rC8RrygmpsGL/NN9v A==;
X-CSE-ConnectionGUID: v+uafKWhRTK+q6NRCluQTg==
X-CSE-MsgGUID: NEjlURU1Q1ClEA79YwqtTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11328"; a="37732175"
X-IronPort-AV: E=Sophos;i="6.13,240,1732608000"; d="scan'208";a="37732175"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2025 00:52:06 -0800
X-CSE-ConnectionGUID: uiA469o4TnK3CjMIkAHeng==
X-CSE-MsgGUID: x/aKlPa3TA6n/e4E80RdBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="112680230"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO [10.245.246.120])
 ([10.245.246.120])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2025 00:52:02 -0800
Message-ID: <7282ac68c47886caa2bc2a2813d41a04adf938e1.camel@linux.intel.com>
Subject: Re: [RFC 1/5] mm/hmm: HMM API to enable P2P DMA for device private
 pages
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Yonatan Maman <ymaman@nvidia.com>, kherbst@redhat.com, lyude@redhat.com,
 dakr@redhat.com, airlied@gmail.com, simona@ffwll.ch, jgg@ziepe.ca,
 leon@kernel.org, 	jglisse@redhat.com, akpm@linux-foundation.org,
 GalShalom@Nvidia.com, 	dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, 	linux-kernel@vger.kernel.org,
 linux-rdma@vger.kernel.org, linux-mm@kvack.org, 	linux-tegra@vger.kernel.org
Date: Tue, 28 Jan 2025 09:51:52 +0100
In-Reply-To: <20241201103659.420677-2-ymaman@nvidia.com>
References: <20241201103659.420677-1-ymaman@nvidia.com>
 <20241201103659.420677-2-ymaman@nvidia.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Jonatan


On Sun, 2024-12-01 at 12:36 +0200, Yonatan Maman wrote:
> From: Yonatan Maman <Ymaman@Nvidia.com>
>=20
> hmm_range_fault() by default triggered a page fault on device private
> when HMM_PFN_REQ_FAULT flag was set. pages, migrating them to RAM. In
> some
> cases, such as with RDMA devices, the migration overhead between the
> device (e.g., GPU) and the CPU, and vice-versa, significantly
> degrades
> performance. Thus, enabling Peer-to-Peer (P2P) DMA access for device
> private page might be crucial for minimizing data transfer overhead.
>=20
> Introduced an API to support P2P DMA for device private
> pages,includes:
> =C2=A0- Leveraging the struct pagemap_ops for P2P Page Callbacks. This
> callback
> =C2=A0=C2=A0 involves mapping the page for P2P DMA and returning the
> corresponding
> =C2=A0=C2=A0 PCI_P2P page.
>=20
> =C2=A0- Utilizing hmm_range_fault for initializing P2P DMA. The API
> =C2=A0=C2=A0 also adds the HMM_PFN_REQ_TRY_P2P flag option for the
> =C2=A0=C2=A0 hmm_range_fault caller to initialize P2P. If set, hmm_range_=
fault
> =C2=A0=C2=A0 attempts initializing the P2P connection first, if the owner
> device
> =C2=A0=C2=A0 supports P2P, using p2p_page. In case of failure or lack of
> support,
> =C2=A0=C2=A0 hmm_range_fault will continue with the regular flow of migra=
ting
> the
> =C2=A0=C2=A0 page to RAM.
>=20
> This change does not affect previous use-cases of hmm_range_fault,
> because both the caller and the page owner must explicitly request
> and
> support it to initialize P2P connection.
>=20
> Signed-off-by: Yonatan Maman <Ymaman@Nvidia.com>
> Signed-off-by: Gal Shalom <GalShalom@Nvidia.com>
> ---
> =C2=A0include/linux/hmm.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 3 ++-
> =C2=A0include/linux/memremap.h |=C2=A0 8 ++++++
> =C2=A0mm/hmm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 57 ++++++++++++++++++++++++++++++=
+++-----
> --
> =C2=A03 files changed, 57 insertions(+), 11 deletions(-)

It appears we're working on a very similar thing, (In fact the original
proposals were sent out the same day. I have a couple of questions).


>=20
> diff --git a/include/linux/hmm.h b/include/linux/hmm.h
> index 62980ca8f3c5..017f22cef893 100644
> --- a/include/linux/hmm.h
> +++ b/include/linux/hmm.h
> @@ -26,6 +26,7 @@ struct mmu_interval_notifier;
> =C2=A0 * HMM_PFN_DMA_MAPPED - Flag preserved on input-to-output
> transformation
> =C2=A0 *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 to mark tha=
t page is already DMA mapped
> + * HMM_PFN_ALLOW_P2P - Allow returning PCI P2PDMA page
> =C2=A0 *
> =C2=A0 * On input:
> =C2=A0 * 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Return the current state of the page, d=
o not
> fault it.
> @@ -41,7 +42,7 @@ enum hmm_pfn_flags {
> =C2=A0	HMM_PFN_ERROR =3D 1UL << (BITS_PER_LONG - 3),
> =C2=A0
> =C2=A0	/* Sticky flag, carried from Input to Output */
> +	HMM_PFN_ALLOW_P2P =3D 1UL << (BITS_PER_LONG - 6),
> =C2=A0	HMM_PFN_DMA_MAPPED =3D 1UL << (BITS_PER_LONG - 7),
> =C2=A0
> =C2=A0	HMM_PFN_ORDER_SHIFT =3D (BITS_PER_LONG - 8),
> diff --git a/include/linux/memremap.h b/include/linux/memremap.h
> index 3f7143ade32c..cdf5189be5e9 100644
> --- a/include/linux/memremap.h
> +++ b/include/linux/memremap.h
> @@ -89,6 +89,14 @@ struct dev_pagemap_ops {
> =C2=A0	 */
> =C2=A0	vm_fault_t (*migrate_to_ram)(struct vm_fault *vmf);
> =C2=A0
> +	/*
> +	 * Used for private (un-addressable) device memory only.
> Return a
> +	 * corresponding PFN for a page that can be mapped to device
> +	 * (e.g using dma_map_page)
> +	 */
> +	int (*get_dma_pfn_for_device)(struct page *private_page,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long *dma_pfn);
> +
> =C2=A0	/*
> =C2=A0	 * Handle the memory failure happens on a range of pfns.=C2=A0
> Notify the
> =C2=A0	 * processes who are using these pfns, and try to recover
> the data on
> diff --git a/mm/hmm.c b/mm/hmm.c
> index a852d8337c73..1c080bc00ee8 100644
> --- a/mm/hmm.c
> +++ b/mm/hmm.c
> @@ -226,6 +226,51 @@ static inline unsigned long
> pte_to_hmm_pfn_flags(struct hmm_range *range,
> =C2=A0	return pte_write(pte) ? (HMM_PFN_VALID | HMM_PFN_WRITE) :
> HMM_PFN_VALID;
> =C2=A0}
> =C2=A0
> +static bool hmm_handle_device_private(struct hmm_range *range,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long pfn_req_flags,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 swp_entry_t entry,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long *hmm_pfn)
> +{
> +	struct page *page =3D pfn_swap_entry_to_page(entry);
> +	struct dev_pagemap *pgmap =3D page->pgmap;
> +	int ret;
>=20
> +	pfn_req_flags &=3D range->pfn_flags_mask;
> +	pfn_req_flags |=3D range->default_flags;
> +
> +	/*
> +	 * Don't fault in device private pages owned by the caller,
> +	 * just report the PFN.
> +	 */
> +	if (pgmap->owner =3D=3D range->dev_private_owner) {
> +		*hmm_pfn =3D swp_offset_pfn(entry);
> +		goto found;
> +	}
> +
> +	/*
> +	 * P2P for supported pages, and according to caller request
> +	 * translate the private page to the match P2P page if it
> fails
> +	 * continue with the regular flow
> +	 */
> +	if (pfn_req_flags & HMM_PFN_ALLOW_P2P &&
> +	=C2=A0=C2=A0=C2=A0 pgmap->ops->get_dma_pfn_for_device) {
> +		ret =3D pgmap->ops->get_dma_pfn_for_device(page,
> hmm_pfn);

How would the pgmap device know whether P2P is actually possible
without knowing the client device, (like calling pci_p2pdma_distance)
and also if looking into access control, whether it is allowed?

I wonder whether you could consider using something that is a little
more generic that would fit also our use-case. Here the caller provides
a callback as to whether devmem access is allowed, but leaves any dma-
mapping or pfn mangling to be done after the call to hmm_range_fault(),
since hmm_range_fault() really only needs to know whether it has to
migrate to system or not. One benefit of using this alternative
approach is that struct hmm_range can be subclassed by the caller and
for example cache device pairs for which p2p is allowed.

Current version (after the feedback from Jason looks like this). It
looks like your use-case could easily be made to fit this one, but, as
I understand it, not vice versa: (Could send this as a separate patch
if needed).

Thanks,
Thomas


diff --git a/include/linux/hmm.h b/include/linux/hmm.h
index 126a36571667..8ac1f4125e30 100644
--- a/include/linux/hmm.h
+++ b/include/linux/hmm.h
@@ -76,6 +76,21 @@ static inline unsigned int
hmm_pfn_to_map_order(unsigned long hmm_pfn)
 	return (hmm_pfn >> HMM_PFN_ORDER_SHIFT) & 0x1F;
 }
=20
+struct hmm_range;
+
+/**
+ * struct hmm_range_ops - Functions for detailed cross-device access.
+ */
+struct hmm_range_ops {
+	/**
+	 * @devmem_allow: Whether to allow cross-device access to
device_private pages.
+	 * @hrange: Pointer to a struct hmm_range. Typically
subclassed by the caller
+	 * to provide needed information.
+	 * @page: The page being queried.
+	 */
+	bool (*devmem_allow)(struct hmm_range *hrange, struct page
*page);
+};
+
 /*
  * struct hmm_range - track invalidation lock on virtual address range
  *
@@ -87,6 +102,7 @@ static inline unsigned int
hmm_pfn_to_map_order(unsigned long hmm_pfn)
  * @default_flags: default flags for the range (write, read, ... see
hmm doc)
  * @pfn_flags_mask: allows to mask pfn flags so that only
default_flags matter
  * @dev_private_owner: owner of device private pages
+ * @ops: Pointer to a struct hmm_range_ops or NULL if no ops provided.
  */
 struct hmm_range {
 	struct mmu_interval_notifier *notifier;
@@ -97,6 +113,7 @@ struct hmm_range {
 	unsigned long		default_flags;
 	unsigned long		pfn_flags_mask;
 	void			*dev_private_owner;
+	const struct hmm_range_ops *ops;
 };
=20
 /*
diff --git a/mm/hmm.c b/mm/hmm.c
index 7e0229ae4a5a..ea4e08caa14a 100644
--- a/mm/hmm.c
+++ b/mm/hmm.c
@@ -220,6 +220,15 @@ static inline unsigned long
pte_to_hmm_pfn_flags(struct hmm_range *range,
 	return pte_write(pte) ? (HMM_PFN_VALID | HMM_PFN_WRITE) :
HMM_PFN_VALID;
 }
=20
+static bool hmm_devmem_allow(struct hmm_range *range, struct page
*page)
+{
+	if (likely(page->pgmap->owner =3D=3D range->dev_private_owner))
+		return true;
+	if (likely(!range->ops))
+		return false;
+	return range->ops->devmem_allow(range, page);
+}
+
 static int hmm_vma_handle_pte(struct mm_walk *walk, unsigned long
addr,
 			      unsigned long end, pmd_t *pmdp, pte_t
*ptep,
 			      unsigned long *hmm_pfn)
@@ -245,11 +254,10 @@ static int hmm_vma_handle_pte(struct mm_walk
*walk, unsigned long addr,
=20
 		/*
 		 * Don't fault in device private pages owned by the
caller,
-		 * just report the PFN.
+		 * or that are accessible to the caller. Just report
the PFN.
 		 */
 		if (is_device_private_entry(entry) &&
-		    pfn_swap_entry_to_page(entry)->pgmap->owner =3D=3D
-		    range->dev_private_owner) {
+		    hmm_devmem_allow(range,
pfn_swap_entry_to_page(entry))) {
 			cpu_flags =3D HMM_PFN_VALID;
 			if (is_writable_device_private_entry(entry))
 				cpu_flags |=3D HMM_PFN_WRITE;
--=20
2.48.1


