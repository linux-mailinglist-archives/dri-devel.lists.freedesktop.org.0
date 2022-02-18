Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7709B4BB8EF
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 13:13:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18C8810E6E3;
	Fri, 18 Feb 2022 12:12:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1977 seconds by postgrey-1.36 at gabe;
 Fri, 18 Feb 2022 12:12:56 UTC
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28D3810E391;
 Fri, 18 Feb 2022 12:12:56 +0000 (UTC)
Date: Fri, 18 Feb 2022 12:12:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1645186373;
 bh=obcqmVH+DAiCiMe4lhhI6hr1y7IfE4219TpOs/ZsuSQ=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID;
 b=ZEFODOlFQCGBrINCjM2CuIs1XTHQJc1w7H096U/gm4jy5vxGR+gw29LNgGcp9+8zN
 o6VjXAKG4pIyu0IkmQdozIlocBuXjNO96dfF1zr2bIve1p/twEDsFj83JrjHyDZ1c3
 Rni3amD5vVJLgqF7uMQb4Q3Wdr4RhSYDsIHExBiVcEL+rW2IulpxB1pEV1xXgK8J90
 nHU0zBOR3kJyWdWt68oXac71i6ZEKwjQtVBZEVu5fod53M/9v8grxYWCW2zxfL2Sm8
 cZETRSe/cvKANyWWSGuKIoUYJ7xyTf07frTMfuPP+VLNsBc3c2Zf5Ies01iCqVJL5z
 aHik0JtrIO7Pw==
To: Hans de Goede <hdegoede@redhat.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [Intel-gfx] [PATCH v8 1/3] gpu: drm: separate panel orientation
 property creating and value setting
Message-ID: <DM7TzJ-fZEHjoGXvMG8XLfJ2VxohRxotL40_0Vb4cAUvrELgV9BvPGbK6HAwOYOBCx8qXtY2LQ0xnZ-nlH_IVCyne7tMKfvkqxtoWI6MkTw=@emersion.fr>
In-Reply-To: <d4f5e101-3dd5-2f3a-6c14-6b32ee37c223@redhat.com>
References: <20220208084234.1684930-1-hsinyi@chromium.org>
 <CACvgo53u01BK_D0ZssV+gCepjxSz23Nr5Dy1qXeaAoJuu6VCFQ@mail.gmail.com>
 <KW6DNh6IRRgVJx9DfOFBnEqc4a0x-AnDXEbMxwpfEbk8dOn_KGVzAfo-slJWq-4nWW728Uc-OVpFh2w4fDE4-bxfkDuz1hFILRVvbcuXqaw=@emersion.fr>
 <CACvgo532-pC+7DLFCo=DWTX-OnJEJvSoTmQnt3_qLhiT4cqEMg@mail.gmail.com>
 <GYG6EVT1MqtmfKiPpMhDG9mpuATnmwVDq2PuE_dpDat5oQW_t1tUfm39lSWHj32D5r7mrog27sL4dkgdMYQ5BN830TfVOrgQ4Ts8LcO8Hcs=@emersion.fr>
 <CACvgo52+o9_ETC+1RKzqKkyw3ZJ28RjH0BqC9DfmNAKqByud8Q@mail.gmail.com>
 <d3f0cc20-d226-ee42-cc98-b469949cec9e@redhat.com>
 <YV87l-2XXzmZ2i6GuGd__uf85s2JQkbXt_qTQDYlbBh1kW2COJoNLUDinmLCokKyy-_0ZnIMUcZeW0GdJ8zF690iYi4ThKrjc09omNMe-0g=@emersion.fr>
 <d4f5e101-3dd5-2f3a-6c14-6b32ee37c223@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,T_SCC_BODY_TEXT_LINE
 shortcircuit=no autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 devicetree <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 LAKML <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Friday, February 18th, 2022 at 12:54, Hans de Goede <hdegoede@redhat.com=
> wrote:

> On 2/18/22 12:39, Simon Ser wrote:
> > On Friday, February 18th, 2022 at 11:38, Hans de Goede <hdegoede@redhat=
.com> wrote:
> >
> >> What I'm reading in the above is that it is being considered to allow
> >> changing the panel-orientation value after the connector has been made
> >> available to userspace; and let userspace know about this through a ue=
vent.
> >>
> >> I believe that this is a bad idea, it is important to keep in mind her=
e
> >> what userspace (e.g. plymouth) uses this prorty for. This property is
> >> used to rotate the image being rendered / shown on the framebuffer to
> >> adjust for the panel orientation.
> >>
> >> So now lets assume we apply the correct upside-down orientation later
> >> on a device with an upside-down mounted LCD panel. Then on boot the
> >> following could happen:
> >>
> >> 1. amdgpu exports a connector for the LCD panel to userspace without
> >> setting panel-orient=3Dupside-down
> >> 2. plymouth sees this and renders its splash normally, but since the
> >> panel is upside-down it will now actually show upside-down
> >
> > At this point amdgpu hasn't probed the connector yet. So the connector
> > will be marked as disconnected, and plymouth shouldn't render anything.
>
> If before the initial probe of the connector there is a /dev/dri/card0
> which plymouth can access, then plymouth may at this point decide
> to disable any seemingly unused crtcs, which will make the screen go blac=
k...
>
> I'm not sure if plymouth will actually do this, but AFAICT this would
> not be invalid behavior for a userspace kms consumer to do and I
> believe it is likely that mutter will disable unused crtcs.
>
> IMHO it is just a bad idea to register /dev/dri/card0 with userspace
> before the initial connector probe is done. Nothing good can come
> of that.
>
> If all the exposed connectors initially are going to show up as
> disconnected anyways what is the value in registering /dev/dri/card0
> with userspace early ?

OK. I'm still unsure how I feel about this, but I think I agree with
you. That said, the amdgpu architecture is quite involved with multiple
abstraction levels, so I don't think I'm equipped to write a patch to
fix this...

cc Daniel Vetter: can you confirm probing all connectors is a good thing
to do on driver module load?

> >> I guess the initial modeline is inherited from the video-bios, but
> >> what about the physical size? Note that you cannot just change the
> >> physical size later either, that gets used to determine the hidpi
> >> scaling factor in the bootsplash, and changing that after the initial
> >> bootsplash dislay will also look ugly
> >>
> >> b) Why you need the edid for the panel-orientation property at all,
> >> typically the edid prom is part of the panel and the panel does not
> >> know that it is mounted e.g. upside down at all, that is a property
> >> of the system as a whole not of the panel as a standalone unit so
> >> in my experience getting panel-orient info is something which comes
> >> from the firmware /video-bios not from edid ?
> >
> > This is an internal DRM thing. The orientation quirks logic uses the
> > mode size advertised by the EDID.
>
> The DMI based quirking does, yes. But e.g. the quirk code directly
> reading this from the Intel VBT does not rely on the mode.
>
> But if you are planning on using a DMI based quirk for the steamdeck
> then yes that needs the mode.
>
> Thee mode check is there for 2 reasons:
>
> 1. To avoid also applying the quirk to external displays, but
> I think that that is also solved in most drivers by only checking for
> a quirk at all on the eDP connector
>
> 2. Some laptop models ship with different panels in different badges
> some of these are portrait (so need a panel-orient) setting and others
> are landscape.

That makes sense. So yeah the EDID mode based matching logic needs to
stay to accomodate for these cases.

> > I agree that at least in the Steam
> > Deck case it may not make a lot of sense to use any info from the
> > EDID, but that's needed for the current status quo.
>
> We could extend the DMI quirk mechanism to allow quirks which don't
> do the mode check, for use on devices where we can guarantee neither
> 1 nor 2 happens, then amdgpu could call the quirk code early simply
> passing 0x0 as resolution.

Yeah. But per the above amdgpu should maybe probe connectors on module
load. If/when amdgpu is fixed to do this, then we don't need to disable
the mode matching logic in panel-orientation quirks anymore.
