Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A7BC5236C
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 13:16:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD79310E701;
	Wed, 12 Nov 2025 12:16:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="MNnRx03V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFD7D10E701
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 12:16:03 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4d62S04mxCz9v6W;
 Wed, 12 Nov 2025 13:16:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1762949760; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O9LUNJo5r7PS83iZrxvhcBeuzxwUTMP3M8c3Wg/G9iw=;
 b=MNnRx03VlYCovIhai70dGV7KLPVA9AhAgvwq1hy3gL/fwG5xyUz9IlOEfIU8vqXgaY/+Ss
 3aCLfnr33y4NVtVxIGogHZYydg0M/t8FFV8OjDKu6OZ7UV9cTJtc26wUgOLeICOa/pNwmj
 b7cZRyNhOBqBmFDK8UPY5xQCXcYlxKJ0J574iELO1FSmoFUvqZ68tNIwhjgMnoTgKUuv9n
 pQlShYr0/04I+CRuhwUSWeboNpZq3/UruQj1xOyVz4FGj3FA66YT3useEqgBBZXF4G33g5
 Z11yXE7XuH2wKFPmngFScyKHmXHJ6idn0UK+tCayyNQvDJhFA4Y4zwiynNuXeg==
Message-ID: <38bce31a7cdea31738c161bb06af272d5f68af1a.camel@mailbox.org>
Subject: Re: [PATCH] drm/sched: Document racy behavior of
 drm_sched_entity_push_job()
From: Philipp Stanner <phasta@mailbox.org>
To: Tvrtko Ursulin <tursulin@ursulin.net>, Philipp Stanner
 <phasta@kernel.org>,  Matthew Brost <matthew.brost@intel.com>, Christian
 =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,  Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Wed, 12 Nov 2025 13:15:57 +0100
In-Reply-To: <e9c02871-fa80-46c7-8b96-bad3a6a2c5b9@ursulin.net>
References: <20251112073138.93355-2-phasta@kernel.org>
 <e9c02871-fa80-46c7-8b96-bad3a6a2c5b9@ursulin.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: tm8qemr418gbfr3h4eghbo5toqbd37kj
X-MBO-RS-ID: 49125ab28eaa9f3a0b8
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

On Wed, 2025-11-12 at 09:42 +0000, Tvrtko Ursulin wrote:
>=20
> On 12/11/2025 07:31, Philipp Stanner wrote:
> > drm_sched_entity_push_job() uses the unlocked spsc_queue. It takes a
> > reference to that queue's tip at the start, and some time later removes
> > that entry from that list, without locking or protection against
> > preemption.
>=20
> I couldn't figure out what you refer to by tip reference at the start,=
=20
> and later removes it. Are you talking about the top level view from=20
> drm_sched_entity_push_job() or where exactly?
> > This is by design, since the spsc_queue demands single producer and
> > single consumer. It was, however, never documented.
> >=20
> > Document that you must not call drm_sched_entity_push_job() in parallel
> > for the same entity.
> >=20
> > Signed-off-by: Philipp Stanner <phasta@kernel.org>
> > ---
> > =C2=A0 drivers/gpu/drm/scheduler/sched_entity.c | 3 +++
> > =C2=A0 1 file changed, 3 insertions(+)
> >=20
> > diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm=
/scheduler/sched_entity.c
> > index 5a4697f636f2..b31e8d14aa20 100644
> > --- a/drivers/gpu/drm/scheduler/sched_entity.c
> > +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> > @@ -562,6 +562,9 @@ void drm_sched_entity_select_rq(struct drm_sched_en=
tity *entity)
> > =C2=A0=C2=A0 * drm_sched_entity_push_job - Submit a job to the entity's=
 job queue
> > =C2=A0=C2=A0 * @sched_job: job to submit
> > =C2=A0=C2=A0 *
> > + * It is illegal to call this function in parallel, at least for jobs =
belonging
> > + * to the same entity. Doing so leads to undefined behavior.
>=20
> One thing that is documented in the very next paragraph is that the=20
> design implies a lock held between arm and push. At least to ensure=20
> seqno order matches the queue order.
>=20
> I did not get what other breakage you found, but I also previously did=
=20
> find something other than that. Hm.. if I could only remember what it
> was. Probably mine was something involving drm_sched_entity_select_rq(),=
=20
> drm_sched_entity_modify_sched() and (theoretical) multi-threaded=20
> userspace submit on the same entity. Luckily it seems no one does that.
>=20
> The issue you found is separate and not theoretically fixed by this=20
> hypothetical common lock held over arm and push?

Well, if 2 CPUs should ever run in parallel in
drm_sched_entity_push_job() the spsc_queue will just explode. Most
notably, one CPU could get the job at the tip (the oldest job), then be
preempted, and then another CPU takes the same job and pops it.

The API contract should be that the user doesn't have to know whether
there's a linked list or the magic spsc_queue.

The entire entity submission pattern is basically designed around
"single producer [per entity]", and that's not very well documented.

I don't think the common lock comment fully addresses that, because
it's merely about the sequence numbers. I think the common lock should
likely prevent any issues, but I feel more comfortable if the user gets
informed explicitly about the potential racyness of this function.

Maybe we can combine the two paragraphs.

P.
