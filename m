Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A62DA6BE9EF
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 14:18:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A30EC10E387;
	Fri, 17 Mar 2023 13:18:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FD4310E3BF
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Mar 2023 13:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679059115;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=inFPeV84vyYesBrV/TkE9Ll2SW5/769gz6bdDQI9gLI=;
 b=XJPokqcgVJu7CplAdF7M8k1BhGMNMQyB2G3K6GlbCWHRG1QTfqs0rgNFVOm4tBCa8Go1eL
 VR0ol9pYwh2PvKDkpEd7ApYVZchFLhwKfYxw+pk1Atwf3Wv4+jZnZMoXfpBN9hBJH3piu0
 44vk377Vz83AYX+OV67phveNbOsFba8=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-324-RurSGnIWMT-EmlY-yM7Urw-1; Fri, 17 Mar 2023 09:18:34 -0400
X-MC-Unique: RurSGnIWMT-EmlY-yM7Urw-1
Received: by mail-lj1-f199.google.com with SMTP id
 x37-20020a2ea9a5000000b00295b9da42d6so1370379ljq.18
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Mar 2023 06:18:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679059112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=inFPeV84vyYesBrV/TkE9Ll2SW5/769gz6bdDQI9gLI=;
 b=Da5ZKsYNd2VfVb6cSkwJ8rrI4EB4lr1Svwr4A6pWhN9TlyCpCc85Fnp1JVQY8CkNRg
 7Q9ndN8xX6Re0EeTyqOsdUGLG9A56GqsyW7zGOWEk6Zq2aLMuWE077XaJbxhkkOop6PQ
 Mb80wO3zt+RLglF+94LxeYnMSbwPkTfkTIU/uGlOz2X3oo5pYfB+RuvaeKpjb6SwVgpP
 TitkRSX5AoxB5B3TEFXiYU28f9aeeyNsslhJkPq39gLajVdnBrgG3IcizdlKyCUjRmnC
 oveTeYOri1amK+igiKEvEFfT15W9duJiEB2AZT/YRlRwhvJRwTwwhIIiruFi8kH4a/j0
 7zmg==
X-Gm-Message-State: AO0yUKWLWslaoOii4QQ4jt328pJr0VwARozcsz5+JnTDUKwamBCHBH79
 jNW/YEFEZljGM4/fGmOo99CRnSGWfzX90s5LuwoOgvHUL/b7cjUyvd3P10q53Nxk97EV5R9D0q5
 YTeYDBU1byqA5GnlFvrLXdGxjuZnaMmzN7eVN
X-Received: by 2002:ac2:57db:0:b0:4de:3f1e:cdc4 with SMTP id
 k27-20020ac257db000000b004de3f1ecdc4mr4061331lfo.13.1679059111986; 
 Fri, 17 Mar 2023 06:18:31 -0700 (PDT)
X-Google-Smtp-Source: AK7set+Hv05A7Z4o058KqsVSgZ5xfZlgsnzH6jd64Mrll9XyHJ1eChlu4u5KcbjwMoxrm8gld7+Pgg==
X-Received: by 2002:ac2:57db:0:b0:4de:3f1e:cdc4 with SMTP id
 k27-20020ac257db000000b004de3f1ecdc4mr4061319lfo.13.1679059111640; 
 Fri, 17 Mar 2023 06:18:31 -0700 (PDT)
Received: from redhat.com (host-95-193-64-255.mobileonline.telia.com.
 [95.193.64.255]) by smtp.gmail.com with ESMTPSA id
 r28-20020ac252bc000000b004cc9ddce3adsm367198lfm.82.2023.03.17.06.18.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Mar 2023 06:18:31 -0700 (PDT)
Date: Fri, 17 Mar 2023 14:18:29 +0100
From: Jonas =?iso-8859-1?Q?=C5dahl?= <jadahl@redhat.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v3 1/2] drm: Introduce plane SIZE_HINTS property
Message-ID: <ZBRopQWyxDfxPSua@redhat.com>
References: <20230208211016.7034-1-ville.syrjala@linux.intel.com>
 <20230313163311.11379-1-ville.syrjala@linux.intel.com>
 <ZBRCKIl+jdkohbVB@gmail.com> <ZBRQBfuEZS+2ieIM@intel.com>
 <ZBRbVJyoH0Gn6gLw@gmail.com> <ZBRdGVOQgH6IuBQK@gmail.com>
 <ZBRoDO28OaX8nTrj@intel.com>
MIME-Version: 1.0
In-Reply-To: <ZBRoDO28OaX8nTrj@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
Cc: intel-gfx@lists.freedesktop.org,
 Pekka Paalanen <pekka.paalanen@collabora.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 17, 2023 at 03:15:56PM +0200, Ville Syrjälä wrote:
> On Fri, Mar 17, 2023 at 01:29:13PM +0100, Jonas Ådahl wrote:
> > On Fri, Mar 17, 2023 at 01:21:43PM +0100, Jonas Ådahl wrote:
> > > On Fri, Mar 17, 2023 at 01:33:25PM +0200, Ville Syrjälä wrote:
> > > > On Fri, Mar 17, 2023 at 11:34:16AM +0100, Jonas Ådahl wrote:
> > > > > On Mon, Mar 13, 2023 at 06:33:11PM +0200, Ville Syrjala wrote:
> > > > > > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > > > > > 
> > > > > > Add a new immutable plane property by which a plane can advertise
> > > > > > a handful of recommended plane sizes. This would be mostly exposed
> > > > > > by cursor planes as a slightly more capable replacement for
> > > > > > the DRM_CAP_CURSOR_WIDTH/HEIGHT caps, which can only declare
> > > > > > a one size fits all limit for the whole device.
> > > > > > 
> > > > > > Currently eg. amdgpu/i915/nouveau just advertize the max cursor
> > > > > > size via the cursor size caps. But always using the max sized
> > > > > > cursor can waste a surprising amount of power, so a better
> > > > > > stragey is desirable.
> > > > > > 
> > > > > > Most other drivers don't specify any cursor size at all, in
> > > > > > which case the ioctl code just claims that 64x64 is a great
> > > > > > choice. Whether that is actually true is debatable.
> > > > > > 
> > > > > > A poll of various compositor developers informs us that
> > > > > > blindly probing with setcursor/atomic ioctl to determine
> > > > > > suitable cursor sizes is not acceptable, thus the
> > > > > > introduction of the new property to supplant the cursor
> > > > > > size caps. The compositor will now be free to select a
> > > > > > more optimal cursor size from the short list of options.
> > > > > > 
> > > > > > Note that the reported sizes (either via the property or the
> > > > > > caps) make no claims about things such as plane scaling. So
> > > > > > these things should only really be consulted for simple
> > > > > > "cursor like" use cases.
> > > > > > 
> > > > > > v2: Try to add some docs
> > > > > > v3: Specify that value 0 is reserved for future use (basic idea from Jonas)
> > > > > >     Drop the note about typical hardware (Pekka)
> > > > > > 
> > > > > > Cc: Simon Ser <contact@emersion.fr>
> > > > > > Cc: Jonas Ådahl <jadahl@redhat.com>
> > > > > > Cc: Daniel Stone <daniel@fooishbar.org>
> > > > > > Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
> > > > > > Acked-by: Harry Wentland <harry.wentland@amd.com>
> > > > > > Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
> > > > > > Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > > > > > ---
> > > > > >  drivers/gpu/drm/drm_mode_config.c |  7 ++++
> > > > > >  drivers/gpu/drm/drm_plane.c       | 53 +++++++++++++++++++++++++++++++
> > > > > >  include/drm/drm_mode_config.h     |  5 +++
> > > > > >  include/drm/drm_plane.h           |  4 +++
> > > > > >  include/uapi/drm/drm_mode.h       | 11 +++++++
> > > > > >  5 files changed, 80 insertions(+)
> > > > > > 
> > > > > > diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
> > > > > > index 87eb591fe9b5..21860f94a18c 100644
> > > > > > --- a/drivers/gpu/drm/drm_mode_config.c
> > > > > > +++ b/drivers/gpu/drm/drm_mode_config.c
> > > > > > @@ -374,6 +374,13 @@ static int drm_mode_create_standard_properties(struct drm_device *dev)
> > > > > >  		return -ENOMEM;
> > > > > >  	dev->mode_config.modifiers_property = prop;
> > > > > >  
> > > > > > +	prop = drm_property_create(dev,
> > > > > > +				   DRM_MODE_PROP_IMMUTABLE | DRM_MODE_PROP_BLOB,
> > > > > > +				   "SIZE_HINTS", 0);
> > > > > > +	if (!prop)
> > > > > > +		return -ENOMEM;
> > > > > > +	dev->mode_config.size_hints_property = prop;
> > > > > > +
> > > > > >  	return 0;
> > > > > >  }
> > > > > >  
> > > > > > diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
> > > > > > index 24e7998d1731..d2a6fdff1a57 100644
> > > > > > --- a/drivers/gpu/drm/drm_plane.c
> > > > > > +++ b/drivers/gpu/drm/drm_plane.c
> > > > > > @@ -140,6 +140,26 @@
> > > > > >   *     DRM_FORMAT_MOD_LINEAR. Before linux kernel release v5.1 there have been
> > > > > >   *     various bugs in this area with inconsistencies between the capability
> > > > > >   *     flag and per-plane properties.
> > > > > > + *
> > > > > > + * SIZE_HINTS:
> > > > > > + *     Blob property which contains the set of recommended plane size
> > > > > > + *     which can used for simple "cursor like" use cases (eg. no scaling).
> > > > > > + *     Using these hints frees userspace from extensive probing of
> > > > > > + *     supported plane sizes through atomic/setcursor ioctls.
> > > > > > + *
> > > > > > + *     For optimal usage userspace should pick the smallest size
> > > > > > + *     that satisfies its own requirements.
> > > > > > + *
> > > > > > + *     The blob contains an array of struct drm_plane_size_hint.
> > > > > > + *
> > > > > > + *     Drivers should only attach this property to planes that
> > > > > > + *     support a very limited set of sizes.
> > > > > > + *
> > > > > > + *     Note that property value 0 (ie. no blob) is reserved for potential
> > > > > > + *     future use. Current userspace is expected to ignore the property
> > > > > > + *     if the value is 0, and fall back to some other means (eg.
> > > > > > + *     &DRM_CAP_CURSOR_WIDTH and &DRM_CAP_CURSOR_HEIGHT) to determine
> > > > > > + *     the appropriate plane size to use.
> > > > > 
> > > > > Does this intend to mean userspace has the kernel's blessing on choosing
> > > > > an arbitrary size as long as it's smaller than &DRM_CAP_CURSOR_WIDTH x
> > > > > &DRM_CAP_CURSOR_HEIGHT?
> > > > > 
> > > > > It's a bit to vague for me to make a confident interpretation whether I
> > > > > can, or whether I should pretend I didn't see SIZE_HINTS and apply the
> > > > > old logic, meaning only using the exact cap size.
> > > > 
> > > > Using the exact cap size is the only thing more or less
> > > > guaranteed to work. But other approaches (such as probing
> > > > the size with atomic/cursor ioctls) can also be used.
> > > 
> > > I think you should then just disallow drivers for exposing SIZE_HINTS
> > > with the value 0, and make it a bug if they do, to let userspace know
> > > when the value 0 means anything.
> > > 
> > > In other words, userspace should *not* ignore the property value being
> > > 0, but treat it as a kernel bug if there is a SIZE_HINTS only containing
> > > a 0, until the value 0 has gotten any meaning. Otherwise I don't see how
> > > it'll be usable in the future, since userspace doesn't know the
> > > difference between 'legacy 0' and 'new 0' once it's defined to mean
> > > anything.
> > 
> > On a second thought, userspace needs to ignore it, to not fall apart
> > when running on never future kernels, you're right. Never mind.
> 
> OK, I guess you still want it :)
> 
> > 
> > I guess with "is reserved" implies that it's a bug if it's used before
> > it's defined to be anything, right?
> 
> Yes. I didn't want to specify the actual behaviour right now since
> we have no drivers lining up to implement any of it. So just trying
> to keep the door slightly ajar for the future.

Yep, thanks for that, and sorry about the confusion. As long as I in the
future can do 'if (value == 0) do_it_the_new_way()' (if they
materialize) I'm happy.


Jonas

