Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D503745D24
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jul 2023 15:26:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8548B10E1E7;
	Mon,  3 Jul 2023 13:26:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9430810E1E7
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jul 2023 13:26:09 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 68D3860DCF;
 Mon,  3 Jul 2023 13:26:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 197ADC433C9;
 Mon,  3 Jul 2023 13:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1688390767;
 bh=lOto3+2FBgpgZYTbSv5jQU8R2gXWk1bZIPsTI/IYNIM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jR0vzl0SnAnlH9AL2mHlfOw7ml7dux3qyyJCHrzNVWXX8mXNomw2vrfuqRd/fPs7J
 FX731LoZbOcq0kJ8EudGvauceZ0xT6soX/7XeWdGr0QuOBx5ebSCrQ1z9ErA+1xIfx
 6Wn/4RFXqMKebtYuaBKN/PPgppDxI74arIK/jifM=
Date: Mon, 3 Jul 2023 15:25:00 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: =?iso-8859-1?Q?Rapha=EBl?= Gallais-Pou <rgallaispou@gmail.com>
Subject: Re: [PATCH] staging: fbtft: ili9341: use macro
 FBTFT_REGISTER_SPI_DRIVER
Message-ID: <2023070312-pasty-divisive-fa22@gregkh>
References: <20230702080324.120137-1-rgallaispou@gmail.com>
 <2023070254-embark-subplot-4dd4@gregkh>
 <ae400e28-0cd4-cdf8-811d-843e62cd4a95@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ae400e28-0cd4-cdf8-811d-843e62cd4a95@gmail.com>
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
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jul 02, 2023 at 03:05:25PM +0200, Raphaël Gallais-Pou wrote:
> Hi,
> 
> Le 02/07/2023 à 14:02, Greg Kroah-Hartman a écrit :
> > On Sun, Jul 02, 2023 at 10:03:24AM +0200, Raphael Gallais-Pou wrote:
> > > Using FBTFT_REGISTER_DRIVER resolves to a NULL struct spi_device_id. This
> > > ultimately causes the module to an early exit at probe time.
> > 
> > So this doesn't work at all today?  Has it ever worked?  What commit
> > does thi fix?
> 
> I tested again with only a tweak in my device-tree. The early exit in the
> driver's code is caused by a missing field. So regarding this particular
> driver the macro works.
> 
> It resolves to set spi_driver.id_table = NULL, which yields a warning in
> __spi_register_driver(). So I guess this patch only fixes a warning.

Ok, please fix the changelog text when you resend this.

> > > In addition the MODULE_ALIASes can be dropped.
> > 
> > Why?  When you say "also" or "in addition", that's a huge hint it should
> > be a separate patch.
> I did not find any reference to those aliases in the kernel, which led me to
> remove those.

Aliases are used by userspace, not the kernel.

> If you think they are still necessary, I'll split them in an upcoming v2.

Please document why they are not needed in order to be able to be
removed.

thanks,

greg k-h
