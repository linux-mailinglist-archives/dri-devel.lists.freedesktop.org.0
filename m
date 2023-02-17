Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7D869AA86
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 12:36:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 055D410EF8B;
	Fri, 17 Feb 2023 11:36:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2853910EF8B
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 11:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676633786; x=1708169786;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=RcmixLTWrDa6SbLihQKhpM4tPDN0XNAd+MSVj6AW8N4=;
 b=ZFfnsFWyzUcEa+EIjAgnzjueQ3EXthralv+SBCW4Z6Q8r2Jout0hOwY5
 4ybqZRKdB6+SW9WK/yBDWjExV6XkciXfRzNO5t01jrIKpvLgW07xnYJmY
 OddHokSv7s3lFoN4XU2g6yj8jVUBBaX+BDYJkzBdlaQhio2GxLxrLyvFG
 9LYzxE320ENBcZ+wo+WC0Mxxlwq1JCdFdTOmrfzsgtHbRQldCKBjGUHDz
 8H1fmSsV6tfNo3+REfRs//kFvRzCoQaj0XDuE6Ez22ORKLrJ1MdU1sQhN
 c+jBSdKEKBxyciDqq8dbmHLFPorRdfzVeybCjBVMDh1gzzFadFBx3l4B4 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="418188463"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; d="scan'208";a="418188463"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2023 03:36:25 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="663846606"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; d="scan'208";a="663846606"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2023 03:36:23 -0800
Date: Fri, 17 Feb 2023 12:36:21 +0100
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH 3/3] drm/debugfs: remove dev->debugfs_list and
 debugfs_mutex
Message-ID: <20230217113621.GD2862577@linux.intel.com>
References: <20230209081838.45273-1-christian.koenig@amd.com>
 <20230209081838.45273-4-christian.koenig@amd.com>
 <Y+4UdBzk6RkQzcsI@phenom.ffwll.local>
 <20230216163757.GK2849548@linux.intel.com>
 <87lekxzgih.fsf@intel.com>
 <20230217103501.GC2862577@linux.intel.com>
 <871qmozhve.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <871qmozhve.fsf@intel.com>
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
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 mcanal@igalia.com, dri-devel@lists.freedesktop.org, mwen@igalia.com,
 mairacanal@riseup.net, maxime@cerno.tech, daniel.vetter@ffwll.ch,
 wambui.karugax@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 17, 2023 at 12:49:41PM +0200, Jani Nikula wrote:
> On Fri, 17 Feb 2023, Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com> wrote:
> > On Thu, Feb 16, 2023 at 07:06:46PM +0200, Jani Nikula wrote:
> >> >
> >> > But should not this the driver responsibility, call drm_debugfs_add_file()
> >> > whenever you are ready to handle operations on added file ?
> >> 
> >> In theory, yes, but in practice it's pretty hard for a non-trivial
> >> driver to maintain that all the conditions are met.
> >
> > Hmmm... 
> >
> >> In i915 we call debugfs register all over the place only after we've
> >> called drm_dev_register(), because it's the only sane way. But it means
> >> we need the init and register separated everywhere, instead of init
> >> adding files to a list to be registered later.
> >
> > Isn't this done this way in i915 only because it was not possible
> > (and still isn't) to call drm_debugfs_create_file() before registration ?
> >
> > I think it's should be ok by i915 subsystem to create it's debugfs
> > files and allow to access to them just after that subsystem init.
> >
> > Or there are some complex dependencies between i915 subsystems,
> > that reading registers from one subsystem will corrupt some
> > other subsystem that did non finish initialization yet?
> 
> That's the point. It's really hard to figure it all out. Why bother?

I see. 

Just hope we could get something simpler to limit debugfs access
before registration: unix hidden file, permissions or other way.
Because current drm_debufs_add_file() implementation looks
really over convoluted to me.

Regards
Stanislaw

