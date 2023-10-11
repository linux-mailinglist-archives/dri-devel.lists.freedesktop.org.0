Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 766037C58DC
	for <lists+dri-devel@lfdr.de>; Wed, 11 Oct 2023 18:08:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1E5910E418;
	Wed, 11 Oct 2023 16:08:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0FB610E842
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Oct 2023 13:59:44 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-53df747cfe5so240509a12.2
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Oct 2023 06:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=semihalf.com; s=google; t=1697032783; x=1697637583;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sjbWrUHRp424ca1ilWAiBj15r5PfEjMvJc6xVU/mfP4=;
 b=bNZRalq88owOEoy/9A4dxzr7E9v3SEP1YO4V1VlnbAJERrcvyFdxoiBIUp6Wy1JZ+y
 OwqdnlWgBZPgoL83KT6gClosfNqf2oa7X3+Y5JFyPd+XZljwX9GXBOJG6tWt3Avmf6/q
 QrKpqfsT8oqvqZIizE33SOH6OKJHuojnfZRGFC/FgiEh+q30IRFySMAw8dNHkOM7ORV8
 DLvCFRVyrn4+SVkR0SZbgPNYoXczJSS92wV56wOdEdPUNw1HMfeD68VNqJtOgYBnJTRU
 MfAy4NDer778LIQ2Fh5hhxvek14b8jzBSesppDCzHhbin79QFexUVGkLobVnYxe7czsC
 GMGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697032783; x=1697637583;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sjbWrUHRp424ca1ilWAiBj15r5PfEjMvJc6xVU/mfP4=;
 b=DSHh53e6fodBrHhx4SQZ7kAQ/EddwuBDrumDXVGosbeoP8PfemxJS/Ibsv3Xu/ByLm
 vMd3X6KwoowW/gWqNNob1Nqa6IDNWuQW2+bjipickKShWrs7NMVzl+IxQIVZobLkPxbj
 IX9GixAdeHfdhxb8pjj5jQaQAY1HKCfK/qYTg8KHHFv19ABjZov5JXXSzMmC2zlltMDA
 3a1ZePAvOi6Zveu4RbfyOK0leh53ONmxbTqZtGVlzw4hMQ9Hke1lL6cik1Wp3iaA0BiH
 f+rGwJvHxNb3MhuGObBG9GheFae2M832dRlX/JNiMn76VrDXZZdTSUs4CNBxoazARTWs
 I3/Q==
X-Gm-Message-State: AOJu0YzlFA7NmJGcJD58ntmYxMpXQ+NJDc0ykeIxgHT7u8M+A5BoBngY
 dW9NU/ycyWIUxi4O8DbPoL+DnwUxmNC+0EkWZ/lZ
X-Google-Smtp-Source: AGHT+IHL1Q9Nb5lZO3zK1tYxFVAuz9zpEjP9zpeY//sVTeVKqdAAPgUX8qxhUBzMcDRuXmrL25x6HT2K+v4JcY6c0AM=
X-Received: by 2002:a05:6402:1641:b0:533:87c9:4a81 with SMTP id
 s1-20020a056402164100b0053387c94a81mr18738691edx.29.1697032783125; Wed, 11
 Oct 2023 06:59:43 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8ByeJBrPEQSgUc91LQO9Krzjh2pauhMTjEC82M8ozayE76Yg@mail.gmail.com>
 <CAJfuBxxmL-GtBgt=033F9UNeLCreFbJh3HrQQN2nYKwR_0uTbg@mail.gmail.com>
 <20231003155810.6df9de16@gandalf.local.home>
 <CAJfuBxyJyFbFEhRxrtxJ_RazaTODV6Gg64b1aiNEzt6_iE4=Og@mail.gmail.com>
 <CAK8ByeLNc9UbTNG4x=40AxYqjjRCsvBNtNFai0PMveM2X4XCow@mail.gmail.com>
 <CAJfuBxyRF4q_T8LmHwR=-PKKDDpiFg2nO03uLnL8aGpRyBByKw@mail.gmail.com>
 <CAK8ByeLpkSV6o6gPw8eJVqq5+ynQrSDjemY7mXkO1ZmA0rYKfQ@mail.gmail.com>
 <CAJfuBxw+ANLwssAGWpkn5PeJb8ZKn4LXQkk2Gfv3aGsSN=S55Q@mail.gmail.com>
 <CAJfuBxy9qn-4i3SteTL1LBbBxPrFM52KkBd=1UhcKV3S_KdQvw@mail.gmail.com>
 <20231011114816.19d79f43@eldfell> <ZSZuACLwt5_XAL2n@phenom.ffwll.local>
In-Reply-To: <ZSZuACLwt5_XAL2n@phenom.ffwll.local>
From: =?UTF-8?Q?=C5=81ukasz_Bartosik?= <lb@semihalf.com>
Date: Wed, 11 Oct 2023 15:59:32 +0200
Message-ID: <CAK8ByeKKvHM1vzYqkV=CJ0jPjoD96QF1ehQPnhto190jj-e+rw@mail.gmail.com>
Subject: Re: [PATCH v1] dynamic_debug: add support for logs destination
To: Pekka Paalanen <ppaalanen@gmail.com>, jim.cromie@gmail.com, 
 =?UTF-8?Q?=C5=81ukasz_Bartosik?= <lb@semihalf.com>, 
 linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>, 
 "wayland-devel@lists.freedesktop.org" <wayland-devel@lists.freedesktop.org>,
 Sean Paul <seanpaul@chromium.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 11 Oct 2023 16:08:00 +0000
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

=C5=9Br., 11 pa=C5=BA 2023 o 11:42 Daniel Vetter <daniel@ffwll.ch> napisa=
=C5=82(a):
>
> On Wed, Oct 11, 2023 at 11:48:16AM +0300, Pekka Paalanen wrote:
> > On Tue, 10 Oct 2023 10:06:02 -0600
> > jim.cromie@gmail.com wrote:
> >
> > > since I name-dropped you all,
> >
> > Hi everyone,
> >
> > I'm really happy to see this topic being developed! I've practically
> > forgot about it myself, but the need for it has not diminished at all.
> >

It's good to hear you guys are also interested in this feature.

> > I didn't understand much of the conversation, so I'll just reiterate
> > what I would use it for, as a Wayland compositor developer.
> >
> > I added a few more cc's to get better coverage of DRM and Wayland
> > compositor developers.
> >
> > > On Tue, Oct 10, 2023 at 10:01=E2=80=AFAM <jim.cromie@gmail.com> wrote=
:
> > > >
> > > > On Mon, Oct 9, 2023 at 4:47=E2=80=AFPM =C5=81ukasz Bartosik <lb@sem=
ihalf.com> wrote:
> >
> > ...
> >
> > > > > I don't have a real life use case to configure different trace
> > > > > instance for each callsite.
> > > > > I just tried to be as much flexible as possible.
> > > > >
> > > >
> > > > Ive come around to agree - I looked back at some old threads
> > > > (that I was a part of, and barely remembered :-}
> > > >
> > > > At least Sean Paul, Lyude, Simon Ser, Pekka Paalanen
> > > > have expressed a desire for a "flight-recorder"
> > > > it'd be hard to say now that 2-3 such buffers would always be enoug=
h,
> > > > esp as theres a performance reason for having your own.
> >
> > A Wayland compositor has roughly three important things where the kerne=
l
> > debugs might come in handy:
> > - input
> > - DRM KMS
> > - DRM GPU rendering
> >
> > DRM KMS is the one I've been thinking of in the flight recorder context
> > the most, because KMS hardware varies a lot, and there is plenty of
> > room for both KMS drivers and KMS userspace to go wrong. The usual
> > result is your display doesn't work, so the system is practically
> > unusable to the end user. In the wild, the simplest or maybe the only
> > way out of that may be a reboot, maybe an automated one (e.g. digital
> > signage). In order to debug such problems, we would need both
> > compositor logs and the relevant kernel debug messages.
> >
> > For example, Weston already has a flight recorder framework of its own,
> > so we have the compositor debug logs. It would be useful to get the
> > selected kernel debug logs in the same place. It could be used for
> > automated or semi-manual bug reporting, for example, making the
> > administrator or end user life much easier reporting issues.
> >
> > Since this is usually a production environment, and the Wayland
> > compositor runs without root privileges, we need something that works
> > with that. We would likely want the kernel debug messages in the
> > compositor to combine and order them properly with the compositor debug
> > messages.
> >
> > It's quite likely that developers would like to pick and choose which
> > kernel debug messages might be interesting enough to record, to avoid
> > excessive log flooding. The flight recorder in Weston is fixed size to
> > avoid running out of memory or disk space. I can also see that Weston
> > could have debugging options that affect which kernel debug messages it
> > subscribes to. We can have a reasonable default setup that allows us to
> > pinpoint the problem area and figure out most problems, and if needed,
> > we could ask the administrator pass another debug option to Weston. It
> > helps if there is just one place to configure everything about the
> > compositor.
> >
> > This implies that it would be really nice to have userspace subscriber
> > specific debug message streams from the kernel, or a good way to filter
> > the messages we want. A Wayland compositor would not be interested in
> > file system or wireless debugs for example, but another system
> > component might be. There is also a security aspect of which component =
is
> > allowed to see which messages in case they could contain anything
> > sensitive (input debug could contain typed passwords).
> >
> > Configuring the kernel debug message selection for our debug message
> > stream can and probably should require elevated privileges, and we can
> > likely solve that in userspace with a daemon or such, to allow the
> > Wayland compositor to run as a regular user.
> >
> > Thinking of desktop systems, and especially physically multi-seat syste=
ms:
> > - there can be multiple different Wayland compositors running simultane=
ously
> > - each of them may want debug messages only from a specific DRM KMS
> >   device instance, and not from others
> > - each of them may have a different idea of which debug messages are im=
portant
> > - because DRM KMS leasing is a thing, different compositor instances
> >   could be using the same DRM KMS device instance simultaneously; since
> >   this is specific to DRM KMS, and it should be harmless to get a
> >   little too much DRM KMS debug (that is, from the whole device instead
> >   of just the leased parts), it may not be worth to consider splitting
> >   debug message streams this far.
> >
> > If userspace is offered some standardised fields in kernel debug
> > structures, then userspace could do some filtering on its own too, but =
I
> > guess it would be better to filter at the source and not need that.
> >
> > There is also an anti-goal. The kernel debug message contents are
> > specifically not machine-parsable. I very much do not want to impose
> > debug strings as ABI, they are for human (and AI?) readers only.
> >
> >
> > As a summary, here are the most important requirements first:
> > - usable in production as a normal thing to enable always by default
> > - final delivery to unprivileged userspace process
>
> I think this is the one that's trickiest, and I don't fully understand wh=
y
> you need it. The issues I'm seeing:
>
> - logs tend to leak a lot of kernel internal state that's useful for
>   attacks. There's measures for the worst (like obfuscating kernel
>   pointers by hashing them), so there's always going to be a difference
>   here between what full sysadmin can get and what unpriviledged userspac=
e
>   can get. And there's always a risk we miss something that we should
>   obfuscate but didn't.
>
> - handing this to userspace increases the risks it becomes uapi. Who's
>   going to stop compositors from sussing out the reason an atomic commit
>   failed from the logs if they can get them easily, and these logs contai=
n
>   very interesting information about why something failed?
>
>   Much better if journald or a crash handler assemebles all the different
>   flight recorder logs and packages it into a bug report so that the
>   compositor cannot ever get at these directly. Yeah this needs some OS
>   support with a dbus request or similar so that the compositor can ask
>   for a crash dump with everything relevant to its session.
>

This is similar to what we plan to do in ChromeOS. We want to enable
writing debug logs of each subsystem/driver
of interest (e.g. thunderbolt) into a separate trace instance and when
an issue happens and a user submits
a feedback report we will attach the captured logs from trace
instances to the report.

> - the idea of an in-kernel flight recorder is that it's really fast. The
>   entire tracing infra is built such that recording an event is really
>   quick, but printing it is not - the entire string formatting is delayed
>   to when userspace reads the buffers. If you constantly push the log
>   messages to userspace we toss the advantage of the low-overhead
>   in-kernel flight recorder. If you push logs to dmesg there's a
>   substantial measureable overhead which you don't really want in
>   production, and your requirement would impose the same.
>
> - I'm not sure how this is supposed to mesh with userspace log aggregator=
s
>   like journald when every compositor has it's own flight recorder on top=
.
>   Feels a bit like a solution that ignores the entire os stack and assume=
s
>   that the only pieces we can touch are the kernel and the compositor to
>   get to such a flight recorder.
>
>   You might object that events will get out-of-order if you merge multipl=
e
>   logs after the fact, but that's the case anyway if we use the tracing
>   framework since that's always a ringbuffer within the kernel and not
>   synchronous. The only thing we could do is allow userspace to push
>   markers into that ringbuffer, which is easily done by adding more debug
>   output lines (heck we could even add a logging cookie to certain ioctl
>   when userspace really cares about knowing exact ordering of it's
>   requests with the stuff the kernel does).
>
> - If you really want direct deliver to userspace I guess we could do
>   something where sessiond opens the flight recorder fd for you, sets it
>   all up and passes it to the compositor. But I'm really not a big fan of
>   sending the full kms dbg spam to compositors to freely digest in real
>   time.
>
> > - per debug-print selection of messages (finer or coarser, categories
> >   within a kernel sub-system could be enough)
> > - per originating device (driver instance) selection of messages
>
> The dyndbg stuff can do all that already, which is why I'm so much in
> favour of relying on that framework.
>
> > - all selections tailored separately for each userspace subscriber
> > (- per open device file description selection of messages)
>
> Again this feels like a userspace problem. Sessions could register what
> kind of info they need for their session, and something like journald can
> figure out how to record it all.
>
> If you want the kernel to keep separate flight recorders I guess we could
> add that, but I don't think it currently exists for the dyndbg stuff at
> least. Maybe a flight recorder v2 feature, once the basics are in.
>
> > That's my idea of it. It is interesting to see how far the requirements
> > can be reasonably realised.
>
> I think aside from the "make it available directly to unpriviledged
> userspace" everything sounds reasonable and doable.
>
> More on the process side of things, I think Jim is very much looking for
> acks and tested-by by people who are interested in better drm logging
> infra. That should help that things are moving in a direction that's
> actually useful, even when it's not yet entirely complete.
>
> Cheers, Sima
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
