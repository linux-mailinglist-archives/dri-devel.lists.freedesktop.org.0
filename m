Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DEAE6308D5A
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jan 2021 20:28:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE9E76EC15;
	Fri, 29 Jan 2021 19:28:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34D0F6EC0C;
 Fri, 29 Jan 2021 19:28:54 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id n42so9667449ota.12;
 Fri, 29 Jan 2021 11:28:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TTlFa+FhQ9E3hhXfUpHEFEwCBTVYyl2tyI+bhrzBYYc=;
 b=HFD5J2YGALukCCHDNdUuWUGonkc1xmVsI1d3GEijBb8667YTNlXUdOAG88IFOwVKwM
 O6Yu1YojShf0ToL3HOpg7BzIaSuQT93GgaiAcmwXUD/xt6IDxmVTp65+9h7dvzaFAktN
 cfiOlUNf8jKAM4t+v1grcMJGGAYiN3lmYLNhcXZ2Z6Py40ujQHWr2wdjSW6TX3VBqvI1
 6i1OHd9husSAeIWsJxQ2jBQLTeVnDJ5T3/8hZSOLDH5amJHUpTEBUba9CZRBboNEPQjk
 FPmSB6iyiKFPlBo9Q5uFm3JMrOr57NnEGYVekWikGXwddj783DGt/Tv/qs4Qc0R7+CT0
 0sVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TTlFa+FhQ9E3hhXfUpHEFEwCBTVYyl2tyI+bhrzBYYc=;
 b=qHiJdGcbJ/5F0H5ezj92V2LUKg7mCR6/zI3+ukOSKJCXML62NPP0aZ5UgK/DPPadHw
 p7D3169RHjC9a5PuQNxoF7aqCvzUZTd/LZ4wzVimzgfFPO1dVGcDSdwXBDfCOrE0Z6fP
 Yo6w6SbLBd/mCNIKEIjWru/AzuIWm7hctoGVTqTh8F38JEwKOl7Cat4GhnHAz74LXcFX
 8yCCvUa52RvEM22xBDZy2V4sV44qIlMS2B6v8hIjjBAnGxvQCyLqtwiUzHjhYDHjUXIK
 OBjNm0z0i0WkeXNUpZ+lOwyt/O7ztGTciqbkPO0rm8preBcO5ue/RKFgs40D0915lGtJ
 n0rQ==
X-Gm-Message-State: AOAM532hx2GpnMpYjXjiVNMEr0qjbgyuePwcahMtj4wNWsLix7vbULI2
 z4hEnTZT3SIjCRyh4M/EXObXENH1Tf3mp8F164E=
X-Google-Smtp-Source: ABdhPJxeJccHQSNbhg5zM7E4+pnL0FyDxpIvUiHsVHtDscx7vBeclhvpXx/FSZrPFKM7KT0j6hQkBi0B1zyn07NtQ3Y=
X-Received: by 2002:a9d:784a:: with SMTP id c10mr4094218otm.132.1611948533511; 
 Fri, 29 Jan 2021 11:28:53 -0800 (PST)
MIME-Version: 1.0
References: <20210129120759.375725-1-colin.king@canonical.com>
In-Reply-To: <20210129120759.375725-1-colin.king@canonical.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 29 Jan 2021 14:28:42 -0500
Message-ID: <CADnq5_O2MKy7jPc2o7u8H-VsDxweumxGHc7oBprg7ZyP_BMu2w@mail.gmail.com>
Subject: Re: [PATCH][next] drm/amdgpu: Fix memory leak of object caps on error
 return paths
To: Colin King <colin.king@canonical.com>
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
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Leo Liu <leo.liu@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 29, 2021 at 7:08 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> Currently there are three error return paths that don't kfree object
> caps.  Fix this by performing the allocation of caps after the checks
> and error return paths to avoid the premature allocation and memory
> leaking.
>
> Addresses-Coverity: ("Resource leak")
> Fixes: 555fc7fbb2a2 ("drm/amdgpu: add INFO ioctl support for querying video caps")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.  Thanks!

Alex


> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> index 84b666fcfaf6..730f4ac7487b 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> @@ -988,10 +988,6 @@ int amdgpu_info_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
>                 struct drm_amdgpu_info_video_caps *caps;
>                 int r;
>
> -               caps = kzalloc(sizeof(*caps), GFP_KERNEL);
> -               if (!caps)
> -                       return -ENOMEM;
> -
>                 switch (info->video_cap.type) {
>                 case AMDGPU_INFO_VIDEO_CAPS_DECODE:
>                         r = amdgpu_asic_query_video_codecs(adev, false, &codecs);
> @@ -1009,6 +1005,11 @@ int amdgpu_info_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
>                                       info->video_cap.type);
>                         return -EINVAL;
>                 }
> +
> +               caps = kzalloc(sizeof(*caps), GFP_KERNEL);
> +               if (!caps)
> +                       return -ENOMEM;
> +
>                 for (i = 0; i < codecs->codec_count; i++) {
>                         int idx = codecs->codec_array[i].codec_type;
>
> --
> 2.29.2
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
