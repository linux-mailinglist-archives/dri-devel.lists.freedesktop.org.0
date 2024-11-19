Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B6E9D2A1E
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2024 16:50:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 286248914B;
	Tue, 19 Nov 2024 15:50:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ZdGd6H/l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FB7D8914B
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2024 15:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1732031400;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q3xTP3IHmufs/EiNhxCSdysYYc5yLptFjvi89IrpJpM=;
 b=ZdGd6H/lXa9y9dOJBH/Nce5SFxoKa+q2uq4lIMTnaaL6NFEY8U90BIlXCzYTHBp98TVtkn
 PsNLKfzN0ZoWWHHvoYe5ZTBxaV48HtQXGccUdcddbpCFfRD5w36vBdF84An/enR5ZdOh2g
 5Yugov5PNmpipNs4oL0BOZCv1BS6XMs=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-550-6upKCrn7M6ybVJmVgdTg1A-1; Tue, 19 Nov 2024 10:49:59 -0500
X-MC-Unique: 6upKCrn7M6ybVJmVgdTg1A-1
X-Mimecast-MFC-AGG-ID: 6upKCrn7M6ybVJmVgdTg1A
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-a9a004bfc1cso57057466b.1
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2024 07:49:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732031398; x=1732636198;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=j48pMYCI1mAgBjsBkzo4REwKeKZ158VhK38QDgL6Yds=;
 b=JCA7AsLbZKIenJnTWMn+VHS4KIE3TebxWBobAVdwg945zr9nAWBAZakHTwDgWdn5tY
 6V0e4m5UGzWnh1U25Hcsd1YT0OLPu809y5tBcl/GAycFCW3/oxjfiYhLofLArotWnf5x
 7s9URw4Z3I1esGZKtRoDSWjgXNl+wgESETAPBEtNoOZ5zel+GdqOnSRT+ue0C9J+1AhZ
 qKRUCKLdk9F1WHl5d8howW0Y3wAho2bHLKBWfBATFvtEqod/ongpPI8Vb2phEyAFjhxy
 NcbCsVnx5oC96ggUj6HY65u0ntZ2/oLVeUbmcEJ8QHRdrZsclRiP6xyqupKlkUUs+lZS
 R+XQ==
X-Gm-Message-State: AOJu0YyqX6s9c2xgAUzyaN/hx/3CrV0aUtq+IBapb2hA5DOWyPQC7wVm
 ex9bg2ht3ayYObNiS6HKa2lr7B5GD4cjGdkEgQvM5NXKlu2qAOJnzMAtjW0WC1iFZQBy0jF8sc/
 TuSCOqjuMGDk1NOj3aAo6fEVPCdP9n5bOFVutw7u237zl/1BOd2NADpWMjxPpaWyO1A==
X-Received: by 2002:a17:907:a4b:b0:a8d:6648:813f with SMTP id
 a640c23a62f3a-aa4833f6cc2mr1597488166b.3.1732031398003; 
 Tue, 19 Nov 2024 07:49:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHkY/oVtStM9buWZieA+FdS2d36EO4hAO6J0OH+roK8jLGYtod6akj9TI2LnWb9dg8cGqlkHg==
X-Received: by 2002:a17:907:a4b:b0:a8d:6648:813f with SMTP id
 a640c23a62f3a-aa4833f6cc2mr1597485866b.3.1732031397662; 
 Tue, 19 Nov 2024 07:49:57 -0800 (PST)
Received: from ?IPv6:2001:16b8:3d72:6400:a5d7:d54:865f:255e?
 ([2001:16b8:3d72:6400:a5d7:d54:865f:255e])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa20df4fc07sm662314866b.44.2024.11.19.07.49.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Nov 2024 07:49:57 -0800 (PST)
Message-ID: <0ba134e8a902da1b916469e760c36c3588f8bc71.camel@redhat.com>
Subject: Re: [PATCH 2/2] drm/sched: Fix docu of drm_sched_entity_flush()
From: Philipp Stanner <pstanner@redhat.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Luben
 Tuikov <ltuikov89@gmail.com>, Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Tue, 19 Nov 2024 16:49:56 +0100
In-Reply-To: <919d1a3b-6757-4902-ac1a-b056c9fdad06@amd.com>
References: <20241119134122.21950-2-pstanner@redhat.com>
 <20241119134122.21950-3-pstanner@redhat.com>
 <919d1a3b-6757-4902-ac1a-b056c9fdad06@amd.com>
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: G-QS_4QG1gCbMOWwNfYEBQvHy2kuzhRE9_J6nrZd4J4_1732031398
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

On Tue, 2024-11-19 at 15:27 +0100, Christian K=C3=B6nig wrote:
> Am 19.11.24 um 14:41 schrieb Philipp Stanner:
> > drm_sched_entity_flush()'s documentation states that an error is
> > being
> > returned when "the process was killed". That is not what the
> > function
> > actually does.
> >=20
> > Furthermore, it contains an inprecise statement about how the
> > function
> > is part of a convenience wrapper.
> >=20
> > Move that statement to drm_sched_entity_destroy().
> >=20
> > Correct drm_sched_entity_flush()'s documentation.
> >=20
> > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> > Signed-off-by: Philipp Stanner <pstanner@redhat.com>
> > ---
> > =C2=A0 drivers/gpu/drm/scheduler/sched_entity.c | 18 +++++++++---------
> > =C2=A0 1 file changed, 9 insertions(+), 9 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/scheduler/sched_entity.c
> > b/drivers/gpu/drm/scheduler/sched_entity.c
> > index 16b172aee453..7af7b448ad06 100644
> > --- a/drivers/gpu/drm/scheduler/sched_entity.c
> > +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> > @@ -270,15 +270,12 @@ static void drm_sched_entity_kill(struct
> > drm_sched_entity *entity)
> > =C2=A0=20
> > =C2=A0 /**
> > =C2=A0=C2=A0 * drm_sched_entity_flush - Flush a context entity
> > - *
> > =C2=A0=C2=A0 * @entity: scheduler entity
> > - * @timeout: time to wait in for Q to become empty in jiffies.
> > - *
> > - * Splitting drm_sched_entity_fini() into two functions, The first
> > one does the
> > - * waiting, removes the entity from the runqueue and returns an
> > error when the
> > - * process was killed.
> > + * @timeout: time to wait in jiffies
> > =C2=A0=C2=A0 *
> > =C2=A0=C2=A0 * Returns: 0 if the timeout ellapsed, the remaining time
> > otherwise.
> > +
> > + * Waits at most @timeout jiffies for the entity's job queue to
> > become empty.
> > =C2=A0=C2=A0 */
> > =C2=A0 long drm_sched_entity_flush(struct drm_sched_entity *entity, lon=
g
> > timeout)
> > =C2=A0 {
> > @@ -290,7 +287,7 @@ long drm_sched_entity_flush(struct
> > drm_sched_entity *entity, long timeout)
> > =C2=A0=C2=A0=09=09return 0;
> > =C2=A0=20
> > =C2=A0=C2=A0=09sched =3D entity->rq->sched;
> > -=09/**
> > +=09/*
> > =C2=A0=C2=A0=09 * The client will not queue more IBs during this fini,
> > consume existing
> > =C2=A0=C2=A0=09 * queued IBs or discard them on SIGKILL
>=20
> That comment is actually not correct either.
>=20
> drm_sched_entity_flush() should be used from the file_operations-
> >flush=20
> function and that one can be used even without destroying the entity.
>=20
> So it is perfectly possible that more and more IBs are pumped into
> the=20
> entity while we wait for it to become idle.

Which would just result in drm_sched_entity_flush() timing out and
effectively not having done anything, right?

I guess we could touch that topic again when writing some docu for
scheduler teardown.

Would it be the best to just remove the comment, what do you think?

P.

>=20
> Regards,
> Christian.
>=20
> > =C2=A0=C2=A0=09 */
> > @@ -359,8 +356,11 @@ EXPORT_SYMBOL(drm_sched_entity_fini);
> > =C2=A0=C2=A0 * drm_sched_entity_destroy - Destroy a context entity
> > =C2=A0=C2=A0 * @entity: scheduler entity
> > =C2=A0=C2=A0 *
> > - * Calls drm_sched_entity_flush() and drm_sched_entity_fini() as a
> > - * convenience wrapper.
> > + * Convenience wrapper for entity teardown.
> > + *
> > + * Teardown of entities is split into two functions. The first
> > one,
> > + * drm_sched_entity_flush(), waits for the entity to become empty.
> > The second
> > + * one, drm_sched_entity_fini(), does the actual cleanup of the
> > entity object.
> > =C2=A0=C2=A0 */
> > =C2=A0 void drm_sched_entity_destroy(struct drm_sched_entity *entity)
> > =C2=A0 {
>=20

