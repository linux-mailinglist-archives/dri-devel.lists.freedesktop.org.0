Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64078747820
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jul 2023 20:05:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B09510E30A;
	Tue,  4 Jul 2023 18:05:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 544 seconds by postgrey-1.36 at gabe;
 Tue, 04 Jul 2023 15:40:59 UTC
Received: from unicorn.mansr.com (unicorn.mansr.com [81.2.72.234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F36D910E12D
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jul 2023 15:40:59 +0000 (UTC)
Received: from raven.mansr.com (raven.mansr.com [81.2.72.235])
 by unicorn.mansr.com (Postfix) with ESMTPS id 0FA9115360;
 Tue,  4 Jul 2023 16:31:52 +0100 (BST)
Received: by raven.mansr.com (Postfix, from userid 51770)
 id B9EEA219FC1; Tue,  4 Jul 2023 16:31:51 +0100 (BST)
From: =?iso-8859-1?Q?M=E5ns_Rullg=E5rd?= <mans@mansr.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
Subject: Re: [PATCH] backlight: led_bl: fix initial power state
References: <20230704140750.25799-1-mans@mansr.com>
 <20230704150310.GA385243@aspen.lan>
Date: Tue, 04 Jul 2023 16:31:51 +0100
In-Reply-To: <20230704150310.GA385243@aspen.lan> (Daniel Thompson's message of
 "Tue, 4 Jul 2023 16:03:10 +0100")
Message-ID: <yw1xo7krzo9k.fsf@mansr.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 04 Jul 2023 18:05:31 +0000
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
Cc: linux-fbdev@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, Lee Jones <lee@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Daniel Thompson <daniel.thompson@linaro.org> writes:

> On Tue, Jul 04, 2023 at 03:07:50PM +0100, Mans Rullgard wrote:
>> The condition for the initial power state based on the default
>> brightness value is reversed.  Fix it.
>>
>> Fixes: ae232e45acf9 ("backlight: add led-backlight driver")
>> Signed-off-by: Mans Rullgard <mans@mansr.com>
>> ---
>>  drivers/video/backlight/led_bl.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/video/backlight/led_bl.c b/drivers/video/backlight/=
led_bl.c
>> index 3259292fda76..28e83618a296 100644
>> --- a/drivers/video/backlight/led_bl.c
>> +++ b/drivers/video/backlight/led_bl.c
>> @@ -200,8 +200,8 @@ static int led_bl_probe(struct platform_device *pdev)
>>  	props.type =3D BACKLIGHT_RAW;
>>  	props.max_brightness =3D priv->max_brightness;
>>  	props.brightness =3D priv->default_brightness;
>> -	props.power =3D (priv->default_brightness > 0) ? FB_BLANK_POWERDOWN :
>> -		      FB_BLANK_UNBLANK;
>> +	props.power =3D (priv->default_brightness > 0) ? FB_BLANK_UNBLANK :
>> +		      FB_BLANK_POWERDOWN;
>
> The logic was wrong before but I think will still be wrong after the
> change too (e.g. the bogus logic is probably avoiding backlight flicker
> in some use cases).
>
> The logic here needs to be similar to what pwm_bl.c implements in
> pwm_backlight_initial_power_state(). Whilst it might be better
> to implement this in led_bl_get_leds() let me show what I mean
> in code that fits in the current line:
>
> 	/*
> 	 * Activate the backlight if the LEDs are already lit *or*
> 	 * there is no phandle link (meaning the backlight power
> 	 * state cannot be synced with the display state).
> 	 */
> 	props.power =3D (active_at_boot || !dev->node->phandle) ?
> 			FB_BLANK_UNBLANK : FB_BLANK_POWERDOWN;
>
> Note that active_at_boot is not the same as (priv->default_brightness > 0)
> since the value read by led_bl_get_leds() can be clobbered when we
> parse the properties.

Am I understanding correctly that the code should be using the
default_brightness value as set by led_bl_get_leds() to determine the
initial power state, not whatever default value the devicetree provides?

--=20
M=E5ns Rullg=E5rd
