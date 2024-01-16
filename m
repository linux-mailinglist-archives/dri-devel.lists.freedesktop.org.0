Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC82582EFB4
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jan 2024 14:29:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86EFF10E1F7;
	Tue, 16 Jan 2024 13:29:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF01610E1F7
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jan 2024 13:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1705411762;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=opcO7YcCaqhJVLHqRTC7VOi71aauibWb6xpQkMwUiXc=;
 b=dhCPr6iYlcuAXVDN4fMQj7/Z69QC2jlKcUIrfixIsHeu0UbpEjN+tAKXr+hME2rEXOnrcw
 dwedCUDXymPSCygl5Cl8Nm2LPw+Uf5ZT10IcqgWLvaDy4rz8r42BLkweYUaYU76ArIJFbX
 +qm+zHz8h2P6rOO2GzfApDm+q5rQAO8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-553-Mg0FkidbOQmOvD-f2rjPOw-1; Tue, 16 Jan 2024 08:29:21 -0500
X-MC-Unique: Mg0FkidbOQmOvD-f2rjPOw-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-337ad48edf8so1141418f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jan 2024 05:29:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705411760; x=1706016560;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=opcO7YcCaqhJVLHqRTC7VOi71aauibWb6xpQkMwUiXc=;
 b=mWPp0M2TWj4P8wpjLa8g9QsEvApvAhKvGcyIg/wrzwNIUTUgvPkajjnCt/H7gzvtTW
 +w6GMy93zJjGPptsEJuUHuIb6hFGEcGUcWeQD495yLXSjZRQ0tybOxCvWrQutXdGlOyu
 4rBvZVtvuhCswnlS9uYMbTZ8tRl9P4sV8+C5T38mUil7LdzSwBxd2S09OcurIcWXRZHz
 UbFDjHwWwiC7+ZH/Gmm0ViF3T+AAB1OPxSLIfyINC14fxt0e0+v8h/Ep0K3XNxwZOQBH
 OQO/OVC/XNiwuyYr6zrafAz3fCYfzkyeH3uzTadKvftpPZBrq08wKDNphI4xbLBRNr33
 t8hw==
X-Gm-Message-State: AOJu0YzF3Xr225y9o69lNrvgjlLf/zdkwLjWuv7iFlcBjhgri/Ur2NXF
 Rw7085bB2XitJ6gESyehqViy6BqI/zIIF4FDDYNNlYCkrQVUQIJbBEDZ33gvBBQFjA46VfGVtXC
 K6oLGOhTr08v7A6GsA+ggsYMscB0XVhchGeAJ
X-Received: by 2002:a05:600c:378a:b0:40e:85ee:95af with SMTP id
 o10-20020a05600c378a00b0040e85ee95afmr370414wmr.29.1705411760591; 
 Tue, 16 Jan 2024 05:29:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFE2Nd0GOVlSQT8GubWBZ4p3Sm3yaxRwSvIVmfuo0AoSOCcRhOoNaiVXhoVVkQXaCfHg/Q3ng==
X-Received: by 2002:a05:600c:378a:b0:40e:85ee:95af with SMTP id
 o10-20020a05600c378a00b0040e85ee95afmr370404wmr.29.1705411760271; 
 Tue, 16 Jan 2024 05:29:20 -0800 (PST)
Received: from toolbox ([2001:9e8:89b3:b200:db6a:6268:cfcb:644d])
 by smtp.gmail.com with ESMTPSA id
 n10-20020a5d4c4a000000b003366e974cacsm14617069wrt.73.2024.01.16.05.29.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jan 2024 05:29:19 -0800 (PST)
Date: Tue, 16 Jan 2024 14:29:18 +0100
From: Sebastian Wick <sebastian.wick@redhat.com>
To: Andri Yngvason <andri@yngvason.is>
Subject: Re: [PATCH v2 2/4] drm/uAPI: Add "force color format" drm property
 as setting for userspace
Message-ID: <20240116132918.GB311990@toolbox>
References: <20240115160554.720247-1-andri@yngvason.is>
 <20240115160554.720247-3-andri@yngvason.is>
 <20240116114235.GA311990@toolbox>
 <CAFNQBQz3TNj_7BSmFw4CFMNuR4B+1d+y3f058s+rzTuzdYogqA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFNQBQz3TNj_7BSmFw4CFMNuR4B+1d+y3f058s+rzTuzdYogqA@mail.gmail.com>
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
Cc: dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Werner Sembach <wse@tuxedocomputers.com>, Leo Li <sunpeng.li@amd.com>,
 David Airlie <airlied@gmail.com>, intel-gfx@lists.freedesktop.org, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 16, 2024 at 01:13:13PM +0000, Andri Yngvason wrote:
> Hi Sebastian,
> 
> þri., 16. jan. 2024 kl. 11:42 skrifaði Sebastian Wick
> <sebastian.wick@redhat.com>:
> >
> > On Mon, Jan 15, 2024 at 04:05:52PM +0000, Andri Yngvason wrote:
> > > From: Werner Sembach <wse@tuxedocomputers.com>
> > >
> > > Add a new general drm property "force color format" which can be used
> > > by userspace to tell the graphics driver which color format to use.
> >
> > I don't like the "force" in the name. This just selects the color
> > format, let's just call it "color format" then.
> >
> 
> In previous revisions, this was "preferred color format" and "actual
> color format", of which the latter has been dropped. I recommend
> reading the discussion for previous revisions.

Please don't imply that I didn't read the thread I'm answering to.

> There are arguments for adding "actual color format" later and if it
> is added later, we'd end up with "color format" and "actual color
> format", which might be confusing, and it is why I chose to call it
> "force color format" because it clearly communicates intent and
> disambiguates it from "actual color format".

There is no such thing as "actual color format" in upstream though.
Basing your naming on discarded ideas is not useful. The thing that sets
the color space for example is called "Colorspace", not "force
colorspace". 

> [...]
> > > @@ -1396,6 +1404,15 @@ static const u32 dp_colorspaces =
> > >   *   drm_connector_attach_max_bpc_property() to create and attach the
> > >   *   property to the connector during initialization.
> > >   *
> > > + * force color format:
> > > + *   This property is used by userspace to change the used color format. When
> > > + *   used the driver will use the selected format if valid for the hardware,
> >
> > All properties are always "used", they just can have different values.
> > You probably want to talk about the auto mode here.
> 
> Maybe we can say something like: If userspace does not set the
> property or if it is explicitly set to zero, the driver will select
> the appropriate color format based on other constraints.

The property can be in any state without involvement from user space.
Don't talk about setting it, talk about the state it is in:

  When the color format is auto, the driver will select a format.

> >
> > > + *   sink, and current resolution and refresh rate combination. Drivers to
> >
> > If valid? So when a value is not actually supported user space can still
> > set it? What happens then? How should user space figure out if the
> > driver and the sink support the format?
> 
> The kernel does not expose this property unless it's implemented in the driver.

If the driver simply doesn't support *one format*, the enum value for
that format should not be exposed, period. This isn't about the property
on its own.

> This was originally "preferred color format". Perhaps the
> documentation should better reflect that it is now a mandatory
> constraint which fails the modeset if not satisfied.

That would definitely help.

> >
> > For the Colorspace prop, the kernel just exposes all formats it supports
> > (independent of the sink) and then makes it the job of user space to
> > figure out if the sink supports it.
> >
> > The same could be done here. Property value is exposed if the driver
> > supports it in general, commits can fail if the driver can't support it
> > for a specific commit because e.g. the resolution or refresh rate. User
> > space must look at the EDID/DisplayID/mode to figure out the supported
> > format for the sink.
> 
> Yes, we can make it possible for userspace to discover which modes are
> supported by the monitor, but there are other constraints that need to
> be satisfied. This was discussed in the previous revision.

I mean, yes, that's what I said. User space would then only be
responsible for checking the sink capabilities and the atomic check
would take into account other (non-sink) constraints.

> In any case, these things can be added later and need not be a part of
> this change set.

No, this is the contract between the kernel and user space and has to be
figured out before we can merge new uAPI.

> 
> [...]
> 
> Regards,
> Andri
> 

