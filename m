Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA42CAAFCE9
	for <lists+dri-devel@lfdr.de>; Thu,  8 May 2025 16:27:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B112010E1D9;
	Thu,  8 May 2025 14:27:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XVp5Fvc/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65B6610E3B0
 for <dri-devel@lists.freedesktop.org>; Thu,  8 May 2025 14:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746714448; x=1778250448;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=kbAM4QD7gVOvVtJMaQ5P/9fwrgos1J3zcUB/8eme5jI=;
 b=XVp5Fvc/wFN5cyodnVszXzba8ikfVs5ge/ggtWGF6nDtBj2bXWLo9bFa
 S5S+UzCSeLMfEboABS5ZSoJpZHlJk+1VzkpqBiorfBNd14NKRzjmTME4L
 2GDJJ91IwnEjJe82YhnPT9nzhcKvxwNAHmuYeSGp9ISERSnoYgehI2Cmr
 kXMV7EGotVjYfGMSAUhefDrSrsVCNJfvjYiVzJcXM/3432+/eFFVh4rnV
 Nnne13wsVYD8bNL6oIFAcd4pgJ4kB0iqNFDmG3aTNdO//0Lvo493+fWCC
 CARGYDoT8IvV+/or+p3wU2K950XoJ/zTM6kvtfXej0udOwJJ0rUh8Rb1V g==;
X-CSE-ConnectionGUID: idHPvXPBRey8fxbiyOkCtA==
X-CSE-MsgGUID: +JQ7zWwIQRK/Mn+WweLiAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="58710856"
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; d="scan'208";a="58710856"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 07:27:27 -0700
X-CSE-ConnectionGUID: wgTvTDRjQcKkVioN/GNJDg==
X-CSE-MsgGUID: 1JmDS+WjTPKIyxZFg7LG5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; d="scan'208";a="136021864"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 07:27:25 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Anusha Srivatsa <asrivats@redhat.com>, Maxime Ripard <mripard@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v4 2/4] drm/panel: Add refcount support
In-Reply-To: <CAN9Xe3RLazpAXdxxJmyF2QAShDtMSgdoxMdo6ecdYd7aZiP9kA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250331-b4-panel-refcounting-v4-0-dad50c60c6c9@redhat.com>
 <20250331-b4-panel-refcounting-v4-2-dad50c60c6c9@redhat.com>
 <87y0vkw8ll.fsf@intel.com>
 <20250429-benign-sidewinder-of-defense-6dd4d8@houat>
 <87o6wfwcef.fsf@intel.com> <20250505-slim-bizarre-marten-a674ac@houat>
 <CAN9Xe3RLazpAXdxxJmyF2QAShDtMSgdoxMdo6ecdYd7aZiP9kA@mail.gmail.com>
Date: Thu, 08 May 2025 17:27:21 +0300
Message-ID: <874ixvtbxy.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Mon, 05 May 2025, Anusha Srivatsa <asrivats@redhat.com> wrote:
> On Mon, May 5, 2025 at 2:54=E2=80=AFAM Maxime Ripard <mripard@kernel.org>=
 wrote:
>
>> Hi Jani,
>>
>> On Tue, Apr 29, 2025 at 12:22:00PM +0300, Jani Nikula wrote:
>> > On Tue, 29 Apr 2025, Maxime Ripard <mripard@kernel.org> wrote:
>> > > Hi Jani,
>> > >
>> > > On Mon, Apr 28, 2025 at 07:31:50PM +0300, Jani Nikula wrote:
>> > >> On Mon, 31 Mar 2025, Anusha Srivatsa <asrivats@redhat.com> wrote:
>> > >> > Allocate panel via reference counting. Add _get() and _put() help=
er
>> > >> > functions to ensure panel allocations are refcounted. Avoid use
>> after
>> > >> > free by ensuring panel pointer is valid and can be usable till the
>> last
>> > >> > reference is put.
>> > >> >
>> > >> > Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>> > >> > Reviewed-by: Maxime Ripard <mripard@kernel.org>
>> > >> > Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
>> > >> >
>> > >> > ---
>> > >> > v4: Add refcounting documentation in this patch (Maxime)
>> > >> >
>> > >> > v3: Add include in this patch (Luca)
>> > >> >
>> > >> > v2: Export drm_panel_put/get() (Maxime)
>> > >> > - Change commit log with better workding (Luca, Maxime)
>> > >> > - Change drm_panel_put() to return void (Luca)
>> > >> > - Code Cleanups - add return in documentation, replace bridge to
>> > >> > panel (Luca)
>> > >> > ---
>> > >> >  drivers/gpu/drm/drm_panel.c | 64
>> ++++++++++++++++++++++++++++++++++++++++++++-
>> > >> >  include/drm/drm_panel.h     | 19 ++++++++++++++
>> > >> >  2 files changed, 82 insertions(+), 1 deletion(-)
>> > >> >
>> > >> > diff --git a/drivers/gpu/drm/drm_panel.c
>> b/drivers/gpu/drm/drm_panel.c
>> > >> > index
>> bdeab5710ee324dc1742fbc77582250960556308..7b17531d85a4dc3031709919564d2e=
4d8332f748
>> 100644
>> > >> > --- a/drivers/gpu/drm/drm_panel.c
>> > >> > +++ b/drivers/gpu/drm/drm_panel.c
>> > >> > @@ -355,24 +355,86 @@ struct drm_panel *of_drm_find_panel(const
>> struct device_node *np)
>> > >> >  }
>> > >> >  EXPORT_SYMBOL(of_drm_find_panel);
>> > >> >
>> > >> > +static void __drm_panel_free(struct kref *kref)
>> > >> > +{
>> > >> > +        struct drm_panel *panel =3D container_of(kref, struct
>> drm_panel, refcount);
>> > >> > +
>> > >> > +        kfree(panel->container);
>> > >> > +}
>> > >> > +
>> > >> > +/**
>> > >> > + * drm_panel_get - Acquire a panel reference
>> > >> > + * @panel: DRM panel
>> > >> > + *
>> > >> > + * This function increments the panel's refcount.
>> > >> > + * Returns:
>> > >> > + * Pointer to @panel
>> > >> > + */
>> > >> > +struct drm_panel *drm_panel_get(struct drm_panel *panel)
>> > >> > +{
>> > >> > +        if (!panel)
>> > >> > +                return panel;
>> > >> > +
>> > >> > +        kref_get(&panel->refcount);
>> > >> > +
>> > >> > +        return panel;
>> > >> > +}
>> > >> > +EXPORT_SYMBOL(drm_panel_get);
>> > >> > +
>> > >> > +/**
>> > >> > + * drm_panel_put - Release a panel reference
>> > >> > + * @panel: DRM panel
>> > >> > + *
>> > >> > + * This function decrements the panel's reference count and frees
>> the
>> > >> > + * object if the reference count drops to zero.
>> > >> > + */
>> > >> > +void drm_panel_put(struct drm_panel *panel)
>> > >> > +{
>> > >> > +        if (panel)
>> > >> > +                kref_put(&panel->refcount, __drm_panel_free);
>> > >> > +}
>> > >> > +EXPORT_SYMBOL(drm_panel_put);
>> > >> > +
>> > >> > +/**
>> > >> > + * drm_panel_put_void - wrapper to drm_panel_put() taking a void
>> pointer
>> > >> > + *
>> > >> > + * @data: pointer to @struct drm_panel, cast to a void pointer
>> > >> > + *
>> > >> > + * Wrapper of drm_panel_put() to be used when a function taking a
>> void
>> > >> > + * pointer is needed, for example as a devm action.
>> > >> > + */
>> > >> > +static void drm_panel_put_void(void *data)
>> > >> > +{
>> > >> > +        struct drm_panel *panel =3D (struct drm_panel *)data;
>> > >> > +
>> > >> > +        drm_panel_put(panel);
>> > >> > +}
>> > >> > +
>> > >> >  void *__devm_drm_panel_alloc(struct device *dev, size_t size,
>> size_t offset,
>> > >> >                               const struct drm_panel_funcs *funcs,
>> > >> >                               int connector_type)
>> > >> >  {
>> > >> >          void *container;
>> > >> >          struct drm_panel *panel;
>> > >> > +        int err;
>> > >> >
>> > >> >          if (!funcs) {
>> > >> >                  dev_warn(dev, "Missing funcs pointer\n");
>> > >> >                  return ERR_PTR(-EINVAL);
>> > >> >          }
>> > >> >
>> > >> > -        container =3D devm_kzalloc(dev, size, GFP_KERNEL);
>> > >> > +        container =3D kzalloc(size, GFP_KERNEL);
>> > >> >          if (!container)
>> > >> >                  return ERR_PTR(-ENOMEM);
>> > >> >
>> > >> >          panel =3D container + offset;
>> > >> > +        panel->container =3D container;
>> > >> >          panel->funcs =3D funcs;
>> > >> > +        kref_init(&panel->refcount);
>> > >>
>> > >> Hi Anusha, this should be done in drm_panel_init() instead.
>> > >>
>> > >> There are many users of drm_panel that don't use
>> devm_drm_panel_alloc()
>> > >> but allocate separately, and call drm_panel_init() only.
>> > >
>> > > That wouldn't really work, because then drivers would have allocated
>> the
>> > > panel with devm_kzalloc and thus the structure would be freed when t=
he
>> > > device is removed, no matter the reference counting state.
>> > >
>> > >> They'll all have refcount set to 0 instead of 1 like kref_init() do=
es.
>> > >>
>> > >> This means all subsequent get/put pairs on such panels will lead to
>> > >> __drm_panel_free() being called! But through a lucky coincidence, t=
hat
>> > >> will be a nop because panel->container is also not initialized...
>> > >>
>> > >> I'm sorry to say, the drm refcounting interface is quite broken for
>> such
>> > >> use cases.
>> > >
>> > > The plan is to convert all panel drivers to that function, and Anusha
>> > > already sent series to do. It still needs a bit of work, but it shou=
ld
>> > > land soon-ish.
>> > >
>> > > For the transitional period though, it's not clear to me what you th=
ink
>> > > is broken at the moment, and / or what should be fixed.
>> > >
>> > > Would you prefer an explicit check on container not being 0, with a
>> > > comment?
>> >
>> > I'm looking at what it would take to add drm_panel support to i915 so
>> > that you could have drm_panel_followers on it. There are gaps of cours=
e,
>> > but initially it would mean allocating and freeing drm_panel ourselves,
>> > not via devm_drm_panel_alloc() nor devm_kzalloc(), because none of the
>> > other stuff is allocated that way. drm_panel would just sit as a
>> > sub-struct inside struct intel_panel, which is a sub-struct of struct
>> > intel_connector, which has its own allocation...
>>
>> I'm not entirely sure why you would need to allocate it from i915? The
>> drm_panel structure is only meant to be allocated by panel drivers, and
>> afaik no panel interface controller is allocating it.

I'm looking into a use case involving drm_panel_follower, which requires
a drm_panel. I don't really need any of the other stuff in drm_panel.

And basically you'd have one drm_panel per connector that is connected
to a panel, within the same driver.

>> > But basically in its current state, the refcounting would not be
>> > reliable for that use case. I guess with panel->container being NULL
>> > nothing happens, but the idea that the refcount drops back to 0 after a
>> > get/put is a bit scary.
>> >
>> > Anyway, I think there should be no harm in moving the kref init to
>> > drm_panel_init(), right?
>>
>> I mean, there is because the plan so far was to remove drm_panel_init() =
:)

The problem with that is that it forces a certain type of allocation of
drm_panel. devm_drm_panel_alloc() allows embedding drm_panel inside
another struct, but that's inflexible for our use case, where we'd
probably like to embed it inside something that's already allocated as
part of something else.

I mean devm_drm_panel_alloc() is great, but please don't make its use
mandatory!

> Jani,
> the series that converts all drivers to use the new API:
> https://patchwork.freedesktop.org/series/147082/
> https://patchwork.freedesktop.org/series/147157/
> https://patchwork.freedesktop.org/series/147246/
>
> not landed yet but these are WIP. Still trying to understand your point
> though... not sure what is broken.

Nothing upstream is broken per se, but if you allocated drm_panel
directly yourself, initialized it with drm_panel_init(), its refcount
would initially be 0, not 1, and each subsequent get/put on it would
call __drm_panel_free().

Even that doesn't break stuff, because by luck panel->container is also
NULL in this case.


BR,
Jani.

--=20
Jani Nikula, Intel
