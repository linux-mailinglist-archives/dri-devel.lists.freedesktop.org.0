Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1977839B035
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 04:10:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 389FC6F55C;
	Fri,  4 Jun 2021 02:10:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0968B6F55C;
 Fri,  4 Jun 2021 02:10:04 +0000 (UTC)
IronPort-SDR: lnUEQR/Ek3Kc1pW95CF0m6SFEX0cxKdB6/vyYRf0oaVwkYdQ2ot+nXsCZf0rr+h3wHlZk/geAA
 cwsWl2rBOB9Q==
X-IronPort-AV: E=McAfee;i="6200,9189,10004"; a="191312453"
X-IronPort-AV: E=Sophos;i="5.83,246,1616482800"; d="scan'208";a="191312453"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2021 19:09:58 -0700
IronPort-SDR: 6e/3RGUIr5TDMkDiZmZ00VFMNp/s12BKDZ7F7mjrlS1h5pZOm/sa43tCW8Ax8oSgkV1tVpWxYP
 vL3xAiZIVUew==
X-IronPort-AV: E=Sophos;i="5.83,246,1616482800"; d="scan'208";a="475294456"
Received: from unknown (HELO sdutt-i7) ([10.165.21.147])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2021 19:09:57 -0700
Date: Thu, 3 Jun 2021 19:02:57 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 08/20] drm/i915: Promote ptrdiff() to i915_utils.h
Message-ID: <20210604020257.GA7149@sdutt-i7>
References: <20210603051630.2635-1-matthew.brost@intel.com>
 <20210603051630.2635-9-matthew.brost@intel.com>
 <YLlLIG9sBjouIJE2@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YLlLIG9sBjouIJE2@phenom.ffwll.local>
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
Cc: daniel.vetter@intel.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 03, 2021 at 11:35:28PM +0200, Daniel Vetter wrote:
> On Wed, Jun 02, 2021 at 10:16:18PM -0700, Matthew Brost wrote:
> > From: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > 
> > Generic helpers should be placed in i915_utils.h.
> 
> Random rant, but we're _way_ too happy to just stuff random things into
> i915_utils.h without trying to properly upstream it.
> 
> For thinks like this the general dumping ground would be kernel.h, there's
> a few pointer helpers there already. Follow up patch maybe nice.
> -Daniel
> 

Sure. I've added this to a list of follow ups so this comment doesn't
get lost.

Matt

> > 
> > Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/i915/i915_utils.h | 5 +++++
> >  drivers/gpu/drm/i915/i915_vma.h   | 5 -----
> >  2 files changed, 5 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/i915_utils.h b/drivers/gpu/drm/i915/i915_utils.h
> > index f02f52ab5070..5259edacde38 100644
> > --- a/drivers/gpu/drm/i915/i915_utils.h
> > +++ b/drivers/gpu/drm/i915/i915_utils.h
> > @@ -201,6 +201,11 @@ __check_struct_size(size_t base, size_t arr, size_t count, size_t *size)
> >  	__T;								\
> >  })
> >  
> > +static __always_inline ptrdiff_t ptrdiff(const void *a, const void *b)
> > +{
> > +	return a - b;
> > +}
> > +
> >  /*
> >   * container_of_user: Extract the superclass from a pointer to a member.
> >   *
> > diff --git a/drivers/gpu/drm/i915/i915_vma.h b/drivers/gpu/drm/i915/i915_vma.h
> > index dc6926d89626..eca452a9851f 100644
> > --- a/drivers/gpu/drm/i915/i915_vma.h
> > +++ b/drivers/gpu/drm/i915/i915_vma.h
> > @@ -151,11 +151,6 @@ static inline void i915_vma_put(struct i915_vma *vma)
> >  	i915_gem_object_put(vma->obj);
> >  }
> >  
> > -static __always_inline ptrdiff_t ptrdiff(const void *a, const void *b)
> > -{
> > -	return a - b;
> > -}
> > -
> >  static inline long
> >  i915_vma_compare(struct i915_vma *vma,
> >  		 struct i915_address_space *vm,
> > -- 
> > 2.28.0
> > 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
