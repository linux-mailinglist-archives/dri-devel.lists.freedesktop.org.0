Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F743C9CA0
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jul 2021 12:29:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E4A16E529;
	Thu, 15 Jul 2021 10:29:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEC656E529
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jul 2021 10:29:19 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id z9so5765338iob.8
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jul 2021 03:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kyAUEtVezo404CIhWOUhgzbjRjPd8h5hzpJdBeSKQTA=;
 b=MgSlsyn3Nhbd3AUpNvhT2NNSOEuryc1QPty6/CeUj7ZT/L8YGN9vfY/5WhcT8oFpLq
 +ZzDbI1DcXeY1bi612mypZhwKG1kbXlZuvQJEuYfkNWtHqrj196LtO9j93x2Xlo8GWk/
 P2pJZFPwBtHM27073EVY13e4IEJ+71ppA5W2M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kyAUEtVezo404CIhWOUhgzbjRjPd8h5hzpJdBeSKQTA=;
 b=gQokkACGJVNaN5oEl49IWptj2vYAT7dCeF2wGqa0yi+fnM9C7edK1iDgx0Vfqtaf6p
 9pjiJZLLxCutATOZK8t10Z7s2aFTOIfU0Gxf+EZ3ScPgV+8iCcb03BorLiFpgd763PUF
 a36QuCmY6+Scw+tsDoWzP4A/j8JO91/xH6izoNe9ya4gsY5ZdNKy9rrf0KdWG6kFeJjF
 zGicQyV8q2UN9MMaswgLFgeba99oYzK5mbYJgCQ+a7rKUMWFVbK2LrbWSDIr4/qXznab
 xRn7r3hB4mkpjXezk49rUSdmPet3WqX/i03aHGU419J8NLiYkZRFCXFOhy8aj/JdF5VO
 ZkNQ==
X-Gm-Message-State: AOAM533udWj8fpKYt9QE4B5owXzj9SRWy65PPXeRTBuQBzCaa90Itpmq
 KH2bq0oYBYTyt8W62hpywKB4UxP2glbr6Y66sIW5tA==
X-Google-Smtp-Source: ABdhPJw2mxWU+xXAkJO3mI+OX6znH1/i0GZ7cnWBtNO+Lv/xTP1hKsZ7ryl5bIuMk2imtrZIb2VbdDupmxJUEhRymko=
X-Received: by 2002:a02:cce6:: with SMTP id l6mr3377311jaq.114.1626344959355; 
 Thu, 15 Jul 2021 03:29:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210712080736.116435-1-linux@fw-web.de>
In-Reply-To: <20210712080736.116435-1-linux@fw-web.de>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Thu, 15 Jul 2021 18:28:53 +0800
Message-ID: <CAJMQK-i9cGUUXLDr95nCghLd6jmR0tmdPv_PiyN1gC1+JD-2Mw@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: dpi: fix NULL dereference in
 mtk_dpi_bridge_atomic_check
To: Frank Wunderlich <linux@fw-web.de>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jitao Shi <jitao.shi@mediatek.com>,
 Frank Wunderlich <frank-w@public-files.de>, David Airlie <airlied@linux.ie>,
 lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Rex-BC Chen <rex-bc.chen@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 12, 2021 at 4:08 PM Frank Wunderlich <linux@fw-web.de> wrote:
>
> From: Frank Wunderlich <frank-w@public-files.de>
>
> bridge->driver_private is not set (NULL) so use bridge_to_dpi(bridge)
> like it's done in bridge_atomic_get_output_bus_fmts
>
> Fixes: ec8747c52434 ("drm/mediatek: dpi: Add bus format negotiation")
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

Tested-by: Hsin-Yi Wang <hsinyi@chromium.org>

Tested on a mt8183 device.


> ---
>  drivers/gpu/drm/mediatek/mtk_dpi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
> index bced555648b0..a2eca1f66984 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -605,7 +605,7 @@ static int mtk_dpi_bridge_atomic_check(struct drm_bridge *bridge,
>                                        struct drm_crtc_state *crtc_state,
>                                        struct drm_connector_state *conn_state)
>  {
> -       struct mtk_dpi *dpi = bridge->driver_private;
> +       struct mtk_dpi *dpi = bridge_to_dpi(bridge);
>         unsigned int out_bus_format;
>
>         out_bus_format = bridge_state->output_bus_cfg.format;
> --
> 2.25.1
>
>
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
