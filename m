Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0122B49900F
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 20:59:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B79F10EA07;
	Mon, 24 Jan 2022 19:59:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91DA810E9FF;
 Mon, 24 Jan 2022 19:59:34 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id
 j38-20020a9d1926000000b0059fa6de6c71so4024177ota.10; 
 Mon, 24 Jan 2022 11:59:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=w+lZqp5VkPjN0faGgSSPKZ3zUhREnNDGIkuhzUCrVAU=;
 b=CSAtIjx4L+ZkJciYlaWlmCBX6UHmUCvw1LCMR3LfRIGvEjh3fERyo+hkCxZVzZVBsC
 CgSeSRBEHJ02dBKUqKVxK6XFAAcuOQ4HPqrhCT0oM/R6lZoVCbPvRX8v0CD5P6hmoT/+
 L58y+kpGl8c7DIBbCzp6UolIERAa6i9T8H7vLoRLfxa3bX0GRY3NSj//B756aVhSNbhp
 G3j4knVTvzCoKjLC++e7sAY/UarFC0XGY1l2esyRVCnHuD+dnsdNaC3fDALkIi4oZvL7
 N/XrfocLShB4Ad0AqhzV2I9DzafUi1yimxXNA6kNHy4Wki4vd57iuwzOA1Hc/MXKK3Uo
 3RpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w+lZqp5VkPjN0faGgSSPKZ3zUhREnNDGIkuhzUCrVAU=;
 b=kDNjcd9DduQ8nf9Lq1cz2Z8QegNgAVizcsoRsuHrQWxM0+dVt//BHryyMaj0ALxUgl
 47lUpny6dMkdVbPHWD2hC1+pfhuw5Xjf8mSkWsVPUotZVhD4R21p2UgmPf+Z15cq43g4
 BiwPdf0NebARbcgA7L9hn/cAWvoAK3QOejxsgOz8CiOe3C9X+babgeBN2f5QiCdBD1Bi
 p9i/ODHTXFkquRAyzVX+w+h4BRnZYXchvuxYa7Iun5iW/lkBPWMozjup0kWkl1IJDEfu
 ccG/mzGAUVLlL7dF9YAu/3svG8SoEI16fqbX46gdPA3kZXVguouGq3iIeOf3VyP0ywp5
 Tjyw==
X-Gm-Message-State: AOAM533+r2Dr1TX7NdHHsfXmmeJoanjjPqaZ1W7YuSR7PbBvrVcpxBDZ
 LtRRnuUcWLEmNyQdvqMCIeO/bFrh7xHwXhdjps4=
X-Google-Smtp-Source: ABdhPJyInPhzcrJLNRrdGV5Euq2uJFvwa+CtjDpOWM0SbP+p9pyHaSW7USbPxxFYzNmwKNu6aqwl8ruO9MIIWHs9TGI=
X-Received: by 2002:a05:6830:1d90:: with SMTP id
 y16mr12820867oti.200.1643054373917; 
 Mon, 24 Jan 2022 11:59:33 -0800 (PST)
MIME-Version: 1.0
References: <20220124165732.56587-1-zhou1615@umn.edu>
In-Reply-To: <20220124165732.56587-1-zhou1615@umn.edu>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 24 Jan 2022 14:59:22 -0500
Message-ID: <CADnq5_P9cnxi27FM6cU1sf1FjkV2sZdHjJciuuDd9ZZ92qyxeg@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Fix a NULL pointer dereference in
 amdgpu_dm_connector_add_common_modes()
To: Zhou Qingyang <zhou1615@umn.edu>
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
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Kangjie Lu <kjlu@umn.edu>,
 Qingqing Zhuo <qingqing.zhuo@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Roman Li <Roman.Li@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Nikola Cornij <nikola.cornij@amd.com>, David Airlie <airlied@linux.ie>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Wayne Lin <Wayne.Lin@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Tony Cheng <Tony.Cheng@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 LKML <linux-kernel@vger.kernel.org>, Jude Shih <shenshih@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Mon, Jan 24, 2022 at 12:05 PM Zhou Qingyang <zhou1615@umn.edu> wrote:
>
> In amdgpu_dm_connector_add_common_modes(), amdgpu_dm_create_common_mode()
> is assigned to mode and is passed to drm_mode_probed_add() directly after
> that. drm_mode_probed_add() passes &mode->head to list_add_tail(), and
> there is a dereference of it in list_add_tail() without recoveries, which
> could lead to NULL pointer dereference on failure of
> amdgpu_dm_create_common_mode().
>
> Fix this by adding a NULL check of mode.
>
> This bug was found by a static analyzer.
>
> Builds with 'make allyesconfig' show no new warnings,
> and our static analyzer no longer warns about this code.
>
> Fixes: e7b07ceef2a6 ("drm/amd/display: Merge amdgpu_dm_types and amdgpu_dm")
> Signed-off-by: Zhou Qingyang <zhou1615@umn.edu>
> ---
> The analysis employs differential checking to identify inconsistent
> security operations (e.g., checks or kfrees) between two code paths
> and confirms that the inconsistent operations are not recovered in the
> current function or the callers, so they constitute bugs.
>
> Note that, as a bug found by static analysis, it can be a false
> positive or hard to trigger. Multiple researchers have cross-reviewed
> the bug.
>
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 7f9773f8dab6..9ad94186b146 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -8143,6 +8143,9 @@ static void amdgpu_dm_connector_add_common_modes(struct drm_encoder *encoder,
>                 mode = amdgpu_dm_create_common_mode(encoder,
>                                 common_modes[i].name, common_modes[i].w,
>                                 common_modes[i].h);
> +               if (!mode)
> +                       continue;
> +
>                 drm_mode_probed_add(connector, mode);
>                 amdgpu_dm_connector->num_modes++;
>         }
> --
> 2.25.1
>
