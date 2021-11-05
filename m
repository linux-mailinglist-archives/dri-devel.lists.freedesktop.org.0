Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C68446282
	for <lists+dri-devel@lfdr.de>; Fri,  5 Nov 2021 12:03:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B39C6E11F;
	Fri,  5 Nov 2021 11:03:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B96F26E11F;
 Fri,  5 Nov 2021 11:03:50 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10158"; a="229346059"
X-IronPort-AV: E=Sophos;i="5.87,211,1631602800"; d="scan'208";a="229346059"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2021 04:03:49 -0700
X-IronPort-AV: E=Sophos;i="5.87,211,1631602800"; d="scan'208";a="501901059"
Received: from jprisaca-mobl.ger.corp.intel.com (HELO localhost)
 ([10.251.214.70])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2021 04:03:46 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Dave Airlie <airlied@linux.ie>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
In-Reply-To: <20211105171517.287de894@canb.auug.org.au>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20211015202648.258445ef@canb.auug.org.au>
 <20211101194223.749197c5@canb.auug.org.au>
 <20211105171517.287de894@canb.auug.org.au>
Date: Fri, 05 Nov 2021 13:03:43 +0200
Message-ID: <874k8qampc.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 05 Nov 2021, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi all,
>
> On Mon, 1 Nov 2021 19:42:23 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> On Fri, 15 Oct 2021 20:26:48 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>> >
>> > After merging the drm-misc tree, today's linux-next build (arm
>> > multi_v7_defconfig) failed like this:
>> > 
>> > drivers/gpu/drm/drm_modeset_lock.c:111:29: error: conflicting types for '__stack_depot_save'
>> >   111 | static depot_stack_handle_t __stack_depot_save(void)
>> >       |                             ^~~~~~~~~~~~~~~~~~
>> > In file included from include/linux/page_ext.h:7,
>> >                  from include/linux/mm.h:25,
>> >                  from include/linux/kallsyms.h:13,
>> >                  from include/linux/bpf.h:20,
>> >                  from include/linux/bpf-cgroup.h:5,
>> >                  from include/linux/cgroup-defs.h:22,
>> >                  from include/linux/cgroup.h:28,
>> >                  from include/linux/memcontrol.h:13,
>> >                  from include/linux/swap.h:9,
>> >                  from include/linux/suspend.h:5,
>> >                  from include/linux/regulator/consumer.h:35,
>> >                  from include/linux/i2c.h:18,
>> >                  from include/drm/drm_crtc.h:28,
>> >                  from include/drm/drm_atomic.h:31,
>> >                  from drivers/gpu/drm/drm_modeset_lock.c:24:
>> > include/linux/stackdepot.h:18:22: note: previous declaration of '__stack_depot_save' was here
>> >    18 | depot_stack_handle_t __stack_depot_save(unsigned long *entries,
>> >       |                      ^~~~~~~~~~~~~~~~~~
>> > 
>> > Caused by commit
>> > 
>> >   cd06ab2fd48f ("drm/locking: add backtrace for locking contended locks without backoff")
>> > 
>> > This may only have been revealed because of another fix I have had to
>> > apply today.
>> > 
>> > I have applied the following patch for today.
>> > 
>> > From: Stephen Rothwell <sfr@canb.auug.org.au>
>> > Date: Fri, 15 Oct 2021 20:17:52 +1100
>> > Subject: [PATCH] drm/locking: fix for name conflict
>> > 
>> > Fixes: cd06ab2fd48f ("drm/locking: add backtrace for locking contended locks without backoff")
>> > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
>> > ---
>> >  drivers/gpu/drm/drm_modeset_lock.c | 6 +++---
>> >  1 file changed, 3 insertions(+), 3 deletions(-)
>> > 
>> > diff --git a/drivers/gpu/drm/drm_modeset_lock.c b/drivers/gpu/drm/drm_modeset_lock.c
>> > index 4d32b61fa1fd..ee36dd20900d 100644
>> > --- a/drivers/gpu/drm/drm_modeset_lock.c
>> > +++ b/drivers/gpu/drm/drm_modeset_lock.c
>> > @@ -79,7 +79,7 @@
>> >  static DEFINE_WW_CLASS(crtc_ww_class);
>> >  
>> >  #if IS_ENABLED(CONFIG_DRM_DEBUG_MODESET_LOCK)
>> > -static noinline depot_stack_handle_t __stack_depot_save(void)
>> > +static noinline depot_stack_handle_t __drm_stack_depot_save(void)
>> >  {
>> >  	unsigned long entries[8];
>> >  	unsigned int n;
>> > @@ -108,7 +108,7 @@ static void __stack_depot_print(depot_stack_handle_t stack_depot)
>> >  	kfree(buf);
>> >  }
>> >  #else /* CONFIG_DRM_DEBUG_MODESET_LOCK */
>> > -static depot_stack_handle_t __stack_depot_save(void)
>> > +static depot_stack_handle_t __drm_stack_depot_save(void)
>> >  {
>> >  	return 0;
>> >  }
>> > @@ -317,7 +317,7 @@ static inline int modeset_lock(struct drm_modeset_lock *lock,
>> >  		ret = 0;
>> >  	} else if (ret == -EDEADLK) {
>> >  		ctx->contended = lock;
>> > -		ctx->stack_depot = __stack_depot_save();
>> > +		ctx->stack_depot = __drm_stack_depot_save();
>> >  	}
>> >  
>> >  	return ret;
>> 
>> This has reappeared today.  I don't know what happened to the drm-misc
>> tree over the weeked :-(
>> 
>> I have reapplied the above fix.
>
> So the above drm-misc commit is now in the drm tree, but its fix up
> commit vanished from the drm-misc tree over the past weekend :-(

Cc: drm-misc maintainers.

We normally point drm-misc/for-linux-next at drm-misc-next, *except* to
drm-misc-next-fixes during the merge window. This is because
drm-misc-next already starts accumulating stuff that's headed to one
release later, e.g. currently v5.17. I think that's part of the reason.

I probably should have pushed c4f08d7246a5 ("drm/locking: fix
__stack_depot_* name conflict") to drm-misc-next-fixes.

There's still something funny going on, because the drm-misc-next pull
request [1] isn't part of the drm pull request for v5.16 [2]. Is there
going to be another drm pull?

BR,
Jani.


[1] https://lore.kernel.org/r/20211014120452.2wicnt6hobu3kbwb@gilmour
[2] https://lore.kernel.org/r/CAPM=9tyOyz4_-OdjDduFkponSXycO6maBDFsWGTLv+j=_Vp6ww@mail.gmail.com



-- 
Jani Nikula, Intel Open Source Graphics Center
