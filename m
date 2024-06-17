Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0907290B434
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 17:27:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E9F610E431;
	Mon, 17 Jun 2024 15:27:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="D8DPm6jd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9265010E428
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 15:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718638043;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l3yNOohsWGaypNKhl1iDB1/cvtnFfZJdux3KpEMAOgs=;
 b=D8DPm6jdpzE+gL5PfX+vhX5hU4BOun+pV7ELoNVa7UV31uoJ8doOPj+tLRYH9k23630iYb
 YGHWi+V5rB3AGVK48DScFnw7LdB5J5GNsOkD41pJkaKgMuUocC6XXk/eDrQmpM8+dwbPkg
 bG1720A6/PdaIbLNXqj2dIYT49+KrrM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-382-iUFZcHPgPZSqbBd5eULRVg-1; Mon, 17 Jun 2024 11:27:21 -0400
X-MC-Unique: iUFZcHPgPZSqbBd5eULRVg-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3608fb58acaso1228329f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 08:27:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718638040; x=1719242840;
 h=content-transfer-encoding:in-reply-to:organization:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l3yNOohsWGaypNKhl1iDB1/cvtnFfZJdux3KpEMAOgs=;
 b=IwMVC7/5O/6qLU02Bot8fKE3gbFmVisnmX0xbg9xosYF7Ise5t5Cj+rr7ZJuO2tA4S
 CkTPldGGGXkLKl1ZHzLWy+e3/UopH9Eo5zA74RvHpKFlSePO6Jx9/beYZTY9rH/K8KCU
 jBD3L41XVKku9JA7KLRMVu4czqtpnrwxR3oizFNfwdWz3H7feOv6MXCcXjaNVmPTQp2q
 Cquljapg/jIjfm59dGPC+dbAPJrbnJ2oJsr8CYVBj9b4tM6E+QGHMEpJajQok5U4kVMZ
 LKGLq8oZ6h+f5dw3xSJloGCZmgQLaGPdfw/jNvP+dii0kXClcJUrwrB+WWc5aw22vPlC
 1Ckg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2w2nN0lro8DvC+OnwiLTQSs/j5m2H28SbBM1PXkBUXCtzxbwY56qQcpMj43bFW33bajKkxhk5vfWKcJNK7WdUAzUij4I8QtaQS3/sGdQd
X-Gm-Message-State: AOJu0YxFOpANoYvLJhCuSKaf1059iPaTqL65UlJ/XVrnhDYQOSS1iOz+
 k5s5JRoLRF4gLwkE+FhoMp3iN5zrmKwczL8IPn5mQWmQUjes+SRVMowTa4Aum5TyMmMYMfniPP5
 +fxUx2945ZQ5i69LeDUsod4vJZMyO5o2zUlXzXR35W8OwKBMa5z6FoHygAPrterq0WA==
X-Received: by 2002:a05:6000:82:b0:35f:e4d:f3dc with SMTP id
 ffacd0b85a97d-3607a741964mr9404276f8f.9.1718638040650; 
 Mon, 17 Jun 2024 08:27:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFRjNmUohArz1oiIJJtmkoA2K/cMFwDCp/vUBbIHNHAgBY0QFm8dKaVEvyDta7bhr4F1pF9tg==
X-Received: by 2002:a05:6000:82:b0:35f:e4d:f3dc with SMTP id
 ffacd0b85a97d-3607a741964mr9404262f8f.9.1718638040302; 
 Mon, 17 Jun 2024 08:27:20 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:ee94:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36075104954sm12066178f8f.99.2024.06.17.08.27.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jun 2024 08:27:19 -0700 (PDT)
Message-ID: <cd389206-88a6-4e6f-9fca-491fb186ed5e@redhat.com>
Date: Mon, 17 Jun 2024 17:27:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/nouveau: Constify struct nouveau_job_ops
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <860e9753d7867aa46b003bb3d0497f1b04065b24.1718381285.git.christophe.jaillet@wanadoo.fr>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <860e9753d7867aa46b003bb3d0497f1b04065b24.1718381285.git.christophe.jaillet@wanadoo.fr>
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

On 6/14/24 18:08, Christophe JAILLET wrote:
> "struct nouveau_job_ops" is not modified in these drivers.
> 
> Constifying this structure moves some data to a read-only section, so
> increase overall security.
> 
> In order to do it, "struct nouveau_job" and "struct nouveau_job_args" also
> need to be adjusted to this new const qualifier.
> 
> On a x86_64, with allmodconfig:
> Before:
> ======
>     text	   data	    bss	    dec	    hex	filename
>     5570	    152	      0	   5722	   165a	drivers/gpu/drm/nouveau/nouveau_exec.o
> 
> After:
> =====
>     text	   data	    bss	    dec	    hex	filename
>     5630	    112	      0	   5742	   166e	drivers/gpu/drm/nouveau/nouveau_exec.o
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied to drm-misc-next, thanks!

> ---
>   drivers/gpu/drm/nouveau/nouveau_exec.c  | 2 +-
>   drivers/gpu/drm/nouveau/nouveau_sched.h | 4 ++--
>   drivers/gpu/drm/nouveau/nouveau_uvmm.c  | 2 +-
>   3 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_exec.c b/drivers/gpu/drm/nouveau/nouveau_exec.c
> index e65c0ef23bc7..a0b5f1b16e8b 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_exec.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_exec.c
> @@ -188,7 +188,7 @@ nouveau_exec_job_timeout(struct nouveau_job *job)
>   	return DRM_GPU_SCHED_STAT_NOMINAL;
>   }
>   
> -static struct nouveau_job_ops nouveau_exec_job_ops = {
> +static const struct nouveau_job_ops nouveau_exec_job_ops = {
>   	.submit = nouveau_exec_job_submit,
>   	.armed_submit = nouveau_exec_job_armed_submit,
>   	.run = nouveau_exec_job_run,
> diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.h b/drivers/gpu/drm/nouveau/nouveau_sched.h
> index e1f01a23e6f6..20cd1da8db73 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_sched.h
> +++ b/drivers/gpu/drm/nouveau/nouveau_sched.h
> @@ -42,7 +42,7 @@ struct nouveau_job_args {
>   		u32 count;
>   	} out_sync;
>   
> -	struct nouveau_job_ops *ops;
> +	const struct nouveau_job_ops *ops;
>   };
>   
>   struct nouveau_job {
> @@ -73,7 +73,7 @@ struct nouveau_job {
>   		u32 count;
>   	} out_sync;
>   
> -	struct nouveau_job_ops {
> +	const struct nouveau_job_ops {
>   		/* If .submit() returns without any error, it is guaranteed that
>   		 * armed_submit() is called.
>   		 */
> diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> index ee02cd833c5e..9402fa320a7e 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> @@ -1534,7 +1534,7 @@ nouveau_uvmm_bind_job_cleanup(struct nouveau_job *job)
>   	nouveau_uvmm_bind_job_put(bind_job);
>   }
>   
> -static struct nouveau_job_ops nouveau_bind_job_ops = {
> +static const struct nouveau_job_ops nouveau_bind_job_ops = {
>   	.submit = nouveau_uvmm_bind_job_submit,
>   	.armed_submit = nouveau_uvmm_bind_job_armed_submit,
>   	.run = nouveau_uvmm_bind_job_run,

