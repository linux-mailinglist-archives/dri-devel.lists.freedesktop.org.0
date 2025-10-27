Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A576FC0D0A1
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 12:03:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64FF310E069;
	Mon, 27 Oct 2025 11:03:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="caU9c91n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E20910E069
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 11:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1761563018;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hjJGd+xRluh8TvgBIIOUFgfphdYzFcE/H2vX7k9zbLs=;
 b=caU9c91nDfq003XhfMZfD5tu42mhYX7FchCmSRtmdU14nXwxQFv/SmUJCbcEkAeCEvGH0z
 mJopKVsMTfDAU6tS1+Xmjf6glYaIqlhdOgIJWz9YcVLRBjq6REWeOF0o2Urhm0f5+7ruam
 HQwA7KN1LmY0mZ2GPwn7HZoZku5iedk=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-400-EPk1MnaQOoW7AMvOl_dS0Q-1; Mon, 27 Oct 2025 07:03:37 -0400
X-MC-Unique: EPk1MnaQOoW7AMvOl_dS0Q-1
X-Mimecast-MFC-AGG-ID: EPk1MnaQOoW7AMvOl_dS0Q_1761563016
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-b5c4d76589aso369365866b.0
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 04:03:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761563015; x=1762167815;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3VOA8iwb+iUQs8ydqbBHXT4w/Fw9C+W1CtV9KYqI4ew=;
 b=vrbi3XuPOKXb4JFSp8va9HQuC7boxAeRBYH8Ja9gmfk4Jo2kRydwxGiokel8UT9rKT
 yX4DJAS4uX78nXE/lCIQrWO/2EPtVdb2SH1Vkc6Lo4fMTqv4e1Kpy2ViaTSCU7ibk7A2
 6G+vGBNcsw3kXXEgJqDsZpzrVyDQ8FkBTT8ZjkHlNWfnjqqwDTd1WnN14yU5tLBfLlCs
 NQTPPvnHa0tkhJcK24YUznIR4V+ojqM/MXw+Bvpr2dGpHyDUj77KWubOfG753couzZna
 wN5ahz1kdiuFVE7/2opsr5KHO01SJOZ3qkB2fL2Cb9wcUaTLgcE2zGlBt2r7UaR7Gi4Q
 MQJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8koQi9YerioLs9nMZcJIKticRPBmAPLILa6fubeDRjjYV1kQzKwW8AzNAGcQ58RQ2q7tzCOogiwY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwiUZ7kohxpWoTCPRb78fkl/WyJOU9MSIxAcLAyyUlfZcrUQ1zd
 I/lQVR4qpR7Hqrpa67m93Mo+jLk7kL5VomhnCBG/I5xFzrSKbiNv1m7U/2YDJh30XzTwuRZTUZb
 sST++7hA036TzeBSdTiWcqNqLoVOwzL2+MeuGN7X2HIfd7WMx2WZbLo8yrjuGO2sdlxRlDVHI/z
 hg9A==
X-Gm-Gg: ASbGncswgEUI38gAuOgKqMkMHJwPLurZD025TGgwWS2YYhyv3Juvy5r3JA5RA45o0s0
 aoKRCRCl29niUhGWnxvR32M9hVPEOdJWHW37rSuoAtR8XTRcGSiA4K/gZnVBUeg5QQo71M90zf7
 uixWYuY0G7ImbfR0gMzsl7rpaytyPRU3mcCvEG2x02IYTKgyw17328/iJCdjHPot90qzortFnEo
 qQb3cZblKsiZdtvx+YNj2T7QfDnW9+ed3FuTEdrf9EEFcEzeqsQvD/xcgnYbsrJeN2I9Eh/IFnm
 XFPrjvtm6pftZP7sRP5xYT2RYxxqJ9oixrlIa4Z1ZlR6HnZ528Qf3P+AUWaVObZuceES4WfsGIm
 NG7ckVNWKde9MY2gF4XCAjmwklcVsJjjjSqocLkDTdSWThA==
X-Received: by 2002:a17:907:9481:b0:b6d:7231:3276 with SMTP id
 a640c23a62f3a-b6d723137b3mr1153496966b.19.1761563015424; 
 Mon, 27 Oct 2025 04:03:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHUFMg6uHtWQ6nsuokdIYUmtrDteINde4b5Wb2IzCEGU0OYXwFstexCQN3pMUgJ+f03YLyzNw==
X-Received: by 2002:a17:907:9481:b0:b6d:7231:3276 with SMTP id
 a640c23a62f3a-b6d723137b3mr1153494666b.19.1761563015048; 
 Mon, 27 Oct 2025 04:03:35 -0700 (PDT)
Received: from ?IPv6:2001:16b8:3d68:200:6e75:6a50:1d0f:8f29?
 ([2001:16b8:3d68:200:6e75:6a50:1d0f:8f29])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b6d8533e7c6sm715209066b.16.2025.10.27.04.03.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 04:03:34 -0700 (PDT)
Message-ID: <2336a1282aa6a44f23a9100d2553b8032f44f3bd.camel@redhat.com>
Subject: Re: [RFC PATCH 2/3] drm/sched: Taint workqueues with reclaim
From: Philipp Stanner <pstanner@redhat.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: jiangshanlai@gmail.com, tj@kernel.org, simona.vetter@ffwll.ch, 
 christian.koenig@amd.com, dakr@kernel.org
Date: Mon, 27 Oct 2025 12:03:33 +0100
In-Reply-To: <20251021213952.746900-3-matthew.brost@intel.com>
References: <20251021213952.746900-1-matthew.brost@intel.com>
 <20251021213952.746900-3-matthew.brost@intel.com>
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: lCa352JJsyU714zy8NvUAwvKryYyaefc0-LmwyKperI_1761563016
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

On Tue, 2025-10-21 at 14:39 -0700, Matthew Brost wrote:
> Multiple drivers seemingly do not understand the role of DMA fences in
> the reclaim path. As a result,=C2=A0
>=20

result of what? The "role of DMA fences"?

> DRM scheduler workqueues, which are part
> of the fence signaling path, must not allocate memory.
>=20

Should be phrased differently. The actual rule here is "The GPU
scheduler's workqueues can be used for memory reclaim. Because of that,
work items on these queues must not allocate memory."

--

In general, I often read in commits or discussions about this or that
"rule", especially "DMA fence rules", but they're often not detailed
very much.


P.

>  This patch
> teaches lockdep to recognize these rules in order to catch driver-side
> bugs.
>=20
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Philipp Stanner <phasta@kernel.org>
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
> =C2=A0drivers/gpu/drm/scheduler/sched_main.c | 3 +++
> =C2=A01 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/sch=
eduler/sched_main.c
> index c39f0245e3a9..676484dd3ea3 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -1368,6 +1368,9 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,=
 const struct drm_sched_init_
> =C2=A0=09atomic64_set(&sched->job_id_count, 0);
> =C2=A0=09sched->pause_submit =3D false;
> =C2=A0
> +=09taint_reclaim_workqueue(sched->submit_wq, GFP_KERNEL);
> +=09taint_reclaim_workqueue(sched->timeout_wq, GFP_KERNEL);
> +
> =C2=A0=09sched->ready =3D true;
> =C2=A0=09return 0;
> =C2=A0Out_unroll:

