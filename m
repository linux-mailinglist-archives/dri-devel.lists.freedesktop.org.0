Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F63C4D4F8
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 12:08:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C81F10E552;
	Tue, 11 Nov 2025 11:08:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q1CORbZf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BDCE10E552;
 Tue, 11 Nov 2025 11:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762859326; x=1794395326;
 h=from:date:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=tSSxs4SRCVrhf+9y3subQDg/bxFJRtJk39gNDsVo8VU=;
 b=Q1CORbZfnN//rK+Md3s6hbXI4w2HqrK3eiU0+yNGXXHtgIPXU3NDJ3lL
 6frmFVCrabdcNC/4yxz+saaLKNYionW1/n4hi4cAiaZSPXxcybMhj6DXb
 kmKxpef3c1V8xqdCjTKHI6IBZznzPjto/Eg5m88PL4YbK8+PjYKhnbFsH
 rKXQyChzJ3qtAGhFCSS2YbeTucU+7wfMxPY8ydsa7FoZhkV4tVLex+qL0
 TKQ4IPWOaBhev1lMNkewRDX66PQu2BwK0a3fPcuj1lnkS6BM8vDImun0k
 tVuk6ujbwKoevZka+a7bC7MmoJmTSNpFxXoGnlnlMN/WDXp7/i8FddD3Y A==;
X-CSE-ConnectionGUID: 3Nu1wWrcTfqEpFkUAfsY2A==
X-CSE-MsgGUID: T65uZy9bSLWVE2Pa5/w1dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="68780216"
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; d="scan'208";a="68780216"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2025 03:08:45 -0800
X-CSE-ConnectionGUID: Bo0n7HhxSVizVjm/+57XOg==
X-CSE-MsgGUID: czyw2sN5Tm2Vo1qc7SCbWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; d="scan'208";a="226198918"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.132])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2025 03:08:39 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 11 Nov 2025 13:08:35 +0200 (EET)
To: =?ISO-8859-15?Q?Christian_K=F6nig?= <christian.koenig@amd.com>
cc: =?ISO-8859-15?Q?Alex_Benn=E9e?= <alex.bennee@linaro.org>, 
 Simon Richter <Simon.Richter@hogyros.de>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org, 
 Bjorn Helgaas <bhelgaas@google.com>, David Airlie <airlied@gmail.com>, 
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 linux-pci@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Simona Vetter <simona@ffwll.ch>, Tvrtko Ursulin <tursulin@ursulin.net>, 
 =?ISO-8859-15?Q?Thomas_Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>, 
 =?ISO-8859-2?Q?Micha=B3_Winiarski?= <michal.winiarski@intel.com>, 
 LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 8/9] drm/amdgpu: Remove driver side BAR release before
 resize
In-Reply-To: <c90f155f-44fe-4144-af68-309531392d22@amd.com>
Message-ID: <aaaf27cf-5de0-c4ef-0758-59849878a99f@linux.intel.com>
References: <20251028173551.22578-1-ilpo.jarvinen@linux.intel.com>
 <20251028173551.22578-9-ilpo.jarvinen@linux.intel.com>
 <c90f155f-44fe-4144-af68-309531392d22@amd.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-480724837-1762859315=:1002"
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

--8323328-480724837-1762859315=:1002
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 11 Nov 2025, Christian K=C3=B6nig wrote:

> Sorry for the late reply I'm really busy at the moment.
>=20
> On 10/28/25 18:35, Ilpo J=C3=A4rvinen wrote:
> > PCI core handles releasing device's resources and their rollback in
> > case of failure of a BAR resizing operation. Releasing resource prior
> > to calling pci_resize_resource() prevents PCI core from restoring the
> > BARs as they were.
>=20
> I've intentionally didn't do it this way because at least on AMD HW we=20
> could only release the VRAM and doorbell BAR (both 64bit), but not the=20
> register BAR (32bit only).
>=20
> This patch set looks like the right thing in general, but which BARs are=
=20
> now released by pci_resize_resource()?
>=20
> If we avoid releasing the 32bit BAR as well then that should work,=20
> otherwise we will probably cause problems.

After these changes, pci_resize_resource() releases BARs that share the=20
bridge window with the BAR to be resized. So the answer depends on the=20
upstream bridge.

However, amdgpu_device_resize_fb_bar() also checks that root bus has a
resource with a 64-bit address. That won't tell what the nearest bridge=20
has though. Maybe that check should be converted to check the resources of=
=20
the nearest bus instead? It would make it impossible to have the=20
32-bit resource share the bridge window with the 64-bit resources so the=20
resize would be safe.

Thanks a lot for checking this out!

--=20
 i.

> Regards,
> Christian.
>=20
> >=20
> > Remove driver-side release of BARs from the amdgpu driver.
> >=20
> > Also remove the driver initiated assignment as pci_resize_resource()
> > should try to assign as much as possible. If the driver side call
> > manages to get more required resources assigned in some scenario, such
> > a problem should be fixed inside pci_resize_resource() instead.
> >=20
> > Signed-off-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
> > ---
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 8 +-------
> >  1 file changed, 1 insertion(+), 7 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/d=
rm/amd/amdgpu/amdgpu_device.c
> > index 7a899fb4de29..65474d365229 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > @@ -1729,12 +1729,8 @@ int amdgpu_device_resize_fb_bar(struct amdgpu_de=
vice *adev)
> >  =09pci_write_config_word(adev->pdev, PCI_COMMAND,
> >  =09=09=09      cmd & ~PCI_COMMAND_MEMORY);
> > =20
> > -=09/* Free the VRAM and doorbell BAR, we most likely need to move both=
=2E */
> > +=09/* Tear down doorbell as resizing will release BARs */
> >  =09amdgpu_doorbell_fini(adev);
> > -=09if (adev->asic_type >=3D CHIP_BONAIRE)
> > -=09=09pci_release_resource(adev->pdev, 2);
> > -
> > -=09pci_release_resource(adev->pdev, 0);
> > =20
> >  =09r =3D pci_resize_resource(adev->pdev, 0, rbar_size);
> >  =09if (r =3D=3D -ENOSPC)
> > @@ -1743,8 +1739,6 @@ int amdgpu_device_resize_fb_bar(struct amdgpu_dev=
ice *adev)
> >  =09else if (r && r !=3D -ENOTSUPP)
> >  =09=09dev_err(adev->dev, "Problem resizing BAR0 (%d).", r);
> > =20
> > -=09pci_assign_unassigned_bus_resources(adev->pdev->bus);
> > -
> >  =09/* When the doorbell or fb BAR isn't available we have no chance of
> >  =09 * using the device.
> >  =09 */
>=20
--8323328-480724837-1762859315=:1002--
