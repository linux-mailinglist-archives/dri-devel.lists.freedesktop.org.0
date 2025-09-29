Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D36BA9EC5
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 18:02:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8C3210E465;
	Mon, 29 Sep 2025 16:02:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ev/wvcJc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33F1010E00D;
 Mon, 29 Sep 2025 16:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759161775; x=1790697775;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=sa4vOqStlRWx+pnElXwlq41XYsVMuUc+Fv3EjNwqrl8=;
 b=ev/wvcJcthca34YProv+9Ie1p5gz9O8fB8MzroXMJuFLmEv++6vFVTvb
 uXyGbdYSYy3i+vkR+0Dy82wzn+vIkXWMK/Krd3ikvlFjUJHOK/pxo1j9U
 cuBx3z3yh8tPefh8UM4Z1vz1PgjcoUZ2+jE3yBZ3qp5ipfhf0UnCNcQ24
 YVR2go35TMj1HwLvPucjHEkwcnYN677aN+h4/ASYqJTQoVdMoq6YCfH6F
 8wdE+0fC86J0hhfdSJZ0ynUGQJypc5/EucRXau8i7FMB93yFd11NYN1xI
 vWXdIiF0ou1grYPr5tvDog/qtByvXEK0Fg0zWlAmtTOCi4JLa41NbcL9J A==;
X-CSE-ConnectionGUID: 1MjzeW7WTfe8bmmt2b5WLw==
X-CSE-MsgGUID: PFhQH3eWTC2DHFSZ6QiUyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="64030387"
X-IronPort-AV: E=Sophos;i="6.18,301,1751266800"; d="scan'208";a="64030387"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 09:02:54 -0700
X-CSE-ConnectionGUID: lcRhvZM1R7y6Kq3HHw3jGA==
X-CSE-MsgGUID: 8EWJNpPdT76OhVsFiJbUzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,301,1751266800"; d="scan'208";a="178082855"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO [10.245.245.197])
 ([10.245.245.197])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 09:02:52 -0700
Message-ID: <071c1bedd6fd902da9725c74c1b892c9fe76179c.camel@linux.intel.com>
Subject: Re: [RFC PATCH v2 1/2] dma-buf: Add support for private interconnects
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>
Cc: intel-xe@lists.freedesktop.org, Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Kasireddy Vivek
 <vivek.kasireddy@intel.com>, Simona Vetter	 <simona.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, 	linaro-mm-sig@lists.linaro.org
Date: Mon, 29 Sep 2025 18:02:50 +0200
In-Reply-To: <20250929124535.GI2617119@nvidia.com>
References: <20250926084624.2288-1-thomas.hellstrom@linux.intel.com>
 <20250926084624.2288-2-thomas.hellstrom@linux.intel.com>
 <472f27f0-2f54-45dd-b0a6-3a26b5eec301@amd.com>
 <ef9f4fb1c55bf3e5e6423b2accdccee0607b95ef.camel@linux.intel.com>
 <20250926144128.GD2617119@nvidia.com>
 <765e3449-2eb1-49f5-954e-3bab5a5fc9d1@amd.com>
 <20250926160036.GE2617119@nvidia.com>
 <f33a4344-545a-43f4-9a3b-24bf070d559c@amd.com>
 <20250929124535.GI2617119@nvidia.com>
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

Hi,

On Mon, 2025-09-29 at 09:45 -0300, Jason Gunthorpe wrote:
> On Mon, Sep 29, 2025 at 10:16:30AM +0200, Christian K=C3=B6nig wrote:
>=20
> > The point is that the exporter manages all accesses to it's buffer
> > and there can be more than one importer accessing it at the same
> > time.
> >=20
> > So when an exporter sees that it already has an importer which can
> > only do DMA to system memory it will expose only DMA address to all
> > other importers as well.
>=20
> I would rephrase that, if the exporter supports multiple placement
> options for the memory (VRAM/CPU for example) then it needs to track
> which placement options all its importer support and never place the
> memory someplace an active importer cannot reach.
>=20
> I don't want to say that just because one importer wants to use
> dma_addr_t then all private interconnect options are disabled. If the
> memory is in VRAM then multiple importers using private interconnect
> concurrently with dma_addr_t should be possible.
>=20
> This seems like it is making the argument that the exporter does need
> to know the importer capability so it can figure out what placement
> options are valid.
>=20
> > > I didn't sketch further, but I think the exporter and importer
> > > should
> > > both be providing a compatible list and then in almost all cases
> > > the
> > > core code should do the matching.
> >=20
> > More or less matches my idea. I would just start with the exporter
> > providing a list of how it's buffer is accessible because it knows
> > about other importers and can pre-reduce the list if necessary.
>=20
> I think the importer also has to advertise what it is able to
> support.
> A big point of the private interconnect is that it won't use
> scatterlist so it needs to be a negotiated feature.
>=20
> > > For example, we have some systems with multipath PCI. This could
> > > actually support those properly. The RDMA NIC has two struct
> > > devices
> > > it operates with different paths, so it would write out two
> > > &dmabuf_generic_dma_addr_t's - one for each.
> >=20
> > That is actually something we try rather hard to avoid. E.g. the
> > exporter should offer only one path to each importer.
>=20
> Real systems have multipath. We need to do a NxM negotiation where
> both sides offer all their paths and the best quality path is
> selected.
>=20
> Once the attachment is made it should be one interconnect and one
> stable address within that interconnect.
>=20
> In this example I'd expect the Xe GPU driver to always offer its
> private interconnect and a dma_addr_t based interconnct as both
> exporter and importer. The core code should select one for the
> attachment.
>=20
> > We can of course do load balancing on a round robin bases.
>=20
> I'm not thinking about load balancing, more a 'quality of path'
> metric.

This sounds like it's getting increasingly complex. TBH I think that at
least all fast interconnects we have in the planning for xe either are
fine with falling back to the current pcie-p2p / dma-buf or in worst
case system memory. The virtual interconnect we've been discussing
would probably not be able to fall back at all unless negotiation gets
somehow forwarded to the vm guest.

So I wonder whether for now it's simply sufficient to=20

sg_table_replacement =3D dma_buf_map_interconnect();

if (IS_ERROR(sg_list_replacement)) {
	sg_table =3D dma_buf_map_attachment();
	if (IS_ERROR(sg_table))
		bail();
}

/Thomas




>=20
> Jason

