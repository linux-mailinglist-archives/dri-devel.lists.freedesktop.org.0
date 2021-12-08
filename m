Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 41BD346DA5D
	for <lists+dri-devel@lfdr.de>; Wed,  8 Dec 2021 18:50:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EFE97318F;
	Wed,  8 Dec 2021 17:49:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 75557 seconds by postgrey-1.36 at gabe;
 Wed, 08 Dec 2021 17:49:57 UTC
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B289F7318F
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Dec 2021 17:49:57 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id ECAE7B82200
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Dec 2021 17:49:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7671EC341CC
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Dec 2021 17:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638985790;
 bh=AGydzqEFWVHgqNEZ+C88aMeHTaF6GU2hGPjbdQmpbzc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Qto/lwUN/THC7My6nqaLTvNaqrlsqYKGKvvI6XZZ0zmjxrLcTTn28gxdydxMiuV+O
 /+3+2OZox5HHn2y4sZHJqsRFP+QoSqujZMgSNXlZyOGEt+OwfRLifahBAF05lg93/W
 pC81H7go2tx1Nxwujo0TtTImlGQzQinKfndmgwa0sKcqF5ehdal1igURriTpmns3y7
 JG+FDDhtkekngV+PH0SQZ2+AN7Lk/d0eBaCIfoAq4BXLKEm0Q4GHwJUrkaRWWQDMKX
 33CtuROckXU2lLtFglw9FgoYo7erPaYX4CJBOFhVBkz28cgiMmN6JLz5oURsIrFcAN
 +MFVoDR9/9a9g==
Received: by mail-ed1-f53.google.com with SMTP id r25so10965887edq.7
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Dec 2021 09:49:50 -0800 (PST)
X-Gm-Message-State: AOAM5316EaulE1ymQ5anxdPS8RhfPNXDJOzXJn5y74B1HWchP/ffHPLD
 HNhntoOtdj1wnYrTuUU0Y8JFyJCAFQpBTAH1LQ==
X-Google-Smtp-Source: ABdhPJx1e0Ud4kjI07LFQQXJazxoN7MV+mUWa0KW1RZJUKKGvwAO1S9SN6vkvBvz/qeVUpYnazWDheggEV6oN3oFbrE=
X-Received: by 2002:a05:6402:5c9:: with SMTP id
 n9mr20989688edx.306.1638985788722; 
 Wed, 08 Dec 2021 09:49:48 -0800 (PST)
MIME-Version: 1.0
References: <20211207072943.121961-1-marcan@marcan.st>
 <20211207072943.121961-2-marcan@marcan.st>
In-Reply-To: <20211207072943.121961-2-marcan@marcan.st>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 8 Dec 2021 11:49:36 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+G4mv9Xuy1B--TvJNcNv0z3pRZAQPkA-T+aF8rZMrjkA@mail.gmail.com>
Message-ID: <CAL_Jsq+G4mv9Xuy1B--TvJNcNv0z3pRZAQPkA-T+aF8rZMrjkA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] of: Move simple-framebuffer device handling from
 simplefb to of
To: Hector Martin <marcan@marcan.st>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
 dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javier@dowhile0.org>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 7, 2021 at 1:31 AM Hector Martin <marcan@marcan.st> wrote:
>
> This code is required for both simplefb and simpledrm, so let's move it
> into the OF core instead of having it as an ad-hoc initcall in the
> drivers.
>
> Signed-off-by: Hector Martin <marcan@marcan.st>
> ---
>  drivers/of/platform.c          |  5 +++++
>  drivers/video/fbdev/simplefb.c | 21 +--------------------
>  2 files changed, 6 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/of/platform.c b/drivers/of/platform.c
> index b3faf89744aa..e097f40b03c0 100644
> --- a/drivers/of/platform.c
> +++ b/drivers/of/platform.c
> @@ -540,6 +540,11 @@ static int __init of_platform_default_populate_init(void)
>                 of_node_put(node);
>         }
>
> +       for_each_child_of_node(of_chosen, node) {
> +               if (of_device_is_compatible(node, "simple-framebuffer"))

node = of_get_compatible_child(of_chosen, "simple-framebuffer");
of_platform_device_create(node, NULL, NULL);
of_node_put(node);

Please Cc the DT list. Looks like this patch can be applied
independently. (Better get the other 2 into drm-misc soon or it will
miss 5.17).

Rob
