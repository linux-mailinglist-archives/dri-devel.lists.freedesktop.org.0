Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 379F1601408
	for <lists+dri-devel@lfdr.de>; Mon, 17 Oct 2022 18:54:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16C8E10EDB4;
	Mon, 17 Oct 2022 16:54:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00AFA10EDAC;
 Mon, 17 Oct 2022 16:53:35 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id w74so12807572oie.0;
 Mon, 17 Oct 2022 09:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RJwuB0qtkB8zoE2oWU877oWOsBKFsfQDlsz6gYRn+Os=;
 b=YkgFn7Efk/acBxL1O4vJb+KLmVn/txovq8xX417fqtOTBuvCOTJmRX4avXm8uyGJp+
 ESib3VAvEh9SGWNvhy3ZoFPgrb9MabP0mdX/QXdfit5hpTbVV0YXusIin+V+L2KSX34H
 MCvsUaI4UI/hhdEDJmSHFarZF6IPk/V2iEw3oOL8jph5HjRbfL4vNc8Ha0jPi997T1Q3
 zeJXP4Nrcmf4MwssTlNI964xFhyPz9bbHxOsDkjQbNGrA5ge22LYi+uda+FIFiu0RY4+
 t4t2pBhMzaze1yvSQQIjjDi2LPcw/nHbjzUkvoTRi2DgYLNmakJT20qficrA5oD2Ypx2
 M8WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RJwuB0qtkB8zoE2oWU877oWOsBKFsfQDlsz6gYRn+Os=;
 b=ko+yCRTJ9g3OtEeC7U3pYJC+ouvptAwprxw+rpAZ9+VNjZrLza+Gh7sOvO8RZ3j8qa
 ZjJRe793AlT+7QGBwgUSh1LCO+LOR6TbACPZJ/2JJmWxa6Ozrk9UC2ZZVm5f41ggWK6O
 XhzU1LY2fp5Zz5XwhM/DuDsznkmjwszIpG1HLvR/dIyYJbulgraDxOeiHEsaKNCdHBRe
 +SDt73F6Ot1Vmaodqt4Yn9qUfK1auDaL/m+47zil0/m83L2Hlp8zjkmCL5pYQT0yx1Ri
 b7/6gh7JO0P3yYqMwjxq6/2dv96HKk6YAT1rJCYLLGABhWFaGAJvU6VwPU7k8wcV+c/I
 j86g==
X-Gm-Message-State: ACrzQf06CdzmXFhu4wKwXrW0tkrX2qoRhirXcUi9UF21vVmHD9PfaEih
 hnOatzDwh8Df4cLxsoWC4uzyBtxcy9lcWuIrcFO/lquW
X-Google-Smtp-Source: AMsMyM5kqmCxFtwMwnMlU7bBP6InC/uujc+BhkaB/RHdfHwBB6yez3xtkRgTx5RyL1ujVP1sAhHfvQ1xxnT5Kif2Dww=
X-Received: by 2002:a05:6808:14d2:b0:354:c733:abd3 with SMTP id
 f18-20020a05680814d200b00354c733abd3mr5580056oiw.96.1666025615182; Mon, 17
 Oct 2022 09:53:35 -0700 (PDT)
MIME-Version: 1.0
References: <20221016174158.16638-1-fmdefrancesco@gmail.com>
In-Reply-To: <20221016174158.16638-1-fmdefrancesco@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 17 Oct 2022 12:53:24 -0400
Message-ID: <CADnq5_MDp6WUYTUO+Lo=XMSLdaYcwu5i2MWid9u1U2hKiyqoYg@mail.gmail.com>
Subject: Re: [RESEND PATCH] drm/amd/amdgpu: Replace kmap() with
 kmap_local_page()
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
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
Cc: Jack Xiao <Jack.Xiao@amd.com>, Tao Zhou <tao.zhou1@amd.com>,
 Ira Weiny <ira.weiny@intel.com>, Felix Kuehling <Felix.Kuehling@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Sun, Oct 16, 2022 at 1:42 PM Fabio M. De Francesco
<fmdefrancesco@gmail.com> wrote:
>
> kmap() is being deprecated in favor of kmap_local_page().
>
> There are two main problems with kmap(): (1) It comes with an overhead as
> mapping space is restricted and protected by a global lock for
> synchronization and (2) it also requires global TLB invalidation when the
> kmap=E2=80=99s pool wraps and it might block when the mapping space is fu=
lly
> utilized until a slot becomes available.
>
> With kmap_local_page() the mappings are per thread, CPU local, can take
> page faults, and can be called from any context (including interrupts).
> It is faster than kmap() in kernels with HIGHMEM enabled. Furthermore,
> the tasks can be preempted and, when they are scheduled to run again, the
> kernel virtual addresses are restored and are still valid.
>
> Since its use in amdgpu/amdgpu_ttm.c is safe, it should be preferred.
>
> Therefore, replace kmap() with kmap_local_page() in amdgpu/amdgpu_ttm.c.
>
> Suggested-by: Ira Weiny <ira.weiny@intel.com>
> Acked-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> ---
>
> I'm resending because I suspect that this patch might have been lost. In
> the meantime I added an "Acked-by" tag from Christian K.. Obviviously,
> there are no further changes in the code.
>
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_ttm.c
> index 3b4c19412625..c11657b5915f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -2301,9 +2301,9 @@ static ssize_t amdgpu_iomem_read(struct file *f, ch=
ar __user *buf,
>                 if (p->mapping !=3D adev->mman.bdev.dev_mapping)
>                         return -EPERM;
>
> -               ptr =3D kmap(p);
> +               ptr =3D kmap_local_page(p);
>                 r =3D copy_to_user(buf, ptr + off, bytes);
> -               kunmap(p);
> +               kunmap_local(ptr);
>                 if (r)
>                         return -EFAULT;
>
> @@ -2352,9 +2352,9 @@ static ssize_t amdgpu_iomem_write(struct file *f, c=
onst char __user *buf,
>                 if (p->mapping !=3D adev->mman.bdev.dev_mapping)
>                         return -EPERM;
>
> -               ptr =3D kmap(p);
> +               ptr =3D kmap_local_page(p);
>                 r =3D copy_from_user(ptr + off, buf, bytes);
> -               kunmap(p);
> +               kunmap_local(ptr);
>                 if (r)
>                         return -EFAULT;
>
> --
> 2.37.1
>
