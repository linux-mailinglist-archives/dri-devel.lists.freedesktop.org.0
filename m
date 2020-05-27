Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC681E4B15
	for <lists+dri-devel@lfdr.de>; Wed, 27 May 2020 18:55:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED3736E353;
	Wed, 27 May 2020 16:54:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56EB86E353
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 16:54:57 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id k5so29753743lji.11
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 09:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anholt-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LHmWtQ2TkLP6OGqb3OSxb7myh0DpkLphjU9/234BIPw=;
 b=QS/DeL/4agLgqn43tz2d+1Pv+Wcw+zCxwuarjwcFOqdidEhljsODcljY+PQD4MZcez
 6mcT5xo+Glj6Ozfyadq8H8umAzoBhXKuPdW8HcoZ043jES7AoSHHYu2QJvNfDbke8WKE
 Sd1361f4h8VU3lrRB8HNQrWQJqedcEnX0V0GYfKC+d5yU8R52r3f8aEWrcwoJJo1Lrm1
 rrlOSWgksgreXzlsXtCWma7ALPvRuCLrWDRnRqvsvYq0cqxGjb/3xHPbS33yS/6CjUiS
 7Vbd2apZUjCw2NVUJTdQpNzUFRkW7nKRLrAvi1n05Ykl31i8DWeWBLHOOz7xf4ILLl7/
 7SxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LHmWtQ2TkLP6OGqb3OSxb7myh0DpkLphjU9/234BIPw=;
 b=S/SJIOtFEyfqU80dyt6/Ial0AWtc9p1jSfx5J0m/+OQBG9dP/yq6hZsoKkJZpv92eh
 Gynp09vyUCBmQLsqv04YcBourTdVUU3ZiognMJydD+gpVr77PWJmiIR5JkxmDiVVxl1U
 FSJ3loCHY+9OBhceLg/elOPnwnkbxjSaGUpzzyKCJINiPGWubQpW8rGvzT70mnAcVMZ8
 Wed406GsQ7VHY2X6TQT2FWLiwsip9sR6hfmHiA92pKnGtZabLXP6sc0Sm3+r8A59Henw
 e0Caqk6O6EjKT1fsP/lg0oZ4oKYmr2JUvsicAo4am3b6ktQJxuNFa9fHhzlj3e9Luzj/
 9xMA==
X-Gm-Message-State: AOAM531oEPiQssFkhZn0jOeyvnGGfCxhc6AjyH6DsKtOiIeldXreRr/O
 Wl5DxFZr2qWqeiFw5yrfRnaA5asIxzjWnwRMQljtbQ==
X-Google-Smtp-Source: ABdhPJzmJpMkCosVV6yjOyPlOezLCCBsNT9bqO2Vj1q1MAS7G8wJ94i7BKM7SJjLa8tONQ+EvxtbGKO7THS1xmZmk4Q=
X-Received: by 2002:a2e:8186:: with SMTP id e6mr3672178ljg.252.1590598495776; 
 Wed, 27 May 2020 09:54:55 -0700 (PDT)
MIME-Version: 1.0
References: <cover.aaf2100bd7da4609f8bcb8216247d4b4e4379639.1590594512.git-series.maxime@cerno.tech>
 <d2c1850e38e14f3def4c0307240e6826e296c14b.1590594512.git-series.maxime@cerno.tech>
In-Reply-To: <d2c1850e38e14f3def4c0307240e6826e296c14b.1590594512.git-series.maxime@cerno.tech>
From: Eric Anholt <eric@anholt.net>
Date: Wed, 27 May 2020 09:54:44 -0700
Message-ID: <CADaigPU7c=1u47R9GzvGCH_Z2fywY1foGYEy=KbBikjUQpwUFg@mail.gmail.com>
Subject: Re: [PATCH v3 032/105] drm/vc4: crtc: Enable and disable the PV in
 atomic_enable / disable
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 DRI Development <dri-devel@lists.freedesktop.org>,
 bcm-kernel-feedback-list@broadcom.com,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 27, 2020 at 8:50 AM Maxime Ripard <maxime@cerno.tech> wrote:
>
> The VIDEN bit in the pixelvalve currently being used to enable or disable
> the pixelvalve seems to not be enough in some situations, which whill end
> up with the pixelvalve stalling.
>
> In such a case, even re-enabling VIDEN doesn't bring it back and we need to
> clear the FIFO. This can only be done if the pixelvalve is disabled though.
>
> In order to overcome this, we can configure the pixelvalve during
> mode_set_no_fb, but only enable it in atomic_enable and flush the FIFO
> there, and in atomic_disable disable the pixelvalve again.

What displays has this been tested with?  Getting this sequencing
right is so painful, and things like DSI are tricky to get to light
up.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
