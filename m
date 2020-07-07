Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47243216FC3
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jul 2020 17:12:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C92F86E07D;
	Tue,  7 Jul 2020 15:12:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC8B96E07D;
 Tue,  7 Jul 2020 15:12:16 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id z13so45553255wrw.5;
 Tue, 07 Jul 2020 08:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9gOopT7I1OsIRVZ7gP8eL3IBFb1IUCjqvEssUF76BG4=;
 b=pMBw7q2CFOQfGmvkpqC/zFRqxOWQ1b7p2+cEAWcF3mCdub5F2Ib4bRWeyCUg8D9e/p
 OGctjFDilSnopnt9CwMBPoMjshPumFWLq+24vUZa/F+8z0eQcB5V125GtWHS7J8FCBAi
 olXgEecpuFIpgRHSivW/kY39xGYXlGu1D5YAZkaMvByYxB0WBPXJX21Iay/n/zfvv5B1
 XGan0uHFhRQj6e7e1PtHNfloLwBgxjg7XKveppNjrMStBeWdP3RUa9AbGRv90xmUTNf+
 daK4lBDjMHXd+pKrdwj5T7auAYljz+YtqyjZCcarbyAW5kreekC8mDfKzY3A4oDORsMc
 MWQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9gOopT7I1OsIRVZ7gP8eL3IBFb1IUCjqvEssUF76BG4=;
 b=P9GSJKsASGtltoN3rrMZsUpzg6X/iLrPo1Sfh4Wgck9GRhs0nFwTn8KxFFjt7VMI21
 k2UAMSXwO7FHBbYl0DAQi80pcHAwJ4FVJhOHGzhnhzNHB8oDaWFif3D2H8j5csD+s10g
 5yzA+RXXRyk/+si873sSc9rBtx8cZk5Fuw9Z8B6pYxa4PDSBdyHZ/RAzvBgBuKhOWBwD
 t0d435OLRxhVqgzAG07fKdpaVUyA9zOry2gl0urW5gDlWBeByFSSfsyGfsM7ruzcHelf
 Swg0gfEn2zWuMqjnLuB9x7Bs2/6nCHelhz/OkzDcid8FfE+l/uYNp5rSNlc5CVpAJfVD
 jS8A==
X-Gm-Message-State: AOAM530HoU0itMfgNJW0SX6aBewUMV37e17Xlx5vjRGj/hRGXFfxdUkL
 X32ufquuR9VwtKxeCO9Qf7jRTkOJxY/K4YEvX14=
X-Google-Smtp-Source: ABdhPJzyL7Ci3JIid8hEd7ueUZ+ZnZ09+gKP6KqRip8QlXnvviomlhUgfqgfQEoWKehK4g+kzJ1CJo+batzFSMZXVBI=
X-Received: by 2002:adf:dd8d:: with SMTP id x13mr53383056wrl.362.1594134735494; 
 Tue, 07 Jul 2020 08:12:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200706122857.27661-1-trix@redhat.com>
In-Reply-To: <20200706122857.27661-1-trix@redhat.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 7 Jul 2020 11:12:04 -0400
Message-ID: <CADnq5_PZEg=tW1Nku_=g4FDbL2qXBf=xz9JuFik0fAR3_SSffQ@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon: fix double free
To: trix@redhat.com
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
Cc: Dave Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Mon, Jul 6, 2020 at 8:29 AM <trix@redhat.com> wrote:
>
> From: Tom Rix <trix@redhat.com>
>
> clang static analysis flags this error
>
> drivers/gpu/drm/radeon/ci_dpm.c:5652:9: warning: Use of memory after it is freed [unix.Malloc]
>                 kfree(rdev->pm.dpm.ps[i].ps_priv);
>                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/radeon/ci_dpm.c:5654:2: warning: Attempt to free released memory [unix.Malloc]
>         kfree(rdev->pm.dpm.ps);
>         ^~~~~~~~~~~~~~~~~~~~~~
>
> problem is reported in ci_dpm_fini, with these code blocks.
>
>         for (i = 0; i < rdev->pm.dpm.num_ps; i++) {
>                 kfree(rdev->pm.dpm.ps[i].ps_priv);
>         }
>         kfree(rdev->pm.dpm.ps);
>
> The first free happens in ci_parse_power_table where it cleans up locally
> on a failure.  ci_dpm_fini also does a cleanup.
>
>         ret = ci_parse_power_table(rdev);
>         if (ret) {
>                 ci_dpm_fini(rdev);
>                 return ret;
>         }
>
> So remove the cleanup in ci_parse_power_table and
> move the num_ps calculation to inside the loop so ci_dpm_fini
> will know how many array elements to free.
>
> Fixes: cc8dbbb4f62a ("drm/radeon: add dpm support for CI dGPUs (v2)")
>
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  drivers/gpu/drm/radeon/ci_dpm.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/ci_dpm.c b/drivers/gpu/drm/radeon/ci_dpm.c
> index 86ac032275bb..ba20c6f03719 100644
> --- a/drivers/gpu/drm/radeon/ci_dpm.c
> +++ b/drivers/gpu/drm/radeon/ci_dpm.c
> @@ -5563,6 +5563,7 @@ static int ci_parse_power_table(struct radeon_device *rdev)
>         if (!rdev->pm.dpm.ps)
>                 return -ENOMEM;
>         power_state_offset = (u8 *)state_array->states;
> +       rdev->pm.dpm.num_ps = 0;
>         for (i = 0; i < state_array->ucNumEntries; i++) {
>                 u8 *idx;
>                 power_state = (union pplib_power_state *)power_state_offset;
> @@ -5572,10 +5573,8 @@ static int ci_parse_power_table(struct radeon_device *rdev)
>                 if (!rdev->pm.power_state[i].clock_info)
>                         return -EINVAL;
>                 ps = kzalloc(sizeof(struct ci_ps), GFP_KERNEL);
> -               if (ps == NULL) {
> -                       kfree(rdev->pm.dpm.ps);
> +               if (ps == NULL)
>                         return -ENOMEM;
> -               }
>                 rdev->pm.dpm.ps[i].ps_priv = ps;
>                 ci_parse_pplib_non_clock_info(rdev, &rdev->pm.dpm.ps[i],
>                                               non_clock_info,
> @@ -5597,8 +5596,8 @@ static int ci_parse_power_table(struct radeon_device *rdev)
>                         k++;
>                 }
>                 power_state_offset += 2 + power_state->v2.ucNumDPMLevels;
> +               rdev->pm.dpm.num_ps = i + 1;
>         }
> -       rdev->pm.dpm.num_ps = state_array->ucNumEntries;
>
>         /* fill in the vce power states */
>         for (i = 0; i < RADEON_MAX_VCE_LEVELS; i++) {
> --
> 2.18.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
