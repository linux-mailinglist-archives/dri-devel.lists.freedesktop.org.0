Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB599BEFFE
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2024 15:22:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 782EC10E2F4;
	Wed,  6 Nov 2024 14:22:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XWmkzm1A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F05610E2DF;
 Wed,  6 Nov 2024 14:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730902941; x=1762438941;
 h=from:date:to:cc:subject:in-reply-to:message-id:
 references:mime-version:content-id;
 bh=blyV21pOL2y4toKMXZqzAR7kHNfiD1J9G7pj6duc0Xs=;
 b=XWmkzm1AUvbFUHfLkJH5j8u4ikyHBxXFlEDTv3JVn3pGHVaSfUAgQmaN
 76fPjmJ1aXtfTJ5ODNYwiy0wPwWatSUGerCb656Dz1WtB/xP1IcZTpmLT
 8qor4fhIUR9Ka/8HMNAbrYG0mXMgmcfmnt3Hl+NqdsO27nQZphevLSHie
 Awr/aqmY5UibFop/x+TdxqxPX3ZqIz6sLS9ZxFs7BvaqM68yGIkbaO0XM
 z3Tx9IWFQ2IRO6mpnLTqoRqX5WQGLgYEPJ/MlFNCE3/3YA9Jy8Qn46xtR
 pXbBfO85JU1AHjytOn1D3xzqMLWdDqtxKA+DM3v/LnEUfiADOW3PjgMOy Q==;
X-CSE-ConnectionGUID: kpKrMJ9+SASdPk0kGb5z4A==
X-CSE-MsgGUID: mu9yhAoZTnq5K6lqvaUMjQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30883641"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="30883641"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2024 06:22:21 -0800
X-CSE-ConnectionGUID: UwKRJ8uRSZ+2+qrrIYU1Xw==
X-CSE-MsgGUID: qzYBqoG/RmmQbgpoe8GEFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,263,1725346800"; d="scan'208";a="89689153"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.110])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2024 06:22:15 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 6 Nov 2024 16:22:11 +0200 (EET)
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
Subject: Re: [PATCH v4 3/7] PCI: Add a helper to convert between standard
 and IOV resources
In-Reply-To: <20241025215038.3125626-4-michal.winiarski@intel.com>
Message-ID: <10b4f173-619a-9913-99de-5d08b3fc854c@linux.intel.com>
References: <20241025215038.3125626-1-michal.winiarski@intel.com>
 <20241025215038.3125626-4-michal.winiarski@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-462573539-1730902526=:928"
Content-ID: <adfb3f5d-d535-38e5-e92a-584ac4f25d5d@linux.intel.com>
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

--8323328-462573539-1730902526=:928
Content-Type: text/plain; CHARSET=ISO-8859-2
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <d0ba6583-b7ea-d045-07b3-24d2b563b362@linux.intel.com>

On Fri, 25 Oct 2024, Micha=B3 Winiarski wrote:

> There are multiple places where conversions between IOV resources and
> standard resources are done.
>=20
> Extract the logic to pci_resource_to_iov() and pci_resource_from_iov()
> helpers.
>=20
> Suggested-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>
> Signed-off-by: Micha=B3 Winiarski <michal.winiarski@intel.com>
> ---
>  drivers/pci/iov.c       | 20 ++++++++++----------
>  drivers/pci/pci.h       | 18 ++++++++++++++++++
>  drivers/pci/setup-bus.c |  2 +-
>  3 files changed, 29 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/pci/iov.c b/drivers/pci/iov.c
> index 6bdc9950b9787..eedc1df56c49e 100644
> --- a/drivers/pci/iov.c
> +++ b/drivers/pci/iov.c
> @@ -151,7 +151,7 @@ resource_size_t pci_iov_resource_size(struct pci_dev =
*dev, int resno)
>  =09if (!dev->is_physfn)
>  =09=09return 0;
> =20
> -=09return dev->sriov->barsz[resno - PCI_IOV_RESOURCES];
> +=09return dev->sriov->barsz[pci_resource_from_iov(resno)];
>  }
> =20
>  static void pci_read_vf_config_common(struct pci_dev *virtfn)
> @@ -322,12 +322,12 @@ int pci_iov_add_virtfn(struct pci_dev *dev, int id)
>  =09virtfn->multifunction =3D 0;
> =20
>  =09for (i =3D 0; i < PCI_SRIOV_NUM_BARS; i++) {
> -=09=09res =3D &dev->resource[i + PCI_IOV_RESOURCES];
> +=09=09res =3D &dev->resource[pci_resource_to_iov(i)];
>  =09=09if (!res->parent)
>  =09=09=09continue;
>  =09=09virtfn->resource[i].name =3D pci_name(virtfn);
>  =09=09virtfn->resource[i].flags =3D res->flags;
> -=09=09size =3D pci_iov_resource_size(dev, i + PCI_IOV_RESOURCES);
> +=09=09size =3D pci_iov_resource_size(dev, pci_resource_to_iov(i));
>  =09=09virtfn->resource[i].start =3D res->start + size * id;
>  =09=09virtfn->resource[i].end =3D virtfn->resource[i].start + size - 1;
>  =09=09rc =3D request_resource(res, &virtfn->resource[i]);
> @@ -624,8 +624,8 @@ static int sriov_enable(struct pci_dev *dev, int nr_v=
irtfn)
> =20
>  =09nres =3D 0;
>  =09for (i =3D 0; i < PCI_SRIOV_NUM_BARS; i++) {
> -=09=09bars |=3D (1 << (i + PCI_IOV_RESOURCES));
> -=09=09res =3D &dev->resource[i + PCI_IOV_RESOURCES];
> +=09=09bars |=3D (1 << pci_resource_to_iov(i));
> +=09=09res =3D &dev->resource[pci_resource_to_iov(i)];
>  =09=09if (res->parent)
>  =09=09=09nres++;
>  =09}
> @@ -786,8 +786,8 @@ static int sriov_init(struct pci_dev *dev, int pos)
> =20
>  =09nres =3D 0;
>  =09for (i =3D 0; i < PCI_SRIOV_NUM_BARS; i++) {
> -=09=09res =3D &dev->resource[i + PCI_IOV_RESOURCES];
> -=09=09res_name =3D pci_resource_name(dev, i + PCI_IOV_RESOURCES);
> +=09=09res =3D &dev->resource[pci_resource_to_iov(i)];
> +=09=09res_name =3D pci_resource_name(dev, pci_resource_to_iov(i));
> =20
>  =09=09/*
>  =09=09 * If it is already FIXED, don't change it, something
> @@ -844,7 +844,7 @@ static int sriov_init(struct pci_dev *dev, int pos)
>  =09dev->is_physfn =3D 0;
>  failed:
>  =09for (i =3D 0; i < PCI_SRIOV_NUM_BARS; i++) {
> -=09=09res =3D &dev->resource[i + PCI_IOV_RESOURCES];
> +=09=09res =3D &dev->resource[pci_resource_to_iov(i)];
>  =09=09res->flags =3D 0;
>  =09}
> =20
> @@ -906,7 +906,7 @@ static void sriov_restore_state(struct pci_dev *dev)
>  =09pci_write_config_word(dev, iov->pos + PCI_SRIOV_CTRL, ctrl);
> =20
>  =09for (i =3D 0; i < PCI_SRIOV_NUM_BARS; i++)
> -=09=09pci_update_resource(dev, i + PCI_IOV_RESOURCES);
> +=09=09pci_update_resource(dev, pci_resource_to_iov(i));
> =20
>  =09pci_write_config_dword(dev, iov->pos + PCI_SRIOV_SYS_PGSIZE, iov->pgs=
z);
>  =09pci_iov_set_numvfs(dev, iov->num_VFs);
> @@ -972,7 +972,7 @@ void pci_iov_update_resource(struct pci_dev *dev, int=
 resno)
>  {
>  =09struct pci_sriov *iov =3D dev->is_physfn ? dev->sriov : NULL;
>  =09struct resource *res =3D dev->resource + resno;
> -=09int vf_bar =3D resno - PCI_IOV_RESOURCES;
> +=09int vf_bar =3D pci_resource_from_iov(resno);
>  =09struct pci_bus_region region;
>  =09u16 cmd;
>  =09u32 new;
> diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
> index 48d345607e57e..1f8d88f0243b7 100644
> --- a/drivers/pci/pci.h
> +++ b/drivers/pci/pci.h
> @@ -584,6 +584,15 @@ static inline bool pci_resource_is_iov(int resno)
>  {
>  =09return resno >=3D PCI_IOV_RESOURCES && resno <=3D PCI_IOV_RESOURCE_EN=
D;
>  }
> +static inline int pci_resource_to_iov(int resno)
> +{
> +=09return resno + PCI_IOV_RESOURCES;
> +}
> +
> +static inline int pci_resource_from_iov(int resno)
> +{
> +=09return resno - PCI_IOV_RESOURCES;
> +}

to/from feels wrong way around for me. What is named as "PCI resource from=
=20
IOV" converts from PCI resource indexing to IOV compatible indexing, and=20
vice versa.

>  extern const struct attribute_group sriov_pf_dev_attr_group;
>  extern const struct attribute_group sriov_vf_dev_attr_group;
>  #else
> @@ -608,6 +617,15 @@ static inline bool pci_resource_is_iov(int resno)
>  {
>  =09return false;
>  }
> +static inline int pci_resource_to_iov(int resno)
> +{
> +=09return -ENODEV;
> +}
> +
> +static inline int pci_resource_from_iov(int resno)
> +{
> +=09return -ENODEV;
> +}

These seem dangerous as the errors are not checked by the callers. Perhaps=
=20
put something like BUG_ON(1) there instead as it really is something that=
=20
should never be called for real if CONFIG_PCI_IOV is not enabled, they are=
=20
just to make compiler happy without #ifdefs in C code.

--=20
 i.

>  #endif /* CONFIG_PCI_IOV */
> =20
>  #ifdef CONFIG_PCIE_PTM
> diff --git a/drivers/pci/setup-bus.c b/drivers/pci/setup-bus.c
> index ba293df10c050..c5ad7c4ad6eb1 100644
> --- a/drivers/pci/setup-bus.c
> +++ b/drivers/pci/setup-bus.c
> @@ -1778,7 +1778,7 @@ static int iov_resources_unassigned(struct pci_dev =
*dev, void *data)
>  =09bool *unassigned =3D data;
> =20
>  =09for (i =3D 0; i < PCI_SRIOV_NUM_BARS; i++) {
> -=09=09struct resource *r =3D &dev->resource[i + PCI_IOV_RESOURCES];
> +=09=09struct resource *r =3D &dev->resource[pci_resource_to_iov(i)];
>  =09=09struct pci_bus_region region;
> =20
>  =09=09/* Not assigned or rejected by kernel? */
>=20
--8323328-462573539-1730902526=:928--
