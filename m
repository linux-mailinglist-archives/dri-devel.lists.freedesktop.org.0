Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0315031D420
	for <lists+dri-devel@lfdr.de>; Wed, 17 Feb 2021 04:03:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CAD66E4AF;
	Wed, 17 Feb 2021 03:03:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A117E6E4AB;
 Wed, 17 Feb 2021 03:03:21 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id t15so15740810wrx.13;
 Tue, 16 Feb 2021 19:03:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=K5+6phUMVFMaRDA3F4TKDcCMWV0Y6SKjytFwuos+eCo=;
 b=N5NMdUkX/SISYBEbo4zogYa+OyoIMfr3kgfB3MAeDQ5I8q6OAdeag2hCtK+P4X/Ph9
 Den0jMO4Ij95BqW3JWmXwXK7r7Li4vZGZEJqDFITh/xQBk2FV97Xkq4jdr7d4vkxXxf5
 Ww8n3z2hpCFxmkx0KQdZv5PCjKnt9wNQCdMSjwcfb1JNGfP4sTU+atKMvF1CJ9/xy2xr
 9dfwRWLbIydH6e86U7Gdh31dFxX4NLKP7V/dz20zNfMohDU28haRs+SlWOsJhgtEE9LS
 T0VCdbab2f1nS5GuKY/NPP4ow7z44GgbKbRwvDzfrDaAHbB4rjS7xxJmeeRXcH8L4c5b
 sWVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K5+6phUMVFMaRDA3F4TKDcCMWV0Y6SKjytFwuos+eCo=;
 b=D4bI6Jz5pSThvOwGTv7pL1gIAFLpQKzN8+9Ex/JPA92GPWkvdp47aCFREtsQppOKNs
 q4q22PwD1yh3IpsWEWSPMzs658RYT/LLdxlRWzDeBH1LKht2nbfjnphR0lSa9TfeupLa
 qwUv95/nv/6j9tMp0XUrBGky0qbUZUUfUxwPckjY575A32Ids+pFrV07HY/zIZcf3Dla
 Rw0S+/jUQX0I3IdU3CLks2CTco1k8ZbufvBm3ZUYJXugmYM1IM3chzjXXhWcqhZaSmJk
 2t7rTiWBAnoHZJku/g08Jmn5apGW0VJGUPG4yWHkfVcRDQUbDUVdujhHvvQ7H2/Ge2z9
 rQlQ==
X-Gm-Message-State: AOAM531OhblkksWBPOTzHWWIi09++ogzP4Q24QtkRuRABR2lEsWSLH28
 hFCIyp/jiMi11YoJ3auxLJl5CKbvD2o+LPTybzM=
X-Google-Smtp-Source: ABdhPJysM4i+VFwS+4UtJ8OqSqZC7ZdIVq6OmnStef7a16sT9kl+pO99M9F3CAk2lUJ2USJ7LmdYJxRJ6PGmb8/Mh24=
X-Received: by 2002:adf:fad2:: with SMTP id a18mr5618297wrs.147.1613531000181; 
 Tue, 16 Feb 2021 19:03:20 -0800 (PST)
MIME-Version: 1.0
References: <20210216200909.19039-1-jonathan@marek.ca>
In-Reply-To: <20210216200909.19039-1-jonathan@marek.ca>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 16 Feb 2021 19:06:12 -0800
Message-ID: <CAF6AEGv53nnzqMgTfSA6t2YpHx1dDW8UqnH9Gw0w3p8bf0mTLw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/a6xx: fix for kernels without CONFIG_NVMEM
To: Jonathan Marek <jonathan@marek.ca>, Akhil P Oommen <akhilpo@codeaurora.org>
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
Cc: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 David Airlie <airlied@linux.ie>, freedreno <freedreno@lists.freedesktop.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 16, 2021 at 12:10 PM Jonathan Marek <jonathan@marek.ca> wrote:
>
> Ignore nvmem_cell_get() EOPNOTSUPP error in the same way as a ENOENT error,
> to fix the case where the kernel was compiled without CONFIG_NVMEM.
>
> Fixes: fe7952c629da ("drm/msm: Add speed-bin support to a618 gpu")
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index ba8e9d3cf0fe..7fe5d97606aa 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -1356,10 +1356,10 @@ static int a6xx_set_supported_hw(struct device *dev, struct a6xx_gpu *a6xx_gpu,
>
>         cell = nvmem_cell_get(dev, "speed_bin");
>         /*
> -        * -ENOENT means that the platform doesn't support speedbin which is
> -        * fine
> +        * -ENOENT means no speed bin in device tree,
> +        * -EOPNOTSUPP means kernel was built without CONFIG_NVMEM

very minor nit, it would be nice to at least preserve the gist of the
"which is fine" (ie. some variation of "this is an optional thing and
things won't catch fire without it" ;-))

(which is, I believe, is true, hopefully Akhil could confirm.. if not
we should have a harder dependency on CONFIG_NVMEM..)

BR,
-R

>          */
> -       if (PTR_ERR(cell) == -ENOENT)
> +       if (PTR_ERR(cell) == -ENOENT || PTR_ERR(cell) == -EOPNOTSUPP)
>                 return 0;
>         else if (IS_ERR(cell)) {
>                 DRM_DEV_ERROR(dev,
> --
> 2.26.1
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
