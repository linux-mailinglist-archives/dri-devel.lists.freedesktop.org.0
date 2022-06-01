Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7553153AEB1
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 00:25:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6151B10E55C;
	Wed,  1 Jun 2022 22:25:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C18910E55C
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 22:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654122345;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o6uGh4GX3aaSHhUAFna4Ubw1W2VE4pAPKzKSqjHo4iI=;
 b=dPILyw80u/xD6PR8fRwiZ4AUv9XcJC9KYJWUr01cn27UfqQhOl6KS3wdWtQV5Eq6AbIg6K
 ZF+ufFrDPT5oucp+enEs7VDG8jYTk9VlbO8xOo3CIGEusoS88DfHR0thamyF+47XqemRCq
 RGLTlYQMZKCR6SjWwiSQsrFgvSjskI4=
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com
 [209.85.160.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-675-YEWqO670OYGNOT_EvdVgvQ-1; Wed, 01 Jun 2022 18:25:42 -0400
X-MC-Unique: YEWqO670OYGNOT_EvdVgvQ-1
Received: by mail-oa1-f71.google.com with SMTP id
 586e51a60fabf-e653506dd0so1955345fac.14
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jun 2022 15:25:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=o6uGh4GX3aaSHhUAFna4Ubw1W2VE4pAPKzKSqjHo4iI=;
 b=BXuQG0FXw/635Ere1fdDHz5JWZp30jskK44fwj1IRizXy83EYNrjefjVXkKTwdwc+n
 w/JDaxG8EkQPG2LTqwxS5S6OMHIk5TuAzL25SX8Cvzh9SLvU3kc4DpNYDXR+CauOgd7S
 ZQJYAnV/2jfxj13Qj5DIxCm3bH3RiEJUAJ7ksBVSuAFYyqp0iZLMo31S8n0jor9mIWTN
 o1JtXvj0djPgVYC3dFn5OqgQyUAXfUYtQH/t/9+eULHtcekyuvExmiD9X5w1i1kUHZBf
 bf0omy2LtvSJHcZ/brrBS1GFI9KHapUpD6gEmOpMaCXmdrZgxGrigWQ7e2uPz4fSaoLL
 oWLA==
X-Gm-Message-State: AOAM532VQ7FLtAdI9HRWysQUESj3Qx+8YX7yl7Ftvncj5u/fUSpeU7Pk
 EadmNlqx/3D3SElCl8tsKxYFQUT+ddpCseTQ4Z+OnmWVkJIRxb4TSaeVtBbkqaW1Lb+oKpTZCs7
 LwxGU7lzfdADEWaDbOUIIqIPr1bslQQ5TIQcw8l0q2so+
X-Received: by 2002:a05:6808:1510:b0:32a:ef1a:7a00 with SMTP id
 u16-20020a056808151000b0032aef1a7a00mr1023134oiw.161.1654122342126; 
 Wed, 01 Jun 2022 15:25:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxHaIaZ5795gIhYy2gDi80WI8pYp6ShMBMmSaRmBezJ/9Z9LslBOntDfbSbl9Ap/wgeA51KfgLKi7hDHjr0jrE=
X-Received: by 2002:a05:6808:1510:b0:32a:ef1a:7a00 with SMTP id
 u16-20020a056808151000b0032aef1a7a00mr1023118oiw.161.1654122341846; Wed, 01
 Jun 2022 15:25:41 -0700 (PDT)
MIME-Version: 1.0
References: <YmgyArRaJCh6JkQh@intel.com>
 <57d16ed5-8bfc-ce29-9250-14e2de18710a@redhat.com>
 <20220523112246.056ddc99@eldfell>
 <CA+hFU4wTHR9kLrFY3XkbeROZgxWamiZ6yGYL4jH+wpe8MzLvMw@mail.gmail.com>
 <20220525102850.5a70e58f@eldfell>
 <80798931-dbe7-54d7-8e1a-aaebfc39780c@mailbox.org>
 <U2A3FifHdFH9yDVrigaioxCTNx60MgkND7jcyIeKP2S4Ghu-BmmRaODqBDp6K0Q-aPBjPcqa2zUGuJNkGmRWZyQx2FjRJe9dVtJhQG9ZNCk=@emersion.fr>
 <20220525133647.052d09da@eldfell> <YpZSWwVkhJOalM4M@intel.com>
 <20220601102126.4f3602fd@eldfell> <YpdyYbRZP2fdG9Fz@intel.com>
In-Reply-To: <YpdyYbRZP2fdG9Fz@intel.com>
From: Sebastian Wick <sebastian.wick@redhat.com>
Date: Thu, 2 Jun 2022 00:25:30 +0200
Message-ID: <CA+hFU4xXw34LSDx32BoaN=QRJfAMPM8++xUBSrKZph+fA9FT5A@mail.gmail.com>
Subject: Re: How should "max bpc" and "Colorspace" KMS property work?
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sewick@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
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
Cc: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 =?UTF-8?B?Sm9uYXMgw4VkYWhs?= <jadahl@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Hans de Goede <hdegoede@redhat.com>, Pekka Paalanen <ppaalanen@gmail.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 1, 2022 at 4:06 PM Ville Syrj=C3=A4l=C3=A4
<ville.syrjala@linux.intel.com> wrote:
>
> On Wed, Jun 01, 2022 at 10:21:26AM +0300, Pekka Paalanen wrote:
> > On Tue, 31 May 2022 20:37:31 +0300
> > Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com> wrote:
> >
> > > On Wed, May 25, 2022 at 01:36:47PM +0300, Pekka Paalanen wrote:
> > > > On Wed, 25 May 2022 09:23:51 +0000
> > > > Simon Ser <contact@emersion.fr> wrote:
> > > >
> > > > > On Wednesday, May 25th, 2022 at 10:35, Michel D=C3=A4nzer <michel=
.daenzer@mailbox.org> wrote:
> > > > >
> > > > > > > Mind that "max bpc" is always in auto. It's only an upper lim=
it, with
> > > > > > > the assumption that the driver can choose less.
> > > > > >
> > > > > > It seems to me like the "max bpc" property is just kind of bad =
API,
> > > > > > and trying to tweak it to cater to more use cases as we discove=
r them
> > > > > > will take us down a rabbit hole. It seems better to replace it =
with
> > > > > > new properties which allow user space to determine the current
> > > > > > effective bpc and to explicitly control it.
> > > > >
> > > > > +1, this sounds much more robust, and allows better control by us=
er-space.
> > > > > User-space needs to have fallback logic for other state as well a=
nyways.
> > > > > If the combinatorial explosion is too much, we should think about=
 optimizing
> > > > > the KMS implementation, or improve the uAPI.
> > > >
> > > > +1 as well, with some recommendations added and the running off to =
the
> > > > sunset:
> > > >
> > > > Use two separate KMS properties for reporting current vs.
> > > > programming desired. The KMS property reporting the current value
> > > > must be read-only (immutable). This preserves the difference betwee=
n
> > > > what userspace wanted and what it got, making it possible to read
> > > > back both without confusing them. It also allows preserving driver =
behaviour
> > >
> > > I don't see much real point in a property to report the current bpc.
> > > That can't be used to do anything atomically. So I suppose plymouth
> > > would be the only user.
> >
> > Hi Ville,
> >
> > I think also professional color managed display servers would need it.
> >
> > If they detect that the link bpc is no longer the same as it was when
> > the monitor was profiled, the profile will need to be re-verified by
> > measuring the monitor again.
> >
> > See "Color calibration auditing system" notes in
> > https://gitlab.freedesktop.org/wayland/weston/-/issues/467 description.
> >
> > > So IMO if someone really need explicit control over this then we
> > > should just expose properties to set things explicitly. So we'd
> > > need at least props for the actual bpc and some kind of color
> > > encoding property (RGB/YCbCr 4:4:4/4:2:2:/4:2:0, etc.). And someone
> > > would really need to figure out how DSC would interact with those.
> >
> > I believe there still must be "auto" setting for bpc, and a separate
> > feedback property, so that userspace can use "auto" to see what it can
> > get without doing thousands of TEST_ONLY commits plus a few "link
> > status" failure handlings in order to find a working configuration (I'm
> > assuming we have many more properties than just "max bpc" to figure
> > out). After "auto" has told userspace what actually works without blind
> > trial and error, then userspace can program than value explicitly to
> > make sure it doesn't change accidentally in the future.
>
> Yeah we need "auto", but IMO mainly just to keep the current userspace
> working. Using that to probe what's possible doesn't sound particularly
> workable since you can't use it with TEST_ONLY commits. Also change to
> some other property could still cause the whole thing to fail after the
> max bpc has been probed so not sure it really buys you anything.

Why would we need "auto" to not break user space?

I agree though that a single property which accurately reflects the
"bpc" should be sufficient. If you want to set bpc to a certain value
you probably also want to do the same for RGB/YUV subsampling and DSC
which makes selecting a working mode without TEST_ONLY commits
impractical.

The combinatorial explosion is a real issue but to me it seems
possible to aggregate some properties into a group without
dependencies on other properties. For example we could have a "mode"
group which contains "MODE_ID", "bpc", pixel format/subsampling and
DSC properties in the future. If the atomic test commit then returns a
bitmask of the groups which failed you can considerably cut down on
the combinatorial problem.

>
> >
> > What's DSC?
>
> Compression.
>
> >
> > Now that you mentioned some kind of color encoding property (I assume
> > you referred mostly to the sub-sampling aspect), how does the connector
> > property "Colorspace" factor in?
>
> The "Colorspace" property just changes what we report to the display
> via infoframes/MSA/SDP. It does not cause the display hardware to do
> any colorspace conversion/etc.
>
> To actually force the display hardware to do the desired conversion
> we need some new properties. ATM the only automagic conversion that
> can happen (at least with i915) is the RGB 4:4:4->YCbCr 4:2:0 fallback,
> which is needed on some displays to get 4k+ modes to work at all.

Having control over this and compression would also help with defining
bpc. We could say bpc refers to the minimum bpc of all components for
RGB and the bpc of the luminance channel for YUV, all with compression
disabled. If user space turns on subsampling and compression it
understands the impacts on the effective bit depth.

Anyway, the Colorspace property is literally impossible to set
correctly because the kernel can just send either RGB or YUV without
any way for user space to figure out which it is but it's responsible
for sending the corresponding Colorspace. If I set the colorspace with
the wrong pixel format the colors are, as expected, completely broken
and there is nothing I can do but hope that it works by accident.

>
> >
> > The enum values (which are not documented in KMS docs, btw.) are tuples
> > of color space + color model, e.g. on Intel:
> >
> > "Colorspace": enum {Default, SMPTE_170M_YCC, BT709_YCC, XVYCC_601,
> > XVYCC_709, SYCC_601, opYCC_601, opRGB, BT2020_CYCC, BT2020_RGB,
> > BT2020_YCC, DCI-P3_RGB_D65, DCI-P3_RGB_Theater}
>
> The accepted values are just what the CTA-861/DP specs
> allow us to transmit in he infoframe/SDP/MSA.
>
> >
> > Reading the KMS docs from
> > https://www.kernel.org/doc/html/latest/gpu/drm-kms.html#standard-connec=
tor-properties
> > they say:
> >
> > > Basically the expectation from userspace is:
> > >
> > >         Set up CRTC DEGAMMA/CTM/GAMMA to convert to some sink
> > > colorspace
> > >
> > >         Set this new property to let the sink know what it converted
> > > the CRTC output to.
> > >
> > >         This property is just to inform sink what colorspace source
> > > is trying to drive.
> >
> > However, where does userspace program the actual conversion from RGB to
> > NNN? Is it expected to be embedded in CTM?
> >
> > Or does setting "Colorspace" imply some additional automatic
> > conversion? If so, where does it happen and how is it chosen?
> >
> > > For just the plymouth case I guess the easiest thing would be to
> > > just clamp "max bpc" to the current value. The problem with that
> > > is that we'd potentially break existing userspace. Eg. I don't think
> > > the modesetting ddx or perhaps even most of the wayland compositors
> > > set "max bpc" at all. So we'd need to roll out a bunch of userspace
> > > updates first. And the "current bpc" prop idea would also have this
> > > same problem since plymouth would just clamp "max bpc" based on the
> > > current bpc before the real userspace starts.
> >
> > True, but I believe once color management spreads through Wayland, so
> > will KMS clients also learn to set it.
>
> Sure. But my point is that if we want to change how the "max bpc"
> works I think we need to roll out the userspace stuff first so that
> we at least can tell the user "please update you userspace to release x"
> when they hit the regression.

Shouldn't we just change "max bpc" to always be the maximum by
default? This doesn't break any user space but also doesn't solve the
plymouth issue. For that we would then use the "bpc" property which
always reflects the actual value. Plymouth would then set "bpc" to
max(current bpc, 8) and leave "max bpc" at maximum.

>
> --
> Ville Syrj=C3=A4l=C3=A4
> Intel
>

