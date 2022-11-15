Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9843B629C92
	for <lists+dri-devel@lfdr.de>; Tue, 15 Nov 2022 15:49:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 780E010E40A;
	Tue, 15 Nov 2022 14:48:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5377710E407;
 Tue, 15 Nov 2022 14:48:53 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 p8-20020a056830130800b0066bb73cf3bcso8606935otq.11; 
 Tue, 15 Nov 2022 06:48:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=UFKvegKpCUAO6MgZ/qzUV5hf5B11JezYYr9cZvWjkGQ=;
 b=lKzjf5PXGe1Bn+JDJFa1vd+nY6OQBXZFoKJXJ+Dt2SNQ7jHIw9sikj2GLcQuwqUARp
 OgfE8JlG7I/T6As9/B6qcn6ULrr9G53J+EzyqY70Y+lhsNs4vBwf2ElG7HhNPTmXlB2j
 67wcR/h+f6Oi56Y4TgY5iy7hBQqe2hJlVlhtznXNt7UjBnDqG05o5mA95EVX6z871MfS
 xvH67f2miDXhEfMdz+o6DSPWDFZgoG/1VFXrMX6F+pSl8FvWBvF01uEL8yFtQxTTcDtU
 nr6NsbpuVs8NcUm+GSRf0rXGMpQfdkqZIOfSWcwQJkCrxTvhRPEchN11fqg+AuqTZexh
 YmhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UFKvegKpCUAO6MgZ/qzUV5hf5B11JezYYr9cZvWjkGQ=;
 b=yAA+NLjZ6iVEQeIwVXaH0jOv+JblOytEKoaEIdTg0Sv9Q1gfEKJd9OQwVQa5ttCLO7
 Z6c6sGktzjyXVhWJ/6s+hk4c0hfP+pIRAQzPOyBOwmQrkFDnSLgCJm3V9700rmXCkQ2P
 COINPq2K5XA7FWKJBk8k+KBI9HMfj7ynUTE+VkMXGIcztyyo6/KXnDcuV+8fqFaFb5NA
 IIZqrvcublpDUmmdfoVmSZUAYNdJLpqKFL7u/GYzj6f8Z/IgxQ5bm8TuQYpeMLPyoc1j
 Uhn5sjD6UF7/Mnq1j9ABXlH7LQ3cwpKUGwtvUHyUVy9dEFAQA7qfsTZLpNmogfPc7OXF
 Gn2Q==
X-Gm-Message-State: ANoB5pkvzeRF2LjZDw0NJbO1pLTIBfVBbkgMus9uFkZZBw5BI4Law3He
 amCwqVeehbJkU1xfLIl8mVlkHHhkYXjiVPoYkKTQoV6v
X-Google-Smtp-Source: AA0mqf6fH/OmE1T3AB8Xx8ZsS8OzjaOPOa5/oK9LHJqmJMOjs3vfJYbmREd7PWHSZrBtVST7xciWzhewYsjrOIooCFs=
X-Received: by 2002:a9d:32f:0:b0:66c:7982:2d45 with SMTP id
 44-20020a9d032f000000b0066c79822d45mr8876027otv.123.1668523732619; Tue, 15
 Nov 2022 06:48:52 -0800 (PST)
MIME-Version: 1.0
References: <Y2ZH2FPSuX/msEL1@kili>
In-Reply-To: <Y2ZH2FPSuX/msEL1@kili>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 15 Nov 2022 09:48:41 -0500
Message-ID: <CADnq5_Pmv54SoFRgYWF90GTE9vJ3PScqN2z1a=AUm_omFLo_9Q@mail.gmail.com>
Subject: Re: [PATCH] amdgpu/pm: prevent array underflow in
 vega20_odn_edit_dpm_table()
To: Dan Carpenter <error27@gmail.com>
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>, kernel-janitors@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Darren Powell <darren.powell@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 Lang Yu <lang.yu@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Tue, Nov 15, 2022 at 7:57 AM Dan Carpenter <error27@gmail.com> wrote:
>
> In the PP_OD_EDIT_VDDC_CURVE case the "input_index" variable is capped at
> 2 but not checked for negative values so it results in an out of bounds
> read.  This value comes from the user via sysfs.
>
> Fixes: d5bf26539494 ("drm/amd/powerplay: added vega20 overdrive support V3")
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> ---
>  drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_hwmgr.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_hwmgr.c b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_hwmgr.c
> index 97b3ad369046..b30684c84e20 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_hwmgr.c
> +++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_hwmgr.c
> @@ -2961,7 +2961,8 @@ static int vega20_odn_edit_dpm_table(struct pp_hwmgr *hwmgr,
>                         data->od8_settings.od8_settings_array;
>         OverDriveTable_t *od_table =
>                         &(data->smc_state_table.overdrive_table);
> -       int32_t input_index, input_clk, input_vol, i;
> +       int32_t input_clk, input_vol, i;
> +       uint32_t input_index;
>         int od8_id;
>         int ret;
>
> --
> 2.35.1
>
