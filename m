Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51EF9188BF6
	for <lists+dri-devel@lfdr.de>; Tue, 17 Mar 2020 18:27:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00DF86E5CF;
	Tue, 17 Mar 2020 17:27:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x942.google.com (mail-ua1-x942.google.com
 [IPv6:2607:f8b0:4864:20::942])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 885696E5CF
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Mar 2020 17:27:10 +0000 (UTC)
Received: by mail-ua1-x942.google.com with SMTP id o16so8317329uap.6
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Mar 2020 10:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kYxhd4YbdvKna+Hk3H++oy2r+2XxoGCrQ2OcQrBquQI=;
 b=VWLDmipX7IFDQ/yHjCAzFxlk/+VluSSJwe4qv5jpHr4e6B0U7gp1YOW3C9Csk4kZHd
 NXgx0kZ6qhPzwcHQS3y9Qvp7AMowj6bjIngubmHTjWmVhTh0fc8O7LbAKQh0NHGA4pJV
 mU73ACIJwkVyGoLSZZRtAPc2yjx+8+foKjquI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kYxhd4YbdvKna+Hk3H++oy2r+2XxoGCrQ2OcQrBquQI=;
 b=ZhQZp+rlMpi9wWqX40pdP1BCMVhvNAMrkdrsrwbJg3WtE/JOLnWDXmF0lDvFDmsLCO
 g4e/883ftUO+zrB0BVHqDrC+myYirEttAi3Y+inA56GoKHV6sW9BY5HHN6cGXsMazlB+
 aRgoP5lFe8ZOZcnCig3YezByQDXUZF48nEDaD6/YjSxo8QqGgoI1Rj7jmzXxkjA774j/
 YoFUyEUXG/LmWIZQ+wgl7fYv+w4hTevLQj2UhhXh6HzXr59QVgZEqoR/gKmacSlpl9U2
 5i+CmlK1P+TtVXB1BkQZ9pKNIkGoxbnJ+4YpKSeAJpZEK7eX9EkGE3KZ3O5SkrQPQH+n
 YHTA==
X-Gm-Message-State: ANhLgQ1Xwp/7Kv57dCr/nGJLRnUHZpeKGsyHtKdY0Z7+sroHGJZXbP1v
 shmnpHGxiI/8gCBjfx3NXHSYs2UUpTs=
X-Google-Smtp-Source: ADFU+vvqkH0W6XPz8Mcy0os+8+Tfxj9wZS4fdSeNcR7Yp5aBWnpkVq1CvNPpr/hv6h627d18E4513Q==
X-Received: by 2002:a9f:2f08:: with SMTP id x8mr43742uaj.49.1584466029086;
 Tue, 17 Mar 2020 10:27:09 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com.
 [209.85.217.48])
 by smtp.gmail.com with ESMTPSA id n25sm1591910vkk.56.2020.03.17.10.27.07
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Mar 2020 10:27:08 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id m9so14486903vso.2
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Mar 2020 10:27:07 -0700 (PDT)
X-Received: by 2002:a67:e951:: with SMTP id p17mr22233vso.106.1584466026884;
 Tue, 17 Mar 2020 10:27:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200315194239.28785-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200315194239.28785-1-christophe.jaillet@wanadoo.fr>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 17 Mar 2020 10:26:55 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WrncW_y+dtXHU7Lj1J0Lh7w8Kw+d28KZF52-OMs=0pSQ@mail.gmail.com>
Message-ID: <CAD=FV=WrncW_y+dtXHU7Lj1J0Lh7w8Kw+d28KZF52-OMs=0pSQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Fix an error handling path 'msm_drm_init()'
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
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
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Sun, Mar 15, 2020 at 12:42 PM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> If this memory allocation fails, we have to go through the error handling
> path to perform some clean-up, as already done in other other paths of
> this function.
>
> Fixes: db735fc4036b ("drm/msm: Set dma maximum segment size for mdss")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/gpu/drm/msm/msm_drv.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

This has already been posted as:

https://lore.kernel.org/r/20200309101410.GA18031@duo.ucw.cz
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
