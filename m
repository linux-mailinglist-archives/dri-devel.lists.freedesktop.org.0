Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 183B957A4BC
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jul 2022 19:13:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21E1590D32;
	Tue, 19 Jul 2022 17:13:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E38E90CCC
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jul 2022 17:13:04 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id l23so28435142ejr.5
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jul 2022 10:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5MNb0V6j3qPMABdJqAwbj58qIBpWCdI7aPTD3FNarXk=;
 b=BuVirQTZTwxHB7H87FJWiywTqDnGatrkPQzw5UHbCPG2g8CTgDMoTYPzdXmc1KYSZA
 zTy3rNxK9hcEWlZ37iUIdgAYI3gp5P0kewuDync6JAXMK25mV3f/+c+smo9PEExXg/f5
 x+Il1343dGqjFsDeOlWvHyG+n+V8E0fgXrD8A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5MNb0V6j3qPMABdJqAwbj58qIBpWCdI7aPTD3FNarXk=;
 b=KRWjAkdxNZk51NcBVTcMcVx7BUwxqq0h/rzbAFsQoMHiw3MTPAP2Lxp71HAkZoM+Oo
 4gWIC8sUe3apj5I9lHy07Mw450WG+QoyyJ9+ChQCyxSfHJgmQEH/8OIHho6VNqxfYFtl
 YEzgw2OSNiNQ9j3DjdTP2hQ0vLfBrOZylchFSKcsOcVeHyXWLYH4sdGnCtaZK18tm/uQ
 rZ7TLFkA9dTFIQi40Lg31cmZWdEJpMlD37vGeWmatKauq+LpkwHLWQ/TcFpRjt+5FVxZ
 Gy4hkuekBMctwBw0fGYlLbw7Q+egeK2lltJy8StgHSJRvSKyMVxCUtyvruKP1nUsYncR
 Xnzg==
X-Gm-Message-State: AJIora+RrmEi7sNFxsIQsWLZ4HNmX/Oa04E1j5QfBkfIsFooqkobXmIV
 U9SyqfSbM4F3Gh2HlgDNEiZ0Fsa1QyqoTucY
X-Google-Smtp-Source: AGRyM1uRhyk5Z0b+r8og917pNUl+hXKFxQcfOmUYeJarkLx/Figl2TptgrtUmm8bOCwY5GoPxo4Ddg==
X-Received: by 2002:a17:907:3f9d:b0:72f:4645:1718 with SMTP id
 hr29-20020a1709073f9d00b0072f46451718mr6653958ejc.317.1658250782450; 
 Tue, 19 Jul 2022 10:13:02 -0700 (PDT)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com.
 [209.85.221.53]) by smtp.gmail.com with ESMTPSA id
 15-20020a170906318f00b0072f2ed809casm2965381ejy.49.2022.07.19.10.12.55
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Jul 2022 10:12:56 -0700 (PDT)
Received: by mail-wr1-f53.google.com with SMTP id j1so18124154wrs.4
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jul 2022 10:12:55 -0700 (PDT)
X-Received: by 2002:adf:f90d:0:b0:20c:de32:4d35 with SMTP id
 b13-20020adff90d000000b0020cde324d35mr27615443wrr.583.1658250775011; Tue, 19
 Jul 2022 10:12:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220711092117.360797-1-dmitry.baryshkov@linaro.org>
 <20220711092117.360797-3-dmitry.baryshkov@linaro.org>
 <CAD=FV=XQbP2OSf6vtPOQtuXajUOuQ9Vz7t7pmcSraSzcBJD2ig@mail.gmail.com>
In-Reply-To: <CAD=FV=XQbP2OSf6vtPOQtuXajUOuQ9Vz7t7pmcSraSzcBJD2ig@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 19 Jul 2022 10:12:42 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UZN6SrybRt3_DRHsRYg=-yi9w++NPAtjtGHvzuyW6y7A@mail.gmail.com>
Message-ID: <CAD=FV=UZN6SrybRt3_DRHsRYg=-yi9w++NPAtjtGHvzuyW6y7A@mail.gmail.com>
Subject: Re: [RFC PATCH v3 2/2] drm/bridge: ti-sn65dsi86: support
 DRM_BRIDGE_ATTACH_NO_CONNECTOR
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 Sam Ravnborg <sam@ravnborg.org>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Robert Foss <robert.foss@linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Stephen Boyd <swboyd@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Jul 11, 2022 at 10:23 AM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Mon, Jul 11, 2022 at 2:21 AM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > Now as the driver does not depend on pdata->connector, add support for
> > attaching the bridge with DRM_BRIDGE_ATTACH_NO_CONNECTOR.
> >
> > Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 18 ++++++++----------
> >  1 file changed, 8 insertions(+), 10 deletions(-)
>
>  This has been on my list of annoyances for quite some time now. Most
> excellent to have it fixed, thanks!
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>
> Tested together with patch #1.
>
> Tested-by: Douglas Anderson <dianders@chromium.org>
>
>
> Unless someone yells that there's a problem or someone beats me to it,
> I'll plan to land in drm-misc-next sometime next week.

Landed on drm-misc-next:

6e2dc7ac7141 drm/bridge: ti-sn65dsi86: support DRM_BRIDGE_ATTACH_NO_CONNECTOR
