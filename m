Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2006B0ED86
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jul 2025 10:44:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 236D610E0EF;
	Wed, 23 Jul 2025 08:44:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="M/jQIqzd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1399D10E0DE;
 Wed, 23 Jul 2025 08:44:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id E4377A4B4B4;
 Wed, 23 Jul 2025 08:44:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 077C7C4CEF4;
 Wed, 23 Jul 2025 08:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753260257;
 bh=Cj91CGuGavrB/ilqOlKndjatFWOMgTxiTvWRwwSAyXM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=M/jQIqzdz82x0nWSTcq4f0buV83Pk0LJSgQODn5pjrmjpwv5oy9a1d8mvYOCYdVOH
 bdXSPn4PgwRtO9dST3nKHT5TYXR4D0lbuq0VYMy2LK2WQ8tGkqd62MiFZw3E5YA1+V
 APES5GMOW46WRZWXbPOt0PFGaEfxcmpX5ZU7O9INHYCZGqFw/ylFGGERRmyWD2Q5u+
 C0riJKs1eAlwPzfqs69FDmjTezmgWk9NwcQbHqxK4y8D01b28cCc7w3FT3bMoQXkso
 mDdwnRJk7eIzRHR57iMNUzD9DuAxsqerjLb5vvC3jhbdTL1pfEkFX8w1K57J9Sc/r3
 j+tg72bbOJh1Q==
Date: Wed, 23 Jul 2025 11:44:13 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Yonatan Maman <ymaman@nvidia.com>,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Alistair Popple <apopple@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
 Michael Guralnik <michaelgur@nvidia.com>,
 Or Har-Toov <ohartoov@nvidia.com>,
 Daisuke Matsuda <dskmtsd@gmail.com>, Shay Drory <shayd@nvidia.com>,
 linux-mm@kvack.org, linux-rdma@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/5] *** GPU Direct RDMA (P2P DMA) for Device Private
 Pages ***
Message-ID: <20250723084413.GO402218@unreal>
References: <20250718115112.3881129-1-ymaman@nvidia.com>
 <20250720103003.GH402218@unreal>
 <35ff6080-9cb8-43cf-b77a-9ef3afd2ae59@nvidia.com>
 <20250721064904.GK402218@unreal> <aIBfIxVBR/3ig/O/@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aIBfIxVBR/3ig/O/@ziepe.ca>
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

On Wed, Jul 23, 2025 at 01:03:47AM -0300, Jason Gunthorpe wrote:
> On Mon, Jul 21, 2025 at 09:49:04AM +0300, Leon Romanovsky wrote:
> > > In fact, hmm_range_fault doesn't have information about the destination
> > > device that will perform the DMA mapping.
> > 
> > So probably you need to teach HMM to perform page_faults on specific device.
> 
> That isn't how the HMM side is supposed to work, this API is just
> giving the one and only P2P page that is backing the device private.

I know, but somehow you need to say: "please give me p2p pages for
specific device and not random device in the system as it is now".
This is what is missing from my PoV.

Thanks
