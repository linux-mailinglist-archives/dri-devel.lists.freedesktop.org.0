Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 585C3A468B8
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 18:59:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7C6310E99C;
	Wed, 26 Feb 2025 17:59:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lXuwToHr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C525F10E99C
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 17:59:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 62B3B5C7421;
 Wed, 26 Feb 2025 17:59:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E4D2C4CED6;
 Wed, 26 Feb 2025 17:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740592787;
 bh=FAao1ArBUjOSbdvK4PI/C2hB0X0+HSnv2BqKHijQvUk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lXuwToHrVpustm5dMKnZy6IHuCei7nxBQxh4Do5n6sbZhL0ILxcycGb0e6rbASQyJ
 LTKfuQBmeO0XPQbFJImzPOtJpPU/ugMFosDfNlEo/CvSXOz2+Qhu7E9vGMt56ZqCSX
 s5WN6OVik4AwjnJpA1IbPd2rKHb4lD0SelvCMzRQUukQ+G0pLKaezRNL6Mo83iyYg1
 d7GPML3+56SpbfdjR17O92bFhm2qU43vpCi+LO83FmiWCYtniF6AVvRY8veN79vWvy
 QKHWp7GRMcFo+N16kxPqRZIU5uOku0shBij4WlAkuC/EhkiYPJG655s8Anbzzmg7+R
 7aPPW6A9Ov1+A==
Date: Wed, 26 Feb 2025 19:59:43 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 Wei Lin Guay <wguay@meta.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 Dag Moxnes <dagmoxnes@meta.com>, "kbusch@kernel.org" <kbusch@kernel.org>,
 Nicolaas Viljoen <nviljoen@meta.com>, Oded Gabbay <ogabbay@kernel.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Simona Vetter <simona.vetter@ffwll.ch>, Maor Gottlieb <maorg@nvidia.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH 0/4] cover-letter: Allow MMIO regions to be exported
 through dmabuf
Message-ID: <20250226175943.GL53094@unreal>
References: <20241216095920.237117-1-wguay@fb.com>
 <IA0PR11MB7185FDD56CFDD0A2B8D21468F83B2@IA0PR11MB7185.namprd11.prod.outlook.com>
 <924671F4-E8B5-4007-BE5D-29ED58B95F46@meta.com>
 <IA0PR11MB71858B2E59D3A9F58CEE83DCF8052@IA0PR11MB7185.namprd11.prod.outlook.com>
 <61DF4F0E-D947-436B-9160-A40079DB9085@meta.com>
 <IA0PR11MB7185E7DBB9E959A2F40D4170F8C22@IA0PR11MB7185.namprd11.prod.outlook.com>
 <20250226133822.GA28425@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250226133822.GA28425@nvidia.com>
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

On Wed, Feb 26, 2025 at 09:38:22AM -0400, Jason Gunthorpe wrote:
> On Wed, Feb 26, 2025 at 07:55:07AM +0000, Kasireddy, Vivek wrote:
> 
> > > Is there any update or ETA for the v3? Are there any ways we can help?
> 
> > I believe Leon's series is very close to getting merged. Once it
> > lands, this series can be revived.
> 
> The recent drama has made what happens next unclear.
> 
> I would like it if interested parties could contribute reviews to
> Leon's v7 series to help it along.

Link to v7 https://lore.kernel.org/all/cover.1738765879.git.leonro@nvidia.com/

Thanks
