Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76AAE6FCBBF
	for <lists+dri-devel@lfdr.de>; Tue,  9 May 2023 18:52:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1F8210E39E;
	Tue,  9 May 2023 16:52:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay6-1.pub.mailoutpod2-cph3.one.com
 (mailrelay6-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:405::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A06A10E39E
 for <dri-devel@lists.freedesktop.org>; Tue,  9 May 2023 16:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=cOysKkMBNzDpcv5J2MsGIrd6IfUZXEEIlgYWc9yAK1I=;
 b=Amwj4o2W9+x26XSYidQ/xfjam9GfElktepI4/ezdc6Di/JAz0kJvOa7H9OAIf56tAysvU/tXe3M3v
 TL6HeGLz5FevtuATssXRb92xxS76qq6gZToR06QaFb/wP8fAXgXV0m9im8bvPTRqoSyBZK7HyKGK6S
 CuHuha/2o4ihYd9eE2fi8mtqptzxnx18mq0BWuzXNryagE+Xu8OrA2aAHo4jK/aUX/qJco4VJThz9+
 mndVlUyRZiPAzF55bOhzBkfWYjGCUpnED5au0AGdjZFJzKJsAaxFdL9HpOJeNPcfxXWwBAfmvBNwgi
 djeMx/mSgSVtHhAVDZ8hmQeuwErhIow==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=cOysKkMBNzDpcv5J2MsGIrd6IfUZXEEIlgYWc9yAK1I=;
 b=qafW83QT/OqXnpLt+q4/N/9s/XB8IE/qbub0+3tIQ4iXiI+0eetRFTeoUfa7/wjKNHSdig+xPcFDo
 bqfTGNdCQ==
X-HalOne-ID: e4221e17-ee89-11ed-90db-6f01c1d0a443
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay6 (Halon) with ESMTPSA
 id e4221e17-ee89-11ed-90db-6f01c1d0a443;
 Tue, 09 May 2023 16:52:34 +0000 (UTC)
Date: Tue, 9 May 2023 18:52:32 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Maximilian Weigand <mweigand2017@gmail.com>
Subject: Re: [PATCH v1] backlight: lm3630a: turn off both led strings when
 display is blank
Message-ID: <20230509165232.GA1072872@ravnborg.org>
References: <20230505185752.969476-1-mweigand2017@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230505185752.969476-1-mweigand2017@gmail.com>
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
Cc: linux-pwm@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Lee Jones <lee@kernel.org>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Maximilian Weigand <mweigand@mweigand.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 05, 2023 at 08:57:52PM +0200, Maximilian Weigand wrote:
> From: Maximilian Weigand <mweigand@mweigand.net>
> 
> Use display_is_blank() to determine if the led strings should be turned
> off in the update_status() functions of both strings.
> 
> Signed-off-by: Maximilian Weigand <mweigand@mweigand.net>
> ---
>  drivers/video/backlight/lm3630a_bl.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/video/backlight/lm3630a_bl.c b/drivers/video/backlight/lm3630a_bl.c
> index d8c42acecb5d..5498b57329f9 100644
> --- a/drivers/video/backlight/lm3630a_bl.c
> +++ b/drivers/video/backlight/lm3630a_bl.c
> @@ -202,7 +202,9 @@ static int lm3630a_bank_a_update_status(struct backlight_device *bl)
>  	usleep_range(1000, 2000);
>  	/* minimum brightness is 0x04 */
>  	ret = lm3630a_write(pchip, REG_BRT_A, bl->props.brightness);
> -	if (bl->props.brightness < 0x4)
> +
> +	if (backlight_is_blank(bl) || (bl->props.brightness < 0x4))
You could replace bl->props.brightness with backlight_get_brightness(bl)
to avoid direct access to the properties.

> +		/* turn the string off  */
>  		ret |= lm3630a_update(pchip, REG_CTRL, LM3630A_LEDA_ENABLE, 0);
>  	else
>  		ret |= lm3630a_update(pchip, REG_CTRL,
> @@ -277,7 +279,9 @@ static int lm3630a_bank_b_update_status(struct backlight_device *bl)
>  	usleep_range(1000, 2000);
>  	/* minimum brightness is 0x04 */
>  	ret = lm3630a_write(pchip, REG_BRT_B, bl->props.brightness);
> -	if (bl->props.brightness < 0x4)
> +
> +	if (backlight_is_blank(bl) || (bl->props.brightness < 0x4))
Same here

	Sam
