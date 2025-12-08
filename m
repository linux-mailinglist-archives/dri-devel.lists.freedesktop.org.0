Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D925CAD481
	for <lists+dri-devel@lfdr.de>; Mon, 08 Dec 2025 14:34:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 627B610E153;
	Mon,  8 Dec 2025 13:33:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="RBlvQSuQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 805FE10E153
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Dec 2025 13:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1765200823;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DSGQbJU62dXQ3/HgjxN8bSIZFSLSDYlIc/2r8ds+EZA=;
 b=RBlvQSuQ/e+VaaHqNA4NPnmWgILGSRR+wwdpMVeT13Ia+VMArg2PwvGlW29eakTfyiWK7N
 jH3DzLe6C4sOekY4ZCUoZza6UL2x3pFJpYJB/braLFdPtSCSyQHtQvnqE+8Uaxpd+UYuuu
 MerwShSPLwqsS7Rv+zA0Ztf3fcVDyb8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-549-4IvR2clkMhaQGtt72nMgqA-1; Mon, 08 Dec 2025 08:33:41 -0500
X-MC-Unique: 4IvR2clkMhaQGtt72nMgqA-1
X-Mimecast-MFC-AGG-ID: 4IvR2clkMhaQGtt72nMgqA_1765200820
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-477563a0c75so24081765e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Dec 2025 05:33:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765200820; x=1765805620;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DSGQbJU62dXQ3/HgjxN8bSIZFSLSDYlIc/2r8ds+EZA=;
 b=PHhbSjWbwVINTOzlgCj/StTv8rQxjZz25FSFALzqD7K1q26cBXCuP7qvaGAm14EeyX
 gdex9QCNmwkxAiaFl4U0o40ec3iwpYLo63jX/XGU8uebq/1p2/XqbRZlOB2FPT4/juZV
 +zwgfRkdDfbyK5muYBD+snug2bohJ0w0V20W4pDmTGZXxIdNCnlm2H7XVcNyff4V+psX
 dCJrtlzeO2VSBqyrDXJmvSB7WdW5HZJiobQEvPH1n5sHNuQkppIbUwBM1j3ybGZnl6yJ
 mHYcZX2qFN/TYcN9JLE6CzoGE8I69rAQOm/t8CkLgZ9wkOwmopHbZ5wL7mol2/l9+rsw
 CliQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXwr+RzQnb1ab0kL8EnNqXztc2p6+yvapm9Q97dNh+UGLoa6jlmZjBFifx4NWWpupqwvko72qojl6I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzlW3ESnbPIun3KpX5GQiRtoOQP5Jdz2Cks21inHWBun4pZvsZo
 C9zFf9gKw0SxPmARL/Fs9Le9QJ17vPFiH+fVey+zMM50EBxmxI49PeGfv9QVtwrRQvRY3eKZ5Fg
 KwC8+R/vSLD/fntLsIllbxebKHJUP4morn0B3xl5ZACbq2lb2N1DBQd6ce2DwQMn7PnMhbw==
X-Gm-Gg: ASbGncswQ2os7JCN/6/1cbVg1pdlQjO4+AzLmCnvFGp9CwoeaZynjNmgIZs21C5n2zV
 3gyK0e7aMUiM5yPkkhwMYOHB7C1Kod53fN+APxYSxRJd01SvNEg75TYajRjeUbJPb+Lh4R/QfCq
 xQDMiWbr5/8UuS6b8mjfHna36NbLIKKKBDdwNX6YyCx380dw+SSJnZfHW6G+ui4Wj7SmWJ/8TV2
 tGujXsLrm+4Ls+IdQojb0iM1RXA65vP88bHKqVzWgMsheSTFDETpfIiN7hUUw3It96kaUyoGiCq
 cX8QHA0e2ZweUafSIiix8K45s6IyNDS/NaxSiE2VooTnXxAMKgjw5C9/nZmj8YUXra6wYc9SM5p
 iZkFqjVgaOigAAY9lYsHY/d8F7uQaVTiTL73oUGRRrFZbA4sPX4IJ3pmC
X-Received: by 2002:a05:600c:210b:b0:479:3a86:dc1d with SMTP id
 5b1f17b1804b1-4793a86dcdemr51002935e9.37.1765200820252; 
 Mon, 08 Dec 2025 05:33:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHG9Wp4LLK9NpwUtuvkgaCMkhjD1nMtiCuk0IpeJ5VFbyDPOOzWg9H7FTZmnxbEDz6XeHEpHA==
X-Received: by 2002:a05:600c:210b:b0:479:3a86:dc1d with SMTP id
 5b1f17b1804b1-4793a86dcdemr51002805e9.37.1765200819760; 
 Mon, 08 Dec 2025 05:33:39 -0800 (PST)
Received: from ?IPv6:2001:16b8:3d03:eb00:dc87:649d:b5b:d46f?
 ([2001:16b8:3d03:eb00:dc87:649d:b5b:d46f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4792b157783sm137987045e9.5.2025.12.08.05.33.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Dec 2025 05:33:39 -0800 (PST)
Message-ID: <aeaced5616f80e4e59f6cbdce77ab22365ce1901.camel@redhat.com>
Subject: Re: [PATCH v7 2/9] drm/sched: Add pending job list iterator
From: Philipp Stanner <pstanner@redhat.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Alex
 Deucher <alexdeucher@gmail.com>
Cc: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 dakr@kernel.org
Date: Mon, 08 Dec 2025 14:33:37 +0100
In-Reply-To: <3f71a73a-8360-409c-8a51-55c37230d4cf@amd.com>
References: <20251201183954.852637-1-matthew.brost@intel.com>
 <20251201183954.852637-3-matthew.brost@intel.com>
 <0088fe0dd0d62b876d77b0f9e3a1c7586bdc5557.camel@redhat.com>
 <CADnq5_Pv20j+oSSFvfauUKvH8LUiVMCz2jgQyrDMw3CKACLNgQ@mail.gmail.com>
 <3f71a73a-8360-409c-8a51-55c37230d4cf@amd.com>
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: fjdZVTWHof24Tvd2LqEG64Zpv1PGjJFrMkO8UE3T49E_1765200820
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

On Fri, 2025-12-05 at 10:19 +0100, Christian K=C3=B6nig wrote:
> On 12/4/25 17:04, Alex Deucher wrote:
> > On Wed, Dec 3, 2025 at 4:24=E2=80=AFAM Philipp Stanner <pstanner@redhat=
.com> wrote:
> > >=20
> > > +Cc Alex, Christian, Danilo
> > >=20
> > >=20
> > > On Mon, 2025-12-01 at 10:39 -0800, Matthew Brost wrote:
> > > > Stop open coding pending job list in drivers. Add pending job list
> > > > iterator which safely walks DRM scheduler list asserting DRM schedu=
ler
> > > > is stopped.
> > > >=20
> > > > v2:
> > > > =C2=A0- Fix checkpatch (CI)
> > > > v3:
> > > > =C2=A0- Drop locked version (Christian)
> > > > v4:
> > > > =C2=A0- Reorder patch (Niranjana)
> > >=20
> > > Same with the changelog.
> > >=20
> > > >=20
> > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@i=
ntel.com>
> > > > ---
> > > > =C2=A0include/drm/gpu_scheduler.h | 50 ++++++++++++++++++++++++++++=
+++++++++
> > > > =C2=A01 file changed, 50 insertions(+)
> > > >=20
> > > > diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_schedule=
r.h
> > > > index 385bf34e76fe..9d228513d06c 100644
> > > > --- a/include/drm/gpu_scheduler.h
> > > > +++ b/include/drm/gpu_scheduler.h
> > > > @@ -730,4 +730,54 @@ static inline bool drm_sched_job_is_signaled(s=
truct drm_sched_job *job)
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 dma_fence_is_signaled(&s_fence->finished);
> > > > =C2=A0}
> > > >=20
> > > > +/**
> > > > + * struct drm_sched_pending_job_iter - DRM scheduler pending job i=
terator state
> > > > + * @sched: DRM scheduler associated with pending job iterator
> > > > + */
> > > > +struct drm_sched_pending_job_iter {
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_gpu_scheduler *sched;
> > > > +};
> > > > +
> > > > +/* Drivers should never call this directly */
> > > > +static inline struct drm_sched_pending_job_iter
> > > > +__drm_sched_pending_job_iter_begin(struct drm_gpu_scheduler *sched=
)
> > > > +{
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_sched_pending_job_iter iter =
=3D {
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 .sched =3D sched,
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 };
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 WARN_ON(!drm_sched_is_stopped(sched));
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 return iter;
> > > > +}
> > > > +
> > > > +/* Drivers should never call this directly */
> > > > +static inline void
> > > > +__drm_sched_pending_job_iter_end(const struct drm_sched_pending_jo=
b_iter iter)
> > > > +{
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 WARN_ON(!drm_sched_is_stopped(iter.sched)=
);
> > > > +}
> > > > +
> > > > +DEFINE_CLASS(drm_sched_pending_job_iter, struct drm_sched_pending_=
job_iter,
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __drm_sched=
_pending_job_iter_end(_T),
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __drm_sched=
_pending_job_iter_begin(__sched),
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_=
gpu_scheduler *__sched);
> > > > +static inline void *
> > > > +class_drm_sched_pending_job_iter_lock_ptr(class_drm_sched_pending_=
job_iter_t *_T)
> > > > +{ return _T; }
> > > > +#define class_drm_sched_pending_job_iter_is_conditional false
> > > > +
> > > > +/**
> > > > + * drm_sched_for_each_pending_job() - Iterator for each pending jo=
b in scheduler
> > > > + * @__job: Current pending job being iterated over
> > > > + * @__sched: DRM scheduler to iterate over pending jobs
> > > > + * @__entity: DRM scheduler entity to filter jobs, NULL indicates =
no filter
> > > > + *
> > > > + * Iterator for each pending job in scheduler, filtering on an ent=
ity, and
> > > > + * enforcing scheduler is fully stopped
> > > > + */
> > > > +#define drm_sched_for_each_pending_job(__job, __sched, __entity)=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 scoped_guard(drm_sched_pending_job_iter, =
(__sched))=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 list_for_each_entry((__job), &(__sched)->pending_list, list)=C2=A0=
=C2=A0=C2=A0 \
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for_each_if(!(__enti=
ty) || (__job)->entity =3D=3D (__entity))
> > > > +
> > > > =C2=A0#endif
> > >=20
> > >=20
> > > See my comments in the first patch. The docu doesn't mention at all w=
hy
> > > this new functionality exists and when and why users would be expecte=
d
> > > to use it.
> > >=20
> > > As far as I remember from XDC, both AMD and Intel overwrite a timed o=
ut
> > > jobs buffer data in the rings on GPU reset. To do so, the driver need=
s
> > > the timedout job (passed through timedout_job() callback) and then
> > > needs all the pending non-broken jobs.
> > >=20
> > > AFAICS your patch provides a generic iterator over the entire
> > > pending_list. How is a driver then supposed to determine which are th=
e
> > > non-broken jobs (just asking, but that needs to be documented)?
> > >=20
> > > Could it make sense to use a different iterator which only returns jo=
bs
> > > of not belonging to the same context as the timedout-one?
> > >=20
> > > Those are important questions that need to be addressed before mergin=
g
> > > that.
> > >=20
> > > And if this works canonically (i.e., for basically everyone), it need=
s
> > > to be documented in drm_sched_resubmit_jobs() that this iterator is n=
ow
> > > the canonical way of handling timeouts.
> > >=20
> > > Moreover, btw, just yesterday I added an entry to the DRM todo list
> > > which addresses drm_sched_resubmit_jobs(). If we merge this, that ent=
ry
> > > would have to be removed, too.
> > >=20
> > >=20
> > > @AMD: Would the code Matthew provides work for you? Please give your
> > > input. This is very important common infrastructure.
> >=20
> > I don't think drm_sched_resubmit_jobs() can work for us without major
> > rework.=C2=A0 For our kernel queues, we have a single queue on which jo=
bs
> > for different clients are scheduled.=C2=A0 When we reset the queue, we =
lose
> > all jobs on the queue and have to re-emit the non-guilty ones.=C2=A0 We=
 do
> > this at the ring level, i.e., we save the packets directly from the
> > ring and then re-emit the packets for the non-guilty contexts to the
> > freshly reset ring.=C2=A0 This avoids running run_job() again which wou=
ld
> > issue new fences and race with memory management, etc.
> >=20
> > I think the following would be workable:
> > 1. driver job_timedout() callback flags the job as bad. resets the bad
> > queue, and calls drm_sched_resubmit_jobs()
> > 2. drm_sched_resubmit_jobs() walks the pending list and calls
> > run_job() for every job
>=20
> Calling run_job() multiple times was one of the worst ideas I have ever s=
een.
>=20
> The problem here is that you need a transactional approach to the interna=
l driver state which is modified by ->run_job().
>=20
> So for example if you have:
> ->run_job(A)
> ->run_job(B)
> ->run_job(C)
>=20
> And after a reset you find that you need to re-submit only job B and A & =
C are filtered then that means that your driver state needs to get back bef=
ore running job A.
>=20
> > 2. driver run_job() callback looks to see if we already ran this job
> > and uses the original fence rather than allocating a new one
>=20
> Nope, the problem is *all* drivers *must* use the original fence. Otherwi=
se you always run into trouble.
>=20
> We should not promote a driver interface which makes it extremely easy to=
 shoot down the whole system.
>=20
> > 3. driver run_job() callback checks to see if the job is guilty or
> > from the same context and if so, sets an error on the fences and
> > submits only the fence packet to the queue so that any follow up jobs
> > will properly synchronize if they need to wait on the fence from the
> > bad job.
> > 4. driver run_job() callback will submit the full packet stream for
> > non-guilty contexts
> >=20
> > I guess we could use the iterator and implement that logic in the
> > driver directly rather than using drm_sched_resubmit_jobs().
>=20
> Yeah, exactly that's the way to go.

Sorry, I guess my message was confusing.

I don't mean anyone to use drm_sched_resubmit_jobs() at all. That
function is deprecated, and since there are still users, we can't
easily modify it.
I just mentioned that function because its docstring should inform
about what users should do *instead* of calling that function.
Currently, it's just marked as deprecated without providing users with
an alternative.

Anyways.
So can you take a look at Matthew's iterator and see if that will work
for you?

If we'd end up with an at least mostly-generic solution for resubmits
that's in use in both Xe and amdgpu, that would be a huge leap forward.


P.

>=20
> Christian.
>=20
> >=20
> > Alex
>=20

