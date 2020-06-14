Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA271F88C3
	for <lists+dri-devel@lfdr.de>; Sun, 14 Jun 2020 14:33:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C040D891BF;
	Sun, 14 Jun 2020 12:32:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5194C891BF
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Jun 2020 12:32:56 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id n9so5669814plk.1
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Jun 2020 05:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SKIiGB83ddT4Ddf/URGledt63KwexOpATWhRUr6iZ8Y=;
 b=m0ZZIiP8vJjqeB8WnbJwEX6O69bNRPk7jEScTtW6TX89Oy+FAJ/mGGk07lesh4fQTZ
 7YE22lbg2t4tE+vwKb2bti/fWPeB1EWep/RB1+fdCFDtZPX2P6c9wDfOeeRt8yCKeqop
 4y2aCD0b7R/aj1+FAGKIw8deDNDVCFBMqOQp/jmf0gYgII0OL2lRkcC0Xnp70KEUBUXU
 PhOWDL7AsPSUnPCU5xDaAXzdNsGBkKEgDmutmXqTMwfv2rGIJ/taO9TN8+0R3VjbwPju
 A+fjhYOxwZ26uVnFCSMoqPFceK/RBPXs2X2OgG4JL1/Pgxa52k0Bh+/5RVBqCSK6R4r1
 UFiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SKIiGB83ddT4Ddf/URGledt63KwexOpATWhRUr6iZ8Y=;
 b=GyW+slrQhJoY2VtVWhv9McLqFGDJmhMWME5clNzUdjq0isprWJJC5n5eYknl8KrT9b
 rPIUZTn/G7FSjSoq2xUuxaDcK4uKpReG9bKnUmc7ylslWHRJmTTZYdohR7m6j2jGgjFW
 hoXKKeBu/TlAgGot9NiF1RMPgS7amiMjNebJAihEFiDH/0QX9176leOwO4xb9UTPQPN+
 HcpZXqwRpz4Ea0niQPpzT/hu5J+I2gRHxYqbGVoLKEGmb+l60OeEUw9+tT03uor2p60K
 tEWZco8CEQ9thCethnVv1aXt4g6NNEJ39IFxZIVW8+G28xrE/gKYX61ApXefuEXz4hZW
 dhrg==
X-Gm-Message-State: AOAM531W8hgwCJlh6U/8oNrRWoUBKOQZuFszk836vasmHBPBKbgXV1Tl
 pzIKB8LL3COMWlFQCcEE32gKyRDLixj7jUnL19c=
X-Google-Smtp-Source: ABdhPJxhOM2RrPSEzgZnOdeVRmrDxIofOZacsvCIcCvGJ/zYuUL5WOCQZlyn5zn1ZB+WmB9mX/EI9G+T201BR0MAMgE=
X-Received: by 2002:a17:902:7288:: with SMTP id
 d8mr16491452pll.18.1592137975872; 
 Sun, 14 Jun 2020 05:32:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200614065251.94106-1-navid.emamdoost@gmail.com>
In-Reply-To: <20200614065251.94106-1-navid.emamdoost@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 14 Jun 2020 15:32:39 +0300
Message-ID: <CAHp75VfGHab7Oy5hhW+6rWxkcB5ZHif2hK7inbbdvfF-k0wX0A@mail.gmail.com>
Subject: Re: [PATCH] drm/vc4: fix ref count leak in vc4_dsi_encoder_enable
To: Navid Emamdoost <navid.emamdoost@gmail.com>
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
Cc: wu000273@umn.edu, David Airlie <airlied@linux.ie>,
 Kangjie Lu <kjlu@umn.edu>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Navid Emamdoost <emamd001@umn.edu>, Stephen McCamant <smccaman@umn.edu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jun 14, 2020 at 9:55 AM Navid Emamdoost
<navid.emamdoost@gmail.com> wrote:
>
> in vc4_dsi_encoder_enable, the call to pm_runtime_get_sync increments
> the counter even in case of failure, leading to incorrect
> ref count. In case of failure, decrement the ref count before returning.

...

> +out:
> +       pm_runtime_put(dev);

Better to use pm_runtime_put_noidle() for error case.
And here is a change of semantics, i.e. before your patch there was no
put at all. How did you test this?

-- 
With Best Regards,
Andy Shevchenko
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
