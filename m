Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2ED578157
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 13:55:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13BC2AEF6A;
	Mon, 18 Jul 2022 11:55:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B515A12BA4F
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jul 2022 11:55:28 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id va17so20819755ejb.0
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jul 2022 04:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0U2EDUpW8YBrinzXxadJw7cbrPTkcYwwN5jNK6nFItI=;
 b=pXBo8ebsHtE29P2R35p1KWORh1mKbEsJkCJBiSROlyZcTck2mSNNd/+8VhRsqoNmX1
 S7K0ejvuH0xKNvnaC0Zi7T8vypyzxxWJM2tQPQdEl1pAWdjVzQPkjuKu/njM3jVZFhIT
 eJOOiv1+jUpCh1/h0DC91qrIt+SHlpreMiihpRfoolhJ3TpeRcKzBz4JQ7i4FM+lYV/2
 xEQpFYD45DdjVa4kGfjZsGYnBFFt77VDgPAeiO7XdyR/K2uMCDdZwsYiHwos652piplD
 bQCDWaKH9zqRfcpyUBXh5T9+8R3rsz+I4DVMvXpTsIIn7P+kO1CslXHgGxUClH/qhnqN
 u0Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0U2EDUpW8YBrinzXxadJw7cbrPTkcYwwN5jNK6nFItI=;
 b=H8RePKFetgp0N2GkuYlD5t776/KvC7mrq/kSj2+pGCS8tAT+4wMfPW2nQKqctnVNyd
 BDtjYBBc37cL+3LYJr0I/OOd1qULAgbyicqpjl992YR4/dk6QhH/5VTfC8+j4sX7qNAl
 +1CFeRJqSFCM6QiI/iEdLOrO1huxxhp+Q5xK8DkD8MyRKo9qZKpz8ViwU8gfk24R8y1U
 9IDB1/98AeFfNWY0JZUj3ctXiiGYnN7EtDwShYFAjYSSPWsEkFaBnb08WhelNzit5VUl
 8QTMga0UnQio1lsDVhlqDRGPPzhE7jB2BiajAB89wkV31pZ+WV/gc9eWZqY3Iq5H4xXK
 cWDQ==
X-Gm-Message-State: AJIora+kZsRoz3/Scf9didlpzOSDJNLFMiIBL+/sCe7koL//jOKCJZZw
 qqCsmtHwgxW+ePtBcQV75bB9/ZI/3ylEX51YsxL9nw==
X-Google-Smtp-Source: AGRyM1usf1iGXWYZe4G1TrzuCi2HyMgDsrNgs1zFqzr1eChgzFb7w0ojFLcMoarUHk/HGyqa5b5KLdsn093/dmdouRM=
X-Received: by 2002:a17:906:9b14:b0:72b:7c96:58c9 with SMTP id
 eo20-20020a1709069b1400b0072b7c9658c9mr25951315ejc.648.1658145327223; Mon, 18
 Jul 2022 04:55:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220707012330.305646-1-windhl@126.com>
 <CAG3jFysYDVh2wk4VXePfZ_pwPvoa0EgP3Lv3pXXF6eu8W-Yt1g@mail.gmail.com>
In-Reply-To: <CAG3jFysYDVh2wk4VXePfZ_pwPvoa0EgP3Lv3pXXF6eu8W-Yt1g@mail.gmail.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Mon, 18 Jul 2022 13:55:16 +0200
Message-ID: <CAG3jFyvXcry+gpBz=gHuWqrwHmhm=2UFiXBDfTk3s4XbgXoXbg@mail.gmail.com>
Subject: Re: [PATCH] drm:bridge:analogix: Fix refcount bugs in
 anx7625_parse_dt()
To: Liang He <windhl@126.com>
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
Cc: andrzej.hajda@intel.com, jonas@kwiboo.se, airlied@linux.ie,
 narmstrong@baylibre.com, dri-devel@lists.freedesktop.org,
 Laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 18 Jul 2022 at 13:54, Robert Foss <robert.foss@linaro.org> wrote:
>
> Hey Liang,
>
>
> On Thu, 7 Jul 2022 at 03:25, Liang He <windhl@126.com> wrote:
> >
> > There are two refcount bugs in this funcion:
> >
> > BUG-1: 'pdata->mipi_host_node' will be assigned a new reference with
> > of_graph_get_remote_node() which will increase the refcount of the
> > object, correspondingly, we should call of_node_put() for the old
> > reference stored in the 'pdata->mipi_host_node'.
> >
> > BUG-2: of_graph_get_endpoint_by_regs() will also increase the refcount
> > of the object and its new reference will be assigned to local 'ep0', so
> > there should be a of_node_put() when 'ep0' is not used anymore.
> >
> > Fixes: 8bdfc5dae4e3 ("drm/bridge: anx7625: Add anx7625 MIPI DSI/DPI to DP")
> > Fixes: fd0310b6fe7d ("drm/bridge: anx7625: add MIPI DPI input feature")
> > Signed-off-by: Liang He <windhl@126.com>
> > ---
> >  drivers/gpu/drm/bridge/analogix/anx7625.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > index 53a5da6c49dd..f39b9be19eaf 100644
> > --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> > +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > @@ -1624,6 +1624,7 @@ static int anx7625_parse_dt(struct device *dev,
> >         anx7625_get_swing_setting(dev, pdata);
> >
> >         pdata->is_dpi = 1; /* default dpi mode */
> > +       of_node_put(pdata->mipi_host_node);
> >         pdata->mipi_host_node = of_graph_get_remote_node(np, 0, 0);
> >         if (!pdata->mipi_host_node) {
> >                 DRM_DEV_ERROR(dev, "fail to get internal panel.\n");
> > @@ -1638,6 +1639,7 @@ static int anx7625_parse_dt(struct device *dev,
> >                         bus_type = 0;
> >
> >                 mipi_lanes = of_property_count_u32_elems(ep0, "data-lanes");
> > +               of_node_put(ep0);
> >         }
> >
> >         if (bus_type == V4L2_FWNODE_BUS_TYPE_PARALLEL) /* bus type is Parallel(DSI) */
> > --
> > 2.25.1
> >
>
> This patch does not apply on drm-misc-next, could you please rebase it
> and send a v2?

Can you also fix the title, it should start with "drm/bridge: anx7625:"
