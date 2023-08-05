Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 090DC7710A2
	for <lists+dri-devel@lfdr.de>; Sat,  5 Aug 2023 18:46:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15B1A10E18B;
	Sat,  5 Aug 2023 16:46:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01ABB10E18B
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Aug 2023 16:46:21 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 1C0EF861E6;
 Sat,  5 Aug 2023 18:46:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1691253979;
 bh=RQdRw6SVFAdDjEY7wpgCCM0vKULqBhFkkBBjbtqn5aA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Plf+ZjZPlaPvGj0bCS8eK/kSM7QSub1DewuuyRh/qVNZ4kiXLl3BPzVDcjgyGdq9n
 zVdE1SXgCKokrlufcZTOpbjdlSwQFJYCi3jhYilPHRIOzYvxmUZwmwQqsPouJMQAwy
 oP0pSkxWoFYeSaJ61t/wfxM4lL44PE9jIg4F5NUIwWNymAj9cZR/IphcxTLZPDNNju
 uNLlKMme4sjxDuq+C2r+gBzdV9sxrZnWgzUkC+FaBQxID2zp1O2+B5O3qBkqVPZF5n
 OaSQZmpmwwkk5ig4Y9nh/t/ToP1rRCWg3F6P35vgyo4kpxqRiI8XjvNl/xw1yn9A99
 L6jzw4pTBBSEg==
Message-ID: <5f2f22f5-340b-fdf7-585d-3665a0e8a087@denx.de>
Date: Sat, 5 Aug 2023 18:46:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH] drm/panel: simple: Fix Innolux G156HCE-L01 LVDS clock
Content-Language: en-US
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, dri-devel@lists.freedesktop.org
References: <20230804151010.834990-1-luca.ceresoli@bootlin.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20230804151010.834990-1-luca.ceresoli@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 linux-kernel@vger.kernel.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/4/23 17:10, Luca Ceresoli wrote:
> This panel has been implemented in commit 225213f24c79 ("drm/panel-simple:
> Add Innolux G156HCE-L01 panel entry") with a higher clock than the typical
> one mentioned on the documentation to avoid flickering on the unit
> tested. Testing on a different unit shows that the panel actually works
> with the intended 70.93 MHz clock and even lower frequencies so the
> flickering is likely caused either by a defective unit or by other
> different components such as the bridge.
> 
> Fixes: 225213f24c79 ("drm/panel-simple: Add Innolux G156HCE-L01 panel entry")
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>   drivers/gpu/drm/panel/panel-simple.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 56854f78441e..ec3a73bbfe30 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -2379,7 +2379,7 @@ static const struct panel_desc innolux_g121x1_l03 = {
>   };
>   
>   static const struct display_timing innolux_g156hce_l01_timings = {
> -	.pixelclock = { 120000000, 144000000, 150000000 },
> +	.pixelclock = { 120000000, 141860000, 150000000 },
>   	.hactive = { 1920, 1920, 1920 },
>   	.hfront_porch = { 80, 90, 100 },
>   	.hback_porch = { 80, 90, 100 },

Odd, now I don't see the flicker anymore.

Tested-by: Marek Vasut <marex@denx.de> # MX8MM with LT9211
Reviewed-by: Marek Vasut <marex@denx.de>

Thanks !
