Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45518358E34
	for <lists+dri-devel@lfdr.de>; Thu,  8 Apr 2021 22:17:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 644BC6E200;
	Thu,  8 Apr 2021 20:17:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27B5A6E1E0;
 Thu,  8 Apr 2021 20:17:48 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id x2so3504157oiv.2;
 Thu, 08 Apr 2021 13:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GbKRYywPq5lTqQsCGdmRs4HbLi4uvVdVMAoIQiw0/YE=;
 b=XbD/RW/FnbtoAPkniakebko66U6G+Qwa0MElUx/bYeB/yI1VMFNzHysYudOelNxJOa
 duODrLQIYnhnQEUHs962NWQSq9pwDCdB8GPzzEXkmPe/IYwQv86bEnHmAlw9OFRVXk5C
 ajb5DnQBC60HsOVrLNORwe07w5oLUB51hPqz4YfZawEJ3wVXFGTE2M91JAVPORAJshuv
 41X24jeo6ZbFRZwjQsZlOIMqhpyAOWZOkk0geVtTOTj5hnOQ1CR155m2ZbwdphPD97nT
 0lZyU1VthhjJ/vShnJBvXrzQUMKUpw28ZgKvhUdo4wuDGQYHEvlHgVzFkFXfBtRoi2eg
 C+wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GbKRYywPq5lTqQsCGdmRs4HbLi4uvVdVMAoIQiw0/YE=;
 b=iXitKqBy2w8PnItK7Cpv1Jx4Hx6UPvtDXso3C0ZU3EewSzK3+kLmIQWu8ew4MC272y
 tz4VjwRGCTgJOutYbfWXG7MCsVW1oiTs6grNH650DyB9ZBzNUIEtpftztdX8NvilZyJM
 N07ePcZG/oeKfSY3934uca05VFtVmgoTp5JsCofr3MpacwqO3t1ndsa+2e0mxWmr2Hsk
 Gm+OSfeq7Gb9cUPLmPDz4RgQL8egbT3JiT1Y7lFPzYBi6h8WVBUrnqBgpOKTvY4aw/IU
 codR1BC1wu8k39gHfgAF8xhJPe5isLGjyuAvGOnaAcqFoXS/zqyzLyCZL+/7c4g5fHG0
 5e9Q==
X-Gm-Message-State: AOAM530weTbrwkAzvs9ZM1IkBUt8jImr6W0SuxXqaFBb3zf1OL4EnWSL
 pi5gKuEblgSlnlOL8tQ4cw2Y9HQDnGEkyAMbhJw=
X-Google-Smtp-Source: ABdhPJy3iepTkT0luaZ4mGM1ulSQ3NvsRslRZ7CdM0rJ4+5rDwyS0XO+ds+ufIJhqGDT9E04kcyympW6MJzHfe0MiAE=
X-Received: by 2002:aca:4284:: with SMTP id p126mr7497114oia.123.1617913067479; 
 Thu, 08 Apr 2021 13:17:47 -0700 (PDT)
MIME-Version: 1.0
References: <1617765004-5308-1-git-send-email-wangyingjie55@126.com>
In-Reply-To: <1617765004-5308-1-git-send-email-wangyingjie55@126.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 8 Apr 2021 16:17:36 -0400
Message-ID: <CADnq5_OujJOLukc74YQwwW4pdCA-M_4Gz_pZg8Je1ep3HZBBMw@mail.gmail.com>
Subject: Re: [PATCH v1] drm/radeon: Fix a missing check bug in
 radeon_dp_mst_detect()
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
Cc: Dave Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>, Dave Airlie <airlied@redhat.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Wed, Apr 7, 2021 at 2:23 AM <wangyingjie55@126.com> wrote:
>
> From: Yingjie Wang <wangyingjie55@126.com>
>
> In radeon_dp_mst_detect(), We should check whether or not @connector
> has been unregistered from userspace. If the connector is unregistered,
> we should return disconnected status.
>
> Fixes: 9843ead08f18 ("drm/radeon: add DisplayPort MST support (v2)")
> Signed-off-by: Yingjie Wang <wangyingjie55@126.com>
> ---
>  drivers/gpu/drm/radeon/radeon_dp_mst.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_dp_mst.c b/drivers/gpu/drm/radeon/radeon_dp_mst.c
> index 2c32186c4acd..4e4c937c36c6 100644
> --- a/drivers/gpu/drm/radeon/radeon_dp_mst.c
> +++ b/drivers/gpu/drm/radeon/radeon_dp_mst.c
> @@ -242,6 +242,9 @@ radeon_dp_mst_detect(struct drm_connector *connector,
>                 to_radeon_connector(connector);
>         struct radeon_connector *master = radeon_connector->mst_port;
>
> +       if (drm_connector_is_unregistered(connector))
> +               return connector_status_disconnected;
> +
>         return drm_dp_mst_detect_port(connector, ctx, &master->mst_mgr,
>                                       radeon_connector->port);
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
