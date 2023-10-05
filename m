Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1D47BABC3
	for <lists+dri-devel@lfdr.de>; Thu,  5 Oct 2023 23:05:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FC5A10E48D;
	Thu,  5 Oct 2023 21:05:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9A3210E48D
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Oct 2023 21:05:09 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-5046bf37ec1so1898342e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Oct 2023 14:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696539908; x=1697144708; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kDM4KI/wqDTJJ5wNqotdZCJVORVVTKtHBOjsPHE/2Ck=;
 b=Rus0ukVkWHShvpspLuUPT55SWLQJOwLgYGcw70+MROqzHfwJhNWAFgaAz49hr8Lk/I
 qeK+rrx4tu3h2e5NIn2ExYag4MuhUkXIHBI8OSDe935HFtyJZ7s0pbACB/d+1EDby1QB
 6PViKLOTtmxTGc/0cJaVSFFkg/BjXbd0V1OQw1N2tL2JDV2tvCeRQs6kdqnYqjK2ni7y
 gqaCJds6aOFDusonVqRMp7C9wP86ff/1ivsUPYvXzk9jcrRBoV7QPk6O9+iSicJMWHYq
 mIay3vpXSUkSx7OzWeXB/9QPyi0KVyUZFqmF9enOPlEhAr7t1j0yZj4N9tTvpmC8QGIq
 nfqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696539908; x=1697144708;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kDM4KI/wqDTJJ5wNqotdZCJVORVVTKtHBOjsPHE/2Ck=;
 b=s1z0VPbaGIesURyG0SWsqFvkpoiR6StO1Or+76Ys5pVIru6bPQemUpQFbP6OSNadys
 efpFBdQMq7nyVtpZHqKdEmWeq0eSBhFBNvyYXZL6/wVZXzfzbKefffrFOJ8fes6TA1jP
 8eDRZzj0XmdiweNCY6qlYKVmzBU8zEM7a9Ji1ZVtJ/g+Haqfe4yua62ogd2o+4FzA5oY
 610GXU6G70puUV5+IGNxdQUuG5buKpDWbg8QyVomWr5UUgrGvNghUWUiQ1+jDJQZYtUT
 MchRt/1OUKK3xoQJt9+skYVlGrxpkHJA1Y1mkVcH/ppYIQZyaQlbvzV3ciSZ7pVqdrlu
 zFSQ==
X-Gm-Message-State: AOJu0YxtWcWWSMYKbLtekqjcm+P7NTkCeg5IlmN6kbUvCi/vy049LIjx
 Xzd/AAA5HvR/92cDUkp9wuAG5Ibq+gA7/ZqSPJ1RExYdIM4=
X-Google-Smtp-Source: AGHT+IFaXjxiapwdX5icqOInoxtSzbzgcAoaqJ+9oXqdfrH84IUAzVtVsMdKLxMYUovur8JVZs9i415igZGrmUQmdFo=
X-Received: by 2002:a19:2d1c:0:b0:503:303:9e2d with SMTP id
 k28-20020a192d1c000000b0050303039e2dmr5151954lfj.5.1696539907371; Thu, 05 Oct
 2023 14:05:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230926170549.2589045-1-halfline@gmail.com>
 <ZR6IlVR-A5KtIHEU@phenom.ffwll.local>
In-Reply-To: <ZR6IlVR-A5KtIHEU@phenom.ffwll.local>
From: Ray Strode <halfline@gmail.com>
Date: Thu, 5 Oct 2023 17:04:55 -0400
Message-ID: <CAA_UwzL=2PjeH_qW2GJa_XzJCeWkz9NcokPQX3-qn2f0iPz+Rw@mail.gmail.com>
Subject: Re: [PATCH] drm/atomic: Perform blocking commits on workqueue
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: daniel.vetter@ffwll.ch, Xinhui.Pan@amd.com, dri-devel@lists.freedesktop.org,
 mdaenzer@redhat.com, alexander.deucher@amd.com, airlied@redhat.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Oct 5, 2023 at 5:57=E2=80=AFAM Daniel Vetter <daniel@ffwll.ch> wrot=
e:
> So imo the trouble with this is that we suddenly start to make
> realtime/cpu usage guarantees in the atomic ioctl. That's a _huge_ uapi
> change, because even limited to the case of !ALLOW_MODESET we do best
> effort guarantees at best.
So you're saying there's a best effort to not use up process CPU time,
but Christian was trying to argue nearly the opposite, that any needed
CPU time for the operation should get accounted toward the process.

What you're saying makes more sense to me and it tracks with what I'm
getting skimming over the code. I see it potentially sleeps during
blocking drmModeAtomicCommit() calls in several places:

- copy_from_user when copying properties
- fence and vblank event allocation
- waiting on modeset locks
- And even plane changes:

for_each_new_plane_in_state(state, plane, new_plane_state, i) {=E2=80=A2
...
=E2=86=92       /*=E2=80=A2
=E2=86=92        * If waiting for fences pre-swap (ie: nonblock), userspace=
 can=E2=80=A2
=E2=86=92        * still interrupt the operation. Instead of blocking until=
 the=E2=80=A2
=E2=86=92        * timer expires, make the wait interruptible.=E2=80=A2
=E2=86=92        */=E2=80=A2
=E2=86=92       ret =3D dma_fence_wait(new_plane_state->fence, pre_swap);=
=E2=80=A2
...
}=E2=80=A2

(Ignore the typo where it says "nonblock" instead of "!nonblock",
the point is while waiting on plane state changes it sleeps.)

So, in general, the ioctl sleeps when it needs to. It's not trying
to be some non-premptible RT task with a dedicated cpu budget that it
strictly adheres to. That makes sense to me.

> And that state recomputation has to happen synchronously, because
> it always influences the ioctl errno return value.

Not sure I'm following. The task doesn't have to stay in RUNNING the
entire time the ioctl is getting carried out. It can get preempted,
and rescheduled later, all before returning from the ioctl and
delivering the errno back to userspace. What am I missing?

The problem isn't that the ioctl blocks, the problem is that when it
blocks it shouldn't be leaving the task state in RUNNING.

> My take is that you're papering over a performance problem here of the
> "the driver is too slow/wastes too much cpu time". We should fix the
> driver, if that's possible.

I think everyone agrees the amdgpu DC code doing several 100ms busy
loops in a row with no break in between is buggy behavior, and getting
that fixed is important.

Also, there's no dispute that the impetus for my proposed change was
that misbehavior in the driver code.

Neither of those facts mean we shouldn't improve
drm_atomic_helper_commit too. Making the change is a good idea. It was
even independently proposed a year ago, for reasons unrelated to the
current situation. It makes the nonblock and the
!nonblock code paths behave closer to the same. it makes the userspace
experience better in the face of driver bugs. You said best effort
earlier, this change helps provide a best effort.

Realistically, if it was done this way from the start, no one would be
batting an eye, right? It just improves things all around. I think
maybe you're worried about a slippery slope?

> We can also try to change the atomic uapi to give some hard real-time
> guarantees so that running compositors as SCHED_RT is possible, but that
> - means a very serious stream of bugs to fix all over
> - therefore needs some very wide buy-in from drivers that they're willing
>   to make this guarantee
> - probably needs some really carefully carved out limitations, because
>   there's imo flat-out no way we'll make all atomic ioctl hard time limit
>   bound

We don't need a guarantee that reprogramming ast BMC framebuffer
offsets or displayport link training (or whatever) takes less than
200ms.  If a driver has to sit and wait 32ms for vblank before
twiddling things in hardware to keep crud from showing up on screen or
something, that's fine.  But in none of these cases should the
userspace process be kept in RUNNING while it does it!

I take your point that there are a lot of drivers that may be doing
slow things, but surely they should let the process nap while they do
their work?

> Also, as K=C3=B6nig has pointed out, you can roll this duct-tape out in
> userspace by making the commit non-blocking and immediately waiting for
> the fences.

Sure, userspace can do that (even, it turns out, in the all crtc
disabled case which was an open question earlier in the thread).

That's not really an argument against fixing the !nonblock case
though.

> One thing I didn't see mention is that there's a very subtle uapi
> difference between non-blocking and blocking:
> - non-blocking is not allowed to get ahead of the previous commit, and
>   will return EBUSY in that case. See the comment in
>   drm_atomic_helper_commit()
> - blocking otoh will just block until any previous pending commit has
>   finished
>
> Not taking that into account in your patch here breaks uapi because
> userspace will suddenly get EBUSY when they don't expect that.

I don't think that's right, drm_atomic_helper_setup_commit has several
chunks of code like this:

=E2=86=92       =E2=86=92       if (nonblock && old_conn_state->commit &&=
=E2=80=A2
=E2=86=92       =E2=86=92
!try_wait_for_completion(&old_conn_state->commit->flip_done)) {=E2=80=A2
...
=E2=86=92       =E2=86=92       =E2=86=92       return -EBUSY;=E2=80=A2
=E2=86=92       =E2=86=92       }=E2=80=A2

So it only returns EBUSY for DRM_MODE_ATOMIC_NONBLOCK cases.

There's also this code earlier in the process:

=E2=86=92       list_for_each_entry(commit, &crtc->commit_list, commit_entr=
y) {=E2=80=A2
...
=E2=86=92       =E2=86=92       =E2=86=92       completed =3D
try_wait_for_completion(&commit->flip_done);=E2=80=A2
...
=E2=86=92       =E2=86=92       =E2=86=92       if (!completed && nonblock)=
 {=E2=80=A2
...
=E2=86=92       =E2=86=92       =E2=86=92       =E2=86=92       return -EBU=
SY;=E2=80=A2
=E2=86=92       =E2=86=92       =E2=86=92       }=E2=80=A2
...
=E2=86=92       }=E2=80=A2
...
=E2=86=92       ret =3D wait_for_completion_interruptible_timeout(&stall_co=
mmit->cleanup_done,
=E2=86=92       =E2=86=92       =E2=86=92       =E2=86=92       =E2=86=92  =
     =E2=86=92       =E2=86=92       10*HZ);=E2=80=A2
...

So it looks like it sleeps (not leaving the system in RUNNING state!) if
there's an outstanding commit.

--Ray
