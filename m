Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E63A5F5DF
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 14:24:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C9D110E88F;
	Thu, 13 Mar 2025 13:24:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dz+Vjr8P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFBCF10E88F
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 13:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741872263; x=1773408263;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=jCDe7Wc94ba6aJ/MFQbCu86uV8l1MOm2WI7qny2btIY=;
 b=dz+Vjr8Pivx9Y9nQrD3GImA/al6j1qkNuqv6IN4+fSUOYN5asyJsVJTs
 RexsZbuSqHR7JIBM2eEjTNVhUuF2Nfv7QxBeD19LHA6JJEAJiSy5QlV98
 7LXq6cAG/29audJVmC/VFyBlADh/I5NAxGn1rrqQZGFUrqT/8hWd+skwZ
 H0YaqRQtPN0dGEbMibUxfwhEu/3xRckWr50NOPeHxsno6yO3L+zkdmNtO
 jOx+sPzf7QLbiRDq2ip3DDqq3HG2GpKrPokUFwbo3ItGawHaUG/MlIF4C
 aABH5deocTQU1VO+ZgnYeJ1M9ylXJee5DiYy87gwCQ4mSrBdPcomsmNDg w==;
X-CSE-ConnectionGUID: pBdc15zeRn26dXz7k3bCrQ==
X-CSE-MsgGUID: AWBy1mJDTHGF+XoQMdJaTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="60387869"
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; d="scan'208";a="60387869"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2025 06:24:22 -0700
X-CSE-ConnectionGUID: P2b3MLySQXqccd5C+UEwdw==
X-CSE-MsgGUID: 6BtBIRMqRfu7WFaTVmO00g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; d="scan'208";a="125833934"
Received: from smile.fi.intel.com ([10.237.72.58])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2025 06:24:17 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1tsiXl-00000002BIs-16K9; Thu, 13 Mar 2025 15:24:13 +0200
Date: Thu, 13 Mar 2025 15:24:13 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Aditya Garg <gargaditya08@live.com>
Cc: Petr Mladek <pmladek@suse.com>, Kees Cook <kees@kernel.org>,
 Sven Peter <sven@svenpeter.dev>, Thomas Zimmermann <tzimmermann@suse.de>,
 Aun-Ali Zaidi <admin@kodeit.net>, Maxime Ripard <mripard@kernel.org>,
 "airlied@redhat.com" <airlied@redhat.com>, Simona Vetter <simona@ffwll.ch>,
 Steven Rostedt <rostedt@goodmis.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Jonathan Corbet <corbet@lwn.net>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "apw@canonical.com" <apw@canonical.com>,
 "joe@perches.com" <joe@perches.com>,
 "dwaipayanray1@gmail.com" <dwaipayanray1@gmail.com>,
 "lukas.bulwahn@gmail.com" <lukas.bulwahn@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 Hector Martin <marcan@marcan.st>,
 "asahi@lists.linux.dev" <asahi@lists.linux.dev>
Subject: Re: [PATCH 1/2] lib/vsprintf: Add support for generic FourCCs by
 extending %p4cc
Message-ID: <Z9LcfW8H_0YudtdC@smile.fi.intel.com>
References: <ff3a9c58-5c7a-4c48-8a9e-cc828a43baed@app.fastmail.com>
 <PN3PR01MB9597E5C609290DB1A967263CB8D02@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <Z9HgVn-XELC065w0@smile.fi.intel.com>
 <47AE7FCD-0F30-4379-ADE9-090A15ACD58F@live.com>
 <Z9Kb8zMJgmSP-rgD@smile.fi.intel.com>
 <PN3PR01MB959780176C0B16C36FBD59C3B8D32@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <Z9KdzZUxs3vlwp0Z@smile.fi.intel.com>
 <PN3PR01MB9597A8F02423B9E4C585F5EBB8D32@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <Z9K36SRz7Ja_AyQb@pathway.suse.cz>
 <D1A20E79-554E-4E91-BE47-B6493BDC3823@live.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <D1A20E79-554E-4E91-BE47-B6493BDC3823@live.com>
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

On Thu, Mar 13, 2025 at 11:06:54AM +0000, Aditya Garg wrote:
> > On 13 Mar 2025, at 4:18 PM, Petr Mladek <pmladek@suse.com> wrote:
> > On Thu 2025-03-13 09:13:23, Aditya Garg wrote:
> >>> On 13 Mar 2025, at 2:27 PM, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> >>> On Thu, Mar 13, 2025 at 08:53:28AM +0000, Aditya Garg wrote:
> >>>>>> On 13 Mar 2025, at 2:19 PM, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> >>>>> On Thu, Mar 13, 2025 at 07:26:05AM +0000, Aditya Garg wrote:
> >>>>>>>> On 13 Mar 2025, at 12:58 AM, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> >>>>>>> On Wed, Mar 12, 2025 at 07:14:36PM +0000, Aditya Garg wrote:
> >>>>>>>>> On 12 Mar 2025, at 9:05 PM, Sven Peter <sven@svenpeter.dev> wrote:
> >>>>>>>>> On Wed, Mar 12, 2025, at 13:03, Aditya Garg wrote:

...

> >>>>>>>>> I don't have a strong opinion either way: for SMC I just need to print
> >>>>>>>>> FourCC keys for debugging / information in a few places.
> >>>>>>>>> 
> >>>>>>>>> I'm preparing the SMC driver for upstreaming again (after a two year delay :-()
> >>>>>>>>> and was just going to use macros to print the SMC FourCC keys similar to
> >>>>>>>>> DRM_MODE_FMT/DRM_MODE_ARG for now to keep the series smaller and revisit
> >>>>>>>>> the topic later.
> >>>>>>>>> 
> >>>>>>>>> Right now I have these in my local tree (only compile tested so far):
> >>>>>>>>> 
> >>>>>>>>> #define SMC_KEY_FMT "%c%c%c%c (0x%08x)"
> >>>>>>>>> #define SMC_KEY_ARG(k) (k)>>24, (k)>>16, (k)>>8, (k), (k)
> >>>>>>>> 
> >>>>>>>> That seems to be a nice alternative, which I guess Thomas was also suggesting.
> >>>>>>> 
> >>>>>>> I don't think it's "nice". Each of the approaches has pros and cons.
> >>>>>>> You can start from bloat-o-meter here and compare it with your %p extension.
> >>>>>>> 
> >>>>>>> Also, can you show the bloat-o-meter output for the vsprintf.c?
> >>>>>> 
> >>>>>> Here are your outputs:
> >>>>> 
> >>>>> Thank you!
> >>>>> 
> >>>>>> ---------------------------------------------------------------------
> >>>>>> For appletbdrm:
> >>>>>> 
> >>>>>> aditya@MacBook:~/linux$ ./scripts/bloat-o-meter $P4 $MACRO
> >>>>>> add/remove: 0/0 grow/shrink: 1/1 up/down: 64/-19 (45)
> >>>>>> Function                                     old     new   delta
> >>>>>> appletbdrm_read_response                     395     459     +64
> >>>>>> appletbdrm_probe                            1786    1767     -19
> >>>>>> Total: Before=13418, After=13463, chg +0.34%
> >>>>> 
> >>>>> This is enough, no need to repeat this for every parameter.
> >>>>> 
> >>>>>> ---------------------------------------------------------------------
> >>>>>> For vsprintf:
> >>>>>> 
> >>>>>> aditya@MacBook:~/linux$ ./scripts/bloat-o-meter $OLD $NEW
> >>>>>> add/remove: 0/0 grow/shrink: 1/0 up/down: 220/0 (220)
> >>>>>> Function                                     old     new   delta
> >>>>>> fourcc_string                                479     699    +220
> >>>>>> Total: Before=26454, After=26674, chg +0.83%
> >>>>> 
> >>>>> So, we get +220 bytes vs +43 bytes. It means if we found 5+ users, it worth
> >>>>> doing.
> >>>> 
> >>>> Will it also depend upon the number of times it's being used? In appletbdrm,
> >>>> it is being used 3 times. Probably more in Asahi SMC.
> >>> 
> >>> Right, it depends on the usage count. Also on different architectures it may
> >>> give different results. On 32-bit it probably gives better statistics.
> >> 
> >> Best to go ahead with vsprintf then. Petr, are you still there?
> > 
> > I am here but there were many other things in the queue ;-)
> > 
> > I do not have strong opinion. I am not familiar with the FourCC
> > format and it looks like a magic to me. But it seems that it makes
> > sense for the users.
> > 
> > I personally find the %pcX modifiers a bit less hacky than
> > the two macros SMC_KEY_FMT/SMC_KEY_ARG.
> > 
> > So I am fine with this patch:
> > 
> > Reviewed-by: Petr Mladek <pmladek@suse.com>
> > Tested-by: Petr Mladek <pmladek@suse.com>
> > 
> > 
> > Now, the question is how to get this patch into the mainline.
> > 
> > Normally, it would make perfect sense to queue it via the DRM tree
> > because drivers/gpu/drm/tiny/appletbdrm.c is a new driver...
> > 
> > But this time there is a conflicting patchset which is reworking
> > the entire lib/test_printf.c file, see
> > 20250307-printf-kunit-convert-v6-0-4d85c361c241@gmail.com
> 
> Link seems to be broken

It works fine. Because it's not a link, it's Message-ID, you need to add
https://lore.kernel.org/r/ in front of it.

> > And it will likely be ready for the next merge window as well.
> > I am going to review it right away.
> > 
> > It is even more complicated because the patchset converting
> > the printf test module to KUNIT depends on another changes
> > in Kees' tree (moving kunit test modules to lib/tests/).
> > So it might be easier when it goes via Kees' tree.
> > 
> > And it might be easier when even this patch goes via Kees' tree.
> > 
> > My proposal:
> > 
> > I suggest to separate the fourcc_pointer() test update
> > to a separate patch and add it later after the merge window
> > when things settle down.
> > 
> > I mean to send the vsprintf.c, checkpatch.pl, and doc update
> > via DRM tree together with the new appletbdrm.c driver.
> 
> Sounds good. At least we can get it working. I’ll make sure the self
> tests get updated once 6.15-rc1 gets released, or Kees can share
> his tree, where I can add the tests as well.
> 
> I’ll send a v2 so that Thomas can take them up.
> > 
> > And update the selftest later when both DRM tree and KUNIT
> > update reaches mainline.
> > 
> > How does that sound, please?

To me sounds good, but I'm not a maintainer involved in all this :-)

-- 
With Best Regards,
Andy Shevchenko


