Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D535998451
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2024 13:01:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1477910E8CC;
	Thu, 10 Oct 2024 11:01:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IEoeUByc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E08D210E8CB;
 Thu, 10 Oct 2024 11:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728558094; x=1760094094;
 h=from:date:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=YtKnFjjEp03jPtDkeC8jufxAJ+D4e6/2CJ4T+ZVZQPs=;
 b=IEoeUBycUBb6mESWIDdYS76rLhbPQAsDQN+nM/zuzc3hTxaXilHDPMeG
 KtXqPuxt/3IPQ0g60UK3zr4Qkxxqr5corbUMo2Inp7nTQ1B7xPlY5F996
 7vltv5AkMKodupMCXwBZEMHbN6j1UYgAhfxoTyNesaAxemUzBdQVl9Jsl
 0NBrGYCHhnmbRInVrWmbQnc5dBVLRcL99cXFbfIcPYcS4NSd0yeolX2ki
 m/ynfkk+JHgvnk438oYAtRjs/selsdgwHMx0yxDhVf9kHFKrIXOc6UO5/
 MZv5b0INuNfL8XxGHF8tQxVtty5eQGqk9YHw6eQ+OF8zXO7VJk8E7kBSP Q==;
X-CSE-ConnectionGUID: f8NN8/fWQS21WDUg24aUJw==
X-CSE-MsgGUID: IjiSLk7PTIaCQb/lHZZ4Kg==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="27717286"
X-IronPort-AV: E=Sophos;i="6.11,192,1725346800"; d="scan'208";a="27717286"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2024 04:01:34 -0700
X-CSE-ConnectionGUID: P2iknpqjQMijA1685hUysA==
X-CSE-MsgGUID: VsLIan/9R2ScsJ+6HVCBmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,192,1725346800"; d="scan'208";a="76164498"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.237])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2024 04:01:27 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 10 Oct 2024 14:01:24 +0300 (EEST)
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
Subject: Re: [PATCH v3 1/5] PCI/IOV: Restore VF resizable BAR state after reset
In-Reply-To: <20241010103203.382898-2-michal.winiarski@intel.com>
Message-ID: <e4597db1-d294-3814-fe11-45231bde24cc@linux.intel.com>
References: <20241010103203.382898-1-michal.winiarski@intel.com>
 <20241010103203.382898-2-michal.winiarski@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1722614830-1728558084=:12246"
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

--8323328-1722614830-1728558084=:12246
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Thu, 10 Oct 2024, Micha=C5=82 Winiarski wrote:

> Similar to regular resizable BAR, VF BAR can also be resized, e.g. by
> the system firmware, or the PCI subsystem itself.
> Add the capability ID and restore it as a part of IOV state.
> See PCIe r4.0, sec 9.3.7.4.
>=20
> Signed-off-by: Micha=C5=82 Winiarski <michal.winiarski@intel.com>
> ---
>  drivers/pci/iov.c             | 29 ++++++++++++++++++++++++++++-
>  include/uapi/linux/pci_regs.h |  1 +
>  2 files changed, 29 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/pci/iov.c b/drivers/pci/iov.c
> index aaa33e8dc4c97..fd5c059b29c13 100644
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
> @@ -862,6 +863,30 @@ static void sriov_release(struct pci_dev *dev)
>  =09dev->sriov =3D NULL;
>  }
> =20
> +static void sriov_restore_vf_rebar_state(struct pci_dev *dev)
> +{
> +=09unsigned int pos, nbars, i;
> +=09u32 ctrl;
> +
> +=09pos =3D pci_find_ext_capability(dev, PCI_EXT_CAP_ID_VF_REBAR);
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
> +=09=09bar_idx =3D ctrl & PCI_REBAR_CTRL_BAR_IDX;

Use FIELD_GET().

Reviewed-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.

> +=09=09size =3D pci_rebar_bytes_to_size(dev->sriov->barsz[bar_idx]);
> +=09=09ctrl &=3D ~PCI_REBAR_CTRL_BAR_SIZE;
> +=09=09ctrl |=3D FIELD_PREP(PCI_REBAR_CTRL_BAR_SIZE, size);
> +=09=09pci_write_config_dword(dev, pos + PCI_REBAR_CTRL, ctrl);
> +=09}
> +}
> +
>  static void sriov_restore_state(struct pci_dev *dev)
>  {
>  =09int i;
> @@ -1021,8 +1046,10 @@ resource_size_t pci_sriov_resource_alignment(struc=
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
> diff --git a/include/uapi/linux/pci_regs.h b/include/uapi/linux/pci_regs.=
h
> index 12323b3334a9c..a0cf701c4c3af 100644
> --- a/include/uapi/linux/pci_regs.h
> +++ b/include/uapi/linux/pci_regs.h
> @@ -740,6 +740,7 @@
>  #define PCI_EXT_CAP_ID_L1SS=090x1E=09/* L1 PM Substates */
>  #define PCI_EXT_CAP_ID_PTM=090x1F=09/* Precision Time Measurement */
>  #define PCI_EXT_CAP_ID_DVSEC=090x23=09/* Designated Vendor-Specific */
> +#define PCI_EXT_CAP_ID_VF_REBAR 0x24=09/* VF Resizable BAR */
>  #define PCI_EXT_CAP_ID_DLF=090x25=09/* Data Link Feature */
>  #define PCI_EXT_CAP_ID_PL_16GT=090x26=09/* Physical Layer 16.0 GT/s */
>  #define PCI_EXT_CAP_ID_NPEM=090x29=09/* Native PCIe Enclosure Management=
 */
>=20
--8323328-1722614830-1728558084=:12246--
