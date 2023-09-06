Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B925C79369E
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 09:57:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E248B10E58E;
	Wed,  6 Sep 2023 07:57:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DA9E10E405;
 Wed,  6 Sep 2023 07:57:34 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id A0E246600BB0;
 Wed,  6 Sep 2023 08:57:32 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1693987053;
 bh=/d9RcHcAhFerLHxSlk7UfUC6HLZV/5OjrHGohctDWxE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=HoSsO4qY8l/NwKrCxNZ+I/lu1TXPNw2Njwt2pc82vU2fpSt2U07MfBWqsR5VyPIMz
 XslL5l8yauC+7/mlKCKwFBN4ReUJ9VLrQdrHnVvvxrnVy/fzcJvCzjONoQmsBQHIwa
 KI9OA37SZVV+E8qzOX7ygG0MrGrq7sRyxQMOtiW0sjSLDwBiC4AQT3k8MoqLArjRn0
 XWLwV/1dKFRgR0lWFvvlmoeDQkVQfONUN8r8h4FoTucAM6SdxVbHP6WXm8dPJBiRmN
 8/DUVYrG2hKeJ91UqGNexnEIxFcQAY5r8lk3/Z84mUZgw51PFM9rAhJxeZn8+50Xrz
 pypUJp74ghYhQ==
Date: Wed, 6 Sep 2023 09:57:30 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Subject: Re: [PATCH v3 2/8] drm/panfrost: Enable cycle counter register upon
 job submission
Message-ID: <20230906095730.27cb394f@collabora.com>
In-Reply-To: <20230905184533.959171-3-adrian.larumbe@collabora.com>
References: <20230905184533.959171-1-adrian.larumbe@collabora.com>
 <20230905184533.959171-3-adrian.larumbe@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: tzimmermann@suse.de, sean@poorly.run, quic_abhinavk@quicinc.com,
 mripard@kernel.org, steven.price@arm.com, freedreno@lists.freedesktop.org,
 healych@amazon.com, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, dmitry.baryshkov@linaro.org,
 marijn.suijten@somainline.org, kernel@collabora.com,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue,  5 Sep 2023 19:45:18 +0100
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/pa=
nfrost/panfrost_job.c
> index 033f5e684707..8b1bf6ac48f8 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -297,6 +297,11 @@ int panfrost_job_push(struct panfrost_job *job)
> =20
>  	kref_get(&job->refcount); /* put by scheduler job completion */
> =20
> +	if (atomic_read(&pfdev->profile_mode)) {
> +		panfrost_cycle_counter_get(pfdev);

This one should go in panfrost_job_hw_submit() IMO, otherwise you're
enabling the cycle-counter before the job has its dependencies met, and
depending on what the job depends on, it might take some time.

> +		job->is_profiled =3D true;
> +	}
> +
>  	drm_sched_entity_push_job(&job->base);
> =20
>  	mutex_unlock(&pfdev->sched_lock);
> @@ -351,6 +356,9 @@ static void panfrost_job_free(struct drm_sched_job *s=
ched_job)
> =20
>  	drm_sched_job_cleanup(sched_job);
> =20
> +	if (job->is_profiled)
> +		panfrost_cycle_counter_put(job->pfdev);

I think I'd move this panfrost_cycle_counter_put() to
panfrost_job_handle_{err,done}(), to release the counter as soon as
we're done executing the job. We also need to make sure we release
cycle counter refs in the reset path (here [1]), to keep get/put
balanced when jobs are resubmitted.

> +
>  	panfrost_job_put(job);
>  }

[1]https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/panfrost/=
panfrost_job.c#L666
