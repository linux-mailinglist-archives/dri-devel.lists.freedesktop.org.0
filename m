Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C96E3E00E5
	for <lists+dri-devel@lfdr.de>; Wed,  4 Aug 2021 14:11:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F3006E885;
	Wed,  4 Aug 2021 12:11:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20AF36E885
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Aug 2021 12:11:38 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id u10so2574065oiw.4
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Aug 2021 05:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=/JqLSDyQKVJHt2YU+gy7/AycqCxGg0k+h1FpK6S7JXQ=;
 b=CeuSKZFhWvKZbdcJUK5F7VcDmxcYNsBSSUQd3xywKZsRrm2DYbplx5GMEU7mBrvLZ0
 thJCKP5Az7N3J32ApQp/ySGNoPH+xoGmT+TpF4t3kwjpgg1R0pZrodtW2epxf2tJpXNP
 8dK0XeN2Eh8PyVw8MgzZzdEBjoC96H8XW2FmQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/JqLSDyQKVJHt2YU+gy7/AycqCxGg0k+h1FpK6S7JXQ=;
 b=C3uqJ16pGU9LCPoUa0KR/TiXc371sXqx4zOgI8LLb7OwSaXVOC+Vm7HviFMFqFy4c2
 xbQ3ILPpp3hjPcN3uic8kEolA9yYusP1VmiCLqsPlK+35Jbqmk4+yAjru9DZfu4FjaSK
 aiUhrQcaS8gu2d/VVZSHuc1gauQDxlhrvQrTn33pWYK6o91yhYZ0fofn5zIO/RZcAc6T
 3h3XTls/AfEb/z+8zS9985sX3nz3X99QN0UYMbRyF0x/GMeVS/AwYmwYYMY7+jf0e3se
 6YpzjOKTbATOn3s2oUdqIiApkBbMczFykcKnF8+QTS/7lowMhb8mEgwfhixfTILkjD4m
 Lrog==
X-Gm-Message-State: AOAM530jzFuV9loO9FCHhXQ73cHEF2k/DRwMwybapvgb/qRx4oNgb5qm
 5p0wUKvP3L0IX0EZCvHixODVXXlPM9njXULX24fHkQ==
X-Google-Smtp-Source: ABdhPJx19xvI8w2uI+wP+MfBueVhMrlUGqy/mLBuzPCTicZ3IVehY1gKpHGqUelnlVVpw3D6tgGVcXyqzNC9wyMprl8=
X-Received: by 2002:a05:6808:2109:: with SMTP id
 r9mr4853788oiw.101.1628079097259; 
 Wed, 04 Aug 2021 05:11:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210729081659.2255499-1-vivek.kasireddy@intel.com>
 <YQPTo0D5SZfX44dn@phenom.ffwll.local>
 <612fd31a51384cb28ac6da9db3e840ca@intel.com>
 <YQepZMFaCNLBNGx9@phenom.ffwll.local>
 <fa53f9db229e481784bfe3a61a195fd3@intel.com>
 <1b96e91f-d65c-a155-8c8c-8a4326733c4e@daenzer.net>
In-Reply-To: <1b96e91f-d65c-a155-8c8c-8a4326733c4e@daenzer.net>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 4 Aug 2021 14:11:25 +0200
Message-ID: <CAKMK7uH7gy7x-MrN7EWwwdsZKn-i5XB5Wie_ueRXXdnx5Yhefw@mail.gmail.com>
Subject: Re: [RFC v1 0/4] drm: Add support for DRM_CAP_DEFERRED_OUT_FENCE
 capability
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>
Cc: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Gerd Hoffmann <kraxel@redhat.com>, 
 Pekka Paalanen <ppaalanen@gmail.com>, Simon Ser <contact@emersion.fr>, 
 "Zhang, Tina" <tina.zhang@intel.com>, "Kim, Dongwon" <dongwon.kim@intel.com>, 
 "Singh, Satyeshwar" <satyeshwar.singh@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 3, 2021 at 9:34 AM Michel D=C3=A4nzer <michel@daenzer.net> wrot=
e:
> On 2021-08-03 8:11 a.m., Kasireddy, Vivek wrote:
> >>> The goal:
> >>> - Maintain full framerate even when the Guest scanout FB is flipped o=
nto a hardware
> >> plane
> >>> on the Host -- regardless of either compositor's scheduling policy --=
 without making any
> >>> copies and ensuring that both Host and Guest are not accessing the bu=
ffer at the same
> >> time.
> >>>
> >>> The problem:
> >>> - If the Host compositor flips the client's buffer (in this case Gues=
t compositor's buffer)
> >>> onto a hardware plane, then it can send a wl_buffer.release event for=
 the previous buffer
> >>> only after it gets a pageflip completion. And, if the Guest composito=
r takes 10-12 ms to
> >>> submit a new buffer and given the fact that the Host compositor waits=
 only for 9 ms, the
> >>> Guest compositor will miss the Host's repaint cycle resulting in halv=
ed frame-rate.
> >>>
> >>> The solution:
> >>> - To ensure full framerate, the Guest compositor has to start it's re=
paint cycle (including
> >>> the 9 ms wait) when the Host compositor sends the frame callback even=
t to its clients.
> >>> In order for this to happen, the dma-fence that the Guest KMS waits o=
n -- before sending
> >>> pageflip completion -- cannot be tied to a wl_buffer.release event. T=
his means that, the
> >>> Guest compositor has to be forced to use a new buffer for its next re=
paint cycle when it
> >>> gets a pageflip completion.
> >>
> >> Is that really the only solution?
> > [Kasireddy, Vivek] There are a few others I mentioned here:
> > https://gitlab.freedesktop.org/wayland/weston/-/issues/514#note_986572
> > But I think none of them are as compelling as this one.
> >
> >>
> >> If we fix the event timestamps so that both guest and host use the sam=
e
> >> timestamp, but then the guest starts 5ms (or something like that) earl=
ier,
> >> then things should work too? I.e.
> >> - host compositor starts at (previous_frametime + 9ms)
> >> - guest compositor starts at (previous_frametime + 4ms)
> >>
> >> Ofc this only works if the frametimes we hand out to both match _exact=
ly_
> >> and are as high-precision as the ones on the host side. Which for many=
 gpu
> >> drivers at least is the case, and all the ones you care about for sure=
 :-)
> >>
> >> But if the frametimes the guest receives are the no_vblank fake ones, =
then
> >> they'll be all over the place and this carefully tuned low-latency red=
raw
> >> loop falls apart. Aside fromm the fact that without tuning the guests =
to
> >> be earlier than the hosts, you're guaranteed to miss every frame (exce=
pt
> >> when the timing wobbliness in the guest is big enough by chance to mak=
e
> >> the deadline on the oddball frame).
> > [Kasireddy, Vivek] The Guest and Host use different event timestamps as=
 we don't
> > share these between the Guest and the Host. It does not seem to be caus=
ing any other
> > problems so far but we did try the experiment you mentioned (i.e., adju=
sting the delays)
> > and it works. However, this patch series is meant to fix the issue with=
out having to tweak
> > anything (delays) because we can't do this for every compositor out the=
re.
>
> Maybe there could be a mechanism which allows the compositor in the guest=
 to automatically adjust its repaint cycle as needed.
>
> This might even be possible without requiring changes in each compositor,=
 by adjusting the vertical blank periods in the guest to be aligned with th=
e host compositor repaint cycles. Not sure about that though.
>
> Even if not, both this series or making it possible to queue multiple fli=
ps require corresponding changes in each compositor as well to have any eff=
ect.

Yeah from all the discussions and tests done it sounds even with a
deeper queue we have big coordination issues between the guest and
host compositor (like the example that the guest is now rendering at
90fps instead of 60fps like the host).

Hence my gut feeling reaction that first we need to get these two
compositors aligned in their timings, which propobably needs
consistent vblank periods/timestamps across them (plus/minux
guest/host clocksource fun ofc). Without this any of the next steps
will simply not work because there's too much jitter by the time the
guest compositor gets the flip completion events.

Once we have solid events I think we should look into statically
tuning guest/host compositor deadlines (like you've suggested in a
bunch of places) to consisently make that deadline and hit 60 fps.
With that we can then look into tuning this automatically and what to
do when e.g. switching between copying and zero-copy on the host side
(which might be needed in some cases) and how to handle all that.

Only when that all shows that we just can't hit 60fps consistently and
really need 3 buffers in flight should we look at deeper kms queues.
And then we really need to implement them properly and not with a
mismatch between drm_event an out-fence signalling. These quick hacks
are good for experiments, but there's a pile of other things we need
to do first. At least that's how I understand the problem here right
now.

Cheers, Daniel

>
>
> --
> Earthling Michel D=C3=A4nzer               |               https://redhat=
.com
> Libre software enthusiast             |             Mesa and X developer



--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
