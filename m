Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E428415EF7
	for <lists+dri-devel@lfdr.de>; Thu, 23 Sep 2021 14:56:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFBF76ED08;
	Thu, 23 Sep 2021 12:56:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com
 [IPv6:2607:f8b0:4864:20::c2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8294A6E120;
 Thu, 23 Sep 2021 12:56:39 +0000 (UTC)
Received: by mail-oo1-xc2a.google.com with SMTP id
 h11-20020a4aa74b000000b002a933d156cbso2111131oom.4; 
 Thu, 23 Sep 2021 05:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GVXu7kjSXu+P/8oGmOO5Kp7VFy7hdCAFq/98GJCuVfU=;
 b=gNu2dzSvL+TfeLTj9hs9GpoKvriXkgOe2vM7Mq4Y/HBCJ5pWQxL5fr7L72Ldx2188w
 7J5iYp7gQGXBOZ7wkPQ2OZs9ItXBkJLc1aEWmsmxt0w9NzRjq1qNdgt6p+u1zEkQ8UPe
 nMjuluGGLMbjtUtl8a3Y2yC50cwpeZQSVQEf6eG96KAWm5TmGxgT4xJocX40XSBPVadp
 hoehV+YiPiKZ62wihEw7M4U6+m57nFpOwkJDK4xgHOQX6T4tBn4FJSCLfxHJtrUtAk7W
 Utj0Ao8MRe0YkU1+bdUZ9A+3wZLWDigymvsvav6IcU+cOaNJBWQpte+NyF3Fg6EvsZ9S
 F/SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GVXu7kjSXu+P/8oGmOO5Kp7VFy7hdCAFq/98GJCuVfU=;
 b=zKttTldw+k4HhNltGGl6yoi7EvuJ+1NVjtc00UJX6E+NfNj7NeCm1kTXLt8/EHKq5J
 A+foc/e/S45YuRuyjiTTLcrinS+BJmGikwoGSjZglnaeO1/xW3Fvt2d+WhI/bfgKFDcd
 CHaHxbsmKFQBhw5c7Kp0rsHknr+7uX6o+ir7I6BU3D0SteexEn9wnBDqkLqhrqX41/kF
 NjRGoNERWqX6W8hEvhRWAo3ZUr+Q2s2CqqWH40I1Hjov1A6A8STL1AdZzx9a3J8OIPkj
 lCD57qsh/wjVloMI+eRpK9rO+FE2MD32u+4Pc27ZBPd0B0MhidS+UjEqO0jpJN3c/fU7
 C60Q==
X-Gm-Message-State: AOAM530kdKeSsHJiOlE8sfOtwyX1deRBh8fHqJsFvYlGsoAt2+aZDCO+
 G6W0dxtwdaKKk3EtWm2rFATJqgCFdy0ULkhz9u+LpVDVk08=
X-Google-Smtp-Source: ABdhPJw+itN2funATMJjYzrnvfLukCJ8KMynQKVWLKTfPY1S5tVJl6kJS4XE4j70X9EfHKNEdRDb3ebGSnBXHlVTSxc=
X-Received: by 2002:a4a:d794:: with SMTP id c20mr3562114oou.23.1632401798852; 
 Thu, 23 Sep 2021 05:56:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210923090232.61559-1-yipeng.chen@amd.com>
In-Reply-To: <20210923090232.61559-1-yipeng.chen@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 23 Sep 2021 08:56:27 -0400
Message-ID: <CADnq5_Put1U-X8MBS4Gpxo2zkkyNCS6yum+X3q+H-30xNn31_A@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Fix randomly flicking on overlay with
 enabled ABM
To: yipeng.chen@amd.com
Cc: "Wentland, Harry" <harry.wentland@amd.com>,
 "Leo (Sunpeng) Li" <sunpeng.li@amd.com>, 
 "Deucher, Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>, 
 Dave Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 Qingqing Zhuo <qingqing.zhuo@amd.com>, "Cyr, Aric" <Aric.Cyr@amd.com>, 
 Anson Jacob <Anson.Jacob@amd.com>, Bindu Ramamurthy <bindu.r@amd.com>,
 Martin Tsai <martin.tsai@amd.com>, 
 bing.guo@amd.com, roy.chan@amd.com, George Shen <george.shen@amd.com>, 
 Joshua Aberback <joshua.aberback@amd.com>,
 Ashley Thomas <Ashley.Thomas2@amd.com>, Jing.Zhou@amd.com, 
 dale.zhao@amd.com, amd-gfx list <amd-gfx@lists.freedesktop.org>, 
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Roman Li <Roman.Li@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 23, 2021 at 5:03 AM <yipeng.chen@amd.com> wrote:
>
> From: "Yipeng Chen (Jasber)" <yipeng.chen@amd.com>
>
> [Why]
> Enabled ABM (level != 0) would raise short pluse irq DC_IRQ_SOURCE_HPD1RX
> randomly with PSR error LINK_CRC_ERROR. Actually there is no hot plugging
> on EDP panel. After correcting CRC error, there is no need to send drm
> hotplug event.
>
> [How]
> Returning false would skip doing hot-plug when handle_hpd_irq_psr_sink()
> handled irq. Hot-plug process causes visible flicking on overlay.
>
> Signed-off-by: Yipeng Chen (Jasber) <yipeng.chen@amd.com>
> Reviewed-by: Roman Li <Roman.Li@amd.com>
>              Anthony Koo <Anthony.Koo@amd.com>

Each reviewer should be called out on a separate line E.g.,
Reviewed-by: Roman Li <Roman.Li@amd.com>
Reviewed-by: Anthony Koo <Anthony.Koo@amd.com>



> ---
>  drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
> index 1e4794e2825c..9b9fbe5e9bd4 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
> @@ -3007,7 +3007,7 @@ bool dc_link_handle_hpd_rx_irq(struct dc_link *link, union hpd_irq_data *out_hpd
>
>         if (handle_hpd_irq_psr_sink(link))
>                 /* PSR-related error was detected and handled */
> -               return true;
> +               return false;
>
>         /* If PSR-related error handled, Main link may be off,
>          * so do not handle as a normal sink status change interrupt.
> --
> 2.25.1
>
