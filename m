Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 059015EFB3B
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 18:47:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9444410EAC3;
	Thu, 29 Sep 2022 16:46:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05D1A10E61D;
 Thu, 29 Sep 2022 16:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664470008; x=1696006008;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=fBbdNADC85MnM4nWzTQ1ZPxOGkqpvuHTPqhCZMdkZkw=;
 b=Lm7KRPfar7Yx3gTAf/Sk/bBCyfCkZuLDCXgm/EX6LbUHT2+qxOklZ3lE
 h1W8A48f19iC3iR66qlu+TMGhlbRbp8yOvSXFdmebl7WZeJ1vZfy8rKE3
 ZsRvKRMLYruCQEJOFrX9wAkzGHsLgUTZqyJVCRxnzy6jMMzKXNYTR39P1
 Ba6QomNqpzIZg7lXiJZCSNrq8u9uAMwzMdBcO5kBxscR4LFRjhUkWO6BX
 NbY/QTRSgtCYwU4yxlYSdR+Ki4w4IiuK8bOiEASO70JkN6c+UJb3vOGeu
 +NPbeR4qwT/XrzJr1g4D8RlE+rSGdYnAR3sgOBDxKIqDVTDsYLxSwoyQw Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10485"; a="366002850"
X-IronPort-AV: E=Sophos;i="5.93,355,1654585200"; d="scan'208";a="366002850"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2022 09:46:40 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10485"; a="655622271"
X-IronPort-AV: E=Sophos;i="5.93,355,1654585200"; d="scan'208";a="655622271"
Received: from ashyti-mobl2.igk.intel.com (HELO intel.com) ([172.28.182.72])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2022 09:46:36 -0700
Date: Thu, 29 Sep 2022 18:46:34 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Nathan Chancellor <nathan@kernel.org>
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Fix CFI violations in gt_sysfs
Message-ID: <YzXL6v3VAVUMiYO0@ashyti-mobl2.lan>
References: <20220922195127.2607496-1-nathan@kernel.org>
 <202209232143.172BCCDC4@keescook>
 <Yy/bglnYjnFfjDDI@dev-arch.thelio-3990X>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yy/bglnYjnFfjDDI@dev-arch.thelio-3990X>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Kees Cook <keescook@chromium.org>, Tom Rix <trix@redhat.com>,
 intel-gfx@lists.freedesktop.org, llvm@lists.linux.dev,
 Nick Desaulniers <ndesaulniers@google.com>, patches@lists.linux.dev,
 dri-devel@lists.freedesktop.org, Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Sami Tolvanen <samitolvanen@google.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nathan,

thanks for this refactoring... looks good even though i would
have split it in more patches as this is doing quite many things.

But I will not be stubborn, I understand that it's not trivial to
have things split. I will give my r-b for now but I will check it
again before applying it as it's very easy to get tangled-up in
between all those defines:

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

For now I'm quite surprised to see how easily our CI gives green
lights :-P

On Sat, Sep 24, 2022 at 09:39:30PM -0700, Nathan Chancellor wrote:
> On Fri, Sep 23, 2022 at 09:57:47PM -0700, Kees Cook wrote:
> > On Thu, Sep 22, 2022 at 12:51:27PM -0700, Nathan Chancellor wrote:
> > > [...]
> > > To make everything work properly, adjust certain functions to match the
> > > type of the ->show() and ->store() members in 'struct kobj_attribute'.
> > > Add a macro to generate functions for that can be called via both
> > > dev_attr_{show,store}() or kobj_attr_{show,store}() so that they can be
> > > called through both kobject locations without violating kCFI and adjust
> > > the attribute groups to account for this.
> > 
> > This was quite a roller coaster! I think the solution looks good, even
> > if I'm suspicious of the original design that has the same stuff
> > available twice in different places. (I have a dim memory of rdma
> > needing a refactoring like this too?)
> 
> Right, I noticed this comment in intel_gt_sysfs_register() once I fully
> saw what was going on:
> 
> 	/*
> 	 * We need to make things right with the
> 	 * ABI compatibility. The files were originally
> 	 * generated under the parent directory.
> 	 *
> 	 * We generate the files only for gt 0
> 	 * to avoid duplicates.
> 	 */
> 
> Makes it seem like there will be userspace breakage if these files do
> not exist? I figured this was the cleanest solution within those
> parameters.

i915 went multi-gt (multitile) so that some interfaces, like the
power management files, have effect only on one of the tiles.
This means that we needed to move some of the files inside the
newly created gt0/gt1 directory.

But, because some of those files are part of an ABI
specification, we can't simply transfer them from the original
position so that we needed to make a "hard" copy (actually the
original files now take the role of affecting all the GTs instead
of only one).

The complexity of this file comes from the necessity of
minimizing code duplication, otherwise we could have had two
perfectly identical files (which looking at the final result it
wouldn't have been a completely bad idea after all).

Thanks again, will let you know when I will get this into our
branch.

Andi

> > Reviewed-by: Kees Cook <keescook@chromium.org>
> 
> Thanks for looking it over!
> 
> Cheers,
> Nathan
