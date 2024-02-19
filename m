Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D0B585A541
	for <lists+dri-devel@lfdr.de>; Mon, 19 Feb 2024 15:01:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2833110E068;
	Mon, 19 Feb 2024 14:01:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="EkncEYUa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3C2910E068
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Feb 2024 14:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1708351309;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u587ZdVcj3glUgoM/Hcg0rJugpW/yYo4cuFbTIpN5kY=;
 b=EkncEYUa4AxBx8NCdQmJNhUZSoeSIvFYjmIB5AWOp2HCZgcp36oqq2WOwwDTmyN9SEhdwl
 4yvBSWApTcm7v8HLHqfY8xxCHs3WBCDHqDjZn92+84VJhcVLjc6ONL55QdZXn7ZBb6AlKt
 h3lJcTcxoT86Vyb0Nxakc12Wd2gcGBI=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-219-8ttHbjgeNBKWrYL55z_Zqw-1; Mon, 19 Feb 2024 09:01:48 -0500
X-MC-Unique: 8ttHbjgeNBKWrYL55z_Zqw-1
Received: by mail-lj1-f199.google.com with SMTP id
 38308e7fff4ca-2d23b0ca7f7so8988731fa.3
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Feb 2024 06:01:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708351306; x=1708956106;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=u587ZdVcj3glUgoM/Hcg0rJugpW/yYo4cuFbTIpN5kY=;
 b=GqVu1wCqUaEMEfsoYKkmNiJhO2KKaU/OvCdzF251Ax/4BpkXyDKTwyF4KtfCzm6Wug
 TRVV9jbiwuZB1UOr9BflBv6KsLZXcHFfZqP+H6P9yXN8Mm3xPMOGUIa7idFAPLuYm4/q
 /zTYUHi9m6fhSr8Y+X6RMtWYcIkxvjive6DKyKEzrhXBM8+pxzZeJhBVVGtYyvhIzHJG
 p2hgtH+38GVuF/5Aibr64zP9uIymcEigwm1ERKeQyakXTUQG/vUEs15ZWkVIwS0tqo4n
 pVWctUf7mDjCqjYISDkb3sCc+brdLBWCYkvBlTehtSMlrymdZpaI27FYzsgZnv0gSbUo
 zjHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXL1fe47K3C/nA/qkITpt7vgVLhM76/FpyHViRLXMaokzoLFpLzxAkhNDyrMV1D/+lH1WkjZyQZBkDHWp4cbAGGrE0YOdqAk7+ojXH8xDgy
X-Gm-Message-State: AOJu0YwZyL83u2B+8o3hseki3JgbuafsrhUF6Ca/n0NW3Coxdko+rZWz
 Ean29RjFXx3wYEiB4n0EgYbq0gru0D12lRYJEltWbtrdCFjtPYlYFIzI2fwKrXz+Aan9QqZ8z5W
 hrAx/w5fRaO0pFJMrN/vfcEST4fGK7+/D0TYicru/k/Etkpvx9DK1r9ghbhsPY3YZ4Q==
X-Received: by 2002:a2e:bb88:0:b0:2d2:317a:4e51 with SMTP id
 y8-20020a2ebb88000000b002d2317a4e51mr2711443lje.19.1708351306649; 
 Mon, 19 Feb 2024 06:01:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFYOkgdkpjUPqkVShV5VUvUXvy45CYFqtPgSKyukje33ZPvJRJxa7MElMt9lvxrCNYhdDWEcw==
X-Received: by 2002:a2e:bb88:0:b0:2d2:317a:4e51 with SMTP id
 y8-20020a2ebb88000000b002d2317a4e51mr2711422lje.19.1708351306160; 
 Mon, 19 Feb 2024 06:01:46 -0800 (PST)
Received: from toolbox ([2001:9e8:89aa:1800:3845:886a:5f99:bee1])
 by smtp.gmail.com with ESMTPSA id
 v21-20020a05600c445500b0041266f5b041sm2964973wmn.34.2024.02.19.06.01.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Feb 2024 06:01:45 -0800 (PST)
Date: Mon, 19 Feb 2024 15:01:44 +0100
From: Sebastian Wick <sebastian.wick@redhat.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Emma Anholt <emma@anholt.net>, Jonathan Corbet <corbet@lwn.net>,
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Hans Verkuil <hverkuil@xs4all.nl>,
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: Re: Re: Re: Re: Re: Re: Re: [PATCH v5 08/44] drm/connector: hdmi:
 Add Broadcast RGB property
Message-ID: <20240219140144.GB1956149@toolbox>
References: <Zb0M_2093UwPXK8y@intel.com>
 <hez2m57ogqx3yyqk45tzdkvxvhrbdepgm244i4m2aty2xhf5b5@acqgvmxhmmvr>
 <Zb0aYAapkxQ2kopt@intel.com>
 <zml6j27skvjmbrfyz7agy5waxajv4p4asbemeexelm3wuv4o7j@xkd2wvnxhbuc>
 <20240209203435.GB996172@toolbox>
 <ahfl6f72lpgpsbnrbgvbsh4db4npr2hh36kua2c6krh544hv5r@dndw4hz2mu2g>
 <Zco-DQaXqae7B1jt@intel.com>
 <yx2t7xltxxgsngdsxamsfq6y7dze3wzegxcqwmsb5yrxen73x6@u3vilqhpci4w>
 <20240212170618.GA1372043@toolbox>
 <2mih3humepuedtli7ge52ncom4uffkqravdpalncgfyucmwdzc@bp5o7i3ky77a>
MIME-Version: 1.0
In-Reply-To: <2mih3humepuedtli7ge52ncom4uffkqravdpalncgfyucmwdzc@bp5o7i3ky77a>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 15, 2024 at 12:00:01PM +0100, Maxime Ripard wrote:
> On Mon, Feb 12, 2024 at 06:06:18PM +0100, Sebastian Wick wrote:
> > On Mon, Feb 12, 2024 at 05:53:48PM +0100, Maxime Ripard wrote:
> > > On Mon, Feb 12, 2024 at 05:49:33PM +0200, Ville Syrjälä wrote:
> > > > On Mon, Feb 12, 2024 at 11:01:07AM +0100, Maxime Ripard wrote:
> > > > > On Fri, Feb 09, 2024 at 09:34:35PM +0100, Sebastian Wick wrote:
> > > > > > On Mon, Feb 05, 2024 at 10:39:38AM +0100, Maxime Ripard wrote:
> > > > > > > On Fri, Feb 02, 2024 at 06:37:52PM +0200, Ville Syrjälä wrote:
> > > > > > > > On Fri, Feb 02, 2024 at 04:59:30PM +0100, Maxime Ripard wrote:
> > > > > > > > > On Fri, Feb 02, 2024 at 05:40:47PM +0200, Ville Syrjälä wrote:
> > > > > > > > > > On Fri, Feb 02, 2024 at 02:01:39PM +0100, Maxime Ripard wrote:
> > > > > > > > > > > Hi,
> > > > > > > > > > > 
> > > > > > > > > > > On Mon, Jan 15, 2024 at 03:37:20PM +0100, Sebastian Wick wrote:
> > > > > > > > > > > > > >  /**
> > > > > > > > > > > > > >   * DOC: HDMI connector properties
> > > > > > > > > > > > > >   *
> > > > > > > > > > > > > > + * Broadcast RGB
> > > > > > > > > > > > > > + *      Indicates the RGB Quantization Range (Full vs Limited) used.
> > > > > > > > > > > > > > + *      Infoframes will be generated according to that value.
> > > > > > > > > > > > > > + *
> > > > > > > > > > > > > > + *      The value of this property can be one of the following:
> > > > > > > > > > > > > > + *
> > > > > > > > > > > > > > + *      Automatic:
> > > > > > > > > > > > > > + *              RGB Range is selected automatically based on the mode
> > > > > > > > > > > > > > + *              according to the HDMI specifications.
> > > > > > > > > > > > > > + *
> > > > > > > > > > > > > > + *      Full:
> > > > > > > > > > > > > > + *              Full RGB Range is forced.
> > > > > > > > > > > > > > + *
> > > > > > > > > > > > > > + *      Limited 16:235:
> > > > > > > > > > > > > > + *              Limited RGB Range is forced. Unlike the name suggests,
> > > > > > > > > > > > > > + *              this works for any number of bits-per-component.
> > > > > > > > > > > > > > + *
> > > > > > > > > > > > > > + *      Drivers can set up this property by calling
> > > > > > > > > > > > > > + *      drm_connector_attach_broadcast_rgb_property().
> > > > > > > > > > > > > > + *
> > > > > > > > > > > > > 
> > > > > > > > > > > > > This is a good time to document this in more detail. There might be two
> > > > > > > > > > > > > different things being affected:
> > > > > > > > > > > > > 
> > > > > > > > > > > > > 1. The signalling (InfoFrame/SDP/...)
> > > > > > > > > > > > > 2. The color pipeline processing
> > > > > > > > > > > > > 
> > > > > > > > > > > > > All values of Broadcast RGB always affect the color pipeline processing
> > > > > > > > > > > > > such that a full-range input to the CRTC is converted to either full- or
> > > > > > > > > > > > > limited-range, depending on what the monitor is supposed to accept.
> > > > > > > > > > > > > 
> > > > > > > > > > > > > When automatic is selected, does that mean that there is no signalling,
> > > > > > > > > > > > > or that the signalling matches what the monitor is supposed to accept
> > > > > > > > > > > > > according to the spec? Also, is this really HDMI specific?
> > > > > > > > > > > > > 
> > > > > > > > > > > > > When full or limited is selected and the monitor doesn't support the
> > > > > > > > > > > > > signalling, what happens?
> > > > > > > > > > > > 
> > > > > > > > > > > > Forgot to mention: user-space still has no control over RGB vs YCbCr on
> > > > > > > > > > > > the cable, so is this only affecting RGB? If not, how does it affect
> > > > > > > > > > > > YCbCr?
> > > > > > > > > > > 
> > > > > > > > > > > So I dug a bit into both the i915 and vc4 drivers, and it looks like if
> > > > > > > > > > > we're using a YCbCr format, i915 will always use a limited range while
> > > > > > > > > > > vc4 will follow the value of the property.
> > > > > > > > > > 
> > > > > > > > > > The property is literally called "Broadcast *RGB*".
> > > > > > > > > > That should explain why it's only affecting RGB.
> > > > > > > > > 
> > > > > > > > > Right. And the limited range option is called "Limited 16:235" despite
> > > > > > > > > being usable on bpc > 8 bits. Naming errors occurs, and history happens
> > > > > > > > > to make names inconsistent too, that's fine and not an argument in
> > > > > > > > > itself.
> > > > > > > > > 
> > > > > > > > > > Full range YCbCr is a much rarer beast so we've never bothered
> > > > > > > > > > to enable it.
> > > > > > > > > 
> > > > > > > > > vc4 supports it.
> > > > > > > > 
> > > > > > > > Someone implemented it incorrectly then.
> > > > > > > 
> > > > > > > Incorrectly according to what documentation / specification? I'm sorry,
> > > > > > > but I find it super ironic that i915 gets to do its own thing, not
> > > > > > > document any of it, and when people try to clean things up they get told
> > > > > > > that we got it all wrong.
> > > > > > 
> > > > > > FWIW, this was an i915 property and if another driver uses the same
> > > > > > property name it must have the same behavior. Yes, it isn't standardized
> > > > > > and yes, it's not documented (hence this effort here) but it's still on
> > > > > > vc4 to make the property compatible.
> > > > > 
> > > > > How is it not compatible? It's a superset of what i915 provides, but
> > > > > it's strictly compatible with it.
> > > > 
> > > > No it is not.
> > > 
> > > The property is compatible with i915 interpretation of it, whether you
> > > like it or not. And that's what Sebastian was referring to.
> > > 
> > > > Eg. what happens if you set the thing to full range for RGB (which you
> > > > must on many broken monitors), and then the kernel automagically
> > > > switches to YCbCr (for whatever reason) but the monitor doesn't
> > > > support full range YCbCr? Answer: you get crap output.
> > > 
> > > And that part is just moving goalposts.
> > 
> > But it's really not.
> 
> It really is. This whole discussion started by "well it would be nice if
> we made that property handled by the core", and we're now at the "we
> need to deal with broken YCbCr displays and i915 opinion about them"
> stage. After creating documentation, unit tests, etc. It's the textbook
> definition of moving goalposts. And while i915 won't be affected by all
> that work.

Sorry, but what you're saying is just not true.

The Broadcast RGB property is an Intel specific property. It lacked
documentation but the user space contract exists and it based on how
i915 implemented it. By changing the semantics you're breaking user
space. The documentation has to document the current contract between
i915 and user space, not whatever you want the property to be like.

I get that you're frustrated that you have to do work while i915 doesn't
but none of that is relevant for what the property is and how user space
expects it to work.

> That series has been stuck for multiple iterations on pointless and
> mundane debates while the biggest part and whole point of it is not
> getting any review. So yeah, sorry, it's frustrating.

I'm reviewing the parts that I can, and that's the uAPI. I find it
really offensive that you're saying that this is pointless and mundate.
The uAPI is your end product, if it can't be used, everything you do in
your driver is utterly pointless.

> > The Broadcast RGB property kind of works from a user space perspective
> > because it's a workaround for broken sinks. If a sink expects limited
> > range we can force full range. If this however affects YCbCr modes as
> > well, then this isn't a workaround for broken RGB range anymore
> > because it now breaks YCbCr.
> 
> Or, you know, it's a workaround for broken YCbCr display.

Displays can accept both RGB and YCbCr signals, drivers can chose
whichever they want, and user space can not influence or even know which
one is being used.

The automatic selection of the range is very different between RGB and
YCbCr. If user space forces the range to a specific value and the driver
for whatever reason switches from RGB to YCbCr or the other way around,
this forcing of the range will most likely be incorrect.

This is what we're talking about when we say that the semantics of the
vc4 Broadcast RGB property is broken. User space literally cannot use it
consistenly. By restricting it to RGB signals, user space can user it
consistently and fix monitors that do not follow the automatic
quantization range algorithm correctly. Yes, if there is an issue with
the quantization range of a YCbCr signal then this property doesn't
help, but it never tried to help those cases.

> > Sorry, but vc4 just has to change.
> > 
> > And again: let's please stop trying to improve the property.
> 
> I'm not. I'm super close to just dropping that patch entirely and keep
> the current situation that seems to work fine for everyone.

I mean, vc4 doesn't work fine apparently. You're just lucky that no one
reported issues to you.

All you have to do is adjust the documentation to say that Broadcast RGB
only affects RGB signalling. Yes, vc4 has a bug according to the docs
then, but that's okay. Fix it at some point.

> Maxime


