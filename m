Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68839A718EC
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 15:42:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B304F10E6E1;
	Wed, 26 Mar 2025 14:42:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D4dluHTv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FD2A10E6E0;
 Wed, 26 Mar 2025 14:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743000158; x=1774536158;
 h=from:date:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=fO+T098FYVSpidte82Cl7XAYJYBGFd6cvOWlwdBJhVM=;
 b=D4dluHTv/mw77Q9z3pi8hSi15ge6Ar7zcfFgOqv5WVpHfXew6cNYq7JE
 CUUWId6cwsetueUPRbYNWipe2hnDxjItvI8HPl3LtwME6ZAfUlVTfVWdZ
 77BOdP2F2quWtPWWZsEgHFk56YkXeK3qXp0Jykjqwj+6cWiPpHxoHDYl+
 J5DYzB4ppKpu7I6qe1S1GZk7vx+6aJ4cyX5feKy+r7mo9dfYnAtVMWlO9
 /84OlcqtQPRKRGh7CEXvTHierB3VtN2LjBcVBGRwOAVsBeLKWKvYfSxOw
 YJifhJT6Dr26/j7HY4RoyUkq3t/8snsmqVfKEfOt/tRLhUzpxQZ8O2eVG Q==;
X-CSE-ConnectionGUID: sMGfIJGHSSecWalFISXo5Q==
X-CSE-MsgGUID: SqlR8DUMQSeSf2lOuM3AlQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="43528113"
X-IronPort-AV: E=Sophos;i="6.14,278,1736841600"; d="scan'208";a="43528113"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 07:42:38 -0700
X-CSE-ConnectionGUID: +HxL5WenRVSu9WCTn6FpfQ==
X-CSE-MsgGUID: DPivtZ0QQUCAC7N5Ud3X+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,278,1736841600"; d="scan'208";a="125259860"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.5])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 07:42:32 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 26 Mar 2025 16:42:28 +0200 (EET)
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
Subject: Re: [PATCH v6 1/6] PCI/IOV: Restore VF resizable BAR state after reset
In-Reply-To: <20250320110854.3866284-2-michal.winiarski@intel.com>
Message-ID: <b10b559c-cb23-d21e-d6ee-e060eb0b6b5b@linux.intel.com>
References: <20250320110854.3866284-1-michal.winiarski@intel.com>
 <20250320110854.3866284-2-michal.winiarski@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-577007019-1743000148=:942"
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

--8323328-577007019-1743000148=:942
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Thu, 20 Mar 2025, Micha=C5=82 Winiarski wrote:

> Similar to regular resizable BAR, VF BAR can also be resized, e.g. by
> the system firmware or the PCI subsystem itself.
>=20
> Add the capability ID and restore it as a part of IOV state.
>
> See PCIe r4.0, sec 9.3.7.4.

Usually it's best o refer to latest gen doc, the section number seems to=20
be the same also in r6.2.

This didn't refer to spec section that specified VF Rebar ext capability
(7.8.7) though. I think it should and it would also be good to mention the=
=20
capability layout is the same as with the rebar cap.

> Signed-off-by: Micha=C5=82 Winiarski <michal.winiarski@intel.com>
> Reviewed-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> ---
>  drivers/pci/iov.c             | 30 +++++++++++++++++++++++++++++-
>  drivers/pci/pci.h             |  1 +
>  include/uapi/linux/pci_regs.h |  1 +
>  3 files changed, 31 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/pci/iov.c b/drivers/pci/iov.c
> index 121540f57d4bf..bf95387993cd5 100644
> --- a/drivers/pci/iov.c
> +++ b/drivers/pci/iov.c
> @@ -7,6 +7,7 @@
>   * Copyright (C) 2009 Intel Corporation, Yu Zhao <yu.zhao@intel.com>
>   */
> =20
> +#include <linux/bitfield.h>
>  #include <linux/pci.h>
>  #include <linux/slab.h>
>  #include <linux/export.h>
> @@ -830,6 +831,7 @@ static int sriov_init(struct pci_dev *dev, int pos)
>  =09pci_read_config_byte(dev, pos + PCI_SRIOV_FUNC_LINK, &iov->link);
>  =09if (pci_pcie_type(dev) =3D=3D PCI_EXP_TYPE_RC_END)
>  =09=09iov->link =3D PCI_DEVFN(PCI_SLOT(dev->devfn), iov->link);
> +=09iov->vf_rebar_cap =3D pci_find_ext_capability(dev, PCI_EXT_CAP_ID_VF_=
REBAR);
> =20
>  =09if (pdev)
>  =09=09iov->dev =3D pci_dev_get(pdev);
> @@ -868,6 +870,30 @@ static void sriov_release(struct pci_dev *dev)
>  =09dev->sriov =3D NULL;
>  }
> =20
> +static void sriov_restore_vf_rebar_state(struct pci_dev *dev)
> +{
> +=09unsigned int pos, nbars, i;
> +=09u32 ctrl;
> +
> +=09pos =3D dev->sriov->vf_rebar_cap;
> +=09if (!pos)
> +=09=09return;
> +
> +=09pci_read_config_dword(dev, pos + PCI_REBAR_CTRL, &ctrl);
> +=09nbars =3D FIELD_GET(PCI_REBAR_CTRL_NBAR_MASK, ctrl);
> +
> +=09for (i =3D 0; i < nbars; i++, pos +=3D 8) {
> +=09=09int bar_idx, size;
> +
> +=09=09pci_read_config_dword(dev, pos + PCI_REBAR_CTRL, &ctrl);
> +=09=09bar_idx =3D FIELD_GET(PCI_REBAR_CTRL_BAR_IDX, ctrl);
> +=09=09size =3D pci_rebar_bytes_to_size(dev->sriov->barsz[bar_idx]);
> +=09=09ctrl &=3D ~PCI_REBAR_CTRL_BAR_SIZE;
> +=09=09ctrl |=3D FIELD_PREP(PCI_REBAR_CTRL_BAR_SIZE, size);
> +=09=09pci_write_config_dword(dev, pos + PCI_REBAR_CTRL, ctrl);

I started to wonder if we'd still want to have the VF Rebar ones in=20
uapi/linux/pci_regs.h (despite the same capability layout):

/*
 * PCI Resizable BAR and PCI VF Resizable BAR extended capabilities have=20
 * the same layout of fields.
 */
#define PCI_VF_REBAR_CTRL=09=09PCI_REBAR_CTRL
#define PCI_VF_REBAR_CTRL_BAR_IDX=09PCI_REBAR_CTRL_BAR_IDX
etc.

as then it would be possible grep to pick up only the relevant lines.

I'd not duplicate _SHIFT defines though. FIELD_PREP/GET() in general does=
=20
not need _SHIFT defines at all and they are just duplicated information.

> +=09}
> +}
> +
>  static void sriov_restore_state(struct pci_dev *dev)
>  {
>  =09int i;
> @@ -1027,8 +1053,10 @@ resource_size_t pci_sriov_resource_alignment(struc=
t pci_dev *dev, int resno)
>   */
>  void pci_restore_iov_state(struct pci_dev *dev)
>  {
> -=09if (dev->is_physfn)
> +=09if (dev->is_physfn) {
> +=09=09sriov_restore_vf_rebar_state(dev);
>  =09=09sriov_restore_state(dev);
> +=09}
>  }
> =20
>  /**
> diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
> index b81e99cd4b62a..adc54bb2c8b34 100644
> --- a/drivers/pci/pci.h
> +++ b/drivers/pci/pci.h
> @@ -482,6 +482,7 @@ struct pci_sriov {
>  =09u16=09=09subsystem_vendor; /* VF subsystem vendor */
>  =09u16=09=09subsystem_device; /* VF subsystem device */
>  =09resource_size_t=09barsz[PCI_SRIOV_NUM_BARS];=09/* VF BAR size */
> +=09u16=09=09vf_rebar_cap;=09/* VF Resizable BAR capability offset */
>  =09bool=09=09drivers_autoprobe; /* Auto probing of VFs by driver */
>  };
> =20
> diff --git a/include/uapi/linux/pci_regs.h b/include/uapi/linux/pci_regs.=
h
> index ba326710f9c8b..bb2a334e50386 100644
> --- a/include/uapi/linux/pci_regs.h
> +++ b/include/uapi/linux/pci_regs.h
> @@ -745,6 +745,7 @@
>  #define PCI_EXT_CAP_ID_L1SS=090x1E=09/* L1 PM Substates */
>  #define PCI_EXT_CAP_ID_PTM=090x1F=09/* Precision Time Measurement */
>  #define PCI_EXT_CAP_ID_DVSEC=090x23=09/* Designated Vendor-Specific */
> +#define PCI_EXT_CAP_ID_VF_REBAR 0x24=09/* VF Resizable BAR */
>  #define PCI_EXT_CAP_ID_DLF=090x25=09/* Data Link Feature */
>  #define PCI_EXT_CAP_ID_PL_16GT=090x26=09/* Physical Layer 16.0 GT/s */
>  #define PCI_EXT_CAP_ID_NPEM=090x29=09/* Native PCIe Enclosure Management=
 */

Reviewed-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.

--8323328-577007019-1743000148=:942--
