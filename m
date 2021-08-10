Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4613E53DE
	for <lists+dri-devel@lfdr.de>; Tue, 10 Aug 2021 08:49:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EEC889E0E;
	Tue, 10 Aug 2021 06:49:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BD0689E0E
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Aug 2021 06:49:40 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 f9-20020a05600c1549b029025b0f5d8c6cso1140213wmg.4
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Aug 2021 23:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=E4rTHdt++J3tMRITuUdJbq0P2DbDV9IeKTH0gxIn+Bo=;
 b=XyPLKDrPl4ixPgyo12kFftE/2FKzi0mRey2FDZDtW4jmd+1OekZkZanEJ6wSyHTJgA
 ujfI6kw7bHY/1EvVU3JlKfmdqsClZpkT18etSyhCUK6GcEU2mJdhtymNOCyQWCdz/Sc1
 8maZ2mhFn3TJyHcFf66CY8mgyzd/3DyZTc0k4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=E4rTHdt++J3tMRITuUdJbq0P2DbDV9IeKTH0gxIn+Bo=;
 b=FlT2kwW+VnyrBfZ5e/VGa3TFsm+l00YVhyzsgz0J0w0NW2HEWAJDfzyG9zzu0Zew1T
 f5xwhau+xcvbGsDMPUJj6GtrFL8yuxiq28HOJjem8x8yKHnDEpeShgh8CSyP3kflI8TF
 iQPFU+3PJ77ySYj68kBtJTswUtrvlYgBP8LavzjdzcPbup+csGbBM+SGmwqVZsovk8qM
 TrPTDgqE2yn0NuYrqQn0E5Q4ts7Kja9LH7WpaZeMSlj9ji+py8337EPAslifXmaewL9w
 G9wD/GDAN4FR1Koc+dAWtqI8bmWjULczvjRhN+5WR7SD+rEivMlzT585AvinC/cE39e9
 pIqg==
X-Gm-Message-State: AOAM530s8hoSW6Gsl32WKNjLq+xxelziByr5A5/+OTZcubyx/Y2LJgLL
 NisdsdkyXZvakoUM/WGmM1EITZxHx7JH5Q==
X-Google-Smtp-Source: ABdhPJwBBGqB/qGHeJR/sBdHarxObNVFaU5HtU06Embe4sOdN9GQ/7gLn+eI0TBbrx1wMztYa1OpQw==
X-Received: by 2002:a1c:7907:: with SMTP id l7mr2894600wme.87.1628578178752;
 Mon, 09 Aug 2021 23:49:38 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id p14sm11110841wro.3.2021.08.09.23.49.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Aug 2021 23:49:38 -0700 (PDT)
Date: Tue, 10 Aug 2021 08:49:36 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Matthew Brost <matthew.brost@intel.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 13/46] drm/i915: Add logical engine mapping
Message-ID: <YRIhgCu+fs5rW2//@phenom.ffwll.local>
References: <20210803222943.27686-1-matthew.brost@intel.com>
 <20210803222943.27686-14-matthew.brost@intel.com>
 <YRE7dEqqG0hSAfjp@phenom.ffwll.local>
 <20210809182858.GA123591@DUT151-ICLU.fm.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210809182858.GA123591@DUT151-ICLU.fm.intel.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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

On Mon, Aug 09, 2021 at 06:28:58PM +0000, Matthew Brost wrote:
> On Mon, Aug 09, 2021 at 04:28:04PM +0200, Daniel Vetter wrote:
> > On Tue, Aug 03, 2021 at 03:29:10PM -0700, Matthew Brost wrote:
> > > Add logical engine mapping. This is required for split-frame, as
> > > workloads need to be placed on engines in a logically contiguous manner.
> > > 
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > ---
> > >  drivers/gpu/drm/i915/gt/intel_engine_cs.c     | 60 ++++++++++++++++---
> > >  drivers/gpu/drm/i915/gt/intel_engine_types.h  |  1 +
> > >  .../drm/i915/gt/intel_execlists_submission.c  |  1 +
> > >  drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c    |  2 +-
> > >  .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 21 +------
> > >  5 files changed, 56 insertions(+), 29 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> > > index 0d9105a31d84..4d790f9a65dd 100644
> > > --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> > > +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> > > @@ -290,7 +290,8 @@ static void nop_irq_handler(struct intel_engine_cs *engine, u16 iir)
> > >  	GEM_DEBUG_WARN_ON(iir);
> > >  }
> > >  
> > > -static int intel_engine_setup(struct intel_gt *gt, enum intel_engine_id id)
> > > +static int intel_engine_setup(struct intel_gt *gt, enum intel_engine_id id,
> > > +			      u8 logical_instance)
> > >  {
> > >  	const struct engine_info *info = &intel_engines[id];
> > >  	struct drm_i915_private *i915 = gt->i915;
> > > @@ -334,6 +335,7 @@ static int intel_engine_setup(struct intel_gt *gt, enum intel_engine_id id)
> > >  
> > >  	engine->class = info->class;
> > >  	engine->instance = info->instance;
> > > +	engine->logical_mask = BIT(logical_instance);
> > >  	__sprint_engine_name(engine);
> > >  
> > >  	engine->props.heartbeat_interval_ms =
> > > @@ -572,6 +574,37 @@ static intel_engine_mask_t init_engine_mask(struct intel_gt *gt)
> > >  	return info->engine_mask;
> > >  }
> > >  
> > > +static void populate_logical_ids(struct intel_gt *gt, u8 *logical_ids,
> > > +				 u8 class, const u8 *map, u8 num_instances)
> > > +{
> > > +	int i, j;
> > > +	u8 current_logical_id = 0;
> > > +
> > > +	for (j = 0; j < num_instances; ++j) {
> > > +		for (i = 0; i < ARRAY_SIZE(intel_engines); ++i) {
> > > +			if (!HAS_ENGINE(gt, i) ||
> > > +			    intel_engines[i].class != class)
> > > +				continue;
> > > +
> > > +			if (intel_engines[i].instance == map[j]) {
> > > +				logical_ids[intel_engines[i].instance] =
> > > +					current_logical_id++;
> > > +				break;
> > > +			}
> > > +		}
> > > +	}
> > > +}
> > > +
> > > +static void setup_logical_ids(struct intel_gt *gt, u8 *logical_ids, u8 class)
> > > +{
> > > +	int i;
> > > +	u8 map[MAX_ENGINE_INSTANCE + 1];
> > > +
> > > +	for (i = 0; i < MAX_ENGINE_INSTANCE + 1; ++i)
> > > +		map[i] = i;
> > > +	populate_logical_ids(gt, logical_ids, class, map, ARRAY_SIZE(map));
> > > +}
> > > +
> > >  /**
> > >   * intel_engines_init_mmio() - allocate and prepare the Engine Command Streamers
> > >   * @gt: pointer to struct intel_gt
> > > @@ -583,7 +616,8 @@ int intel_engines_init_mmio(struct intel_gt *gt)
> > >  	struct drm_i915_private *i915 = gt->i915;
> > >  	const unsigned int engine_mask = init_engine_mask(gt);
> > >  	unsigned int mask = 0;
> > > -	unsigned int i;
> > > +	unsigned int i, class;
> > > +	u8 logical_ids[MAX_ENGINE_INSTANCE + 1];
> > >  	int err;
> > >  
> > >  	drm_WARN_ON(&i915->drm, engine_mask == 0);
> > > @@ -593,15 +627,23 @@ int intel_engines_init_mmio(struct intel_gt *gt)
> > >  	if (i915_inject_probe_failure(i915))
> > >  		return -ENODEV;
> > >  
> > > -	for (i = 0; i < ARRAY_SIZE(intel_engines); i++) {
> > > -		if (!HAS_ENGINE(gt, i))
> > > -			continue;
> > > +	for (class = 0; class < MAX_ENGINE_CLASS + 1; ++class) {
> > > +		setup_logical_ids(gt, logical_ids, class);
> > >  
> > > -		err = intel_engine_setup(gt, i);
> > > -		if (err)
> > > -			goto cleanup;
> > > +		for (i = 0; i < ARRAY_SIZE(intel_engines); ++i) {
> > > +			u8 instance = intel_engines[i].instance;
> > > +
> > > +			if (intel_engines[i].class != class ||
> > > +			    !HAS_ENGINE(gt, i))
> > > +				continue;
> > >  
> > > -		mask |= BIT(i);
> > > +			err = intel_engine_setup(gt, i,
> > > +						 logical_ids[instance]);
> > > +			if (err)
> > > +				goto cleanup;
> > > +
> > > +			mask |= BIT(i);
> > > +		}
> > >  	}
> > >  
> > >  	/*
> > > diff --git a/drivers/gpu/drm/i915/gt/intel_engine_types.h b/drivers/gpu/drm/i915/gt/intel_engine_types.h
> > > index ed91bcff20eb..85e5c9a9e502 100644
> > > --- a/drivers/gpu/drm/i915/gt/intel_engine_types.h
> > > +++ b/drivers/gpu/drm/i915/gt/intel_engine_types.h
> > > @@ -266,6 +266,7 @@ struct intel_engine_cs {
> > >  	unsigned int guc_id;
> > >  
> > >  	intel_engine_mask_t mask;
> > > +	intel_engine_mask_t logical_mask;
> > 
> > Kerneldoc at least for new stuff. Bonus points if you get the
> > struct/header file up to speed (with dummy/fixme comments if need be) so
> 
> Sure can add Kerneldoc for new variables. Def don't have time to get all
> structs kerneldoc up to speed at moment as by backlog is about a mile
> long. Perhaps after we get all of GuC submission upstream I can take
> sometime to go through all the structures and update the DoC.

The idea isn't to add comments that are actually meaningful to all of
them, but just enough to be able to pull in the header without warnings.
Once you have that then any new addition will cause a warning in the doc
build, which CI iirc checks. And that's pretty good baseline to have, and
hence why I think it'd be good to quickly go through the motions to add
these.

Really fixing this is likely a few years of work across all the structs,
because in many cases the locking/coherency design is somewhere between
very tricky and outright broken. Doing that in one go makes no sense.
-Daniel

> 
> Matt
> 
> > we can include it into our overall html hierarchy).
> > -Daniel
> > 
> > >  
> > >  	u8 class;
> > >  	u8 instance;
> > > diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> > > index de5f9c86b9a4..baa1797af1c8 100644
> > > --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> > > +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> > > @@ -3879,6 +3879,7 @@ execlists_create_virtual(struct intel_engine_cs **siblings, unsigned int count)
> > >  
> > >  		ve->siblings[ve->num_siblings++] = sibling;
> > >  		ve->base.mask |= sibling->mask;
> > > +		ve->base.logical_mask |= sibling->logical_mask;
> > >  
> > >  		/*
> > >  		 * All physical engines must be compatible for their emission
> > > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> > > index 6926919bcac6..9f5f43a16182 100644
> > > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> > > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> > > @@ -176,7 +176,7 @@ static void guc_mapping_table_init(struct intel_gt *gt,
> > >  	for_each_engine(engine, gt, id) {
> > >  		u8 guc_class = engine_class_to_guc_class(engine->class);
> > >  
> > > -		system_info->mapping_table[guc_class][engine->instance] =
> > > +		system_info->mapping_table[guc_class][ilog2(engine->logical_mask)] =
> > >  			engine->instance;
> > >  	}
> > >  }
> > > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > > index 310116f40509..dec757d319a2 100644
> > > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > > @@ -1795,23 +1795,6 @@ static int deregister_context(struct intel_context *ce, u32 guc_id, bool loop)
> > >  	return __guc_action_deregister_context(guc, guc_id, loop);
> > >  }
> > >  
> > > -static intel_engine_mask_t adjust_engine_mask(u8 class, intel_engine_mask_t mask)
> > > -{
> > > -	switch (class) {
> > > -	case RENDER_CLASS:
> > > -		return mask >> RCS0;
> > > -	case VIDEO_ENHANCEMENT_CLASS:
> > > -		return mask >> VECS0;
> > > -	case VIDEO_DECODE_CLASS:
> > > -		return mask >> VCS0;
> > > -	case COPY_ENGINE_CLASS:
> > > -		return mask >> BCS0;
> > > -	default:
> > > -		MISSING_CASE(class);
> > > -		return 0;
> > > -	}
> > > -}
> > > -
> > >  static void guc_context_policy_init(struct intel_engine_cs *engine,
> > >  				    struct guc_lrc_desc *desc)
> > >  {
> > > @@ -1952,8 +1935,7 @@ static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
> > >  
> > >  	desc = __get_lrc_desc(guc, ce->guc_lrcd_reg_idx);
> > >  	desc->engine_class = engine_class_to_guc_class(engine->class);
> > > -	desc->engine_submit_mask = adjust_engine_mask(engine->class,
> > > -						      engine->mask);
> > > +	desc->engine_submit_mask = engine->logical_mask;
> > >  	desc->hw_context_desc = ce->lrc.lrca;
> > >  	ce->guc_prio = map_i915_prio_to_guc_prio(prio);
> > >  	desc->priority = ce->guc_prio;
> > > @@ -3978,6 +3960,7 @@ guc_create_virtual(struct intel_engine_cs **siblings, unsigned int count)
> > >  		}
> > >  
> > >  		ve->base.mask |= sibling->mask;
> > > +		ve->base.logical_mask |= sibling->logical_mask;
> > >  
> > >  		if (n != 0 && ve->base.class != sibling->class) {
> > >  			DRM_DEBUG("invalid mixing of engine class, sibling %d, already %d\n",
> > > -- 
> > > 2.28.0
> > > 
> > 
> > -- 
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
