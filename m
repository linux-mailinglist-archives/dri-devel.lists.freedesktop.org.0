Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F8DAE642D
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 14:03:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFFE210E093;
	Tue, 24 Jun 2025 12:03:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="oPO4EzlQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 352BF10E093
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jun 2025 12:03:49 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 803C943E8E;
 Tue, 24 Jun 2025 12:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1750766627;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CHAiwzXpqXLDPpuzv59uAE+lMbsVeaPtdYUt36LhKe4=;
 b=oPO4EzlQfgkv+lBMzEzWfmiYztuxZnDxePJIipcIYbh5eapFgQuZqJWEnYKghyN7xyVlQy
 WDPyNhxPBMDSrospGpMzgM6GdSzIp/lZSRQDqWiMRd7c8L6O3Bao3Eb4nxhRPzzZiXXx0o
 u5yOaKTTDFzV9sYotPkc/1U8A47oqb+pgXhc3oZTivTe6WGuOPMs1CfkBaLfm4NpGLZe0d
 eQuN3JOj+sV5ylcOsCjIacsxpv/BHQJ5swRzPdqKRdk4BnQku/eb/P1c0D0ghzhiD9OOUh
 rKm/iUcAKTgCug12jhCVZhqqTrHS2tvjtHzQdf3WONBAjM/EyC3tu1A+qHF1rQ==
Date: Tue, 24 Jun 2025 14:03:45 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: dri-devel@lists.freedesktop.org, Andrzej Hajda
 <andrzej.hajda@intel.com>, David Airlie <airlied@gmail.com>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi83: Improve error reporting and
 handling
Message-ID: <20250624140345.77e8780d@bootlin.com>
In-Reply-To: <20250624114630.303058-1-mike.looijmans@topic.nl>
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.213ecd1f-6e92-42df-b45b-58dd7ea05682@emailsignatures365.codetwo.com>
 <20250624114630.303058-1-mike.looijmans@topic.nl>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdduleekgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthekredtredtjeenucfhrhhomhepjfgvrhhvvgcuvehoughinhgruceohhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeviefffeegiedtleelieeghfejleeuueevkeevteegffehledtkeegudeigffgvdenucfkphepvdgrtddumegvtdgrmedvkeehmegsleektdemvgegtdgtmeeitgegfeemsgehsggsmegrgedvkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemvdekheemsgelkedtmegvgedttgemiegtgeefmegshegssgemrgegvdekpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudegpdhrtghpthhtohepmhhikhgvrdhlohhoihhjmhgrnhhssehtohhpihgtrdhnlhdprhgtphhtthhopegurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdhrtghpthhtoheprghnughriigvjhdrhhgrjhgurgesihhnthgvlhdrtghomhdprhgtp
 hhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgrihhlrdgtohhmpdhrtghpthhtohepjhhonhgrsheskhifihgsohhordhsvgdprhgtphhtthhopefnrghurhgvnhhtrdhpihhntghhrghrthesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomh
X-GND-Sasl: herve.codina@bootlin.com
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

Hi Mike,

On Tue, 24 Jun 2025 13:45:15 +0200
Mike Looijmans <mike.looijmans@topic.nl> wrote:

> The datasheet advises to wait 5ms after starting the video stream before
> resetting the error registers. The driver only waits 1ms. Change the
> sequence to match the datasheet:
> - Turn on the DSI
> - Wait 5ms
> - Write 0xFF to CSR 0xE5 to clear the error registers
> 
> Don't read the error register (which may fail), just write 0xff as the
> datasheet suggests.
> 
> The driver creates a timer or IRQ handler that reads the error register,
> which implements the "wait some time and read the register" part.
> 
> When using a timer to poll the status register, the timer did not stop
> when the error handler triggers a reset. This has been observed to cause
> a series of multiple resets. Let handle_errors return a bool indicating
> whether all is fine, and only extend the time when it returns true. That
> also allows the IRQ disable call to move to the interrupt routine.
> 
> When the error handler does trigger, log a message that explains the
> reset cause.
> 
> Fixes: ad5c6ecef27e ("drm: bridge: ti-sn65dsi83: Add error recovery mechanism")
> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
> ---
> 
>  drivers/gpu/drm/bridge/ti-sn65dsi83.c | 50 +++++++++++++++------------
>  1 file changed, 28 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
...

> @@ -929,7 +926,16 @@ static irqreturn_t sn65dsi83_irq(int irq, void *data)
>  {
>  	struct sn65dsi83 *ctx = data;
>  
> -	sn65dsi83_handle_errors(ctx);
> +	if (!sn65dsi83_handle_errors(ctx)) {
> +		/*
> +		 * IRQ acknowledged is not always possible (the bridge can be in
> +		 * a state where it doesn't answer anymore). To prevent an
> +		 * interrupt storm, disable interrupt. The interrupt will be
> +		 * after the reset.

I think I have missed a verb in the last sentence when I previously wrote
the comment.
  "The interrupt will be re-enabled after the reset."
                         ^^^^^^^^^^
Can you fix it ?

Other than that,

Reviewed-by: Herve Codina <herve.codina@bootlin.com>

Thanks,
Hervé
