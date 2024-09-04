Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DEA996BF19
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 15:53:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1815110E7C8;
	Wed,  4 Sep 2024 13:53:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="NKqYAN5K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46CCB10E795
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2024 13:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725458021;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2vCy1/3Gnh8Tpe9ssGyzKQ5aD3sApm41SZlHFL/yd+w=;
 b=NKqYAN5KevlRZ910ky4LWFPvaFn4LBg6V5H4AEIbX2cKNj5tVdtl4wffXorxm5xquWSriT
 85sk11OW9Ob23QMinL/1mB5lLK2fL8hzkcAPPBB+TVSVtKBl3NGHZfg7tqoCESYHvylQaL
 AqzbnmaaXygY3zyLyjZbDoDjjQb0xbk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-631-MyWWveI1MYyYEZAm1Ax6RQ-1; Wed, 04 Sep 2024 09:53:39 -0400
X-MC-Unique: MyWWveI1MYyYEZAm1Ax6RQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-42bbe70c1c2so46569245e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Sep 2024 06:53:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725458018; x=1726062818;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=O6s7mSLff5Fx2lCcACgllmx5s4/lYVbOw6buFq6F9Ko=;
 b=W4dTbwvK0LDkP99oXtWrI5M9DXBuzGQhZb6GgCOLUDNWzeG62zAAfJojERYEdoY9Nu
 8S9FmKW3CLd2832yw8VI3WQeVPc+YIlkItK2q2NjyoYEs6h7HGoSSI7KnGiQoYgdNsXk
 uwAs/g91WD+2kYsavwqGhPMQu8re7WxROcUhJC5GMhqkz+VlIOeXTpszKglEL4u9Salq
 +m9K/IfUbhgdjV6DC6M012nJyB8tNrjmhlzCJbncqVORr5TT7z/toLaKMZd4sG32CbyE
 6qLf8UrhouVXFJyxAcYWPxXUMlZcwFH8Bj4IO7lBJLl8n6drLIzLh9YUzvOMN/ZTd61W
 uGOA==
X-Gm-Message-State: AOJu0Yzi1btpalrkeotOayfjQDkllX1t2na4Qx53ZFkiXkbSdx7B4EX8
 Utddt00udW3sEdakIbs6nr3YnP49ReofEPku67DIbM1Yh19CPVUWetu6tm8OoCD+hdCU0JHuPi9
 5goi5kdb39bKKmpgGp1RG2UfKo/r7e1r0U8J1fej01KNkk3y4SRQPIn7Y0xwKGl633g==
X-Received: by 2002:a05:600c:4f8d:b0:428:141b:ddfc with SMTP id
 5b1f17b1804b1-42bb27ba52fmr157264495e9.31.1725458018353; 
 Wed, 04 Sep 2024 06:53:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9ijUN8wT10YCyzoKWOwwK6w8xcew+tlWHT205xIpdmoUUr1JAfUAQERxJcuN3H2kNSxo6bQ==
X-Received: by 2002:a05:600c:4f8d:b0:428:141b:ddfc with SMTP id
 5b1f17b1804b1-42bb27ba52fmr157264245e9.31.1725458017798; 
 Wed, 04 Sep 2024 06:53:37 -0700 (PDT)
Received: from dhcp-64-16.muc.redhat.com (nat-pool-muc-t.redhat.com.
 [149.14.88.26]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bb6df100csm204091135e9.20.2024.09.04.06.53.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2024 06:53:37 -0700 (PDT)
Message-ID: <74a7e80ea893c2b7fefbd0ae3b53881ddf789c3f.camel@redhat.com>
Subject: Re: [PATCH v2 1/2] drm/sched: memset() 'job' in drm_sched_job_init()
From: Philipp Stanner <pstanner@redhat.com>
To: Luben Tuikov <ltuikov89@gmail.com>, Matthew Brost
 <matthew.brost@intel.com>,  Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Danilo Krummrich <dakr@redhat.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Wed, 04 Sep 2024 15:53:36 +0200
In-Reply-To: <20240828094133.17402-2-pstanner@redhat.com>
References: <20240828094133.17402-2-pstanner@redhat.com>
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

Luben? Christian?

On Wed, 2024-08-28 at 11:41 +0200, Philipp Stanner wrote:
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
> No changes in v2.
> ---
> =C2=A0drivers/gpu/drm/scheduler/sched_main.c | 8 ++++++++
> =C2=A01 file changed, 8 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> b/drivers/gpu/drm/scheduler/sched_main.c
> index 356c30fa24a8..b0c8ad10b419 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -806,6 +806,14 @@ int drm_sched_job_init(struct drm_sched_job
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

