Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7CBC93BFB
	for <lists+dri-devel@lfdr.de>; Sat, 29 Nov 2025 11:28:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 953A010E1CF;
	Sat, 29 Nov 2025 10:28:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="FMyP9X19";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2496010E1CF
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Nov 2025 10:28:01 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 197DB4E41971;
 Sat, 29 Nov 2025 10:28:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id C6FE560706;
 Sat, 29 Nov 2025 10:27:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 79948102F274D; Sat, 29 Nov 2025 11:27:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1764412079; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=gzvuaBZkisdI8uhv3itEmVnMdXtPgcQ087X+dPKk1go=;
 b=FMyP9X19OZgcb2FZJK6VpKkGEV5sjwrm95J+AAY2pWsNYT13BY1gTV3X24Yu6Ovy1pY3Da
 4W1yR2qjK9cu0fDjuBmvBD7W+KKyh7o3ejf1IBPJ04IE18Ccz7xBITDFfkVXC88eCEBu7R
 d1S+frJebLBbCKU4tJWbeu7fTrisq821sxUpq4FmKGf+Zv6NWLUmK4V3XL923Dm/r6I+7s
 AZ+6tlO4grB0nK8aKMyCc9HHnyV0KU068YR6y0Aixh0zkkcMXKnaL8uAtiCouBsvqddUyQ
 8l1FwuFukDmOlxRf/+XgH9k4GVwxhJFukJZ/ccn98UOFB2Xc9MmDAnDIn727iQ==
Message-ID: <a4edce66-d08a-4b82-9472-b22f2fdb34eb@bootlin.com>
Date: Sat, 29 Nov 2025 11:27:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] backlight: Add Congatec Board Controller (CGBC)
 backlight support
To: petri.karhula@novatron.fi, Lee Jones <lee@kernel.org>,
 Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org
References: <20251127-cgbc-backlight-v4-0-626523b7173d@novatron.fi>
 <20251127-cgbc-backlight-v4-1-626523b7173d@novatron.fi>
Content-Language: en-US
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <20251127-cgbc-backlight-v4-1-626523b7173d@novatron.fi>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
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

On 11/27/25 4:21 PM, Petri Karhula via B4 Relay wrote:
> From: Petri Karhula <petri.karhula@novatron.fi>
> 
> This driver provides backlight brightness control through the Linux
> backlight subsystem. It communicates with the board controller to
> adjust LCD backlight using PWM signals. Communication is done
> through Congatec Board Controller core driver.
> 

[...]

> +		bl_data->current_brightness = reply_buf[0] & BLT_PWM_DUTY_MASK;
> +
> +		/* Verify the setting was applied correctly */
> +		if (bl_data->current_brightness != brightness) {
> +			dev_err(bl_data->dev,
> +				"Brightness setting verification failed\n");
> +			return -EIO;
> +		}

I'm still not really convinced by other error messages, but okay let's
keep them. Maybe add current and requested brightnesses in this message,
it could be useful for debugging.

	"Brightness setting verification failed (X instead of Y)"

Otherwise looks good to me. I will test your series

Reviewed-by: Thomas Richard <thomas.richard@bootlin.com>

Best Regards,
Thomas
