Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8153F24FFA2
	for <lists+dri-devel@lfdr.de>; Mon, 24 Aug 2020 16:12:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1765B6E255;
	Mon, 24 Aug 2020 14:12:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 777EA6E255;
 Mon, 24 Aug 2020 14:12:13 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id i10so9817223ljn.2;
 Mon, 24 Aug 2020 07:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AKy5F4lP6ls1PXsqaFikhKf+rsRGhQ4sSlwOIMAjFWc=;
 b=cW0ovP30j1MJNGCU6h1UFychEzWKZNuh6qkWXDRab6uZyraByCBVWC+X+bK4ftlEjm
 oCfowPwSEk/fNXc/njBQLHbASpJWeOUGAKJHNt7Wczh4Qad14c/vBhWjheqgbvEPqAhL
 F5kPAvvFSOt54MH1olBu3l1kLguQLfFF4LuO3/yRbP2i8Daghy9Ii9DlSIO3dWA68wgM
 8fWfY4t3WIFWQ4X7+p0W6SP7N55WsHiidzAKoE6EoQ2zU9OoMl/UM7759qfTbfIR7MRG
 HqaWEnt+IQjp047IhAKRcbD/y8IHO3I37Df1OJJwVStpn91WW/89YCb4gIlKIY3hEAOj
 BJeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AKy5F4lP6ls1PXsqaFikhKf+rsRGhQ4sSlwOIMAjFWc=;
 b=ceJgm1AutCZq2aebY17AjtLkjsfivHGyHmYhqxEJfl3SKPUl8jqgtxApOqK2xUVt/2
 sSO9aYGNgNtNHE1UBTYbprTYeBA5bIFa8D/o1b/H3PP7dBR3XJ5shCsWeAC9SvWaWjBh
 Chon3OaMKWlCd6lI1S7L+ZGNBzAYp/KggZwhXxie7AVTtYBRZmovOM95j1oeXmoXUSJf
 nQTQRg9sv+XM7iTQ7lvO+vC1EpnuXr/v+7rmkFYj2QzbqlF+RdPNLbQANKr9q1DuTFMZ
 PNUEhdVjKY84GkrtRS0QIqeUJkF9HcOHdbJlkLEFKqbWG+nFIJmnwR+APiuv50qsfn0T
 ehfg==
X-Gm-Message-State: AOAM532wnjQphOmLUQlzM9BYZrGrNOKUIoresixfAmIQ64x+nnt0USQf
 FqIaMzIrenKQi9H2JcjodeO1Xll5gZMcupNI5Qo=
X-Google-Smtp-Source: ABdhPJyON533bmHvT7tJ/v5e/l6F5UZYnOn7OaoujjhXr7SmjjFG3BJdkHMjfGGUBSL+KVi9B0NpHOq7r7H3S4EXYsE=
X-Received: by 2002:a2e:9899:: with SMTP id b25mr2448372ljj.178.1598278331570; 
 Mon, 24 Aug 2020 07:12:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200824110248.5998-1-l.stach@pengutronix.de>
In-Reply-To: <20200824110248.5998-1-l.stach@pengutronix.de>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 24 Aug 2020 11:11:59 -0300
Message-ID: <CAOMZO5DM+1CyHMhT1fq88b79Jz7FKvFLyJBG1Rz4GHZJbk6ytA@mail.gmail.com>
Subject: Re: [PATCH] drm/etnaviv: always start/stop scheduler in timeout
 processing
To: Lucas Stach <l.stach@pengutronix.de>
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
Cc: The etnaviv authors <etnaviv@lists.freedesktop.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 patchwork-lst@pengutronix.de, Sascha Hauer <kernel@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lucas,

On Mon, Aug 24, 2020 at 8:02 AM Lucas Stach <l.stach@pengutronix.de> wrote:
>
> The drm scheduler currently expects that the stop/start sequence is always
> executed in the timeout handling, as the job at the head of the hardware
> execution list is always removed from the ring mirror before the driver
> function is called and only inserted back into the list when starting the
> scheduler.
>
> This adds some unnecessary overhead if the timeout handler determines
> that the GPU is still executing jobs normally and just wished to extend
> the timeout, but a better solution requires a major rearchitecture of the
> scheduler, which is not applicable as a fix.
>
> Fixes: 135517d3565b drm/scheduler: Avoid accessing freed bad job.)

Just a nit: the correct syntax for the Fixes line is:

Fixes: 135517d3565b ("drm/scheduler: Avoid accessing freed bad job.")
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
