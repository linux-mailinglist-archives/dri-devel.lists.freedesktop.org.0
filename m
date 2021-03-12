Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A72338F5D
	for <lists+dri-devel@lfdr.de>; Fri, 12 Mar 2021 15:04:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0046A6E03A;
	Fri, 12 Mar 2021 14:04:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 211326E03A
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Mar 2021 14:04:42 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id j7so1840504wrd.1
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Mar 2021 06:04:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=+IbMEQFUX50ZTZ8kTsdTV91mvpJrvHpV6E10Nrki/uw=;
 b=ZIlRqTQiRdOL79F79/FuPgVINs6YO3WtKvLXXtT7Olmj30Waf8bpVViSy/rTXJ0kwC
 RMfrbraXg7LwZhD6lUwitzDpUui8VKgxmp8Jt3YFyflbSGka61YAgsBCWuCvILQ0Y5pu
 7t5RhuYciCZVcJyRScq66nhzVsvwu7ukIGAOc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=+IbMEQFUX50ZTZ8kTsdTV91mvpJrvHpV6E10Nrki/uw=;
 b=LDfDh9S9ODIpvNMqERDYw1nIS+MW0Okzot7FZ/73W1XsKVCLepGwm8i98B6CV7PLh+
 BWn6z/F3b56wYCEgjFWfw+Qv3kx6n2LNFTWUWU+HgE5d6D7f03zH6e1ltDhKd+VVrhhN
 UgNHfbJLcqFsBlsL27Lx/B6coooRk+0VIFANAJuHKWjCEcNmjO4f5PanT1YjRzc5QkjP
 nOdUp4vu1IyN31dPwCQJqeSa1vm/GXQDf8dYQbqG9DdfatgzMKi6F0CLu2cn/1L/AV4V
 JhOyJyjnzqlb9MTfpRLAXwHUk0RLUIGBWrO116UOBJD9+zH0EZ5hhHw6laZsnnv8GnWG
 oEMA==
X-Gm-Message-State: AOAM530TulVEpN+E2wAzMsgb22IfOHFcBzsF7xZggYOLHtoAuYOhQeqh
 rizWvT37xFVovzQ15NnogFKQgg==
X-Google-Smtp-Source: ABdhPJx/RxDibUE4Vx9mo4FRR2dFCGfa2n7qAJRzfspKHaU0q/zMJkHW2APho7jzXNsRaaQixjKZ4w==
X-Received: by 2002:adf:c641:: with SMTP id u1mr14266559wrg.332.1615557875409; 
 Fri, 12 Mar 2021 06:04:35 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id j11sm7860143wro.55.2021.03.12.06.04.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 06:04:34 -0800 (PST)
Date: Fri, 12 Mar 2021 15:04:33 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH] drm/amdgpu: nuke the ih reentrant lock
Message-ID: <YEt08RhEI23VPS4g@phenom.ffwll.local>
References: <20210312135906.3262-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210312135906.3262-1-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 12, 2021 at 02:59:06PM +0100, Christian K=F6nig wrote:
> Interrupts on are non-reentrant on linux. This is just an ancient
> leftover from radeon where irq processing was kicked of from different
> places.
> =

> Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>

Man you tricked me into grepping this on radeon and it looks horrible.
atomic_t is unordered in linux, so whatever was built there for radeon
does not wokr like a lock. It's missing all the barriers afiui. Good
riddance at least for amdgpu.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 1 -
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ih.c     | 5 -----
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ih.h     | 1 -
>  3 files changed, 7 deletions(-)
> =

> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_device.c
> index a15f1b604733..886625fb464b 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -3284,7 +3284,6 @@ int amdgpu_device_init(struct amdgpu_device *adev,
>  =

>  	/* mutex initialization are all done here so we
>  	 * can recall function without having locking issues */
> -	atomic_set(&adev->irq.ih.lock, 0);
>  	mutex_init(&adev->firmware.mutex);
>  	mutex_init(&adev->pm.mutex);
>  	mutex_init(&adev->gfx.gpu_clock_mutex);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ih.c b/drivers/gpu/drm/amd=
/amdgpu/amdgpu_ih.c
> index 1024065f1f03..faaa6aa2faaf 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ih.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ih.c
> @@ -228,10 +228,6 @@ int amdgpu_ih_process(struct amdgpu_device *adev, st=
ruct amdgpu_ih_ring *ih)
>  	wptr =3D amdgpu_ih_get_wptr(adev, ih);
>  =

>  restart_ih:
> -	/* is somebody else already processing irqs? */
> -	if (atomic_xchg(&ih->lock, 1))
> -		return IRQ_NONE;
> -
>  	DRM_DEBUG("%s: rptr %d, wptr %d\n", __func__, ih->rptr, wptr);
>  =

>  	/* Order reading of wptr vs. reading of IH ring data */
> @@ -244,7 +240,6 @@ int amdgpu_ih_process(struct amdgpu_device *adev, str=
uct amdgpu_ih_ring *ih)
>  =

>  	amdgpu_ih_set_rptr(adev, ih);
>  	wake_up_all(&ih->wait_process);
> -	atomic_set(&ih->lock, 0);
>  =

>  	/* make sure wptr hasn't changed while processing */
>  	wptr =3D amdgpu_ih_get_wptr(adev, ih);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ih.h b/drivers/gpu/drm/amd=
/amdgpu/amdgpu_ih.h
> index 87ec6d20dbe0..0649b59830a5 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ih.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ih.h
> @@ -64,7 +64,6 @@ struct amdgpu_ih_ring {
>  =

>  	bool                    enabled;
>  	unsigned		rptr;
> -	atomic_t		lock;
>  	struct amdgpu_ih_regs	ih_regs;
>  =

>  	/* For waiting on IH processing at checkpoint. */
> -- =

> 2.25.1
> =

> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
