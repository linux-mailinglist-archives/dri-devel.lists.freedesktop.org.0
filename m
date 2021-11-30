Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B04462D9B
	for <lists+dri-devel@lfdr.de>; Tue, 30 Nov 2021 08:39:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 063DF6EC29;
	Tue, 30 Nov 2021 07:39:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E37A6EE23
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 07:39:10 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id r25so17558218edq.7
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Nov 2021 23:39:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tna3JPKRhWY1uP0rsupBuba16Q1n89Qg33bMQyE+rfw=;
 b=W3TDq8BSpAjmm2cg7aSRA29YAH82BOy+ZOxfR4yyOuyP0QO2I3dd2MT0Iw/pQEiSFW
 jqYk7tKOoeRyhrcQIbS6II8y1cAah32QpzQ9n/HCgEifysPHzso9AAAKpSsXBXXbiLWi
 Nr2CnNz1IX0VC7vp8+/oOH4B3R0TncAoHaDsg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tna3JPKRhWY1uP0rsupBuba16Q1n89Qg33bMQyE+rfw=;
 b=icmAIB3+l+5KN0hEvQwb8duLcbNYPYukLjPFNaYXcZk1VojqwjkBHG9TU5nRUqzlug
 /GPwuOqLk6L5ZHUduot1dBWN3NJBc2vV+o1LrukxJg8yyttLdKoVSpxJzg1pWiOcd3QH
 +0ykcutvDXnLJJV65ESwcgn4Fxdk7YfX/oQd4XcrirYipqSP459VNmW8RKlsTFmW5YRI
 czAwGsrJoCeywtf18tK62iaURKQXXpWVeEVQe/dM9gWrAFr9Ucjo0vaIWMCu5uXtngMV
 JqILJmvrB8tcu2bwG+NgTX+3RhRsswRMxewqy6rjLhFF+VlenRn+qBXzp/m0j/gJlT/I
 0AEQ==
X-Gm-Message-State: AOAM531Na+UWunU8Ow5RXtcnqcDTIfI3zBlZDpMr0y4Apq1F97LheUmg
 gfUpT21D2Hgj3UNMwQCnqPvHUc6XOGHH1uleIjp26gt8+D8=
X-Google-Smtp-Source: ABdhPJyvFBMkasn5akObf5bg3IXw2Ui+pvjGrejGeGmB2kfl2QwndmOA0FUs6kErURgqcBJIMLwObeqDMWrQhb9V2/c=
X-Received: by 2002:a17:907:6d28:: with SMTP id
 sa40mr64638869ejc.201.1638257948621; 
 Mon, 29 Nov 2021 23:39:08 -0800 (PST)
MIME-Version: 1.0
References: <20211126101518.938783-1-kieran.bingham+renesas@ideasonboard.com>
 <20211126101518.938783-5-kieran.bingham+renesas@ideasonboard.com>
In-Reply-To: <20211126101518.938783-5-kieran.bingham+renesas@ideasonboard.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Tue, 30 Nov 2021 13:08:57 +0530
Message-ID: <CAMty3ZA3rTqkPtmC2yBq8zSExGd9jRjOPR06tpt2fB_AXHRxdQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] drm: rcar-du: mipi-dsi: Support bridge probe ordering
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
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
Cc: linux-renesas-soc@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Kieran,

On Fri, Nov 26, 2021 at 3:45 PM Kieran Bingham
<kieran.bingham+renesas@ideasonboard.com> wrote:
>
> The bridge probe ordering for DSI devices has been clarified and further
> documented in
>
> To support connecting with the SN65DSI86 device after commit c3b75d4734cb
> ("drm/bridge: sn65dsi86: Register and attach our DSI device at probe"),
> update to the new probe ordering to remove a perpetual -EPROBE_DEFER
> loop between the two devices.
>
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> ---
>  drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c | 48 +++++++++++++------------
>  1 file changed, 26 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
> index 833f4480bdf3..f783bacee8da 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
> @@ -639,6 +639,8 @@ static int rcar_mipi_dsi_host_attach(struct mipi_dsi_host *host,
>                                         struct mipi_dsi_device *device)
>  {
>         struct rcar_mipi_dsi *dsi = host_to_rcar_mipi_dsi(host);
> +       struct drm_panel *panel;
> +       int ret;
>
>         if (device->lanes > dsi->num_data_lanes)
>                 return -EINVAL;
> @@ -646,12 +648,36 @@ static int rcar_mipi_dsi_host_attach(struct mipi_dsi_host *host,
>         dsi->lanes = device->lanes;
>         dsi->format = device->format;
>
> +       ret = drm_of_find_panel_or_bridge(dsi->dev->of_node, 1, 0, &panel,
> +                                         &dsi->next_bridge);
> +       if (ret) {
> +               dev_err_probe(dsi->dev, ret, "could not find next bridge\n");
> +               return ret;
> +       }
> +
> +       if (!dsi->next_bridge) {
> +               dsi->next_bridge = devm_drm_panel_bridge_add(dsi->dev, panel);
> +               if (IS_ERR(dsi->next_bridge)) {
> +                       dev_err(dsi->dev, "failed to create panel bridge\n");
> +                       return PTR_ERR(dsi->next_bridge);
> +               }
> +       }

Can we use the new function devm_drm_of_get_bridge instead of the entire code?

Jagan.
