Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74CC99D273E
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2024 14:48:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C66C310E644;
	Tue, 19 Nov 2024 13:48:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ipEJzuDl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD08710E644
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2024 13:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1732024126;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A4FSgh9Fw9z8YvQygm2UjAPr3rEAEfNTbD82sOvwQJg=;
 b=ipEJzuDlSWw4i1fDxR+XndAqbDsuZCOltaFHsWbzEqzUQrF+dJPg2loNBjjz23EJFY7IWV
 R73nFP8BsW4d34DgmLC5tQaZxCByf8NMkOZ6EDuQeqGNGigL99MkUm5v1AqlIDxAdoz7SC
 BsUJ+WBGvBdocAcSlRwRgUAXHvL/7P4=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-413-_ahahqMHObaJr86FoMELog-1; Tue, 19 Nov 2024 08:48:45 -0500
X-MC-Unique: _ahahqMHObaJr86FoMELog-1
X-Mimecast-MFC-AGG-ID: _ahahqMHObaJr86FoMELog
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-460c6731ebeso59335271cf.0
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2024 05:48:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732024125; x=1732628925;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=65l/Cwngry4f7Io+loOISLSnM8MxOBcTPObuT/XTVCQ=;
 b=vRJlzIpGk52rvumDqW0ahrfyNjpvwsDsbMuFbJ5sGwWLYvlIdBEa7uKgwZY9gX9H3x
 YMbwB4WIipq4PjagkHH5MufxD3uD0kuTWfJz7NyiRZylNpSVD1aFADI6HFn9LSFevDPA
 yoKV0WvjJZxoJf2cquRkWIjcfeAaNsUcUjsmEQhNzuXmXFZn3C8Vs0QZFitMNiCTLOkE
 qoBvn24Rd8hHRGnVbySXXjRfnHey1kAVb+SmP08uthVx+dZ6mI7dIflskYSOxnyhxmZ0
 4JWvIlYzxyWLy3ApJlxnuG3ndjmghM3Kejs6cjowZsDDwWcs10yWWJlVOKg4qJpD4ZoG
 gn/A==
X-Gm-Message-State: AOJu0YyPLIpV3iqCJ++IwN5O6ByzqQb/TfV/Z31gNywnsY3oiZ9fnxP8
 eiqKikCCO3UgWodK7n8jPqdDQV8jK/PEPvxqvGxnji3EaBKf07l9LLpclsKla79JMK0jmLGCotS
 RhqAjD9DVzk0UoiNJ0eI72i/04NcqUywUdB190XwupBDbN5p1zuWY5PZDtwYKaSBC3g==
X-Received: by 2002:a05:622a:a0b:b0:463:9183:8515 with SMTP id
 d75a77b69052e-4639183880amr44999351cf.20.1732024125065; 
 Tue, 19 Nov 2024 05:48:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFCG17rOJNvWNSx6LG7CNfRqW04EtENIYOntwdaB6w9t1ggllxFUbNd8aNULsls51XAH3nL3g==
X-Received: by 2002:a05:622a:a0b:b0:463:9183:8515 with SMTP id
 d75a77b69052e-4639183880amr44999081cf.20.1732024124787; 
 Tue, 19 Nov 2024 05:48:44 -0800 (PST)
Received: from [10.200.68.91] (nat-pool-muc-u.redhat.com. [149.14.88.27])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-46392b96cb6sm11208421cf.17.2024.11.19.05.48.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Nov 2024 05:48:44 -0800 (PST)
Message-ID: <75fffbf97ec274eb7b2727c9506d7aaa49b7d24e.camel@redhat.com>
Subject: Re: [PATCH 1/2] drm/sched: Fix drm_sched_entity_flush() return val
From: Philipp Stanner <pstanner@redhat.com>
To: Luben Tuikov <ltuikov89@gmail.com>, Matthew Brost
 <matthew.brost@intel.com>,  Danilo Krummrich <dakr@kernel.org>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>,  Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>,  Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Christian
 =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Date: Tue, 19 Nov 2024 14:48:41 +0100
In-Reply-To: <20241119134122.21950-2-pstanner@redhat.com>
References: <20241119134122.21950-2-pstanner@redhat.com>
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: KjVBpIAQlww2fBpBVX53dTHdzUcWeSCFqxqWoam0iaU_1732024125
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

On Tue, 2024-11-19 at 14:41 +0100, Philipp Stanner wrote:
> The documentation of drm_sched_entity_flush() states that the
> function
> shall - always - return the remaining timeout time in jiffies.
>=20
> However, that is not what the function actually does; in one of its
> if
> branches it simply returns the unchanged timeout value.
>=20
> Furthermore, the used function wait_event_timeout() doesn't always
> return the remaining timeout time.
>=20
> Adjust the function so that it actually does what the documentation
> states it shall do.
>=20
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Signed-off-by: Philipp Stanner <pstanner@redhat.com>
> ---
> @AMD:
> You guys are the only ones who use the function's return code, so I
> leave it completely up to you to decide what behavior you want.
>=20
> But we should at least do something, because right now function
> documentation and behavior do not match.
>=20
> P.
> ---
> =C2=A0drivers/gpu/drm/scheduler/sched_entity.c | 23 ++++++++++++++++-----=
-
> -
> =C2=A01 file changed, 16 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c
> b/drivers/gpu/drm/scheduler/sched_entity.c
> index a75eede8bf8d..16b172aee453 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -278,7 +278,7 @@ static void drm_sched_entity_kill(struct
> drm_sched_entity *entity)
> =C2=A0 * waiting, removes the entity from the runqueue and returns an
> error when the
> =C2=A0 * process was killed.
> =C2=A0 *
> - * Returns the remaining time in jiffies left from the input timeout
> + * Returns: 0 if the timeout ellapsed, the remaining time otherwise.
> =C2=A0 */
> =C2=A0long drm_sched_entity_flush(struct drm_sched_entity *entity, long
> timeout)
> =C2=A0{
> @@ -294,15 +294,24 @@ long drm_sched_entity_flush(struct
> drm_sched_entity *entity, long timeout)
> =C2=A0=09 * The client will not queue more IBs during this fini,
> consume existing
> =C2=A0=09 * queued IBs or discard them on SIGKILL
> =C2=A0=09 */
> -=09if (current->flags & PF_EXITING) {
> -=09=09if (timeout)
> -=09=09=09ret =3D wait_event_timeout(
> -=09=09=09=09=09sched->job_scheduled,
> -
> =09=09=09=09=09drm_sched_entity_is_idle(entity),
> -=09=09=09=09=09timeout);
> +=09if (timeout !=3D 0 && (current->flags & PF_EXITING)) {
> +=09=09ret =3D wait_event_timeout(sched->job_scheduled,
> +=09=09=09=09drm_sched_entity_is_idle(entity),
> +=09=09=09=09timeout);
> +=09=09/*
> +=09=09 * wait_event_timeout() returns 1 if it timed out
> but the
> +=09=09 * condition became true on timeout. We only care
> about whether
> +=09=09 * it timed out or not.
> +=09=09 */
> +=09=09if (ret =3D=3D 1)
> +=09=09=09ret =3D 0;
> =C2=A0=09} else {
> =C2=A0=09=09wait_event_killable(sched->job_scheduled,
> =C2=A0=09=09=09=09=C2=A0=C2=A0=C2=A0
> drm_sched_entity_is_idle(entity));
> +
> +=09=09ret -=3D (long)get_jiffies_64();

Ah, just recognized that this is probably nonsense =E2=80=93 anyways, let's
discuss what we shall do here. I can fix it later.

P.

> +=09=09if (ret < 0)
> +=09=09=09ret =3D 0;
> =C2=A0=09}
> =C2=A0
> =C2=A0=09/* For killed process disable any more IBs enqueue right now
> */

