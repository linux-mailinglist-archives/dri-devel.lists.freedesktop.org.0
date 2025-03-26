Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1840BA71A1F
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 16:23:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 616D310E6FD;
	Wed, 26 Mar 2025 15:23:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RybmhwP6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 481CC10E6FA;
 Wed, 26 Mar 2025 15:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743002586; x=1774538586;
 h=from:date:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=2ZQQrfoMCkW8KTsHXP4erfvYUa6Js4OjFNugSnhgNCM=;
 b=RybmhwP6Vv7hegRTwG7Ei1KgpQVYoluffC4gDJ7nDc2oyl+Kcug/gtdy
 JWJplXpxW4Qo/dV+DcO8U/98rEMI6++VVPJyZ7Ci69HWD+PjQmEcmL2Bp
 Cj4qR9eyGaAl0b27PEB+AtTNZbSF8CzIyHq+dNC8MTTPkdj7Yu7NXbYKt
 eZneOHoNBZeltSI+ZcO4wSVPR0pmW6FNibPFBb13HryU0W4DXLTzZYVFT
 E6kLS6Lhe1HCiBMNFp+tQtygcIoI40DrBdiQhFgyJFVXjL8lJWVRtp/32
 p1xWi0NmJS6/M4GSnxR2i1JQcIxx5tbrebKdRD0x53kiiVwo2spzIo4LJ A==;
X-CSE-ConnectionGUID: j7MVufjNQhWICCGZELM/Cg==
X-CSE-MsgGUID: aK/479IlRKqQlu7TLJYaDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="55296926"
X-IronPort-AV: E=Sophos;i="6.14,278,1736841600"; d="scan'208";a="55296926"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 08:23:00 -0700
X-CSE-ConnectionGUID: Q+f2VCQiSRuWz7lMYmRRPQ==
X-CSE-MsgGUID: s2xmdai3Rm2siOCMWMNiag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,278,1736841600"; d="scan'208";a="155712192"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.5])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 08:22:55 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 26 Mar 2025 17:22:50 +0200 (EET)
To: =?ISO-8859-2?Q?Micha=B3_Winiarski?= <michal.winiarski@intel.com>
cc: linux-pci@vger.kernel.org, intel-xe@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 =?ISO-8859-15?Q?Christian_K=F6nig?= <christian.koenig@amd.com>, 
 =?ISO-8859-2?Q?Krzysztof_Wilczy=F1ski?= <kw@linux.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Michal Wajdeczko <michal.wajdeczko@intel.com>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 =?ISO-8859-15?Q?Thomas_Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH v6 5/6] PCI: Allow drivers to control VF BAR size
In-Reply-To: <20250320110854.3866284-6-michal.winiarski@intel.com>
Message-ID: <7374beef-46ed-ab53-ccb5-48565526545c@linux.intel.com>
References: <20250320110854.3866284-1-michal.winiarski@intel.com>
 <20250320110854.3866284-6-michal.winiarski@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-2132874728-1743002570=:942"
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-2132874728-1743002570=:942
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Thu, 20 Mar 2025, Micha=C5=82 Winiarski wrote:

> Drivers could leverage the fact that the VF BAR MMIO reservation is
> created for total number of VFs supported by the device by resizing the
> BAR to larger size when smaller number of VFs is enabled.
>=20
> Add a pci_iov_vf_bar_set_size() function to control the size and a
> pci_iov_vf_bar_get_sizes() helper to get the VF BAR sizes that will
> allow up to num_vfs to be successfully enabled with the current
> underlying reservation size.
>=20
> Signed-off-by: Micha=C5=82 Winiarski <michal.winiarski@intel.com>
> ---
>  drivers/pci/iov.c   | 78 +++++++++++++++++++++++++++++++++++++++++++++
>  include/linux/pci.h |  6 ++++
>  2 files changed, 84 insertions(+)
>=20
> diff --git a/drivers/pci/iov.c b/drivers/pci/iov.c
> index 861273ad9a580..751eef232685c 100644
> --- a/drivers/pci/iov.c
> +++ b/drivers/pci/iov.c
> @@ -1291,3 +1291,81 @@ int pci_sriov_configure_simple(struct pci_dev *dev=
, int nr_virtfn)
>  =09return nr_virtfn;
>  }
>  EXPORT_SYMBOL_GPL(pci_sriov_configure_simple);
> +
> +/**
> + * pci_iov_vf_bar_set_size - set a new size for a VF BAR
> + * @dev: the PCI device
> + * @resno: the resource number
> + * @size: new size as defined in the spec (0=3D1MB, 31=3D128TB)
> + *
> + * Set the new size of a VF BAR that supports VF resizable BAR capabilit=
y.
> + * Unlike pci_resize_resource(), this does not cause the resource that
> + * reserves the MMIO space (originally up to total_VFs) to be resized, w=
hich
> + * means that following calls to pci_enable_sriov() can fail if the reso=
urces
> + * no longer fit.
> + *
> + * Returns 0 on success, or negative on failure.

Return: is the correct kernel doc style.

> + */
> +int pci_iov_vf_bar_set_size(struct pci_dev *dev, int resno, int size)
> +{
> +=09int ret;
> +=09u32 sizes;
> +
> +=09if (!pci_resource_is_iov(resno))
> +=09=09return -EINVAL;
> +
> +=09if (pci_iov_is_memory_decoding_enabled(dev))
> +=09=09return -EBUSY;
> +
> +=09sizes =3D pci_rebar_get_possible_sizes(dev, resno);
> +=09if (!sizes)
> +=09=09return -ENOTSUPP;
> +
> +=09if (!(sizes & BIT(size)))
> +=09=09return -EINVAL;
> +
> +=09ret =3D pci_rebar_set_size(dev, resno, size);
> +=09if (ret)
> +=09=09return ret;
> +
> +=09pci_iov_resource_set_size(dev, resno, pci_rebar_size_to_bytes(size));
> +
> +=09return 0;
> +}
> +EXPORT_SYMBOL_GPL(pci_iov_vf_bar_set_size);
> +
> +/**
> + * pci_iov_vf_bar_get_sizes - get VF BAR sizes allowing to create up to =
num_vfs
> + * @dev: the PCI device
> + * @resno: the resource number
> + * @num_vfs: number of VFs
> + *
> + * Get the sizes of a VF resizable BAR that can be accommodated within t=
he
> + * resource that reserves the MMIO space if num_vfs are enabled.

I'd rephrase to:

Get the sizes of a VF resizable BAR that can be accommodate @num_vfs=20
within the currently assigned size of the resource @resno.

> + *
> + * Returns 0 if BAR isn't resizable, otherwise returns a bitmask in form=
at

Return:

a bitmask of sizes

> + * defined in the spec (bit 0=3D1MB, bit 31=3D128TB).
> + */
> +u32 pci_iov_vf_bar_get_sizes(struct pci_dev *dev, int resno, int num_vfs=
)
> +{
> +=09resource_size_t size;
> +=09u32 sizes;
> +=09int i;
> +
> +=09sizes =3D pci_rebar_get_possible_sizes(dev, resno);
> +=09if (!sizes)
> +=09=09return 0;
> +
> +=09while (sizes > 0) {
> +=09=09i =3D __fls(sizes);
> +=09=09size =3D pci_rebar_size_to_bytes(i);
> +
> +=09=09if (size * num_vfs <=3D pci_resource_len(dev, resno))
> +=09=09=09break;
> +
> +=09=09sizes &=3D ~BIT(i);
> +=09}

Couldn't this be handled without a loop:

=09bar_sizes =3D (round_up(pci_resource_len(dev, resno) / num_vfs) - 1) >>
=09=09    ilog2(SZ_1M);

=09sizes &=3D bar_sizes;

(Just to given an idea, I wrote this into the email so it might contain=20
some off-by-one errors or like).

> +
> +=09return sizes;
> +}
> +EXPORT_SYMBOL_GPL(pci_iov_vf_bar_get_sizes);
> diff --git a/include/linux/pci.h b/include/linux/pci.h
> index 0e8e3fd77e967..c8708f3749757 100644
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -2389,6 +2389,8 @@ int pci_sriov_set_totalvfs(struct pci_dev *dev, u16=
 numvfs);
>  int pci_sriov_get_totalvfs(struct pci_dev *dev);
>  int pci_sriov_configure_simple(struct pci_dev *dev, int nr_virtfn);
>  resource_size_t pci_iov_resource_size(struct pci_dev *dev, int resno);
> +int pci_iov_vf_bar_set_size(struct pci_dev *dev, int resno, int size);
> +u32 pci_iov_vf_bar_get_sizes(struct pci_dev *dev, int resno, int num_vfs=
);
>  void pci_vf_drivers_autoprobe(struct pci_dev *dev, bool probe);
> =20
>  /* Arch may override these (weak) */
> @@ -2441,6 +2443,10 @@ static inline int pci_sriov_get_totalvfs(struct pc=
i_dev *dev)
>  #define pci_sriov_configure_simple=09NULL
>  static inline resource_size_t pci_iov_resource_size(struct pci_dev *dev,=
 int resno)
>  { return 0; }
> +static inline int pci_iov_vf_bar_set_size(struct pci_dev *dev, int resno=
, int size)
> +{ return -ENODEV; }
> +static inline u32 pci_iov_vf_bar_get_sizes(struct pci_dev *dev, int resn=
o, int num_vfs)
> +{ return 0; }
>  static inline void pci_vf_drivers_autoprobe(struct pci_dev *dev, bool pr=
obe) { }
>  #endif
> =20
>=20

--=20
 i.

--8323328-2132874728-1743002570=:942--
