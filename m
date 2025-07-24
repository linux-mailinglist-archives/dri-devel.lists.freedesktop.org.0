Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A359B10260
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 09:53:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1F5710E8B2;
	Thu, 24 Jul 2025 07:53:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="HZk7I5do";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F188B10E8B2
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 07:53:47 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by mslow3.mail.gandi.net (Postfix) with ESMTP id 4C7F958265E
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 07:29:18 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B6345442A5;
 Thu, 24 Jul 2025 07:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1753342156;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HuSxSBGWYzg8ppmBBZ57GZxUD2NpVmKocyw7538elEk=;
 b=HZk7I5dom0NaZoXNr7ZUaqCxtTPCZ9rz0oAw0TPqYZch3Bberm1JrviipRsaYO21Rp2/tj
 Lx/nw65YKNim+MQMGp0GMWNSo61TbL8Q/zQIvl/v3pRAqrA3q1fcOefiLZgiW691X8+G6B
 ughoeNwQHn9YeB86iUa70KScN23mmKSPuflIZfEearVnbhBqPaa96nIOgGlc0rOawf4kdb
 ZNonISBCN/9qZUZTNykQMimw7GdCPN0IGGLjtUspiZg36Uf5qS/izBTMEL3mTB2ExZBSP0
 gPcIp4yhDNdL1+6sbK6f9M9kAsxAxIPSEsH0P34HuZm3gfIyyztCTa3eIoPIOA==
Date: Thu, 24 Jul 2025 09:29:14 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Salah Triki <salah.triki@gmail.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>, Helge Deller <deller@gmx.de>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] fbdev: atmel_lcdfb: Fix potential NULL dereference
Message-ID: <2025072407291424126a1b@mail.local>
References: <aIGg7erPjz1qJQ1F@pc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aIGg7erPjz1qJQ1F@pc>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdektddthecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomheptehlvgigrghnughrvgcuuegvlhhlohhnihcuoegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegieduueethefhkeegjeevfefhiedujeeuhffgleejgfejgeekueejuefgheeggfenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegvtdgrmegsieehmegsvdhftdemkegsleekmeejledtheemrggsvgelmeduhedvvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemsgeiheemsgdvfhdtmeeksgelkeemjeeltdehmegrsggvleemudehvddvpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeekpdhrtghpthhtohepshgrlhgrhhdrthhrihhkihesghhmrghilhdrtghomhdprhgtphhtthhopehnihgtohhlrghsrdhfvghrrhgvsehmihgtrhhotghhihhprdgtohhmpdhrtghpthhtohepu
 ggvlhhlvghrsehgmhigrdguvgdprhgtphhtthhopegtlhgruhguihhurdgsvgiinhgvrgesthhugihonhdruggvvhdprhgtphhtthhopehlihhnuhigqdhfsgguvghvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepughrihdquggvvhgvlheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: alexandre.belloni@bootlin.com
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

On 24/07/2025 03:56:45+0100, Salah Triki wrote:
> of_match_device() returns NULL in case of failure, so check its return
> value before casting and accessing to data field in order to prevent NULL
> dereference.
> 
> Signed-off-by: Salah Triki <salah.triki@gmail.com>
> ---
>  drivers/video/fbdev/atmel_lcdfb.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/video/fbdev/atmel_lcdfb.c b/drivers/video/fbdev/atmel_lcdfb.c
> index 9dfbc5310210..b1017ac9c73b 100644
> --- a/drivers/video/fbdev/atmel_lcdfb.c
> +++ b/drivers/video/fbdev/atmel_lcdfb.c
> @@ -922,6 +922,7 @@ static int atmel_lcdfb_of_init(struct atmel_lcdfb_info *sinfo)
>  	struct device *dev = &sinfo->pdev->dev;
>  	struct device_node *np =dev->of_node;
>  	struct device_node *display_np;
> +	const struct of_device_id *match;
>  	struct atmel_lcdfb_power_ctrl_gpio *og;
>  	bool is_gpio_power = false;
>  	struct fb_videomode fb_vm;
> @@ -930,8 +931,11 @@ static int atmel_lcdfb_of_init(struct atmel_lcdfb_info *sinfo)
>  	int ret;
>  	int i;
>  
> -	sinfo->config = (struct atmel_lcdfb_config*)
> -		of_match_device(atmel_lcdfb_dt_ids, dev)->data;
> +	match = of_match_device(atmel_lcdfb_dt_ids, dev);
> +	if (!match)
> +		return -ENODEV;

This is dead code, it will never happen because atmel_lcdfb_of_init is only
called from atmel_lcdfb_probe which will only be called when there is a match.

> +
> +	sinfo->config = (struct atmel_lcdfb_config *)match->data;
>  
>  	display_np = of_parse_phandle(np, "display", 0);
>  	if (!display_np) {
> -- 
> 2.43.0
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
