Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A5B870278
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 14:18:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FF99112142;
	Mon,  4 Mar 2024 13:18:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="ZKGcdBwF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D06C5112142
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 13:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1709558278;
 bh=1h8aiX5VnqQawt4bSP+D9PCxzdPI4JLFpt76nfcwGOA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ZKGcdBwFDGncoD1//gsG88oG+Rmi5MwVwIeHkYz008pNNYZc9jZnsjDxK5vY9soNg
 z1U6WAneqS17hN5+4x1P4ms+I+WT4/7x/xeoeehGFSlhZWkJdDuepGMSc4RKUSeszB
 92WxvH2Mgp2sKQ3jc0EsbuNxypYXC70DKq6kTpkwdmzRG6CoRCBx1bU495GLMHHAC0
 5fxFk9RmK7MvI65T6Btna+vf359kewOXq1JH8GlzM9bMpiovzIPcsgIrEoe1nIMZHV
 IKaQ79x5GXvUL9lsmXfmM3pkHXO4dFgsDYPUFQg2bwQehzUyynAW9JiUoZ2QR4anWM
 kJ094EyL8dI4Q==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 171173780629;
 Mon,  4 Mar 2024 13:17:58 +0000 (UTC)
Date: Mon, 4 Mar 2024 14:17:56 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Liviu Dudau <liviu.dudau@arm.com>
Cc: Steven Price <steven.price@arm.com>, dri-devel@lists.freedesktop.org,
 kernel@collabora.com, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 2/3] drm/panthor: Explicitly include page.h for the
 {virt,__phys)_to_pfn() defs
Message-ID: <20240304141756.25e32f54@collabora.com>
In-Reply-To: <ZeWtoNjlHanzybMd@e110455-lin.cambridge.arm.com>
References: <20240304090812.3941084-1-boris.brezillon@collabora.com>
 <20240304090812.3941084-3-boris.brezillon@collabora.com>
 <ZeWtoNjlHanzybMd@e110455-lin.cambridge.arm.com>
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

On Mon, 4 Mar 2024 11:16:48 +0000
Liviu Dudau <liviu.dudau@arm.com> wrote:

> On Mon, Mar 04, 2024 at 10:08:11AM +0100, Boris Brezillon wrote:
> > Something on arm[64] must be including <asm/page.h>, but things fail
> > to compile on sparc64. Make sure this header is included explicitly
> > so this driver can be compile-tested on all supported architectures.  
> 
> Is compilation on sparc64 possible because of 'depends on COMPILE_TEST'?

Yes.

> Otherwise it doesn't make sense to try to build this for any arch other
> than arm[64].
> 
> Regardless, patch looks harmless, so
> 
> Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
> 
> Best regards,
> Liviu
> 
> > 
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202403031142.Vl4pW7X6-lkp@intel.com/
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > ---
> >  drivers/gpu/drm/panthor/panthor_device.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
> > index bfe8da4a6e4c..68e467ee458a 100644
> > --- a/drivers/gpu/drm/panthor/panthor_device.c
> > +++ b/drivers/gpu/drm/panthor/panthor_device.c
> > @@ -3,6 +3,8 @@
> >  /* Copyright 2019 Linaro, Ltd, Rob Herring <robh@kernel.org> */
> >  /* Copyright 2023 Collabora ltd. */
> >  
> > +#include <asm/page.h>
> > +
> >  #include <linux/clk.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/pm_domain.h>
> > -- 
> > 2.43.0
> >   
> 

