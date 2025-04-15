Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5047CA8A3C8
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 18:13:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE4FF10E12A;
	Tue, 15 Apr 2025 16:13:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Iwf/xepf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F35B710E12A
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 16:13:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id A2DFDA49F7F;
 Tue, 15 Apr 2025 16:08:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 382BAC4CEEB;
 Tue, 15 Apr 2025 16:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744733631;
 bh=1jFrBy0lzqpyUKpmfkbxvJvV2QeeBiFeu/gLSlD6DXw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Iwf/xepfn8XdaQPkl3OXO2pziEP0MlRo4kLwGSJsiPog0Lg5Q1zc16D6DMGJwuihR
 wFxPHaCtVDUNGtTLwsWTrCyK5ML3+2kHLLu+hLOI9049UI/1wvm6ANh7f1RkqDDqZE
 sfK6i25rKsc+rZPzOJjQiMNZCqS9qAsXy/ekUZsqbaFi5M/YNucILhk7ZNjcpj8xhR
 cTpu1IqsMZdWOGrrLhNg9KBwOnjf8is+U1vUkxZI9HftXGggDq4mt6mtnKRdxCOmja
 JYxKuYVHbxzBtX6yyWjjBDmrCV6qBEG+qekX20hC4nqmB77hh3oQmv7Pech6xvsaet
 8MiIM487OnzWg==
Date: Tue, 15 Apr 2025 17:13:37 +0100
From: Simon Horman <horms@kernel.org>
To: Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, jk@ozlabs.org,
 joel@jms.id.au, eajames@linux.ibm.com, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dmitry.torokhov@gmail.com, mchehab@kernel.org,
 awalls@md.metrocast.net, hverkuil@xs4all.nl,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 louis.peens@corigine.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 parthiban.veerasooran@microchip.com, arend.vanspriel@broadcom.com,
 johannes@sipsolutions.net, gregkh@linuxfoundation.org,
 jirislaby@kernel.org, yury.norov@gmail.com,
 akpm@linux-foundation.org, jdelvare@suse.com, linux@roeck-us.net,
 alexandre.belloni@bootlin.com, pgaj@cadence.com, hpa@zytor.com,
 alistair@popple.id.au, linux@rasmusvillemoes.dk,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, kuba@kernel.org,
 linux-kernel@vger.kernel.org, linux-fsi@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
 oss-drivers@corigine.com, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com, linux-serial@vger.kernel.org,
 bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw, Frank.Li@nxp.com,
 linux-hwmon@vger.kernel.org, linux-i3c@lists.infradead.org,
 david.laight.linux@gmail.com, andrew.cooper3@citrix.com,
 Yu-Chun Lin <eleanor15x@gmail.com>
Subject: Re: [PATCH v4 09/13] wifi: brcm80211: Replace open-coded parity
 calculation with parity_odd()
Message-ID: <20250415161337.GZ395307@horms.kernel.org>
References: <20250409154356.423512-1-visitorckw@gmail.com>
 <20250409154356.423512-10-visitorckw@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409154356.423512-10-visitorckw@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 09, 2025 at 11:43:52PM +0800, Kuan-Wei Chiu wrote:
> Refactor parity calculations to use the standard parity_odd() helper.
> This change eliminates redundant implementations.
> 
> Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
> Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
> Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>
> ---
>  .../wireless/broadcom/brcm80211/brcmsmac/dma.c | 18 ++----------------
>  1 file changed, 2 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/dma.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/dma.c
> index 80c35027787a..5d7500ee2d3b 100644
> --- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/dma.c
> +++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/dma.c
> @@ -17,6 +17,7 @@
>  #include <linux/slab.h>
>  #include <linux/delay.h>
>  #include <linux/pci.h>
> +#include <linux/bitops.h>
>  #include <net/cfg80211.h>
>  #include <net/mac80211.h>
>  
> @@ -283,24 +284,9 @@ struct dma_info {
>  	bool aligndesc_4k;
>  };
>  
> -/* Check for odd number of 1's */
> -static u32 parity32(__le32 data)
> -{
> -	/* no swap needed for counting 1's */
> -	u32 par_data = *(u32 *)&data;
> -
> -	par_data ^= par_data >> 16;
> -	par_data ^= par_data >> 8;
> -	par_data ^= par_data >> 4;
> -	par_data ^= par_data >> 2;
> -	par_data ^= par_data >> 1;
> -
> -	return par_data & 1;
> -}
> -
>  static bool dma64_dd_parity(struct dma64desc *dd)
>  {
> -	return parity32(dd->addrlow ^ dd->addrhigh ^ dd->ctrl1 ^ dd->ctrl2);
> +	return parity_odd(dd->addrlow ^ dd->addrhigh ^ dd->ctrl1 ^ dd->ctrl2);
>  }

parity32 expected a little-endian integer as it's argument
while parity_odd expects a host byte order value.

I realise that the existing code just casts-away the endianness
annotation, but this patch adds a Sparse warning.

 .../brcmsmac/dma.c:289:66: warning: incorrect type in argument 1 (different base types)
 .../brcmsmac/dma.c:289:66:    expected unsigned long long [usertype] val
 .../brcmsmac/dma.c:289:66:    got restricted __le32

>  
>  /* descriptor bumping functions */
> -- 
> 2.34.1
> 
> 
