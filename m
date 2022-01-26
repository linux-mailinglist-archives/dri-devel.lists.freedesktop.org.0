Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD0C49C599
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 09:54:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB0C010E7CA;
	Wed, 26 Jan 2022 08:54:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay.hostedemail.com (relay033.a.hostedemail.com
 [64.99.140.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F5DB10E7CA
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 08:54:35 +0000 (UTC)
Received: from omf03.hostedemail.com (a10.router.float.18 [10.200.18.1])
 by unirelay11.hostedemail.com (Postfix) with ESMTP id 3476880F26;
 Wed, 26 Jan 2022 08:54:22 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by
 omf03.hostedemail.com (Postfix) with ESMTPA id 27CD060010; 
 Wed, 26 Jan 2022 08:53:56 +0000 (UTC)
Message-ID: <e12b11d20e22123736e5d8728286947e971c489f.camel@perches.com>
Subject: Re: [PATCH v1 4/4] fbtft: Replace 'depends on FB_TFT' by 'if FB_TFT
 ... endif'
From: Joe Perches <joe@perches.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Phillip Potter <phil@philpotter.co.uk>, Lee
 Jones <lee.jones@linaro.org>, Heiner Kallweit <hkallweit1@gmail.com>,
 Carlis <zhangxuezhi1@yulong.com>, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, linux-fbdev@vger.kernel.org, 
 dri-devel@lists.freedesktop.org
Date: Wed, 26 Jan 2022 00:54:13 -0800
In-Reply-To: <20220125202118.63362-5-andriy.shevchenko@linux.intel.com>
References: <20220125202118.63362-1-andriy.shevchenko@linux.intel.com>
 <20220125202118.63362-5-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.16
X-Stat-Signature: em88uec87srrhrfjxjnjwiqf8orq9fet
X-Rspamd-Server: rspamout05
X-Rspamd-Queue-Id: 27CD060010
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX19Vno09lLkNwZ/zyG+OKu9T1j1sTiaf0bM=
X-HE-Tag: 1643187236-759005
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
Cc: Andy Shevchenko <andy@kernel.org>, Helge Deller <deller@gmx.de>,
 Michael Hennerich <michael.hennerich@analog.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2022-01-25 at 22:21 +0200, Andy Shevchenko wrote:
> Replace 'depends on FB_TFT' by 'if FB_TFT ... endif'
> for the sake of deduplication.
[]
> diff --git a/drivers/video/fbtft/Kconfig b/drivers/video/fbtft/Kconfig
[]
> @@ -10,87 +10,75 @@ menuconfig FB_TFT
>  	select FB_DEFERRED_IO
>  	select FB_BACKLIGHT
>  
> +if FB_TFT
> +
[]
>  config FB_TFT_PCD8544
>  	tristate "FB driver for the PCD8544 LCD Controller"
> -	depends on FB_TFT
>  	help
>  	  Generic Framebuffer support for PCD8544
>  
> @@ -108,62 +96,52 @@ config FB_TFT_S6D02A1

Looks like you missed a couple.
---
 drivers/video/fbtft/Kconfig | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/video/fbtft/Kconfig b/drivers/video/fbtft/Kconfig
index 14ea3c6a60da0..4a02871f2cc71 100644
--- a/drivers/video/fbtft/Kconfig
+++ b/drivers/video/fbtft/Kconfig
@@ -84,13 +84,11 @@ config FB_TFT_PCD8544
 
 config FB_TFT_RA8875
 	tristate "FB driver for the RA8875 LCD Controller"
-	depends on FB_TFT
 	help
 	  Generic Framebuffer support for RA8875
 
 config FB_TFT_S6D02A1
 	tristate "FB driver for the S6D02A1 LCD Controller"
-	depends on FB_TFT
 	help
 	  Generic Framebuffer support for S6D02A1
 

