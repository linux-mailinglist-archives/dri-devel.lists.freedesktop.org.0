Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC9BA00A00
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jan 2025 14:45:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E68510E127;
	Fri,  3 Jan 2025 13:45:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ieo/JStQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1870910E127
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jan 2025 13:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1735911919;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BdhsocMIYAT5L8IpxdbiEiojAHEgbuAlxIHZo0/98zE=;
 b=ieo/JStQ3/87HbVoiSET9V/RZSnLD9JmIgtrNjJSsWDdq8TA3s3Ox2BGqto3yDq05Skot/
 b2M1U6/KZOUkt/WuO4lJIidhZmEFQBPizIjsaZ5UnQLUPZU9K1b+/fizYtc/UPP7oJz2pt
 35FUIHS5jlhLAgqFEBLPY+QlHpDyCy4=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-260-aByAIXafN1WGRHXID6n8cQ-1; Fri, 03 Jan 2025 08:45:17 -0500
X-MC-Unique: aByAIXafN1WGRHXID6n8cQ-1
X-Mimecast-MFC-AGG-ID: aByAIXafN1WGRHXID6n8cQ
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-aaf901a0ef9so168064066b.0
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jan 2025 05:45:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735911916; x=1736516716;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BdhsocMIYAT5L8IpxdbiEiojAHEgbuAlxIHZo0/98zE=;
 b=XdmuPCKxrMukDs1wH5LXLsBw87K4TcRiVvblv3KDDK0VcDOCdtZ5mWRmsX0y51l5eW
 bL5jlPizyNrLZpkR/D/0rNwYFgyFRPelGMZ6S+ecLOO+tJSQzxM78ba99pBN4t807nZf
 oZDW+hgcKCziqtW8xfo8FYjbiU5WyLSC963QwuoLI3sHimZot52mb7rW0n+G8ZNjW0cb
 n/6UWPLQoIJbTcFhLSl6KslCaMk0TlTw+lDeMX8i0M9aK1gsHKUxvgXw3eh2OAtYKkZ2
 AbI3o7vow6lXFwbOkjSeewt9/TtadBPv5oIYFwpFkzhiMfPoQL0zjBODVwrol8HCO04V
 CFRA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWogt8nQT8gIRvVCHdV1Z8ry7SS4z4VQ/d2+V78mRU7HOkW0+mG6kpKxVJ6+2JzJwZ/hUHjvT5DnG0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YycRr7M4A9ZvLis1dPOZODpof5aC9nw50Xe475gKHUVA56WpSb3
 a5i3RFMNm9ccgkv9vre5Qu2zmccjc1nA9hPdfkEPSeXek5DvrD6zvGQ8Ac+83BCNOR/8ATuzxNj
 XgsilUsn2V++QiFkJAPsJ49y/QuzrKst4GNFF3s6zzL6x949qI7grW+CSntG6SCWOEg==
X-Gm-Gg: ASbGncsOT5UAU2lA47oLVjLk/Xkbp3KxSRYWxSlWNDZFsSaCirDLJu8WrzvcpiGuCdr
 8OsU4PtIBaDd2ZqeJX60Y6FJLhRrFCm0PCNy9FsIoL1uW3EpsH6cZSz98TOCKXtdDKqAsMxa1p/
 dXzL3gxgZGr/D+6ar6GArpkTPJ1vpfgtnd7Eiu19VM3dcWo9vOjjx8ITGCRBsYhf1ybcNKZ8axC
 T+XnZzsQT8gRmSkBV5h0L9Vzhrfd4za5NLqR3uVnYEHbU5+06UoUZbPPRaSjA4u34Gs5uvqI78j
 1nBHJ0XMff1meZb361/qFbrerUs8
X-Received: by 2002:a17:907:d9e:b0:aa6:79fa:b486 with SMTP id
 a640c23a62f3a-aac345f5b2emr3737024166b.49.1735911916393; 
 Fri, 03 Jan 2025 05:45:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE0V8Fytv59OKbIGZx5QziKSf1rjy5+m1hDeepTNdTB5usRUM4VwRjjGoe9zMYZHlni4O3tgQ==
X-Received: by 2002:a17:907:d9e:b0:aa6:79fa:b486 with SMTP id
 a640c23a62f3a-aac345f5b2emr3737020966b.49.1735911915900; 
 Fri, 03 Jan 2025 05:45:15 -0800 (PST)
Received: from ?IPv6:2001:16b8:3d92:ec00:9984:7826:3f0:d438?
 ([2001:16b8:3d92:ec00:9984:7826:3f0:d438])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0f0170f6sm1885189666b.167.2025.01.03.05.45.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jan 2025 05:45:15 -0800 (PST)
Message-ID: <c2b37daab26b678c9669259b1b0474027b05ee79.camel@redhat.com>
Subject: Re: [RFC 00/14] Deadline scheduler and other ideas
From: Philipp Stanner <pstanner@redhat.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Tvrtko
 Ursulin <tvrtko.ursulin@igalia.com>, Tvrtko Ursulin <tursulin@igalia.com>, 
 dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Danilo Krummrich <dakr@redhat.com>, Matthew Brost
 <matthew.brost@intel.com>
Date: Fri, 03 Jan 2025 14:45:14 +0100
In-Reply-To: <c4c62ea9-86c0-43c1-99b0-08af7b3bd71a@amd.com>
References: <20241230165259.95855-1-tursulin@igalia.com>
 <31842e821032305e5be7a8dcc3e13593fd09da20.camel@redhat.com>
 <99c7ccf4-a85f-4a11-912f-78f8d5a57516@igalia.com>
 <c4c62ea9-86c0-43c1-99b0-08af7b3bd71a@amd.com>
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6PdIv81LyF3EE8VcpqfivTLgR8Ytk5qg797mUpgd8fo_1735911916
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 2025-01-03 at 13:31 +0100, Christian K=C3=B6nig wrote:
> Am 03.01.25 um 13:02 schrieb Tvrtko Ursulin:
> > > > </tldr>
> > > >=20
> > > > If I remember correctly Christian mentioned recently (give or
> > > > take)
> > > > that maybe
> > > > round-robin could be removed. That got me thinking how and what
> > > > could
> > > > be
> > > > improved and simplified. So I played a bit in the scheduler
> > > > code and
> > > > came up
> > > > with something which appears to not crash at least. Whether or
> > > > not
> > > > there are
> > > > significant advantages apart from maybe code consolidation and
> > > > reduction is the
> > > > main thing to be determined.
> > >=20
> > > Hi,
> > >=20
> > > so first of all: Happy new year and thx for putting in all that
> > > effort
> > > :)
> > >=20
> > > I gave the series a first look; Since this is an RFC, let's
> > > abstain
> > > from doing deeper reviews of the exact code for now.
> >=20
> > Ditto and thank you for taking a look!
>=20
> Ah, yes. Happy new year guys :)
>=20
> >=20
> > > > One big question is whether round-robin can really be removed.
> > > > Does
> > > > anyone use
> > > > it, rely on it, or what are even use cases where it is much
> > > > better
> > > > than FIFO.
> > >=20
> > > So AFAICS Round Robin is not used anymore by anyone. And my
> > > understanding indeed is, too, that there is not really any use-
> > > case
> > > where one would like anything except for FIFO.
> > >=20
> > > Looking at 977d97f18b5b ("drm/scheduler: Set the FIFO scheduling
> > > policy
> > > as the default"), it seems to me that RR just was easy to
> > > implement and
> > > it had the disadvantage of systems under high load cause the
> > > oldest job
> > > to be starved to death, which is why FIFO was introduced.
> > >=20
> > > So my guess would be that RR just is a relict.
> > >=20
> > > If we agree on that, then we could remove RR in any case, and the
> > > subsequent question would be whether FIFO should be replaced with
> > > deadline (or: if there should be FIFO *and* deadline?), wouldn't
> > > it?
> >=20
> > I am unsure about RR but I agree what is the second part of the
> > question.
>=20
> Well we came up with FIFO because we found that RR performed quite
> badly=20
> when you have a huge number of submitting applications.
>=20
> E.g. one of our cloud test cases ran 100 instances of a single game
> and=20
> the worst response time improved massively by switching from RR to
> FIFO.
>=20
> Different priorities on the other hand were originally invented to
> make=20
> sure the kernel has precedence over userspace.

Should it, in your opinion, be *guaranteed* that the kernel always
takes precedence, or is a "kernel takes precedence almost always"
enough?

Because this patchset does seem to do the latter

>  But later we also exposed=20
> the priorities to userspace which results in the problem that higher=20
> priority queues can starve low priority ones.
>=20
> That's the other reason why I said that RR should probably be removed
> and FIFO changed in a way that the priority is basically just a bonus
> to=20
> the score used for sorting the FIFO. I haven't taken a deeper look
> yet,=20
> but I think that this is more or less what this patch set here does.
>=20
> What FIFO is still missing compared to RR is some sort of fairness=20
> between queues.

Before I forget it I note it right away:

If we go for such a thing we should set our terminology straight. A
FIFO that suddenly takes deadlines into account is not a FIFO anymore.
So we shouldn't call it that.

However, a deadline scheduler with priority levels also doesn't seem to
be a deadline scheduler.

I think, no matter what we do, we should aim for strict congruency
between the GPU scheduler and the CPU scheduler in regards with terms
and naming. The CPU scheduler has SCHED_FIFO, which is pure FIFO with
priorities (behaving exactly like the GPU schedulers FIFO, currently)
and SCHED_DEADLINE, which is purely based on deadlines (not like in
this patch set).

So we should find a new suitable term if we go for that to avoid any
misunderstandings.


P.

>  E.g. a queues which hasn't submitted something in a=20
> while might get a bonus for their submissions compared to a queue
> which=20
> submits stuff all the time (or something like that).
>=20
> Regards,
> Christian.
>=20
>=20
> > There may be nuances with different drivers depending on how much
> > they=20
> > can queue to the hardware/firmware at once. Modern drivers which
> > use=20
> > 1:1 sched:entity I don't expect care about DRM scheduler scheduling
> > mode. The fewer jobs driver can queue to the backend the more it=20
> > cares. Question is FIFO ever better. Keeping in mind that for same=20
> > priority this deadline and FIFO are actually identical.
> >=20
> > > > See "drm/sched: Add deadline policy" commit message for a short
> > > > description on
> > > > what flavour of deadline scheduling it is. But in essence it
> > > > should a
> > > > more fair
> > > > FIFO where higher priority can not forever starve lower
> > > > priorities.
> > >=20
> > > See my answer on that patch.
> > >=20
> > > As you can imagine I'm wondering if that "better FIFO" would be
> > > worth
> > > it considering that we are running into a certain risk of
> > > regressing
> > > stuff through this rework.
> >=20
> > I will reply to that part there then.
> > > > "drm/sched: Connect with dma-fence deadlines" wires up dma-
> > > > fence
> > > > deadlines to
> > > > the scheduler because it is easy and makes logical sense with
> > > > this.
> > > > And I
> > > > noticed userspace already uses it so why not wire it up fully.
> > >=20
> > > Userspace uses the dma-fence deadlines you mean? Do you have a
> > > pointer
> > > for us?
> >=20
> > I've noticed it empirically and the one I could fine is this:
> >=20
> > https://invent.kde.org/plasma/kwin/-/commit/4ad5670ddfcd7400c8b84c12cbf=
8bd97a0590f43
> > =C2=A0
> >=20
> >=20
> > > > Otherwise the series is a bit of progression from consolidating
> > > > RR
> > > > into FIFO
> > > > code paths and going from there to deadline and then to a
> > > > change in
> > > > how
> > > > dependencies are handled. And code simplification to 1:1 run
> > > > queue to
> > > > scheduler
> > > > relationship, because deadline does not need per priority run
> > > > queues.
> > > >=20
> > > > There is quite a bit of code to go throught here so I think it
> > > > could
> > > > be even
> > > > better if other drivers could give it a spin as is and see if
> > > > some
> > > > improvements
> > > > can be detected. Or at least no regressions.
> > >=20
> > > I hope I can dive deeper into the Nouveau side soon.
> >=20
> > Fantastic!
> > > >=20
> > > > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> > > > Cc: Danilo Krummrich <dakr@redhat.com>
> > > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > > Cc: Philipp Stanner <pstanner@redhat.com>
> > > >=20
> > > > Tvrtko Ursulin (14):
> > > > =C2=A0=C2=A0 drm/sched: Delete unused update_job_credits
> > > > =C2=A0=C2=A0 drm/sched: Remove idle entity from tree
> > > > =C2=A0=C2=A0 drm/sched: Implement RR via FIFO
> > > > =C2=A0=C2=A0 drm/sched: Consolidate entity run queue management
> > > > =C2=A0=C2=A0 drm/sched: Move run queue related code into a separate=
 file
> > > > =C2=A0=C2=A0 drm/sched: Ignore own fence earlier
> > > > =C2=A0=C2=A0 drm/sched: Resolve same scheduler dependencies earlier
> > > > =C2=A0=C2=A0 drm/sched: Add deadline policy
> > > > =C2=A0=C2=A0 drm/sched: Remove FIFO and RR and simplify to a single=
 run
> > > > queue
> > > > =C2=A0=C2=A0 drm/sched: Queue all free credits in one worker invoca=
tion
> > > > =C2=A0=C2=A0 drm/sched: Connect with dma-fence deadlines
> > > > =C2=A0=C2=A0 drm/sched: Embed run queue singleton into the schedule=
r
> > > > =C2=A0=C2=A0 dma-fence: Add helper for custom fence context when me=
rging
> > > > fences
> > > > =C2=A0=C2=A0 drm/sched: Resolve all job dependencies in one go
> > >=20
> > > It seems to me that this series is a "port RR and FIFO to
> > > deadline"-
> > > series with some additional patches that could be branched out
> > > and be
> > > reviewed through a separate series?
> > >=20
> > > Patch 1 ("Delete unused...") for example. Other candidates are
> > > Patch 5
> > > ("Move run queue related..."), 13 ("Add helper for...").
> > >=20
> > > A few patches might be mergeable even if the main idea with
> > > deadline
> > > doesn't get approved, that's why I'm suggesting that.
> >=20
> > Yes some of those could be possible and I am happy to extract and=20
> > rebase in principle. But not yet I think. If and when something
> > gets a=20
> > positive nod.
> >=20
> > Regards,
> >=20
> > Tvrtko
> >=20
> > > >=20
> > > > =C2=A0=C2=A0drivers/dma-buf/dma-fence-unwrap.c=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 8 +-
> > > > =C2=A0=C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 6 +-
> > > > =C2=A0=C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_job.c=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 27 +-
> > > > =C2=A0=C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_job.h=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 5 +-
> > > > =C2=A0=C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h=C2=A0=C2=A0 |=
=C2=A0=C2=A0 8 +-
> > > > =C2=A0=C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c |=C2=A0=C2=
=A0 8 +-
> > > > =C2=A0=C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 8 +-
> > > > =C2=A0=C2=A0drivers/gpu/drm/scheduler/Makefile=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +-
> > > > =C2=A0=C2=A0drivers/gpu/drm/scheduler/sched_entity.c=C2=A0=C2=A0=C2=
=A0 | 316 ++++++-----
> > > > =C2=A0=C2=A0drivers/gpu/drm/scheduler/sched_fence.c=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 5 +-
> > > > =C2=A0=C2=A0drivers/gpu/drm/scheduler/sched_main.c=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 587 +++++------
> > > > -------
> > > > --=20
> > > > =C2=A0=C2=A0drivers/gpu/drm/scheduler/sched_rq.c=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 199 +++++++
> > > > =C2=A0=C2=A0include/drm/gpu_scheduler.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 74 ++-
> > > > =C2=A0=C2=A0include/linux/dma-fence-unwrap.h=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 31 +-
> > > > =C2=A0=C2=A014 files changed, 606 insertions(+), 678 deletions(-)
> > > > =C2=A0=C2=A0create mode 100644 drivers/gpu/drm/scheduler/sched_rq.c
> > > >=20
> > >=20
>=20

