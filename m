Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E38F256C11D
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 21:46:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73D1510E231;
	Fri,  8 Jul 2022 19:46:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3928010E227
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 19:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657309562;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vLjxfS/IkYLw35yGStC8uj/FyqMkGDcG5weCQvZVRiw=;
 b=UcCFRvYxdUpr0Ig8rGAe0wnHaolOcBy9nTlcUb+qSteeVDBbBdoyGt5rQYHWHxV0I2UbBO
 j6cPGOAFXvb58HT7tLDx6Ttuzf9tdlJ5axddDktjUVv5R5WLTJz1HnbL//NvErmK7XgYkN
 WLjKCv5qy1wzvfiPO0gkinQfG2ZrrB0=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-120-2cpWypx3ONmtphKW-9irDg-1; Fri, 08 Jul 2022 15:46:00 -0400
X-MC-Unique: 2cpWypx3ONmtphKW-9irDg-1
Received: by mail-ej1-f72.google.com with SMTP id
 e20-20020a170906315400b007262bd0111eso5978022eje.9
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Jul 2022 12:46:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vLjxfS/IkYLw35yGStC8uj/FyqMkGDcG5weCQvZVRiw=;
 b=0xxoROORD9CH2svjxrthDyAPheit23QUNJHdlduayHoMOym0Mk3RCa3bYrJF1pPprR
 Gs7FetgstYur3worpA8oCWHHdUW1rmBnh6HtzOWZ9nBGQRld97dErlIlPyomA8YSHrNy
 3t/GTB6wQ7+HHMxYPya22zhruT9+pOaN3uhhyzaJ2SZamvUPxByJDAgEyAW2D1QO+zGz
 nKjOcaIh3JHZe2CC/LwgGTjA8ez2xWFUhZdCMuwdFTWPehS4aX5vb+s1Sjz5He0hZNjr
 HiuaisoR4AigHF1SsnrubJnAPCul1qIDOqGy1BKHtcv+TJWQcK/Z4hjsXeZD2tV/QXT1
 A4lA==
X-Gm-Message-State: AJIora8aCWa0W7UDQTLMr2op94DxZOSn3pVPJjlNqn4Vm9r4kOB0vr4c
 D4di1uax7r2S2r3Z1N5fCfuxxeMzjXHRRYYg20mWnYtwTIuL43j4NvtXXAGMyPgIZpE4aFtfxfu
 xdY/Ud+N9kCIImrupK0EdRrrJUcvG
X-Received: by 2002:a17:906:84f0:b0:72b:136a:a406 with SMTP id
 zp16-20020a17090684f000b0072b136aa406mr5208088ejb.700.1657309559679; 
 Fri, 08 Jul 2022 12:45:59 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1soRNcaDcTHOuYD8Mr2wY+AfEJyajgo94gJG5OzKtzrgk5L+7s97fmEIdCygRjckvG23MWK6Q==
X-Received: by 2002:a17:906:84f0:b0:72b:136a:a406 with SMTP id
 zp16-20020a17090684f000b0072b136aa406mr5208072ejb.700.1657309559515; 
 Fri, 08 Jul 2022 12:45:59 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81?
 (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
 by smtp.gmail.com with ESMTPSA id
 f13-20020a170906824d00b00726e108b566sm15039136ejx.173.2022.07.08.12.45.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Jul 2022 12:45:59 -0700 (PDT)
Message-ID: <c95724ad-a3b0-2ac8-5413-b971626e7e63@redhat.com>
Date: Fri, 8 Jul 2022 21:45:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 2/5] drm/modes: Extract drm_mode_parse_cmdline_named_mode()
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
References: <cover.1657301107.git.geert@linux-m68k.org>
 <402dea47269f2e3960946d186ba3cb118066e74a.1657301107.git.geert@linux-m68k.org>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <402dea47269f2e3960946d186ba3cb118066e74a.1657301107.git.geert@linux-m68k.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: linux-fbdev@vger.kernel.org, linux-m68k@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 7/8/22 20:21, Geert Uytterhoeven wrote:
> Extract the code to check for a named mode parameter into its own
> function, to streamline the main parsing flow.
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
>  drivers/gpu/drm/drm_modes.c | 41 +++++++++++++++++++++++++++----------
>  1 file changed, 30 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
> index 30a7be97707bfb16..434383469e9d984d 100644
> --- a/drivers/gpu/drm/drm_modes.c
> +++ b/drivers/gpu/drm/drm_modes.c
> @@ -1749,6 +1749,30 @@ static const char * const drm_named_modes_whitelist[] = {
>  	"PAL",
>  };
>  
> +static int drm_mode_parse_cmdline_named_mode(const char *name,
> +					     unsigned int length,
> +					     bool refresh,
> +					     struct drm_cmdline_mode *mode)
> +{
> +	unsigned int i;
> +	int ret;
> +
> +	for (i = 0; i < ARRAY_SIZE(drm_named_modes_whitelist); i++) {
> +		ret = str_has_prefix(name, drm_named_modes_whitelist[i]);
> +		if (!ret)

As discussed in my review of 1/5 this needs to become:

		if (ret != length)
> +			continue;

Which renders my other comment on this patch (length not being used) mute.

Regards,

Hans

> +
> +		if (refresh)
> +			return -EINVAL; /* named + refresh is invalid */
> +
> +		strcpy(mode->name, drm_named_modes_whitelist[i]);
> +		mode->specified = true;
> +		return 0;
> +	}
> +
> +	return 0;
> +}
> +
>  /**
>   * drm_mode_parse_command_line_for_connector - parse command line modeline for connector
>   * @mode_option: optional per connector mode option
> @@ -1785,7 +1809,7 @@ bool drm_mode_parse_command_line_for_connector(const char *mode_option,
>  	const char *bpp_ptr = NULL, *refresh_ptr = NULL, *extra_ptr = NULL;
>  	const char *options_ptr = NULL;
>  	char *bpp_end_ptr = NULL, *refresh_end_ptr = NULL;
> -	int i, len, ret;
> +	int len, ret;
>  
>  	memset(mode, 0, sizeof(*mode));
>  	mode->panel_orientation = DRM_MODE_PANEL_ORIENTATION_UNKNOWN;
> @@ -1823,16 +1847,11 @@ bool drm_mode_parse_command_line_for_connector(const char *mode_option,
>  	}
>  
>  	/* First check for a named mode */
> -	for (i = 0; mode_end && i < ARRAY_SIZE(drm_named_modes_whitelist); i++) {
> -		ret = str_has_prefix(name, drm_named_modes_whitelist[i]);
> -		if (ret) {
> -			if (refresh_ptr)
> -				return false; /* named + refresh is invalid */
> -
> -			strcpy(mode->name, drm_named_modes_whitelist[i]);
> -			mode->specified = true;
> -			break;
> -		}
> +	if (mode_end) {
> +		ret = drm_mode_parse_cmdline_named_mode(name, mode_end,
> +							refresh_ptr, mode);
> +		if (ret)
> +			return false;
>  	}
>  
>  	/* No named mode? Check for a normal mode argument, e.g. 1024x768 */

