Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C24F6876A78
	for <lists+dri-devel@lfdr.de>; Fri,  8 Mar 2024 19:07:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19800113951;
	Fri,  8 Mar 2024 18:07:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="yvTqmyAj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40F39113951
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Mar 2024 18:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1709921234;
 bh=+C3DESb3MnVB5uzdRmVfV+pgXhsL1ZNMQKGRRckZLVw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=yvTqmyAjWMTu5J6PTWlCVUO520zYAaqqBijs+pTAa408NbKOCyauF+cS/g35FudYz
 BZ+Xa9glw0ZIlQbz/kmEuqMoZJskvp5bUDAKZGW0AIOc8jlNNhtD0V0ZdDh5TtMzHG
 cX5xAK8aD0kWOrxEoga7qKN/S9sjydSeEspsy+h/POviy49cx5hh+mPvrELI+08iTz
 dMCMDCO2RdYlbW0cFzJcMngjp4D8uQyn/deSwrLW7C9YoeLMHSQ8tWvt3urM+tVVoF
 NtUMRKwS7f6AYhPwoOCq3F2dFuHLWX+iJTHPQRI3utvtv6rmxZeHK6YPSXO6qWykDq
 QshNy8HseNqNQ==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id E846637813E1;
 Fri,  8 Mar 2024 18:07:13 +0000 (UTC)
Date: Fri, 8 Mar 2024 19:07:12 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Liviu Dudau <liviu.dudau@arm.com>
Cc: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>, Steven
 Price <steven.price@arm.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, kernel@collabora.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Mihail
 Atanassov <Mihail.Atanassov@arm.com>
Subject: Re: [PATCH] drm/panthor: Add support for performance counters
Message-ID: <20240308190712.76a0a06e@collabora.com>
In-Reply-To: <ZetEl5h40pcB73t7@e110455-lin.cambridge.arm.com>
References: <20240305165820.585245-1-adrian.larumbe@collabora.com>
 <ZesYErFVdqLyjblW@e110455-lin.cambridge.arm.com>
 <20240308161515.1d74fd55@collabora.com>
 <ZetEl5h40pcB73t7@e110455-lin.cambridge.arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

On Fri, 8 Mar 2024 17:02:15 +0000
Liviu Dudau <liviu.dudau@arm.com> wrote:

> On Fri, Mar 08, 2024 at 04:15:15PM +0100, Boris Brezillon wrote:
> > On Fri, 8 Mar 2024 13:52:18 +0000
> > Liviu Dudau <liviu.dudau@arm.com> wrote:
> >  =20
> > > Hi Adri=C3=A1n,
> > >=20
> > > Thanks for the patch and appologies for taking a bit longer to respon=
d,
> > > I was trying to gather some internal Arm feedback before replying.
> > >=20
> > > On Tue, Mar 05, 2024 at 04:58:16PM +0000, Adri=C3=A1n Larumbe wrote: =
=20
> > > > This brings in support for Panthor's HW performance counters and qu=
erying
> > > > them from UM through a specific ioctl(). The code is inspired by ex=
isting
> > > > functionality for the Panfrost driver, with some noteworthy differe=
nces:
> > > >=20
> > > >  - Sample size is now reported by the firmware rather than having t=
o reckon
> > > >  it by hand
> > > >  - Counter samples are chained in a ring buffer that can be accessed
> > > >  concurrently, but only from threads within a single context (this =
is
> > > >  because of a HW limitation).
> > > >  - List of enabled counters must be explicitly told from UM
> > > >  - Rather than allocating the BO that will contain the perfcounter =
values
> > > >  in the render context's address space, the samples ring buffer is =
mapped
> > > >  onto the MCU's VM.
> > > >  - If more than one thread within the same context tries to dump a =
sample,
> > > >  then the kernel will copy the same frame to every single thread th=
at was
> > > >  able to join the dump queue right before the FW finished processin=
g the
> > > >  sample request.
> > > >  - UM must provide a BO handle for retrieval of perfcnt values rath=
er
> > > >  than passing a user virtual address.
> > > >=20
> > > > The reason multicontext access to the driver's perfcnt ioctl interf=
ace
> > > > isn't tolerated is because toggling a different set of counters tha=
n the
> > > > current one implies a counter reset, which also messes up with the =
ring
> > > > buffer's extraction and insertion pointers. This is an unfortunate
> > > > hardware limitation.   =20
> > >=20
> > > There are a few issues that we would like to improve with this patch.
> > >=20
> > > I'm not sure what user space app has been used for testing this (I'm =
guessing
> > > gputop from igt?) but whatever is used it needs to understand the cou=
nters
> > > being exposed. =20
> >=20
> > We are using perfetto to expose perfcounters.
> >  =20
> > > In your patch there is no information given to the user space
> > > about the layout of the counters and / or their order. Where is this =
being
> > > planned to be defined? =20
> >=20
> > That's done on purpose. We want to keep the kernel side as dumb as
> > possible so we don't have to maintain a perfcounter database there. All
> > the kernel needs to know is how much data it should transfer pass to
> > userspace, and that's pretty much it. =20
>=20
> I was not thinking about a perfcounter database but hints about counter v=
alue
> size. In the future we might have 64bits counters and you will not be abl=
e to
> tell only from the sample size if you're talking with an old firmware or =
not.

No, but the FW should tell us through its versioning scheme :P. I
mean, if the counter semantics for a given GPU changes with the FW
version, we should expose the FW version to userspace, and let
userspace maintain proper <gpu_id,fw_version> =3D> perfcnt_defs mappings.
This being said, I'm a bit concerned by this kind of non-backward
compatible ABI changes. If we're not careful, we will end up in the
same situation the proprietary PowerVR driver was, where userspace and
FW have to match for things to work properly, and that's not great...

> (Read: future GPUs are likely to go bigger on number of perf counters bef=
ore
> they gain higher definition).
>=20
> >  =20
> > > Long term, I think it would be good to have details
> > > about the counters available. =20
> >=20
> > The perfcounter definitions are currently declared in mesa (see the G57
> > perfcounter definitions for instance [1]). Mesa also contains a perfetto
> > datasource for Panfrost [2]. =20
>=20
> Sorry, I've missed that perfetto got updated.
>=20
> >  =20
> > >=20
> > > The other issue we can see is with the perfcnt_process_sample() and i=
ts
> > > handling of threshold event and overflows. If the userspace doesn't s=
ample
> > > quick enough and we cross the threshold we are going to lose samples =
and
> > > there is no mechanism to communicate to user space that the values th=
ey
> > > are getting have gaps. I believe the default mode for the firmware is=
 to
> > > give you counter values relative to the last read value, so if you dr=
op
> > > samples you're not going to make any sense of the data. =20
> >=20
> > If we get relative values, that's indeed a problem. I thought we were
> > getting absolute values though, in which case, if you miss two 32-bit
> > wraparounds, either your sampling rate is very slow, or events occur at
> > a high rate. =20
>=20
> First CSF GPUs have some erratas around perf counters that firmware tries=
 to
> hide. I need to dig a bit deeper into what firmware does for each GPU bef=
ore
> confirming the counting mode.
>=20
> The main issue with the code is that we should not be dropping samples at
> all, even if they are absolute values, as there will be gaps in the analy=
sis.

The only events that might trigger automatic sampling are power state
transitions and protection mode entry/exit. With PM being forced to
always on at the moment, I was assuming we wouldn't care about the
intermediate results if we get absolute values. Of course, that's
completely different if we're passed relative values.

> Looking at perfcnt_process_sample(), it does not increase the sampling ra=
te
> if we reach the threshold, nor does it tell the user space to do so. From=
 our
> DDK experience, if you've reached the threshold with the app sampling
> then you're likely to overflow as well, missing samples.

Again, if counters are absolute, overflowing is okay, it's overflowing
twice that's not okay, because then you lose a full 2^32 offset (or more
if you missed more than two overflows).

Anyway, if we want to make sure perfcnt users get all the samples, we're
probably better off providing a uAPI that mimics the FW interface. That
is, allow userspace to manage the ringbuf directly (with a new ioctl to
control the ringbuf head/tail and lets the kernel report low
threshold/sample lost events) instead of keeping this ringbuf-slot
-> user-provided-buffer copy we have right now.

