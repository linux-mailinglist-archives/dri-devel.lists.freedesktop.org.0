Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1900993EFE
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2024 08:53:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 191B110E477;
	Tue,  8 Oct 2024 06:53:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="T/dWIzL8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03A2010E474
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2024 06:53:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E3D935C2120
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2024 06:52:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9A99C4CED2
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2024 06:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728370382;
 bh=8/XrZOiutGrNVfzxdCVlvuRXAbgLZqz/eQQNTr69Dhg=;
 h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
 b=T/dWIzL8G2sCBSY3Oarm8UDDVD81suXyJ9Vi4Y9dPR6sg6wHxHU7SWfuHcjumV9dg
 KUmfvp7R+BLgu1EpPZuzzWH7a+Ct51ItHv6OKu0xG4ZA3uCe6xZCMoWh7u0RBrUDD5
 HIoCfQpMCxBytp2mD+KG+G02+1MP2fS2Lrz71l5XpLDvC3sYLaEaqsL6A1CBC/iVwK
 +B+LhRwEjsVEdVVBVqS8ArObFOAFSh6tvlEXcL+rsUzhMDpz5XTMuWXjku/uzGxCA9
 0lEviRrMRIA5eJwMYXZaiklYNGq/5aZ7bSLn8t39GjcSvLKqxTAsNjGUfqTjDJFerK
 F1t1aXjGbG4AQ==
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-2facaa16826so44714891fa.0
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Oct 2024 23:53:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCV5UiCmHA6Bl4vlXfyaQDAUGHS4MliUXzAVkHTZuNZ1dwicQRuTGpKTp1Zr1Z/1mCoP+wTk0M+392k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzcxDXiFK2O8ovTGrq+8df1oWgCwdF6FRJsNjM8hdZ29lQ0wt72
 /O95kKYmEiHZZQ1glYXWgwwPTSvktnp5iNT7KNTuRrrdTSfU2FxCAU46bIB41vzTWmdovn5WywI
 Sq9VOeUAKdOhOVwKC3y93jKABdAA=
X-Google-Smtp-Source: AGHT+IHs6ZuxTGNeVEYBhXtHENAWeVj6HUp8shHbQF/6a4rtVBPvdu1/EZNXgt2K8EdIcuhc0j5T0Psz/O4jsy1NTP4=
X-Received: by 2002:a05:651c:210e:b0:2f9:cf64:aaf6 with SMTP id
 38308e7fff4ca-2faf3c30324mr64563851fa.17.1728370381142; Mon, 07 Oct 2024
 23:53:01 -0700 (PDT)
MIME-Version: 1.0
References: <20241008064716.14670-1-jason-jh.lin@mediatek.com>
In-Reply-To: <20241008064716.14670-1-jason-jh.lin@mediatek.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 8 Oct 2024 14:52:48 +0800
X-Gmail-Original-Message-ID: <CAGb2v67qnJ=ZNYziKe_4WU9KeMUpWLsOn2uoze1FLq4mH8m7Rw@mail.gmail.com>
Message-ID: <CAGb2v67qnJ=ZNYziKe_4WU9KeMUpWLsOn2uoze1FLq4mH8m7Rw@mail.gmail.com>
Subject: Re: [PATCH v10 0/5] Fix degradation problem of alpha blending series
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
Cc: Adam Thiede <me@adamthiede.com>,
 Yassine Oudjana <yassine.oudjana@gmail.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shawn Sung <shawn.sung@mediatek.com>,
 Alper Nebi Yasak <alpernebiyasak@gmail.com>, 
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Reply-To: wens@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 8, 2024 at 2:47=E2=80=AFPM Jason-JH.Lin <jason-jh.lin@mediatek.=
com> wrote:
>
> Some SoCs do not support the ignore_pixl_alpha flag, which breaks the
> XRGB8888 format. Some SoCs do not support pre-multiplied pixel formats
> and extending configuration of OVL pre-multiplied color formats,
> such as MT8173.
>
> Fix the SoC degradation problem by this sreies.

Tested-by: Chen-Yu Tsai <wenst@chromium.org>

> ---
>
> Change in v10:
> 1. Fix the commit message and comment for OVL_CON_AEN

Please carry tested-by tags from people for cosmetic changes such as this.

> Change in v9:
> 1. Add the fix patch for the XRGB8888 downgrade issue of MT8173
> 2. Add the refine patch for ignore_pixel_alpha statement
>
> Change in v8:
> Remove blend_modes for not supported pre-multiplied SoCs to fix the
> return error from drm_plane_create_blend_mode_property().
>
> Change in v7:
> 1. Add the remove color format comment patch for OVL
> 2. Fix warning: 'const' type qualifier on return type has no effect
>
> Chnage in v6:
> 1. Use blend_modes instead of function pointer in OVL
> 2. Use ethdr instead of mdp_rdma to get blend_modes
> 3. Add 0 checking for adding blend_mode property for mtk_plane
>
> Change in v5:
> Add fix patch for mtk_plane
>
> Change in v4:
> Add lost cases of mtk_ovl_fmt_convert_with_blend
>
> Change in v3:
> Change MACRO approach to function pointer in driver data
>
> Change in v2:
> Fix build error and typo
>
> Change in v1:
> Add fix patch for OVL unsupport color format settings by driver data
>
> ---
>
> Jason-JH.Lin (5):
>   drm/mediatek: ovl: Fix XRGB format breakage for blend_modes
>     unsupported SoCs
>   drm/mediatek: ovl: Refine ignore_pixel_alpha comment and placement
>   drm/mediatek: ovl: Remove the color format comment for
>     ovl_fmt_convert()
>   drm/mediatek: ovl: Add blend_modes to driver data
>   drm/mediatek: Add blend_modes to mtk_plane_init() for different SoCs
>
>  drivers/gpu/drm/mediatek/mtk_crtc.c           |  1 +
>  drivers/gpu/drm/mediatek/mtk_ddp_comp.c       |  2 +
>  drivers/gpu/drm/mediatek/mtk_ddp_comp.h       | 10 +++
>  drivers/gpu/drm/mediatek/mtk_disp_drv.h       |  2 +
>  drivers/gpu/drm/mediatek/mtk_disp_ovl.c       | 70 ++++++++++++++-----
>  .../gpu/drm/mediatek/mtk_disp_ovl_adaptor.c   |  7 ++
>  drivers/gpu/drm/mediatek/mtk_ethdr.c          |  7 ++
>  drivers/gpu/drm/mediatek/mtk_ethdr.h          |  1 +
>  drivers/gpu/drm/mediatek/mtk_plane.c          | 15 ++--
>  drivers/gpu/drm/mediatek/mtk_plane.h          |  4 +-
>  10 files changed, 92 insertions(+), 27 deletions(-)
>
> --
> 2.43.0
>
