Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9107595D93A
	for <lists+dri-devel@lfdr.de>; Sat, 24 Aug 2024 00:26:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 693A410E120;
	Fri, 23 Aug 2024 22:26:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XBJEO9LG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDC7C10E11E;
 Fri, 23 Aug 2024 22:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724451971; x=1755987971;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=nFCmcyWBNkUmUbcMv6Gry2QmSh0z4TFjzHzRH0W/IYU=;
 b=XBJEO9LG76tv6oyUb+opOUka4sq41CylfpKXCmLymYjh9VeI5/locgM/
 Tbt8s78raMdz+pBOyS5yDmC5AXgrsHxTLfzJREP93KswKO/xcI0pNPFOJ
 tEc4ugAWxA05sLU6lIrse1WfT8CUrKWhlk5RmICZhxh8tA4eFxpvRyOsl
 zymphg4EX5WRpptGIBOlk9nAdsfDdCN75GyELemv+qu13jKfIY5F3Wgf1
 IsIocMEbjcM+u8dDGYpsWo0H7rJ2MLaAY4XoXdG9OhlOjrNlASC1QuPK6
 UrSbugACu5IBBRu2NFkUv071Pz9zZgoD624pHSZv2oUAbim+4Vs0rOyj1 g==;
X-CSE-ConnectionGUID: oltwGf/aSSahSSONE2iUbQ==
X-CSE-MsgGUID: kg/aKX+2QEiy9prKVr8+ww==
X-IronPort-AV: E=McAfee;i="6700,10204,11173"; a="34108299"
X-IronPort-AV: E=Sophos;i="6.10,171,1719903600"; d="scan'208";a="34108299"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2024 15:26:11 -0700
X-CSE-ConnectionGUID: y+WD1y9hR3GRkOVDN/IzIg==
X-CSE-MsgGUID: BS5esO+XSgWsp1ei122MrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,171,1719903600"; d="scan'208";a="66636429"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.236])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2024 15:26:07 -0700
Date: Sat, 24 Aug 2024 00:26:04 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Chris Wilson <chris.p.wilson@linux.intel.com>
Subject: Re: [PATCH] drm/i915/gt: Continue creating engine sysfs files even
 after a failure
Message-ID: <ZskMfOwgVYpVbsqa@ashyti-mobl2.lan>
References: <20240819113140.325235-1-andi.shyti@linux.intel.com>
 <ZsUJIFVKuIX_pbDw@intel.com> <ZsWYIBsuFKAqVpIS@ashyti-mobl2.lan>
 <ZsiRi0i80gRqTOIg@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZsiRi0i80gRqTOIg@intel.com>
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

Hi Rodrigo,

On Fri, Aug 23, 2024 at 09:41:31AM -0400, Rodrigo Vivi wrote:
> On Wed, Aug 21, 2024 at 09:32:48AM +0200, Andi Shyti wrote:
> > On Tue, Aug 20, 2024 at 05:22:40PM -0400, Rodrigo Vivi wrote:
> > > On Mon, Aug 19, 2024 at 01:31:40PM +0200, Andi Shyti wrote:
...
> > > > It might make sense to create an "inv-<engine_name>" if something
> > > > goes wrong, so that the user is aware that the engine exists, but
> > > > the sysfs file is not present.
> > > 
> > > well, if the sysfs dir/files creation is failing, then it will
> > > probably be unreliable anyway right?
> > 
> > Are you suggesting that "inv-<engine_name>" is OK?
> 
> it is okay I guess.
> But my point is more on, how are we going to create this if
> the creation mechanism is what is likely failing here.

We can fail for different reasons... but yeah you are right, it
doesn't make much sense, as also the creation of "inv-<...>"
interfaces might be unreliable.

> > > Also it looks something is off with the goto paths...
> > > 
> > > That if (0) is also ugly... probably better to use a
> > > kobject_put with continue on every failing point as well...
> > 
> > ehehe... I came to like it, to be honest. Besides I like single
> > exit paths instead of distributed returns. In this particular
> > case we would replcate the same "kobject_put() ... dev_warn()" in
> > several places, so that I'm not sure it's better.
> > 
> > If you like more we could do:
> > 
> > 	for (...) {
> > 		...
> > 		...
> > 		/* everything goes fine */
> > 		continue
> > 
> > err_engine:
> > 		kobject_put(...);
> > 		dev_warn(...);
> > 	}
> > 
> > And we avoid using the "if (0)" that you don't like.
> 
> nah, no strong feeling from my side. It is there, let's
> avoid unnecessary refactors.
> 
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> on this patch as is. And sorry for the delay.

Thanks a lot for your review :-)

Andi
