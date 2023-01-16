Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2CF66CE22
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 18:58:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 323C610E47F;
	Mon, 16 Jan 2023 17:58:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com
 [IPv6:2001:4860:4864:20::36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7706210E47B;
 Mon, 16 Jan 2023 17:58:48 +0000 (UTC)
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-12c8312131fso29614822fac.4; 
 Mon, 16 Jan 2023 09:58:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=vgfXRILltDL8S4th3YYjCyiGREYlV3Wzl8EokshqMNY=;
 b=FHCujPFf3hVg/9eX5RypYIWhrfc+BxPlhn0Ye/kcvv6zEBXYT9qt8hLZnv18d2mz8o
 EjEs6I1t45nZRfcAdAW/5wHuo9CCG4XtYfjm6EVDOnv7ySS7xNBlGvj4nDRefeCrVWxC
 5gCI9/1E/+REHC+SBXVMzrj2PYK1nnoOAT4S526A3rIFsdWqw/zsBuG4Ba7UOVoi9IP9
 +QRB9ATxf5RVJPastXYGgVZZrfpnMt0sI16NFx6sxDlvYydCHpWyrxY4d6VFGu9a54TU
 PjmO5PhzDw3sJujpM9Vvom4PCkqp2mncX7o7LOpyH/twytvYH7HoHoZOhrDkU9XkdYRM
 F0og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vgfXRILltDL8S4th3YYjCyiGREYlV3Wzl8EokshqMNY=;
 b=Ep492uoJo8HCpmrlMJlJImz7IYI/fUcN/vEdiTvEjg6Wpy066nSfS/AGga3Lhffka2
 aBwxYiqc1MU+RSlWc9ZTiOpxf7UBdMNePvgoISxZNDIYQdX8SYe+XpmdolNChdZKr2w/
 cnNWaodO5XxaOR5lIXVvZQdRKOIWdptrwloOfb1FBnLW5mrrbypaGvpwW+tbq7YnX9z9
 Hxsr0vpNrfLZxRLcU3ZDb2UFXZDJlJgby99l5CjLw5ZFO9GxxdDKnuxC95WPCS5+iDUg
 B0z6IuVX8CcgpvEfiVOlHwREUAkWHWMRYRfo5eQ1E0woXXr3ZL+cTuTUY9tDqom70cKu
 hJLQ==
X-Gm-Message-State: AFqh2kqCLpwLbmYIOfEJ0Eq++9tqe1HNXhrE+A8tioyS8OD77RmvgpRi
 O90cpaZ06iWpERAF2CJ36NBF8qq2HG2Ac/+ppog=
X-Google-Smtp-Source: AMrXdXvxUWNEueQOsZDzqdCgqeJ4gzqa9d6KCdyrfPanU1F9Nty4mte0rlSM9c7THwdnA/vkAXlHCW5oZYmAohu9szg=
X-Received: by 2002:a05:6870:7a18:b0:15f:5509:9a0d with SMTP id
 hf24-20020a0568707a1800b0015f55099a0dmr53155oab.46.1673891927813; Mon, 16 Jan
 2023 09:58:47 -0800 (PST)
MIME-Version: 1.0
References: <Y8PIId1k1TmIAo18@ubun2204.myguest.virtualbox.org>
In-Reply-To: <Y8PIId1k1TmIAo18@ubun2204.myguest.virtualbox.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 16 Jan 2023 12:58:36 -0500
Message-ID: <CADnq5_OpLW77PqMi=-OYg=wam5FgFvB3CbFZHbPpotPo9G6Uiw@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: avoid variable reinitialization
To: Deepak R Varma <drv@mailo.com>
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
Cc: Saurabh Singh Sengar <ssengar@microsoft.com>, Leo Li <sunpeng.li@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org,
 Praveen Kumar <kumarpraveen@linux.microsoft.com>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is already fixed.

Thanks,

Alex

On Sun, Jan 15, 2023 at 4:32 AM Deepak R Varma <drv@mailo.com> wrote:
>
> The member variable set_odm_combine is already initialized and hence the
> reinitialization instruction can be removed. Issue identified using the
> dubleinit.cocci Coccinelle semantic patch script.
>
> Signed-off-by: Deepak R Varma <drv@mailo.com>
> ---
>  drivers/gpu/drm/amd/display/dc/dcn314/dcn314_optc.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_optc.c b/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_optc.c
> index 41edbd64ea21..777d8efee977 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_optc.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_optc.c
> @@ -254,7 +254,6 @@ static struct timing_generator_funcs dcn314_tg_funcs = {
>                 .get_hw_timing = optc1_get_hw_timing,
>                 .init_odm = optc3_init_odm,
>                 .set_odm_bypass = optc314_set_odm_bypass,
> -               .set_odm_combine = optc314_set_odm_combine,
>                 .set_h_timing_div_manual_mode = optc314_set_h_timing_div_manual_mode,
>  };
>
> --
> 2.34.1
>
>
>
