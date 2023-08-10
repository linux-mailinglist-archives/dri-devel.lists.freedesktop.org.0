Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 754057774E4
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 11:50:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E48F910E4C6;
	Thu, 10 Aug 2023 09:50:13 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1481B10E4FE;
 Thu, 10 Aug 2023 09:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691661011; x=1723197011;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Z1X1N79miNTNV0o2DcCdp/UmezRHhLvqHXBvHnT0A38=;
 b=ieNgUPxjY7gTgxBKkxL5T6RMUqBIt3ktSSua13EHvg8tNIryFsABSYcE
 IP4oNmggUoBW6N8WbRSIjREq1JnVYLgv0zaM7rndYTrS9gZtArKbqsnIQ
 9FF77tyNvmrKs6WJCUrnuht+efKpcfYI0SVirSzNbLJMV3BYxfZKAOxG+
 AjQqp9wUYVJd/oKCxPHaYHNg0FLu2TNjEVfJArlAKcQ0y7ZzMbXwPp5p9
 sTYKeroH8NDKJLTG1CdsURI40iLQZjGChSPRwhS1OTJqcCzVcHnhqrVpX
 /DxIW0fVHbb9+N8UYSnk7UrVA4MiKrD1iUPZLkGs0Iw/r6kmnxk6tHHxS g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="350938312"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; d="scan'208";a="350938312"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2023 02:50:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="732142173"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; d="scan'208";a="732142173"
Received: from astheime-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.249.40.6])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2023 02:50:07 -0700
Date: Thu, 10 Aug 2023 11:50:03 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: John Harrison <john.c.harrison@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/guc: Fix potential null pointer
 deref in GuC 'steal id' test
Message-ID: <ZNSyy9wsBQfcTK7/@ashyti-mobl2.lan>
References: <20230802184940.911753-1-John.C.Harrison@Intel.com>
 <ZMurfYjREPl5NIGB@ashyti-mobl2.lan>
 <989e6e1c-cac3-58be-19d1-2c2468615cd6@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <989e6e1c-cac3-58be-19d1-2c2468615cd6@intel.com>
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
Cc: Intel-GFX@lists.freedesktop.org, DRI-Devel@lists.freedesktop.org,
 Andi Shyti <andi.shyti@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 07, 2023 at 12:46:46PM -0700, John Harrison wrote:
> On 8/3/2023 06:28, Andi Shyti wrote:
> > Hi John,
> > 
> > On Wed, Aug 02, 2023 at 11:49:40AM -0700, John.C.Harrison@Intel.com wrote:
> > > From: John Harrison <John.C.Harrison@Intel.com>
> > > 
> > > It was noticed that if the very first 'stealing' request failed to
> > > create for some reason then the 'steal all ids' loop would immediately
> > > exit with 'last' still being NULL. The test would attempt to continue
> > > but using a null pointer. Fix that by aborting the test if it fails to
> > > create any requests at all.
> > > 
> > > Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> > > ---
> > >   drivers/gpu/drm/i915/gt/uc/selftest_guc.c | 6 +++---
> > >   1 file changed, 3 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/i915/gt/uc/selftest_guc.c b/drivers/gpu/drm/i915/gt/uc/selftest_guc.c
> > > index 1fd760539f77b..bfb72143566f6 100644
> > > --- a/drivers/gpu/drm/i915/gt/uc/selftest_guc.c
> > > +++ b/drivers/gpu/drm/i915/gt/uc/selftest_guc.c
> > > @@ -204,9 +204,9 @@ static int intel_guc_steal_guc_ids(void *arg)
> > >   		if (IS_ERR(rq)) {
> > >   			ret = PTR_ERR(rq);
> > >   			rq = NULL;
> > > -			if (ret != -EAGAIN) {
> > > -				guc_err(guc, "Failed to create request %d: %pe\n",
> > > -					context_index, ERR_PTR(ret));
> > > +			if ((ret != -EAGAIN) || !last) {
> > isn't last alway NULL here?
> > 
> > Andi
> No, only on the first pass around the loop. When a request is successfully
> created, the else clause below assigns last to that new request. So if the
> failure to create only happens on pass 2 or later, last will be non-null.
> Which is the whole point of the code. It keeps creating all the
> contexts/requests that it can until it runs out of resources and gets an
> EAGAIN failure. At which point, last will be pointing to the last successful
> creation and the test continues to the next part of actually stealing an id.
> 
> But if the EAGAIN failure happens on the first pass then last will be null
> and it is not safe/valid to proceed so it needs to abort. And if anything
> other than EAGAIN is returned then something has gone wrong and it doesn't
> matter what last is set to, it needs to abort regardless.

Right! Thanks!

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com> 

Andi
