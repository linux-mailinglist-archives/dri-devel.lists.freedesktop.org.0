Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED432AEE80E
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 22:21:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FE2110E0BF;
	Mon, 30 Jun 2025 20:21:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="YwZsr1xX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E58AD10E0BF;
 Mon, 30 Jun 2025 20:21:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EC3C15C5807;
 Mon, 30 Jun 2025 20:21:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FDC0C4CEF3;
 Mon, 30 Jun 2025 20:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751314876;
 bh=Fwnv+3tI8qpYaNOAohnsjqByw40uQGXP3Ew7dw6SJA8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=YwZsr1xX+f4zd1tKcntuyeRJiCHKqqtQ7eHY5VqiH0XMuY24YtQDRDsDvrsSUaMXe
 3p0j79Ik0tqnefle7qOltOyqosNox8H0hRG9Cb8YlBUC3SRmoptWLWJ4GgHde5Jc8e
 8HZO9Qj3Lv1oFsnn5C77CEwZy5R2ua87vNfyEF96RYuLoD8bwXVew/yQOLP3E72U71
 KM/VORM19/XBvUkb1tQ5EABlHc0If4V1wWOvz5+GafEhTAkJtZzZzmEz2LbuAPYmFW
 x9YmrQER/arhm3zNNc5i6TrjD4ET10n8WvYpjIGps4KmIpqCAZ9Z2rs6puye2vzcsv
 /DKYjzJe6go0w==
Received: by mail-oo1-f41.google.com with SMTP id
 006d021491bc7-6116d9bb6ecso1474512eaf.3; 
 Mon, 30 Jun 2025 13:21:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXGBGxZq0f+jWfpm8Xgnno+O3J3h6hJ1+V4Fe9isi0Yo45sa9PfU9GM3xPU7ZGjHHWHjb+/5xW9@lists.freedesktop.org,
 AJvYcCXfxbvvrvGVmJuvWl8PavK4GDoUHuZxQbDRQgORcBAyXISk9EtrbmdRhQnCHHG3KqhXKasotB/6n7gs@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwqmAlIkuWxgjy2mBa9lln6PwpS8qY8pJXfQAe7QkTjj5if68MW
 83Jqa/tdEBzuh7+x3cZH3jUDR0d0rNxNqpO8MvfcLdsGEMF7UvCnlSppNYz0AR66UJTJgDPQt5w
 NfOfeUD7slZJmPDDrhQ9jPVpXjXFb4V8=
X-Google-Smtp-Source: AGHT+IHwBKk2EFjdrktPIO4q1VjCPfY5q+iVAPT3tEDnoSpBPNjqGQzYmuLvHcfpLiofmKKiMqsX8EX0gS5R2y5J/mc=
X-Received: by 2002:a05:6820:8109:b0:611:4bfe:610a with SMTP id
 006d021491bc7-611b90edbcfmr9164059eaf.8.1751314875866; Mon, 30 Jun 2025
 13:21:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250630104116.3050306-1-guoqing.zhang@amd.com>
 <20250630104116.3050306-3-guoqing.zhang@amd.com>
In-Reply-To: <20250630104116.3050306-3-guoqing.zhang@amd.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 30 Jun 2025 22:21:04 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0i2v+yUyNes4KpTpDuQVdS8m1x0eBva5_GrMpmuWT4oKQ@mail.gmail.com>
X-Gm-Features: Ac12FXxQnPDN8j2mvespiFaa_u1FRxEcRxrjhC9FkCzbNLDo-NAXahtAh7DLk0E
Message-ID: <CAJZ5v0i2v+yUyNes4KpTpDuQVdS8m1x0eBva5_GrMpmuWT4oKQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] PM: hibernate: shrink shmem pages after
 dev_pm_ops.prepare()
To: Samuel Zhang <guoqing.zhang@amd.com>
Cc: rafael@kernel.org, len.brown@intel.com, pavel@kernel.org, 
 alexander.deucher@amd.com, christian.koenig@amd.com, 
 mario.limonciello@amd.com, lijo.lazar@amd.com, victor.zhao@amd.com, 
 haijun.chang@amd.com, Qing.Ma@amd.com, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org, 
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

On Mon, Jun 30, 2025 at 12:41=E2=80=AFPM Samuel Zhang <guoqing.zhang@amd.co=
m> wrote:
>
> When hibernate with data center dGPUs, huge number of VRAM data will be
> moved to shmem during dev_pm_ops.prepare(). These shmem pages take a lot
> of system memory so that there's no enough free memory for creating the
> hibernation image. This will cause hibernation fail and abort.
>
> After dev_pm_ops.prepare(), call shrink_all_memory() to force move shmem
> pages to swap disk and reclaim the pages, so that there's enough system
> memory for hibernation image and less pages needed to copy to the image.
>
> This patch can only flush and free about half shmem pages. It will be
> better to flush and free more pages, even all of shmem pages, so that
> there're less pages to be copied to the hibernation image and the overall
> hibernation time can be reduced.
>
> Signed-off-by: Samuel Zhang <guoqing.zhang@amd.com>
> ---
>  kernel/power/hibernate.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/kernel/power/hibernate.c b/kernel/power/hibernate.c
> index 10a01af63a80..913a298c1d01 100644
> --- a/kernel/power/hibernate.c
> +++ b/kernel/power/hibernate.c
> @@ -370,6 +370,17 @@ static int create_image(int platform_mode)
>         return error;
>  }
>
> +static void shrink_shmem_memory(void)
> +{
> +       struct sysinfo info;
> +       unsigned long pages, freed;
> +

Please add a comment explaining what is going on here.

> +       si_meminfo(&info);
> +       pages =3D info.sharedram;
> +       freed =3D shrink_all_memory(pages);
> +       pr_debug("requested to reclaim %lu pages, freed %lu pages\n", pag=
es, freed);

This message will be hard to decode without any context.

> +}
> +
>  /**
>   * hibernation_snapshot - Quiesce devices and create a hibernation image=
.
>   * @platform_mode: If set, use platform driver to prepare for the transi=
tion.
> @@ -411,6 +422,8 @@ int hibernation_snapshot(int platform_mode)
>                 goto Thaw;
>         }
>

Please add a comment explaining why the below is done.

> +       shrink_shmem_memory();
> +
>         suspend_console();
>         pm_restrict_gfp_mask();
>
> --
> 2.43.5
>
>
