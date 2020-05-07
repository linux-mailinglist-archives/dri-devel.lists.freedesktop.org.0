Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8623D1C9025
	for <lists+dri-devel@lfdr.de>; Thu,  7 May 2020 16:39:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 756656E122;
	Thu,  7 May 2020 14:39:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa44.google.com (mail-vk1-xa44.google.com
 [IPv6:2607:f8b0:4864:20::a44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFC5B6E122
 for <dri-devel@lists.freedesktop.org>; Thu,  7 May 2020 14:39:40 +0000 (UTC)
Received: by mail-vk1-xa44.google.com with SMTP id i185so1536894vki.12
 for <dri-devel@lists.freedesktop.org>; Thu, 07 May 2020 07:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Z7IFA9stGr7AQIAUx30OK+wSMM9GgogchHTSn33YI0U=;
 b=oKrgg6+ohJKVAOjUfdVbli6fopWWBK9ouxsK7MkYl2D0qBOvCFhQahNLKGcyctP0/3
 GuQCx6TcEKb7uN2XV751z4mfwU5kpykWAbuevm+p41uR8/egw097FPbwgDTfIlAaV1bB
 mk+N35TAXodLwzAsbM5yVi87spgJIxwJ/nNIM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Z7IFA9stGr7AQIAUx30OK+wSMM9GgogchHTSn33YI0U=;
 b=b6qaE8H6EVvZf7EoqHf0PJC2o6TPc4Co4g1TSFTM5bTxOVTPMNYOvfmwSxZ82+0AcP
 FcWypCZwoWitXTFFlRrlgOazUR4y9WciuAEyRHU4C+h2eyGL6E5awgy88y0OnFBRzbIs
 Qh1cfsU6rt08M5TI6XX/Sj0jK9xAaLfD8sYu5yLTEgKn8c+qV4flh7Prtsxm29k1TUqB
 hpRf1vJBUNNJalztLIFU2nmCwFYvTu4ulrivXD7kUwTYrkuVKIIf0PUqERUGSZpcp6fB
 JsGGB5BnOp0V+syBtsFBz0kVyOizQ4EdrVlfDLZ/XqkXbDTKx1EFH05NIUaxUhO9ybLr
 j11w==
X-Gm-Message-State: AGi0PuYidRnrp10W53W1OzO10WEaLbF5HYbN3WhnuH+uySLEnQv7TXuC
 zg4GOg3FaT5ieE7084FSnnZK1WSyqpI=
X-Google-Smtp-Source: APiQypK83K5XpjkZswfVXUrrcCDHBsO9vxjhDFMGcWh8WNQGPtclGPT6LfYQpFO6inLB7l7KUfAGZg==
X-Received: by 2002:a1f:c1:: with SMTP id 184mr11796144vka.62.1588862379734;
 Thu, 07 May 2020 07:39:39 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com.
 [209.85.217.51])
 by smtp.gmail.com with ESMTPSA id m203sm2950671vkm.54.2020.05.07.07.39.37
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 May 2020 07:39:38 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id 1so3487548vsl.9
 for <dri-devel@lists.freedesktop.org>; Thu, 07 May 2020 07:39:37 -0700 (PDT)
X-Received: by 2002:a67:f5d6:: with SMTP id t22mr12876499vso.73.1588862377337; 
 Thu, 07 May 2020 07:39:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200430194617.197510-1-dianders@chromium.org>
 <20200430124442.v4.1.Ia50267a5549392af8b37e67092ca653a59c95886@changeid>
In-Reply-To: <20200430124442.v4.1.Ia50267a5549392af8b37e67092ca653a59c95886@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 7 May 2020 07:39:25 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WHoxdr++f7Y_NO=VnrnEPkP=+WS5u3j_5ifEjekhBWcA@mail.gmail.com>
Message-ID: <CAD=FV=WHoxdr++f7Y_NO=VnrnEPkP=+WS5u3j_5ifEjekhBWcA@mail.gmail.com>
Subject: Re: [PATCH v4 1/6] drm/bridge: ti-sn65dsi86: Export bridge GPIOs to
 Linux
To: LinusW <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
 Neil Armstrong <narmstrong@baylibre.com>, Andrzej Hajda <a.hajda@samsung.com>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sandeep Panda <spanda@codeaurora.org>
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Stephen Boyd <swboyd@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Apr 30, 2020 at 12:46 PM Douglas Anderson <dianders@chromium.org> wrote:
>
> The ti-sn65dsi86 MIPI DSI to eDP bridge chip has 4 pins on it that can
> be used as GPIOs in a system.  Each pin can be configured as input,
> output, or a special function for the bridge chip.  These are:
> - GPIO1: SUSPEND Input
> - GPIO2: DSIA VSYNC
> - GPIO3: DSIA HSYNC or VSYNC
> - GPIO4: PWM

One suggestion that came off-list is to change the code to make the
numbering match up better with the datasheet.  Right now if you want
GPIO 2 you have to refer to it like:

hpd-gpios = <&sn65dsi86_bridge 1 GPIO_ACTIVE_HIGH>;

That's because the code right now numbers things starting at 0 even if
the datasheet numbers things starting at 1.

I'm planning to spin the series later today for this.  While at it,
I'll squash my yaml bindings fixup into the bindings patch in this
series.  If someone would rather I wait and not spin yet, please yell.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
