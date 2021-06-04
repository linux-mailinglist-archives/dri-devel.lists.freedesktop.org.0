Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51FFB39BE8B
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 19:22:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E7C26F646;
	Fri,  4 Jun 2021 17:22:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6983B6F646;
 Fri,  4 Jun 2021 17:22:08 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 i14-20020a9d624e0000b029033683c71999so9789534otk.5; 
 Fri, 04 Jun 2021 10:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Jwj11W1dNddZwxmLESUbeDm5qnursrjwtNP8oMdIXWI=;
 b=YKmmPaGc5sg7zLTZfX1ibvETcdsD4jmzaW0Ls+6Sj8pO8eXxXueWQQqKdLrHk5kS74
 VnUuzn+h/weDs9F2Vv6B3JiDdFhF1W6z4h5AgjNjyvYWj7NAUka7qO7A2FX5li0wH8cS
 1ZlO0QtKzi1ErVH14szu9EO+OB19ycegljhT4xD4bgVcqifBPVJYBJKUYNFrxiZU/Gk6
 Mgq+bIRoCsgcuN9zw7xaBN4ZAVQbl+ll4fbE1ob8QP6SSNWwv3fFbRau9qZpsjhT0uZj
 z44q51wY1uzF+CrviLZrAvTrtu9oLcTZgqtMUkwsqlF5hGxFDfjiTzozrNuvbeYvSSYt
 DvuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Jwj11W1dNddZwxmLESUbeDm5qnursrjwtNP8oMdIXWI=;
 b=OQTRRn/RGXLk6yy96d03faQltHDNZcgpHiLVfKlwrEPnw5psL8bXDxNd7BGpSd6TNn
 TL6iVMY4zHfjW7PcOAPbGZFQG5AeetH8dHHgCSRWrxvPAQXfnCJVa4go5pd8BpUWC8EU
 K651rYNVleTKBNCoP1e590dty4belV0qTXM4wGJ2WNcU4tXa09oWjL1JnglUS+SR2Tz8
 5ACNuz/iqkVFRBSfjeyA68Kyyz8M0fIxszLvXDLTSyoIuv71ASohPnVNZN501PX3rqkh
 dXg9hQ6OkCtWblVifgQBB0vCMbkBBEoB8mD6xdjUSXNt0wzj0CX7EJ27Xke/1/dLuWmH
 Mp4Q==
X-Gm-Message-State: AOAM530l8c/9GWE7y4sRFPTh9eLUj54Vod/o8FNqR4/tM8Nww9DddQyZ
 XMBcBHgMzfau+UGS1arpB539aEGiFKFcBodc6ok=
X-Google-Smtp-Source: ABdhPJzrq437/q2H6TQntwoQRnFiVMqEeerpbPpO8kP/VQO+tYZYnhHR6HxTrljeb/ZuXt3gH9tgIVk4+L1Oi3wZPE4=
X-Received: by 2002:a05:6830:1e64:: with SMTP id
 m4mr2007512otr.23.1622827327707; 
 Fri, 04 Jun 2021 10:22:07 -0700 (PDT)
MIME-Version: 1.0
References: <87o8cnfr3s.wl-chenli@uniontech.com>
 <87im2ufhyz.wl-chenli@uniontech.com>
 <0689a006-a0a2-698a-12d8-cb11156e469a@gmail.com>
 <877djacbfx.wl-chenli@uniontech.com>
 <c4941cb6-8c40-aad1-e61a-2786ba1ab225@gmail.com>
 <87zgw6aull.wl-chenli@uniontech.com>
In-Reply-To: <87zgw6aull.wl-chenli@uniontech.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 4 Jun 2021 13:21:56 -0400
Message-ID: <CADnq5_P=y1uvWNF2j2EzyQaZoFANQqrGvZ79PuagXXQPM10HaA@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] radeon: use memcpy_to/fromio for UVD fw upload
To: Chen Li <chenli@uniontech.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied with the RB fixed.

Thanks!

Alex

On Fri, Jun 4, 2021 at 7:53 AM Chen Li <chenli@uniontech.com> wrote:
>
>
> I met a gpu addr bug recently and the kernel log
> tells me the pc is memcpy/memset and link register is
> radeon_uvd_resume.
>
> As we know, in some architectures, optimized memcpy/memset
> may not work well on device memory. Trival memcpy_toio/memset_io
> can fix this problem.
>
> BTW, amdgpu has already done it in:
> commit ba0b2275a678 ("drm/amdgpu: use memcpy_to/fromio for UVD fw upload"=
),
> that's why it has no this issue on the same gpu and platform.
>
> Signed-off-by: Chen Li <chenli@uniontech.com>
> Reviewed-by: Christian K=C3=B6nig
> ---
>  drivers/gpu/drm/radeon/radeon_uvd.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_uvd.c b/drivers/gpu/drm/radeon=
/radeon_uvd.c
> index 85a1f2c31749..753da95e6abb 100644
> --- a/drivers/gpu/drm/radeon/radeon_uvd.c
> +++ b/drivers/gpu/drm/radeon/radeon_uvd.c
> @@ -288,7 +288,7 @@ int radeon_uvd_resume(struct radeon_device *rdev)
>         if (rdev->uvd.vcpu_bo =3D=3D NULL)
>                 return -EINVAL;
>
> -       memcpy(rdev->uvd.cpu_addr, rdev->uvd_fw->data, rdev->uvd_fw->size=
);
> +       memcpy_toio((void __iomem *)rdev->uvd.cpu_addr, rdev->uvd_fw->dat=
a, rdev->uvd_fw->size);
>
>         size =3D radeon_bo_size(rdev->uvd.vcpu_bo);
>         size -=3D rdev->uvd_fw->size;
> @@ -296,7 +296,7 @@ int radeon_uvd_resume(struct radeon_device *rdev)
>         ptr =3D rdev->uvd.cpu_addr;
>         ptr +=3D rdev->uvd_fw->size;
>
> -       memset(ptr, 0, size);
> +       memset_io((void __iomem *)ptr, 0, size);
>
>         return 0;
>  }
> --
> 2.31.1
>
>
>
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
