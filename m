Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9964B8320F2
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jan 2024 22:40:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE63E10E8EB;
	Thu, 18 Jan 2024 21:40:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9206110E8EB
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jan 2024 21:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1705614020;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xa92SUx0tviopJhDIWZGFz30fwUB0DJ3p+sWP4FEk+s=;
 b=TwQ7+ZtUn3sshSFlrzdBXX1mQyFjsbrSxax5uMlMM38mM70NipYysB33UcEXa8Je6GLdbr
 8euUUGacTGM6LpGgQI4Dd3edMmbfoQTTeIEBYc67p8qtfc9830SZpnnCvHw5PRVSy8cy/1
 irdeueRfouqGsacMfQCrgGMtI2yqTv8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-571-0xMwZmwwPVi5f5E8RnXQug-1; Thu, 18 Jan 2024 16:40:19 -0500
X-MC-Unique: 0xMwZmwwPVi5f5E8RnXQug-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-337bfa463e1so46388f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jan 2024 13:40:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705614018; x=1706218818;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xa92SUx0tviopJhDIWZGFz30fwUB0DJ3p+sWP4FEk+s=;
 b=gbCjPogt6hPYcz9F67iF01MhjI7RcHx2Vo5wToN430fZ0GEM9HcXbp2kBHWKLIQ7+q
 1p2EQjJf9GOgMFtRZl3fwKB8QAAzQeI+rZBXCG05GCcLRKZ/26ham1P19AhxdTcHLsE/
 zmWCN5BE29welDLTUyga2DU76L+hnGhq+1L0bg+jsvOyKphLJdK8gThEGab3HfFvCu9D
 CZ5E+Cu7ZifETuU1qa/UnRbGRcpV3aTRfpFsfYHgCvRzq4wYD3UV74F0b/GOTRCVEUMW
 1wQ8N+ccxL6URgvV8k1h4hHZMS8N0os25QIFCKFFwCqU1TcHGZsSPe2e606kkrN0Y0XE
 y+Ag==
X-Gm-Message-State: AOJu0Yy3GSHjDAG5yccrlLL6waMFqLX/BMyng+YmIMXDP38dlRooNhE6
 OrrK+ZUFR0nCYKyzKzZ5s+sGvMwCUQd35zL3Q9IZv20qse6mobpsunY03LcITRJr/pZL0cJ9H3J
 n7QdO3PzW6XRlMponi2+ikxB56c2KtDfIKPQfY95jkrPMC7fYzhAaA3CI7HJkTPPmvg==
X-Received: by 2002:a05:600c:35d1:b0:40e:4806:7f9b with SMTP id
 r17-20020a05600c35d100b0040e48067f9bmr467115wmq.307.1705614018253; 
 Thu, 18 Jan 2024 13:40:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHzu7h6Fo6GUvyykTS9VMLpY/bskI4+iQUY/zF1+uYeQ+1qVX2Ke101UmWIgIMx9PhGr0XmLQ==
X-Received: by 2002:a05:600c:35d1:b0:40e:4806:7f9b with SMTP id
 r17-20020a05600c35d100b0040e48067f9bmr467112wmq.307.1705614017890; 
 Thu, 18 Jan 2024 13:40:17 -0800 (PST)
Received: from toolbox ([2001:9e8:89aa:f00:af88:d221:94de:a009])
 by smtp.gmail.com with ESMTPSA id
 o8-20020a05600c4fc800b0040e549c77a1sm30861698wmq.32.2024.01.18.13.40.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jan 2024 13:40:17 -0800 (PST)
Date: Thu, 18 Jan 2024 22:40:15 +0100
From: Sebastian Wick <sebastian.wick@redhat.com>
To: Andri Yngvason <andri@yngvason.is>
Subject: Re: [PATCH v2 2/4] drm/uAPI: Add "force color format" drm property
 as setting for userspace
Message-ID: <20240118214015.GB30589@toolbox>
References: <20240115160554.720247-1-andri@yngvason.is>
 <20240115160554.720247-3-andri@yngvason.is>
 <20240116114235.GA311990@toolbox>
 <CAFNQBQz3TNj_7BSmFw4CFMNuR4B+1d+y3f058s+rzTuzdYogqA@mail.gmail.com>
 <20240116132918.GB311990@toolbox>
 <CAFNQBQyfWmfu5T7bgZDZFGfyhsxQi7YXmY_wPc9Y+mm5iSspXQ@mail.gmail.com>
 <20240117112150.4399d0bb@eldfell>
 <CAFNQBQwoGvSF1ryOPUUnedYUG64HqFQNXjMf6R7piufN64Vc=g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFNQBQwoGvSF1ryOPUUnedYUG64HqFQNXjMf6R7piufN64Vc=g@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
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
Cc: Maxime Ripard <mripard@kernel.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, amd-gfx@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, Leo Li <sunpeng.li@amd.com>,
 intel-gfx@lists.freedesktop.org, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org,
 Werner Sembach <wse@tuxedocomputers.com>, Pekka Paalanen <ppaalanen@gmail.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 17, 2024 at 12:58:15PM +0000, Andri Yngvason wrote:
> mið., 17. jan. 2024 kl. 09:21 skrifaði Pekka Paalanen <ppaalanen@gmail.com>:
> >
> > On Tue, 16 Jan 2024 14:11:43 +0000
> > Andri Yngvason <andri@yngvason.is> wrote:
> >
> > > þri., 16. jan. 2024 kl. 13:29 skrifaði Sebastian Wick
> > > <sebastian.wick@redhat.com>:
> > > >
> > > > On Tue, Jan 16, 2024 at 01:13:13PM +0000, Andri Yngvason wrote:
> > > [...]
> > > > > şri., 16. jan. 2024 kl. 11:42 skrifaği Sebastian Wick
> > > > > <sebastian.wick@redhat.com>:
> > > > > >
> > > > > > On Mon, Jan 15, 2024 at 04:05:52PM +0000, Andri Yngvason wrote:
> > > > > > > From: Werner Sembach <wse@tuxedocomputers.com>
> > > > > > >
> > > > > > > Add a new general drm property "force color format" which can be used
> > > > > > > by userspace to tell the graphics driver which color format to use.
> > > > > >
> > > > > > I don't like the "force" in the name. This just selects the color
> > > > > > format, let's just call it "color format" then.
> > > > > >
> > > > >
> > > > > In previous revisions, this was "preferred color format" and "actual
> > > > > color format", of which the latter has been dropped. I recommend
> > > > > reading the discussion for previous revisions.
> > > >
> > > > Please don't imply that I didn't read the thread I'm answering to.
> >
> > FYI, I have not read this thread.
> >
> 
> pq, You did not read this summary?
> https://lore.kernel.org/dri-devel/CAFNQBQwjeJaX6B4oewpgASMUd5_nxZYMxUfdOG294CTVGBTd1w@mail.gmail.com/
> 
> You partook in the discussion on IRC. Please read it and tell me if I
> misunderstood anything.
> 
> Sebastian, I apologise. You clearly read it as you even replied to it!

Thank you :)

> > > >
> > > > > There are arguments for adding "actual color format" later and if it
> > > > > is added later, we'd end up with "color format" and "actual color
> > > > > format", which might be confusing, and it is why I chose to call it
> > > > > "force color format" because it clearly communicates intent and
> > > > > disambiguates it from "actual color format".
> > > >
> > > > There is no such thing as "actual color format" in upstream though.
> > > > Basing your naming on discarded ideas is not useful. The thing that sets
> > > > the color space for example is called "Colorspace", not "force
> > > > colorspace".
> > > >
> > >
> > > Sure, I'm happy with calling it whatever people want. Maybe we can
> > > have a vote on it?
> >
> > It would sound strange to say "force color format" = "auto". Just drop
> > the "force" of it.
> >
> > If and when we need the feedback counterpart, it could be an immutable
> > prop called "active color format" where "auto" is not a valid value, or
> > something in the new "output properties" design Sima has been thinking
> > of.
> 
> There seems to be consensus for calling it "color format"
> 
> >
> > > > > [...]
> > > > > > > @@ -1396,6 +1404,15 @@ static const u32 dp_colorspaces =
> > > > > > >   *   drm_connector_attach_max_bpc_property() to create and attach the
> > > > > > >   *   property to the connector during initialization.
> > > > > > >   *
> > > > > > > + * force color format:
> > > > > > > + *   This property is used by userspace to change the used color format. When
> > > > > > > + *   used the driver will use the selected format if valid for the hardware,
> > > > > >
> > > > > > All properties are always "used", they just can have different values.
> > > > > > You probably want to talk about the auto mode here.
> > > > >
> > > > > Maybe we can say something like: If userspace does not set the
> > > > > property or if it is explicitly set to zero, the driver will select
> > > > > the appropriate color format based on other constraints.
> > > >
> > > > The property can be in any state without involvement from user space.
> > > > Don't talk about setting it, talk about the state it is in:
> > > >
> > > >   When the color format is auto, the driver will select a format.
> > > >
> > >
> > > Ok.
> > >
> > > > > >
> > > > > > > + *   sink, and current resolution and refresh rate combination. Drivers to
> > > > > >
> > > > > > If valid? So when a value is not actually supported user space can still
> > > > > > set it? What happens then? How should user space figure out if the
> > > > > > driver and the sink support the format?
> > > > >
> > > > > The kernel does not expose this property unless it's implemented in the driver.
> > > >
> > > > If the driver simply doesn't support *one format*, the enum value for
> > > > that format should not be exposed, period. This isn't about the property
> > > > on its own.
> > >
> > > Right, understood. You mean that enum should only contain values that
> > > are supported by the driver.
> >
> > Yes. When a driver installs a property, it can choose which of the enum
> > entries are exposed. That cannot be changed later though, so the list
> > cannot live by the currently connected sink, only by what the driver
> > and display controlled could ever do.
> 
> Yes, and I think that basing it also on the connected sink's
> capabilities would just add complexity for very little gain. In fact,
> I think that limiting it based on the driver's capabilities is also
> over-engineering, but I don't mind adding it if that's what people
> really want.

Having a bunch of values that will always fail a mode set just makes
life for user space much worse. Might be overengineering from the kernel
pov but it's not for user space.

> >
> > > > > This was originally "preferred color format". Perhaps the
> > > > > documentation should better reflect that it is now a mandatory
> > > > > constraint which fails the modeset if not satisfied.
> > > >
> > > > That would definitely help.
> > > >
> > > > > >
> > > > > > For the Colorspace prop, the kernel just exposes all formats it supports
> > > > > > (independent of the sink) and then makes it the job of user space to
> > > > > > figure out if the sink supports it.
> > > > > >
> > > > > > The same could be done here. Property value is exposed if the driver
> > > > > > supports it in general, commits can fail if the driver can't support it
> > > > > > for a specific commit because e.g. the resolution or refresh rate. User
> > > > > > space must look at the EDID/DisplayID/mode to figure out the supported
> > > > > > format for the sink.
> > > > >
> > > > > Yes, we can make it possible for userspace to discover which modes are
> > > > > supported by the monitor, but there are other constraints that need to
> > > > > be satisfied. This was discussed in the previous revision.
> > > >
> > > > I mean, yes, that's what I said. User space would then only be
> > > > responsible for checking the sink capabilities and the atomic check
> > > > would take into account other (non-sink) constraints.
> > >
> > > Since we need to probe using TEST_ONLY anyway, we'll end up with two
> > > mechanisms to do the same thing where one of them depends on the other
> > > for completeness.
> >
> > What do you mean by "same thing"?
> 
> I thought that it would be clear that I did not mean that they were
> literally equal. This was discussed on IRC and summarised in the email
> message that I linked to above. Excerpt:
> "I asked if it made sense to add color format capabilities to the mode info
> struct, but the conclusion was that it wouldn't really be useful because we
> need TEST_ONLY anyway to see if the color format setting is compatible with
> other settings."

I feel like we're talking past each other.

There are two questions:

1. Should the property expose enum values which will always result in a
   failed commit (because e.g. the hardware doesn't support it)
2. Should the commit fail if the sink doesn't claim to support the
   format

The first issue I believe that we should try to minimize options that
can't work to cut down on the combinatorial explosion problem.

On the second issue, there are good reasons to just not fail commits in
the kernel because:
* user space already has to parse and understand EDIDs
* this information is often wrong
* support for new EDID/DisplayID can get to user space faster

We have to decide on this and make them part of the API. We've seen how
this gets a mess if that's not being done.

> >
> > Neither HDMI nor DisplayPort have a feedback message saying your
> > infoframe contents are unacceptable, that I know of. Even if there was,
> > it would come too late for failing the atomic commit ioctl in
> > non-blocking mode.
> >
> > In general, display signalling is that you send whatever to the sink,
> > and hope for the best.
> >
> > EDID is used to describe what the sink can accept, so in theory the
> > kernel could parse EDID for all of these details and reject atomic
> > commits that attempt unsupported configurations. However, EDID are also
> > notoriously buggy. They are good for a best guess, but I believe it is
> > useful to be able to try "unsupported" things. IIRC, PS VR2
> > intentionally lies for instance.
> >
> > Even if the kernel did reject everything based on EDID, the only way
> > today for userspace to know what should work is to parse the EDID
> > itself. TEST_ONLY trials lead to a combinatorial explosion too easily.
> > So userspace is already expected to parse EDID, with the major
> > exception being video mode lists that are explicitly provided by the
> > kernel in UAPI.
> 
> I thought that everyone agreed that display settings GUIs don't suffer
> from combinatorial explosion because settings are selected in a
> predefined order so they don't need to test all permutations.

Not all permutations doesn't mean no permutations. This is still really
expensive to do right.

> >
> > EDID and DisplayID standards also evolve. The kernel could be behind
> > userspace in chasing them, which was the reason why the kernel does not
> > validate HDR_OUTPUT_METADATA against EDID.
> >
> > The design of today with HDR_OUTPUT_METADATA and whatnot is
> > that userspace is responsible for checking sink capabilities, and
> > atomic check is responsible for driver and display controller
> > capabilities.
> 
> I'm not really sure where you're going with this. Are you for or
> against userspace parsing EDID instead of getting the information from
> the kernel?

The opposite I hope.

Sink capabilities shouldn't influence commits, let user space do what it
can do. We have a bunch of "auto" states but I do consider them a
mistake.

> >
> > > > > In any case, these things can be added later and need not be a part of
> > > > > this change set.
> > > >
> > > > No, this is the contract between the kernel and user space and has to be
> > > > figured out before we can merge new uAPI.
> >
> > Indeed.
> 
> I don't see how adding something later to cut down on the
> combinatorial explosion can possibly break any kind of contract in the
> way things are currently implemented. Can anyone provide examples of
> how things can go wrong in this particular instance?
> 
> Thanks,
> Andri
> 

