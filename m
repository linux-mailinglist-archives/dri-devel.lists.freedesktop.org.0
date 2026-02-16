Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cDhVJVNCk2kA3AEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 17:14:11 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29239145FA2
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 17:14:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CD3810E087;
	Mon, 16 Feb 2026 16:14:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="OQEK5Azi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F7FF10E087
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 16:14:08 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-4359a302794so2337170f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 08:14:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771258447; x=1771863247; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=0ben+fYxU9x35Dz6yHbOIsof6+Krn5+skByxyeCmdbY=;
 b=OQEK5AziFO3rysQVpOJD6NqmIg3U0CNIPoF6ZQs484Xb2bFnYV64WZJFCDFPozx/f+
 eGmtjo/Ilr0xu+sCIjFEwC0x+PykygZiLR7QBJ3gW+autCr3eDCd39ty7I6wk6EPzZ/n
 cDn++QeFkTpKgPm6JoNW2Izg1cIf6iTL858D8c3W3Z5zmaP6ayXk9NHDnhxydNODdJk1
 m0ImHEzwyPt+rysAOloiH3Z6Qk/8ahUrIXiVnjMgVbQazglgT3pmhVZE0Addfpxea7Jh
 8QhEeWMQOx8VthcpljPxlmuhCrXiTvlBvq2WvTBToxFNYd5UXaU3aQ1LZDjhzDJEnO/T
 L+yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771258447; x=1771863247;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0ben+fYxU9x35Dz6yHbOIsof6+Krn5+skByxyeCmdbY=;
 b=w6j8ndefwYOKOVyfb2mz8uOS+XKWAnsqz2v0/a/2agLnD+STD1vzuJdlSd4kL/o6hJ
 drn4gLDSRZCFnz/RLd2vsLDnHJDKa1fVnYYOXOk6cjth8n7oCTdG5g8Dc9brApfnVs97
 3qPgVue0G9aejwgMjQHwUYJd5rwFTMQDVObInlbZUn/x/jWDz6KLppQ8ppoZg+3DjLdB
 FNRTG/uAugPjtFkEZLb1I1T6YHbvE20MQ5CowHxCTmsACTLcr/8B37kp4PPQDT+bopj/
 NZCFLqDo7t1IsP0vwONWE7mTitaHpRDVR2naVSEf+O8ngIF9Q6uDe9NowdiBbnkN4vYR
 Poqw==
X-Gm-Message-State: AOJu0Yw3Q3/Dmk2IAqmWS9KcSTOL/kC7RjdS5G45gcusOmDELkTeVk0F
 zFIQQH+yj5m9LQRRM3EcQf4kxyOUih5OG3M+JRWJYPfOUO0NsxQ/Pu84k5+7afNWiR0=
X-Gm-Gg: AZuq6aJUDK1XmumIbgjnD37SsehFSOpkNauomo1PuFp8MQjpMj2pDE+uL3o+a8BPoyx
 w5gFI2vIKV5HWypQYUW2qMmL8lezZh7AOP8p5vEXlo5rGb9HqgCVk0rais9Hj050FrbQOcjJUZ6
 yjidEuwsa1goXBGhVx1qw6HnH3r8TuHxYQtpDhfs7uVHLzDHEVLOWn6/H4FYwl7TKu1/GAxoG98
 UgPI/fQZatTlgNlqYzztuf/q5xPcaFFBAsdpu5m0DS9ipQ4f9bm3AtwjS5sJli7Xbaoj8iHYARc
 Hj50QapCS48B17kAYFXUvwsw2qa2VUtLAp0waF6t24bUXfnXCeH6wmM0uNDwfE8ZsnA/wbK7Va9
 WSPI9aKSANbG9Cs5dE3PtsnHBaQwsGVGUChBusFnq9lvcROyL9F/K6GKvT3lXyqilWDbLKLRTBX
 pijphyEXS/bnyuI07ixv64VSBkLk+/PCsNBfsm8VO6+JRVNrJ+aIRsfJftsmAudclORkOiBfqZ4
 AFOxw==
X-Received: by 2002:a05:6000:4310:b0:437:719d:a753 with SMTP id
 ffacd0b85a97d-4379db3414bmr16542788f8f.11.1771258446468; 
 Mon, 16 Feb 2026 08:14:06 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:80b4:8b51:72a6:9e2a?
 ([2a01:e0a:106d:1080:80b4:8b51:72a6:9e2a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796a6a5f0sm27482504f8f.11.2026.02.16.08.14.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Feb 2026 08:14:06 -0800 (PST)
Message-ID: <c588c5b4-82ec-4d4c-a3f4-5f81c6fcebaf@linaro.org>
Date: Mon, 16 Feb 2026 17:14:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v1 2/5] drm/panel: r61307/r69328: convert to
 drm_connector_helper_get_modes_fixed
To: Svyatoslav Ryhel <clamor95@gmail.com>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260215085140.20499-1-clamor95@gmail.com>
 <20260215085140.20499-3-clamor95@gmail.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20260215085140.20499-3-clamor95@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,linaro.org:mid,linaro.org:replyto,linaro.org:dkim,linaro.org:email];
	FORGED_RECIPIENTS(0.00)[m:clamor95@gmail.com,m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch];
	FORGED_SENDER(0.00)[neil.armstrong@linaro.org,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	HAS_ORG_HEADER(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: 29239145FA2
X-Rspamd-Action: no action

On 2/15/26 09:51, Svyatoslav Ryhel wrote:
> Switch to use of drm_connector_helper_get_modes_fixed helper for get_modes
> operation.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>   drivers/gpu/drm/panel/Kconfig                |  2 ++
>   drivers/gpu/drm/panel/panel-renesas-r61307.c | 17 +++--------------
>   drivers/gpu/drm/panel/panel-renesas-r69328.c | 17 +++--------------
>   3 files changed, 8 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index 477c54c90b01..47de5f6a9143 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -700,6 +700,7 @@ config DRM_PANEL_RENESAS_R61307
>   	depends on OF
>   	depends on DRM_MIPI_DSI
>   	depends on BACKLIGHT_CLASS_DEVICE
> +	select VIDEOMODE_HELPERS
>   	help
>   	  Say Y here if you want to enable support for KOE tx13d100vm0eaa
>   	  IPS-LCD module with Renesas R69328 IC. The panel has a 1024x768
> @@ -713,6 +714,7 @@ config DRM_PANEL_RENESAS_R69328
>   	depends on OF
>   	depends on DRM_MIPI_DSI
>   	depends on BACKLIGHT_CLASS_DEVICE
> +	select VIDEOMODE_HELPERS
>   	help
>   	  Say Y here if you want to enable support for JDI dx12d100vm0eaa
>   	  IPS-LCD module with Renesas R69328 IC. The panel has a 720x1280
> diff --git a/drivers/gpu/drm/panel/panel-renesas-r61307.c b/drivers/gpu/drm/panel/panel-renesas-r61307.c
> index 873ef856184b..45afa44af114 100644
> --- a/drivers/gpu/drm/panel/panel-renesas-r61307.c
> +++ b/drivers/gpu/drm/panel/panel-renesas-r61307.c
> @@ -14,6 +14,7 @@
>   #include <drm/drm_mipi_dsi.h>
>   #include <drm/drm_modes.h>
>   #include <drm/drm_panel.h>
> +#include <drm/drm_probe_helper.h>
>   
>   #define R61307_MACP		0xb0 /* Manufacturer CMD Protect */
>   #define   R61307_MACP_ON	0x03
> @@ -202,25 +203,13 @@ static const struct drm_display_mode renesas_r61307_mode = {
>   	.vtotal = 1024 + 24 + 8 + 2,
>   	.width_mm = 76,
>   	.height_mm = 101,
> +	.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
>   };
>   
>   static int renesas_r61307_get_modes(struct drm_panel *panel,
>   				    struct drm_connector *connector)
>   {
> -	struct drm_display_mode *mode;
> -
> -	mode = drm_mode_duplicate(connector->dev, &renesas_r61307_mode);
> -	if (!mode)
> -		return -ENOMEM;
> -
> -	drm_mode_set_name(mode);
> -
> -	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
> -	connector->display_info.width_mm = mode->width_mm;
> -	connector->display_info.height_mm = mode->height_mm;
> -	drm_mode_probed_add(connector, mode);
> -
> -	return 1;
> +	return drm_connector_helper_get_modes_fixed(connector, &renesas_r61307_mode);
>   }
>   
>   static const struct drm_panel_funcs renesas_r61307_panel_funcs = {
> diff --git a/drivers/gpu/drm/panel/panel-renesas-r69328.c b/drivers/gpu/drm/panel/panel-renesas-r69328.c
> index 46287ab04c30..b40bfd702fac 100644
> --- a/drivers/gpu/drm/panel/panel-renesas-r69328.c
> +++ b/drivers/gpu/drm/panel/panel-renesas-r69328.c
> @@ -14,6 +14,7 @@
>   #include <drm/drm_mipi_dsi.h>
>   #include <drm/drm_modes.h>
>   #include <drm/drm_panel.h>
> +#include <drm/drm_probe_helper.h>
>   
>   #define R69328_MACP		0xb0 /* Manufacturer Access CMD Protect */
>   #define   R69328_MACP_ON	0x03
> @@ -167,25 +168,13 @@ static const struct drm_display_mode renesas_r69328_mode = {
>   	.vtotal = 1280 + 6 + 3 + 1,
>   	.width_mm = 59,
>   	.height_mm = 105,
> +	.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
>   };
>   
>   static int renesas_r69328_get_modes(struct drm_panel *panel,
>   				    struct drm_connector *connector)
>   {
> -	struct drm_display_mode *mode;
> -
> -	mode = drm_mode_duplicate(connector->dev, &renesas_r69328_mode);
> -	if (!mode)
> -		return -ENOMEM;
> -
> -	drm_mode_set_name(mode);
> -
> -	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
> -	connector->display_info.width_mm = mode->width_mm;
> -	connector->display_info.height_mm = mode->height_mm;
> -	drm_mode_probed_add(connector, mode);
> -
> -	return 1;
> +	return drm_connector_helper_get_modes_fixed(connector, &renesas_r69328_mode);
>   }
>   
>   static const struct drm_panel_funcs renesas_r69328_panel_funcs = {

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
