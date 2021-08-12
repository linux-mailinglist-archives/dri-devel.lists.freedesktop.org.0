Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E03E3EA963
	for <lists+dri-devel@lfdr.de>; Thu, 12 Aug 2021 19:23:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 848FB89B27;
	Thu, 12 Aug 2021 17:23:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0716789B27
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Aug 2021 17:23:29 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id w6so2842581ill.3
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Aug 2021 10:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JRwzKSay2n+yQfmhBPOFfDNxmLPMQg6PC0lXLvxAvL8=;
 b=Bh074U0YkS72TlAp7BoXqHTJFFM+Kpvlod9cHdGDbEvZxvD/WDOg3Uc8bwHw0XuXHR
 gR6QY2KTEoTvpqCgEQpyiOdXq/Y0PNq6zEbZywP4dsfckhwXLli67gfBLkr1fxY8sSCu
 ZZY3+cfWMnUPqp74qIF2TVpKDoMx3ryHreSAU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JRwzKSay2n+yQfmhBPOFfDNxmLPMQg6PC0lXLvxAvL8=;
 b=fGmk2EjDlWPprsNG8pZQX3Kar4u9cHZUkzWbkfirit0gL5IkFlBziKEmtD1N4Pa8dk
 WLqL0eN2f3n1eZ82zBvIVABvVP6+HuHsebW5MHXHUWJsF0Ha0aMOU4oRF3beRsXcMqnC
 LmhvBGiK8S8NE3TAYQv27Wnr1jrH6uMj9V8xilXTpfKohqXTTSUp4CsyD5MYOClMxaMd
 NEbPKkG3W6cTIj3mM0XuP02QSv+FcTp8sp1Qlwoj58JgyCRtQTOMP6zq+o//ipskZt8j
 wGfKLwCeBhOJr8pHkTPNJ9kXV4yDoonfMNoRW1VsJL/ERDF4M4qyGEd+beStqOYNMOIi
 Ql1A==
X-Gm-Message-State: AOAM531fEntv2PYYE16LWleQ9vwHPEwu+5fFdpi+yS3lqfdxK1YEEe2n
 DsUQCTXITGX6grVOZeUrkWQ9rfxpvdDgsA==
X-Google-Smtp-Source: ABdhPJwQvbnOA+Ek/jYg5bGkNbjt9P478T6TUdX6mP8ozl4YYyI6deI293lo94WNegmJRG84x3pIjA==
X-Received: by 2002:a92:d582:: with SMTP id a2mr3930350iln.261.1628789008302; 
 Thu, 12 Aug 2021 10:23:28 -0700 (PDT)
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com.
 [209.85.166.169])
 by smtp.gmail.com with ESMTPSA id r1sm1568069iot.48.2021.08.12.10.23.27
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Aug 2021 10:23:27 -0700 (PDT)
Received: by mail-il1-f169.google.com with SMTP id y3so7807106ilm.6
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Aug 2021 10:23:27 -0700 (PDT)
X-Received: by 2002:a92:d84f:: with SMTP id h15mr3825806ilq.12.1628789006912; 
 Thu, 12 Aug 2021 10:23:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210811235253.924867-1-robdclark@gmail.com>
 <20210811235253.924867-4-robdclark@gmail.com>
In-Reply-To: <20210811235253.924867-4-robdclark@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 12 Aug 2021 10:23:15 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U__Ge_6MkvxmcOQe49Q7NG94Bi3T2xNNiec-NF9J8tJg@mail.gmail.com>
Message-ID: <CAD=FV=U__Ge_6MkvxmcOQe49Q7NG94Bi3T2xNNiec-NF9J8tJg@mail.gmail.com>
Subject: Re: [PATCH 3/4] drm/bridge: ti-sn65dsi86: Implement
 bridge->mode_valid()
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Stephen Boyd <swboyd@chromium.org>, 
 Rob Clark <robdclark@chromium.org>, Andrzej Hajda <a.hajda@samsung.com>, 
 Neil Armstrong <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 open list <linux-kernel@vger.kernel.org>
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

Hi,

On Wed, Aug 11, 2021 at 4:51 PM Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> For the brave new world of bridges not creating their own connectors, we
> need to implement the max clock limitation via bridge->mode_valid()
> instead of connector->mode_valid().
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 24 +++++++++++++++++++-----
>  1 file changed, 19 insertions(+), 5 deletions(-)

This looks good to me. I'll plan to land this together with the next
patch into drm-misc-next sometime next week unless someone beats me to
it.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
