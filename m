Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B9234D6EE
	for <lists+dri-devel@lfdr.de>; Mon, 29 Mar 2021 20:23:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A63786E4B1;
	Mon, 29 Mar 2021 18:23:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1881E6E4B1;
 Mon, 29 Mar 2021 18:23:42 +0000 (UTC)
IronPort-SDR: +e8/UwgbuVMh4zT6HaD9mSsOd8ITaPaDW2etupiZ+ISOGMxdICIa3JMG4wFmXp6V4NMR2MroRI
 HC+0qvbujlSg==
X-IronPort-AV: E=McAfee;i="6000,8403,9938"; a="179144565"
X-IronPort-AV: E=Sophos;i="5.81,288,1610438400"; d="scan'208";a="179144565"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2021 11:23:41 -0700
IronPort-SDR: PfbSoC5Bfjr/c97hjEXpMdg4SIvj++py/gb8iqdJksfVrBWn1O/QAVuo+dY3pZW/DjNl+AYJuS
 qsbz0BxiZcyw==
X-IronPort-AV: E=Sophos;i="5.81,288,1610438400"; d="scan'208";a="417789074"
Received: from ideak-desk.fi.intel.com ([10.237.68.141])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2021 11:23:38 -0700
Date: Mon, 29 Mar 2021 21:23:35 +0300
From: Imre Deak <imre.deak@intel.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build warning after merge of the drm-intel-fixes tree
Message-ID: <20210329182335.GE233691@ideak-desk.fi.intel.com>
References: <20210326195838.5ad4973b@canb.auug.org.au>
 <20210329090117.6b224931@canb.auug.org.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210329090117.6b224931@canb.auug.org.au>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Stephen,

thanks for the report.

On Mon, Mar 29, 2021 at 09:01:17AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> On Fri, 26 Mar 2021 19:58:38 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > After merging the drm-intel-fixes tree, today's linux-next build
> > (htmldocs) produced this warning:
> > 
> > Documentation/gpu/i915:22: /drivers/gpu/drm/i915/intel_runtime_pm.c:423: WARNING: Inline strong start-string without end-string.

The problem seems to be the

	@ignore_usecount=true

part in __intel_runtime_pm_get_if_active()'s docbook documentation. I
can't see the problem with it, it was meant as a reference to the
function parameter, granted I'm not sure what's the proper markup syntax
for this.

I will follow up with the following change which suppresses the warning
and renders the html as expected unless someone can suggest a better
way:

- * If @ignore_usecount=true, a reference will be acquired even if there is no
+ * If @ignore_usecount is true, a reference will be acquired even if there is no

--Imre

> > 
> > Introduced by commit
> > 
> >   8840e3bd981f ("drm/i915: Fix the GT fence revocation runtime PM logic")
> 
> This warning now exists in Linus' tree.
> 
> -- 
> Cheers,
> Stephen Rothwell


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
