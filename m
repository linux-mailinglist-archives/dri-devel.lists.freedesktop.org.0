Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5545484B1A
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jan 2022 00:12:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7638610E296;
	Tue,  4 Jan 2022 23:12:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C2C410E296;
 Tue,  4 Jan 2022 23:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641337949; x=1672873949;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=gyzDkoOE1iwWgInXXPVMkW3BifTYlvy6+X++EHkhBI4=;
 b=X7BFgdS8aqnG62Jb9ur6LTSJjTamKx595kwomXFQ2pskDXbaDTWg3LdF
 YsEL8Rob3qkYwr/czFPt8LojQ/TSGyKOWwXjPJFfN7Jk5BL0MWy8pgVMJ
 4a0FMLEeKUUuR0t66g/jxKMtioZpzFYE01YODVQV14iy6CJ6xnc4DGHh4
 ru88Pgfl+9KGE8SM68wHlVpoXoRP8Qqpg9pl+AiOSu4q5tHvBmiCnClMA
 2h4CU+XjfTkgswJWjZ0mxqOEh48/z0ZKeIEgBBL6TXeDLaSY+8RJu6LZ7
 66mUpVFOYb5ACtB66ubv/Xmbu80IZkxC2kAeg8OGBeVMQEjE8PJmoxeSf g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10217"; a="222313114"
X-IronPort-AV: E=Sophos;i="5.88,262,1635231600"; d="scan'208";a="222313114"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2022 15:12:19 -0800
X-IronPort-AV: E=Sophos;i="5.88,262,1635231600"; d="scan'208";a="590822563"
Received: from jons-linux-dev-box.fm.intel.com (HELO jons-linux-dev-box)
 ([10.1.27.20])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2022 15:12:19 -0800
Date: Tue, 4 Jan 2022 15:06:35 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: John Harrison <john.c.harrison@intel.com>
Subject: Re: [PATCH] drm/i915: Check return intel_context_timeline_lock of in
 eb_pin_timeline
Message-ID: <20220104230635.GA15808@jons-linux-dev-box>
References: <20220104173100.32342-1-matthew.brost@intel.com>
 <cbfbab9f-8c1b-a07f-767a-be87b6646dbf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cbfbab9f-8c1b-a07f-767a-be87b6646dbf@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: intel-gfx@lists.freedesktop.org, daniele.ceraolospurio@intel.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 04, 2022 at 03:05:03PM -0800, John Harrison wrote:
> On 1/4/2022 09:31, Matthew Brost wrote:
> > intel_context_timeline_lock can return can error if interrupted by a
> > user when trying to lock the timeline mutex. Check the return value of
> > intel_context_timeline_lock in eb_pin_timeline (execbuf IOCTL).
> > 
> > Fixes: 544460c33821 ("drm/i915: Multi-BB execbuf")
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 3 +++
> >   1 file changed, 3 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> > index e9541244027a..65a078945b00 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> > @@ -2517,6 +2517,9 @@ static int eb_pin_timeline(struct i915_execbuffer *eb, struct intel_context *ce,
> >   			i915_request_put(rq);
> >   			tl = intel_context_timeline_lock(ce);
> > +			if (IS_ERR(tl))
> > +				return PTR_ERR(tl);
> > +
> >   			intel_context_exit(ce);
> Won't this leak the stuff acquired by the intel_context_enter() above if the
> _exit() is now skipped?
> 

Yep, this isn't right. I think should just call mutex_lock /
mutex_unlock directly on the timeline mutex.

Matt 

> John.
> 
> >   			intel_context_timeline_unlock(tl);
> 
