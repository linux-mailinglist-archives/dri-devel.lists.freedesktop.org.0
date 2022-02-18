Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E924BB85D
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 12:40:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E3B410EC1F;
	Fri, 18 Feb 2022 11:40:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41D7010EC1F;
 Fri, 18 Feb 2022 11:39:59 +0000 (UTC)
Date: Fri, 18 Feb 2022 11:39:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1645184396;
 bh=SoHk44i+hSrhGCWSov+A62f5mQ4gQxdPxK6xjt+fVz8=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID;
 b=ChUDHjrsfiukE7xWvak5fl+9SyIK7pibGyeOyRknvdnWxOVzG99VSWcQsJSiPUt6f
 9grvADHYFpp6DuC3gpQxTA69WdKAKyR7Mo/nwEB5QUyrC/dx+/CtDZF2YWNhQPW2Tl
 6+PnGc7RYTUjB1yibcvsbposFqs/0AkGQWJQfO//UxykAiqHXBvIPFzDz0UEkfa/fp
 MPDl3GjdqU9eTZAdYmjZdoFqdVxzIO9C1MOXcv02MRUgupJ5WQim3ZWvjshZxNREVr
 Dea5zfYRhicyLTflwxZeX0A1AFnYhkSLuejA6v53Ic38Uw3A/A2lg1P0Tvxx56g9q5
 bAYyZ4KyBzgvQ==
To: Hans de Goede <hdegoede@redhat.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [Intel-gfx] [PATCH v8 1/3] gpu: drm: separate panel orientation
 property creating and value setting
Message-ID: <YV87l-2XXzmZ2i6GuGd__uf85s2JQkbXt_qTQDYlbBh1kW2COJoNLUDinmLCokKyy-_0ZnIMUcZeW0GdJ8zF690iYi4ThKrjc09omNMe-0g=@emersion.fr>
In-Reply-To: <d3f0cc20-d226-ee42-cc98-b469949cec9e@redhat.com>
References: <20220208084234.1684930-1-hsinyi@chromium.org>
 <CACvgo53u01BK_D0ZssV+gCepjxSz23Nr5Dy1qXeaAoJuu6VCFQ@mail.gmail.com>
 <KW6DNh6IRRgVJx9DfOFBnEqc4a0x-AnDXEbMxwpfEbk8dOn_KGVzAfo-slJWq-4nWW728Uc-OVpFh2w4fDE4-bxfkDuz1hFILRVvbcuXqaw=@emersion.fr>
 <CACvgo532-pC+7DLFCo=DWTX-OnJEJvSoTmQnt3_qLhiT4cqEMg@mail.gmail.com>
 <GYG6EVT1MqtmfKiPpMhDG9mpuATnmwVDq2PuE_dpDat5oQW_t1tUfm39lSWHj32D5r7mrog27sL4dkgdMYQ5BN830TfVOrgQ4Ts8LcO8Hcs=@emersion.fr>
 <CACvgo52+o9_ETC+1RKzqKkyw3ZJ28RjH0BqC9DfmNAKqByud8Q@mail.gmail.com>
 <d3f0cc20-d226-ee42-cc98-b469949cec9e@redhat.com>
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

On Friday, February 18th, 2022 at 11:38, Hans de Goede <hdegoede@redhat.com=
> wrote:

> What I'm reading in the above is that it is being considered to allow
> changing the panel-orientation value after the connector has been made
> available to userspace; and let userspace know about this through a ueven=
t.
>
> I believe that this is a bad idea, it is important to keep in mind here
> what userspace (e.g. plymouth) uses this prorty for. This property is
> used to rotate the image being rendered / shown on the framebuffer to
> adjust for the panel orientation.
>
> So now lets assume we apply the correct upside-down orientation later
> on a device with an upside-down mounted LCD panel. Then on boot the
> following could happen:
>
> 1. amdgpu exports a connector for the LCD panel to userspace without
> setting panel-orient=3Dupside-down
> 2. plymouth sees this and renders its splash normally, but since the
> panel is upside-down it will now actually show upside-down

At this point amdgpu hasn't probed the connector yet. So the connector
will be marked as disconnected, and plymouth shouldn't render anything.

> 3. amdgpu adjusts the panel-orient prop to upside-down, sends out
> uevents

That's when amdgpu marks the connector as connected. So everything
should be fine I believe, no bad frame.

> 4. Lets assume plymouth handles this well (i) and now adjust its
> rendering and renders the next frame of the bootsplash 180=C2=B0 rotated
> to compensate for the panel being upside down. Then from now on
> the user will see the splash normally
>
> So this means that the user will briefly see the bootsplash rendered
> upside down which IMHO is not acceptable behavior. Also see my footnote
> about how I seriously doubt plymouth will see the panel-orient change
> at all.
>
> I'm also a bit unsure about:
>
> a) How you can register the panel connector with userspace before
> reading the edid, don't you need the edid to give the physical size +
> modeline to userspace, which you cannot just leave out ?

Yup. The KMS EDID property is created before the EDID is read, and is set
to zero (NULL blob). The width/height in mm and other info are also zero.
You can try inspecting the state printed by drm_info on any disconnected
connector to see for yourself.

> I guess the initial modeline is inherited from the video-bios, but
> what about the physical size? Note that you cannot just change the
> physical size later either, that gets used to determine the hidpi
> scaling factor in the bootsplash, and changing that after the initial
> bootsplash dislay will also look ugly
>
> b) Why you need the edid for the panel-orientation property at all,
> typically the edid prom is part of the panel and the panel does not
> know that it is mounted e.g. upside down at all, that is a property
> of the system as a whole not of the panel as a standalone unit so
> in my experience getting panel-orient info is something which comes
> from the firmware /video-bios not from edid ?

This is an internal DRM thing. The orientation quirks logic uses the
mode size advertised by the EDID. I agree that at least in the Steam
Deck case it may not make a lot of sense to use any info from the
EDID, but that's needed for the current status quo.

Also note, DisplayID has a bit to indicate the panel orientation IIRC.
Would be nice to support parsing this at some point.
