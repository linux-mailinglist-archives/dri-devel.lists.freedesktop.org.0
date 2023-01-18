Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E70A67200A
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 15:46:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37CF110E75E;
	Wed, 18 Jan 2023 14:46:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 496CF10E6F6;
 Wed, 18 Jan 2023 14:46:45 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id s66so28136891oib.7;
 Wed, 18 Jan 2023 06:46:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=2v9rowf1iOtrujUFxIVI27nUO9c6hi0orZbEtBDtO/M=;
 b=RiTvi1RHWMX4c6XlVOeyMO7S6RAS5f2WU6zsA/UGcpaW130MNfsdXcoLlx7onWaUhP
 SRJ1N2i9KpPz1Lp0jgkiD57q7pftHnEEEbgtkBYp1y0gzvuIhgRYby267RrejZFBzmWC
 /UTFHXdiiEFYnE4iWfEAJeyDeA9aNJCUVect/acyDt3LEJMw7CWqavwRSm3lxqVnPcQ5
 v7BzVVZxNVuyoeIg5q22Lj9W4CsiMQ7FdSc6/gxt0h1DxNkrPmP01wOp9+AK8X8VuLOw
 w9UT3U+9fUXr2zIJDDVO5l+MzIlEtcTsuMdDOMyOOOPulJUSn3CkoEtOZqZGFo4a4Vqz
 u+iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2v9rowf1iOtrujUFxIVI27nUO9c6hi0orZbEtBDtO/M=;
 b=0ew/aTbvzqgh47HwdEgoXzCpT+h6Uy3Akzyb9YFA831yGlmRZjc3x7COTROyBvOpQh
 i6YQXSjcBTuyVGzM/9pqGL1TjsKzJplmMOktZefnd3TQEST3dr6uOG9gsS1YxeLKxnkF
 mKE3Fl/4N72iICNFGLqJZpXdvuLkRniCFmul8Ntu28YnwBM1YxhOeuR2e0qzDHvGur35
 aLM7tmDsR4KIO2oV4X3SEOTU882JusKC9DHg6O/Ki1Pn66T6lPRo5JtTyg505HfVWhVl
 j/qLM1lwLc6z7wY9bCh1mNPtIsWunUHb3Q3sLs8lZ7q8PLJEq9n/evsP00vUhF4fIt5O
 tjRg==
X-Gm-Message-State: AFqh2krfYfTfJCCnq1TTeTX3IJT7p9kozDAQEN25p/ZSI7cymHd97xhn
 jyh4lfCycjezK95oRKtkJ2NgVoNI3y/qrTMLABY=
X-Google-Smtp-Source: AMrXdXtf0gUATG4daazGEOzCExkSfUC1Svy0l6u6xTtUUGc31RHzPBYgKtydw/UIG2EkUxMh9AU98ll54TZrTKB8tAc=
X-Received: by 2002:a05:6808:4387:b0:35b:d93f:cbc4 with SMTP id
 dz7-20020a056808438700b0035bd93fcbc4mr423280oib.96.1674053204483; Wed, 18 Jan
 2023 06:46:44 -0800 (PST)
MIME-Version: 1.0
References: <20230118101107.10173-1-nicuborta123@gmail.com>
In-Reply-To: <20230118101107.10173-1-nicuborta123@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 18 Jan 2023 09:46:32 -0500
Message-ID: <CADnq5_PuWM2Cz7a8-q8GFVMrXHVOSP-pXSQ1QY1pRQDuU=KwBg@mail.gmail.com>
Subject: Re: [PATCH] amd/dcn20: Fix high mem clock with multiple displays
To: Nicu Borta <nicuborta123@gmail.com>
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
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 18, 2023 at 5:43 AM Nicu Borta <nicuborta123@gmail.com> wrote:
>
> On RX5000 series GPUs, using a high refresh rate monitor causes the VRAM to
> always stay at the highest clock (according to AMD, this is done to prevent
> flickering).
>
> However, when using 2 monitors (e.g. one at 165Hz and another at 60Hz), then
> disconnecting the high refresh monitor, before this patch the VRAM clock didn't
> decrease like it should.
>
> This patch fixes that bug, and now, when disconnecting the high refresh rate
> monitor, the VRAM clock jumps to the minimum.
>
> Tested for a few months, I haven't noticed any visual artifacts or other errors
> (RX5700XT).
>

This has been enabled and disabled several times in the past due to
stability issues with multiple monitors reported by a number of users.
Please see commit:

commit bcfab8e35ce81e2fd3230c1575024bfde0d28c8b
Author: Alex Deucher <alexander.deucher@amd.com>
Date:   Thu Feb 3 10:04:58 2022 -0500

    drm/amdgpu/display: change pipe policy for DCN 2.0

    Fixes hangs on driver load with multiple displays on
    DCN 2.0 parts.

    Bug: https://bugzilla.kernel.org/show_bug.cgi?id=215511
    Bug: https://gitlab.freedesktop.org/drm/amd/-/issues/1877
    Bug: https://gitlab.freedesktop.org/drm/amd/-/issues/1886
    Fixes: ee2698cf79cc ("drm/amd/display: Changed pipe split policy
to allow for multi-display pipe split")
    Reviewed-by: Harry Wentland <harry.wentland@amd.com>
    Signed-off-by: Alex Deucher <alexander.deucher@amd.com>

I would suggest following up on those bug reports to see if those
users are still experiencing stability issues when changing this.

Alex

> Signed-off-by: Nicu Borta <nicuborta123@gmail.com>
> ---
>  drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
> index 8a0dd0d7134b..481a15b02126 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
> @@ -714,7 +714,7 @@ static const struct dc_debug_options debug_defaults_drv = {
>                 .timing_trace = false,
>                 .clock_trace = true,
>                 .disable_pplib_clock_request = true,
> -               .pipe_split_policy = MPC_SPLIT_AVOID_MULT_DISP,
> +               .pipe_split_policy = MPC_SPLIT_DYNAMIC,
>                 .force_single_disp_pipe_split = false,
>                 .disable_dcc = DCC_ENABLE,
>                 .vsr_support = true,
> --
> 2.38.2
>
