Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C63799EE87
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2024 16:01:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCB8310E297;
	Tue, 15 Oct 2024 14:01:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="K/xrluyQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22CC410E2CA
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2024 14:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1729000865;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pYKWgKZ2qTmHOu2tb3MT9eeqiGM0miY2Wt9rTbkCoTk=;
 b=K/xrluyQpPV+tzMXSjCn7ZGW6kTa1JJaNRxNgjnhlX7aDbRm3nZ/M7aDO0VAEhyUlHCsqf
 J27zTJ0tfM3XqU6UYTUDT/3Yi7h1Nf6SjbQG+rSou//pOrALjALLToGUF4RMWLrew58y+b
 zFRN+JeQaxCddAKc2xacI2IYv+fgdUM=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-15-dDqv5d9QMDC2sd3--yBRtw-1; Tue, 15 Oct 2024 10:01:04 -0400
X-MC-Unique: dDqv5d9QMDC2sd3--yBRtw-1
Received: by mail-lj1-f200.google.com with SMTP id
 38308e7fff4ca-2fb4c08c02cso10258471fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2024 07:01:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729000862; x=1729605662;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pYKWgKZ2qTmHOu2tb3MT9eeqiGM0miY2Wt9rTbkCoTk=;
 b=uJN4NBLvsKEdzU9tNK/vt8CyukEgXnzjnga8G0Q1osbKh1MiRGKdloqO1kaT0hkNwf
 Cln+dgcuIibSA1aXEv44tcgUE9fgL4NNuqrgbIKaEHhzG6tiKunaq/kdHWmBCMSRUH94
 e3PeQ3LQf2jU9cXMs4v80ob42DqF8lRwpTqKONKgo9ZU/qDXXK7g8xeh47YagEluJC/N
 GCGWE3eAkQk1iXn8InTTu+WvYNEFZ+xzbtig39CT6pXliaWnBU0OfaTo3u8y9Uowollr
 R0TirwwW0w4OtHD0fWOdd/eMMRrPi/iZkwqywaD0jJ4Rg9H7C+Upqzm2r/SSvPkJS6Rz
 /j8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOkW3EmMskU1AIxr5FDnitSiN9tpPwmZXQ3CwZEQXwhmThfxqImvO0mqrgVKwM9v9qWphpcOqmNLw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx80DzjXh1FM+DpJBprqwsG67NuAGoWwjcwNJITaIVpm69ma/zk
 h1xUtvzMyvDlHJnhko/SoIbsRPc3PLLaP+iZvoh2LzVDVlH612OCqRZ+VHN2qnsYKvcgul1siu/
 XXWxnDrMZVWYVgU24+j1aLTDFZaqTJuhvnjrfpg2ty2Gvj/9oheBOtE6i0unqrCfJZQ==
X-Received: by 2002:a2e:511a:0:b0:2fb:5014:8eb9 with SMTP id
 38308e7fff4ca-2fb5014914fmr28670741fa.10.1729000861227; 
 Tue, 15 Oct 2024 07:01:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHD21q1CjOmQB8SO10AcYP20N/LBiwvG8vys14GvZMmN3xszw2CGNOl1fLBA6EyadekV37YPg==
X-Received: by 2002:a2e:511a:0:b0:2fb:5014:8eb9 with SMTP id
 38308e7fff4ca-2fb5014914fmr28670151fa.10.1729000859079; 
 Tue, 15 Oct 2024 07:00:59 -0700 (PDT)
Received: from dhcp-64-16.muc.redhat.com (nat-pool-muc-t.redhat.com.
 [149.14.88.26]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4313f569781sm18709745e9.11.2024.10.15.07.00.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Oct 2024 07:00:58 -0700 (PDT)
Message-ID: <9b9378581aa75fc39117a03a573199920c832b31.camel@redhat.com>
Subject: Re: [PATCH 1/5] drm/sched: Optimise drm_sched_entity_push_job
From: Philipp Stanner <pstanner@redhat.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, Tvrtko Ursulin
 <tursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Alex Deucher <alexander.deucher@amd.com>, Luben
 Tuikov <ltuikov89@gmail.com>, Matthew Brost <matthew.brost@intel.com>
Date: Tue, 15 Oct 2024 16:00:56 +0200
In-Reply-To: <18e9dd02-2cdd-42a2-9e7f-271c685d9f93@igalia.com>
References: <20241014104637.83209-1-tursulin@igalia.com>
 <20241014104637.83209-2-tursulin@igalia.com>
 <0df6b855b0974a88a3f6af42108e2596bd285898.camel@redhat.com>
 <8c038f91-716c-4a3d-8c70-10859d28d77f@igalia.com>
 <587ac0260e9c843ccd0e7d449fc6b6c9270ec741.camel@redhat.com>
 <a3cb9eba-a13e-4f56-8e81-7a06eb655e3b@igalia.com>
 <33ebe52c5df76611451685261f046d77efc44134.camel@redhat.com>
 <18e9dd02-2cdd-42a2-9e7f-271c685d9f93@igalia.com>
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
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

On Tue, 2024-10-15 at 14:14 +0100, Tvrtko Ursulin wrote:
>=20
> On 15/10/2024 12:38, Philipp Stanner wrote:
> > On Tue, 2024-10-15 at 09:12 +0100, Tvrtko Ursulin wrote:
> > >=20
> > > On 15/10/2024 08:11, Philipp Stanner wrote:
> > > > On Mon, 2024-10-14 at 13:07 +0100, Tvrtko Ursulin wrote:
> > > > >=20
> > > > > On 14/10/2024 12:32, Philipp Stanner wrote:
> > > > > > Hi,
> > > > > >=20
> > > > > > On Mon, 2024-10-14 at 11:46 +0100, Tvrtko Ursulin wrote:
> > > > > > > From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> > > > > > >=20
> > > > > > > In FIFO mode We can avoid dropping the lock only to
> > > > > > > immediately
> > > > > > > re-
> > > > > > > acquire
> > > > > > > by adding a new drm_sched_rq_update_fifo_locked() helper.
> > > > > > >=20
> > > > > >=20
> > > > > > Please write detailed commit messages, as described here
> > > > > > [1].
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1. Describe the problem: current=
 state and why it's
> > > > > > bad.
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2. Then, describe in imperative =
(present tense) form
> > > > > > what
> > > > > > the
> > > > > > commit
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 does about the=
 problem.
> > > > >=20
> > > > > Both pieces of info are already there:
> > > > >=20
> > > > > 1. Drops the lock to immediately re-acquire it.
> > > > > 2. We avoid that by by adding a locked helper.
> > > > > > Optionally, in between can be information about why it's
> > > > > > solved
> > > > > > this
> > > > > > way and not another etc.
> > > > > >=20
> > > > > > Applies to the other patches, too.
> > > > > >=20
> > > > > >=20
> > > > > > [1]
> > > > > > https://www.kernel.org/doc/html/latest/process/submitting-patch=
es.html#describe-your-changes
> > > > >=20
> > > > > Thanks I am new here and did not know this.
> > > > >=20
> > > > > Seriosuly, lets not be too blindly strict about this because
> > > > > it
> > > > > can
> > > > > get
> > > > > IMO ridiculous.
> > > > >=20
> > > > > One example when I previously accomodated your request is
> > > > > patch
> > > > > 3/5
> > > > > from
> > > > > this series:
> > > > >=20
> > > > > """
> > > > > Current kerneldoc for struct drm_sched_rq incompletely
> > > > > documents
> > > > > what
> > > > > fields are protected by the lock.
> > > > >=20
> > > > > This is not good because it is misleading.
> > > > >=20
> > > > > Lets fix it by listing all the elements which are protected
> > > > > by
> > > > > the
> > > > > lock.
> > > > > """
> > > > >=20
> > > > > While this was the original commit text you weren't happy
> > > > > with:
> > > > >=20
> > > > > """
> > > > > drm/sched: Re-order struct drm_sched_rq members for clarity
> > > > >=20
> > > > > Lets re-order the members to make it clear which are
> > > > > protected by
> > > > > the
> > > > > lock
> > > > > and at the same time document it via kerneldoc.
> > > > > """
> > > > >=20
> > > > > I maintain the original text was passable.
> > > > >=20
> > > > > On top, this was just a respin to accomodate the merge
> > > > > process.
> > > > > All
> > > > > approvals were done and dusted couple weeks or so ago so
> > > > > asking
> > > > > for
> > > > > yet
> > > > > another respin for such trivial objections is not great.
> > > >=20
> > > > I understand that you're unhappy, but please understand the
> > > > position
> > > > I'm coming from. As you know, since you sent these patches
> > > > within a
> > > > different series (and, thus, since I reviewed them), I was
> > > > trusted
> > > > with
> > > > co-maintaining this piece of shared infrastructure.
> > > >=20
> > > > And since you've worked on it a bit now, I suppose you also
> > > > know
> > > > that
> > > > the GPU Scheduler is arguably in quite a bad shape, has far too
> > > > little
> > > > documentation, has leaks, maybe race conditions, parts *where
> > > > the
> > > > locking rules are unclear* and is probably only fully
> > > > understood by
> > > > a
> > > > small hand full of people. I also argue that this is a *very*
> > > > complicated piece of software.
> > >=20
> > > We already went over that and agreed. Not least I agreed the base
> > > is
> > > shaky since few years=C2=A0 ago. :)
> > >=20
> > > Btw if things align, I hope you will at some point see a follow
> > > up
> > > series from me which makes some significant simplifications and
> > > improvements at the same time.
> >=20
> > Cool, good to hear!
> > (Would be even cooler if simplifications and improvements can be
> > delivered through separate patch series to be easier to review
> > etc.)
>=20
> Yes, when I spot something I pull it ahead and/or standalone when it=20
> makes sense. But it is early days and a big job.
>=20
> > > > So I might be or appear to be a bit pedantic, but I'm not doing
> > > > that to
> > > > terrorize you, but because I want this thing to become well
> > > > documented,
> > > > understandable, and bisectable. Working towards a canonical,
> > > > idiot-
> > > > proof commit style is one measure that will help with that.
> > > >=20
> > > > I want to offer you the following: I can be more relaxed with
> > > > things
> > > > universally recognized as trivial (comment changes, struct
> > > > member
> > > > reordering) =E2=80=93 but when something like a lock is touched in =
any
> > > > way,
> > > > we
> > > > shall document that in the commit message as canonically as
> > > > possible,
> > > > so someone who's less experienced and just bisected the commit
> > > > immediately understands what has been done (or rather: was
> > > > supposed
> > > > to
> > > > be done).
> > >=20
> > > So how would you suggest to expand this commit text so it doesn't
> > > read
> > > too self-repeating?
> >=20
> > My issue with this particular commit message is mainly that it
> > doesn't
> > make it obvious what the patch is supposed to do. So one can make
> > it
> > quicker and better to review by detailing it a bit more, so the
> > reviewer then can compare commit message vs. what the code does. It
> > seems to me for example that the actual optimization is being done
> > in
> > drm_sched_entity_push_job(), and drm_sched_entity_pop_job() had to
> > be
> > ported, too, for correctness
>=20
> "It seems" aka the commit title says so. ;)
>=20
> > Another small thing that might be cool is something that makes it a
> > bit
> > more obvious that this is an optimization, not a fix.
> >=20
> > So I would probably write:
> >=20
> > "So far, drm_sched_rq_update_fifo() automatically takes
> > drm_sched_entity.rq_lock. For DRM_SCHED_POLICY_FIFO, this is
> > inefficient because that lock is then taken, released and retaken
> > in
> > drm_sched_entity_push_job().
> >=20
> > Improve performance by moving the locking out of
> > drm_sched_rq_update_fifo()."
> >=20
> > Not that much longer but makes it far more obvious what shall be
> > achieved where :]
>=20
> How about this:
>=20
> """
> In FIFO mode (which is the default), both drm_sched_entity_push_job()
> and drm_sched_rq_update_fifo(), where the latter calls the former,
> are=20
> currently taking and releasing the same entity->rq_lock.
>=20
> We can avoid that design inelegance, and also have a miniscule=20
> efficiency improvement on the idle submit path, by introducing a new=20
> drm_sched_rq_update_fifo_locked() helper and pulling up the lock
> taking=20
> to its callers.
> """

That looks good to me

P.


>=20
> > (Let me read through the other patches briefly. Then we should be
> > good
> > with v2 of this series.. or would it be v3 then?)
>=20
> Depends how you count. By unique series titles or by fundamental
> content.
>=20
> Regards,
>=20
> Tvrtko
>=20

