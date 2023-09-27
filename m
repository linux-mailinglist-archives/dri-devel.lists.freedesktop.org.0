Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A31717B0D8C
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 22:46:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90D0C10E107;
	Wed, 27 Sep 2023 20:45:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4169910E5A9
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Sep 2023 20:26:11 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-502e7d66c1eso19460143e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Sep 2023 13:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695846369; x=1696451169; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dpL/zhQSi7qXBDYsd8tSZQwnMVgnaPBNm9wb7WRX31Q=;
 b=WmjK31vwpalgpSWoVb7qcRTwdd8H3Lyl/iVGor9HofmtcpdGH3YFtuTXBy9dflppIm
 Oo1SM6nLTftNDrzbK6yzQcdsX/dvg2N3Epwcmprs0JqlUtM/Y4ypkwocf/ufAtXxksLu
 SfQttEfIyM7Me6LSPQo2v2qR7kTYNd5iA/yHBEJoTrBbgEe/N140d1ikdDQLt4OxE3sg
 X3dgRYZ5JzOTOVvLHrs5drvtpBXJSX62k/xNW8swLx/K58Pb4MrI9gKTLuhtw/f4JjO8
 ceSFbTqg+MhndZuag4eusNPcHrLBZbkTdorydEcSplEbJ4C8hG3cNCFmyrMSM72ESd84
 Cc8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695846369; x=1696451169;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dpL/zhQSi7qXBDYsd8tSZQwnMVgnaPBNm9wb7WRX31Q=;
 b=pOaHAtvJLsjLjy+S0rVwoBCxrBB3gAZxVWsHPU/h+i6dgl808l3FxNy+a23cSmRYDt
 D7E2Lle0wEwuLQRc1RBhhbXsElyiArEGUctKjICdA7wZwfSjfavKgR5DNAjTdwG3P5MY
 /YcX/waKCVALSbfMAz3cD7s6DsWm8fJtq55yhTnMrNxC7K/Lk53kK69HBcmRgGJ3wz+s
 Fut0XXsE6ynr30JqYyup1KrbbO6mMm9MN8wnEo4E7USjMOp7Eliwwo7VTWaaGup9hmEZ
 vXo+V7XpdBzRkIepfGVMm7HcV9J8Uqw2hsvHZDH9brJ9ZXJve4KQlX1WQyT6QwuJUTto
 fpZA==
X-Gm-Message-State: AOJu0Ywj559MmvPFypZEai8kupzAbJun9AiJ4xKtmVtWN5Vn7ccyAddl
 qQjpKvw2HCjMETy9GYtZXcUL4uBNLC8IoqNstz8=
X-Google-Smtp-Source: AGHT+IGMbGe3Z4qgS5TDvtz4YEYLK/06VW7QbtDIDhLNxNSN6PfkBU7nsfOG2Lsvfp6E3EH4zrWpdEypWuCVQvwjydE=
X-Received: by 2002:a05:6512:3414:b0:4fd:f84f:83c1 with SMTP id
 i20-20020a056512341400b004fdf84f83c1mr2590321lfr.64.1695846368941; Wed, 27
 Sep 2023 13:26:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230926170549.2589045-1-halfline@gmail.com>
 <c2ffc21e-bf92-81f6-aa9b-233e3475025f@amd.com>
In-Reply-To: <c2ffc21e-bf92-81f6-aa9b-233e3475025f@amd.com>
From: Ray Strode <halfline@gmail.com>
Date: Wed, 27 Sep 2023 16:25:56 -0400
Message-ID: <CAA_UwzKiNJe6hjbAo7SK7-OB7sb_ieV_DcQ_8vf6UYw2gppGcA@mail.gmail.com>
Subject: Re: [PATCH] drm/atomic: Perform blocking commits on workqueue
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 27 Sep 2023 20:45:53 +0000
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
Cc: daniel.vetter@ffwll.ch, Xinhui.Pan@amd.com, dri-devel@lists.freedesktop.org,
 mdaenzer@redhat.com, alexander.deucher@amd.com, airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Sep 27, 2023 at 4:05=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
> I'm not an expert for that stuff, but as far as I know the whole purpose
> of the blocking functionality is to make sure that the CPU overhead
> caused by the commit is accounted to the right process.
I'm not an expert either, but that's clearly wrong.

The point of blocking functionality in drmAtomicCommit is for the
ioctl to block until the operation is completed, so userspace knows
that they can commit again after it returns without getting EBUSY, and
they can be sure, e.g., the mode is set or the displays are disabled
or whatever.

To say the "whole point" is about CPU overhead accounting sounds
rather absurd to me. Is that really what you meant?

You could try to make the argument that one of the points of the
blocking call is about CPU accounting (instead of the whole point),
maybe that's what you meant? That seems likely wrong to me too. I mean
just check the docs:

       RLIMIT_RTTIME (since Linux 2.6.25)
              This is a limit (in microseconds) on the amount of CPU
time that a process scheduled under a real=E2=80=90time scheduling policy m=
ay
consume without making a blocking system call.  For  the  purpose  of
              this limit, each time a process makes a blocking system
call, the count of its consumed CPU time is reset to zero.

drmAtomicCommit() is making a blocking system call so the limit should
be reset, in my opinion.

Furthermore, a lot happens under the covers as part of drmAtomicCommit.

Are you telling me that in all the drivers handling drmAtomicCommit,
none of the work from those drivers gets deferred outside of process
context if DRM_MODE_ATOMIC_NONBLOCK isn't set? I find that very hard
to believe. But it would have to be true, if one of the main points of
the blocking call is about CPU accounting, right? You can't say the
point is about CPU accounting if some of the work is handled in a
helper thread or work queue or whatever.

=E2=95=8E=E2=9D=AF git grep -E 'INIT_WORK|DECLARE_TASKLET|open_softirq|time=
r_setup|kthread_run'
| wc -l
182

There seems to be a lot of non-process context execution going on in the tr=
ee...

> So what you are suggesting here is to actually break that functionality
> and that doesn't seem to make sense.

What's the use case here that could break? Walk me through a
real-world, sensible example where a program depends on
drmAtomicCommit() blocking and continuing to eat into process cpu time
while it blocks. I just want to see where you are coming from. Maybe
I'm being unimaginative but I just don't see it. I do see actual
main-stream display servers breaking today because the current
behavior defies expectations.

> When it's really not desirable to account the CPU overhead to the
> process initiating it then you probably rather want to use an non
> blocking commit plus a dma_fence to wait for the work to end from userspa=
ce.

Well, first I don't think that's very convenient. You're talking about
a per-plane property, so there would need to be a separate file
descriptor allocated for every plane, right? and user-space would have
to block on all of them before proceeding? Also, are you sure that
works in all cases? The problematic case we're facing right now is
when all planes and all crtcs are getting disabled. I'm just skimming
over the code here, but I see this:

=E2=86=92       for_each_new_crtc_in_state(state, crtc, crtc_state, i) {=E2=
=80=A2
...
=E2=86=92       =E2=86=92       if (arg->flags & DRM_MODE_PAGE_FLIP_EVENT |=
| fence_ptr) {=E2=80=A2
...
=E2=86=92       =E2=86=92       =E2=86=92       e =3D create_vblank_event(c=
rtc, arg->user_data);=E2=80=A2
...
=E2=86=92       =E2=86=92       =E2=86=92       crtc_state->event =3D e;=E2=
=80=A2
=E2=86=92       =E2=86=92       }=E2=80=A2
...
=E2=86=92       =E2=86=92       if (fence_ptr) {=E2=80=A2
...
=E2=86=92       =E2=86=92       =E2=86=92       fence =3D drm_crtc_create_f=
ence(crtc);=E2=80=A2
...
=E2=86=92       =E2=86=92       =E2=86=92       ret =3D setup_out_fence(&f[=
(*num_fences)++], fence);=E2=80=A2
...
=E2=86=92       =E2=86=92       =E2=86=92       crtc_state->event->base.fen=
ce =3D fence;=E2=80=A2
=E2=86=92       =E2=86=92       }=E2=80=A2

Is the code really going to allocate a vblank_event when all the
crtc's are disabled ? I guess it's possible, but that's
counterintuitive to me. I really don't know. You're confident a set of
fences will actually work?

Regardless, this seems like a roundabout way to address a problem that
we could just ... fix.

--Ray
