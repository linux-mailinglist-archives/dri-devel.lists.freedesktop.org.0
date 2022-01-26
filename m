Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B98A49CA88
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 14:15:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6020210E6B7;
	Wed, 26 Jan 2022 13:15:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8700E10E6B7
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 13:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202112;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 Subject:References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+IAzmFFliQBWK1jxk5QRuab/DHt3yG8sbu9RtQ8KG3U=; b=WKCmxyu3faFRsMWLIvU0J7bgYR
 Y8Bo94NeFTAglGptabYLcDXOI5CW9WelY7qQNOUHdUWnLJH4XXp48USKv5U0/lfbJTlz/F8PiBo9F
 8q4sW7kQnqmqr/BUBPPBqJMT3zbzv4M3q6W2DErSRDGws4vXWtsXept5mkLKq7ctKfzh7AZsrBZsU
 EzgXPd6k2/fWvVct7ssNbbiao34Hia+0s+i/qDxoEro3VXDEVzfaZQMG37We/HSkNI/kmA74gwh6i
 gjLRptuEoAV6q4cILBtBPRGrdTOCx+Qgs9A92xeKg0Xy9SNqoTr1po8sCCzot45/SOHTtBu8VPJ5a
 h9U0dWAA==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:56599
 helo=[192.168.10.61])
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1nCi98-0000PP-D8; Wed, 26 Jan 2022 14:15:34 +0100
Message-ID: <dc392272-80ae-dbbd-df26-c7ffa6239cf0@tronnes.org>
Date: Wed, 26 Jan 2022 14:15:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
To: andriy.shevchenko@linux.intel.com
References: <20220125202118.63362-1-andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 0/4] fbtft: Unorphan the driver for maintenance
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20220125202118.63362-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: andy@kernel.org, linux-fbdev@vger.kernel.org, michael.hennerich@analog.com,
 gregkh@linuxfoundation.org, deller@gmx.de, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 phil@philpotter.co.uk, zhangxuezhi1@yulong.com, lee.jones@linaro.org,
 hkallweit1@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

>
> Since we got a maintainer for fbdev, I would like to
> unorphan fbtft (with the idea of sending PRs to Helge)
> and move it out of staging since there is no more clean
> up work expected and no more drivers either.
>
> Thoughts?

Here's a driver I have been working on:

drm/panel: Add MIPI DBI compatible SPI driver
https://lore.kernel.org/dri-devel/20220125175700.37408-1-noralf@tronnes.org/

It should replace the SPI part of these fbtft drivers if accepted:

$ grep -lr MIPI_DCS drivers/staging/fbtft/ | grep -v "-" | uniq | sort
drivers/staging/fbtft/fb_hx8340bn.c
drivers/staging/fbtft/fb_hx8353d.c
drivers/staging/fbtft/fb_hx8357d.c
drivers/staging/fbtft/fb_ili9163.c
drivers/staging/fbtft/fb_ili9340.c
drivers/staging/fbtft/fb_ili9341.c
drivers/staging/fbtft/fb_ili9481.c
drivers/staging/fbtft/fb_ili9486.c
drivers/staging/fbtft/fb_s6d02a1.c
drivers/staging/fbtft/fb_st7735r.c
drivers/staging/fbtft/fb_st7789v.c
drivers/staging/fbtft/fb_tinylcd.c

There's no support for the parallel interface on these controllers in
drm. Support could be added to drivers/gpu/drm/drm_mipi_dbi.c.

Here's a status report I wrote 2 years ago:

fbtft: 5 years in staging
https://lore.kernel.org/dri-devel/a6cef26c-0f4b-47f0-d249-71f53891526b@tronnes.org/

Noralf.
