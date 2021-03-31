Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC733502E5
	for <lists+dri-devel@lfdr.de>; Wed, 31 Mar 2021 17:04:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CD756E1F8;
	Wed, 31 Mar 2021 15:04:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14FE06E1E9;
 Wed, 31 Mar 2021 15:04:15 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id j7so20053969wrd.1;
 Wed, 31 Mar 2021 08:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sJpjvEOXylTWD8gk4HVhiJAi5vhAPJl8XPJPkdBkWAs=;
 b=U0V0vXxP3BRBPRjfD2+v8qzpxEb7sVUFbvzFylEUJvcgotNlbfYIEqJWZtVh1VZ0W+
 XRCtqzGUfHXqEvsnf8h3E5aeHd906ub/u/ny0baK/yI56kvqNQwmSYxC54LNCokDbvH7
 W5yl2xuBDIRdIQYlI7Cg+km42GSXucqLLZZzNEY4RGG5tRwXM/aLFX2mBLJ5D/eahT6X
 ghrpHvJ2opvrV4niT27YTSg4JNcsXOVQ9pSx5Mqcdb6qypjTuHAJw7tigSMuoKrwJ/iQ
 4hAQg53Zg7O/MImQmw2N58e4tPOjpmBLOG15aDMTWMSRTNKKsZZhLbjPrX9dIGrCMySv
 GJPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sJpjvEOXylTWD8gk4HVhiJAi5vhAPJl8XPJPkdBkWAs=;
 b=WBLMQY29kiDGoSGP/JHt0bEYAeTVg4ZlhPbma1daEfZ0O8RIR/UdK3F+Fgq2aZjwme
 3/bhJeD78cbswvdWaX6+KX4jV4oHCs6Mhu1U56m3Q0YjmlwAo54J5gTZnOX1qiqYoOTb
 MznjDF0tjQhEp0i0efzmdwNYg7AtGhYLI11ZyIv8YGm1sFo2g2iHBjGvQ4iFZKoLavpL
 LS8lEuejvJ6czkjDgs/zwbUHS80TzNepUXb4Aex0XK2tHy8cj6gNRAqUwwNqIV5n+92l
 cbxLEqsTDkntRS3cKNIwdKcc74BJ2qouQB4TVscZ3VpueCZ3aAm/NdTOsbjo9jdqTZVn
 XiHw==
X-Gm-Message-State: AOAM533zUUFAEQvJT6etteBmdax3qZ6++QYIy92aYbTgvLvDCPU3gMAD
 xWyk/St40+l0MoQxkbbu34kHQbnbBeCNDToFP2k=
X-Google-Smtp-Source: ABdhPJwtrR1a/PL8Hrw8kp/rnNPC9q7fSlSWrB0Tq6lUIkKrb+lgoBQorl1Rj7gVT0mWqxQaPhVGXCwMqGGDrh8lCWU=
X-Received: by 2002:adf:d0c3:: with SMTP id z3mr4428713wrh.28.1617203053788;
 Wed, 31 Mar 2021 08:04:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210331140223.3771449-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20210331140223.3771449-1-dmitry.baryshkov@linaro.org>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 31 Mar 2021 08:07:38 -0700
Message-ID: <CAF6AEGuqXDPTBnKwfWYmKYjc6Mw-QVkLm7G+Yxxv6sm6JDboWw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: a6xx: fix version check for the A650 SQE
 microcode
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, David Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

fixing Jordan's email so he actually sees this

On Wed, Mar 31, 2021 at 7:02 AM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> I suppose the microcode version check for a650 is incorrect. It checks
> for the version 1.95, while the firmware released have major version of 0:
> 0.91 (vulnerable), 0.99 (fixing the issue).
>
> Lower version requirements to accept firmware 0.99.
>
> Fixes: 8490f02a3ca4 ("drm/msm: a6xx: Make sure the SQE microcode is safe")
> Cc: Akhil P Oommen <akhilpo@codeaurora.org>
> Cc: Jordan Crouse <jcrouse@codeaurora.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index cb2df8736ca8..896b47dc9c85 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -567,17 +567,17 @@ static bool a6xx_ucode_check_version(struct a6xx_gpu *a6xx_gpu,
>         }  else {
>                 /*
>                  * a650 tier targets don't need whereami but still need to be
> -                * equal to or newer than 1.95 for other security fixes
> +                * equal to or newer than 0.95 for other security fixes
>                  */
>                 if (adreno_is_a650(adreno_gpu)) {
> -                       if ((buf[0] & 0xfff) >= 0x195) {
> +                       if ((buf[0] & 0xfff) >= 0x095) {
>                                 ret = true;
>                                 goto out;
>                         }
>
>                         DRM_DEV_ERROR(&gpu->pdev->dev,
>                                 "a650 SQE ucode is too old. Have version %x need at least %x\n",
> -                               buf[0] & 0xfff, 0x195);
> +                               buf[0] & 0xfff, 0x095);
>                 }
>
>                 /*
> --
> 2.30.2
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
