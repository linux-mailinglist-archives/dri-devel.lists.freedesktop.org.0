Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1FF1207738
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jun 2020 17:19:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 735EF6EB8D;
	Wed, 24 Jun 2020 15:19:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00D416E0EC;
 Wed, 24 Jun 2020 15:19:28 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id j94so2709620wrj.0;
 Wed, 24 Jun 2020 08:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Py6R13MD/ALi+lmKz+0wD4Voo520rKERVOmYa94FmgM=;
 b=WHMmhLBrGsTKq8yguQB2bjx3E8JorBYdumZsxQYbxblYDAb8jiPDC9IByepKx+eccf
 A5h7Tlqxva0/EkSd32fHC2vvXjDnYlQw4RseSVvOxbp7Juf4pL7awzGRSAf9IzCzGIDM
 CPee79NMTwFDmyScJR/rHTnO+4ExhnAmEuTlQWu21xxH34an6xtftGYQLJGfuzsCr002
 MKZ21DNsuBIYBUKHkN0jphHx0ASZun96Ch6VbyQ109D59xnKGMvdJDqX8uVfq/OSqWcl
 S1rXrgUcmvjggtekDWmBBge8j7P7zTP1+3dUem26Xg5YY488gkAkSSBhNTni+U/DZFRv
 UWWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Py6R13MD/ALi+lmKz+0wD4Voo520rKERVOmYa94FmgM=;
 b=P/3UAHKkw2/MbvM1qIu+M8cW4T/j5XacVlUL7vI3NOryjRSe3jsz1D7iXk6DoqcBbT
 X4YG12LDQdOeXC6kEhANkOpm9h3fDvSVAtepwWY8c4AkqeBAV0jY4D6Mq9j2uqTFiQ0b
 noO3qjlegJE9AezUfk6YGiye+lVyAEWOuu+r1IZ9MtDywkI6I+ZHZyIC7/BeftfBvY7u
 eEqsG7gEKAmYy9DNa1EIvSPFCxLpJgmzIqKhWxwydSSqNCPZuxyFtbn1zsMyWOOwgnz7
 wdpeocYA7HZdaUqiDcdVg5EbyW+KqDs/UAB01sDqauoblFY0BGSSUgBgFyI9LUXL4kAG
 raZQ==
X-Gm-Message-State: AOAM530rPP8ZzBaaJO3YPkmD3ngbuApo+97SbDP4OzGWVWfQ7CqfSnoA
 cDSSGPR+M9HzM4aH3NpB8U+SUvjctmK5pkOPWz0=
X-Google-Smtp-Source: ABdhPJzkiAB8rak7/EF7xQt5xkZIsOH0iRZ9o4lt3W5kLDwG6kLpL6P22IQui3lFLPjKWXPAPlyPVqKx8E1Jd9qgHCc=
X-Received: by 2002:a5d:6a46:: with SMTP id t6mr4633910wrw.374.1593011967560; 
 Wed, 24 Jun 2020 08:19:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200624120710.10957-1-colin.king@canonical.com>
In-Reply-To: <20200624120710.10957-1-colin.king@canonical.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 24 Jun 2020 11:19:16 -0400
Message-ID: <CADnq5_NGQzU6rrrqO4iXTHPSxpAt-w0ayxfrS0jj3K8u38f3hg@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon: fix array out-of-bounds read and write issues
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
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Wed, Jun 24, 2020 at 8:07 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> There is an off-by-one bounds check on the index into arrays
> table->mc_reg_address and table->mc_reg_table_entry[k].mc_data[j] that
> can lead to reads and writes outside of arrays. Fix the bound checking
> off-by-one error.
>
> Addresses-Coverity: ("Out-of-bounds read/write")
> Fixes: cc8dbbb4f62a ("drm/radeon: add dpm support for CI dGPUs (v2)")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/gpu/drm/radeon/ci_dpm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/radeon/ci_dpm.c b/drivers/gpu/drm/radeon/ci_dpm.c
> index 134aa2b01f90..86ac032275bb 100644
> --- a/drivers/gpu/drm/radeon/ci_dpm.c
> +++ b/drivers/gpu/drm/radeon/ci_dpm.c
> @@ -4351,7 +4351,7 @@ static int ci_set_mc_special_registers(struct radeon_device *rdev,
>                                         table->mc_reg_table_entry[k].mc_data[j] |= 0x100;
>                         }
>                         j++;
> -                       if (j > SMU7_DISCRETE_MC_REGISTER_ARRAY_SIZE)
> +                       if (j >= SMU7_DISCRETE_MC_REGISTER_ARRAY_SIZE)
>                                 return -EINVAL;
>
>                         if (!pi->mem_gddr5) {
> --
> 2.27.0
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
