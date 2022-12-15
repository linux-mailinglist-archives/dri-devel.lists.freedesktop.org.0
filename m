Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0867D64E12F
	for <lists+dri-devel@lfdr.de>; Thu, 15 Dec 2022 19:45:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35A0A10E53E;
	Thu, 15 Dec 2022 18:45:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com
 [IPv6:2001:4860:4864:20::2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EADF10E4D3;
 Thu, 15 Dec 2022 18:45:29 +0000 (UTC)
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-14449b7814bso422932fac.3; 
 Thu, 15 Dec 2022 10:45:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=WEfPevdP7TJjnOIQtPsy+AcNppPJSiCKzyrt/O+WxJM=;
 b=j6kGh3ykV4NImJgI7b18PBsKNjvgGeK3aR+cZp5W/GhzrtxBO4uxn9oFBS+5IJn7hC
 wDNGjiaLz1b7Rb9LOEtYldzbpWAwEENBtSkknMRlSYdwkgZ547nKZtuDweUyNOMNtYAx
 TFfkpCycfKp9sikmP2gSadcGfBzp4dsBms2+HZ/AM1FiG7hrZLZt4olXVuDyM8uFh2Z5
 h7jkjX7L52UMfE2UCBQjC7vZfi66ulCitQ2yl1EoFvWj4xJe/06p1QRLzMXpbtfUUY2R
 psSQf5Kw5OQcgvWLswPDD+wUZNb4Oia5qqHjFN97IZuH2BOjDKQdtAXynDfNmD8oxxry
 Usww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WEfPevdP7TJjnOIQtPsy+AcNppPJSiCKzyrt/O+WxJM=;
 b=5qiMEjAkM3gwy/giux6cQn2KW/kjBToT+A0qYT/W77dhdZriB0hHTzreP3C3bOkCEV
 450vkTZswscchxbBkNehBNeohXxyF97ifsgE5hQB/POEguZtxQVn2NCWO3qy3jhqOrVT
 ekbCOyHAGpxgn84/1C0LF5z5JU5MnqP5rgAVmxTu5ZX34tn1+BMUgmorSh8gBKuIb7EJ
 HEtXAtrn0TexS24DO+tdFOZIdyNASEY8MH4Lq19wURz8r2mHrgdh8lkGdTYygEczvZIr
 cB2hVkzNsYWeDJd32q6wgohWJw22PG9SO8DHqHzvVLmSfNNBTPGjGnBsvb+dUZdEZ/zA
 EDvw==
X-Gm-Message-State: AFqh2kpiD19YcbkRPr9Ny9gddnOI4D1TOIZ1KqTB3fF1pACmxbxisKX5
 5rxGeY+u5EnfsEpNhWrQcCPtgcmHMDqOAhyCjMEFFboO
X-Google-Smtp-Source: AMrXdXv8rSwR8qAQ1zJL/wkH8q0sS2srKc8zr4Ipi/FlQ13g+Lo7yphFOfIVlXGX86Y1SMSSxP5pUbKDL4g4sLXPdFA=
X-Received: by 2002:a05:6870:8091:b0:148:3c8f:15ab with SMTP id
 q17-20020a056870809100b001483c8f15abmr360847oab.46.1671129928331; Thu, 15 Dec
 2022 10:45:28 -0800 (PST)
MIME-Version: 1.0
References: <20221215163649.386750-1-arnd@kernel.org>
In-Reply-To: <20221215163649.386750-1-arnd@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 15 Dec 2022 13:45:16 -0500
Message-ID: <CADnq5_P0M5fYCbqt+PwLSGzdeMy3YCvkaRW9sm+z7rC0Ra8_mw@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/pm: avoid large variable on kernel stack
To: Arnd Bergmann <arnd@kernel.org>
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
Cc: llvm@lists.linux.dev, Arnd Bergmann <arnd@arndb.de>,
 Yang Wang <KevinYang.Wang@amd.com>, Tom Rix <trix@redhat.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Hawking Zhang <Hawking.Zhang@amd.com>, Nathan Chancellor <nathan@kernel.org>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Evan Quan <evan.quan@amd.com>, Kenneth Feng <kenneth.feng@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Chengming Gui <Jack.Gui@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Thu, Dec 15, 2022 at 11:37 AM Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> The activity_monitor_external[] array is too big to fit on the
> kernel stack, resulting in this warning with clang:
>
> drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_7_ppt.c:1438:12: error: stack frame size (1040) exceeds limit (1024) in 'smu_v13_0_7_get_power_profile_mode' [-Werror,-Wframe-larger-than]
>
> Use dynamic allocation instead. It should also be possible to
> have single element here instead of the array, but this seems
> easier.
>
> Fixes: 334682ae8151 ("drm/amd/pm: enable workload type change on smu_v13_0_7")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  .../drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c  | 21 ++++++++++++++-----
>  1 file changed, 16 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c
> index c270f94a1b86..7eba854e09ec 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c
> @@ -1439,7 +1439,7 @@ static int smu_v13_0_7_get_power_limit(struct smu_context *smu,
>
>  static int smu_v13_0_7_get_power_profile_mode(struct smu_context *smu, char *buf)
>  {
> -       DpmActivityMonitorCoeffIntExternal_t activity_monitor_external[PP_SMC_POWER_PROFILE_COUNT];
> +       DpmActivityMonitorCoeffIntExternal_t *activity_monitor_external;
>         uint32_t i, j, size = 0;
>         int16_t workload_type = 0;
>         int result = 0;
> @@ -1447,6 +1447,12 @@ static int smu_v13_0_7_get_power_profile_mode(struct smu_context *smu, char *buf
>         if (!buf)
>                 return -EINVAL;
>
> +       activity_monitor_external = kcalloc(sizeof(activity_monitor_external),
> +                                           PP_SMC_POWER_PROFILE_COUNT,
> +                                           GFP_KERNEL);
> +       if (!activity_monitor_external)
> +               return -ENOMEM;
> +
>         size += sysfs_emit_at(buf, size, "                              ");
>         for (i = 0; i <= PP_SMC_POWER_PROFILE_WINDOW3D; i++)
>                 size += sysfs_emit_at(buf, size, "%-14s%s", amdgpu_pp_profile_name[i],
> @@ -1459,15 +1465,17 @@ static int smu_v13_0_7_get_power_profile_mode(struct smu_context *smu, char *buf
>                 workload_type = smu_cmn_to_asic_specific_index(smu,
>                                                                CMN2ASIC_MAPPING_WORKLOAD,
>                                                                i);
> -               if (workload_type < 0)
> -                       return -EINVAL;
> +               if (workload_type < 0) {
> +                       result = -EINVAL;
> +                       goto out;
> +               }
>
>                 result = smu_cmn_update_table(smu,
>                                           SMU_TABLE_ACTIVITY_MONITOR_COEFF, workload_type,
>                                           (void *)(&activity_monitor_external[i]), false);
>                 if (result) {
>                         dev_err(smu->adev->dev, "[%s] Failed to get activity monitor!", __func__);
> -                       return result;
> +                       goto out;
>                 }
>         }
>
> @@ -1495,7 +1503,10 @@ do {                                                                                                     \
>         PRINT_DPM_MONITOR(Fclk_BoosterFreq);
>  #undef PRINT_DPM_MONITOR
>
> -       return size;
> +       result = size;
> +out:
> +       kfree(activity_monitor_external);
> +       return result;
>  }
>
>  static int smu_v13_0_7_set_power_profile_mode(struct smu_context *smu, long *input, uint32_t size)
> --
> 2.35.1
>
