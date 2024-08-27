Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A55B96067F
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2024 11:59:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7647510E0F9;
	Tue, 27 Aug 2024 09:59:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="NXQAU4qm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2089A10E0F9
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 09:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1724752783;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VVTzCq+dmt5d2JYWM+Cep4xG6jN1YuMGbtiESpO8k2Y=;
 b=NXQAU4qmEimNUZBUqM3LGtDHR3cQSXnT0qmM6A4xfIK3kK5W6CAw1S0pd2Rpa1in2iBs3i
 IoE2qAQg0/ySY3EDnWM2xKHruCLCnYTHQcinNXYa8L6reGEmMbmp7j+6ujzXFHOfecJC4M
 OwsXffAWUT2DRgqbg93xJ8+yrAxd8u0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-164-tmxHZm27NBS0hCAtMSef_w-1; Tue, 27 Aug 2024 05:59:41 -0400
X-MC-Unique: tmxHZm27NBS0hCAtMSef_w-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-371881b6de3so3199344f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 02:59:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724752781; x=1725357581;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4jRfteUF4K6zdJt61qizH7SSD5maFMM9NgT5b4SG1L4=;
 b=IYH922p7oKnW0YSFW+J+JrcDL8ZEY6a35mta8/8/1SKZiti9p7SfDKqfHJm4f2ZtKo
 kkLNQfoBsxdJuPp0MSsPAQUSKX5K8WCrDzPMDvJ650UsxPSWao+1GKKs4Y6XLFAbuzQL
 Ybroaipv1yFktgzSbF+hfWTld3c2PvkEXDw+YqXcbHYPRCTjzwv/Nu2ulfr9RNIrtgCZ
 RykMGkcpWliVGKWzU+NzdSnf0eLqZsq61kuBnDTNb75erqylrI9UEhkL4kidtFUqylG6
 rfwgq9NE5yyuEtXvO8o/XAuXVD5K0+VI136MW8Cv5aOreeyWdx5o/f3mg6u/kv/cv7mq
 RmGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWoMtZUg1LK45WpX7zPxmDy2QHZY02yluMqqSDwyI5ejSWSEHr45rx3Tvagniv5g7LFN2jVmAeyJok=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwePI0K6BV3ve77AppItMalGG5zs/G0uMiqMBjFXO2oKA99XOGv
 5OPRd0HMjPOf6OCvtBEjnUuRVALRevYcF9ASnk3xVduyk1rgjFOWLdfXNjUeC+gjD5JFJvJfb7Z
 uqtgypxlbYClPrwpNI/kLNOm4gFWNux7yvxP5n6FOgoI6VNX91WQhVozGOSYEC/0V7w==
X-Received: by 2002:adf:ebce:0:b0:368:30a6:16d8 with SMTP id
 ffacd0b85a97d-3748c82c860mr1355686f8f.57.1724752780655; 
 Tue, 27 Aug 2024 02:59:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGKwUoHsFBchjm634UKmy74PHfoiuNaHO4aK4VhEUsCColf/kxqsyFbzDHf8ZVSaLRBv9ehqw==
X-Received: by 2002:adf:ebce:0:b0:368:30a6:16d8 with SMTP id
 ffacd0b85a97d-3748c82c860mr1355665f8f.57.1724752780147; 
 Tue, 27 Aug 2024 02:59:40 -0700 (PDT)
Received: from eisenberg.fritz.box ([2001:16b8:3dbc:3c00:460c:db7e:8195:ddb5])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37308200404sm12698815f8f.81.2024.08.27.02.59.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Aug 2024 02:59:39 -0700 (PDT)
Message-ID: <ae0c78841e0d7c35f93aeb36fc94ab630812087e.camel@redhat.com>
Subject: Re: [PATCH] drm/sched: Fix UB pointer dereference
From: Philipp Stanner <pstanner@redhat.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Danilo
 Krummrich <dakr@kernel.org>
Cc: Luben Tuikov <ltuikov89@gmail.com>, Matthew Brost
 <matthew.brost@intel.com>,  Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Date: Tue, 27 Aug 2024 11:59:38 +0200
In-Reply-To: <9ba7f944-52d1-4937-80c7-a03bc0c5b1d5@amd.com>
References: <20240827074521.12828-2-pstanner@redhat.com>
 <c443e90d-6907-4a02-bab4-c1943f021a8c@kernel.org>
 <9ba7f944-52d1-4937-80c7-a03bc0c5b1d5@amd.com>
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

On Tue, 2024-08-27 at 11:00 +0200, Christian K=C3=B6nig wrote:
> Am 27.08.24 um 10:39 schrieb Danilo Krummrich:
> > On 8/27/24 9:45 AM, Philipp Stanner wrote:
> > > In drm_sched_job_init(), commit 56e449603f0a ("drm/sched: Convert
> > > the
> > > GPU scheduler to variable number of run-queues") implemented a
> > > call to
> > > drm_err(), which uses the job's scheduler pointer as a parameter.
> > > job->sched, however, is not yet valid as it gets set by
> > > drm_sched_job_arm(), which is always called after
> > > drm_sched_job_init().
> > >=20
> > > Since the scheduler code has no control over how the API-User has
> > > allocated or set 'job', the pointer's dereference is undefined
> > > behavior.
> > >=20
> > > Fix the UB by replacing drm_err() with pr_err().
> > >=20
> > > Cc: <stable@vger.kernel.org>=C2=A0=C2=A0=C2=A0 # 6.7+
> > > Fixes: 56e449603f0a ("drm/sched: Convert the GPU scheduler to=20
> > > variable number of run-queues")
> > > Reported-by: Danilo Krummrich <dakr@redhat.com>
> > > Closes:=20
> > > https://lore.kernel.org/lkml/20231108022716.15250-1-dakr@redhat.com/
> > > Signed-off-by: Philipp Stanner <pstanner@redhat.com>
> > > ---
> > > =C2=A0 drivers/gpu/drm/scheduler/sched_main.c | 2 +-
> > > =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/scheduler/sched_main.c=20
> > > b/drivers/gpu/drm/scheduler/sched_main.c
> > > index 7e90c9f95611..356c30fa24a8 100644
> > > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > > @@ -797,7 +797,7 @@ int drm_sched_job_init(struct drm_sched_job
> > > *job,
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * or wor=
se--a blank screen--leave a trail in the
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * logs, =
so this can be debugged easier.
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_err(job->sched, "%s: =
entity has no rq!\n",
> > > __func__);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pr_err("*ERROR* %s: entit=
y has no rq!\n", __func__);
> >=20
> > I don't think the "*ERROR*" string is necessary, it's pr_err()
> > already.
>=20
> Good point. I will remove that and also add a comment why drm_err
> won't=20
> work here before pushing it to drm-misc-fixes.

Well, as we're at it I want to point out that the exact same mechanism
occurs just a few lines below, from where I shamelessly copied it:

if (unlikely(!credits)) {
=09pr_err("*ERROR* %s: credits cannot be 0!\n", __func__);


P.

>=20
> Thanks,
> Christian.
>=20
> >=20
> > Otherwise,
> >=20
> > Acked-by: Danilo Krummrich <dakr@kernel.org>
> >=20
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -ENOENT=
;
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>=20

