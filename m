Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E68358291C
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jul 2022 16:55:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A0ED935AF;
	Wed, 27 Jul 2022 14:55:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97B689357A;
 Wed, 27 Jul 2022 14:55:25 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id z22so21712273edd.6;
 Wed, 27 Jul 2022 07:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WrAxAwQvWkNvn9iTR8AvgTpHQwZ7heaV6m22/yIWhK0=;
 b=Q0T1JN9hd9Oi1QPMQUOoi3FKjamneDsM2FMlfalCMAcLaxJrnG/um/ftBNacBz+jY4
 1VD4bzLO2cYhyiAQ0hGYxcoEmPSbJw6SoOE4DzNGODp0C92jX+77TLJ37R6bT5uUKkZh
 VdmRqYiGh/Ghe070Tad3H67U+plMcZ3BBjwC7GZDNnyv4ycuy7hZoq0IMRGOeYVqm1bm
 VuQCxIUUP9aa7EQCyOA1tXxfxUw/VbPmbo/415UyjDE6Y8XBXRbvEUS8whW4nG3sf684
 a3lKhKnVEoTlndTbusm9wbRzg0wgziQ1lnW1C+cSOzyggWIV4QjrcHzuZ1XSSSbG8CRB
 3FJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WrAxAwQvWkNvn9iTR8AvgTpHQwZ7heaV6m22/yIWhK0=;
 b=aX78D3DdSUdcvGJinKJaSjFE6s7faApnpwU87znQ01hjdwQv7NxiXpMRbYdu7onbmI
 An0ydZ2YP7QRHZUrjR4DU7o6dm+N8lRjdGoIo7aY1dzphzl5c+9YXnaCftk6Br/xRB5U
 l34fwKGPlcErqCtBHxEMuF+lb+DQQqF8Ikjrm4p+ihBzb5DK56YY9G8YT734gY3qry7E
 msPk4io3d4d4JHsi6zenhUII6NQqyXrcYGOGAmQ5KrXEGyxIrVWjGx90IagNeL/Q0i1h
 HKJodPcSv0E0tUE/KWhdb6lZc5KKb5/1AoUhADV2f0Pe1DzQvI8/bvPL+cPvl3NeGv0P
 OHAg==
X-Gm-Message-State: AJIora/NPTlgLdxv9zZDn5HaDnOQ7PfztaYUftphE3sj8fkDSNIWaP1P
 cE14tJY+KxLhZt3ie+tXBiBPn8g2Oj3IZaXD9x0I/XLp
X-Google-Smtp-Source: AGRyM1v0BqXlMXy1WlRwkM9yfv7uDOAHmzaEtW9pVP6NfvUnezvmE61b1xrJzvro6l2dJmmnl6FJVKd2IeFoCa5Tpew=
X-Received: by 2002:a05:6402:500e:b0:43b:6f0:756b with SMTP id
 p14-20020a056402500e00b0043b06f0756bmr24034075eda.221.1658933724075; Wed, 27
 Jul 2022 07:55:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220727144249.415228-1-Vijendar.Mukunda@amd.com>
In-Reply-To: <20220727144249.415228-1-Vijendar.Mukunda@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 27 Jul 2022 10:55:12 -0400
Message-ID: <CADnq5_PKjmNw+bAPCyDu_G=yNQcpJSpFd+EVzNwfNWzig8apFw@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: fix i2s_pdata out of bound array access
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
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
Cc: Sunil-kumar.Dommati@amd.com, David Airlie <airlied@linux.ie>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, open list <linux-kernel@vger.kernel.org>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dan.carpenter@oracle.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 27, 2022 at 10:42 AM Vijendar Mukunda
<Vijendar.Mukunda@amd.com> wrote:
>
> Fixed following Smatch static checker warning:
>
>     drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c:393 acp_hw_init()
>     error: buffer overflow 'i2s_pdata' 3 <= 3
>     drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c:396 acp_hw_init()
>     error: buffer overflow 'i2s_pdata' 3 <= 3
>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c | 8 --------
>  1 file changed, 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c
> index bcc7ee02e0fc..6d72355ac492 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c
> @@ -390,14 +390,6 @@ static int acp_hw_init(void *handle)
>                 i2s_pdata[2].i2s_reg_comp1 = ACP_BT_COMP1_REG_OFFSET;
>                 i2s_pdata[2].i2s_reg_comp2 = ACP_BT_COMP2_REG_OFFSET;
>
> -               i2s_pdata[3].quirks = DW_I2S_QUIRK_COMP_REG_OFFSET;
> -               switch (adev->asic_type) {
> -               case CHIP_STONEY:
> -                       i2s_pdata[3].quirks |= DW_I2S_QUIRK_16BIT_IDX_OVERRIDE;
> -                       break;
> -               default:
> -                       break;
> -               }

Is this actually not used or should we just increase the allocation size?

Alex

>                 adev->acp.acp_res[0].name = "acp2x_dma";
>                 adev->acp.acp_res[0].flags = IORESOURCE_MEM;
>                 adev->acp.acp_res[0].start = acp_base;
> --
> 2.25.1
>
