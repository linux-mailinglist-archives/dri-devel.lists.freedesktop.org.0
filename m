Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A41958440
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 12:23:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FB9D10E6D1;
	Tue, 20 Aug 2024 10:23:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="CXMLsoIW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFBE210E6D1
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 10:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1724149434;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z6yD7EXxtMSIEgaYn1Mu8m1V6SKjE9QoBiwRx7GBEwE=;
 b=CXMLsoIWK640wvM4B+egcAz+yREwU/VZwIij4vO4vVZBDSMDm83wE9dZsiuq8MzmmMupWy
 yW7w6Lycw6mtke+RCwqJUP3fybPUpHMUzfFMjDhdNSqtaYJKVSCClxN6kGjom3LjQAVc+h
 Mg6cchgxAirX9CGwxANVBR0AYvLOrf0=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-60-2eQauKz_NZ-6X-Qm85SK_Q-1; Tue, 20 Aug 2024 06:23:53 -0400
X-MC-Unique: 2eQauKz_NZ-6X-Qm85SK_Q-1
Received: by mail-lj1-f200.google.com with SMTP id
 38308e7fff4ca-2f3f2bf2738so288321fa.0
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 03:23:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724149432; x=1724754232;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=d4c+7fu/VdEpjhH3XMlyk8gLAqXF7DZDZmgZbuAUUV0=;
 b=qs/STFjXH/3UnpUMo9gwf510Xs/nA1i2u2HzDT2mzZNpxa1qxxFT0+EnF0S4oQfcrI
 YZR2eRctvNVbdrctTeH02RzJu6A2IAbctX4o7ecyUyUfXD+edv1iTdRewSe6x472TPZC
 ao0HfR4RY+tZRqVD95zryqDPyj6fNtFR33W8liL+rpA4LiDbE1DA8nn+r0R0CzTm07u0
 LX1Jg7ndLmNfiZb2Yg6B1KYRi9TRM4DKmjLF5MJxp75Wilktotig2acFtMCgJNw8fKLi
 mwQrzvKihhDZTBlz5PkXppHgoKEHVvdQmTKu1wpw76GFHAJjGXBcfZDdtsDrj1N/qzhJ
 yjug==
X-Gm-Message-State: AOJu0YwaK5h8Cj5WIOyDDFrKipfoiws0kiQ+0Xu88VAmt9E/yND0LyM1
 oyWXcrTEHWQzZLUh6L+A3VCLvKztUrOhNv/+jogwl4ZeiR1NLNf7ys4AGX6C4q3uYrCG/P/MmPl
 7/7VzvPLK1ui0WsRmRrIMbzD8nV++JWNju4aLo3tgh2W0ug095fuQqj20XLAgmnTH0g==
X-Received: by 2002:a2e:bc20:0:b0:2f1:929b:af00 with SMTP id
 38308e7fff4ca-2f3be5eaebbmr55822191fa.5.1724149431661; 
 Tue, 20 Aug 2024 03:23:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEKOBhR4ojLfA+j+V5ryjxkELVaKf/dDRfbA6pDJgghg5Ap7oA8FDtLoCFdCUzkszAjQ4sRng==
X-Received: by 2002:a2e:bc20:0:b0:2f1:929b:af00 with SMTP id
 38308e7fff4ca-2f3be5eaebbmr55822061fa.5.1724149431052; 
 Tue, 20 Aug 2024 03:23:51 -0700 (PDT)
Received: from eisenberg.fritz.box ([2001:16b8:3dcc:1f00:bec1:681e:45eb:77e2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a83838c69easm747601766b.40.2024.08.20.03.23.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2024 03:23:50 -0700 (PDT)
Message-ID: <46046055be8fcf29949d36778bdb4ee7a7b6ed67.camel@redhat.com>
Subject: Re: [PATCH 1/2] drm/sched: memset() 'job' in drm_sched_job_init()
From: Philipp Stanner <pstanner@redhat.com>
To: Luben Tuikov <ltuikov89@gmail.com>, Matthew Brost
 <matthew.brost@intel.com>,  Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Danilo Krummrich <dakr@redhat.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Tue, 20 Aug 2024 12:23:49 +0200
In-Reply-To: <20240806143855.29789-2-pstanner@redhat.com>
References: <20240806143855.29789-2-pstanner@redhat.com>
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

*PING*


On Tue, 2024-08-06 at 16:38 +0200, Philipp Stanner wrote:
> drm_sched_job_init() has no control over how users allocate struct
> drm_sched_job. Unfortunately, the function can also not set some
> struct
> members such as job->sched.
>=20
> This could theoretically lead to UB by users dereferencing the
> struct's
> pointer members too early.
>=20
> It is easier to debug such issues if these pointers are initialized
> to
> NULL, so dereferencing them causes a NULL pointer exception.
> Accordingly, drm_sched_entity_init() does precisely that and
> initializes
> its struct with memset().
>=20
> Initialize parameter "job" to 0 in drm_sched_job_init().
>=20
> Signed-off-by: Philipp Stanner <pstanner@redhat.com>
> ---
> Hi all,
> I did some experiments with the scheduler recently and am trying to
> make
> the documentation and bits of the code more bullet proof.
>=20
> I tested the performance of v6.11-rc2 with and without this memset()
> by
> creating 1e6 jobs and found no performance regression.
>=20
> Cheers,
> P.
> ---
> =C2=A0drivers/gpu/drm/scheduler/sched_main.c | 8 ++++++++
> =C2=A01 file changed, 8 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> b/drivers/gpu/drm/scheduler/sched_main.c
> index 76969f9c59c2..1498ee3cbf39 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -936,6 +936,14 @@ int drm_sched_job_init(struct drm_sched_job
> *job,
> =C2=A0=09=09return -EINVAL;
> =C2=A0=09}
> =C2=A0
> +=09/*
> +=09 * We don't know for sure how the user has allocated. Thus,
> zero the
> +=09 * struct so that unallowed (i.e., too early) usage of
> pointers that
> +=09 * this function does not set is guaranteed to lead to a
> NULL pointer
> +=09 * exception instead of UB.
> +=09 */
> +=09memset(job, 0, sizeof(*job));
> +
> =C2=A0=09job->entity =3D entity;
> =C2=A0=09job->credits =3D credits;
> =C2=A0=09job->s_fence =3D drm_sched_fence_alloc(entity, owner);

