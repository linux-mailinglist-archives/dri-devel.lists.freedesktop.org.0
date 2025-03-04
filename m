Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FCE0A4E1DD
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 15:54:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56F6F10E60E;
	Tue,  4 Mar 2025 14:54:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="trU6zHvY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A1BA10E60E
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 14:54:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id AF5495C5E07;
 Tue,  4 Mar 2025 14:52:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 793E0C4CEE7;
 Tue,  4 Mar 2025 14:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741100073;
 bh=6QVcC4GPVMSItVqHqjY2/nKc5H0HnVp+/D7NkRyhohw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=trU6zHvYUjZCBj8Ced0tD9DPJmg6FubXk0qnSnB3Kr0MtE0OzU47Sami3rZ+q1eL7
 JJhqUbpYYPYAw5GMGVuGX8/z9p9S5okXMhsgtdVK4wxFBLWdQ6Pyg+gMziT00LPfRW
 MB6DCpDlfQlpjhNa9JFOUA7XotD78kijgsNnNp+bEvqwfOFPPZuRlA+mLWOjbK0xrd
 pXLatuDsXiVGd2vLHKpi3xL4Ea4UnmHaeasSnHHD8kMeXb0+QFK0BpdH4T1/fyEKUQ
 bznCslahq2nqmlMavlh2prD6+UjZIQ3udYGsCtYQsMldhZ5sOrHi6cnLZGycFEBs0y
 0k8wbdsqtT1jA==
Date: Tue, 4 Mar 2025 16:54:28 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>,
 "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 Wei Lin Guay <wguay@meta.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 Dag Moxnes <dagmoxnes@meta.com>, "kbusch@kernel.org" <kbusch@kernel.org>,
 Nicolaas Viljoen <nviljoen@meta.com>, Oded Gabbay <ogabbay@kernel.org>,
 Simona Vetter <simona.vetter@ffwll.ch>, Maor Gottlieb <maorg@nvidia.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH 0/4] cover-letter: Allow MMIO regions to be exported
 through dmabuf
Message-ID: <20250304145428.GH1955273@unreal>
References: <20241216095920.237117-1-wguay@fb.com>
 <IA0PR11MB7185FDD56CFDD0A2B8D21468F83B2@IA0PR11MB7185.namprd11.prod.outlook.com>
 <924671F4-E8B5-4007-BE5D-29ED58B95F46@meta.com>
 <IA0PR11MB71858B2E59D3A9F58CEE83DCF8052@IA0PR11MB7185.namprd11.prod.outlook.com>
 <61DF4F0E-D947-436B-9160-A40079DB9085@meta.com>
 <IA0PR11MB7185E7DBB9E959A2F40D4170F8C22@IA0PR11MB7185.namprd11.prod.outlook.com>
 <20250226133822.GA28425@nvidia.com>
 <0d471fca-b64c-4392-88ee-d26dbfe3cf2d@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0d471fca-b64c-4392-88ee-d26dbfe3cf2d@amd.com>
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

On Tue, Mar 04, 2025 at 03:29:42PM +0100, Christian König wrote:
> Am 26.02.25 um 14:38 schrieb Jason Gunthorpe:
> > On Wed, Feb 26, 2025 at 07:55:07AM +0000, Kasireddy, Vivek wrote:
> >
> >>> Is there any update or ETA for the v3? Are there any ways we can help?
> >> I believe Leon's series is very close to getting merged. Once it
> >> lands, this series can be revived.
> > The recent drama has made what happens next unclear.
> >
> > I would like it if interested parties could contribute reviews to
> > Leon's v7 series to help it along.
> 
> I think demonstrating how any new interface would work with the existing importers/exporters would help.

Unfortunately, it is huge waste of time given current situation where
even basic building blocks are not merged yet [1].

We do see clear path to fix dmabuf, see this roadmap [2].

[1] https://lore.kernel.org/all/20250302085717.GO53094@unreal/
[2] https://lore.kernel.org/linux-rdma/20250122071600.GC10702@unreal/T/#u

Thanks
