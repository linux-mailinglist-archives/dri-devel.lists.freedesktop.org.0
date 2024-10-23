Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F8B49AC0C7
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2024 09:56:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AAC610E778;
	Wed, 23 Oct 2024 07:56:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="fupe5ru+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C243210E778
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 07:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1729670205;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aCSjV0XfdWuGS9szbWzKj3cnJxaULNJJR2xbQsn+fsM=;
 b=fupe5ru+svQwviyd6oumfS1jwDYZyfnuN6jK/Yy1yVJVbPtpdtP/3wfVr7m1Mb9tRlrbNB
 7s7uxRm4gNJd+LBEO1VaCvorVEFVcQ8+vuLqOjuDgqXAss6if63nB9EiBaAy536DEMovos
 Mjmti/unjZVgGJwqXIefOmKM4vzX6g4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-661-hR3BSt80OXeSoYEVhPMLcw-1; Wed, 23 Oct 2024 03:56:44 -0400
X-MC-Unique: hR3BSt80OXeSoYEVhPMLcw-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-37d52ca258eso3252386f8f.3
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 00:56:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729670204; x=1730275004;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aCSjV0XfdWuGS9szbWzKj3cnJxaULNJJR2xbQsn+fsM=;
 b=bzcKlkTAxSi6S9gnkSVqbdTwZm6YmGL8NVsGC4jT3XAGTQY8Z26rDh8XvksyXM+k8J
 zjMrLYHLEZS9q3LDZMzGDCM1/Bd/fKvFxxeDUxbt+9Ay+GpZFsz6OZELuduER/DzEzv0
 ab3eFM+3eSv8w4/03hzxHJJKTOam1xxFqWdWmLkxZ/drdX3nXBy4StaIDrj3ILc3pdxu
 QCQi5VrOrejygGHffoJzsKPc6wNjYMpk6THHkCyOiqlL5ylMvOom29RjCnKRKLoaUkEN
 xDgXhOT/zlsvxNo3dcKrMz+N8QE4LRaeXQcVuND1gR5S+M/yAD8H7H85xJKVz9u5QzLG
 yU3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCU65xuu9fPLE6h81fa4RrSQgs26Gz0OK6jN8UQ6xp11ZfMa8FsiWBi8dgX0tvEZiQDldYbuthY71eU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxlRIRs9Zgz8nlQtzqf/0NC4CUtEdko2/VWTeGG8NB4YlVFGBsZ
 2tgTidois9Dt5RAHkYDt/zCtmqsJ2Rl/tkislCNRCPeOpy9Y8jABRWbdHjeR2VtQDZXWOGK74hc
 fZz4hwTyA3ortkGI/njJGlxJzzv0Ht94U0ylBu1iSyLVIJPWrTEQCg85UUIIwhUmb4w==
X-Received: by 2002:a5d:6aca:0:b0:374:b35e:ea6c with SMTP id
 ffacd0b85a97d-37efcf84aadmr1134143f8f.40.1729670203653; 
 Wed, 23 Oct 2024 00:56:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHe4BciJC2od5KEqt5ERetsnAnNJJ1mM3rfmuv1fEcH3TIm59e6Loxri52pVa4NKLMR20Y6dQ==
X-Received: by 2002:a5d:6aca:0:b0:374:b35e:ea6c with SMTP id
 ffacd0b85a97d-37efcf84aadmr1134128f8f.40.1729670203142; 
 Wed, 23 Oct 2024 00:56:43 -0700 (PDT)
Received: from eisenberg.fritz.box ([2001:16b8:3dac:2f00:8834:dd3a:39b8:e43b])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37ee0b943e4sm8329878f8f.75.2024.10.23.00.56.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2024 00:56:42 -0700 (PDT)
Message-ID: <07fd3c93da2bbb3c67a78e93ccd1c73705953b22.camel@redhat.com>
Subject: Re: [PATCH 1/4] drm/sched: Mark scheduler work queues with
 WQ_MEM_RECLAIM
From: Philipp Stanner <pstanner@redhat.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 dakr@kernel.org, Luben Tuikov <ltuikov89@gmail.com>
Date: Wed, 23 Oct 2024 09:56:42 +0200
In-Reply-To: <Zxfq50e+uXfcsark@DUT025-TGLU.fm.intel.com>
References: <20241021175705.1584521-1-matthew.brost@intel.com>
 <20241021175705.1584521-2-matthew.brost@intel.com>
 <a5dd3b1d6b8da184ed16f5653faca95163b79340.camel@redhat.com>
 <Zxfq50e+uXfcsark@DUT025-TGLU.fm.intel.com>
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

On Tue, 2024-10-22 at 18:11 +0000, Matthew Brost wrote:
> On Tue, Oct 22, 2024 at 04:19:18PM +0200, Philipp Stanner wrote:
> > On Mon, 2024-10-21 at 10:57 -0700, Matthew Brost wrote:
> > > DRM scheduler work queues are used to submit jobs, jobs are in
> > > the
> > > path
> >=20
> > "scheduler work queues" is very generic, how about
> > "drm_gpu_scheduler.submit_wq is used to submit jobs, [...]"
> >=20
>=20
> Sure.
>=20
> > > or dma-fences, and dma-fences are in the path of reclaim. Mark
> >=20
> > s/or/of
> >=20
>=20
> Yep.
>=20
> > > scheduler
> > > work queues with WQ_MEM_RECLAIM so these work queues can continue
> > > to
> > > make forward progress during reclaim.
> >=20
> > It is just *one* queue (per scheduler) really, isn't it?
> >=20
>=20
> Yes.
>=20
> > If the change above is applied, could just say: "Create the work
> > queue
> > with WQ_MEM_RECLAIM so it can continue [...]"
> >=20
>=20
> Now you are confusing me.

I just was hinting at using singular instead of plural.
So
s/work queues/work queue

But that's just a nit

>=20
> > So for my understanding: is this a performance optimization or is
> > it a
> > bug? IOW, would forward progress just be delayed or entirely
> > prevented?
> > Would be cool to state that a bit more clearly in the commit
> > message.
> >=20
>=20
> I can make that a bit more clear.
>=20
> > Work-queue docu says "MUST":
> >=20
> > ``WQ_MEM_RECLAIM`` All wq which might be used in the memory reclaim
> > paths **MUST** have this flag set. The wq is guaranteed to have at
> > least one execution context regardless of memory pressure.
> >=20
> > So it seems to me that this fixes a bug? Should it be backported in
> > your opinion?
> >=20
>=20
> Bug - yea probably a fix tag then for backporting. Will add in next
> rev.

Cool, thx for clarifying!

P.

>=20
> >=20
> > >=20
> > > Cc: Luben Tuikov <ltuikov89@gmail.com>
> >=20
> > btw., how did you send this email? I couldn't find Luben on CC.
> > Added
> > him.
>=20
> git send-email...
>=20
> I may have forgot to include him on the Cc list.
>=20
> Matt
>=20
> >=20
> > Thx,
> > P.
> >=20
> > > Cc: Danilo Krummrich <dakr@kernel.org>
> > > Cc: Philipp Stanner <pstanner@redhat.com>
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > ---
> > > =C2=A0drivers/gpu/drm/scheduler/sched_main.c | 4 ++--
> > > =C2=A01 file changed, 2 insertions(+), 2 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> > > b/drivers/gpu/drm/scheduler/sched_main.c
> > > index 6e4d004d09ce..567811957c0f 100644
> > > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > > @@ -1275,10 +1275,10 @@ int drm_sched_init(struct
> > > drm_gpu_scheduler
> > > *sched,
> > > =C2=A0 sched->own_submit_wq =3D false;
> > > =C2=A0 } else {
> > > =C2=A0#ifdef CONFIG_LOCKDEP
> > > - sched->submit_wq =3D alloc_ordered_workqueue_lockdep_map(name, 0,
> > > + sched->submit_wq =3D alloc_ordered_workqueue_lockdep_map(name,
> > > WQ_MEM_RECLAIM,
> > > =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &drm_sched_lockdep_map);
> > > =C2=A0#else
> > > - sched->submit_wq =3D alloc_ordered_workqueue(name, 0);
> > > + sched->submit_wq =3D alloc_ordered_workqueue(name,
> > > WQ_MEM_RECLAIM);
> > > =C2=A0#endif
> > > =C2=A0 if (!sched->submit_wq)
> > > =C2=A0 return -ENOMEM;
> >=20
>=20

