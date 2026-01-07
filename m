Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2EBCFFE9B
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 21:06:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5059510E614;
	Wed,  7 Jan 2026 20:06:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="NLgidEHi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 705DD10E608;
 Wed,  7 Jan 2026 20:06:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 1714B6001A;
 Wed,  7 Jan 2026 20:06:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 247ACC4CEF1;
 Wed,  7 Jan 2026 20:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1767816369;
 bh=9PIBpB6BT7c2Nly9VamIDqbclUvTqGBanLECbpOqsZU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=NLgidEHia+ljn45TqKKiaI1PqrlkMihQySUaXwHidlJUJPZNGsTIZWluKWXqqW0JD
 pyxhlCbST+uZv3N70zgjUhz9hGOVY0eKuj6ZXXiv5xVYcKWEmySRYVNQZVYzawb7RK
 0/qFXzfy9W/GNVAvifH3407hbK+RS4rtYOs+DkSg=
Date: Wed, 7 Jan 2026 12:06:08 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Jordan Niethe <jniethe@nvidia.com>
Cc: linux-mm@kvack.org, balbirs@nvidia.com, matthew.brost@intel.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 david@redhat.com, ziy@nvidia.com, apopple@nvidia.com,
 lorenzo.stoakes@oracle.com, lyude@redhat.com, dakr@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, rcampbell@nvidia.com,
 mpenttil@redhat.com, jgg@nvidia.com, willy@infradead.org,
 linuxppc-dev@lists.ozlabs.org, intel-xe@lists.freedesktop.org,
 jgg@ziepe.ca, Felix.Kuehling@amd.com
Subject: Re: [PATCH v2 00/11] Remove device private pages from physical
 address space
Message-Id: <20260107120608.5ccd2cc7e4227d2e80028bd9@linux-foundation.org>
In-Reply-To: <20260107091823.68974-1-jniethe@nvidia.com>
References: <20260107091823.68974-1-jniethe@nvidia.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
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

On Wed,  7 Jan 2026 20:18:12 +1100 Jordan Niethe <jniethe@nvidia.com> wrote:

> Today, when creating these device private struct pages, the first step
> is to use request_free_mem_region() to get a range of physical address
> space large enough to represent the devices memory. This allocated
> physical address range is then remapped as device private memory using
> memremap_pages.

Welcome to Linux MM.  That's a heck of an opening salvo ;)

> Needing allocation of physical address space has some problems:
> 
>   1) There may be insufficient physical address space to represent the
>      device memory. KASLR reducing the physical address space and VM
>      configurations with limited physical address space increase the
>      likelihood of hitting this especially as device memory increases. This
>      has been observed to prevent device private from being initialized.  
> 
>   2) Attempting to add the device private pages to the linear map at
>      addresses beyond the actual physical memory causes issues on
>      architectures like aarch64  - meaning the feature does not work there [0].

Can you better help us understand the seriousness of these problems? 
How much are our users really hurting from this?

> Seeking opinions on using the mpfns like this or if a new type would be
> preferred.

Whose opinions?  IOW, can you suggest who you'd like to see review this
work?

> 
> * NOTE: I will need help in testing the driver changes *
> 

Again, please name names ;)  I'm not afraid to prod.


I'm reluctant to add this to mm.git's development/testing branches at
this time.  Your advice on when you think we're ready for that step
would be valuable, thanks.


