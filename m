Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B21AD8BAA9C
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 12:18:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE88F10EA92;
	Fri,  3 May 2024 10:18:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j+h7jgG7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 323CF10EA92;
 Fri,  3 May 2024 10:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714731526; x=1746267526;
 h=from:date:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=10Jfz7g2I63T6OjaKjymVfcINKOaZ2J6fHxtq+P/NAM=;
 b=j+h7jgG7i6HgGQNI2Jpz3aiJCo/SDy67Xx2R+VJBeX6/sHeH6e6PPB4r
 bAL3ZtDeRljDnk2V141NaugnaIjl6JhtoVTXryXJeJv/fJ8dH2zi+Lasw
 4vRflK+FsD7j6IAvfLpxo4e1QnTBNUQMtcnt5QPu+jcUvQ8tw3wQzS8ZE
 r/fQHuQzqOxFLqXu9OkkxC1JCw1qre9jK0OAOTJZH/sRwXLkS1uj43Xbg
 yDWtqCItYmX/RyY6wWpE4Yl1D5tD3308qpQl3m1sy1YUrffJRxIpbUfId
 fhL04jDY8Catj2hT68EFwDkVd2pwV6IvZT2SiI510ijgU804jOf5AAKzR w==;
X-CSE-ConnectionGUID: 8tbpPYWUSa2PYingGTMiJQ==
X-CSE-MsgGUID: 3LsCpRbwRA2WSM+9NmrKvQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11062"; a="10386646"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; d="scan'208";a="10386646"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 03:18:45 -0700
X-CSE-ConnectionGUID: fg5BmVqpSRyyi5slzLMDnA==
X-CSE-MsgGUID: IEo6vwxzSGqiLHBTgxJ77A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; d="scan'208";a="32215585"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost)
 ([10.245.247.56])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 03:18:42 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 3 May 2024 13:18:35 +0300 (EEST)
To: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
cc: Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, 
 Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>, 
 dri-devel@lists.freedesktop.org, Jason Gunthorpe <jgg@ziepe.ca>, 
 Leon Romanovsky <leon@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
 linux-rdma@vger.kernel.org, "Pan, Xinhui" <Xinhui.Pan@amd.com>, 
 =?ISO-8859-15?Q?Christian_K=F6nig?= <christian.koenig@amd.com>, 
 Lukas Wunner <lukas@wunner.de>, 
 Dean Luick <dean.luick@cornelisnetworks.com>
Subject: Re: [PATCH 3/3] RDMA/hfi1: Use RMW accessors for changing LNKCTL2
In-Reply-To: <20240215133155.9198-4-ilpo.jarvinen@linux.intel.com>
Message-ID: <26be3948-e687-f510-0612-abcac5d919af@linux.intel.com>
References: <20240215133155.9198-1-ilpo.jarvinen@linux.intel.com>
 <20240215133155.9198-4-ilpo.jarvinen@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-818284186-1714731515=:1852"
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

--8323328-818284186-1714731515=:1852
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Thu, 15 Feb 2024, Ilpo J=C3=A4rvinen wrote:

> Convert open coded RMW accesses for LNKCTL2 to use
> pcie_capability_clear_and_set_word() which makes its easier to
> understand what the code tries to do.
>=20
> LNKCTL2 is not really owned by any driver because it is a collection of
> control bits that PCI core might need to touch. RMW accessors already
> have support for proper locking for a selected set of registers
> (LNKCTL2 is not yet among them but likely will be in the future) to
> avoid losing concurrent updates.
>=20
> Suggested-by: Lukas Wunner <lukas@wunner.de>
> Signed-off-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
> Reviewed-by: Dean Luick <dean.luick@cornelisnetworks.com>

I found out from Linux RDMA and InfiniBand patchwork that this patch had=20
been silently closed as "Not Applicable". Is there some reason for that?

I was sending this change independently out (among 2 similar ones that=20
already got applied) so I wouldn't need to keep carrying it within my PCIe=
=20
bandwidth controller series. It seemed useful enough as cleanups to stand=
=20
on its own legs w/o requiring it to be part of PCIe bw controller series.

Should I resend the patch or do RDMA/IB maintainers prefer it to remain=20
as a part of PCIe BW controller series?

--=20
 i.

> ---
>  drivers/infiniband/hw/hfi1/pcie.c | 30 ++++++++----------------------
>  1 file changed, 8 insertions(+), 22 deletions(-)
>=20
> diff --git a/drivers/infiniband/hw/hfi1/pcie.c b/drivers/infiniband/hw/hf=
i1/pcie.c
> index 119ec2f1382b..7133964749f8 100644
> --- a/drivers/infiniband/hw/hfi1/pcie.c
> +++ b/drivers/infiniband/hw/hfi1/pcie.c
> @@ -1207,14 +1207,11 @@ int do_pcie_gen3_transition(struct hfi1_devdata *=
dd)
>  =09=09    (u32)lnkctl2);
>  =09/* only write to parent if target is not as high as ours */
>  =09if ((lnkctl2 & PCI_EXP_LNKCTL2_TLS) < target_vector) {
> -=09=09lnkctl2 &=3D ~PCI_EXP_LNKCTL2_TLS;
> -=09=09lnkctl2 |=3D target_vector;
> -=09=09dd_dev_info(dd, "%s: ..new link control2: 0x%x\n", __func__,
> -=09=09=09    (u32)lnkctl2);
> -=09=09ret =3D pcie_capability_write_word(parent,
> -=09=09=09=09=09=09 PCI_EXP_LNKCTL2, lnkctl2);
> +=09=09ret =3D pcie_capability_clear_and_set_word(parent, PCI_EXP_LNKCTL2=
,
> +=09=09=09=09=09=09=09 PCI_EXP_LNKCTL2_TLS,
> +=09=09=09=09=09=09=09 target_vector);
>  =09=09if (ret) {
> -=09=09=09dd_dev_err(dd, "Unable to write to PCI config\n");
> +=09=09=09dd_dev_err(dd, "Unable to change parent PCI target speed\n");
>  =09=09=09return_error =3D 1;
>  =09=09=09goto done;
>  =09=09}
> @@ -1223,22 +1220,11 @@ int do_pcie_gen3_transition(struct hfi1_devdata *=
dd)
>  =09}
> =20
>  =09dd_dev_info(dd, "%s: setting target link speed\n", __func__);
> -=09ret =3D pcie_capability_read_word(dd->pcidev, PCI_EXP_LNKCTL2, &lnkct=
l2);
> +=09ret =3D pcie_capability_clear_and_set_word(dd->pcidev, PCI_EXP_LNKCTL=
2,
> +=09=09=09=09=09=09 PCI_EXP_LNKCTL2_TLS,
> +=09=09=09=09=09=09 target_vector);
>  =09if (ret) {
> -=09=09dd_dev_err(dd, "Unable to read from PCI config\n");
> -=09=09return_error =3D 1;
> -=09=09goto done;
> -=09}
> -
> -=09dd_dev_info(dd, "%s: ..old link control2: 0x%x\n", __func__,
> -=09=09    (u32)lnkctl2);
> -=09lnkctl2 &=3D ~PCI_EXP_LNKCTL2_TLS;
> -=09lnkctl2 |=3D target_vector;
> -=09dd_dev_info(dd, "%s: ..new link control2: 0x%x\n", __func__,
> -=09=09    (u32)lnkctl2);
> -=09ret =3D pcie_capability_write_word(dd->pcidev, PCI_EXP_LNKCTL2, lnkct=
l2);
> -=09if (ret) {
> -=09=09dd_dev_err(dd, "Unable to write to PCI config\n");
> +=09=09dd_dev_err(dd, "Unable to change device PCI target speed\n");
>  =09=09return_error =3D 1;
>  =09=09goto done;
>  =09}
>=20
--8323328-818284186-1714731515=:1852--
