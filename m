Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D5C4F8481
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 18:04:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4DC810EA56;
	Thu,  7 Apr 2022 16:04:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0253C10E28C;
 Thu,  7 Apr 2022 16:04:33 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id j83so6078226oih.6;
 Thu, 07 Apr 2022 09:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EL8pHj3hP/kpuDq+NWZZhljQXcG1ABgU+pQO9JXOdy4=;
 b=B0m9apwsBYjKnjhDmOFQbfKdnb3YotEIUSHlaXRYjqkz6oDPTyhdz5M0BuV/2rdOJ2
 ebqukW3nwpmA2pqXlnTI3K/18E3Yj9WrW4/xpDeLtHDZelUcO0T+mvOnqQbdkL2dANbd
 +jNxIYdq8+E4YKgqF64oyPX2r5qDj9DMPFxjbQz3xzA/+il0Qi8GciQ7YGq9i78w60mO
 m8Qy7fmISE2uhwv6vSYXAKAM9y5ABcgJFud+A8r8RGJ4Xc8PrGbAOwe78L8ok/JbXDdH
 OEh+S1Tc+TENe9AsVc5SkKkGlxfRkrCOHfSfC/Ap0jxaKjduKr7IJVWSh9f4TVJrUx0K
 U2dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EL8pHj3hP/kpuDq+NWZZhljQXcG1ABgU+pQO9JXOdy4=;
 b=0JyBgLfw/VfsApNTa13ZuMPGk/XXbC6rO0phOFtnedlG2vWB13L9YbFdFwl1yRS61E
 J3rfojBb5SGqWj2yGLqBddUxu2uWeZOFcaKVy0MGwMQ+L7A7jYFfaAJgb/Af/iboIXwm
 /iJmrHaYI5ZxgjyltVl0h3zGrR7Za9GYXLOtZSN2PdBrjHGT0d9v9AQD7kaiRRKQxBwl
 EeDwBM6gdaMc/PzHxu0vBf7PSKLhsV0VkfeDElbYK0OcUg1QdUF7yRFc5cZPV5Xvp0wa
 bfbyzVkY6zMkZieIK+N+PGrcU61wYcPUbYvIwP+PgkC4pHUcoy5mS9GOv/DvGwsUUxGv
 EOwA==
X-Gm-Message-State: AOAM530jY1cl3JNFlM8ia84lAAa8D5IYjozY7JPJOh7VBfaRnp0NRixc
 Y21usG7+LAawlO409iXUwWhEs7aujYlVSZSXLAaaGghg
X-Google-Smtp-Source: ABdhPJzOmyyMsZaVgMTXGelPV4QHuZc7oJmlP4JPcbiVjyaFe7JQmNzF5BMHat66s7/QBNXb2jDAGWf//u7xdkdn67Y=
X-Received: by 2002:a05:6808:2390:b0:2f9:c718:80e0 with SMTP id
 bp16-20020a056808239000b002f9c71880e0mr216061oib.253.1649347473160; Thu, 07
 Apr 2022 09:04:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220407121230.132627-1-kai.heng.feng@canonical.com>
In-Reply-To: <20220407121230.132627-1-kai.heng.feng@canonical.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 7 Apr 2022 12:04:22 -0400
Message-ID: <CADnq5_P7jM8-FCW1i3Lm7MBrWYd2RKsFvBdTJJp1rp6tPdn2tQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Ensure HDA function is suspended before ASIC
 reset
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
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
Cc: David Airlie <airlied@linux.ie>, xinhui pan <Xinhui.Pan@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Solomon Chiu <solomon.chiu@amd.com>, Luben Tuikov <luben.tuikov@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Thu, Apr 7, 2022 at 8:21 AM Kai-Heng Feng
<kai.heng.feng@canonical.com> wrote:
>
> DP/HDMI audio on AMD PRO VII stops working after S3:
> [  149.450391] amdgpu 0000:63:00.0: amdgpu: MODE1 reset
> [  149.450395] amdgpu 0000:63:00.0: amdgpu: GPU mode1 reset
> [  149.450494] amdgpu 0000:63:00.0: amdgpu: GPU psp mode1 reset
> [  149.983693] snd_hda_intel 0000:63:00.1: refused to change power state from D0 to D3hot
> [  150.003439] amdgpu 0000:63:00.0: refused to change power state from D0 to D3hot
> ...
> [  155.432975] snd_hda_intel 0000:63:00.1: CORB reset timeout#2, CORBRP = 65535
>
> The offending commit is daf8de0874ab5b ("drm/amdgpu: always reset the asic in
> suspend (v2)"). Commit 34452ac3038a7 ("drm/amdgpu: don't use BACO for
> reset in S3 ") doesn't help, so the issue is something different.
>
> Assuming that to make HDA resume to D0 fully realized, it needs to be
> successfully put to D3 first. And this guesswork proves working, by
> moving amdgpu_asic_reset() to noirq callback, so it's called after HDA
> function is in D3.
>
> Fixes: daf8de0874ab5b ("drm/amdgpu: always reset the asic in suspend (v2)")
> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> index bb1c025d90019..31f7229e7ea89 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -2323,18 +2323,23 @@ static int amdgpu_pmops_suspend(struct device *dev)
>  {
>         struct drm_device *drm_dev = dev_get_drvdata(dev);
>         struct amdgpu_device *adev = drm_to_adev(drm_dev);
> -       int r;
>
>         if (amdgpu_acpi_is_s0ix_active(adev))
>                 adev->in_s0ix = true;
>         else
>                 adev->in_s3 = true;
> -       r = amdgpu_device_suspend(drm_dev, true);
> -       if (r)
> -               return r;
> +       return amdgpu_device_suspend(drm_dev, true);
> +}
> +
> +static int amdgpu_pmops_suspend_noirq(struct device *dev)
> +{
> +       struct drm_device *drm_dev = dev_get_drvdata(dev);
> +       struct amdgpu_device *adev = drm_to_adev(drm_dev);
> +
>         if (!adev->in_s0ix)
> -               r = amdgpu_asic_reset(adev);
> -       return r;
> +               return amdgpu_asic_reset(adev);
> +
> +       return 0;
>  }
>
>  static int amdgpu_pmops_resume(struct device *dev)
> @@ -2575,6 +2580,7 @@ static const struct dev_pm_ops amdgpu_pm_ops = {
>         .prepare = amdgpu_pmops_prepare,
>         .complete = amdgpu_pmops_complete,
>         .suspend = amdgpu_pmops_suspend,
> +       .suspend_noirq = amdgpu_pmops_suspend_noirq,
>         .resume = amdgpu_pmops_resume,
>         .freeze = amdgpu_pmops_freeze,
>         .thaw = amdgpu_pmops_thaw,
> --
> 2.34.1
>
