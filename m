Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C99F6FF9AF
	for <lists+dri-devel@lfdr.de>; Thu, 11 May 2023 20:57:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1C9510E5D3;
	Thu, 11 May 2023 18:57:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7670D10E5D3
 for <dri-devel@lists.freedesktop.org>; Thu, 11 May 2023 18:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683831419;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=psNxIWcSIsvrCLaJ/7oK29KucxQRVvzzx2QMm1Q7FLc=;
 b=TW6St6DXOaOMus4XjTF6sPTPwuRDiyFm5nEMZi2B41ICdKXJuETPfxvKmyeC7377ojt5sP
 gzNArzpLDQJmSUI+Eanag0h5S+0sDTmBK2zO15nWIMrCok+zDgPd0j9oxnoFQ9ylCZTxLr
 5lCucEZZsByevuG1fRz8knLAZjDGeYQ=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-257-ENaB0qb_MUKw-nyOq_1KYA-1; Thu, 11 May 2023 14:56:52 -0400
X-MC-Unique: ENaB0qb_MUKw-nyOq_1KYA-1
Received: by mail-lf1-f72.google.com with SMTP id
 2adb3069b0e04-4ef455ba61cso5011394e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 11 May 2023 11:56:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683831411; x=1686423411;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=psNxIWcSIsvrCLaJ/7oK29KucxQRVvzzx2QMm1Q7FLc=;
 b=l3XZoVwh3QY5//seW3PWl7IAVS86yo/cJqln6L/gsrbtc3ns6Kd4TByg1fkpYWnN5X
 TTKM8T013rOi9mrkvPOyS4nwGu/psG/3qkCXCQbazOzAlcyJUIlgQhg5sE4qnhvVfdzw
 10IwACfd3gq8hHABMOsGttWzeqVLOdSRyUQUL+gFp0yGDcm73vk4yNxLl1R4cr5xcwaq
 W0cBSPoqgHtUTJuY1JbfuIe/NPcUZ6yNYzhU991NPwD+yjJoLAJ03bX2TF+gn7y3M6GR
 YoOx2bGJ9o7XB1e/xYJNIfibGKrbSFhpOOTtvjIDOlcA6XYG2fQ6BheAgf8ZVu+PbgaD
 yD6g==
X-Gm-Message-State: AC+VfDwtaXjnZ5KyvzbnqkVxnHHL+f5wywz8CRLfO7OWcLINWuqqyvxM
 eE0+bzRbaRMUg98rMwdL3Ghn6CLpG9J6K9uCyNsRN4wfAKf6GL7qmhin5KpKtn678MpnmD28zFD
 mmBvXyH6dWQG2XCCz4yyZ8Y9qgkx3
X-Received: by 2002:ac2:5a4d:0:b0:4f1:3ae6:20bf with SMTP id
 r13-20020ac25a4d000000b004f13ae620bfmr3014469lfn.1.1683831411321; 
 Thu, 11 May 2023 11:56:51 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6NesjhToyqns0+fwgzA/HUJNbgKTgjEjzqXudu8zU1VrflGeGPxn3N11b2R970J7KFtRRDDg==
X-Received: by 2002:ac2:5a4d:0:b0:4f1:3ae6:20bf with SMTP id
 r13-20020ac25a4d000000b004f13ae620bfmr3014457lfn.1.1683831410918; 
 Thu, 11 May 2023 11:56:50 -0700 (PDT)
Received: from redhat.com (host-95-193-100-112.mobileonline.telia.com.
 [95.193.100.112]) by smtp.gmail.com with ESMTPSA id
 b6-20020ac25626000000b004edc485f86bsm1198907lff.239.2023.05.11.11.56.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 11:56:50 -0700 (PDT)
Date: Thu, 11 May 2023 20:56:47 +0200
From: Jonas =?iso-8859-1?Q?=C5dahl?= <jadahl@redhat.com>
To: Joshua Ashton <joshua@froggi.es>
Subject: Re: [RFC] Plane color pipeline KMS uAPI
Message-ID: <ZF06b6RC6jrtXtPv@redhat.com>
References: <QMers3awXvNCQlyhWdTtsPwkp5ie9bze_hD5nAccFW7a_RXlWjYB7MoUW_8CKLT2bSQwIXVi5H6VULYIxCdgvryZoAoJnC5lZgyK1QWn488=@emersion.fr>
 <CAPM=9tz54Jc1HSjdh5A7iG4X8Gvgg46qu7Ezvgnmj4N6gbY+Kw@mail.gmail.com>
 <CA+hFU4x++RDOxkc-_ZvDtQs3DtupwDV0KJyD3YAgrdh4daLotA@mail.gmail.com>
 <CAPM=9twjPr9fiJwbyNS9j=mCKmLhxbTjB5Vzq9F+Du8sdHac-A@mail.gmail.com>
 <e903d920-788f-7d70-c6f0-1faaac3c9843@amd.com>
 <CAPM=9tyOFhE0zC8540KBOkDaZE1c3zTtke_vX=DEkMTmo04A4Q@mail.gmail.com>
 <QL28tg_ZcXPQ1W5l8Hp3rDlvyKuMh09kjGHpj1GRKVrMqlB-hNI2F6FzRSP-NyfkMpk6tsO55t8UYF6Uk9b7IF1O1BHH1WKc88kNTgY2Ugk=@emersion.fr>
 <ZFtO2bMQOWVhRkSG@redhat.com>
 <CACO55tvzdOU4hnqbpTsd=_SeP0GHt235w=NGL74Oq0Fd35V6HQ@mail.gmail.com>
 <CAEZNXZCCn7ZFgyy-NzpSEp0wB0L7PZ-jheHmMWkgQq5pQ+930A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAEZNXZCCn7ZFgyy-NzpSEp0wB0L7PZ-jheHmMWkgQq5pQ+930A@mail.gmail.com>
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Karol Herbst <kherbst@redhat.com>, Aleix Pol <aleixpol@kde.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "xaver.hugl@gmail.com" <xaver.hugl@gmail.com>, Melissa Wen <mwen@igalia.com>,
 Michel =?iso-8859-1?Q?D=E4nzer?= <mdaenzer@redhat.com>,
 Uma Shankar <uma.shankar@intel.com>,
 Victoria Brekenfeld <victoria@system76.com>,
 wayland-devel <wayland-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 11, 2023 at 04:56:47PM +0000, Joshua Ashton wrote:
> When we are talking about being 'prescriptive' in the API, are we
> outright saying we don't want to support arbitrary 3D LUTs, or are we
> just offering certain algorithms to be 'executed' for a plane/crtc/etc
> in the atomic API? I am confused...

The 'prescriptive' idea that the RFC of this thread proposes *is* a way
to support arbitrary 3D LUTs (and other mathematical operations),
arbitrarily, in a somewhat vendored way, only that it will not be vendor
prefixed hard coded properties with specific positions in the pipeline,
but instead more or less an introspectable pipeline, describing what
kind of LUT's, Matrix multiplication (and in what order) etc a hardware
can do.

The theoretical userspace library would be the one turning descriptive
"please turn this into that" requests into the "prescriptive" color
pipeline operations. It would target general purpose compositors, but it
wouldn't be mandatory. Doing vendor specific implemantions in gamescope
would be possible; it wouldn't look like the verion that exist somewhere
now that uses a bunch of AMD_* properties, it'd look more like the
example Simon had in the initial RFC.


Jonas

> 
> There is so much stuff to do with color, that I don't think a
> prescriptive API in the kernel could ever keep up with the things that
> we want to be pushing from Gamescope/SteamOS. For example, we have so
> many things going on, night mode, SDR gamut widening, HDR/SDR gain,
> the ability to apply 'looks' for eg. invert luma or for retro looks,
> enhanced contrast, tonemapping, inverse tonemapping... We also are
> going to be doing a bunch of stuff with EETFs for handling out of
> range HDR content for scanout.
> 
> Some of what we do is kinda standard, regular "there is a paper on
> this" algorithms, and others are not.
> While yes, it might be very possible to do simple things, once you
> start wanting to do something 'different', that's kinda lock-in.
> 
> Whether this co-exists with arbitrary LUTs (that we definitely want
> for SteamOS) or not:
> I think putting a bunch of math-y stuff like this into the kernel is
> probably the complete wrong approach. Everything would need to be
> fixed point and it would be a huge pain in the butt to deal with on
> that side.
> 
> Maybe this is a "hot take", but IMO, DRM atomic is already waaay too
> much being done in the kernel space. I think making it go even further
> and having it be a prescriptive color API is a complete step in the
> wrong direction.
> 
> There is also the problem of... if there is a bug in the math here or
> we want to add a new feature, if it's kernel side, you are locked in
> to having that bug until the next release on your distro and probably
> years if it's a new feature!
> Updating kernels is much harder for 'enterprise' distros if it is not
> mission critical. Having all of this in userspace is completely fine
> however...
> 
> If you want to make some userspace prescriptive -> descriptive color
> library I am all for that for general case compositors, but I don't
> think I would use something like that in Gamescope.
> That's not to be rude, we are just picky and want freedom to do what
> we want and iterate on it easily.
> 
> I guess this all comes back to my initial point... having some
> userspace to handle stuff that is either kinda or entirely vendor
> specific is the right way of solving this problem :-P
> 
> - Joshie 🐸✨
> 
> On Thu, 11 May 2023 at 09:51, Karol Herbst <kherbst@redhat.com> wrote:
> >
> > On Wed, May 10, 2023 at 9:59 AM Jonas Ådahl <jadahl@redhat.com> wrote:
> > >
> > > On Tue, May 09, 2023 at 08:22:30PM +0000, Simon Ser wrote:
> > > > On Tuesday, May 9th, 2023 at 21:53, Dave Airlie <airlied@gmail.com> wrote:
> > > >
> > > > > There are also other vendor side effects to having this in userspace.
> > > > >
> > > > > Will the library have a loader?
> > > > > Will it allow proprietary plugins?
> > > > > Will it allow proprietary reimplementations?
> > > > > What will happen when a vendor wants distros to ship their
> > > > > proprietary fork of said library?
> > > > >
> > > > > How would NVIDIA integrate this with their proprietary stack?
> > > >
> > > > Since all color operations exposed by KMS are standard, the library
> > > > would just be a simple one: no loader, no plugin, no proprietary pieces,
> > > > etc.
> > > >
> > >
> > > There might be pipelines/color-ops only exposed by proprietary out of
> > > tree drivers; the operation types and semantics should ideally be
> > > defined upstream, but the code paths would in practice be vendor
> > > specific, potentially without any upstream driver using them. It should
> > > be clear whether an implementation that makes such a pipeline work is in
> > > scope for the upstream library.
> > >
> > > The same applies to the kernel; it must be clear whether pipeline
> > > elements that potentially will only be exposed by out of tree drivers
> > > will be acceptable upstream, at least as documented operations.
> > >
> >
> > they aren't. All code in the kernel needs to be used by in-tree
> > drivers otherwise it's fair to delete it. DRM requires any UAPI change
> > to have a real open source user in space user.
> >
> > Nvidia knows this and they went to great lengths to fulfill this
> > requirement in the past. They'll manage.
> >
> > >
> > > Jonas
> > >
> >
> 

