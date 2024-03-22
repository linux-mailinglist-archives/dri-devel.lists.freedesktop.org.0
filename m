Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A4D887287
	for <lists+dri-devel@lfdr.de>; Fri, 22 Mar 2024 19:05:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD7821126C0;
	Fri, 22 Mar 2024 18:05:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M8FjFOe7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB70C1126C0
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Mar 2024 18:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711130722; x=1742666722;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Sr8qlp+dafIZsh6gctDQrKjtvyDofM3L54GsW+PpnLE=;
 b=M8FjFOe7BYYF/jbDEtAWFMCpGVtlRuJ+rGFHHYarE/04bhzo9ZrfgWAO
 6aWlVjlHFdS7JrzXyf9Gc9MEP5J3XrZ/RlfcmWsIgmgCdfA5nr26kZcT1
 vDt+kzCs3+q53G9cCajAHk4GwsfZfmAbD7LSHWijjDX1PU+BMsE8Sq6h8
 JJhXJd9VPjGvDquvjYt1vnrnaNZNVI9siziQukVVvnv8org9JbNdNx2LV
 N88GpifYLyyNKckB86pCijO/65ZVqdOetX1erSpJG6mGgUoQCW32ato+h
 K6SlmHWmAHr6Q/yL0LUCkrqQMqz4FqdREuQmj1fN3CT7Aj/P+982Ll/sY w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="28670758"
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; d="scan'208";a="28670758"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 11:05:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="914750688"
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; d="scan'208";a="914750688"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 11:05:18 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1rnjGV-0000000FENx-2tUk; Fri, 22 Mar 2024 20:05:15 +0200
Date: Fri, 22 Mar 2024 20:05:15 +0200
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
Message-ID: <Zf3IWyrW8IZLTg4x@smile.fi.intel.com>
References: <20240318234222.1278882-1-sui.jingfeng@linux.dev>
 <Zfq85f-Dp1S3CKuG@smile.fi.intel.com>
 <9ced20e0-dfbd-4337-b5df-223b7baffd9e@linux.dev>
 <ZftG6Q5AaG71dhWq@smile.fi.intel.com>
 <9644da91-f367-4083-a3e4-4d0677c8cbca@linux.dev>
 <Zf2uUwcMgIpo6rVh@smile.fi.intel.com>
 <6bf102a4-6419-4083-8918-4f7c76cfa9a1@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6bf102a4-6419-4083-8918-4f7c76cfa9a1@linux.dev>
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

On Sat, Mar 23, 2024 at 01:43:56AM +0800, Sui Jingfeng wrote:
> On 2024/3/23 00:14, Andy Shevchenko wrote:
> > On Fri, Mar 22, 2024 at 05:00:05PM +0800, Sui Jingfeng wrote:
> > > On 2024/3/21 04:28, Andy Shevchenko wrote:

...

> > > > > > > By replacing it with device_get_match_data() and creating a software
> > > > > > > graph that mimics the OF graph, everything else works fine, except that
> > > > > > > there isn't an out-of-box replacement for the of_device_get_match_data()
> > > > > > > function. Because the software node backend of the fwnode framework lacks
> > > > > > > an implementation for the device_get_match_data callback.
> > > > > > .device_get_match_data
> > > > > > 
> > > > > > > Implement device_get_match_data fwnode callback fwnode callback to fill
> > > > > > .device_get_match_data
> > > > > OK, thanks a lot.
> > > > > 
> > > > > > > this gap. Device drivers or platform setup codes are expected to provide
> > > > > > > a "compatible" string property. The value of this string property is used
> > > > > > > to match against the compatible entries in the of_device_id table. Which
> > > > > > > is consistent with the original usage style.
> > > > > > Why do you need to implement the graph in the board file?
> > > > > It can be inside the chip, there is no clear cut.\
> > > > Which chip? Flash memory / ROM or you meant something like FPGA here?
> > > > For the latter there is another discussion on how to use DT overlays
> > > > in ACPI-enabled environments for the FPGA configurations.
> > > There are some hardware resource or software entity is created on the
> > > driver runtime. But DT or DT overlays are compiled before device driver
> > > get loaded. GPIO-emulated-I2C is just an example, this is kind of driver
> > > level knowledge on the runtime. With the GPIO or programmable some
> > > hardware IP unit, device driver authors can change the connection relationship
> > > at their will at the runtime. While with DT, every thing has to be sure
> > > before the compile time.
> > > 
> > > DT overlays can be a alternative solution, but this doesn't conflict with
> > > this patch. This patch won't assume how device drives go to use it, and
> > > allow device driver creating device instead enumerating by DT. In one
> > > word: "flexibility".
> > Software nodes in general for the device driver / platform quirks.
> 
> The real problem is that we probably shouldn't make an assumption
> how does the user is going to use the infrastructure, right?
> 
> You could say it is *mostly* for quirks or whatever, Like the
> ./drivers/i2c/busses/i2c-cht-wc.c. But software nodes *can* also
> be something else.
> 
> Can we stop restricting its usage by limited understanding or someone
> personal judgement?

Please, try to research the topic before calling it 'personal judgement'.

59abd83672f7 ("drivers: base: Introducing software nodes to the firmware node framework")

(Read the first paragraph carefully.)

Let's say it's not personal, it's by design. Extending this to cover more needs
a good justification. I do not see a such.

> A workaround or quirk may be enough for some corner usage. Vladimir is also
> encounter similar problem, right?

> > They are not designed for what you are talking about here.
> 
> I have never hint anything about any real applications, the materials
> and/or talk given here is just for example purpose.
> 
> What we are doing here is to keep the three back-ends aligned.
> 
> 
> > Consider using SSDT / DT overlays instead.
> > 
> NAK,
> 
> When developers are doing task 'A' , reviewers ask them to do task 'B'.
> And when developers doing task 'B', reviewers then recommend that the tool
> 'C'  is a better alternative.
> ...
> ...
> 
> This is not good.
> 
> 
> As I have read the lengthy thread in link [1] as you pointed to me.
> 
> The boring coding review is just as the following scheme:
> 
> 1) Asking details about what they do with software nodes impolitely.
> 2) Wasting time to talk about irreverent things by brute force.
> 3) Tell everybody that software nodes are not designed for what you application.
> 4) Recommending DT overlays or something else.
> 
> Again, this is non-technical discussion, the time being wasting is not worthwhile.
> And the judgements being given is irrelevant to the *patch itself*.

The patch tries to tight the driver data to the device description provided by
a software node, which is 100% equivalent to the legacy board files which we
do NOT want to have. Besides that, the kernel project rule is "we do not add
the dead (unused) code".

I believe these two is quite enough to NAK patch.

You may come with a better explanation AND a user of this in the same series.
People at least can see your use case.

> [1] https://lore.kernel.org/lkml/20230223203713.hcse3mkbq3m6sogb@skbuf/

-- 
With Best Regards,
Andy Shevchenko


