Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBBF9CC3EF7
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 16:29:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20BCE10E2AC;
	Tue, 16 Dec 2025 15:29:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DT+aJcxU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EACDB10E23F
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Dec 2025 15:29:15 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-29e346af955so6846235ad.0
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Dec 2025 07:29:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765898955; x=1766503755; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zr3Gof58u9YJPfboarrtkfLOPQXqGnwnePKk7JXxizs=;
 b=DT+aJcxUBydhGXb5Pn9nb/lyNYvo6v/XuPiKSGPc9b72IarutgUfWLyJMM6aaTozIC
 kQCByEpUxIPIycTXxgtPO1DjU/tbmw0JlsoPHS4EPLfTjkDIiDW69GKcKrNCxzdKnacy
 FaEeoa4csNYdmth9VwRF/OvtLNl53Bk/twgM3KLHMxTFrK8yqL9UvDPozlVWrroC+8oD
 Vo9GMomRNRe/ylSogMsk1WWjyn+jBfWXdvihw+I6FozBqd43quAGCHtn9ELaSHZtlT38
 A51pAHRs1nbr4Ic13yIgV420eh+vPGvaBSWJqG8nBuCgM2OC64zO1+e5ZSxRD3JR5+cF
 gkTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765898955; x=1766503755;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=zr3Gof58u9YJPfboarrtkfLOPQXqGnwnePKk7JXxizs=;
 b=q/hN44iIIw1oSVfATjUwtmtGqRSnQMaO9ySy4KIdR1AJ7vmr9XqEqwzXdNk+zNFY6f
 fAon+CA4KCSqWlE92vhdaFZHG6Y5eoWL+gCFR1Zd75QynX/iX/34YlSTBAqeD6bplEFF
 7O6Pi/J1qbxZnCFlNEtBem4mEqLROZzZ9dEMfOuo2dV0ijeObt1uVG0Jv/nv1fua8Wlr
 nQlhHi8qRSS1h6ARd1L1ou2l9OQ3YpYrNPnJ0vLBZPQJody5IHQC0Kd+Yma5FkdDgWvo
 1cPdsavzQtA9hNDuM91PGcMA1Z5rTcnXd/BunS0DCYeCYTd4X/fXR/aE5wq1eAOCMtyQ
 8ZEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2hirYK5XOafuwmCjcgMFALQKy/eCmlrlLS8g3RGlvYo12X0zR5mQYU0rYGIehMfvV8tuvGdvXPQ4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyBdqH8BulLla/+klave67Ule7FCDWIBjbBE1K1MwUJ4G2Jqxz9
 pHukcBB50uP+YyCk1NXrJzMe+GfNvPYIvbY0w/EzbOkZeoCGCU1vmkJBPdUdMEihVi7H2tI5giy
 1VnJ1u99tsX+p5k6rwt9apI1vUiKxtj8=
X-Gm-Gg: AY/fxX5ERp8Vlufo/WMMCAZ9xheit3sGsc56/PpCb3E+wwzZk5m6oDubOB3E00jPRzE
 44y0pBL3brQly9N3uWZtVxQVaxLxxtlGE8PaEK7uDLPcTcF9liMBf6mL+rYrlsK22SO5oBQkaKt
 PKMUK6dG+gSaO5rtJyzL9RQqbq/qjPTtXzeGIbshGHEA1bhPrYLe3KbUxpm9mtK0JqW2mJvFDO3
 MJDFmhwYjwKY1ay3le2Plo/hj653ZzD8gaBBeRn7GfuVoGj2YIrzTRGVxIp5Rdn0ZKZUMG1
X-Google-Smtp-Source: AGHT+IG9kcUP8Pi9U9VCe9+jqy+e35rih9Qd+GyQTJbDh/dChPu3EK/0GXGO9bipWaTXTvNU+Tefi0oHy/HN/K4UjYE=
X-Received: by 2002:a05:7301:2e32:b0:2ab:ca55:89bd with SMTP id
 5a478bee46e88-2ac30218330mr3818312eec.4.1765898955375; Tue, 16 Dec 2025
 07:29:15 -0800 (PST)
MIME-Version: 1.0
References: <20251215115150.3581277-1-colin.i.king@gmail.com>
In-Reply-To: <20251215115150.3581277-1-colin.i.king@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 16 Dec 2025 10:29:02 -0500
X-Gm-Features: AQt7F2pxZJSCVbxZ9Qp5L5e3UwMyuAGBb-cNval3Rs_27mmLOu4PrjQHbXJDINc
Message-ID: <CADnq5_NRO5KqMq33yK4Bc04yC2wAPbhb0FvL+9D5T4PFDW6i_Q@mail.gmail.com>
Subject: Re: [PATCH] drm/amdkfd: Fix a couple of spelling mistakes
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org, 
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

Applied.  Thanks!

On Mon, Dec 15, 2025 at 12:51=E2=80=AFPM Colin Ian King <colin.i.king@gmail=
.com> wrote:
>
> There are a couple of spelling mistakes, one in a pr_warn message
> and one in a seq_printf message. Fix these.
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  drivers/gpu/drm/amd/amdkfd/kfd_process.c               | 2 +-
>  drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/a=
md/amdkfd/kfd_process.c
> index 2f66ebb5b029..adffa44fff2c 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> @@ -830,7 +830,7 @@ int kfd_create_process_sysfs(struct kfd_process *proc=
ess)
>         int ret;
>
>         if (process->kobj) {
> -               pr_warn("kobject already exsists for the kfd_process\n");
> +               pr_warn("kobject already exists for the kfd_process\n");
>                 return -EINVAL;
>         }
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c b/dri=
vers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
> index 5f8cda4733f9..d7d37f01f51c 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
> @@ -1115,7 +1115,7 @@ int pqm_debugfs_mqds(struct seq_file *m, void *data=
)
>                                 break;
>                         default:
>                                 seq_printf(m,
> -                               "  Qeueu node with bad user queue type %d=
 on device %x\n",
> +                               "  Queue node with bad user queue type %d=
 on device %x\n",
>                                            q->properties.type, q->device-=
>id);
>                                 continue;
>                         }
> --
> 2.51.0
>
