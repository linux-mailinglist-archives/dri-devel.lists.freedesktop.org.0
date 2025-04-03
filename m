Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6EE1A7A084
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 11:54:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 965DC10E991;
	Thu,  3 Apr 2025 09:54:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bFzT12Nt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A66910E990;
 Thu,  3 Apr 2025 09:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743674096; x=1775210096;
 h=from:date:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=4aLRfN57w9gzYeMIUFZ1CreUx/4uJrM+2z5ByxW5EGs=;
 b=bFzT12Nt9dslMvu07bR3cLjt/fVQhkGGPAKKxQ63NUufFka4fJ8oxecM
 fNXIXhzauvxjbZ+vkAPsBqzHZOEhEysYQzJzKcmw+Cq4Z6Gq0goynPFVM
 ScmmcltwNMWt3JR20ufjUWl43UmNQ9+iNkOxSN2eRRb7mh/UrXiLVcNlz
 nl2CjRin7HYhew4jGY24UBNdPQhoTpikx/61LI+d5uHAnF6bgFlX7R3/s
 1O4NvKt32UdHTlraMNtK59NK5iwzSjCSx2eoYTT4JuwVDeeXlE2r/hGui
 h3uDDj9i0krnyRWm9y7jl1rhexykZ3nJhvMXLBYMCVCgRt1K0rd+ebwVI g==;
X-CSE-ConnectionGUID: ulEQ3WI4R9GJ2m1UEA5tqg==
X-CSE-MsgGUID: Fbb0ohgoRC6+0aohl/G2GA==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="45197221"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="45197221"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 02:54:56 -0700
X-CSE-ConnectionGUID: /c3TGysPSg6RF7ARnplGBw==
X-CSE-MsgGUID: WQuuYpJoT9S6C/he/aCgvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="150158033"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.152])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 02:54:51 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 3 Apr 2025 12:54:47 +0300 (EEST)
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
Subject: Re: [PATCH v7 4/6] PCI/IOV: Check that VF BAR fits within the
 reservation
In-Reply-To: <20250402141122.2818478-5-michal.winiarski@intel.com>
Message-ID: <308209c2-508e-19d1-a5aa-9c8a8af68b23@linux.intel.com>
References: <20250402141122.2818478-1-michal.winiarski@intel.com>
 <20250402141122.2818478-5-michal.winiarski@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1411218873-1743674087=:1302"
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

--8323328-1411218873-1743674087=:1302
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 2 Apr 2025, Micha=C5=82 Winiarski wrote:

> When the resource representing VF MMIO BAR reservation is created, its
> size is always large enough to accommodate the BAR of all SR-IOV Virtual
> Functions that can potentially be created (total VFs). If for whatever
> reason it's not possible to accommodate all VFs - the resource is not
> assigned and no VFs can be created.
>=20
> An upcoming change will allow VF BAR size to be modified by drivers at
> a later point in time, which means that the check for resource
> assignment is no longer sufficient.
>=20
> Add an additional check that verifies that VF BAR for all enabled VFs
> fits within the underlying reservation resource.
>=20
> Signed-off-by: Micha=C5=82 Winiarski <michal.winiarski@intel.com>
> ---
>  drivers/pci/iov.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/pci/iov.c b/drivers/pci/iov.c
> index fee99e15a943f..2fafbd6a998f0 100644
> --- a/drivers/pci/iov.c
> +++ b/drivers/pci/iov.c
> @@ -668,9 +668,12 @@ static int sriov_enable(struct pci_dev *dev, int nr_=
virtfn)
>  =09nres =3D 0;
>  =09for (i =3D 0; i < PCI_SRIOV_NUM_BARS; i++) {
>  =09=09int idx =3D pci_resource_num_from_vf_bar(i);
> +=09=09resource_size_t vf_bar_sz =3D pci_iov_resource_size(dev, idx);
> =20
>  =09=09bars |=3D (1 << idx);
>  =09=09res =3D &dev->resource[idx];
> +=09=09if (vf_bar_sz * nr_virtfn > resource_size(res))
> +=09=09=09continue;
>  =09=09if (res->parent)
>  =09=09=09nres++;
>  =09}
>=20

Reviewed-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.

--8323328-1411218873-1743674087=:1302--
