Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B29474C91
	for <lists+dri-devel@lfdr.de>; Tue, 14 Dec 2021 21:20:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DC1810E1C0;
	Tue, 14 Dec 2021 20:20:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 641DB10E15C;
 Tue, 14 Dec 2021 20:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639513237; x=1671049237;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=4D6g6iOwi5ZrG0NIcFp4HaSFqQv5n/tLINd+GuJXVGI=;
 b=nLV5vuNS5oMS44r+D6d1GhbUw5TnyRTtjxF6C7Mih/fO7IMSAU8evj14
 EHA6X9qXEBS6Rth+CpRLEYUp9N3CQnftEosIfwtXr3KM1ulpLV/otWOA/
 MvGDAdeOARkKx3zZ3VCBn6jTyVyBpjILOzoQu8wj7u4itWQkowirvdrgc
 Khf4HqgiMoyUXjibbGsUeEfaY/kNo3DX3wtwAU2WIUb6R2wlTwmEMk87f
 GVyXVaipCliV4C3OXSvD1bKK5KKajH0aI/GPubK2mJOU3rYljkm0lBsuc
 /FoVb8/3USGxdP2dQ/+QSkPKnu7lFZC1YwHUzuAxtKdEAveMTInTOqKmd w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10197"; a="302455311"
X-IronPort-AV: E=Sophos;i="5.88,206,1635231600"; d="scan'208";a="302455311"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2021 12:20:36 -0800
X-IronPort-AV: E=Sophos;i="5.88,206,1635231600"; d="scan'208";a="482107413"
Received: from jons-linux-dev-box.fm.intel.com (HELO jons-linux-dev-box)
 ([10.1.27.20])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2021 12:20:36 -0800
Date: Tue, 14 Dec 2021 12:15:14 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Increment composite fence seqno
Message-ID: <20211214201514.GA5917@jons-linux-dev-box>
References: <20211214195913.35735-1-matthew.brost@intel.com>
 <871r2f54b7.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <871r2f54b7.fsf@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 14, 2021 at 10:17:48PM +0200, Jani Nikula wrote:
> On Tue, 14 Dec 2021, Matthew Brost <matthew.brost@intel.com> wrote:
> > Increment composite fence seqno on each fence creation.
> >
> > Fixes: 544460c33821 ("drm/i915: Multi-BB execbuf")
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> > index 2213f7b613da..96cf8361b017 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> > @@ -3113,7 +3113,7 @@ eb_composite_fence_create(struct i915_execbuffer *eb, int out_fence_fd)
> >  	fence_array = dma_fence_array_create(eb->num_batches,
> >  					     fences,
> >  					     eb->context->parallel.fence_context,
> > -					     eb->context->parallel.seqno,
> > +					     eb->context->parallel.seqno++,
> >  					     false);
> >  	if (!fence_array) {
> >  		kfree(fences);
> 
> I have no idea what's going on, but the feeling I get from "code smells"
> just in this small snippet is that the seqno++ does not take the error
> path here into account.
> 

It does not take the error path into account, but it completely fine to
skip seqno numbers. As long as next valid seqno is greater than the last
valid seqno we should be fine.

Matt 

> 
> BR,
> Jani.
> 
> 
> -- 
> Jani Nikula, Intel Open Source Graphics Center
