Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5488687E9D4
	for <lists+dri-devel@lfdr.de>; Mon, 18 Mar 2024 14:08:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9680E10E1D2;
	Mon, 18 Mar 2024 13:08:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="vGRozkTj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CA1B10E1D2
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Mar 2024 13:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1710767297;
 bh=SnAKMgM1EBF6N1x++NISuDhonukjQwL7rTEfMeIow+0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=vGRozkTj2rkGNWeh+anT1OPdoCbCItKqnVxt6JyGe3gZDl+cbiN2gp3EpBHpG7tZI
 xEPfL2C9UHv/DRgJBXzXHxvU2Lomv80EZUtu9h7qussKYXQ4XWdI+X7OCcHVNSmq3o
 oVoxUCWvK4L71sZ01y/sFn0Q8+0MoUV/Ca5bLmhBCvuZufGCK1sf0nxSClL8vA3va7
 rUYBXETeVWEx+xJ1zQiQJZEGZEaerwBIMZwciKxHFJ5aCtHS1HubARf5FhNqUY9UD/
 3hqwLRRa9vE3xFSUC2P6gxTwTgu4KS708P2PVtu3PYIEBeQ0LRQV8+bc3cE6MrCwQQ
 G6MzJ8HLYcl/w==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id EDB083780A0B;
 Mon, 18 Mar 2024 13:08:16 +0000 (UTC)
Date: Mon, 18 Mar 2024 14:08:15 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>, dri-devel@lists.freedesktop.org,
 Robin Murphy <robin.murphy@arm.com>, kernel@collabora.com, kernel test
 robot <lkp@intel.com>
Subject: Re: [PATCH] drm/panthor: Fix the CONFIG_PM=n case
Message-ID: <20240318140815.44de8110@collabora.com>
In-Reply-To: <2af13565-f3d7-47c3-8083-da86669a34e1@arm.com>
References: <20240318085855.994179-1-boris.brezillon@collabora.com>
 <2af13565-f3d7-47c3-8083-da86669a34e1@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
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

On Mon, 18 Mar 2024 11:31:05 +0000
Steven Price <steven.price@arm.com> wrote:

> On 18/03/2024 08:58, Boris Brezillon wrote:
> > Putting a hard dependency on CONFIG_PM is not possible because of a
> > circular dependency issue, and it's actually not desirable either. In
> > order to support this use case, we forcibly resume at init time, and
> > suspend at unplug time.
> > 
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202403031944.EOimQ8WK-lkp@intel.com/
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>  
> 
> Reviewed-by: Steven Price <steven.price@arm.com>
> 
> > ---
> > Tested by faking CONFIG_PM=n in the driver (basically commenting
> > all pm_runtime calls, and making the panthor_device_suspend/resume()
> > calls unconditional in the panthor_device_unplug/init() path) since
> > CONFIG_ARCH_ROCKCHIP selects CONFIG_PM. Seems to work fine, but I
> > can't be 100% sure this will work correctly on a platform that has
> > CONFIG_PM=n.  
> 
> The same - I can't test this properly :(
> 
> Note that the other option (which AFAICT doesn't cause any problems) is
> to "select PM" rather than depend on it - AIUI the 'select' dependency
> is considered in the opposite direction by kconfig so won't cause the
> dependency loop.

Doesn't seem to work with COMPILE_TEST though? I mean, we need
something like

	depends on ARM || ARM64 || (COMPILE_TEST && PM)
	...
	select PM

but kconfig doesn't like that

drivers/gpu/drm/panthor/Kconfig:3:error: recursive dependency detected!
drivers/gpu/drm/panthor/Kconfig:3:	symbol DRM_PANTHOR depends on
PM kernel/power/Kconfig:183:	symbol PM is selected by DRM_PANTHOR

which id why I initially when for a depends on PM


> Of course if there is actually anyone who has a
> platform which can be built !CONFIG_PM then that won't help. But the
> inability of anyone to actually properly test this configuration does
> worry me a little.

Well, as long as it doesn't regress the PM behavior, I think I'm happy
to take the risk. Worst case scenario, someone complains that this is
not working properly when they do the !PM bringup :-).
