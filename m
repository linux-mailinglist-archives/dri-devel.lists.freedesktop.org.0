Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A71C9E81F
	for <lists+dri-devel@lfdr.de>; Wed, 03 Dec 2025 10:38:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97CBD10E72B;
	Wed,  3 Dec 2025 09:38:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="F2oVBxDp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F31F210E767
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Dec 2025 09:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1764754696;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R4WB+cAbLCsrxxvJDzmHK/1YvGIBQKCurE6fvvi7iEk=;
 b=F2oVBxDpN14PJVVggQ4pKLeE3GxOYi/vOxqb6HAyO4pCJw/S43Iqk63vxLhJMy9gQm1Y+P
 U5YeQoAtgTykC5AcnYNdcOZR1OOgbWbzrrFSiHwoYteIsRLmNT91afRibt7ZAAKU6h3L7k
 2Lwh3o1OA8M6KnXFvHXCd1LCgkXzHPk=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-226-INYGJmK5PbKo7yIdz9MW3A-1; Wed, 03 Dec 2025 04:38:14 -0500
X-MC-Unique: INYGJmK5PbKo7yIdz9MW3A-1
X-Mimecast-MFC-AGG-ID: INYGJmK5PbKo7yIdz9MW3A_1764754694
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-343bf6ded5cso10481236a91.0
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Dec 2025 01:38:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764754694; x=1765359494;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=a+w77Ildsos73JSHLYo9V/bsCaJRDr9Kx8VA915aHZs=;
 b=qUCx4auF3lvCsFSVoFjIl/eteh+EtnXnnYJtCK15gwGbp/5c7uMRXji+ge/Jk8+zR4
 Hk2C9i+rBgkqozVXUW+a4oU3+ZW0VNSwM+JaZSQhZ/LUUwlf1osYRvGPFuEb5siCLgQK
 u+4p2K7I9bl1w8XyJFmMC0B20pYcx71yLbj1cu2bwTmhGN6rOvuh7LSuGUSHpTMF0Pm7
 5TiR5SuTrBDq17REhgfy3hyeS4vu5rTxj1jtdYZ33ffw3PoJRwpIfHomUBqqQHLlndKS
 1528zgeefIFfFiFvzeQt4QsYoXkpwfk6kF616pAZXPDn6VxL1fq17ZtBqHSTDoCEuqpz
 U34w==
X-Gm-Message-State: AOJu0YyEeLm/7txya5BOqP+MhPQWvyagVTMfknCLWz/51ZWPFUkAgVCD
 ZSraX4gWsVDJApUHXv0yitDZrt7wgWobohIm7LmaWvzmghMI2HZF4GAORFAJ1nJXjoUj/jvcWKy
 7+tpuL7m0gOlQbivWcxA4C6dVcrflcYsL4R8IfjlT8DckxF17Xv72+dreLkitVjTPdHmeoA==
X-Gm-Gg: ASbGncujtutOd6ngPsVvedBcN7NAQzKK2ywYBgnE5pvyG1DMJpZ2vzHLZG3GhaEWfQ1
 SpFWrthPWXrwcpNtJpB7bDHDXWK8cLWTQhD+LBbxgIMPuCwjXhdL5/BdUdowUKIoCPdyqEU3XCT
 7w12Rpi91ZbgAwep7v9O15A8cJHqIMbfrVTEC+hnq+xUanOOm0IcPjge4Gh4+RkOgQsh1hqYCq+
 /UYveiUytdENGGJNZrH73+5GMyJKaP+2KqI8/M+3P1TaII8hf8GiWRHtJrN/R0hSF9zyeCXuMhQ
 K+rLJjB+AeDhkfGaizv0+hBfFZSRMPD5DT3vhz04WNn6n5RStph1KvV9wVPYTWrIOUhW6bEqy8W
 DCbY0OjzfGUgARtoPquD4v38yZg6Q4+gh0lKn
X-Received: by 2002:a17:90b:4a8b:b0:341:194:5e7a with SMTP id
 98e67ed59e1d1-349127fdfd5mr2148216a91.29.1764754693704; 
 Wed, 03 Dec 2025 01:38:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHHK2wts2kzWvZhl+wPxT708qRW8MfdhjlnGZTOFggSt5IwPppZAmySo7CXREn6+h8XD58J+w==
X-Received: by 2002:a17:90b:4a8b:b0:341:194:5e7a with SMTP id
 98e67ed59e1d1-349127fdfd5mr2148186a91.29.1764754693306; 
 Wed, 03 Dec 2025 01:38:13 -0800 (PST)
Received: from [10.200.68.138] (nat-pool-muc-u.redhat.com. [149.14.88.27])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-be5095a0e65sm17123269a12.27.2025.12.03.01.38.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Dec 2025 01:38:12 -0800 (PST)
Message-ID: <ef4e65dbf13d4de1805ebc791773b597535d525d.camel@redhat.com>
Subject: Re: [PATCH v7 3/9] drm/xe: Add dedicated message lock
From: Philipp Stanner <pstanner@redhat.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Date: Wed, 03 Dec 2025 10:38:05 +0100
In-Reply-To: <20251201183954.852637-4-matthew.brost@intel.com>
References: <20251201183954.852637-1-matthew.brost@intel.com>
 <20251201183954.852637-4-matthew.brost@intel.com>
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: XtHehEsS5teTY7nLfm9Ulv2QKDim1U282ajClmzQFcs_1764754694
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

On Mon, 2025-12-01 at 10:39 -0800, Matthew Brost wrote:
> Stop abusing DRM scheduler job list lock for messages, add dedicated
> message lock.
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.c=
om>

Nice! Me gusta.


Acked-by: Philipp Stanner <phasta@kernel.org>

> ---
> =C2=A0drivers/gpu/drm/xe/xe_gpu_scheduler.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 5 +++--
> =C2=A0drivers/gpu/drm/xe/xe_gpu_scheduler.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 4 ++--
> =C2=A0drivers/gpu/drm/xe/xe_gpu_scheduler_types.h | 2 ++
> =C2=A03 files changed, 7 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.c b/drivers/gpu/drm/xe/x=
e_gpu_scheduler.c
> index f91e06d03511..f4f23317191f 100644
> --- a/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> @@ -77,6 +77,7 @@ int xe_sched_init(struct xe_gpu_scheduler *sched,
> =C2=A0=09};
> =C2=A0
> =C2=A0=09sched->ops =3D xe_ops;
> +=09spin_lock_init(&sched->msg_lock);
> =C2=A0=09INIT_LIST_HEAD(&sched->msgs);
> =C2=A0=09INIT_WORK(&sched->work_process_msg, xe_sched_process_msg_work);
> =C2=A0
> @@ -117,7 +118,7 @@ void xe_sched_add_msg(struct xe_gpu_scheduler *sched,
> =C2=A0void xe_sched_add_msg_locked(struct xe_gpu_scheduler *sched,
> =C2=A0=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_sched_msg *msg)
> =C2=A0{
> -=09lockdep_assert_held(&sched->base.job_list_lock);
> +=09lockdep_assert_held(&sched->msg_lock);
> =C2=A0
> =C2=A0=09list_add_tail(&msg->link, &sched->msgs);
> =C2=A0=09xe_sched_process_msg_queue(sched);
> @@ -131,7 +132,7 @@ void xe_sched_add_msg_locked(struct xe_gpu_scheduler =
*sched,
> =C2=A0void xe_sched_add_msg_head(struct xe_gpu_scheduler *sched,
> =C2=A0=09=09=09=C2=A0=C2=A0 struct xe_sched_msg *msg)
> =C2=A0{
> -=09lockdep_assert_held(&sched->base.job_list_lock);
> +=09lockdep_assert_held(&sched->msg_lock);
> =C2=A0
> =C2=A0=09list_add(&msg->link, &sched->msgs);
> =C2=A0=09xe_sched_process_msg_queue(sched);
> diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.h b/drivers/gpu/drm/xe/x=
e_gpu_scheduler.h
> index c7a77a3a9681..dceb2cd0ee5b 100644
> --- a/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> @@ -33,12 +33,12 @@ void xe_sched_add_msg_head(struct xe_gpu_scheduler *s=
ched,
> =C2=A0
> =C2=A0static inline void xe_sched_msg_lock(struct xe_gpu_scheduler *sched=
)
> =C2=A0{
> -=09spin_lock(&sched->base.job_list_lock);
> +=09spin_lock(&sched->msg_lock);
> =C2=A0}
> =C2=A0
> =C2=A0static inline void xe_sched_msg_unlock(struct xe_gpu_scheduler *sch=
ed)
> =C2=A0{
> -=09spin_unlock(&sched->base.job_list_lock);
> +=09spin_unlock(&sched->msg_lock);
> =C2=A0}
> =C2=A0
> =C2=A0static inline void xe_sched_stop(struct xe_gpu_scheduler *sched)
> diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h b/drivers/gpu/dr=
m/xe/xe_gpu_scheduler_types.h
> index 6731b13da8bb..63d9bf92583c 100644
> --- a/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h
> +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h
> @@ -47,6 +47,8 @@ struct xe_gpu_scheduler {
> =C2=A0=09const struct xe_sched_backend_ops=09*ops;
> =C2=A0=09/** @msgs: list of messages to be processed in @work_process_msg=
 */
> =C2=A0=09struct list_head=09=09=09msgs;
> +=09/** @msg_lock: Message lock */
> +=09spinlock_t=09=09=09=09msg_lock;
> =C2=A0=09/** @work_process_msg: processes messages */
> =C2=A0=09struct work_struct=09=09work_process_msg;
> =C2=A0};

