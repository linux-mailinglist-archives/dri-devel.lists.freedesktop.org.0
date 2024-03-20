Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9108B881892
	for <lists+dri-devel@lfdr.de>; Wed, 20 Mar 2024 21:28:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4C5910F8B3;
	Wed, 20 Mar 2024 20:28:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ipA6OV/j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2818D10FB30
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Mar 2024 20:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710966511; x=1742502511;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=19JKsMVbfLQf3JKH5gCamyH6U4qvbAxEWxgXR/6nnkI=;
 b=ipA6OV/jt+KokPZt1OEguxTCdjldNtSLaUnzGU5P95bqnwQWMcsiFWae
 sQsDy4cSdDlRTalwXB+EDI+AOUMRnESh/EFDJYcTylo+Kod7kZMrl26Vf
 6/K1htkFK65YfJQJsN9rILpSTeMJFmaXUHG4aEQBVZSBmSJvgAxatQBB7
 d8a0c+B+k2/t8n6kU9cjZH6vVUob2pSDyWRkCnW/lJYGTmKtzipn1GjLe
 V4oZNp75VXAE68ERi++A4qZvwsRS6p/h3v4EjysEae/TVnfs+aJa/bVbs
 vPeXNrDLWZ1t4jwl5hyKsaFSF6AIdQ0wntfPsLDxTLwoAHmYsXMPeAqoR g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="5776235"
X-IronPort-AV: E=Sophos;i="6.07,141,1708416000"; 
   d="scan'208";a="5776235"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 13:28:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="914678108"
X-IronPort-AV: E=Sophos;i="6.07,141,1708416000"; d="scan'208";a="914678108"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 13:28:27 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1rn2Xx-0000000EgD4-1KZz; Wed, 20 Mar 2024 22:28:25 +0200
Date: Wed, 20 Mar 2024 22:28:25 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Sui Jingfeng <sui.jingfeng@linux.dev>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
 Daniel Scally <djrscally@gmail.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-acpi@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Vladimir Oltean <vladimir.oltean@nxp.com>
Subject: Re: [PATCH] software node: Implement device_get_match_data fwnode
 callback
Message-ID: <ZftG6Q5AaG71dhWq@smile.fi.intel.com>
References: <20240318234222.1278882-1-sui.jingfeng@linux.dev>
 <Zfq85f-Dp1S3CKuG@smile.fi.intel.com>
 <9ced20e0-dfbd-4337-b5df-223b7baffd9e@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9ced20e0-dfbd-4337-b5df-223b7baffd9e@linux.dev>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

On Thu, Mar 21, 2024 at 03:22:05AM +0800, Sui Jingfeng wrote:
> On 2024/3/20 18:39, Andy Shevchenko wrote:
> > On Tue, Mar 19, 2024 at 07:42:22AM +0800, Sui Jingfeng wrote:
> > > This makes it possible to support (and/or test) a few drivers that
> > > originates from DT World on the x86-64 platform. Originally, those
> > > drivers using the of_device_get_match_data() function to get match
> > > data. For example, drivers/gpu/drm/bridge/simple-bridge.c and
> > > drivers/gpu/drm/bridge/display-connector.c. Those drivers works very
> > > well in the DT world, however, there is no counterpart to
> > > of_device_get_match_data() when porting them to the x86 platform,
> > > because x86 CPUs lack DT support.
> > This is not true.
> > 
> > First of all, there is counter part that called device_get_match_data().
> 
> Are you means that the acpi_fwnode_device_get_match_data() implementation?
> As the fwnode API framework has three backend: OF, ACPI, and software node.
> If you are hinting me that the acpi backend has the .device_get_match_data
> implemented. Then you are right.

Yes, for all firmware property providers there is a callback.

> > Second, there *is* DT support for the _selected_ x86 based platforms.
> 
> Yeah, you maybe right again here. I guess you means that some special
> hardware or platform may have a *limited* support?
> 
> Can you pointed it out for study of learning purpose?

Point to what? This arch/x86/kernel/devicetree.c ?

> To speak precisely, there are some drm display bridges drivers are
> lack of the DT support on X86. Those display bridges belong to the
> device drivers catalogs.

Do they support Device Tree? Do you want to enable them in ACPI environment?

> OK, I will update my commit message at the next version if possible,
> and try my best to describe the problem precisely.

Please do.

> > > By replacing it with device_get_match_data() and creating a software
> > > graph that mimics the OF graph, everything else works fine, except that
> > > there isn't an out-of-box replacement for the of_device_get_match_data()
> > > function. Because the software node backend of the fwnode framework lacks
> > > an implementation for the device_get_match_data callback.
> > .device_get_match_data
> > 
> > > Implement device_get_match_data fwnode callback fwnode callback to fill
> > .device_get_match_data
> 
> OK, thanks a lot.
> 
> > > this gap. Device drivers or platform setup codes are expected to provide
> > > a "compatible" string property. The value of this string property is used
> > > to match against the compatible entries in the of_device_id table. Which
> > > is consistent with the original usage style.
> > Why do you need to implement the graph in the board file?
> 
> It can be inside the chip, there is no clear cut.\

Which chip? Flash memory / ROM or you meant something like FPGA here?
For the latter there is another discussion on how to use DT overlays
in ACPI-enabled environments for the FPGA configurations.

> I means that
> the graph(including fwnode graph, OF graph or swnode graph) can
> be used at anywhere. The examples given here may lead you to
> think it is board specific, but it is not limited to board specific.
> 
> fwnode graph, OF graph and swnode graph, all of them are implements
> of the graph. Its common that different hardware vendors bought the
> some IP and has been integrated it into their SoC. So it can be inside
> of the chip if you want *code sharing*.
> 
> 
> Back to the patch itself, we want to keep the three backends aligned as much
> as possible. Is this reasonable enough?

Yes, but it misses details about board files approach. See also above.

...

> > Have you seen this discussion?
> > https://lore.kernel.org/lkml/20230223203713.hcse3mkbq3m6sogb@skbuf/
> 
> I really didn't have seen that thread before this patch is sent,
> I'm a graphic developer, I'm mainly focus on graphics domain.
> 
> Previously, I have implemented similar functionality at the drivers
> layer [1][2]. But as the instances grows,  I realized there is a
> risk to introducing *boilerplate*.  So I send this patch. [1][2] can
> be drop if this patch could be merged.
> 
> [1] https://patchwork.freedesktop.org/patch/575414/?series=129040&rev=1
> 
> [2] https://patchwork.freedesktop.org/patch/575411/?series=129040&rev=1
> 
> 
> After a brief skim,  I guess we encounter similar problems. Oops!
> In a nutshell, there is a need to *emulation* on X86 platform,
> to suit the need of device-driver coding style of DT world.

What does "emulation" mean? Can you elaborate a bit?

> Besides, at the swnode backend layer, we should not call
> fwnode_property_read_string(), instead, we should usethe
> property_entry_read_string_array() function. Because the
> fwnode_property_read_string() is belong to upper layer.
> While backend implementations should call functions from
> bottom layer only.

-- 
With Best Regards,
Andy Shevchenko


