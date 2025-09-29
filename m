Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD99CBA8635
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 10:25:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D8A410E225;
	Mon, 29 Sep 2025 08:25:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UM54KxuS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2B7D10E225;
 Mon, 29 Sep 2025 08:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759134311; x=1790670311;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=SkljFC53J8twn2X6cXUMB3XSIOvCtrGLWbPUzii5Oss=;
 b=UM54KxuS7tnzkLBcSzLUrJFwensbBTz1Te4pmK3dCUfWQ7z+4/Zewd/D
 ACqyjQep39cAV91h+6e/Rnt1juXBBL9o8W6UybuBV6jbXin883Q7KH1pI
 HnEvbXBbnMf+5I7Js4Ueof2yQJFG6yMZYW/N7pYKBai7Bi+MtLKN5f8ah
 kS0HuDMO5LOmrNnCYwqatH3c11eIRmh9B47JwPbx0MdVDW3rI6bcQm0OY
 62BhnwCMdZGNQdBTVN+XH5s4IVeWod+5Zp5kuFjBmjr/nNEkmmkQ7pmnd
 baQtLffRnFOLLjDzma88DwLowfuYKgdBKoToTWIPbs8Wtrc8Q8HEphcFU Q==;
X-CSE-ConnectionGUID: vtwc28SjSd6h90ssiRgtbA==
X-CSE-MsgGUID: r1LhzpLdQ3yaq8zkUGmulw==
X-IronPort-AV: E=McAfee;i="6800,10657,11567"; a="71617571"
X-IronPort-AV: E=Sophos;i="6.18,301,1751266800"; d="scan'208";a="71617571"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 01:25:11 -0700
X-CSE-ConnectionGUID: oBV59mbYQf2bxdiXMpjNew==
X-CSE-MsgGUID: Dm+G7RNJT/6nFeaAElQvZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,301,1751266800"; d="scan'208";a="178234154"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO [10.245.245.197])
 ([10.245.245.197])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 01:25:09 -0700
Message-ID: <42520738dbc23174181db7d31d55de56996fba88.camel@linux.intel.com>
Subject: Re: [RFC PATCH v2 1/2] dma-buf: Add support for private interconnects
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Jason
 Gunthorpe <jgg@nvidia.com>
Cc: intel-xe@lists.freedesktop.org, Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Kasireddy Vivek
 <vivek.kasireddy@intel.com>, Simona Vetter	 <simona.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, 	linaro-mm-sig@lists.linaro.org
Date: Mon, 29 Sep 2025 10:25:06 +0200
In-Reply-To: <a5ffd1ee-b0b5-40bd-b68f-3779ca70dcae@amd.com>
References: <20250926084624.2288-1-thomas.hellstrom@linux.intel.com>
 <20250926084624.2288-2-thomas.hellstrom@linux.intel.com>
 <472f27f0-2f54-45dd-b0a6-3a26b5eec301@amd.com>
 <ef9f4fb1c55bf3e5e6423b2accdccee0607b95ef.camel@linux.intel.com>
 <20250926144128.GD2617119@nvidia.com>
 <765e3449-2eb1-49f5-954e-3bab5a5fc9d1@amd.com>
 <20250926160036.GE2617119@nvidia.com>
 <d3cc5b7fe4189c6f529b532273ece34c9c0e975f.camel@linux.intel.com>
 <a5ffd1ee-b0b5-40bd-b68f-3779ca70dcae@amd.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-2.fc41) 
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

On Mon, 2025-09-29 at 10:20 +0200, Christian K=C3=B6nig wrote:
> On 29.09.25 10:16, Thomas Hellstr=C3=B6m wrote:
> > On Fri, 2025-09-26 at 13:00 -0300, Jason Gunthorpe wrote:
> > > On Fri, Sep 26, 2025 at 04:51:29PM +0200, Christian K=C3=B6nig wrote:
> > > > On 26.09.25 16:41, Jason Gunthorpe wrote:
> > > > > On Fri, Sep 26, 2025 at 03:51:21PM +0200, Thomas Hellstr=C3=B6m
> > > > > wrote:
> > > > >=20
> > > > > > Well both exporter and exporter has specific information
> > > > > > WRT
> > > > > > this. The
> > > > > > ultimate decision is done in the exporter attach()
> > > > > > callback,
> > > > > > just like
> > > > > > pcie_p2p. And the exporter acknowledges that by setting the
> > > > > > dma_buf_attachment::interconnect_attach field. In analogy
> > > > > > with
> > > > > > the
> > > > > > dma_buf_attachment::peer2peer member.
> > > > >=20
> > > > > Having a single option seems too limited to me..
> > > >=20
> > > > Yeah, agree.
> > > >=20
> > > > > I think it would be nice if the importer could supply a list
> > > > > of
> > > > > 'interconnects' it can accept, eg:
> > > > >=20
> > > > > =C2=A0- VRAM offset within this specific VRAM memory
> > > > > =C2=A0- dma_addr_t for this struct device
> > > > > =C2=A0- "IOVA" for this initiator on a private interconnect
> > > > > =C2=A0- PCI bar slice
> > > > > =C2=A0- phys_addr_t (used between vfio, kvm, iommufd)
> > > >=20
> > > > I would rather say that the exporter should provide the list of
> > > > what
> > > > interconnects the buffer might be accessible through.
> > >=20
> > > Either direction works, I sketched it like this because I thought
> > > there were more importers than exporters, and in the flow it is
> > > easy
> > > for the importer to provide a list on the stack
> > >=20
> > > I didn't sketch further, but I think the exporter and importer
> > > should
> > > both be providing a compatible list and then in almost all cases
> > > the
> > > core code should do the matching.
> > >=20
> > > If the importer works as I showed, then the exporter version
> > > would be
> > > in an op:
> > >=20
> > > int exporter_negotiate_op(struct dma_buf *dmabuf,
> > > =C2=A0=C2=A0 struct dma_buf_interconnect_negotiation *importer_suppor=
t,
> > > size_t
> > > importer_len)
> > > {
> > > =C2=A0=C2=A0=C2=A0=C2=A0 struct dma_buf_interconnect_negotiation expo=
rter_support[2]
> > > =3D {
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [0] =3D {.interconne=
ct =3D myself->xe_vram},
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [1] =3D {.interconne=
ct =3D &dmabuf_generic_dma_addr_t,
> > > .interconnect_args =3D exporter_dev},
> > > =C2=A0=C2=A0=C2=A0=C2=A0 };
> > > =C2=A0=C2=A0=C2=A0=C2=A0 return dma_buf_helper_negotiate(dmabuf, expo=
rter_support,
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 ARRAY_SIZE(exporter_support), importer_support,
> > > importer_len);
> > > }
> > >=20
> > > Which the dma_buf_negotiate() calls.
> > >=20
> > > The core code does the matching generically, probably there is a
> > > struct dma_buf_interconnect match() op it uses to help this
> > > process.
> > >=20
> > > I don't think importer or exporter should be open coding any
> > > matching.
> > >=20
> > > For example, we have some systems with multipath PCI. This could
> > > actually support those properly. The RDMA NIC has two struct
> > > devices
> > > it operates with different paths, so it would write out two
> > > &dmabuf_generic_dma_addr_t's - one for each.
> > >=20
> > > The GPU would do the same. The core code can have generic code to
> > > evaluate if P2P is possible and estimate some QOR between the
> > > options.
> >=20
> > This sounds OK with me. I have some additional questions, though,
> >=20
> > 1) Everybody agrees that the interconnect used is a property of the
> > attachment? It should be negotiated during attach()?
>=20
> Yes, attach allows the exporter to know who wants to access it's
> buffer.
>=20
> Map/unmap then requests the actual location where the exporter has
> moved the buffer so that it is accessible by everybody.
>=20
> > 2) dma-buf pcie-p2p allows transparent fallback to system memory
> > dma-
> > buf. I think that is a good thing to keep even for other
> > interconnects
> > (if possible). Like if someone wants to pull the network cable, we
> > could trigger a move_notify() and on next map() we'd fall back. Any
> > ideas around this?
>=20
> We already do that if new importers come along.
>=20
> E.g. you have a connection which can do PCIe P2P and then suddenly
> somebody attaches which can only do DMA to system memory. In that
> situation we use move_notify to move the buffer into system memory
> and imports re-map it to grasp the new location.

Sure, Just wandering whether we should document and require that also
for fast interconnects. So that if we use a new map_attachment()
function, like was suggested ealier, if that fails, the importer should
ideally retry with the old one to get an sg-list to system memory?

Thanks,
Thomas


>=20
> Regards,
> Christian.
>=20
> >=20
> > Thanks,
> > Thomas
> >=20
> >=20
> >=20
> > >=20
> > > Jason
> >=20
>=20

