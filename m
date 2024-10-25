Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C759B0261
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 14:31:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1A0510EA8C;
	Fri, 25 Oct 2024 12:31:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="IgaGPFfk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4A1F10EA8C
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 12:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1729859510;
 bh=msp8mzHoL4DQwXpjyctpfR/k+WEDyE0Pk/NxEqt2mvo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=IgaGPFfk08mIqEf3c1meSNOb5iYdESPRUoL9HNrIJJqkVOlao0ubkeiz93BbatDZ8
 60FtHY26G1A6UnzU1cu30gcw/Wy/sHq5T/wO0qbcVdYJPw5YihsWyvspQUYeQnwfiP
 blzCv/k1QPCknH4D4C0Qeuvg5h7aZsNT4nQHQP5jF/udYUsJA0kqx0ZQDVRjjbfoeD
 6EWJ2wBWHJmXEGTXzLhmk6BxY/tCt8EUS99FdsLUROXejC16cQridQpr5+j5EkGY54
 2PUGZjI+tauLBgerQXFwV+AqZOB+hE+z4+Iex4P74Uifi4RwxWb/bib6XaeMkYn3A+
 q2rbV4ZCgjdDg==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 853A117E35F4;
 Fri, 25 Oct 2024 14:31:49 +0200 (CEST)
Date: Fri, 25 Oct 2024 14:31:44 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Liviu Dudau <liviu.dudau@arm.com>
Cc: Akash Goel <akash.goel@arm.com>, Robin Murphy <robin.murphy@arm.com>,
 steven.price@arm.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, mihail.atanassov@arm.com,
 ketil.johnsen@arm.com, florent.tomasin@arm.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, nd@arm.com
Subject: Re: [PATCH 1/3] drm/panthor: Update memattr programing to align
 with GPU spec
Message-ID: <20241025143144.625df2b7@collabora.com>
In-Reply-To: <Zxtj0B3BrMYDt9ID@e110455-lin.cambridge.arm.com>
References: <20241024145432.934086-1-akash.goel@arm.com>
 <20241024145432.934086-2-akash.goel@arm.com>
 <20241024174944.4e811816@collabora.com>
 <Zxtj0B3BrMYDt9ID@e110455-lin.cambridge.arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Fri, 25 Oct 2024 10:24:32 +0100
Liviu Dudau <liviu.dudau@arm.com> wrote:

> On Thu, Oct 24, 2024 at 05:49:44PM +0200, Boris Brezillon wrote:
> > +Robin for the MMU details
> > 
> > On Thu, 24 Oct 2024 15:54:30 +0100
> > Akash Goel <akash.goel@arm.com> wrote:
> >   
> > > Mali GPU Arch spec forbids the GPU PTEs to indicate Inner or Outer
> > > shareability when no_coherency protocol is selected. Doing so results in
> > > unexpected or undesired snooping of the CPU caches on some platforms,
> > > such as Juno FPGA, causing functional issues. For example the boot of
> > > MCU firmware fails as GPU ends up reading stale data for the FW memory
> > > pages from the CPU's cache. The FW memory pages are initialized with
> > > uncached mapping when the device is not reported to be dma-coherent.
> > > The shareability bits are set to inner-shareable when IOMMU_CACHE flag
> > > is passed to map_pages() callback and IOMMU_CACHE flag is passed by
> > > Panthor driver when memory needs to be mapped as cached on the GPU side.
> > > 
> > > IOMMU_CACHE seems to imply cache coherent and is probably not fit for
> > > purpose for the memory that is mapped as cached on GPU side but doesn't
> > > need to remain coherent with the CPU.  
> > 
> > Yeah, IIRC I've been abusing the _CACHE flag to mean GPU-cached, not
> > cache-coherent. I think it be good to sit down with Rob and add the
> > necessary IOMMU_ flags so we can express all the shareability and
> > cacheability variants we have with the "Mali" MMU. For instance, I
> > think the shareability between MCU/GPU can be expressed properly at the
> > moment, and we unconditionally map things uncached because of that.  
> 
> Boris, did you mean to say "shareability between MCU/GPU *can't* be expressed
> properly" ? Currently the sentence reads a bit strange, as if there was a
> negation somewhere.

Yes, sorry, I meant "can't".
