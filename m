Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F2C4D2D36
	for <lists+dri-devel@lfdr.de>; Wed,  9 Mar 2022 11:37:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B564810E5C5;
	Wed,  9 Mar 2022 10:37:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D4DB10E5B6
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Mar 2022 10:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202112;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=h2eDy6oU9ZtZAY6GjBi61uPbJyUlQd/vuRaD0dkUSUg=; b=TLRPeRJSHdtfkkpxVAf6z4CPal
 EY49yjkYWIHx1qeAbDMgxRCovA/f8cKtUF8q9J1FV4NQ/bBPTCG7YBOyHeHVtXT+MWNZICDZURwny
 swS0XRK0QI5wlF4Qiz5XEV7mSOXEWEkxcue9DeRA096m5SfjOhl8wWxX5c+9SifglFZntpcgCFHsX
 z86qK9DDuRWtNmHRjPADgDSwYJm1yCTm0nOw0reswomuCmDQMN9Oay3a2hYtmpoqfibj1on8wqB/2
 v1l7Lg1YCsylKVItRP07G31R0Kv7GvPsw+Vk7kL4H3szv+UiJCq0G3HK7ypxkpTlPtwH34OneOksc
 qC9TDaGg==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:64253
 helo=[192.168.10.61])
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1nRth1-0005xU-9w; Wed, 09 Mar 2022 11:37:19 +0100
Message-ID: <c8ac19a6-fab9-b627-b4c1-6321066a10f9@tronnes.org>
Date: Wed, 9 Mar 2022 11:37:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 0/6] drm/tiny/st7735r: Match up with staging/fbtft driver
To: david@lechnology.com
References: <20211124150757.17929-1-noralf@tronnes.org>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20211124150757.17929-1-noralf@tronnes.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dave.stevenson@raspberrypi.com, linux-staging@lists.linux.dev,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org, maxime@cerno.tech
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 24.11.2021 16.07, skrev Noralf Trønnes:
> Hi,
> 
> This patchset adds a missing piece for decommissioning the
> staging/fbtft/fb_st7735r.c driver namely a way to configure the
> controller from Device Tree.
> 
> All fbtft drivers have builtin support for one display panel and all
> other panels using that controller are configured using the Device Tree
> 'init' property. This property is supported by all fbtft drivers and
> provides a generic way to set register values or issue commands
> (depending on the type of controller).
> 
> It is common for these types of displays to have a datasheet listing the
> necessary controller settings/commands or some example code doing the
> same.
> 
> This is how the panel directly supported by the fb_st7735r staging
> driver is described using Device Tree with that driver:
> 
>     width = <160>;
>     height = <128>;
> 
>     init = <0x1000001
>             0x2000096
>             0x1000011
>             0x20000ff
>             0x10000B1 0x01 0x2C 0x2D
>             0x10000B4 0x07
>             0x10000C0 0xA2 0x02 0x84
>             0x10000C1 0xC5
>             0x10000C2 0x0A 0x00
>             0x10000C5 0x0E
>             0x100003a 0x55
>             0x1000036 0x60
>             0x10000E0 0x0F 0x1A 0x0F 0x18 0x2F 0x28 0x20 0x22
>                       0x1F 0x1B 0x23 0x37 0x00 0x07 0x02 0x10
>             0x10000E1 0x0F 0x1B 0x0F 0x17 0x33 0x2C 0x29 0x2E
>                       0x30 0x30 0x39 0x3F 0x00 0x07 0x03 0x10
>             0x1000029
>             0x2000064>;
> 
> 
> This is how the same panel is described using the st7735r drm driver and
> this patchset:
> 
>     width = <160>;
>     height = <128>;
> 
>     frmctr1 = [ 01 2C 2D ];
>     invctr = [ 07 ];
>     pwctr1 = [ A2 02 84 ];
>     pwctr2 = [ C5 ];
>     pwctr3 = [ 0A 00 ];
>     vmctr1 = [ 0E ];
>     madctl = [ 60 ];
>     gamctrp1 = [ 0F 1A 0F 18 2F 28 20 22 1F 1B 23 37 00 07 02 10 ];
>     gamctrn1 = [ 0F 1B 0F 17 33 2C 29 2E 30 30 39 3F 00 07 03 10 ];
> 
> 
> Back when the fbtft drivers were added to staging I asked on the DT
> mailinglist if it was OK to use the 'init' property but it was turned
> down. In this patchset I'm trying the same approach used by the
> solomon,ssd1307fb.yaml binding in describing the attached panel. That
> binding prefixes the properties with the vendor name, not sure why that
> is and I think it looks strange so I try without it.
> 
> Noralf.
> 
> 
> Noralf Trønnes (6):
>   dt-bindings: display: sitronix,st7735r: Fix backlight in example
>   dt-bindings: display: sitronix,st7735r: Make reset-gpios optional
>   dt-bindings: display: sitronix,st7735r: Remove spi-max-frequency limit

Patches 1-3 applied, thanks for reviewing.

The change to the driver has been replaced by a new generic driver
panel-mipi-dbi.

Noralf.

>   dt-bindings: display: sitronix,st7735r: Add initialization properties
>   drm/mipi-dbi: Add device property functions
>   drm: tiny: st7735r: Support DT initialization of controller
> 
>  .../bindings/display/sitronix,st7735r.yaml    | 122 ++++++++++++++-
>  drivers/gpu/drm/drm_mipi_dbi.c                | 139 ++++++++++++++++++
>  drivers/gpu/drm/tiny/st7735r.c                |  87 +++++++++--
>  include/drm/drm_mipi_dbi.h                    |   3 +
>  4 files changed, 334 insertions(+), 17 deletions(-)
> 
