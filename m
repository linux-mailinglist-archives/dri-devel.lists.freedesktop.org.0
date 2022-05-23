Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19667530C93
	for <lists+dri-devel@lfdr.de>; Mon, 23 May 2022 12:24:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0BFA10E20D;
	Mon, 23 May 2022 10:24:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76C0F10E215
 for <dri-devel@lists.freedesktop.org>; Mon, 23 May 2022 10:24:09 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id y199so13267637pfb.9
 for <dri-devel@lists.freedesktop.org>; Mon, 23 May 2022 03:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nNFj13UYZ8v7RZdu86sncPew42vfXhhg5wowumiVTeU=;
 b=WOaKEDatnLE7rQuK1ua3k2S+wEabkmRA8tmEdN5NcyP0R2/yHuNheNg9Gf6PZKRDYj
 RMZOpoCR8cLIS6J97wdXQguRsYWvUTnGhXNttfP/BMHd24xLJkoZaUWJ8Z4gU9Hc5A//
 dB7bDFHO5IMwaqjxmRWVfIvNyqHumh8vq9UPx30W0dG/b/aVgtPrKAWd02cRmlXJWLU2
 vz2bXlID4gHgI4BDImKHkKhb5rrHpT32nwwuLTxIOMUkDzJtDezkgz+eYes7EMV7Bf28
 QPWOmzCZlFAF8FkM673PmlRxvpNLcivOZK5g1rUxw4TMPqCQ4wjLLVOhcurK0n2yRFFu
 27Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nNFj13UYZ8v7RZdu86sncPew42vfXhhg5wowumiVTeU=;
 b=bcw6NzBAGXlL+KPqZjpLXdTrUL7xUrVhPvBKIh8S6Fs5GbgH5bK+QTUklyjMTfkbL/
 62EZ1vTZ2Q0OM5YJChvfM6c4ry5d3t3GU0idSMTt8C9rlcf5T76A3YebJw4mpxPIe81T
 tJmRbhiEAjMFH0ok4C7iqRb2brxjwOFRlXa3V1Ril6PrTA1UrkwDj5jx9dHFWLq7GpNV
 L6mTy+JviFwH87Qf+ADzLPTlwrMcpv5E692w9kpgs6on3A2Z8bcXE3bACnIXcTbERVoS
 RMvlvDLlV6UNkH5LBlzbAd+CYC3iP0q7CcIMv98z5mfTs9DMIS19vs+v8hdODrGdM0V3
 Wf3w==
X-Gm-Message-State: AOAM5305YNHIRWXerrsONqLyy0yFCxDdtycfXbSicnw/TqPf7OMTiSZf
 7n0NGOPieWgwSuLIL1HiT/nqgIdIJNLY1/qxEcx/2g==
X-Google-Smtp-Source: ABdhPJwTwgB/F9YY0o8yjahp2HBdOTZdH7hpZHaiJqMQxF+8I1fLKvQwLUzNEPPYn0RmxJKdheEtZH8WQw3Xyq4g+JA=
X-Received: by 2002:a63:6901:0:b0:3f9:caa5:cffc with SMTP id
 e1-20020a636901000000b003f9caa5cffcmr12071882pgc.324.1653301449086; Mon, 23
 May 2022 03:24:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220518233844.248504-1-marex@denx.de>
 <5ff1a7f051c72891c820bb4c9a9062c7c0591840.camel@pengutronix.de>
 <CAG3jFyvm+gVESUX9LM0Mh48SsC+MZnTpOwrtbi+rRv8PtRWWTQ@mail.gmail.com>
 <adadd88b-9e6f-1ee8-9824-d284b0f91237@denx.de>
In-Reply-To: <adadd88b-9e6f-1ee8-9824-d284b0f91237@denx.de>
From: Robert Foss <robert.foss@linaro.org>
Date: Mon, 23 May 2022 12:23:58 +0200
Message-ID: <CAG3jFysH5oLtoJ+bkHL-7m2Qbp3W7ostU7YH6_2D6tTGzTup4g@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi83: Handle dsi_lanes == 0 as invalid
To: Marek Vasut <marex@denx.de>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, Maxime Ripard <maxime@cerno.tech>,
 Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 23 May 2022 at 11:58, Marek Vasut <marex@denx.de> wrote:
>
> On 5/23/22 11:40, Robert Foss wrote:
> > On Thu, 19 May 2022 at 09:57, Lucas Stach <l.stach@pengutronix.de> wrote:
> >>
> >> Am Donnerstag, dem 19.05.2022 um 01:38 +0200 schrieb Marek Vasut:
> >>> Handle empty data-lanes = < >; property, which translates to
> >>> dsi_lanes = 0 as invalid.
>
> [...]
>
> >>> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> >>> index d64d4385188dd..dc65f424e7f3c 100644
> >>> --- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> >>> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> >>> @@ -585,7 +585,7 @@ static int sn65dsi83_parse_dt(struct sn65dsi83 *ctx, enum sn65dsi83_model model)
> >>>        ctx->host_node = of_graph_get_remote_port_parent(endpoint);
> >>>        of_node_put(endpoint);
> >>>
> >>> -     if (ctx->dsi_lanes < 0 || ctx->dsi_lanes > 4) {
> >>> +     if (ctx->dsi_lanes <= 0 || ctx->dsi_lanes > 4) {
> >>>                ret = -EINVAL;
> >>>                goto err_put_node;
> >>>        }
> >>
> >>
> >
> > Applied to drm-misc-next.
>
> This was already applied to drm-misc-next-fixes , since this is a fix
> for something that was already in release . The conflict will resolve
> itself easily though ?

Ah, I didn't realize. I'm not sure if it will resolve itself or not.
But I think either it is reverted in drm-misc-next now, or we wait for
an issue to crop up. I think either way is acceptable, but waiting
maybe causes less churn. So unless someone has another preference,
let's wait and see if a conflict arises.
