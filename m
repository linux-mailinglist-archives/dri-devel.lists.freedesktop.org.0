Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7243B1B55D7
	for <lists+dri-devel@lfdr.de>; Thu, 23 Apr 2020 09:37:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B33B36E34A;
	Thu, 23 Apr 2020 07:36:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1961B89D8D
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Apr 2020 21:12:23 +0000 (UTC)
Received: by mail-pj1-x1041.google.com with SMTP id t40so1519240pjb.3
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Apr 2020 14:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=XDPcP3tbzlYKPYQTKxlpDEEO5QOa9GV0Amha8h89AsA=;
 b=e2qv8zerN73zMA5kW/Ta2fN1O8dVIK6jdFNxVtrJdjtMXUttRjJYvnccM0b/J1yciZ
 lzbNuem24E3qhUXCCDGrhc2xgjM6SrUupLu6OxsIqZDgHOnnSZ5flr/7F/DAhDRki5P4
 qLllKpWEIlToWVvAZA0E5oKaNXV4MQmK5onWY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=XDPcP3tbzlYKPYQTKxlpDEEO5QOa9GV0Amha8h89AsA=;
 b=Xv+kLFcFgBFhASKEEapnnIFJXN3Kp6KtoFnehyQITuMRaVsv0td8gXw8itcU1tk+VA
 6EV7+boIaLuPpCPMXJDyQg8nWZ8QNBrYwvFgz/kS8Xqetle/ds9EYaoCzjsfeYdC2bLH
 kO/5oWOrD6cMmmW0BIoQ/f0ZQ6jTlkTALGb+2qAKIkSjFh3dZSvMtEIy1kr8GiFMJC8L
 IZUyBF4Y8u4BWiRN+K7mThssELu9ZNhp/tzWB5BwJ4GZC+vOYAAgRoEdL2Gr0r8Ai3Q0
 eqAxWyNGbI/kRUnIkITcK43VXPEqUVApTaL6vG1QBMyvKAdYf//Z97+WR+40HPwHSVfO
 5qyg==
X-Gm-Message-State: AGi0PuYQdo3xG0Vtl/dLlImhCW0akAaFxMK6KJYN6jwekFobyetaFVKA
 DZ9CkJPreXfvPLJwVm2ras759A==
X-Google-Smtp-Source: APiQypL5oBKdc6NVB1E/uXQs9airhXye2LtpOV4841Lu7hi+EjVHEnGsUW8WDXrjg92l2+Vpp882FA==
X-Received: by 2002:a17:902:6b86:: with SMTP id
 p6mr639876plk.150.1587589942545; 
 Wed, 22 Apr 2020 14:12:22 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
 by smtp.gmail.com with ESMTPSA id o40sm164208pjb.18.2020.04.22.14.12.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Apr 2020 14:12:21 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20200420220458.v2.3.I53fed5b501a31e7a7fa13268ebcdd6b77bd0cadd@changeid>
References: <20200421050622.8113-1-dianders@chromium.org>
 <20200420220458.v2.3.I53fed5b501a31e7a7fa13268ebcdd6b77bd0cadd@changeid>
Subject: Re: [PATCH v2 3/6] drm/panel-simple: Support hpd-gpios for delaying
 prepare()
From: Stephen Boyd <swboyd@chromium.org>
To: Douglas Anderson <dianders@chromium.org>, Laurent.pinchart@ideasonboard.com,
 a.hajda@samsung.com, airlied@linux.ie, bgolaszewski@baylibre.com,
 daniel@ffwll.ch, linus.walleij@linaro.org, narmstrong@baylibre.com,
 robh+dt@kernel.org, spanda@codeaurora.org
Date: Wed, 22 Apr 2020 14:12:20 -0700
Message-ID: <158758994028.230545.10042873479857418029@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
X-Mailman-Approved-At: Thu, 23 Apr 2020 07:36:39 +0000
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
Cc: robdclark@chromium.org, devicetree@vger.kernel.org, jernej.skrabec@siol.net,
 jeffrey.l.hugo@gmail.com, linux-arm-msm@vger.kernel.org, jonas@kwiboo.se,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, linux-gpio@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Douglas Anderson (2020-04-20 22:06:19)
> People use panel-simple when they have panels that are builtin to
> their device.  In these cases the HPD (Hot Plug Detect) signal isn't
> really used for hotplugging devices but instead is used for power
> sequencing.  Panel timing diagrams (especially for eDP panels) usually
> have the HPD signal in them and it acts as an indicator that the panel
> is ready for us to talk to it.
> 
> Sometimes the HPD signal is hooked up to a normal GPIO on a system.
> In this case we need to poll it in the correct place to know that the
> panel is ready for us.  In some system designs the right place for
> this is panel-simple.
> 
> When adding this support, we'll account for the case that there might
> be a circular dependency between panel-simple and the provider of the
> GPIO.  The case this was designed for was for the "ti-sn65dsi86"
> bridge chip.  If HPD is hooked up to one of the GPIOs provided by the
> bridge chip then in our probe function we'll always get back
> -EPROBE_DEFER.  Let's handle this by allowing this GPIO to show up
> late if we saw -EPROBE_DEFER during probe.

May be worth mentioning that if there isn't an hpd-gpios property then
we only try once during probe and then after that the prepare callback
doesn't try again because the gpio_get_optional() APIs are used. I had
to think about that for a minute.

> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
