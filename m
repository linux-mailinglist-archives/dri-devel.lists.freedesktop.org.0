Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 339DA993DD4
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2024 06:15:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60B6310E456;
	Tue,  8 Oct 2024 04:15:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="kAeVgn+o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAF3E10E456
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2024 04:15:41 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-5369f1c7cb8so5465117e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Oct 2024 21:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1728360940; x=1728965740;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hsgypzMnr8s549OvOvjEHy3rmXs4vBQB+7vyfPc71L0=;
 b=kAeVgn+oEpVaqiw5qjlcSAgjYtiawteeB4W7Gs34VNCRjjcgDbG2cH5P0YhWqQGJtf
 emOPZq1gJNo/EzUQznuLG6CoB+hLyPRSwzI2unGgVrrbT09W0OejXkeXxACRvT+C1qYT
 tNv/8XqjxS8odB61CcHfVENl7/ZS1hxV/l/6o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728360940; x=1728965740;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hsgypzMnr8s549OvOvjEHy3rmXs4vBQB+7vyfPc71L0=;
 b=p9JlltZvt5I3IfnJn6mQAu/eSa0W96ineqA4F2WS5SgnSHrTkkDQkHImSy/UafGdMK
 As4Ed6fQwSDi89F17zUzhTdkLT65D5Qvrp2cME0AWtcc5r3dA5JdpoKld4AGiTRhbfAp
 2sscl5a7CtK7Ni7A8rK8NYkWM8Zc3zFdOl/rxc/9sSv/lNVRxq/YuD5GqgbXCUpM1H/R
 Mr9AuwCQlsyvA3CqMzjEtAMOYHuwWiOrAMuGFX/SxfkKPrdVAALEscF1/nMHKDTFTxyH
 Eh3Vce+BDmHeoMPOvFMB2UjE0ivrHDhFTaKN5h76agsNf8NVlWLGJD8dlhzsauE64Voj
 /RRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVG2qQjA8VJflCoBYl/L4TRmxtx3kmvcrIPGaFxSiAiw7zUaQfz6/JBjQMzERxRcjBEW4LWn3Mfsnk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx0M+oNZjVRsEpwtYKk+HBzdglpyeI3e7IvB/QcIP83DsDwC1es
 Umrvqj/2BMqV0B+UijQVPku42HX8AxP/mcMiNabcloD7fEQ8S0wI6/UocQFk4Po5uH5dI7NI/sf
 xZ8v6FMSymFRH8jEvrJZu0Fo6IT+R1DureF13
X-Google-Smtp-Source: AGHT+IH5L+vBThATfCj0naB/bXXgVGLsu0H6B6nI/GfouA1KFBjppbhu47esWrYoxk0NZzfhr9MWJDBe2RWeLpV4zC0=
X-Received: by 2002:a05:6512:308f:b0:539:986e:cd68 with SMTP id
 2adb3069b0e04-539ab9ec4eemr6211095e87.60.1728360939666; Mon, 07 Oct 2024
 21:15:39 -0700 (PDT)
MIME-Version: 1.0
References: <20241007070101.23263-1-jason-jh.lin@mediatek.com>
In-Reply-To: <20241007070101.23263-1-jason-jh.lin@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 8 Oct 2024 12:15:28 +0800
Message-ID: <CAGXv+5GzmWhs1ZiNtty1eH2h9n7bw-EeAdZQvXaBLMUA5cUuzg@mail.gmail.com>
Subject: Re: [PATCH v9 0/5] Fix degradation problem of alpha blending series
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 7, 2024 at 3:01=E2=80=AFPM Jason-JH.Lin <jason-jh.lin@mediatek.=
com> wrote:
>
> Some SoCs do not support the ignore_pixl_alpha flag, which breaks the
> XRGB8888 format. Some SoCs do not support pre-multiplied pixel formats
> and extending configuration of OVL pre-multiplied color formats,
> such as MT8173.
>
> Fix the SoC degradation problem by this sreies.

The series fixes the display color issue on MT8173. Tested on Hana
Chromebook (Telesu).

Tested-by: Chen-Yu Tsai <wenst@chromium.org>

> ---
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
