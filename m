Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E31A7A053
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 11:46:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0BEB10E980;
	Thu,  3 Apr 2025 09:46:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KWmRDova";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13D5810E980;
 Thu,  3 Apr 2025 09:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743673581; x=1775209581;
 h=from:date:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=6XnoVg+yC7QQLKbDlRVIJmkNWMIJM7BWw4IEozsWanQ=;
 b=KWmRDova8GWUPjo5bFtauS53mEqIiY5B3njmqrnnxtNvfYRkkl3z64Aw
 V4oeJJNSUqRrSCTnAijT7akvS+1Uby2TcjPPtv4huY4qQHwPYU/snkPjD
 wmpmEo5i/7ZxzOUrZizPTA1MtdJU+kgN4kKl39hDTl2CC9l1AjDEhP3zq
 +Nk/qANo+gQkHz5MeplFlL70btNLbouV5CHz8jC3a7WwMC5xZ3ccDSEr0
 Cyk+oHYYFEY8LZ4hoS3o0DEDKKDmTwOKNX+vw0CCniWepXeuipzPJ2RRv
 uuAeeqk56RRqgm9lcuRnnsKPNy3pFj3NWpCS3GbNTc9oMPu7Ylk8t0F23 g==;
X-CSE-ConnectionGUID: 7ew+fwxqSjiQo+e9yw+h2A==
X-CSE-MsgGUID: IPITvinORaqkIAhWWihcrw==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="55700874"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="55700874"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 02:45:54 -0700
X-CSE-ConnectionGUID: jyG+Q7IsQ8Ol0yQpTWIevA==
X-CSE-MsgGUID: ASjgkbMCR1OecHoGXGxgHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="126950855"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.152])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 02:45:48 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 3 Apr 2025 12:45:45 +0300 (EEST)
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
Subject: Re: [PATCH v7 3/6] PCI: Allow IOV resources to be resized in
 pci_resize_resource()
In-Reply-To: <20250402141122.2818478-4-michal.winiarski@intel.com>
Message-ID: <31c9a59c-b90c-80e4-cd2f-2eb992ce8556@linux.intel.com>
References: <20250402141122.2818478-1-michal.winiarski@intel.com>
 <20250402141122.2818478-4-michal.winiarski@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-154751121-1743673545=:1302"
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

--8323328-154751121-1743673545=:1302
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 2 Apr 2025, Micha=C5=82 Winiarski wrote:

> Similar to regular resizable BAR, VF BAR can also be resized.
>=20
> The capability layout is the same as PCI_EXT_CAP_ID_REBAR, which means
> we can reuse most of the implementation, the only difference being
> resource size calculation (which is multiplied by total VFs) and memory
> decoding (which is controlled by a separate VF MSE field in SR-IOV cap).
>=20
> Extend the pci_resize_resource() function to accept IOV resources.
>=20
> See PCIe r6.2, sec 7.8.7.
>=20
> Signed-off-by: Micha=C5=82 Winiarski <michal.winiarski@intel.com>
> ---
>  drivers/pci/iov.c       | 21 +++++++++++++++++++++
>  drivers/pci/pci.c       | 10 +++++++++-
>  drivers/pci/pci.h       |  9 +++++++++
>  drivers/pci/setup-res.c | 35 ++++++++++++++++++++++++++++++-----
>  4 files changed, 69 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/pci/iov.c b/drivers/pci/iov.c
> index 3d5da055c3dc1..fee99e15a943f 100644
> --- a/drivers/pci/iov.c
> +++ b/drivers/pci/iov.c
> @@ -154,6 +154,27 @@ resource_size_t pci_iov_resource_size(struct pci_dev=
 *dev, int resno)
>  =09return dev->sriov->barsz[pci_resource_num_to_vf_bar(resno)];
>  }
> =20
> +void pci_iov_resource_set_size(struct pci_dev *dev, int resno,
> +=09=09=09       resource_size_t size)
> +{
> +=09if (!pci_resource_is_iov(resno)) {
> +=09=09pci_warn(dev, "%s is not an IOV resource\n",
> +=09=09=09 pci_resource_name(dev, resno));
> +=09=09return;
> +=09}
> +
> +=09dev->sriov->barsz[pci_resource_num_to_vf_bar(resno)] =3D size;
> +}
> +
> +bool pci_iov_is_memory_decoding_enabled(struct pci_dev *dev)
> +{
> +=09u16 cmd;
> +
> +=09pci_read_config_word(dev, dev->sriov->pos + PCI_SRIOV_CTRL, &cmd);
> +
> +=09return cmd & PCI_SRIOV_CTRL_MSE;
> +}
> +
>  static void pci_read_vf_config_common(struct pci_dev *virtfn)
>  {
>  =09struct pci_dev *physfn =3D virtfn->physfn;
> diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> index 4d7c9f64ea24e..6878e3b1e3fcf 100644
> --- a/drivers/pci/pci.c
> +++ b/drivers/pci/pci.c
> @@ -3745,7 +3745,15 @@ static int pci_rebar_find_pos(struct pci_dev *pdev=
, int bar)
>  =09unsigned int pos, nbars, i;
>  =09u32 ctrl;
> =20
> -=09pos =3D pdev->rebar_cap;
> +=09if (pci_resource_is_iov(bar)) {
> +=09=09if (!pdev->physfn)
> +=09=09=09return -ENOTSUPP;
> +=09=09pos =3D pdev->sriov->vf_rebar_cap;
> +=09=09bar =3D pci_resource_num_to_vf_bar(bar);
> +=09} else {
> +=09=09pos =3D pdev->rebar_cap;
> +=09}
> +
>  =09if (!pos)
>  =09=09return -ENOTSUPP;
> =20
> diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
> index f44840ee3c327..643cd8c737f66 100644
> --- a/drivers/pci/pci.h
> +++ b/drivers/pci/pci.h
> @@ -689,6 +689,9 @@ void pci_iov_update_resource(struct pci_dev *dev, int=
 resno);
>  resource_size_t pci_sriov_resource_alignment(struct pci_dev *dev, int re=
sno);
>  void pci_restore_iov_state(struct pci_dev *dev);
>  int pci_iov_bus_range(struct pci_bus *bus);
> +void pci_iov_resource_set_size(struct pci_dev *dev, int resno,
> +=09=09=09       resource_size_t size);
> +bool pci_iov_is_memory_decoding_enabled(struct pci_dev *dev);
>  static inline bool pci_resource_is_iov(int resno)
>  {
>  =09return resno >=3D PCI_IOV_RESOURCES && resno <=3D PCI_IOV_RESOURCE_EN=
D;
> @@ -722,6 +725,12 @@ static inline int pci_iov_bus_range(struct pci_bus *=
bus)
>  {
>  =09return 0;
>  }
> +static inline void pci_iov_resource_set_size(struct pci_dev *dev, int re=
sno,
> +=09=09=09=09=09     resource_size_t size) { }
> +static inline bool pci_iov_is_memory_decoding_enabled(struct pci_dev *de=
v)
> +{
> +=09return false;
> +}
>  static inline bool pci_resource_is_iov(int resno)
>  {
>  =09return false;
> diff --git a/drivers/pci/setup-res.c b/drivers/pci/setup-res.c
> index c6657cdd06f67..d2b3ed51e8804 100644
> --- a/drivers/pci/setup-res.c
> +++ b/drivers/pci/setup-res.c
> @@ -423,13 +423,39 @@ void pci_release_resource(struct pci_dev *dev, int =
resno)
>  }
>  EXPORT_SYMBOL(pci_release_resource);
> =20
> +static bool pci_resize_is_memory_decoding_enabled(struct pci_dev *dev,
> +=09=09=09=09=09=09  int resno)
> +{
> +=09u16 cmd;
> +
> +=09if (pci_resource_is_iov(resno))
> +=09=09return pci_iov_is_memory_decoding_enabled(dev);
> +
> +=09pci_read_config_word(dev, PCI_COMMAND, &cmd);
> +
> +=09return cmd & PCI_COMMAND_MEMORY;
> +}
> +
> +static void pci_resize_resource_set_size(struct pci_dev *dev, int resno,
> +=09=09=09=09=09 int size)
> +{
> +=09resource_size_t res_size =3D pci_rebar_size_to_bytes(size);
> +=09struct resource *res =3D pci_resource_n(dev, resno);
> +
> +=09if (!pci_resource_is_iov(resno)) {
> +=09=09resource_set_size(res, res_size);
> +=09} else {
> +=09=09resource_set_size(res, res_size * pci_sriov_get_totalvfs(dev));
> +=09=09pci_iov_resource_set_size(dev, resno, res_size);
> +=09}
> +}
> +
>  int pci_resize_resource(struct pci_dev *dev, int resno, int size)
>  {
>  =09struct resource *res =3D pci_resource_n(dev, resno);
>  =09struct pci_host_bridge *host;
>  =09int old, ret;
>  =09u32 sizes;
> -=09u16 cmd;
> =20
>  =09/* Check if we must preserve the firmware's resource assignment */
>  =09host =3D pci_find_host_bridge(dev->bus);
> @@ -440,8 +466,7 @@ int pci_resize_resource(struct pci_dev *dev, int resn=
o, int size)
>  =09if (!(res->flags & IORESOURCE_UNSET))
>  =09=09return -EBUSY;
> =20
> -=09pci_read_config_word(dev, PCI_COMMAND, &cmd);
> -=09if (cmd & PCI_COMMAND_MEMORY)
> +=09if (pci_resize_is_memory_decoding_enabled(dev, resno))
>  =09=09return -EBUSY;
> =20
>  =09sizes =3D pci_rebar_get_possible_sizes(dev, resno);
> @@ -459,7 +484,7 @@ int pci_resize_resource(struct pci_dev *dev, int resn=
o, int size)
>  =09if (ret)
>  =09=09return ret;
> =20
> -=09resource_set_size(res, pci_rebar_size_to_bytes(size));
> +=09pci_resize_resource_set_size(dev, resno, size);
> =20
>  =09/* Check if the new config works by trying to assign everything. */
>  =09if (dev->bus->self) {
> @@ -471,7 +496,7 @@ int pci_resize_resource(struct pci_dev *dev, int resn=
o, int size)
> =20
>  error_resize:
>  =09pci_rebar_set_size(dev, resno, old);
> -=09resource_set_size(res, pci_rebar_size_to_bytes(old));
> +=09pci_resize_resource_set_size(dev, resno, old);
>  =09return ret;
>  }
>  EXPORT_SYMBOL(pci_resize_resource);

Reviewed-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.

--8323328-154751121-1743673545=:1302--
