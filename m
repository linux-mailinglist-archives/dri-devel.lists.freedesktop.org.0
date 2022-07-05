Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F09567214
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jul 2022 17:08:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B98772B4A6;
	Tue,  5 Jul 2022 15:08:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C5C72AF83;
 Tue,  5 Jul 2022 15:08:03 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id d2so22215357ejy.1;
 Tue, 05 Jul 2022 08:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yUHKUShGAQP2s0iIm1zksJJpl/lyBcXlcuW/RNUcNOw=;
 b=IDDc7PbjlYsmcvapnMmOnTjbeWHQyiWvbpdubYiGv6GHn3wNXZw1SHsS26wKxR3lwK
 oD3T+GoCb0yTNmS+JT6WPxmg+gsNdf4D7eksw27wxHyEiQ7khLHq3dAmWRVk9KuUSwqa
 rziB77pfJPJKFjhFQuVIveMEvxy/7CKEGEntEfmHTnmv5h1WjyOsOYS8pJF9Lmw33gGb
 /QhsVPZHm+YUnJ2z0Ob6TuuDxd51yGJWszDdkBkSyRoAWk3diP6G+4QDBOA5vZZB7vT9
 zgi5XWaMKddZnBOmLB4yERgvna6wUF/FILWLaKbd3/hjYH+qpYcBn1llfAux1LZmpDNA
 NAUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yUHKUShGAQP2s0iIm1zksJJpl/lyBcXlcuW/RNUcNOw=;
 b=3pn7TZg9VfGCKE+GafH0GO27UPJ/scHLG1dk0AM9En2Yn23JihsrHTTHVGzATrgpvP
 KiiseCln2ZvPcX7wtGHlSbcCaAYTAX1IMJ1qHiwf/bAPKOHi828ox1KixY574abC4Qgo
 0XU/TSxYilqcHHz4sZn0Trsw7mN+TRonIlcshMiaJwZgPd2L8jzzfX0oLd6p4Gp7NW7v
 U1ijQ1nPybacA4FnOG4MNOEzpKFPohG96vX+YLDb0WfhuiVr/vOg704tsjq9MRkE0q+E
 Ob5MKhxnGox4H1oiKffTt/1sOW7+03MNYVAQJyZoG0t1KK28D/gjiliyQecBMZW5eQr4
 IZzw==
X-Gm-Message-State: AJIora/P6KBEge5SgtKsK5SyfiAwosDWgYqa3qN1VIhcG084TUfEbtpv
 pcRHjOSqsNMj4o8kqS/i2j8MPsVPymyRHaunfFFNkNL7
X-Google-Smtp-Source: AGRyM1s+vm1yrGPFkRTzyEnJsJBVgVgLOikAVgvDRDQD3cUHQg60f6JD//PitFt+3o++hjcOjP1u/C54mVfPllNIJmc=
X-Received: by 2002:a17:906:dc93:b0:726:a75b:f60f with SMTP id
 cs19-20020a170906dc9300b00726a75bf60fmr33893933ejc.564.1657033681853; Tue, 05
 Jul 2022 08:08:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220705134603.2248455-1-niejianglei2021@163.com>
In-Reply-To: <20220705134603.2248455-1-niejianglei2021@163.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 5 Jul 2022 11:07:49 -0400
Message-ID: <CADnq5_P7Ojd8beMqZ-N9EJJV9eONJVXMpaSGQt=PC9YXJ_FmHQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu/mes: Fix an error handling path in
 amdgpu_mes_self_test()
To: Jianglei Nie <niejianglei2021@163.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: "Joshi, Mukul" <mukul.joshi@amd.com>, Jack Xiao <Jack.Xiao@amd.com>,
 Dave Airlie <airlied@linux.ie>, xinhui pan <Xinhui.Pan@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Tue, Jul 5, 2022 at 9:46 AM Jianglei Nie <niejianglei2021@163.com> wrote:
>
> if amdgpu_mes_ctx_alloc_meta_data() fails, we should call amdgpu_vm_fini()
> to handle amdgpu_vm_init().
>
> Add a new lable before amdgpu_vm_init() and goto this lable when
> amdgpu_mes_ctx_alloc_meta_data() fails.
>
> Signed-off-by: Jianglei Nie <niejianglei2021@163.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
> index 69a70a0aaed9..7c196b8ac49f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
> @@ -1157,7 +1157,7 @@ int amdgpu_mes_self_test(struct amdgpu_device *adev)
>         r = amdgpu_mes_ctx_alloc_meta_data(adev, &ctx_data);
>         if (r) {
>                 DRM_ERROR("failed to alloc ctx meta data\n");
> -               goto error_pasid;
> +               goto error_fini;
>         }
>
>         ctx_data.meta_data_gpu_addr = AMDGPU_VA_RESERVED_SIZE;
> @@ -1215,6 +1215,8 @@ int amdgpu_mes_self_test(struct amdgpu_device *adev)
>         BUG_ON(amdgpu_bo_reserve(ctx_data.meta_data_obj, true));
>         amdgpu_vm_bo_del(adev, ctx_data.meta_data_va);
>         amdgpu_bo_unreserve(ctx_data.meta_data_obj);
> +
> +error_fini:
>         amdgpu_vm_fini(adev, vm);
>
>  error_pasid:
> --
> 2.25.1
>
