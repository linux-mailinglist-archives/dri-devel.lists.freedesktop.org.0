Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E4BD4F29AE
	for <lists+dri-devel@lfdr.de>; Tue,  5 Apr 2022 12:10:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A46D10E8DE;
	Tue,  5 Apr 2022 10:10:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E5C910E204;
 Tue,  5 Apr 2022 10:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649153400; x=1680689400;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=MKregwmhkDywPYL1YI6nf+Vp1vpSGZWH3H9RxjLg2sQ=;
 b=XP0tQQdSXptnaEmRoJSgAwplFQEnaPlsCLrQkbnuuizZzHVnsbvS4K2q
 KPWs6qce5+Vxg3bRHEi3c2U1FB1i5VDLkbJPDfsoBhc0QpzLsFgIuYj20
 NUAXYCzbQs8FNL5Uddgaj6rgMsw/IWtqAndOrfr5OIFIgiri0rTwq8jcS
 2itqtMFVQFIKb2qdB9n9wcKz62x0FHR2/U1S4UB+gQbrBzkTM2hAFZagw
 xbPuMEtRhFIWVScUbjT29rVoarsTEiUv/C4MyWEI94P3LI77tq92ZEmQl
 QT1FjvX0Ziomna+ZweVMFDfK4uLanF4Bxh/47xKa8g7wegQUuOA5REqa5 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10307"; a="242855267"
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400"; d="scan'208";a="242855267"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2022 03:09:59 -0700
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400"; d="scan'208";a="587882125"
Received: from ramaling-i9x.iind.intel.com (HELO intel.com) ([10.203.144.108])
 by orsmga001-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2022 03:09:57 -0700
Date: Tue, 5 Apr 2022 15:40:41 +0530
From: Ramalingam C <ramalingam.c@intel.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: Re: [PATCH v7 3/9] drm/i915/gt: Optimize the migration and clear loop
Message-ID: <20220405101040.GA17740@intel.com>
References: <20220328190736.19697-1-ramalingam.c@intel.com>
 <20220328190736.19697-4-ramalingam.c@intel.com>
 <YkMIXjJoMobhv21A@bvivekan-mobl.gar.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YkMIXjJoMobhv21A@bvivekan-mobl.gar.corp.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Hellstrom Thomas <thomas.hellstrom@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-03-29 at 18:53:42 +0530, Balasubramani Vivekanandan wrote:
> On 29.03.2022 00:37, Ramalingam C wrote:
> > Move the static calculations out of the loops for copy and clear.
> > 
> > Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> > Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > ---
> >  drivers/gpu/drm/i915/gt/intel_migrate.c | 44 ++++++++++++-------------
> >  1 file changed, 21 insertions(+), 23 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/intel_migrate.c b/drivers/gpu/drm/i915/gt/intel_migrate.c
> > index 17dd372a47d1..ec9a9e7cb388 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_migrate.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_migrate.c
> > @@ -526,6 +526,7 @@ intel_context_migrate_copy(struct intel_context *ce,
> >  			   struct i915_request **out)
> >  {
> >  	struct sgt_dma it_src = sg_sgt(src), it_dst = sg_sgt(dst);
> > +	u32 src_offset, dst_offset;
> >  	struct i915_request *rq;
> >  	int err;
> >  
> > @@ -534,8 +535,20 @@ intel_context_migrate_copy(struct intel_context *ce,
> >  
> >  	GEM_BUG_ON(ce->ring->size < SZ_64K);
> >  
> > +	src_offset = 0;
> > +	dst_offset = CHUNK_SZ;
> > +	if (HAS_64K_PAGES(ce->engine->i915)) {
> > +		GEM_BUG_ON(!src_is_lmem && !dst_is_lmem);
> > +
> > +		src_offset = 0;
> > +		dst_offset = 0;
> > +		if (src_is_lmem)
> > +			src_offset = CHUNK_SZ;
> > +		if (dst_is_lmem)
> > +			dst_offset = 2 * CHUNK_SZ;
> > +	}
> > +
> >  	do {
> > -		u32 src_offset, dst_offset;
> >  		int len;
> >  
> >  		rq = i915_request_create(ce);
> > @@ -563,19 +576,6 @@ intel_context_migrate_copy(struct intel_context *ce,
> >  		if (err)
> >  			goto out_rq;
> >  
> > -		src_offset = 0;
> > -		dst_offset = CHUNK_SZ;
> > -		if (HAS_64K_PAGES(ce->engine->i915)) {
> > -			GEM_BUG_ON(!src_is_lmem && !dst_is_lmem);
> > -
> > -			src_offset = 0;
> > -			dst_offset = 0;
> > -			if (src_is_lmem)
> > -				src_offset = CHUNK_SZ;
> > -			if (dst_is_lmem)
> > -				dst_offset = 2 * CHUNK_SZ;
> > -		}
> > -
> >  		len = emit_pte(rq, &it_src, src_cache_level, src_is_lmem,
> >  			       src_offset, CHUNK_SZ);
> >  		if (len <= 0) {
> > @@ -585,12 +585,10 @@ intel_context_migrate_copy(struct intel_context *ce,
> >  
> >  		err = emit_pte(rq, &it_dst, dst_cache_level, dst_is_lmem,
> >  			       dst_offset, len);
> > -		if (err < 0)
> > -			goto out_rq;
> > -		if (err < len) {
> > +		if (err < len)
> >  			err = -EINVAL;
> > +		if (err < 0)
> >  			goto out_rq;
> > -		}
> With this change, for the case 0 < err < len, now the code does not
> reach `goto out_rq`.

With this change, flow will land into out_rq for all err < len.
But just now i am noticing we are overwriding all error code with
-EINVAL. I will fix that.

Ram.
> Is it the expected behavior? If yes, can you please add some details
> regarding this change in the commit description.
> 
> Regards,
> Bala
> >  
> >  		err = rq->engine->emit_flush(rq, EMIT_INVALIDATE);
> >  		if (err)
> > @@ -691,6 +689,7 @@ intel_context_migrate_clear(struct intel_context *ce,
> >  {
> >  	struct sgt_dma it = sg_sgt(sg);
> >  	struct i915_request *rq;
> > +	u32 offset;
> >  	int err;
> >  
> >  	GEM_BUG_ON(ce->vm != ce->engine->gt->migrate.context->vm);
> > @@ -698,8 +697,11 @@ intel_context_migrate_clear(struct intel_context *ce,
> >  
> >  	GEM_BUG_ON(ce->ring->size < SZ_64K);
> >  
> > +	offset = 0;
> > +	if (HAS_64K_PAGES(ce->engine->i915) && is_lmem)
> > +		offset = CHUNK_SZ;
> > +
> >  	do {
> > -		u32 offset;
> >  		int len;
> >  
> >  		rq = i915_request_create(ce);
> > @@ -727,10 +729,6 @@ intel_context_migrate_clear(struct intel_context *ce,
> >  		if (err)
> >  			goto out_rq;
> >  
> > -		offset = 0;
> > -		if (HAS_64K_PAGES(ce->engine->i915) && is_lmem)
> > -			offset = CHUNK_SZ;
> > -
> >  		len = emit_pte(rq, &it, cache_level, is_lmem, offset, CHUNK_SZ);
> >  		if (len <= 0) {
> >  			err = len;
> > -- 
> > 2.20.1
> > 
