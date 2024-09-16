Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A25979CAC
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2024 10:21:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BB2D10E02D;
	Mon, 16 Sep 2024 08:21:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="DPAdTV6a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DA5410E02D
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2024 08:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1726474886;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Rac80bLhr8EmpKq2E+EPwofvI5AsKJpXJUJF9QIPLPs=;
 b=DPAdTV6aXgqWHno4XPpp6B5QKtGltqQCEX10sgAkmySxA8LAZyxuvFeoAD9dr9qWoFXEPC
 9lE0EhqI3bSLGgpfI6gWSVns+uMIxKR39ey28H+Vwkv4TmbI8PqRIgcg9feDCiJZwqZZUL
 FwMb61NcPqTZ7ecjFHdasiA2lFkSm5c=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-145-uBVbexHNN0CyGyneZCr6ew-1; Mon, 16 Sep 2024 04:21:25 -0400
X-MC-Unique: uBVbexHNN0CyGyneZCr6ew-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-a8d10954458so310539066b.3
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2024 01:21:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726474884; x=1727079684;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=C3/FsoUNpdbZvFxXTUHch0otbiSCpqZ5CsjrSqVtRX0=;
 b=vGsoEcWigh8gBJpKoWYuoq6UFNF1I2DiUPkopRTxuDfCu/v8GhWnQwrqf6d1cZJOjz
 F2Ivxi5XPW8RlIDJoddbbXnhN+PlMgjcBmaiVoWvjpfN6x3DCoG6nO5qoQ/BUGRRrd+C
 Hwt9hatOonF6GAkMd7EXK10WC/QAtx7Wj9EUzIrYVIxAiwC1yn6aw7cCXnOzENGD4qqg
 d3eum3mdWY+X820VkFr2CjS1qoIemwEnRTm2GZVDKNd5VTQWy4pNluXWKYyl1boWkqJ9
 0++WPnWW6FXsTQIKl9LlqbZIVWPpQnvY+/mHnfBwsTJvBWHipnNZCmCU318Ko6PEG+R4
 kVsQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSdeW+0nzfSB/mJueRMaNA6QElr8meZlBNz3rqfDAXmIQu0o3E3cEa1SvcpWPTQPIEw4lqL8qp6Es=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzn1QFf9YF0JiXklCCIOtvgVSMhvP9kh55OVcegFWOUiokRwdsd
 H3AZiuQqPZyDOkSsXXOOmDCnHiFuFsccuyRn29EAAA79ePevvNrZ8jcdjiN5j1jR/xX8bYRzZAQ
 pI3RMZ/f0A2Wo77SKeSRJaqATXAObJ+NiHxraX53aNTKtpBHPSP48c635SOWbkLStnQ==
X-Received: by 2002:a17:907:f702:b0:a86:a1cd:5a8c with SMTP id
 a640c23a62f3a-a902947e862mr1415375466b.22.1726474883670; 
 Mon, 16 Sep 2024 01:21:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFwjkLAzoObUW4c3mc0WAeK/bTDd43w0S2eUYRtFPS1IZ8mDF/cS75L0ifmjNwkV04cwgfICA==
X-Received: by 2002:a17:907:f702:b0:a86:a1cd:5a8c with SMTP id
 a640c23a62f3a-a902947e862mr1415371766b.22.1726474883086; 
 Mon, 16 Sep 2024 01:21:23 -0700 (PDT)
Received: from eisenberg.fritz.box ([2001:16b8:3d97:9600:c4de:e8e2:392:1c61])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a90613316c2sm276557766b.211.2024.09.16.01.21.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Sep 2024 01:21:22 -0700 (PDT)
Message-ID: <2cdde083ae0c3a84eee435968155d9b2b8f91f91.camel@redhat.com>
Subject: Re: [PATCH] drm/sched: Fix dynamic job-flow control race
From: Philipp Stanner <pstanner@redhat.com>
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc: Rob Clark <robdclark@chromium.org>, Asahi Lina <lina@asahilina.net>, 
 Luben Tuikov <ltuikov89@gmail.com>, Matthew Brost
 <matthew.brost@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Danilo Krummrich <dakr@redhat.com>, open
 list <linux-kernel@vger.kernel.org>
Date: Mon, 16 Sep 2024 10:21:21 +0200
In-Reply-To: <20240913165326.8856-1-robdclark@gmail.com>
References: <20240913165326.8856-1-robdclark@gmail.com>
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

On Fri, 2024-09-13 at 09:53 -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
>=20
> Fixes a race condition reported here:
> https://github.com/AsahiLinux/linux/issues/309#issuecomment-2238968609

As Danilo suggested before, I'd put this in a Fixes: section at the
bottom and instead have a sentence here detailing what the race
consists of, i.e., who is racing with whom.

P.

>=20
> The whole premise of lockless access to a single-producer-single-
> consumer queue is that there is just a single producer and single
> consumer.=C2=A0 That means we can't call drm_sched_can_queue() (which is
> about queueing more work to the hw, not to the spsc queue) from
> anywhere other than the consumer (wq).
>=20
> This call in the producer is just an optimization to avoid scheduling
> the consuming worker if it cannot yet queue more work to the hw.=C2=A0 It
> is safe to drop this optimization to avoid the race condition.
>=20
> Suggested-by: Asahi Lina <lina@asahilina.net>
> Fixes: a78422e9dff3 ("drm/sched: implement dynamic job-flow control")
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
> =C2=A0drivers/gpu/drm/scheduler/sched_main.c | 3 +--
> =C2=A01 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> b/drivers/gpu/drm/scheduler/sched_main.c
> index ab53ab486fe6..1af1dbe757d5 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -1020,8 +1020,7 @@ EXPORT_SYMBOL(drm_sched_job_cleanup);
> =C2=A0void drm_sched_wakeup(struct drm_gpu_scheduler *sched,
> =C2=A0=09=09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_sched_entity *entit=
y)
> =C2=A0{
> -=09if (drm_sched_can_queue(sched, entity))
> -=09=09drm_sched_run_job_queue(sched);
> +=09drm_sched_run_job_queue(sched);
> =C2=A0}
> =C2=A0
> =C2=A0/**

