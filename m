Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 012989B7A29
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2024 13:00:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 724CD10E869;
	Thu, 31 Oct 2024 12:00:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="KwBr9xQ2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A7D510E869
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 12:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1730376026;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bZ1Wkv2y5hOyXSNMU8yMUJKCrVE3pHsisrzh1M4yBwA=;
 b=KwBr9xQ2XJ12oABKAntwXO74V/q9/JB485J3hocWVpABav4Bfkz7YPg8bWFePzQMPSdAzM
 skt4jkD/6QyXScC2W0XO4YYcksFXEMX+Q4hPea10pqcjGSYhEyOhQg/dtVU5nVRf7HoxJw
 LmY8pWibIi0hYl3+XHqcu4XY60BIH9I=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-524-JFcMPOnUNAGKuZfy6Ml1vQ-1; Thu, 31 Oct 2024 08:00:25 -0400
X-MC-Unique: JFcMPOnUNAGKuZfy6Ml1vQ-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-a9a2ccb77ceso65992566b.2
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 05:00:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730376024; x=1730980824;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bZ1Wkv2y5hOyXSNMU8yMUJKCrVE3pHsisrzh1M4yBwA=;
 b=tL/Rvt7dn36bp789S5hjFRo0pVmHVns4Mf81Nm4gRz8CM+m/qp7nQHxrt4RRktAatb
 JNgwahuCYdxjLHzFkWNDsqeE6qOClgxOUt0ol7Y8YO+ijg6nOWdxdCofZaw0HL47sUOL
 UlXX/sBSpya/OU7xsoSTzckEg+5pHP7OxjzhPogswNG6KKBxPjN051o25GAAfoKLRWWl
 ExaJstPKPOg61fD/VvRuvQck75D6o2fVfR0z6m3Vmyavpke0KSkJ2T17UEp1mnbkM/TA
 GhmAt6yX+fHDrdl2RJyTLDtzEthmXSKFdi0jrAuwoeERUpAVTV6nJYxgY8Mfz51r3Ci/
 usJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGEXHLmZwBLO1WOAo0qEKyke5UxZ/n1UzrUa5QnsjUc0EqzdMlqbBTUN8uuR3Aw1pAKkdmTQY7Tck=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxgLPrixGpvatxV1flktgVZ+LpyNC5pMDWiesu3wUCUi2V/MS/s
 69mCDmTfsBPW8Uqbq1sfZUHOinnDDEFRb0cSqbR6Y8DdTfWqrVtdIHC5CbzE5wDCHkPn6YFblX2
 odTKXjWiq/k9VHm4xAehdkOkbwCUk+DCEybvaaoI4g6q3UxNU4iwlcjUUv9KbH3yTeg==
X-Received: by 2002:a17:907:2cc7:b0:a99:d308:926 with SMTP id
 a640c23a62f3a-a9de632d0a5mr1758341466b.57.1730376024110; 
 Thu, 31 Oct 2024 05:00:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHFpE9tArG9ajQFaXYehLBUGhTeOySH2DT2Xvm3yTbIxhKdxMUCsAPQCRR61XrroNr7ktVXMA==
X-Received: by 2002:a17:907:2cc7:b0:a99:d308:926 with SMTP id
 a640c23a62f3a-a9de632d0a5mr1758338266b.57.1730376023652; 
 Thu, 31 Oct 2024 05:00:23 -0700 (PDT)
Received: from dhcp-64-16.muc.redhat.com (nat-pool-muc-t.redhat.com.
 [149.14.88.26]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9e56496c69sm60828766b.45.2024.10.31.05.00.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Oct 2024 05:00:21 -0700 (PDT)
Message-ID: <ae9291f0cad3e61531304c6cced31a967d5a70f9.camel@redhat.com>
Subject: Re: [PATCH] drm/sched: Document purpose of drm_sched_{start,stop}
From: Philipp Stanner <pstanner@redhat.com>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Luben Tuikov <ltuikov89@gmail.com>, Matthew Brost
 <matthew.brost@intel.com>,  Danilo Krummrich <dakr@kernel.org>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>,  Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>,  Simona Vetter <simona@ffwll.ch>, Tvrtko Ursulin
 <tursulin@ursulin.net>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Date: Thu, 31 Oct 2024 13:00:19 +0100
In-Reply-To: <CADnq5_NNnQvLG+dmj+RLijxAOg0jEuih+dqc3tin2EiK5jf2_g@mail.gmail.com>
References: <20241029133819.78696-2-pstanner@redhat.com>
 <CADnq5_NNnQvLG+dmj+RLijxAOg0jEuih+dqc3tin2EiK5jf2_g@mail.gmail.com>
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

On Tue, 2024-10-29 at 09:47 -0400, Alex Deucher wrote:
> On Tue, Oct 29, 2024 at 9:39=E2=80=AFAM Philipp Stanner <pstanner@redhat.=
com>
> wrote:
> >=20
> > drm_sched_start()'s and drm_sched_stop()'s names suggest that those
> > functions might be intended for actively starting and stopping the
> > scheduler on initialization and teardown.
> >=20
> > They are, however, only used on timeout handling (reset recovery).
> > The
> > docstrings should reflect that to prevent confusion.
> >=20
> > Document those functions' purpose.
> >=20
> > Signed-off-by: Philipp Stanner <pstanner@redhat.com>
>=20
> Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

Thanks.

Applied to drm-misc-next.

P.

>=20
> > ---
> > =C2=A0drivers/gpu/drm/scheduler/sched_main.c | 8 +++++++-
> > =C2=A01 file changed, 7 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> > b/drivers/gpu/drm/scheduler/sched_main.c
> > index eaef20f41786..59fd49fc790e 100644
> > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > @@ -601,6 +601,9 @@ static void drm_sched_job_timedout(struct
> > work_struct *work)
> > =C2=A0 * callers responsibility to release it manually if it's not part
> > of the
> > =C2=A0 * pending list any more.
> > =C2=A0 *
> > + * This function is typically used for reset recovery (see the
> > docu of
> > + * drm_sched_backend_ops.timedout_job() for details). Do not call
> > it for
> > + * scheduler teardown, i.e., before calling drm_sched_fini().
> > =C2=A0 */
> > =C2=A0void drm_sched_stop(struct drm_gpu_scheduler *sched, struct
> > drm_sched_job *bad)
> > =C2=A0{
> > @@ -673,7 +676,6 @@ void drm_sched_stop(struct drm_gpu_scheduler
> > *sched, struct drm_sched_job *bad)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cancel_delayed_work(&sched->=
work_tdr);
> > =C2=A0}
> > -
> > =C2=A0EXPORT_SYMBOL(drm_sched_stop);
> >=20
> > =C2=A0/**
> > @@ -681,6 +683,10 @@ EXPORT_SYMBOL(drm_sched_stop);
> > =C2=A0 *
> > =C2=A0 * @sched: scheduler instance
> > =C2=A0 *
> > + * This function is typically used for reset recovery (see the
> > docu of
> > + * drm_sched_backend_ops.timedout_job() for details). Do not call
> > it for
> > + * scheduler startup. The scheduler itself is fully operational
> > after
> > + * drm_sched_init() succeeded.
> > =C2=A0 */
> > =C2=A0void drm_sched_start(struct drm_gpu_scheduler *sched)
> > =C2=A0{
> > --
> > 2.47.0
> >=20
>=20

