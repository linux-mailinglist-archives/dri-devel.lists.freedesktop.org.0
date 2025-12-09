Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82EC0CAF15C
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 08:04:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEC8A10E00D;
	Tue,  9 Dec 2025 07:04:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tomeuvizoso-net.20230601.gappssmtp.com header.i=@tomeuvizoso-net.20230601.gappssmtp.com header.b="X73BcBju";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com
 [74.125.224.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0E8110E00D
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Dec 2025 07:04:26 +0000 (UTC)
Received: by mail-yx1-f43.google.com with SMTP id
 956f58d0204a3-6446705793aso218234d50.2
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Dec 2025 23:04:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tomeuvizoso-net.20230601.gappssmtp.com; s=20230601; t=1765263866;
 x=1765868666; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8HjZZ9kAFRbgW+ipXzreVZcAJO7V/Qz6Xi8HekbDwng=;
 b=X73BcBjuScvCZ4nLaDRxKF3ukHNtQoxDB/cOKPc7SvW1St0fDuDUEQLguZtf0jwY5e
 ci5bI22843dWbqBomre5dU/D3ssrRgPjiHPpn3w8DglH6WYNBoBQfiogrxuV1MEoVtjp
 rEtZH/DXA4gGbrT7l2Wgs26DxweruheHMcMmlh4uzcv36XjM9TwGKbz1gyKXOdWgFtNH
 /48xkxeR9N1G7cRFqW5/jrOclgzcsI7EgrA3mPBcWoXnWYDe8qDvZ+U6q4GfA2lNlEqZ
 WDdTLOqc7B2bCOey9EQ2pfb+mhQc+xaQDy5ULjNCV4U0YQtj5aS9sy25A9MHblR7dx/8
 rpfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765263866; x=1765868666;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=8HjZZ9kAFRbgW+ipXzreVZcAJO7V/Qz6Xi8HekbDwng=;
 b=XITs5tZYLF5BXqrtaltiqcKjQh5JCqb3URmbK4cyOK+/SLIJ46LU7XZ7HDQxMXNP3N
 Y8fh0fBVB7yK/IAts7TAFyCJ8nfZJlE1eBR9AVZxAV8CdqNeQGRm94zgLa/DAdjjGxQp
 WN3T+zb4eSN7pyu+EVaEgMvmducQ+N4zf0R8ugLFMHY15UWVUHj9FZltdtwST6ClgN/b
 TA3k/TOc/uf56u1PC+CbBhP5dHRC8ZVxGHSTGlVS7JdTDpA0fToyf+PSPZ3+g/R1+L6J
 PpRRc7RN9RBKQEJxTMzjq0M8nZPKlD4YP087ly4OkVhkIdYACaa3opCOk56m60nu3RLj
 wfHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVa7MxbVCV2+Yz69SG5I2caxF71tubTEYasirqF8tUFg+gTjbE0vMgkV7wZeu4pcTe10KD5hptir00=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz+feSCccnwi24GLu2DKfrn15oy0b+guh6dAe4MjjIY5NnugB9v
 kgsm7lMC/KdeUBhDBEi+vP/lEVRJgWOnSz68hCl5TS62FNwd+XP+dtTyw0jSZ5yhhj2sSgbEugk
 gBfXpPa4=
X-Gm-Gg: AY/fxX6XoBY0U8M+XwXjOF3WniijN7ZtGo3h/N2wWK7wNiBYJne1MbrcSq55hXIyfKp
 Jw0a8sV8fPaDBhGJBZkGv5zRbgQNEoi0SEXxjX82slEkRrvLcJJFS7gPVLDqSGPXdKE64zWUPHb
 vBxKDhoD+8bv+yljOVQCxdB8I3pFg9OrgJiIgYrCBSPBX78PY4R5rGuJvbtw2n/ozjA3Zs2+o+j
 RZcWvCuuE1Q4UXGa35gOjuupRkb/8zh2/1enmkmV+ZgCZOqclRqzRVZOLGs7oZZLEI2Tvxf79uA
 SuLWX+zPDdWMLQD2bWGvlMMA5Yg137UEfOetGCnTigzirRYUFvRbTvKcVOQa5mU7yYEWJsPYQlE
 Lxip8JOUzuaY3quFa2EDQJkC7wnaLibE3M1GXirHuACaH3AT62f37J0qatZxkhGZVtON5X1On20
 XA+CIytb0P9nK6+2fxCoHKJdjtuECvAcX3QQlaS4ikQKv30qvC0g==
X-Google-Smtp-Source: AGHT+IFcPGELIf7/Ktp5ujxR5KqUDoFC8HTcGdqpGApGVhExz0r8mEoKi1rJNRS3J7Jvx9jmXxPPRA==
X-Received: by 2002:a53:c603:0:b0:641:718:8a08 with SMTP id
 956f58d0204a3-6444e7c138fmr6928285d50.52.1765263865594; 
 Mon, 08 Dec 2025 23:04:25 -0800 (PST)
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com.
 [74.125.224.53]) by smtp.gmail.com with ESMTPSA id
 956f58d0204a3-6443f5a3ca0sm6126394d50.12.2025.12.08.23.04.25
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Dec 2025 23:04:25 -0800 (PST)
Received: by mail-yx1-f53.google.com with SMTP id
 956f58d0204a3-640f88b873bso5327794d50.3
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Dec 2025 23:04:25 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWQmar4vHj6RqX08iaCgKoEGq10WV3vFOqVSXeV5WqXvgiqJxnSKPQ8p5mpkleC+pYipd3hgXCo5PQ=@lists.freedesktop.org
X-Received: by 2002:a53:acc2:0:20b0:63f:9979:2f9e with SMTP id
 956f58d0204a3-6444e757265mr7570067d50.17.1765263864869; Mon, 08 Dec 2025
 23:04:24 -0800 (PST)
MIME-Version: 1.0
References: <20251107024620.912403-1-liqiang01@kylinos.cn>
In-Reply-To: <20251107024620.912403-1-liqiang01@kylinos.cn>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Tue, 9 Dec 2025 08:04:13 +0100
X-Gmail-Original-Message-ID: <CAAObsKBPsPpsmmF1EmPLw7-2o1Zq9C0jgkkHpEh0WSq5mWj++A@mail.gmail.com>
X-Gm-Features: AQt7F2oAkfn_gxkpumQ2SS3w1gVg430SLCszFPeOkGYiYsgcWSIDI1ffB1jh-j8
Message-ID: <CAAObsKBPsPpsmmF1EmPLw7-2o1Zq9C0jgkkHpEh0WSq5mWj++A@mail.gmail.com>
Subject: Re: [PATCH] drm/rocket: Add scheds pointer to file_priv and fix
 memory leaks
To: Li Qiang <liqiang01@kylinos.cn>
Cc: ogabbay@kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

Are you sure of this? The list should be freed in rocket_job_close(),
just before freeing the entity.

Regards,

Tomeu

On Fri, Nov 7, 2025 at 3:46=E2=80=AFAM Li Qiang <liqiang01@kylinos.cn> wrot=
e:
>
> The rocket driver allocates an array of struct drm_gpu_scheduler pointers
> for each file via kmalloc_array() in rocket_job_open(). However, the
> allocated memory was not stored in rocket_file_priv and therefore never
> freed on file close, leading to a memory leak.
>
> This patch introduces a new `scheds` field in struct rocket_file_priv to
> store the allocated pointer array, and frees it properly in
> rocket_job_close() after the scheduler entity is destroyed.
>
> This ensures correct lifetime tracking of scheduler arrays and resolves
> the leak detected by code review and potential KASAN reports.
>
> Signed-off-by: Li Qiang <liqiang01@kylinos.cn>
> ---
>  drivers/accel/rocket/rocket_drv.h |  1 +
>  drivers/accel/rocket/rocket_job.c | 10 +++++++++-
>  2 files changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/accel/rocket/rocket_drv.h b/drivers/accel/rocket/roc=
ket_drv.h
> index 2c673bb99ccc..759a08596dad 100644
> --- a/drivers/accel/rocket/rocket_drv.h
> +++ b/drivers/accel/rocket/rocket_drv.h
> @@ -24,6 +24,7 @@ struct rocket_file_priv {
>         struct mutex mm_lock;
>
>         struct drm_sched_entity sched_entity;
> +       struct drm_gpu_scheduler **scheds;
>  };
>
>  struct rocket_iommu_domain *rocket_iommu_domain_get(struct rocket_file_p=
riv *rocket_priv);
> diff --git a/drivers/accel/rocket/rocket_job.c b/drivers/accel/rocket/roc=
ket_job.c
> index acd606160dc9..820d96f010f2 100644
> --- a/drivers/accel/rocket/rocket_job.c
> +++ b/drivers/accel/rocket/rocket_job.c
> @@ -502,6 +502,9 @@ int rocket_job_open(struct rocket_file_priv *rocket_p=
riv)
>         unsigned int core;
>         int ret;
>
> +       if (unlikely(!scheds))
> +               return -ENOMEM;
> +
>         for (core =3D 0; core < rdev->num_cores; core++)
>                 scheds[core] =3D &rdev->cores[core].sched;
>
> @@ -509,8 +512,12 @@ int rocket_job_open(struct rocket_file_priv *rocket_=
priv)
>                                     DRM_SCHED_PRIORITY_NORMAL,
>                                     scheds,
>                                     rdev->num_cores, NULL);
> -       if (WARN_ON(ret))
> +       if (WARN_ON(ret)) {
> +               kfree(scheds);
>                 return ret;
> +       }
> +
> +       rocket_priv->scheds =3D scheds;
>
>         return 0;
>  }
> @@ -520,6 +527,7 @@ void rocket_job_close(struct rocket_file_priv *rocket=
_priv)
>         struct drm_sched_entity *entity =3D &rocket_priv->sched_entity;
>
>         kfree(entity->sched_list);
> +       kfree(rocket_priv->scheds);
>         drm_sched_entity_destroy(entity);
>  }
>
> --
> 2.25.1
>
