Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 168109568D3
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 12:59:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 485FC10E226;
	Mon, 19 Aug 2024 10:59:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=boris.brezillon@collabora.com header.b="LX6kkCxs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADB8010E221
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 10:59:01 +0000 (UTC)
Delivered-To: adrian.larumbe@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1724065131; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=WI35hWJN7ea1TgHHFgN3+owWfNPPj8RP9vBPNk7IjtfV2iHnVQFI0X8IpnUHFtWi19HkklpprLudUAOIQa4WPRpyJ2wZur8+iXfNorPVQpcewrQfjrvc/ZVdiOBIwgbu9ErHtW1jRtn7/jHP/ClN+S+gt9Na2p9tgiw03JrwR1E=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1724065131;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=X5oEhSX/ia+/y1kOOQLj3+PUnB27N+3uDrL/N0XUB9A=; 
 b=H62tKotfRt+6lFs2SK2jBs3KIw/ty8v8PuiyP2pqkWrPbh8tu9dROn20ULjRvLvliEKUOJiLgW/gXBuoW5O1PScvLxIOnKe3YZ4mQjm4sQh1PCjimZdqHhurC5sk+utjY7m+MAFgQllL5oj4zN4JcXPBmWITaILcmdK2yEF5QGs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=boris.brezillon@collabora.com;
 dmarc=pass header.from=<boris.brezillon@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1724065131; 
 s=zohomail; d=collabora.com; i=boris.brezillon@collabora.com; 
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=X5oEhSX/ia+/y1kOOQLj3+PUnB27N+3uDrL/N0XUB9A=;
 b=LX6kkCxssVrLDzHfztj3lv1KUP+EduChHA8ze2wgNkTSWrHh7fIE7uAal1zdWkg1
 wVitPzFMWsEOJlAY+GxNThnSclR/VtwNFPhVjt1lR66/7WFd1B9QM/b5IrwuUbrJLDq
 K+aO8iD8Y9QF2i2Awfkkj+DckxiK4CLeBuqHcGY0=
Received: by mx.zohomail.com with SMTPS id 1724065129715306.47262661351465;
 Mon, 19 Aug 2024 03:58:49 -0700 (PDT)
Date: Mon, 19 Aug 2024 12:58:40 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>, Liviu
 Dudau <liviu.dudau@arm.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/4] drm/panthor: introduce job cycle and timestamp
 accounting
Message-ID: <20240819125840.64b26200@collabora.com>
In-Reply-To: <0f089616-2d63-4ac7-a3ba-b6909f9d9ade@arm.com>
References: <20240716201302.2939894-1-adrian.larumbe@collabora.com>
 <20240716201302.2939894-2-adrian.larumbe@collabora.com>
 <e46310c7-27b8-4548-93db-56b780873c12@arm.com>
 <5u7pv27ifao57iagnasycxg4oe5hqq42kajbf4xnllxefg7oet@c362omtcizaj>
 <0f089616-2d63-4ac7-a3ba-b6909f9d9ade@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External
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

Hi,

On Mon, 19 Aug 2024 08:48:24 +0100
Steven Price <steven.price@arm.com> wrote:

> Hi Adri=C3=A1n,
>=20
> On 31/07/2024 13:41, Adri=C3=A1n Larumbe wrote:
> > Hi Steven, thanks for the remarks.
> >=20
> > On 19.07.2024 15:14, Steven Price wrote: =20
> >> On 16/07/2024 21:11, Adri=C3=A1n Larumbe wrote: =20
> >>> Enable calculations of job submission times in clock cycles and wall
> >>> time. This is done by expanding the boilerplate command stream when r=
unning
> >>> a job to include instructions that compute said times right before an=
 after
> >>> a user CS.
> >>>
> >>> Those numbers are stored in the queue's group's sync objects BO, right
> >>> after them. Because the queues in a group might have a different numb=
er of
> >>> slots, one must keep track of the overall slot tally when reckoning t=
he
> >>> offset of a queue's time sample structs, one for each slot.
> >>>
> >>> This commit is done in preparation for enabling DRM fdinfo support in=
 the
> >>> Panthor driver, which depends on the numbers calculated herein.
> >>>
> >>> A profile mode device flag has been added that will in a future commit
> >>> allow UM to toggle time sampling behaviour, which is disabled by defa=
ult to
> >>> save power. It also enables marking jobs as being profiled and picks =
one of
> >>> two call instruction arrays to insert into the ring buffer. One of th=
em
> >>> includes FW logic to sample the timestamp and cycle counter registers=
 and
> >>> write them into the job's syncobj, and the other does not.
> >>>
> >>> A profiled job's call sequence takes up two ring buffer slots, and th=
is is
> >>> reflected when initialising the DRM scheduler for each queue, with a
> >>> profiled job contributing twice as many credits.
> >>>
> >>> Signed-off-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> =20
> >>
> >> Thanks for the updates, this looks better. A few minor comments below.
> >> =20
> >>> ---
> >>>  drivers/gpu/drm/panthor/panthor_device.h |   2 +
> >>>  drivers/gpu/drm/panthor/panthor_sched.c  | 244 ++++++++++++++++++++-=
--
> >>>  2 files changed, 216 insertions(+), 30 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/d=
rm/panthor/panthor_device.h
> >>> index e388c0472ba7..3ede2f80df73 100644
> >>> --- a/drivers/gpu/drm/panthor/panthor_device.h
> >>> +++ b/drivers/gpu/drm/panthor/panthor_device.h
> >>> @@ -162,6 +162,8 @@ struct panthor_device {
> >>>  		 */
> >>>  		struct page *dummy_latest_flush;
> >>>  	} pm;
> >>> +
> >>> +	bool profile_mode;
> >>>  };
> >>> =20
> >>>  /**
> >>> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/dr=
m/panthor/panthor_sched.c
> >>> index 79ffcbc41d78..6438e5ea1f2b 100644
> >>> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> >>> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> >>> @@ -93,6 +93,9 @@
> >>>  #define MIN_CSGS				3
> >>>  #define MAX_CSG_PRIO				0xf
> >>> =20
> >>> +#define NUM_INSTRS_PER_SLOT			16
> >>> +#define SLOTSIZE				(NUM_INSTRS_PER_SLOT * sizeof(u64))
> >>> +
> >>>  struct panthor_group;
> >>> =20
> >>>  /**
> >>> @@ -466,6 +469,9 @@ struct panthor_queue {
> >>>  		 */
> >>>  		struct list_head in_flight_jobs;
> >>>  	} fence_ctx;
> >>> +
> >>> +	/** @time_offset: Offset of panthor_job_times structs in group's sy=
ncobj bo. */
> >>> +	unsigned long time_offset; =20
> >>
> >> AFAICT this doesn't need to be stored. We could just pass this value
> >> into group_create_queue() as an extra parameter where it's used. =20
> >=20
> > I think we need to keep this offset value around, because queues within=
 the same group
> > could have a variable number of slots, so when fetching the sampled val=
ues from the
> > syncobjs BO in update_fdinfo_stats, it would have to traverse the entir=
e array of
> > preceding queues and figure out their size in slots so as to jump over =
as many
> > struct panthor_job_times after the preceding syncobj array. =20
>=20
> Yes I think I was getting myself confused - for some reason I'd thought
> the ring buffers in each queue were the same size. It makes sense to
> keep this.

IIRC, I was the one suggesting to put all metadata in a single BO to
avoid losing too much space when ring buffers are small (because of the
4k granularity of BOs). But given the size of panthor_job_times (32
bytes per slot), a 4k chunk only covers 128 job slots, which is not
that big to be honest. So I'm no longer sure this optimization makes
sense. If we still want to allocate one big BO containing syncobjs
and timestamp slots for all queues, say, to optimize the GEM metadata vs
actual BO data overhead, I'd recommend having a CPU/GPU pointer
relative to the queue in panthor_queue which we can easily dereference
with time_slots[job_slot_id].

>=20
> <snip>
>=20
> >>> @@ -3384,9 +3565,12 @@ panthor_job_create(struct panthor_file *pfile,
> >>>  		goto err_put_job;
> >>>  	}
> >>> =20
> >>> +	job->is_profiled =3D pfile->ptdev->profile_mode;
> >>> +
> >>>  	ret =3D drm_sched_job_init(&job->base,
> >>>  				 &job->group->queues[job->queue_idx]->entity,
> >>> -				 1, job->group);
> >>> +				 job->is_profiled ? NUM_INSTRS_PER_SLOT * 2 :
> >>> +				 NUM_INSTRS_PER_SLOT, job->group); =20
> >>
> >> Is there a good reason to make the credits the number of instructions,
> >> rather than the number of slots? If we were going to count the actual
> >> number of non-NOP instructions then there would be some logic (although
> >> I'm not convinced that makes much sense), but considering we only allow
> >> submission in "slot granules" we might as well use that as the unit of
> >> "credit". =20
> >=20
> > In my initial pre-ML version of the patch series I was passing the numb=
er of
> > queue slots as the total credit count, but Boris was keener on setting =
it to
> > the total number of instructions instead.
> >=20
> > I agree with you that both are equivalent, one just being an integer mu=
ltiple
> > of the other, so I'm fine with either choice. Maybe Boris can pitch in,=
 in
> > case he has a strong opinion about this. =20
>=20
> I wouldn't say I have a strong opinion, it just seems a little odd to be
> multiplying the value by a constant everywhere. If you'd got some
> changes planned where the instructions could vary more dynamically that
> would be good to know about.

Yeah, the long term plan is to make the number of instructions variable
based on the profiling parameters, such that we don't lose ringbuf
slots when profiling is completely disabled. Of course we always want to
keep it a multiple of a cache-line (AKA 8 instructions), but I find it
easier to reason in number of instructions rather than block of
instructions.

Regards,

Boris
