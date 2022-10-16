Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61ED0600115
	for <lists+dri-devel@lfdr.de>; Sun, 16 Oct 2022 18:11:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 139D110E82F;
	Sun, 16 Oct 2022 16:11:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0AD210E82F;
 Sun, 16 Oct 2022 16:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202112;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SoBF0g+FxVXYhyEJbqnBUYS67u0wCvqTfgLTEmDo6Rs=; b=chyU99w3w9UnsJiZdgEZxPywYK
 2KFqsArMDjFwStLaJzCr0FFMBxUEZdZSor1/8gZukX9II02z5mT8+lPXJWm5X5KybeOaDgyjfUVXx
 nSd9rTChH84m+/0qpy3JcAB9/zqz528MlroFmgwAk3KsiLi34gVTMlrQZUUqkr/sWHT149wrgyGbw
 ACRXUuRsqa1btBXk7YTvArU3dnpTkza00kF5bK3PxTtiGfy5+0V5z0VlP6JSfRgMqrv7Jt+V/cJMy
 AycYhU90dxCflKYFL6EbN34GAlb/nPpojAQLos+HyhvPPTelcr1bp2sWGdu/t2coHum3e+KJaAnOd
 PmE/yO7Q==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:51414
 helo=[192.168.10.61])
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1ok6Ec-0003SN-2l; Sun, 16 Oct 2022 18:11:30 +0200
Message-ID: <729f849a-0287-a2fb-125f-892b4dd6053f@tronnes.org>
Date: Sun, 16 Oct 2022 18:11:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v5 08/22] drm/modes: Move named modes parsing to a
 separate function
To: Maxime Ripard <maxime@cerno.tech>, Karol Herbst <kherbst@redhat.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@linux.ie>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Lyude Paul <lyude@redhat.com>, Maxime Ripard <mripard@kernel.org>,
 Emma Anholt <emma@anholt.net>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Ben Skeggs <bskeggs@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>
References: <20220728-rpi-analog-tv-properties-v5-0-d841cc64fe4b@cerno.tech>
 <20220728-rpi-analog-tv-properties-v5-8-d841cc64fe4b@cerno.tech>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20220728-rpi-analog-tv-properties-v5-8-d841cc64fe4b@cerno.tech>
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
Cc: Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 13.10.2022 15.18, skrev Maxime Ripard:
> The current construction of the named mode parsing doesn't allow to extend
> it easily. Let's move it to a separate function so we can add more
> parameters and modes.
> 
> In order for the tests to still pass, some extra checks are needed, so
> it's not a 1:1 move.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> 

I was hoping that someone else would step up and review these parser
patches since the parser code is rather difficult to read, for me at
least. I have studied it now, so I'll give it a try.

> ---
> Changes in v4:
> - Fold down all the named mode patches that were split into a single
>   patch again to maintain bisectability
> ---
>  drivers/gpu/drm/drm_modes.c | 73 ++++++++++++++++++++++++++++++++++++++-------
>  1 file changed, 62 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
> index c0dceff51cac..2f020ef2ddf2 100644
> --- a/drivers/gpu/drm/drm_modes.c
> +++ b/drivers/gpu/drm/drm_modes.c
> @@ -2229,6 +2229,55 @@ static const char * const drm_named_modes_whitelist[] = {
>  	"PAL",
>  };
>  
> +static int drm_mode_parse_cmdline_named_mode(const char *name,
> +					     unsigned int name_end,
> +					     struct drm_cmdline_mode *cmdline_mode)
> +{
> +	unsigned int i;
> +
> +	if (!name_end)
> +		return 0;

name_end can't be zero since the argument is checked before calling this
function.

> +
> +	/* If the name starts with a digit, it's not a named mode */
> +	if (isdigit(name[0]))
> +		return 0;
> +
> +	/*
> +	 * If there's an equal sign in the name, the command-line
> +	 * contains only an option and no mode.
> +	 */
> +	if (strnchr(name, name_end, '='))
> +		return 0;

I think this check actually belongs in
drm_mode_parse_command_line_for_connector() after options_off is set. If
theres an equal sign it should skip all mode parsing and skip down to
drm_mode_parse_cmdline_options(). Which probably means that the mode
parsing should have been moved out to separate function to avoid using a
goto.
But that's probably beyond the scope of this patchset :)

> +
> +#define STR_STRICT_EQ(str, len, cmp) \
> +	(str_has_prefix(str, cmp) == len)
> +
> +	/* The connection status extras can be set without a mode. */
> +	if (STR_STRICT_EQ(name, name_end, "d") ||
> +	    STR_STRICT_EQ(name, name_end, "D") ||
> +	    STR_STRICT_EQ(name, name_end, "e"))
> +		return 0;

It took me a while to understand what is going on here.
If str_has_prefix() finds a match it returns strlen(prefix). Since
prefix is always of length 1, name_end has to always be 1 for the
statement to be true.

I would have written it like this:

	/* The connection status extras can be set without a mode. */
	if (name_end == 1) {
		if (name[0] == "d" || name[0] == "D" || name[0] == "e")
			return 0;
	}

> +
> +	/*
> +	 * We're sure we're a named mode at that point, iterate over the

that -> this ?

> +	 * list of modes we're aware of.
> +	 */
> +	for (i = 0; i < ARRAY_SIZE(drm_named_modes_whitelist); i++) {
> +		int ret;
> +
> +		ret = str_has_prefix(name, drm_named_modes_whitelist[i]);
> +		if (ret != name_end)
> +			continue;
> +
> +		strcpy(cmdline_mode->name, drm_named_modes_whitelist[i]);
> +		cmdline_mode->specified = true;
> +
> +		return 1;
> +	}
> +
> +	return -EINVAL;
> +}
> +
>  /**
>   * drm_mode_parse_command_line_for_connector - parse command line modeline for connector
>   * @mode_option: optional per connector mode option
> @@ -2265,7 +2314,7 @@ bool drm_mode_parse_command_line_for_connector(const char *mode_option,
>  	const char *bpp_ptr = NULL, *refresh_ptr = NULL, *extra_ptr = NULL;
>  	const char *options_ptr = NULL;
>  	char *bpp_end_ptr = NULL, *refresh_end_ptr = NULL;
> -	int i, len, ret;
> +	int len, ret;
>  
>  	memset(mode, 0, sizeof(*mode));
>  	mode->panel_orientation = DRM_MODE_PANEL_ORIENTATION_UNKNOWN;
> @@ -2306,17 +2355,19 @@ bool drm_mode_parse_command_line_for_connector(const char *mode_option,
>  		parse_extras = true;
>  	}
>  
> -	/* First check for a named mode */
> -	for (i = 0; i < ARRAY_SIZE(drm_named_modes_whitelist); i++) {
> -		ret = str_has_prefix(name, drm_named_modes_whitelist[i]);
> -		if (ret == mode_end) {
> -			if (refresh_ptr)
> -				return false; /* named + refresh is invalid */
>  
> -			strcpy(mode->name, drm_named_modes_whitelist[i]);
> -			mode->specified = true;
> -			break;
> -		}
> +	if (mode_end) {

Shouldn't this be:

	if (!mode_end)
		return false;

I can't see how mode_end == 0 can produce anything valid.
Scenarios for mode_option that gives mode_end == 0:
- zero length
- starts with a comma
- starts with -bpp
- starts with @refresh

Maybe it's a separate patch with matching tests ;)

Noralf.

> +		ret = drm_mode_parse_cmdline_named_mode(name, mode_end, mode);
> +		if (ret < 0)
> +			return false;
> +
> +		/*
> +		 * Having a mode that starts by a letter (and thus is named)
> +		 * and an at-sign (used to specify a refresh rate) is
> +		 * disallowed.
> +		 */
> +		if (ret && refresh_ptr)
> +			return false;
>  	}
>  
>  	/* No named mode? Check for a normal mode argument, e.g. 1024x768 */
> 
