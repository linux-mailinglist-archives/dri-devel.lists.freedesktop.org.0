Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C27C35881A
	for <lists+dri-devel@lfdr.de>; Thu,  8 Apr 2021 17:21:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFA216EB37;
	Thu,  8 Apr 2021 15:21:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 443216EB33;
 Thu,  8 Apr 2021 15:21:06 +0000 (UTC)
IronPort-SDR: /9hY2kJBchUDdikTJh0KuVZSH09klTCDAeEk8mPvJ2Bk2vhQe44aI1VdpBxFI1xNX3Wdxeix25
 P+WI/kPKj94g==
X-IronPort-AV: E=McAfee;i="6000,8403,9948"; a="181101090"
X-IronPort-AV: E=Sophos;i="5.82,206,1613462400"; d="scan'208";a="181101090"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2021 08:21:05 -0700
IronPort-SDR: hehMe0RGXXMFw71hVQc9LJCLAVsJL/rHzwvYyTth7IUperK74tJa9PJ3/86FKrUMveYF4OBzB0
 NK0ypqZMLKYA==
X-IronPort-AV: E=Sophos;i="5.82,206,1613462400"; d="scan'208";a="613372126"
Received: from ideak-desk.fi.intel.com ([10.237.68.141])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2021 08:21:02 -0700
Date: Thu, 8 Apr 2021 18:20:59 +0300
From: Imre Deak <imre.deak@intel.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the drm-intel-fixes tree
Message-ID: <20210408152059.GC2374391@ideak-desk.fi.intel.com>
References: <20210326195838.5ad4973b@canb.auug.org.au>
 <20210329090117.6b224931@canb.auug.org.au>
 <20210329182335.GE233691@ideak-desk.fi.intel.com>
 <YG7dPD8NWbHLrFck@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YG7dPD8NWbHLrFck@phenom.ffwll.local>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 08, 2021 at 12:38:52PM +0200, Daniel Vetter wrote:
> On Mon, Mar 29, 2021 at 09:23:35PM +0300, Imre Deak wrote:
> > Hi Stephen,
> > 
> > thanks for the report.
> > 
> > On Mon, Mar 29, 2021 at 09:01:17AM +1100, Stephen Rothwell wrote:
> > > Hi all,
> > > 
> > > On Fri, 26 Mar 2021 19:58:38 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > > >
> > > > After merging the drm-intel-fixes tree, today's linux-next build
> > > > (htmldocs) produced this warning:
> > > > 
> > > > Documentation/gpu/i915:22: /drivers/gpu/drm/i915/intel_runtime_pm.c:423: WARNING: Inline strong start-string without end-string.
> > 
> > The problem seems to be the
> > 
> > 	@ignore_usecount=true
> > 
> > part in __intel_runtime_pm_get_if_active()'s docbook documentation. I
> > can't see the problem with it, it was meant as a reference to the
> > function parameter, granted I'm not sure what's the proper markup syntax
> > for this.
> > 
> > I will follow up with the following change which suppresses the warning
> > and renders the html as expected unless someone can suggest a better
> > way:
> > 
> > - * If @ignore_usecount=true, a reference will be acquired even if there is no
> > + * If @ignore_usecount is true, a reference will be acquired even if there is no
> 
> Yeah you can't just use most pseudo-code in kerneldoc because it's
> interpreted as raw .rst. So would need some .rst quoting of some sorts to
> make it render correctly.
> 
> Usually for pseudo-code I go with blockquotes (started with :: at the end
> of the previous line, plus indenting), that gives you also a nice
> fixed-width font and everything.

Thanks for the info, will read up on the .rst docs and will try to check
make htmldocs before sending patches.

> Aside from the hyperlink stuff plain English works best in the text parts.
> -Daniel
> 
> > 
> > --Imre
> > 
> > > > 
> > > > Introduced by commit
> > > > 
> > > >   8840e3bd981f ("drm/i915: Fix the GT fence revocation runtime PM logic")
> > > 
> > > This warning now exists in Linus' tree.
> > > 
> > > -- 
> > > Cheers,
> > > Stephen Rothwell
> > 
> > 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
