Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC7B5F0D62
	for <lists+dri-devel@lfdr.de>; Fri, 30 Sep 2022 16:21:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B015210ED1E;
	Fri, 30 Sep 2022 14:21:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99E7B10ED27
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Sep 2022 14:20:48 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id lc7so9416451ejb.0
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Sep 2022 07:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=Qmhw/xvm52V9JeMhrCZ4QdfkWP6FtOLW3fI49wxSg5A=;
 b=WmLVs0TVUi9h5JUoYO3o2oJG0kF5hKWGPBnaIQjuqBGkFyD2xGC/n9DnqnZNC5oT2m
 xPoGmEoybMS080J9SO3uVChRxY9triUbx+DgkIx8SxCrqIVijAMlWUTtqm3MT/tYDw87
 gOZxTn+eBlAaBE6/xxUSAl0ky3sLCGIurURNE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=Qmhw/xvm52V9JeMhrCZ4QdfkWP6FtOLW3fI49wxSg5A=;
 b=OEj9gUWbUjLh/y2GwfJ4UD2e6NbBCfCMzMncOObT2KsmGy1TkS+N9iuyHIjRmQWWFe
 In+hcT3gwSHNAh+aIQc2s5WFLmxc03nG4HySepjsm7Wqjf+rNsvE2Nz6l3OehyWuiQIh
 d+mnAUiuDSME9oLbjCzRKxFDs8fQao4LJY3+DrGifnOYetSnoDjulampChojdVdW9T50
 fpWyqb6Qm/CQcC0h51MZxjOxzw2Gu4c9QO7bkjLqWaRKevURrHEoSWE9u5ft1w9ULm+5
 WLbOAKDCJXgNJtkneE+h4UqGNgOETgdgwg2PPZ4dE6oDJ8uwiHDNE6pOFEihhQffgxDS
 U76g==
X-Gm-Message-State: ACrzQf2Em1/1B/C3J95FIlo+ZQAgd/jjJpWzz/BPVVrMI6ojpstcrHuY
 kfColGSuuPfSaL4vDwH1Cs065ucoZlj3SRvJ
X-Google-Smtp-Source: AMsMyM4ZV1YxPJx1I1O8qFHOnIdKidOKKLldpVtHZyJNF99pLQeE5vKdPKCvTYY2KF70EHRhx8rVZQ==
X-Received: by 2002:a17:906:9fc1:b0:761:9192:504f with SMTP id
 hj1-20020a1709069fc100b007619192504fmr6653574ejc.116.1664547646870; 
 Fri, 30 Sep 2022 07:20:46 -0700 (PDT)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com.
 [209.85.128.45]) by smtp.gmail.com with ESMTPSA id
 n2-20020a509342000000b0043df042bfc6sm1804485eda.47.2022.09.30.07.20.45
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Sep 2022 07:20:45 -0700 (PDT)
Received: by mail-wm1-f45.google.com with SMTP id
 i203-20020a1c3bd4000000b003b3df9a5ecbso5143547wma.1
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Sep 2022 07:20:45 -0700 (PDT)
X-Received: by 2002:a05:600c:500d:b0:3b5:234:d7e9 with SMTP id
 n13-20020a05600c500d00b003b50234d7e9mr6041734wmr.57.1664547644935; Fri, 30
 Sep 2022 07:20:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220930042506.2529522-1-jason.yen@paradetech.corp-partner.google.com>
In-Reply-To: <20220930042506.2529522-1-jason.yen@paradetech.corp-partner.google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 30 Sep 2022 07:20:33 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XoyhpoRpQpv5dNYy0qEJcu=JRw=1TKynX-5ecjLJoibw@mail.gmail.com>
Message-ID: <CAD=FV=XoyhpoRpQpv5dNYy0qEJcu=JRw=1TKynX-5ecjLJoibw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/bridge: ps8640: Add software to support aux defer
To: Jason Yen <jason.yen@paradetech.corp-partner.google.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Pin-yen Lin <treapking@google.com>, LKML <linux-kernel@vger.kernel.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Sep 29, 2022 at 9:25 PM Jason Yen
<jason.yen@paradetech.corp-partner.google.com> wrote:
>
> This chip can not handle aux defer if the host directly program
> its aux registers to access edid/dpcd. So we need let software
> to handle the aux defer situation.
>
> Signed-off-by: Jason Yen <jason.yen@paradetech.corp-partner.google.com>
> ---
>
> Changes in v2:
> - Add aux defer handler
> - Remove incorrect statements
>
>  drivers/gpu/drm/bridge/parade-ps8640.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
> index 31e88cb39f8a..76ada237096d 100644
> --- a/drivers/gpu/drm/bridge/parade-ps8640.c
> +++ b/drivers/gpu/drm/bridge/parade-ps8640.c
> @@ -286,7 +286,6 @@ static ssize_t ps8640_aux_transfer_msg(struct drm_dp_aux *aux,
>         }
>
>         switch (data & SWAUX_STATUS_MASK) {
> -       /* Ignore the DEFER cases as they are already handled in hardware */
>         case SWAUX_STATUS_NACK:
>         case SWAUX_STATUS_I2C_NACK:
>                 /*
> @@ -303,6 +302,14 @@ static ssize_t ps8640_aux_transfer_msg(struct drm_dp_aux *aux,
>         case SWAUX_STATUS_ACKM:
>                 len = data & SWAUX_M_MASK;
>                 break;
> +       case SWAUX_STATUS_DEFER:
> +       case SWAUX_STATUS_I2C_DEFER:
> +               if (is_native_aux)
> +                       msg->reply |= DP_AUX_NATIVE_REPLY_DEFER;
> +               else
> +                       msg->reply |= DP_AUX_I2C_REPLY_DEFER;
> +               len = data & SWAUX_M_MASK;
> +               break;

This seems fine to me now. There is nothing too controversial here but
I'll still give this a few days on the list for anyone else to speak
up. I'll plan to land it midway through next week unless anything
comes up.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
