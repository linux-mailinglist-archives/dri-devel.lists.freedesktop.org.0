Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F22BB2D6EA
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 10:44:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C78FF10E6C4;
	Wed, 20 Aug 2025 08:44:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Pq2jeBlG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3752110E6C4
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 08:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1755679438;
 bh=kSWBiN/GA12YV+qcjFwKA/cHTBbv2Wy0xFRnPWQK9Ko=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Pq2jeBlGW0CUvs+Xm9i6FNFZMCKVKAGxdCNJTRWPhjlDz2XzOAEkVYZrovKo74nQ1
 xY3TT6SIBwsT8FhK7O0aNYjjxAPayV/shBwz+KiY2o4PvR8vjExgytjQYpGhaOHS0K
 vHl+WJqvvdd1G6KOf2+tOBGGubh6qoNDFNAgYtxfPachR3YpFyvy+CDeqfC5hflwRJ
 sdhW0WqHAoCAzSHEABAkuQiWqDTLSShIKnWLu+E1SRWzeS57apkZ39Tw6U1yzjPW+G
 ZArhB/JOqskFgGBMrBjKEOgPjgR+jyVUZxs2g2UrvTM8oXYcrkArqMk9ON/GZ7ihqo
 4Xat9acOqDz5Q==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 6DCB017E0488;
 Wed, 20 Aug 2025 10:43:58 +0200 (CEST)
Date: Wed, 20 Aug 2025 10:43:53 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Chia-I Wu <olvaffe@gmail.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/panthor: always set fence errors on CS_FAULT
Message-ID: <20250820104353.5cc8035d@fedora>
In-Reply-To: <CAPaKu7TTR4prUqt=AL2Lh=od9B_RqQpH+5redvFb3FY749Ebgg@mail.gmail.com>
References: <20250618145550.1901618-1-olvaffe@gmail.com>
 <20250623083241.02127feb@fedora>
 <CAPaKu7TTR4prUqt=AL2Lh=od9B_RqQpH+5redvFb3FY749Ebgg@mail.gmail.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
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

On Tue, 8 Jul 2025 14:40:06 -0700
Chia-I Wu <olvaffe@gmail.com> wrote:

> On Sun, Jun 22, 2025 at 11:32=E2=80=AFPM Boris Brezillon
> <boris.brezillon@collabora.com> wrote:
> >
> > On Wed, 18 Jun 2025 07:55:49 -0700
> > Chia-I Wu <olvaffe@gmail.com> wrote:
> > =20
> > > It is unclear why fence errors were set only for CS_INHERIT_FAULT.
> > > Downstream driver also does not treat CS_INHERIT_FAULT specially.
> > > Remove the check.
> > >
> > > Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
> > > ---
> > >  drivers/gpu/drm/panthor/panthor_sched.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/dr=
m/panthor/panthor_sched.c
> > > index a2248f692a030..1a3b1c49f7d7b 100644
> > > --- a/drivers/gpu/drm/panthor/panthor_sched.c
> > > +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> > > @@ -1399,7 +1399,7 @@ cs_slot_process_fault_event_locked(struct panth=
or_device *ptdev,
> > >       fault =3D cs_iface->output->fault;
> > >       info =3D cs_iface->output->fault_info;
> > >
> > > -     if (queue && CS_EXCEPTION_TYPE(fault) =3D=3D DRM_PANTHOR_EXCEPT=
ION_CS_INHERIT_FAULT) {
> > > +     if (queue) {
> > >               u64 cs_extract =3D queue->iface.output->extract;
> > >               struct panthor_job *job;
> > > =20
> >
> > Now that I look at the code, I think we should record the error when
> > the ERROR_BARRIER is executed instead of flagging all in-flight jobs as
> > faulty. One option would be to re-use the profiling buffer by adding an
> > error field to panthor_job_profiling_data, but we're going to lose 4
> > bytes per slot because of the 64-bit alignment we want for timestamps,
> > so maybe just create a separate buffers with N entries of:
> >
> > struct panthor_job_status {
> >    u32 error;
> > }; =20
> The current error path uses cs_extract to mark exactly the offending
> job faulty.  Innocent in-flight jobs do not seem to be affected.

My bad, I thought the faulty CS was automatically entering the recovery
substate (fetching all instructions and ignoring RUN_xxx ones), but it
turns out CS instruction fetching is stalled until the fault is
acknowledged, so we're good.

>=20
> I looked into emitting LOAD/STORE after SYNC_ADD64 to copy the error
> to panthor_job_status.  Other than the extra instrs and storage,
> because group_sync_upd_work can be called before LOAD/STORE, it will
> need to check both panthor_job_status and panthor_syncobj_64b.  That
> will be a bit ugly as well.

Nah, I think you're right, I just had a wrong recollection of how
recovery mode works. The patch is

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

