Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA6083699DD
	for <lists+dri-devel@lfdr.de>; Fri, 23 Apr 2021 20:40:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16C736E056;
	Fri, 23 Apr 2021 18:40:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B475E6E056;
 Fri, 23 Apr 2021 18:40:15 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id l17so18747537oil.11;
 Fri, 23 Apr 2021 11:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=j3rbej15nTxekMSQ1d2nQzyOkeUYbiZHxrH9ny0O8Oc=;
 b=aA2xwfEgakU/kmGZNNzcdMQc6wSaL2tS0j/txBQzgMEyVhyWmJmvS2j3S0BZ+7Zx5r
 j8Y/Ir8Ly78Ms2ruYnd6eOU66Dozyanfsy20HpdyeVef0rVRYTucIdfa0IhOLNbnf97O
 0USgHsNSno9Gav/tZs8CSz86aUX7LEGB5Bg0hifGMHXh9lJ9trIVQgQ/MgisiHmeAkv2
 JBVrjaKpYOa0LodQjT+0i2ME6xCW2kSgUBlAYmcJu1X6JlYyuibnUBLRD1EjEg73naxl
 0dM2Ma48nKOsyI95tclJqyyMVfjtu9gEHOdC2zexjM2R5o7B/BLAUf1NhrgSJgrqnKb+
 wc+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=j3rbej15nTxekMSQ1d2nQzyOkeUYbiZHxrH9ny0O8Oc=;
 b=O/2f6lAtyvldcn3VYqAjgA6/1hgtT+VVxVghzqjRXJL9cgFKtOf1o8JWX4Mnhaeaaw
 i91yofAwxGHp39UcecL4weknG+LGsplFiC0q9vvSHEkGXLe9dqCirNKd8/HZrIvGXAOY
 csI27ugKY3+28PUvM86628H6hPfZnBrc4KNVtNM8GPdyWP77vOfeUp4kpU7fZEVHA68X
 J48kQpfL5tdnVs0uvZZY6m1jAeBt4gy4qemBbIF2fYeTuOpIkmMklLzgwe3guTTit311
 cHuR/gzZWktAKJ+FKmwnQSmFo3FftXqZtywDh7RXdmGxug9buDZn5BfOuBgeDBK/MzJu
 yeiQ==
X-Gm-Message-State: AOAM530LA8F+LaWTT/iQDruXS2z7sgMt3Lm9q4r0i3Nr+5MZuXX1W6B7
 oF9T3dQqC4Imf/KuLlTvRht2kNCZ8ZIEU0V+XIo=
X-Google-Smtp-Source: ABdhPJy2XuueP4dPExRWZi8ws1g5uJwd7d1b7YaYrcT24czjaGaQrPADg9hlwDPvVQDxiB1aranscBUKR3TwqAVYnHI=
X-Received: by 2002:aca:c08a:: with SMTP id q132mr4813114oif.5.1619203214988; 
 Fri, 23 Apr 2021 11:40:14 -0700 (PDT)
MIME-Version: 1.0
References: <1617929840-13269-1-git-send-email-wangyingjie55@126.com>
In-Reply-To: <1617929840-13269-1-git-send-email-wangyingjie55@126.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 23 Apr 2021 14:40:04 -0400
Message-ID: <CADnq5_P6=ztTEJ3uC6gnLCcPXUJFJDHLatswcGFD6_iy_rOM+g@mail.gmail.com>
Subject: Re: [PATCH v1] drm/amd/dc: Fix a missing check bug in
 dm_dp_mst_detect()
To: wangyingjie55@126.com
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
Cc: "Tuikov, Luben" <luben.tuikov@amd.com>, Eryk Brol <eryk.brol@amd.com>,
 "Leo \(Sunpeng\) Li" <sunpeng.li@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@linux.ie>, Aurabindo Pillai <aurabindo.pillai@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Wayne Lin <Wayne.Lin@amd.com>,
 "Deucher, Alexander" <alexander.deucher@amd.com>, "Lipski,
 Mikita" <mikita.lipski@amd.com>, Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Thu, Apr 8, 2021 at 9:01 PM <wangyingjie55@126.com> wrote:
>
> From: Yingjie Wang <wangyingjie55@126.com>
>
> In dm_dp_mst_detect(), We should check whether or not @connector
> has been unregistered from userspace. If the connector is unregistered,
> we should return disconnected status.
>
> Fixes: 4562236b3bc0 ("drm/amd/dc: Add dc display driver (v2)")
> Signed-off-by: Yingjie Wang <wangyingjie55@126.com>
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> index 8ab0b9060d2b..103dfd0e9b65 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> @@ -271,6 +271,9 @@ dm_dp_mst_detect(struct drm_connector *connector,
>         struct amdgpu_dm_connector *aconnector = to_amdgpu_dm_connector(connector);
>         struct amdgpu_dm_connector *master = aconnector->mst_port;
>
> +       if (drm_connector_is_unregistered(connector))
> +               return connector_status_disconnected;
> +
>         return drm_dp_mst_detect_port(connector, ctx, &master->mst_mgr,
>                                       aconnector->port);
>  }
> --
> 2.7.4
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
