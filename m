Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 002723CA202
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jul 2021 18:10:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7F806E884;
	Thu, 15 Jul 2021 16:10:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 875486E87E;
 Thu, 15 Jul 2021 16:10:12 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id u15so7239863oiw.3;
 Thu, 15 Jul 2021 09:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6c3zyMYOnu8f5V0VEW0ba+C0gb8GX+p+9qHajQ6vagk=;
 b=ky2omVb78fdTIgHSoV6mfHrwbcyGxVRmdbWzk6MLrtzpjB+9YIZzxHelwVAd3LKV+Q
 UFfn8+ds8zYXDUtMiGqgx84L44tIlAoRVa+N5bFrVFkWHb75GKPrhJ4j8FuZ7lfPnKOH
 +pg0qcn15QrD/RSLV4aTO1lDeB0xnh/5ly3iKrn/mRauK97lweuJU1NKYaygj+qSpn4P
 nFMMlBRguz6x3SapXagwLr4hg4RS+OFC0uGStRO3oCLY6ybHJ2Hlk04guFvmj7UDN1av
 bhMM5oKTtP47NEZGDVj5rgKq+9RbecBcmQMnTknECHpOxLIagKTGkInBHvzAIK1G6Kow
 QbKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6c3zyMYOnu8f5V0VEW0ba+C0gb8GX+p+9qHajQ6vagk=;
 b=SbNiqPsDQ2pBWYEVIjnCH/3basxEwtAEDQg/zb3CpuBxODE/VU3s4kgLIX7x8lNFcf
 9J/JvIKnF+Td1Z3ugDjuTbLIy+Y8hz4Za6Kl7msFbrbtcT1SbM8/pgkMv9bUNhW2TDkw
 i84R6tTKLi0ezrd/Vj9V5+k957gBZ38gMUGP2s1xzAqfJRhgCeZ0rLbBgTdowGFmevFo
 He/V8rGiFPoPxOnHxF7rEOvdJYyvQOur93PC6QFilweApwWwlr3z9eBj3YWAkBv+lWbF
 cZRCsuMSFspWdShgmpaLn55oOdPIfTpNS3dNqwH9sRgH/TYhQPSfv55oue2ddbGHHLii
 FbBQ==
X-Gm-Message-State: AOAM530EvJ18SQ7F1HTa7/rduenKvqo5O/B/Oo5TBrMzPsLwqJ486p9U
 Zfu21J/xcguLJHp7M1N0u5o0DOYX1WtUjMfX1N8=
X-Google-Smtp-Source: ABdhPJzEq72ZaeVqWHRV9xBl988kk8YBBxczyWyRPiiSGDCmqJSum/5U8fkHz6YIoJumevbUrAXhI5T4FOdLnqOhd9c=
X-Received: by 2002:aca:ac15:: with SMTP id v21mr8249953oie.5.1626365411814;
 Thu, 15 Jul 2021 09:10:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210714080652.113381-1-liviu@dudau.co.uk>
In-Reply-To: <20210714080652.113381-1-liviu@dudau.co.uk>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 15 Jul 2021 12:10:01 -0400
Message-ID: <CADnq5_OA-em2jM-vmwaM7xxycOS-18EPC0r_myb7REy9b4h_vA@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Fix 10bit 4K display on CIK GPUs
To: Liviu Dudau <liviu@dudau.co.uk>
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
Cc: Leo Li <sunpeng.li@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 14, 2021 at 4:15 AM Liviu Dudau <liviu@dudau.co.uk> wrote:
>
> Commit 72a7cf0aec0c ("drm/amd/display: Keep linebuffer pixel depth at
> 30bpp for DCE-11.0.") doesn't seems to have fixed 10bit 4K rendering over
> DisplayPort for CIK GPUs. On my machine with a HAWAII GPU I get a broken
> image that looks like it has an effective resolution of 1920x1080 but
> scaled up in an irregular way. Reverting the commit or applying this
> patch fixes the problem on v5.14-rc1.
>
> Fixes: 72a7cf0aec0c ("drm/amd/display: Keep linebuffer pixel depth at 30bpp for DCE-11.0.")
> Signed-off-by: Liviu Dudau <liviu@dudau.co.uk>

Harry or Mario any ideas?  Maybe we need finer grained DCE version
checking?  I don't remember all of the caveats of this stuff.  DCE11
and older is getting to be pretty old at this point.  I can just apply
this if you don't have any insights.

Alex

> ---
>  drivers/gpu/drm/amd/display/dc/core/dc_resource.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
> index a6a67244a322e..1596f6b7fed7c 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
> @@ -1062,7 +1062,7 @@ bool resource_build_scaling_params(struct pipe_ctx *pipe_ctx)
>          * so use only 30 bpp on DCE_VERSION_11_0. Testing with DCE 11.2 and 8.3
>          * did not show such problems, so this seems to be the exception.
>          */
> -       if (plane_state->ctx->dce_version != DCE_VERSION_11_0)
> +       if (plane_state->ctx->dce_version > DCE_VERSION_11_0)
>                 pipe_ctx->plane_res.scl_data.lb_params.depth = LB_PIXEL_DEPTH_36BPP;
>         else
>                 pipe_ctx->plane_res.scl_data.lb_params.depth = LB_PIXEL_DEPTH_30BPP;
> --
> 2.32.0
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
