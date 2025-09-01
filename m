Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF7CB3EB2C
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 17:44:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9652110E4DB;
	Mon,  1 Sep 2025 15:44:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tomeuvizoso-net.20230601.gappssmtp.com header.i=@tomeuvizoso-net.20230601.gappssmtp.com header.b="LkugW23d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com
 [209.85.128.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 861E410E4DB
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Sep 2025 15:44:01 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-72019872530so40460747b3.1
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Sep 2025 08:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tomeuvizoso-net.20230601.gappssmtp.com; s=20230601; t=1756741440;
 x=1757346240; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cUiM499WAsgc6Ukc/D+bl/hCEszVrQlmtsEYo4ugE2U=;
 b=LkugW23dspR1iz1ZUT+p1kdc5CqBUynosTXIgnqWg5/LK9uCnhFDve9s0A0XEym3ib
 a0EhaqyrUQ36qfxPpULbdwuNA9p9rR0j/EWYnBNAKiX2KMAQ+6esIE3Cv1lp2hNdXUYB
 mwACSWhS1Dp34cdCJksVPIDubvjGdoJXUgxxl9S7/akw5eqdpD3AZ8wbPNGmcFQhzU/8
 LD6Tb/mW6UOhNZ3l/fKDYHboNRaGyjpyycyVIZLuL1DpFzduup1qLgYdmXtfqwkz2E9n
 TxzKWDnSimc55etbA0jkOXIuitlJDOtWpCfB19aisRS6ox+bgPk1oS63TT+QAII3r5XV
 WNdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756741440; x=1757346240;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cUiM499WAsgc6Ukc/D+bl/hCEszVrQlmtsEYo4ugE2U=;
 b=OEtghEvfaxyLo+fnEN3RUxo3hikLWQmuJcAyW3KBMKqlswgdoVrk+y6zdky6tQ/HP0
 DbFTfhB6zZCi6nG3ChaqDn0FOY6XU4LfNqOCQjX5oo+t4pxGBIknXA2FHE6ecaS8lUXT
 hl7GX9T3DnRlTcPYOYTt7+oSoBtWUwHyrL1PtPRbFmAgHf522MPxzPaeyZUCl8aNMPus
 KT6l0JWDdVZA9pImx078nYCjzkvzo8l5A6i2rYHbm0hgb0iFmkambMgEjRl2nuYeOLBe
 4EDRPxLj1J4BW7dl7ze8OTXl38zrBQL4vsTcUEnh7hXvn/kAVIL/97s5fUpMad8cIz2N
 CUCw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTWUJvZBvHOFGT705j2BfwzwdRT0Y62prcDqgoOrPIFkWFoCYFkO7N5saTDrIbyHvplq7EMMGMXt4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyIdMUoF96AAMeTVHHwasWPwuq6O+omKnjC6mc8JuukXNPJSs46
 9n7yLncDOFeLAxx7KIUzyAnJeKBu44G8xE9h00ui8zbsK3UaeJJ0ivALtVUB9DGRR0OoE/kYjzx
 u8fezpRHX8w==
X-Gm-Gg: ASbGnctTPx4Al+HtZ/Iap11LkDkTrAghkipKoD1dglLZWeaWOaLvp/GYSDuJYkg1EvC
 TBqcsPNaCnXXP8MJ4Czsl3Ayob593qd8jakpGxUAUR35lRjExMaCmVxbnwzP1bQ6Z8D0BV5p4vD
 oHRg0hBoypqmSn7dr+wpjcSMbhS3O+wu8euki0Pg5tlLLzEKVkISlGIx1jyRswe9Rv/81qHNsAG
 o1iuVNbwKS97G/BYOakcjzM2YFx0YqnFqq6V2aNWe1Ly7T7eQvcrg0n8rnvYbgUmgZ7mU2mm6JS
 7NVmozBIS8nTYGOsrKdD7aOFImPrJJf2LO9aD2cIe7d3qv6TAMS/iwum1eOzqL87elK+sdzdPpU
 92nK0FzXgy0cLaptpbcVN+HJN5NG6x+zwXkq9GLdZuUoM0UVB1CPXs9igQDdY2qMfB0c1sneOfP
 sqKjVJC3h1tVE=
X-Google-Smtp-Source: AGHT+IEbJT8iUyjpoWwAFvik2p99ti3bEAuAb3JG3RLUoxx+HHh5uO5hSCAWc90z6rRXI8J+YeqNaA==
X-Received: by 2002:a05:690c:6809:b0:71f:e430:6671 with SMTP id
 00721157ae682-72276406fd1mr106461477b3.22.1756741440447; 
 Mon, 01 Sep 2025 08:44:00 -0700 (PDT)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com.
 [209.85.219.180]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-7227d62d94dsm15859177b3.20.2025.09.01.08.43.59
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Sep 2025 08:43:59 -0700 (PDT)
Received: by mail-yb1-f180.google.com with SMTP id
 3f1490d57ef6-e931c858dbbso3499691276.0
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Sep 2025 08:43:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXdRAZnNQ3eAz3CrT2uZy2w4pJtzyOq4rf9GfSmVCWM5VJBWoE53zYAGWTJrM6+zEUJx474hRmMip0=@lists.freedesktop.org
X-Received: by 2002:a05:690c:dcd:b0:720:378:bec1 with SMTP id
 00721157ae682-722763a6893mr103121127b3.19.1756741439428; Mon, 01 Sep 2025
 08:43:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250813-rocket-free-fix-v1-1-51f00a7a1271@brighamcampbell.com>
In-Reply-To: <20250813-rocket-free-fix-v1-1-51f00a7a1271@brighamcampbell.com>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Mon, 1 Sep 2025 17:43:48 +0200
X-Gmail-Original-Message-ID: <CAAObsKCcpLheLP-qAW34CfG53vGnAceAOT19VUDLt4nKW1tDUA@mail.gmail.com>
X-Gm-Features: Ac12FXzUHl7q6vH9f1nyi7wu4CMwk0i7C4k_JNPH92MntSXDR3OrCP25AsHGPxY
Message-ID: <CAAObsKCcpLheLP-qAW34CfG53vGnAceAOT19VUDLt4nKW1tDUA@mail.gmail.com>
Subject: Re: [PATCH] accel/rocket: Fix usages of kfree() and sizeof()
To: Brigham Campbell <me@brighamcampbell.com>
Cc: Oded Gabbay <ogabbay@kernel.org>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>, 
 Julia Lawall <julia.lawall@inria.fr>
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

On Wed, Aug 13, 2025 at 6:02=E2=80=AFPM Brigham Campbell <me@brighamcampbel=
l.com> wrote:
>
> Replace usages of kfree() with kvfree() for pointers which were
> allocated using kvmalloc(), as required by the kernel memory management
> API.
>
> Use sizeof() on the type that a pointer references instead of the
> pointer itself. In this case, scheds and *scheds both happen to be
> pointers, so sizeof() will expand to the same value in either case, but
> using *scheds is more technically correct since scheds is an array of
> drm_gpu_scheduler *.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Julia Lawall <julia.lawall@inria.fr>
> Closes: https://lore.kernel.org/r/202508120730.PLbjlKbI-lkp@intel.com/
> Signed-off-by: Brigham Campbell <me@brighamcampbell.com>

Thanks, Brigham, I just went ahead and applied it to drm-misc-next. I
also think two commits wouldn't have been worth it.

Regards,

Tomeu

> ---
>  drivers/accel/rocket/rocket_job.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/accel/rocket/rocket_job.c b/drivers/accel/rocket/roc=
ket_job.c
> index 5d4afd69230623215e3105da7153d2d010636d52..f6fe1a6d9264b7508a3adc032=
48e5a704c68c4f0 100644
> --- a/drivers/accel/rocket/rocket_job.c
> +++ b/drivers/accel/rocket/rocket_job.c
> @@ -222,7 +222,7 @@ static int rocket_job_push(struct rocket_job *job)
>  err_unlock:
>         drm_gem_unlock_reservations(bos, job->in_bo_count + job->out_bo_c=
ount, &acquire_ctx);
>  err:
> -       kfree(bos);
> +       kvfree(bos);
>
>         return ret;
>  }
> @@ -496,7 +496,8 @@ void rocket_job_fini(struct rocket_core *core)
>  int rocket_job_open(struct rocket_file_priv *rocket_priv)
>  {
>         struct rocket_device *rdev =3D rocket_priv->rdev;
> -       struct drm_gpu_scheduler **scheds =3D kmalloc_array(rdev->num_cor=
es, sizeof(scheds),
> +       struct drm_gpu_scheduler **scheds =3D kmalloc_array(rdev->num_cor=
es,
> +                                                         sizeof(*scheds)=
,
>                                                           GFP_KERNEL);
>         unsigned int core;
>         int ret;
> @@ -630,7 +631,7 @@ int rocket_ioctl_submit(struct drm_device *dev, void =
*data, struct drm_file *fil
>                 rocket_ioctl_submit_job(dev, file, &jobs[i]);
>
>  exit:
> -       kfree(jobs);
> +       kvfree(jobs);
>
>         return ret;
>  }
>
> ---
> base-commit: a3daf184bd85d7c08ce948a79bb0e4cac2203923
> change-id: 20250813-rocket-free-fix-3ca6a759a290
>
> Thanks!
> Brigham Campbell <me@brighamcampbell.com>
>
