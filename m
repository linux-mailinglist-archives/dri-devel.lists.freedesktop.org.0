Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F0A72F1D86
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jan 2021 19:08:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1CC389D61;
	Mon, 11 Jan 2021 18:08:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E0F589D61
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 18:08:10 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id w26so213118ljo.4
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 10:08:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=V+B+6pMaa6Q7xKO+4h5rdcoXhhu4oZDjwR1J7UMT4Rk=;
 b=LlsxNoI4BImJb0lMWb1dLUOtq/B1wjQunMIZM7LAuw1JNemQ4vJXNku5ntxD2DJOw+
 lhYNetlVczBfhaQAmH86zJDVJNjZfJ06ZOs716T0hmQ4gUTnfVCa/tE/MZYRpInSxN8w
 yZCtu3+KZkg926Kow9Ofugn48c/v2xKoGKB8bjWzqvqgkZ6Khr87f6VyyWDQqrO5GRXT
 L5mlJr6WLiDJYLUvNvEfloqrEbdz/VAUon1BdmuY/xgyZ0spFe0ndX1AidRXt/wXQ5Cn
 yiIzisza6KGnBSdTGF1e430tHXgtZkxgtpq9QdEH0b/pTf1atBg/DnYoZJNHLhy/6RZS
 8qDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=V+B+6pMaa6Q7xKO+4h5rdcoXhhu4oZDjwR1J7UMT4Rk=;
 b=dNMIfu72nh17pr/iXo7xQYyZ/pl7d4NcOwq4OgN0mEhCCARKWtqJJpn2SzP7LzvOY2
 FcRfeC2QHIsQ8CINOrpJatGlkhDharqeNEQAYZ02oLknBuHayknIH03TyTn+ldw8wxak
 iB9zOdH4qhpf0UB2JSHVltT2VmZc71jOIj3W85Gwnj+JmA0fJHoHy7o7ScopEdW2dl/s
 wX7pv/7nSIEwrRJa+q0hFGJzHfWrOXKgQS//Ez6BpS3uPd/9NZ2TGh3cOe/ZdjZkCBa1
 fHrLZLDqXJyWu2OPqxTlIp9mgZKfE3wC5dTvsSs/kqsjKvxZGp6lu7tMr9MiCnyurjkn
 ab2A==
X-Gm-Message-State: AOAM5303gVS+JpmhJ+g2qjSOlcSEJmMS1bfP0HZ9vZJUGfWnjhh0reMc
 eXboQEazbwqujnS1FTy+SJYnG/TDLigBL6bI3KU=
X-Google-Smtp-Source: ABdhPJxQSnjahHHc+CEoLPrh1phEmZlVoro9RXebrNI+oYsadieuy+YiDRNGo/oxMiaj+jv6nvhkbJsb5wrTd8mhed8=
X-Received: by 2002:a2e:b4b3:: with SMTP id q19mr273826ljm.121.1610388488972; 
 Mon, 11 Jan 2021 10:08:08 -0800 (PST)
MIME-Version: 1.0
References: <20210111125702.360745-1-geert+renesas@glider.be>
In-Reply-To: <20210111125702.360745-1-geert+renesas@glider.be>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 11 Jan 2021 15:07:57 -0300
Message-ID: <CAOMZO5ADSvcNvWx5vYui1v=jdUQ=K+HfETAm7xr5zg73DhqcFw@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: nwl-dsi: Avoid potential multiplication
 overflow on 32-bit
To: Geert Uytterhoeven <geert+renesas@glider.be>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Geert,

On Mon, Jan 11, 2021 at 10:02 AM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> As nwl_dsi.lanes is u32, and NSEC_PER_SEC is 1000000000L, the second
> multiplication in
>
>     dsi->lanes * 8 * NSEC_PER_SEC
>
> will overflow on a 32-bit platform.  Fix this by making the constant
> unsigned long long, forcing 64-bit arithmetic.
>
> While iMX8 is arm64, this driver is currently used on 64-bit platforms
> only, where long is 64-bit, so this cannot happen.  But the issue may
> start to happen when the driver is reused for a 32-bit SoC, or when code
> is copied for a new driver.

This IP is also present on i.MX7ULP, which is 32-bit, but not supported yet.

Thanks for taking care of this.

Reviewed-by: Fabio Estevam <festevam@gmail.com>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
