Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DACF5B2E95
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 08:16:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD06F10E9D6;
	Fri,  9 Sep 2022 06:16:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64EE910E9D6;
 Fri,  9 Sep 2022 06:16:26 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0EEFDB801BF;
 Fri,  9 Sep 2022 06:16:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D0AAC433D6;
 Fri,  9 Sep 2022 06:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1662704183;
 bh=7vM/aobjefk60GKtw9qjSIfcrBRW4nRM9ykmOr2RN3E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cbuonHfr5+O2QVs13Q8v6t6xNf02dFCJhxUsg3GlIXeAcopHlGpc6keW4wgn0DSQu
 W77TVxcuAa7RZ0fiYVaJrchKYNY53vCvxUzijPZL9AXYtFHRqp6AH+b1LRZ3gBW2Bx
 MGIIwpZGqWY40S8Pqdl0/acKfZ/MUBOIPHP3vwfI=
Date: Fri, 9 Sep 2022 08:16:21 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH v4 06/15] mei: pxp: support matching with a gfx discrete
 card
Message-ID: <YxraNUiyfH6NJiq5@kroah.com>
References: <20220909001612.728451-1-daniele.ceraolospurio@intel.com>
 <20220909001612.728451-7-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220909001612.728451-7-daniele.ceraolospurio@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 Tomas Winkler <tomas.winkler@intel.com>, dri-devel@lists.freedesktop.org,
 Vitaly Lubart <vitaly.lubart@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 08, 2022 at 05:16:03PM -0700, Daniele Ceraolo Spurio wrote:
> From: Tomas Winkler <tomas.winkler@intel.com>
> 
> With on-boards graphics card, both i915 and MEI
> are in the same device hierarchy with the same parent,
> while for discrete gfx card the MEI is its child device.
> Adjust the match function for that scenario
> by matching MEI parent device with i915.
> 
> V2:
>  1. More detailed commit message
>  2. Check for dev is not null before it is accessed.
> 
> Signed-off-by: Tomas Winkler <tomas.winkler@intel.com>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Vitaly Lubart <vitaly.lubart@intel.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> ---
>  drivers/misc/mei/pxp/mei_pxp.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/misc/mei/pxp/mei_pxp.c b/drivers/misc/mei/pxp/mei_pxp.c
> index 17c5d201603f..afc047627800 100644
> --- a/drivers/misc/mei/pxp/mei_pxp.c
> +++ b/drivers/misc/mei/pxp/mei_pxp.c
> @@ -159,17 +159,24 @@ static int mei_pxp_component_match(struct device *dev, int subcomponent,
>  {
>  	struct device *base = data;
>  
> +	if (!dev)
> +		return 0;

How can that happen?

> +
>  	if (!dev->driver || strcmp(dev->driver->name, "i915") ||

That's crazy to assume, but whatever :(

>  	    subcomponent != I915_COMPONENT_PXP)
>  		return 0;
>  
>  	base = base->parent;
> -	if (!base)
> +	if (!base) /* mei device */

Why does this mean that?

Where is that documented?

>  		return 0;
>  
> -	base = base->parent;
> -	dev = dev->parent;
> +	base = base->parent; /* pci device */

Again, why is this the case?

> +	/* for dgfx */
> +	if (base && dev == base)
> +		return 1;
>  
> +	/* for pch */
> +	dev = dev->parent;

You are digging through a random device tree and assuming that you
"know" what the topology is going to be, that feels very very fragile
and ripe for problems going forward.

How do you ensure that this really is they way the tree is for ALL
systems?

thanks,

greg k-h
