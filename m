Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4935190386E
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2024 12:09:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55AD610E585;
	Tue, 11 Jun 2024 10:09:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="e1NRlnBM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F212510E4A6
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2024 10:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718100586;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v9ktNk7k/0aYvyjCtpqZ6+hDDn8yBM6jUxeDl6eCn5c=;
 b=e1NRlnBMH3sVkry0ab9ogNLmEFQQnW5R+Kh2NrwYnAlzLt2YkNjliO1H41E6seN3CSCHW/
 fZqrr+enz0/8CjBrNtfjsITp2ANulaXEq6b4AN5hIG+xie8wfN0SAqvwlqsoDZqLkFHA3+
 NQS0U3JNufFRWJcXZFlc5gsdxY3lUGs=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-231-XbFTwiRjNG-DUSjKqyrvHQ-1; Tue, 11 Jun 2024 06:09:44 -0400
X-MC-Unique: XbFTwiRjNG-DUSjKqyrvHQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-35dc0949675so3850780f8f.3
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2024 03:09:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718100583; x=1718705383;
 h=content-transfer-encoding:in-reply-to:organization:from:cc
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=v9ktNk7k/0aYvyjCtpqZ6+hDDn8yBM6jUxeDl6eCn5c=;
 b=vXtHKboT8Wc7mQJWaWMnJtiOzhf4jej5QltE5wNK6mo0y019w4d3L3PYbyq+YcqAUb
 HVKC/lILX6TlpbfJ94JMt8m+Tdgz8JVpzgIzrb9XB/JhBa1lTgMe9L0FnTeEGX87nKTV
 e7qwWZdDRZpfBk2J9Ptqq5nf7AcCeIoQKno56v2IvFpGoBG4e0sEqO2TSfj5l9p+hD+T
 AdxSTlBeEBH2ImFNsNAzaMa0hXloxX82BxdEjWfuZZzqmd6I2NWx+CIP2sdyEpqIbmym
 P+K27ClH7mZSSXrw0ktBNWCsD4ZyK0qcu/KIUD1DJ8r68XVgmj/9L5dQw2mDKahkGF8U
 KEzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVchkPMt+6wSYaYMSCG8nBb1+50g3dtdMoofq6bKL561/1UNKwnNbl/SBTpHBAfojjyS7yEgJk1XZZuuI4BzUf/nu/eQsz/7EVcFc3zYdmX
X-Gm-Message-State: AOJu0YyHW2RYIQQJRhuSvMCtMZUFDWg/lxa9+0ZkKYGRzfdrhZwfE0cK
 z/la+vp2gGL+h8ekRvvSef4zxvpPuNVVamgFsgJBFLb0akHwBzXLfT1mTWYVO2YC65Kw60Ag56Z
 9UQat8vT7FZcliMnDEHziGi4XBPmL0+RmLMqGppfMuwwIgTN5GHYV7G6VXAXxd8i6Xw==
X-Received: by 2002:a5d:688d:0:b0:35f:247e:fbc3 with SMTP id
 ffacd0b85a97d-35f247efe8fmr4059096f8f.3.1718100583506; 
 Tue, 11 Jun 2024 03:09:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHwdqlVHaTXmPpsCH9dotUi8Rrqghxxaa3Jv+kO9Q6WH/zO2gBDxubgEw4/R1c1/SBZJ5eJUA==
X-Received: by 2002:a5d:688d:0:b0:35f:247e:fbc3 with SMTP id
 ffacd0b85a97d-35f247efe8fmr4059077f8f.3.1718100583155; 
 Tue, 11 Jun 2024 03:09:43 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:ee94:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35f228cbfb8sm5659345f8f.57.2024.06.11.03.09.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Jun 2024 03:09:42 -0700 (PDT)
Message-ID: <48e7872e-64df-49b8-ac2e-0a45db556069@redhat.com>
Date: Tue, 11 Jun 2024 12:09:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/nouveau: don't attempt to schedule hpd_work on
 headless cards
To: Vasily Khoruzhick <anarsoul@gmail.com>
References: <20240607221032.25918-1-anarsoul@gmail.com>
Cc: Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Ben Skeggs <bskeggs@nvidia.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20240607221032.25918-1-anarsoul@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 6/8/24 00:09, Vasily Khoruzhick wrote:
> If the card doesn't have display hardware, hpd_work and hpd_lock are
> left uninitialized which causes BUG when attempting to schedule hpd_work
> on runtime PM resume.
> 
> Fix it by adding headless flag to DRM and skip any hpd if it's set.
> 
> Fixes: ae1aadb1eb8d ("nouveau: don't fail driver load if no display hw present.")
> Link: https://gitlab.freedesktop.org/drm/nouveau/-/issues/337
> Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>

Applied to drm-misc-fixes, thanks!

> ---
> v2: drop extra checks in nouveau_display_hpd_work() and
> nouveau_connector_hpd()
> 
>   drivers/gpu/drm/nouveau/dispnv04/disp.c   | 2 +-
>   drivers/gpu/drm/nouveau/dispnv50/disp.c   | 2 +-
>   drivers/gpu/drm/nouveau/nouveau_display.c | 6 +++++-
>   drivers/gpu/drm/nouveau/nouveau_drv.h     | 1 +
>   4 files changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/dispnv04/disp.c b/drivers/gpu/drm/nouveau/dispnv04/disp.c
> index 13705c5f1497..4b7497a8755c 100644
> --- a/drivers/gpu/drm/nouveau/dispnv04/disp.c
> +++ b/drivers/gpu/drm/nouveau/dispnv04/disp.c
> @@ -68,7 +68,7 @@ nv04_display_fini(struct drm_device *dev, bool runtime, bool suspend)
>   	if (nv_two_heads(dev))
>   		NVWriteCRTC(dev, 1, NV_PCRTC_INTR_EN_0, 0);
>   
> -	if (!runtime)
> +	if (!runtime && !drm->headless)
>   		cancel_work_sync(&drm->hpd_work);
>   
>   	if (!suspend)
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> index 88728a0b2c25..674dc567e179 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> @@ -2680,7 +2680,7 @@ nv50_display_fini(struct drm_device *dev, bool runtime, bool suspend)
>   			nv50_mstm_fini(nouveau_encoder(encoder));
>   	}
>   
> -	if (!runtime)
> +	if (!runtime && !drm->headless)
>   		cancel_work_sync(&drm->hpd_work);
>   }
>   
> diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
> index aed5d5b51b43..d4725a968827 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_display.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_display.c
> @@ -450,6 +450,9 @@ nouveau_display_hpd_resume(struct drm_device *dev)
>   {
>   	struct nouveau_drm *drm = nouveau_drm(dev);
>   
> +	if (drm->headless)
> +		return;
> +
>   	spin_lock_irq(&drm->hpd_lock);
>   	drm->hpd_pending = ~0;
>   	spin_unlock_irq(&drm->hpd_lock);
> @@ -635,7 +638,7 @@ nouveau_display_fini(struct drm_device *dev, bool suspend, bool runtime)
>   	}
>   	drm_connector_list_iter_end(&conn_iter);
>   
> -	if (!runtime)
> +	if (!runtime && !drm->headless)
>   		cancel_work_sync(&drm->hpd_work);
>   
>   	drm_kms_helper_poll_disable(dev);
> @@ -729,6 +732,7 @@ nouveau_display_create(struct drm_device *dev)
>   		/* no display hw */
>   		if (ret == -ENODEV) {
>   			ret = 0;
> +			drm->headless = true;
>   			goto disp_create_err;
>   		}
>   
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
> index e239c6bf4afa..25fca98a20bc 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drv.h
> +++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
> @@ -276,6 +276,7 @@ struct nouveau_drm {
>   	/* modesetting */
>   	struct nvbios vbios;
>   	struct nouveau_display *display;
> +	bool headless;
>   	struct work_struct hpd_work;
>   	spinlock_t hpd_lock;
>   	u32 hpd_pending;

