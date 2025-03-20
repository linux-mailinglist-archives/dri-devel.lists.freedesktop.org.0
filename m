Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F13BA6AEDF
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 20:53:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EB4810E120;
	Thu, 20 Mar 2025 19:53:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EbCRYpwY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C9C310E688;
 Thu, 20 Mar 2025 19:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742500380; x=1774036380;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=oDkhp53IxwsfQwiCg/K7wjXaBEtqW81K12jhA/uDHqw=;
 b=EbCRYpwYCDrLfN3u5j5or5Cfxrfy4bUpAm4YuhF4FEPuspm64IllIYku
 ZZ3HR750J0Jstmyy4WXcxxi4geDx+3VU/Fq+qI71BIQza6m0dBUxpLMcA
 Lh4BOiTFF1z90T3V8eCp2fMIERy7mqdCkma9q9B0Rt1Q++JjALMU3tenT
 JnLqjIVqgZcksg0jmzkjl/b8vxyM80js4O8kLC15wzP9DRMu6SxjbHwer
 i134mvbUs+/xbf52SxNsyNR5suGBKdvyTpHRAOKVjpaRHB/0nIqXcilTq
 VPyhEhyKbkALJNBv3OblvftmfRbq1RwKdbLaQssgmCMYd+3lUcWYSHbdW A==;
X-CSE-ConnectionGUID: 1Ityt6ekTQaJIFPCzjB9Jw==
X-CSE-MsgGUID: I0KpKyLJTsezf5tdRvwMrw==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="42919509"
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; d="scan'208";a="42919509"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 12:53:00 -0700
X-CSE-ConnectionGUID: 5SXZHQWIRCKUgHUy3/MtXg==
X-CSE-MsgGUID: u9NqfQRrSMKbVVMvdkDc+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; d="scan'208";a="128303807"
Received: from vpanait-mobl.ger.corp.intel.com (HELO [10.245.246.115])
 ([10.245.246.115])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 12:52:58 -0700
Message-ID: <d4803e357b7c7c2e17969c3df80dec70d25f947c.camel@linux.intel.com>
Subject: Re: [PATCH 1/7] drm/gpusvm: fix hmm_pfn_to_map_order() usage
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Matthew Brost <matthew.brost@intel.com>
Date: Thu, 20 Mar 2025 20:52:56 +0100
In-Reply-To: <20250320172956.168358-10-matthew.auld@intel.com>
References: <20250320172956.168358-9-matthew.auld@intel.com>
 <20250320172956.168358-10-matthew.auld@intel.com>
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

On Thu, 2025-03-20 at 17:29 +0000, Matthew Auld wrote:
> Handle the case where the hmm range partially covers a huge page
> (like
> 2M), otherwise we can potentially end up doing something nasty like
> mapping memory which potentially is outside the range, and maybe not
> even mapped by the mm. Fix is based on the xe userptr code, which in
> a
> future patch will directly use gpusvm, so needs alignment here.
>=20
> Reported-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
> =C2=A0drivers/gpu/drm/drm_gpusvm.c | 25 +++++++++++++++++++++++--
> =C2=A01 file changed, 23 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_gpusvm.c
> b/drivers/gpu/drm/drm_gpusvm.c
> index 2451c816edd5..48993cef4a74 100644
> --- a/drivers/gpu/drm/drm_gpusvm.c
> +++ b/drivers/gpu/drm/drm_gpusvm.c
> @@ -817,6 +817,27 @@ drm_gpusvm_range_alloc(struct drm_gpusvm
> *gpusvm,
> =C2=A0	return range;
> =C2=A0}
> =C2=A0
> +/*
> + * To allow skipping PFNs with the same flags (like when they belong
> to
> + * the same huge PTE) when looping over the pfn array, take a given
> a hmm_pfn,
> + * and return the largest order that will fit inside the PTE, but
> also crucially
> + * accounting for the original hmm range boundaries.
> + */
> +static unsigned int drm_gpusvm_hmm_pfn_to_order(unsigned long
> hmm_pfn,
> +						unsigned long
> hmm_pfn_index,
> +						unsigned long
> npages)
> +{
> +	unsigned long size;
> +
> +	size =3D 1UL << hmm_pfn_to_map_order(hmm_pfn);
> +	size -=3D (hmm_pfn & ~HMM_PFN_FLAGS) & (size - 1);
> +	hmm_pfn_index +=3D size;
> +	if (hmm_pfn_index > npages)
> +		size -=3D (hmm_pfn_index - npages);
> +
> +	return fls(size) - 1;

ilog2() for readability?

> +}
> +
> =C2=A0/**
> =C2=A0 * drm_gpusvm_check_pages() - Check pages
> =C2=A0 * @gpusvm: Pointer to the GPU SVM structure
> @@ -875,7 +896,7 @@ static bool drm_gpusvm_check_pages(struct
> drm_gpusvm *gpusvm,
> =C2=A0			err =3D -EFAULT;
> =C2=A0			goto err_free;
> =C2=A0		}
> -		i +=3D 0x1 << hmm_pfn_to_map_order(pfns[i]);
> +		i +=3D 0x1 << drm_gpusvm_hmm_pfn_to_order(pfns[i], i,
> npages);
> =C2=A0	}
> =C2=A0
> =C2=A0err_free:
> @@ -1408,7 +1429,7 @@ int drm_gpusvm_range_get_pages(struct
> drm_gpusvm *gpusvm,
> =C2=A0	for (i =3D 0, j =3D 0; i < npages; ++j) {
> =C2=A0		struct page *page =3D hmm_pfn_to_page(pfns[i]);
> =C2=A0
> -		order =3D hmm_pfn_to_map_order(pfns[i]);
> +		order =3D drm_gpusvm_hmm_pfn_to_order(pfns[i], i,
> npages);
> =C2=A0		if (is_device_private_page(page) ||
> =C2=A0		=C2=A0=C2=A0=C2=A0 is_device_coherent_page(page)) {
> =C2=A0			if (zdd !=3D page->zone_device_data && i > 0)
> {
Either way
Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

