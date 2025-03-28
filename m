Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F04A74E9C
	for <lists+dri-devel@lfdr.de>; Fri, 28 Mar 2025 17:39:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AB7210EA6E;
	Fri, 28 Mar 2025 16:39:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XT6hP72S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A940110EA6E;
 Fri, 28 Mar 2025 16:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743179978; x=1774715978;
 h=from:date:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=rli8gCkSQGB9JpRw0Pa80TvJo0wcWK5OPRHOyfpODsM=;
 b=XT6hP72SR+R9c6gp+mWAWUiDCUKQIN6qyK6PVlFO5GT5JS3YNVQeTmNy
 wcTK1HvZJAhgdD5Lp2yIVJAIMnmYo+KkYfWSDzCu2inYD0+3WQ22BlKvB
 ZyjgCFjMOaHPyQXh3isntjgqkE3EKrC2vVnnhEUrA0Chm0bG73hS1Klvb
 RRpsX+yZcukZkza7gntLEw5oPU4+Ldehws4A66o6gv751q62pI/bm+b/M
 F11/Tr1I80SbWjAI/mJMEV/dBAJrJlj2hkA4rrUkg0nLEeaWsXq1MdvRp
 h61jISfZ/us4QU+jbD/1lWe9Yy+hbgo0TUCH/8mjrm3jThlrYpnzS1KF3 Q==;
X-CSE-ConnectionGUID: gBm2B1AVRfiQ5whVlQ6bKg==
X-CSE-MsgGUID: 6sWnxJguQWquwvg7jvPgLA==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="32153170"
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; d="scan'208";a="32153170"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 09:39:38 -0700
X-CSE-ConnectionGUID: sbJ66p1vQY6AxqAT4flbNA==
X-CSE-MsgGUID: 0ksRt6/wQDu9gNyM9SijuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; d="scan'208";a="162724321"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.43])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 09:39:33 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 28 Mar 2025 18:39:29 +0200 (EET)
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
Subject: Re: [PATCH v6 4/6] PCI/IOV: Check that VF BAR fits within the
 reservation
In-Reply-To: <4959d675-edd8-a296-661c-6a7bd22fbc0d@linux.intel.com>
Message-ID: <77a5558f-fe6f-cba1-4515-c8597ae3c9bb@linux.intel.com>
References: <20250320110854.3866284-1-michal.winiarski@intel.com>
 <20250320110854.3866284-5-michal.winiarski@intel.com>
 <4959d675-edd8-a296-661c-6a7bd22fbc0d@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1549821212-1743179969=:932"
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

--8323328-1549821212-1743179969=:932
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 26 Mar 2025, Ilpo J=C3=A4rvinen wrote:

> On Thu, 20 Mar 2025, Micha=C5=82 Winiarski wrote:
>=20
> > When the resource representing VF MMIO BAR reservation is created, its
> > size is always large enough to accommodate the BAR of all SR-IOV Virtua=
l
> > Functions that can potentially be created (total VFs). If for whatever
> > reason it's not possible to accommodate all VFs - the resource is not
> > assigned and no VFs can be created.
> >=20
> > The following patch will allow VF BAR size to be modified by drivers at
>=20
> "The following patch" sounds to be like you're referring to patch that=20
> follows this description, ie., the patch below. "An upcoming change" is=
=20
> alternative that doesn't suffer from the same problem.
>=20
> > a later point in time, which means that the check for resource
> > assignment is no longer sufficient.
> >=20
> > Add an additional check that verifies that VF BAR for all enabled VFs
> > fits within the underlying reservation resource.
>=20
> So this does not solve the case where the initial size was too large to=
=20
> fix and such VF BARs remain unassigned, right?
>=20
> > Signed-off-by: Micha=C5=82 Winiarski <michal.winiarski@intel.com>
> > ---
> >  drivers/pci/iov.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >=20
> > diff --git a/drivers/pci/iov.c b/drivers/pci/iov.c
> > index cbf335725d4fb..861273ad9a580 100644
> > --- a/drivers/pci/iov.c
> > +++ b/drivers/pci/iov.c
> > @@ -646,8 +646,13 @@ static int sriov_enable(struct pci_dev *dev, int n=
r_virtfn)
> > =20
> >  =09nres =3D 0;
> >  =09for (i =3D 0; i < PCI_SRIOV_NUM_BARS; i++) {
> > +=09=09resource_size_t vf_bar_sz =3D
> > +=09=09=09pci_iov_resource_size(dev,
> > +=09=09=09=09=09      pci_resource_num_from_vf_bar(i));
>=20
> Please add int idx =3D pci_resource_num_from_vf_bar(i);
>=20
> >  =09=09bars |=3D (1 << pci_resource_num_from_vf_bar(i));
> >  =09=09res =3D &dev->resource[pci_resource_num_from_vf_bar(i)];
> > +=09=09if (vf_bar_sz * nr_virtfn > resource_size(res))
> > +=09=09=09continue;
>=20
> Not directly related to this patch, I suspect this could actually try to=
=20
> assign an unassigned resource by doing something like this (perhaps in ow=
n=20
> patch, it doesn't even need to be part of this series but can be sent=20
> later if you find the suggestion useful):
>=20
> =09=09/* Retry assignment if the initial size didn't fit */
> =09=09if (!res->parent && pci_assign_resource(res, idx))
> =09=09=09continue;
>=20
> Although I suspect reset_resource() might have been called for the=20
> resource and IIRC it breaks the resource somehow but it could have been=
=20
> that IOV resources can be resummoned from that state though thanks to=20
> their size not being stored into the resource itself but comes from iov=
=20
> structures.

I realized reset_resource() will zero the flags so it won't work without=20
getting rid of reset_resource() calls first which I've not yet completed.=
=20

And once I get the rebar sizes included into bridge window sizing=20
algorithm, the default size could possibly be shrunk by the resource
fitting/assignment code so the resource assignment should no longer fail=20
just because the initial size was too large. So it shouldn't be necessary=
=20
after that.

> >  =09=09if (res->parent)
> >  =09=09=09nres++;
> >  =09}
> >=20
>=20
>=20

--=20
 i.

--8323328-1549821212-1743179969=:932--
