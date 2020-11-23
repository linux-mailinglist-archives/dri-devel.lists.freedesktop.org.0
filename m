Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5532C1015
	for <lists+dri-devel@lfdr.de>; Mon, 23 Nov 2020 17:26:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B0726E046;
	Mon, 23 Nov 2020 16:26:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 699746E045
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 16:26:52 +0000 (UTC)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com
 [209.85.167.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id ECD53208FE
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 16:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606148812;
 bh=9KB5B51VKiYnXfipSV/d2k1zGqIeU6Dr42g+/xScmCw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Xf/Js/kh0lEtDIYBl6YGM+NZDBvjFAFBlyI9A/gpgD0kULhBOeiCEfAQhFpewFx/L
 46WVCshHQrRzgSSkAt21v7v06xm8gP3pfHvBbWQazkO/ndBWuyMw3q4t2GfoOX8MKJ
 9Gev1uQOJt/rNIPzkHDsZRr6s4ONJyAdMJRiPcK8=
Received: by mail-oi1-f172.google.com with SMTP id t143so20257779oif.10
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 08:26:51 -0800 (PST)
X-Gm-Message-State: AOAM532ZhkUrmhBEdtDbQL7iufip9OFoWafjuYZz2WRF7mwIBB60JAp+
 rytkFe66zPeVLHnTODxABYK40EVPK+aTkPld1XI=
X-Google-Smtp-Source: ABdhPJxFalqPvikjQIVOo3YlO4cDEOXrIV9/1gHDApfYxZp6GpTCV0n7iI/MdrK+6fyEasBcbyXRNVdRK0Tds0gefYY=
X-Received: by 2002:aca:3c54:: with SMTP id j81mr15777247oia.11.1606148811189; 
 Mon, 23 Nov 2020 08:26:51 -0800 (PST)
MIME-Version: 1.0
References: <20201118091303.wa5npxyop3cdsczb@gilmour.lan>
In-Reply-To: <20201118091303.wa5npxyop3cdsczb@gilmour.lan>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 23 Nov 2020 17:26:35 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3gV6TOq4z8gtB0ciCmGhXUd=GinrPPGJBagkqKW=Pbnw@mail.gmail.com>
Message-ID: <CAK8P3a3gV6TOq4z8gtB0ciCmGhXUd=GinrPPGJBagkqKW=Pbnw@mail.gmail.com>
Subject: Re: [GIT PULL] Allwinner MBUS and DMA-ops rework
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>, Chen-Yu Tsai <wens@csie.org>,
 arm-soc <arm@kernel.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 18, 2020 at 10:13 AM Maxime Ripard <maxime@cerno.tech> wrote:
>
> Hi Arnd, Olof,
>
> Here's the PR for the MBUS rework we discussed in the last couple of
> weeks, for what will become 5.11.
>
> As Arnd suggested, this is based on a PR sent to drm-misc-fixes to merge
> the initial fix for a probe error in drm/sun4i due to
> dma_direct_set_offset.
>
>   ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/mripard/linux.git tags/sunxi-rework-mbus

Looks good, nice cleanup!

I've applied it to the arm/drivers branch now, but I almost missed it, as
you sent it to the old arm@kernel.org address instead of soc@kernel.org
that is connected to the patchwork.

Please also use http:// or git:// addresses in pull requests instead of ssh://

      Arnd
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
