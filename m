Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B718B6D7DE5
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 15:40:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD7FA10E965;
	Wed,  5 Apr 2023 13:40:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CAE510E965
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Apr 2023 13:40:23 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-4fd1f2a0f82so54343a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Apr 2023 06:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1680702022; x=1683294022;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b9JAWiy7ir3X1MkEG4eNi/e4F+J8Za1YQw6cD7xkcWQ=;
 b=I5E2dILRk/qwr/JqR3XN+WpGsAtsDJaxeFQY1kUaSs0iN97G9an9tQIRfByNhSo3Fv
 Ff7L1Qa6nX+1WNgzPrDJCXNhBjfKdK+ltAGeuDGEIOao3yXMv9PbqZW75aBC3kcWfhHT
 GgTwkxsMaG6WpXcP3/tIq5SA+L5RLr7H0a6uQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680702022; x=1683294022;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=b9JAWiy7ir3X1MkEG4eNi/e4F+J8Za1YQw6cD7xkcWQ=;
 b=6wEcdOJktTuzBLjhVQ7PqF/9aS05fpfZcw+K8ISkhPICGh7FGxDdMHS8ceB5FhWmNc
 u0oLzHv3Y3bc3P8yqsQAXDWZXgVJuwZqdRA/8reoCAjwt3jXb9SgIh+V8NDBDpUEpJG7
 83lkklZIOyeoRctkTha/jvpqV9fjDSmSfmkfwkw3OOkf97kQgSg/7MizUvLUtPZoRSi2
 sqphXuy+YGr2XFZMB0fu3yRxH9kXWMNYMxbma5kGCBbAOaVZDdPzfFV+5VsMtcjNmYF1
 9xdYLfcmD+E3Svvvw/KrklcZQuHakBew0tdMVEpKkw8gd7dIOYAvnG+HpUSMEWNaUG5C
 MmZQ==
X-Gm-Message-State: AAQBX9f1yy4W1AukgfYKKJb3oXLFrusLqZ7tPZkIPUcgC8GSGCNNrxWC
 zahzv5X8n8Xd+51SQWJmdoy1kg==
X-Google-Smtp-Source: AKy350b3xCy9gL5DOFrdll8pOoEph0xjt04z4AL+Sh79KZNLfnPVo8bTbbVanjj+1/+QMr0G8qmUvA==
X-Received: by 2002:a05:6402:4413:b0:502:1f7b:f0a6 with SMTP id
 y19-20020a056402441300b005021f7bf0a6mr2233711eda.0.1680702021702; 
 Wed, 05 Apr 2023 06:40:21 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 s25-20020a50d499000000b005027dd7c403sm6937947edi.66.2023.04.05.06.40.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 06:40:21 -0700 (PDT)
Date: Wed, 5 Apr 2023 15:40:19 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Asahi Lina <lina@asahilina.net>
Subject: Re: [PATCH RFC 10/18] drm/scheduler: Add can_run_job callback
Message-ID: <ZC16Q8MhHEcutX1b@phenom.ffwll.local>
Mail-Followup-To: Asahi Lina <lina@asahilina.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Luben Tuikov <luben.tuikov@amd.com>,
 Jarkko Sakkinen <jarkko@kernel.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Karol Herbst <kherbst@redhat.com>,
 Ella Stanforth <ella@iglunix.org>,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 Mary <mary@mary.zone>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-sgx@vger.kernel.org, asahi@lists.linux.dev
References: <20230307-rust-drm-v1-0-917ff5bc80a8@asahilina.net>
 <20230307-rust-drm-v1-10-917ff5bc80a8@asahilina.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230307-rust-drm-v1-10-917ff5bc80a8@asahilina.net>
X-Operating-System: Linux phenom 6.1.0-7-amd64
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
Cc: Karol Herbst <kherbst@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 Mary <mary@mary.zone>, Gary Guo <gary@garyguo.net>,
 Ella Stanforth <ella@iglunix.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Luben Tuikov <luben.tuikov@amd.com>,
 Alex Gaynor <alex.gaynor@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
 linux-media@vger.kernel.org, Wedson Almeida Filho <wedsonaf@gmail.com>,
 rust-for-linux@vger.kernel.org, Boqun Feng <boqun.feng@gmail.com>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>, linux-sgx@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 Jarkko Sakkinen <jarkko@kernel.org>, asahi@lists.linux.dev,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 07, 2023 at 11:25:35PM +0900, Asahi Lina wrote:
> Some hardware may require more complex resource utilization accounting
> than the simple job count supported by drm_sched internally. Add a
> can_run_job callback to allow drivers to implement more logic before
> deciding whether to run a GPU job.
> 
> Signed-off-by: Asahi Lina <lina@asahilina.net>

Ok scheduler rules, or trying to summarize the entire discussion:

dma_fence rules are very tricky. The two main chapters in the docs are

https://dri.freedesktop.org/docs/drm/driver-api/dma-buf.html?highlight=dma_buf#dma-fence-cross-driver-contract
https://dri.freedesktop.org/docs/drm/driver-api/dma-buf.html?highlight=dma_buf#indefinite-dma-fences

Unforutunately I don't think it's possible to check this at compile time,
thus far all we can do is validate at runtime. I've posted two patches for
this:

https://lore.kernel.org/dri-devel/20201023122216.2373294-17-daniel.vetter@ffwll.ch/
https://lore.kernel.org/dri-devel/20201023122216.2373294-20-daniel.vetter@ffwll.ch/

Unfortunately most drivers are buggy and get this completely wrong, so
realistically we'd need to make this a per-driver opt-out and annotate all
current drivers. Well except amdgpu is correct by now I think (they'd
still need to test that). And Rob Clark is working on patches to fix up
msm.

I think best here is if you work together with Rob to make sure these
annotations are mandatory for any rust drivers (I don't want new buggy
drivers at least). Would also be great to improve the kerneldoc for all
the driver hooks to explain these restrictions and link to the relevant
kerneldocs (there's also one for the dma_fence signalling annotations
which might be worth linking too).

I don't see any way to make this explicit in rust types, it's really only
something runtime tests (using lockdep) can catch. Somewhat disappointing.

For the other things discussed here:

- Option<Dma_Fence> as the return value for ->prepare_job makes sense to
  me.

- I don't see any way a driver can use ->can_run_job without breaking the
  above rules, that really doesn't sound like a good idea to me.

Cheers, Daniel

> ---
>  drivers/gpu/drm/scheduler/sched_main.c | 10 ++++++++++
>  include/drm/gpu_scheduler.h            |  8 ++++++++
>  2 files changed, 18 insertions(+)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 4e6ad6e122bc..5c0add2c7546 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -1001,6 +1001,16 @@ static int drm_sched_main(void *param)
>  		if (!entity)
>  			continue;
>  
> +		if (sched->ops->can_run_job) {
> +			sched_job = to_drm_sched_job(spsc_queue_peek(&entity->job_queue));
> +			if (!sched_job) {
> +				complete_all(&entity->entity_idle);
> +				continue;
> +			}
> +			if (!sched->ops->can_run_job(sched_job))
> +				continue;
> +		}
> +
>  		sched_job = drm_sched_entity_pop_job(entity);
>  
>  		if (!sched_job) {
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 9db9e5e504ee..bd89ea9507b9 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -396,6 +396,14 @@ struct drm_sched_backend_ops {
>  	struct dma_fence *(*prepare_job)(struct drm_sched_job *sched_job,
>  					 struct drm_sched_entity *s_entity);
>  
> +	/**
> +	 * @can_run_job: Called before job execution to check whether the
> +	 * hardware is free enough to run the job.  This can be used to
> +	 * implement more complex hardware resource policies than the
> +	 * hw_submission limit.
> +	 */
> +	bool (*can_run_job)(struct drm_sched_job *sched_job);
> +
>  	/**
>           * @run_job: Called to execute the job once all of the dependencies
>           * have been resolved.  This may be called multiple times, if
> 
> -- 
> 2.35.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
