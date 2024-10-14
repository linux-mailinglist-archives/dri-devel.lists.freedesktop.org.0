Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A259A99C920
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2024 13:38:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F4CB10E43E;
	Mon, 14 Oct 2024 11:38:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Wz19Wu8U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0308A10E43E
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 11:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1728905881;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IhD6G6kmrvI8QyDxA5P+7TuT7pa9CuRPCdH6vZs1liA=;
 b=Wz19Wu8UGn2QngTZnk//9P5iFCA0N3SnNqEqgjVjHpybP/VvzD8I/hYYN9pCgvR9saysfC
 K5+QH2marcq5wlZjmii0u+pM7i9UJxAiIKpkYBW/AEWX5U3gSIX+gPOO01jmxo6UU7SBzn
 0/5/aoBlsugExjve4yEQZqW7xFz4PKs=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-163-LZz2UdyEPhylP1hBv0va6Q-1; Mon, 14 Oct 2024 07:37:59 -0400
X-MC-Unique: LZz2UdyEPhylP1hBv0va6Q-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-a9a04210851so80417766b.2
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 04:37:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728905878; x=1729510678;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zyGsYySSd0DnSlvi7zjOoyKBQa6z2f9aP+81Ong915U=;
 b=A+3UrbI7mtqpH9mKWrFs3cR6n/yL6lYHGECoZKHPr5UsqqdoFcLVTiA7thQzEH4YqM
 aqVneaH4257OwAhswv9WECB3C1y7h+tjBSrsCprrCF9InYoXcZy7eNZji3Pzo2OMYOf/
 Htpop8PkWKUBxRDcVjJD7M4aUD3P2SYpqj9VMjE2S4jmfxQ0B9ZM7L+J+rm9YbfHHbUh
 Akriy/VpwqRDrULOJN1vuOm/KJFP/4GAgq5/cXxiL3XTaod7Pt3OhFbsOBeuzHP3Bsdv
 s2RPbKo++dVydCVKGpToXJ+b3q9DqYwRcNvbvweHluMpquJIqz/MZT4FKe43247LOf12
 9HdA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0N2Pl8DMIkYroOfnXHhucOCIQXqpfa8OuHqHs2udr0xauQ3vwUHN+je90m3d9MWw+9yH7E87+G+8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx+Zy43JQ6SI32kMedRDygMTzhNMdRcDJg15r2iwI519v4cVrzr
 H+60tIqm1ChIxiSI/svsrGlG9Nj5RDvN+4zIPQlpTf9558fuvC6nggwqwT84Y6fOgRY2EmAQZdn
 URmOqjzTPSWHo1akZT3idh7sf1H21xUvikkpZ3yixyXepeHMzEPPWzrxQyLpT7PpdbA==
X-Received: by 2002:a17:907:6ea6:b0:a9a:1e4d:856d with SMTP id
 a640c23a62f3a-a9a1e4d96d7mr32783166b.22.1728905878534; 
 Mon, 14 Oct 2024 04:37:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE6q6Wb3LD++CKbq5ijy/YsNcblGRNhqLvkjnxHps67Jr2C9xdZYvr7J37TwCLTihS6Xp7ZLA==
X-Received: by 2002:a17:907:6ea6:b0:a9a:1e4d:856d with SMTP id
 a640c23a62f3a-a9a1e4d96d7mr32781166b.22.1728905878172; 
 Mon, 14 Oct 2024 04:37:58 -0700 (PDT)
Received: from ?IPv6:2001:16b8:2d37:9800:1d57:78cf:c1ae:b0b3?
 (200116b82d3798001d5778cfc1aeb0b3.dip.versatel-1u1.de.
 [2001:16b8:2d37:9800:1d57:78cf:c1ae:b0b3])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a09af1915sm180690266b.0.2024.10.14.04.37.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2024 04:37:57 -0700 (PDT)
Message-ID: <63fef60508673243104b127e77940ab38c68a9e4.camel@redhat.com>
Subject: Re: [PATCH 2/5] drm/sched: Stop setting current entity in FIFO mode
From: Philipp Stanner <pstanner@redhat.com>
To: Tvrtko Ursulin <tursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, 
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Luben Tuikov <ltuikov89@gmail.com>, Matthew
 Brost <matthew.brost@intel.com>
Date: Mon, 14 Oct 2024 13:37:55 +0200
In-Reply-To: <20241014104637.83209-3-tursulin@igalia.com>
References: <20241014104637.83209-1-tursulin@igalia.com>
 <20241014104637.83209-3-tursulin@igalia.com>
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

On Mon, 2024-10-14 at 11:46 +0100, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>=20
> It does not seem there is a need to set the current entity in FIFO
> mode
> since ot only serves as being a "cursor" in round-robin mode. Even if

s/ot/it


> scheduling mode is changed at runtime the change in behaviour is
> simply
> to restart from the first entity, instead of continuing in RR mode
> from
> where FIFO left it, and that sounds completely fine.

Imperative sentence: "Remove setting the cursor from
drm_sched_rq_select_entity_fifo()"

Thx
P.

>=20
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Luben Tuikov <ltuikov89@gmail.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Philipp Stanner <pstanner@redhat.com>
> Acked-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> Reviewed-by: Philipp Stanner <pstanner@redhat.com>
> ---
> =C2=A0drivers/gpu/drm/scheduler/sched_main.c | 1 -
> =C2=A01 file changed, 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> b/drivers/gpu/drm/scheduler/sched_main.c
> index bbd1630407e4..07ee386b8e4b 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -355,7 +355,6 @@ drm_sched_rq_select_entity_fifo(struct
> drm_gpu_scheduler *sched,
> =C2=A0=09=09=09=09return ERR_PTR(-ENOSPC);
> =C2=A0=09=09=09}
> =C2=A0
> -=09=09=09rq->current_entity =3D entity;
> =C2=A0=09=09=09reinit_completion(&entity->entity_idle);
> =C2=A0=09=09=09break;
> =C2=A0=09=09}

