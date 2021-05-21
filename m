Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E770E38D075
	for <lists+dri-devel@lfdr.de>; Sat, 22 May 2021 00:02:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96F236E89B;
	Fri, 21 May 2021 22:02:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 384806E89B
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 22:02:27 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id j75so20988121oih.10
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 15:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=BDWzJy96GRZhQjoib8vzzXu2wXMhgadWs9pgCSJ6fsU=;
 b=ZL1P3RcabmCpSMTBuX3Ap/4eI2kv9YvrUkO90pGNBu364b+TOSAymdUKfVrGf2ExT0
 OQamP4ycPJARM/qhO9HKpksIjM9e4rsAEgAseJOvcGiK6n0DzHYpXEsnAa9II2QZAYRQ
 ofOyLBiRQhZLVQUj+hO7yuT6j5jJlnaEPr4XU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=BDWzJy96GRZhQjoib8vzzXu2wXMhgadWs9pgCSJ6fsU=;
 b=WS0NAQtGma61qH7+IQmhVvzDUYmQOrOsBYY0HpDlr/Q6/yD1HVXNMrpWxvrM3Ucgy3
 eZeZXOY0m+cBmYnS4azllfd4MJG+bHkwKRJJhqMyw9vRnJvF+cziiWzDSRU/H2RXyy4o
 oWdmIDLN7MQfe2JsM8Y5jGujodDnPenTG+nJAA9FCh7CMjXo5OysYK7B5dl7wnN0YiuK
 u6So3wPKjtNCliAAk7N34AX3Vo7q6vS0YghE+xvuv7BCrt0FiOXSif8MgeuHRgHryUVf
 k8AE8EG43vb14mLpwuSOtiN91RzD7MM965JTN2PqNN74WgU/kRsGAZ37TY0Txz3hZzZm
 soOg==
X-Gm-Message-State: AOAM5318CqqpzxySpxMZEyuJvKDBvKo8TfV4z+U+lAURcIAXijk86zt/
 avFEUnnlTBIBm+UzSbqkZH9dYlQBocyV8N9B/W86tA==
X-Google-Smtp-Source: ABdhPJxh0vu/e6eESsibJjJILbZzCRD/2LOT2bhTh71e3wvyG25ltZwaMoeOeDpKLlXreBvUibMN9KsYVsL5734xZFA=
X-Received: by 2002:a54:4501:: with SMTP id l1mr3714709oil.19.1621634546583;
 Fri, 21 May 2021 15:02:26 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 21 May 2021 15:02:26 -0700
MIME-Version: 1.0
In-Reply-To: <20210521134516.v2.1.Id496c6fea0cb92ff6ea8ef1faf5d468eb09465e3@changeid>
References: <20210521134516.v2.1.Id496c6fea0cb92ff6ea8ef1faf5d468eb09465e3@changeid>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Fri, 21 May 2021 15:02:26 -0700
Message-ID: <CAE-0n52xEDak4-vuJQ6SQz83F54-oTm+TjeVJ_0GoezG8O_M5Q@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm: Use nvmem_cell_read_variable_le_u32() to read
 speed bin
To: Douglas Anderson <dianders@chromium.org>, Rob Clark <robdclark@gmail.com>
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
Cc: freedreno@lists.freedesktop.org,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Sharat Masetty <smasetty@codeaurora.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>, dri-devel@lists.freedesktop.org,
 Jordan Crouse <jordan@cosmicpenguin.net>, YongQin Liu <yongqin.liu@linaro.org>,
 Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Douglas Anderson (2021-05-21 13:45:50)
> Let's use the newly-added nvmem_cell_read_variable_le_u32() to future
> proof ourselves a little bit.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> The patch that this depends on is now in mainline so it can be merged
> at will. I'm just sending this as a singleton patch to make it obvious
> that there are no dependencies now.
>
> Changes in v2:
> - Rebased
>
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index b4d8e1b01ee4..a07214157ad3 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -1403,10 +1403,10 @@ static int a6xx_set_supported_hw(struct device *dev, struct a6xx_gpu *a6xx_gpu,
>  {
>         struct opp_table *opp_table;
>         u32 supp_hw = UINT_MAX;
> -       u16 speedbin;
> +       u32 speedbin;
>         int ret;
>
> -       ret = nvmem_cell_read_u16(dev, "speed_bin", &speedbin);
> +       ret = nvmem_cell_read_variable_le_u32(dev, "speed_bin", &speedbin);

I missed the review of this API, sorry. I wonder why it doesn't return
the value into an __le32 pointer. Then the caller could use
le32_to_cpu() like other places in the kernel and we know that code is
properly converting the little endian value to CPU native order. Right
now the API doesn't express the endianess of the bits in the return
value because it uses u32, so from a static checker perspective (sparse)
those bits are CPU native order, not little endian.

>         /*
>          * -ENOENT means that the platform doesn't support speedbin which is
>          * fine
