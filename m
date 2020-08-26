Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0470525302A
	for <lists+dri-devel@lfdr.de>; Wed, 26 Aug 2020 15:45:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6C356EA98;
	Wed, 26 Aug 2020 13:45:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CF086EA97;
 Wed, 26 Aug 2020 13:45:24 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id a5so1859859wrm.6;
 Wed, 26 Aug 2020 06:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=++y7/K31LPJngXEb//+paNGMvF79bvnqTxG0ZZl/pyQ=;
 b=HGuzgciRBqpk93tftVYp8/pBWAnJfTd05f9qK3uR5cedrE8qBeZeUKfSEBopDI/bkD
 jJKkw1KbGfmLS6eMSwn8soRusFl+v6czYv98W0Ac6ECtjnskM06BuG+216I+UXiXtNU5
 T0zajnuQOPLN6rub/ottCNDWzAHNI4ij/mLWAmprx2S+85WDSuQgaRraBPNdJR2bVtEF
 hriV2QK/gcK0aANLnSoi+J5WDdySEFXC/kyGGq1W3uEoHnRp4dp+rVORfMByABi/ldwN
 07rEoKOqiZ0HAnlveDS/DYiI6ukKAKfPzEHlwPMTz9zwVfhTzl4fgK5KczRbvpzpJH2l
 cFFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=++y7/K31LPJngXEb//+paNGMvF79bvnqTxG0ZZl/pyQ=;
 b=JII61rX3+qAszpNovkOZi7IHH2Q/wwSO0ETnfUj/sK8zSZ2KlxzwpvlubbAsyC2RRS
 nGWtT0X1ZjLYoX50E9/j5Pm/4npR1t+2AlrrNlG73pc6Bom51VfVB2r0bck3XGYahOQv
 94flW/hkgunxRpRxqxF/qPPD9D7nSX6LPcs1za7GlPg71UR/3sVY+I9FjHTDxEm2QRjS
 h6llRfOZnyu+J4T770KyY7SbqCPYG5k4zpQsxJax7uZfAANRN5TZYv3SwbT/xbzRDID/
 BTMJ7wtJulHUEZBbPE5GnCXJgGpuxy3NFJRIy9EXoZ5fjtyiIx7n7OyeOPe8TZbBfXt8
 Jtfg==
X-Gm-Message-State: AOAM533CO5e/ojJBWwywU+il6dh6d+K4OPsuqnQ2J7q7s7Z54aBEqMG/
 lucUn/XPfhbsw8+/2oyYPdC4ALmaclSSSwnqPAI=
X-Google-Smtp-Source: ABdhPJyWLZf68RNxOWOSnhdQdEdsARIS1o2p7/AZSaEeiSmSPPJ3xUskhAhaxBnxVSxkyAMdrF4A8Zw/JIKcxfqlQNw=
X-Received: by 2002:a5d:6085:: with SMTP id w5mr15374902wrt.362.1598449522813; 
 Wed, 26 Aug 2020 06:45:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200826132501.11564-1-dinghao.liu@zju.edu.cn>
In-Reply-To: <20200826132501.11564-1-dinghao.liu@zju.edu.cn>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 26 Aug 2020 09:45:11 -0400
Message-ID: <CADnq5_NxEGXboksEV61XpixU+Vwj8q9A=cTvz_-BeapwN59+Mw@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Fix memleak in amdgpu_dm_mode_config_init
To: Dinghao Liu <dinghao.liu@zju.edu.cn>
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
Cc: Stylon Wang <stylon.wang@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Kangjie Lu <kjlu@umn.edu>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Roman Li <roman.li@amd.com>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Mikita Lipski <mikita.lipski@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Wed, Aug 26, 2020 at 9:37 AM Dinghao Liu <dinghao.liu@zju.edu.cn> wrote:
>
> When amdgpu_display_modeset_create_props() fails, state and
> state->context should be freed to prevent memleak. It's the
> same when amdgpu_dm_audio_init() fails.
>
> Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index df9338257ae0..2476e40c67ef 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -2834,12 +2834,18 @@ static int amdgpu_dm_mode_config_init(struct amdgpu_device *adev)
>                                     &dm_atomic_state_funcs);
>
>         r = amdgpu_display_modeset_create_props(adev);
> -       if (r)
> +       if (r) {
> +               dc_release_state(state->context);
> +               kfree(state);
>                 return r;
> +       }
>
>         r = amdgpu_dm_audio_init(adev);
> -       if (r)
> +       if (r) {
> +               dc_release_state(state->context);
> +               kfree(state);
>                 return r;
> +       }
>
>         return 0;
>  }
> --
> 2.17.1
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
