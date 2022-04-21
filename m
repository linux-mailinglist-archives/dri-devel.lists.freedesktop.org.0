Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2919C50A217
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 16:22:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C29DF10E641;
	Thu, 21 Apr 2022 14:22:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com
 [IPv6:2001:4860:4864:20::30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2577010E5E8;
 Thu, 21 Apr 2022 14:22:14 +0000 (UTC)
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-e2fa360f6dso5542273fac.2; 
 Thu, 21 Apr 2022 07:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZA1nLvyjkEKFlKU13Ct8Zcggn9No1V/TQja+nO/faEQ=;
 b=ktL17Cj6uxm1d8rlfHQmBEZKLnaSLLe5PpUY2ZqhnghpGiiTh+2K1s49i0J27IO6OP
 bNH73ajK8s32WdPHv4rQDkve1ZTTzunyr07WVpeunELbQajFXtZKjUOMh0vQeKogJV3X
 QmRE0CBsSIy1krXFTtFDOwJIYX9tqBmJYnEISGPOaj98kJz1AGPtWL8pHLx7nxKmTAXE
 StOoQZhEeq1h4Cir209U0ekOW81ntYRvcd3+kcQvhVOrnKsm+fqhG8VqVzsFal0syjzG
 kCtPnwa7aa7Rxoq672eRyaC7lYMRhDoN1XoZeMkua/VPICh3BB3iC/ea5qFG492kuzgF
 a7Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZA1nLvyjkEKFlKU13Ct8Zcggn9No1V/TQja+nO/faEQ=;
 b=5y6C5JKOLFK5w8d4WmihgV+e4lSHs767CVmPWxBpqI1mW0pobxM1S+zviufH4NREj1
 glPB76H0JTXJ9Kq6CTmK6hyYIxf/Tj9G9xMGKZSWy8mDhsIMYlm5tjI1GubGcZHF6Wmb
 uvmXWxyjBHitc4okpwF7WlOnt90baZWfhnZRLE4Cj6a15YgRsAb/OiuACD86aE0klALS
 wMmmX8fg+Ud5R7AjDyA75WNHC0tpLalL2BtoDbBx+wAE/sxjkD4D8oj5+Gj/licTpNnj
 YlQrDJSrY+qt5OsRhdgLQqM3HZy8aVOk3i88WjueumFYI3LDQ6Mh7XkfBOcyB5Cve+DS
 VoGw==
X-Gm-Message-State: AOAM533a29envATJhDwuNwzh0rD0LT/41oBm6QCkvQ+Rft6RR1wMZ8GI
 YZasmnkNOj2NDk5a45iL8L4VFM9c8LJjY9QqzPtbdy7s
X-Google-Smtp-Source: ABdhPJwdcFUTy302SbkU43iy2JjACHiNzRqpLMiYsjwPQr1h9uPJjSSl4frEETdF6Ei3oxMo+vV1SrEPpLOJHi9L4ao=
X-Received: by 2002:a05:6870:311d:b0:de:9b6c:362b with SMTP id
 v29-20020a056870311d00b000de9b6c362bmr3772925oaa.200.1650550933142; Thu, 21
 Apr 2022 07:22:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220421090313.24864-1-linmq006@gmail.com>
In-Reply-To: <20220421090313.24864-1-linmq006@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 21 Apr 2022 10:22:02 -0400
Message-ID: <CADnq5_PawNQThkhwMW4=GY4TOn1DLsvG_zUONYwf0WtGx0i8GA@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Fix memory leak in
 dcn21_clock_source_create
To: Miaoqian Lin <linmq006@gmail.com>
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
Cc: Stylon Wang <stylon.wang@amd.com>, Ilya Bakoulin <Ilya.Bakoulin@amd.com>,
 Angus Wang <angus.wang@amd.com>, Solomon Chiu <solomon.chiu@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Victor Lu <victorchengchi.lu@amd.com>, Melissa Wen <mwen@igalia.com>,
 David Airlie <airlied@linux.ie>, Fangzhi Zuo <Jerry.Zuo@amd.com>,
 Laktyushkin Dmytro <dmytro.laktyushkin@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Isabella Basso <isabbasso@riseup.net>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Thu, Apr 21, 2022 at 5:03 AM Miaoqian Lin <linmq006@gmail.com> wrote:
>
> When dcn20_clk_src_construct() fails, we need to release clk_src.
>
> Fixes: 6f4e6361c3ff ("drm/amd/display: Add Renoir resource (v2)")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
> ---
>  drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c
> index 3fe4bfbb98a0..faab59508d82 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c
> @@ -997,6 +997,7 @@ static struct clock_source *dcn21_clock_source_create(
>                 return &clk_src->base;
>         }
>
> +       kfree(clk_src);
>         BREAK_TO_DEBUGGER();
>         return NULL;
>  }
> --
> 2.17.1
>
