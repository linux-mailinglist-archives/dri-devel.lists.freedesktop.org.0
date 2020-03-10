Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AAAF180C71
	for <lists+dri-devel@lfdr.de>; Wed, 11 Mar 2020 00:36:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F5F46E8E9;
	Tue, 10 Mar 2020 23:36:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 598AF6E25B
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Mar 2020 13:03:03 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id m25so16220703edq.8
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Mar 2020 06:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=txJ2cabPVl0jNbK99cKi2MZdmVuZqf+PAM3YUt+WpY0=;
 b=VPL1NDv9zsW2c/LoCdV3gm5ieOYlrqgDNUr2BxgqH0xen76hbXhEV588sgY5SwH4rB
 8E+cNUFwBI/RLNrdyXdAkkUGv+dK0ZcLvhT5ho+YckBFlqWDjgHKp2haa2BHow7SOHOX
 g7khzdPorVpRMuK4/6es/gQPuaHSF6GjklyuqO6h2cQARwrDPi/OESYRrS3DqvywlJtl
 R8lOOQvMErIjUUeB4/0CH6svMffjPT721SaIH5u90x+PamecPO9qiLUEJyX3dGrMVrYw
 tvHCePkp7A/KgtOGc/U9LfRdGRNXdzY00SKxkMtQlgI02WbI/bqfp1CVUMqAKftgyjks
 +pIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=txJ2cabPVl0jNbK99cKi2MZdmVuZqf+PAM3YUt+WpY0=;
 b=grWVvR0d1cgcTv+5OQlyZd1DcdOGU7Bo4RGkNvS4A5shs0HxNK9GA/4ckapezOTUfK
 SaUwj9fOZ9doPWszvBl6Fp6kgUh+iBdoi7seu+QAdGpaEUrhdXzmh2pJRiYlFk4vBUob
 XJQhxysiAGPuOaeODLVlc5BEffCkiMKoa/uzvoMNMYzvLEAg7P8iC2rwUpdQAi0gC1Ee
 nOEpKILH3ctJv5ttCOjXP9KoHbTw5LjSCLnCI4BtzCHrRvdwAYykp6DRIab+d6284VaL
 jMZ6AJWWXhFnRi7V4/yann2UNbKweoaqRsXS5wBzpanFF+KmAzd+hIk9/qfZt0ES2/tY
 rpEw==
X-Gm-Message-State: ANhLgQ0D5DlCVoVso8BpLKQiQbcRU5yMsWzGrIzMvrVvzMIjPdAnttij
 KZ9/Br35Cxh+qgoUD0O/sYGaBSuiGOSe5S5BS7s=
X-Google-Smtp-Source: ADFU+vs1w/5RE3liVq1Q7Pwg+zThawzvWjAb6j9Up4XFrDqRv545heteU8xxTv5jyHqAFCgssspoHkmUJvkcPk9tIbE=
X-Received: by 2002:a17:906:f49:: with SMTP id h9mr19753036ejj.6.1583845381759; 
 Tue, 10 Mar 2020 06:03:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200310073313.21277-1-michael@walle.cc>
 <4beb5200a76f2d817be7276444543de4@walle.cc>
 <ea6ffa30ddc2459d07935e5e61a41172@walle.cc>
In-Reply-To: <ea6ffa30ddc2459d07935e5e61a41172@walle.cc>
From: Vladimir Oltean <olteanv@gmail.com>
Date: Tue, 10 Mar 2020 15:02:50 +0200
Message-ID: <CA+h21hqMoPhbq8YG0UeV1kP0iXApYsJvb9MZjPGX54dm2U-KnQ@mail.gmail.com>
Subject: Re: [PATCH] spi: spi-fsl-dspi: fix DMA mapping
To: Michael Walle <michael@walle.cc>
X-Mailman-Approved-At: Tue, 10 Mar 2020 23:36:13 +0000
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
Cc: Vladimir Oltean <vladimir.oltean@nxp.com>,
 lkml <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 linux-spi@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 Mark Brown <broonie@kernel.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 10 Mar 2020 at 10:12, Michael Walle <michael@walle.cc> wrote:
>
> Am 2020-03-10 08:40, schrieb Michael Walle:
> > Am 2020-03-10 08:33, schrieb Michael Walle:
> >> Use the correct device to request the DMA mapping. Otherwise the IOMMU
> >> doesn't get the mapping and it will generate a page fault.
> >>
> >> The error messages look like:
> >> [    3.008452] arm-smmu 5000000.iommu: Unhandled context fault:
> >> fsr=0x402, iova=0xf9800000, fsynr=0x3f0022, cbfrsynra=0x828, cb=8
> >> [    3.020123] arm-smmu 5000000.iommu: Unhandled context fault:
> >> fsr=0x402, iova=0xf9800000, fsynr=0x3f0022, cbfrsynra=0x828, cb=8
> >>
> >> This was tested on a custom board with a LS1028A SoC.
> >
> > Oh fu.. please disregard this patch. DMA mapping still isn't working.
> > Somehow I missed that the transfer mode was turned back to its default
> > XSPI mode.
>
> Damn. I need more coffee.. this patch IS working. Only the first probe
> fails due to EPROBE_DEFER.
>
> [    2.539706] fsl-dspi 2120000.spi: rx dma channel not available (-517)
> [    2.546200] fsl-dspi 2120000.spi: can't get dma channels
> [    3.622774] spi-nor spi1.0: w25q128fw (16384 Kbytes)
>
> -michael

I'm testing LS1028A with IOMMU_DEFAULT_PASSTHROUGH=y and I didn't have
time to change my setup now. I've also sent a v3 to my patch series
which is going to conflict with this one, sorry. I would have picked
your patch up with my series but I didn't have the right environment
to test it.

Thanks,
-Vladimir
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
