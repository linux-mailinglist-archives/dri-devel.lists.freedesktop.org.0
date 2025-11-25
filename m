Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF58C84984
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 11:57:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49FD510E3BA;
	Tue, 25 Nov 2025 10:56:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="M3NlxZip";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C89510E3B4
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 10:56:56 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4dG04j1pT6z9sCb;
 Tue, 25 Nov 2025 11:56:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1764068213; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+O5zZ+LqqrhBUh4ai6db4CiF8tuUSJP4/Ddj1attmxw=;
 b=M3NlxZipx3kGc+a1SZogWZCbG96ZLWsLB42MOUsyZckznRYvC3Axd6be59sVbLyU5C33G2
 JQUC8lOv5anaAOpYtMHrCHxdzp95XP6R6esRq0DxHfAr5EuW9/MLnbYvenGe5LeazcVvLW
 86vs9w0Az1gvrGLMLX77HgCSOCmKUE/7mlGUuPoc7U7JcO6CQWDWZaMtS+G6mhZxWohObr
 9yTEoPmelC6r9J20BuDWbOV4fAlD69Wmlp0qMgyzeEZL62Qyx46SuAadv3YtlLcnz3dHrR
 w/sWEivMLzz6BySkhLjz/bwsqKaMJrsqomwL/rgBkpebHTEwtEZVyxvoykMF1w==
Message-ID: <c2b571a7e74f86c6cb95bebd11274447c3080df9.camel@mailbox.org>
Subject: Re: [PATCH 1/4] dma-buf/fence: give some reasonable maximum
 signaling timeout
From: Philipp Stanner <phasta@mailbox.org>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, 
 phasta@kernel.org, alexdeucher@gmail.com, simona.vetter@ffwll.ch, 
 faith@gfxstrand.net, sumit.semwal@linaro.org
Cc: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org
Date: Tue, 25 Nov 2025 11:56:49 +0100
In-Reply-To: <508ff709-0f05-4982-8e15-5fea3bbd12e7@amd.com>
References: <20251120150018.27385-1-christian.koenig@amd.com>
 <20251120150018.27385-2-christian.koenig@amd.com>
 <380012b9d6f0e9ee3c2f125cfe2f37f65c1979e0.camel@mailbox.org>
 <b46913b6-fe61-48cd-a9ca-aa2fe3a12b63@amd.com>
 <1c1a14d42d0a4a25ebce26a2af0a61dc1b7813fc.camel@mailbox.org>
 <508ff709-0f05-4982-8e15-5fea3bbd12e7@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 8e8338e975b5ed4736f
X-MBO-RS-META: jpuqkyws15mjiz69i1t7se4x1bg3xkbg
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
Reply-To: phasta@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2025-11-25 at 09:48 +0100, Christian K=C3=B6nig wrote:
> On 11/25/25 09:13, Philipp Stanner wrote:
> > On Tue, 2025-11-25 at 09:03 +0100, Christian K=C3=B6nig wrote:
> > > On 11/25/25 08:55, Philipp Stanner wrote:
> > > > > =C2=A0
> > > > >=20

[=E2=80=A6]

> > > >=20
> > > > HZ can change depending on the config. Is that really a good choice=
? I
> > > > could see racy situations arising in some configs vs others
> > >=20
> > > 2*HZ is always two seconds expressed in number of jiffies, I can use =
msecs_to_jiffies(2000) to make that more obvious.
> >=20
> > On AMD64 maybe. What about the other architectures?
>=20
> HZ is defined as jiffies per second, So even if it changes to 10,100 or 1=
000 depending on the architecture 2*HZ is always two seconds expressed in j=
iffies.
>=20
> The HZ define is actually there to make it architecture independent.

<german English> Again what learned </german Enlgish>

Although the amount of documentation for such a central feature is a
bit thin. Anyways. msecs_to_jiffies() is more readable, yes. Many
drivers prefer it, too


>=20
> > >=20
> > > The GPU scheduler has a very similar define, MAX_WAIT_SCHED_ENTITY_Q_=
EMPTY which is currently just 1 second.
> > >=20
> > > The real question is what is the maximum amount of time we can wait f=
or the HW before we should trigger a timeout?
> >=20
> > That's a question only the drivers can answer, which is why I like to
> > think that setting global constants constraining all parties is not the
> > right thing to do.
>=20
> Exactly that's the reason why I bring that up. I think that drivers shoul=
d be in charge of timeouts is the wrong approach.
>=20
> See the reason why we have the timeout (and documented that it is a must =
have) is because we have both core memory management as well a desktop resp=
onsiveness depend on it.

Good and well, but then patch 4 becomes even more problematic:

So we'd just have drivers fire warnings, and then they would still have
the freedom to set timeouts for drm/sched, as long as those timeouts
are smaller than your new global constant.

Why then not remove drm/sched's timeout parameter API completely and
always use your maximum value internally in drm/sched? Or maybe
truncate it with a warning?

"Maximum timeout parameter exceeded, truncating to %ld.\n"

I suppose some drivers want even higher responsiveness than those 2
seconds.

I do believe that more of the driver folks should be made aware of this
intended change.

>=20
> > What is even your motivation? What problem does this solve? Is the OOM
> > killer currently hanging for anyone? Can you link a bug report?
>=20
> I'm not sure if we have an external bug report (we have an internal one),=
 but for amdgpu there were customer complains that 10 seconds is to long.
>=20
> So we changed it to 2 seconds for amdgpu, and now there are complains fro=
m internal AMD teams that 2 seconds is to short.
>=20
> While working on that I realized that the timeout is actually not driver =
dependent at all.
>=20
> What can maybe argued is that a desktop system should have a shorter time=
out than some server, but that one driver needs a different timeout than an=
other driver doesn't really makes sense to me.
>=20
> I mean what is actually HW dependent on the requirement that I need a res=
ponsive desktop system?

I suppose some drivers are indeed only used for server hardware. And
for compute you might not care about responsiveness as long as your
result drops off at some point. But there's cloud gaming, too..

I agree that distinguishing the use case that way is not ideal.
However, who has the knowledge of how the hardware is being used by
customers / users, if not the driver?


P.
