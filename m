Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YI2TMwhdqGmQtwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 17:25:44 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67289204310
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 17:25:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC17410EA51;
	Wed,  4 Mar 2026 16:25:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="S4pfhB50";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4222F10EA51
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2026 16:25:41 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-483a2338616so44443835e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Mar 2026 08:25:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772641540; x=1773246340; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=1Gp7LS/GMjpgQsWMfi+qSIWrnrcb+aaUnysqcUKFRag=;
 b=S4pfhB50mZhaUgluccU8qrKliOsTvWdrfANM/25LSMscQHQmgsiTWkvLemQmQotxiv
 tsiqlUK69NxZFZ7Xlw2HqTO5iOYKv3kYo9L53Nsg3Tszr+Ivqi3Ta+BTKdTXWqWDHjBZ
 S0dX314toIqtniMKpD5Lwh7sil7M74aMoTQndXq9aMtOL4+4dk7ngyg1Aj06jhQmorAS
 NIaJbcszTwl71XUe5UPS8IGbM8hFsrV+LyZdTvKp2CCgt+IupbehPkDC9Nwwks9LOPf0
 vuCAH/PyYiZu8CbFnAIKzvKPsbpICf5SuI1B7DFidwTFmzdxTswax6lmzbtfOH/3auRh
 WQzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772641540; x=1773246340;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1Gp7LS/GMjpgQsWMfi+qSIWrnrcb+aaUnysqcUKFRag=;
 b=R6IKzC/gxZephtE9Crprpo2S+1VuX/T6Z/tNyknaVUQPFO3w6neKHStYMuMUI+oja+
 pY2hFMmtq3dzIYQdzZY6RTYUUB2R8wGcXkQ09ZSYVlyAQK+wR8y5i0AEdS/ZHjM978dn
 omk+uWK0ijbe+M2p9oi5cyXzDwsnig/Ow3PrBxUzwcjZu3L/unKzz66EinQ9g+g45w0s
 J3TMUiSfVeupQlTf1wDO4RZ1J8QBe3GDUqOAH3EBV9Gt8eCHs7V91M66BIxNBKYOTeLr
 TGRsCHjNlvcTNGpfC9TXcWW7x+Tx1kauTITwNgwAOq/fZMUcZAA6ioZvv3wkrfYAIfSw
 fc+Q==
X-Gm-Message-State: AOJu0Yxayr+s8uikZ5JMy+t6arAuAQHNJ3P/vdg9yAQ8/YV3qb30FUT8
 fJ4gq7bPCKwTBL4sDMNKgYpkQ24rcBfP4usJ1TiTax0CzqKD6kw9PqixQ7Uqi/rCeTg=
X-Gm-Gg: ATEYQzzIIGvoDOWcAzGBAyc1osMDt1jOTdFpLN4hRS0w3RRA4iyRs+TMnJhGSvnZFeD
 eQ2ksCShyde0P3jeH6eczlBbCxtU/m5VjjdvLGGHJhd2AKQbje4z7LQFziQywiVJi2DJ2gxxIm3
 JUuwISzsZ/qaG2x4SzuY+VLT+o8sQGOZpHw5dzZLc/mR9+knmCEvH6gehBk/zXa+rOLKG2o44Sc
 BlIPmuCxcd68pXBiRcFGBfcghAf3lpZ+E9ptz0X0tv0Wgl0ocm94pAeKFwhZLmCN7q1Ba5uC1cG
 l3o2uacKpbUc9+5Qj1qXbDcgDze6NqD6EadZLbyPMJ8EiqT9uKM1kLMhO2ln7MSEo8rzY8AGyrB
 wBsShLkgaJPdq5gNYl5FtWc6Prh744RcuNtE5Bp72SB0p60UUI/pVX4/FAqwBZEzTD+4HZsv75M
 QNSiEanQ3E2VU8Btrsdi1bFwuJqEm3Foe1a1KuXq+uV3aq1LF6Eft5KpoOEXEAFsPlFhp96pXpS
 3u3siTsFrz4GwQ=
X-Received: by 2002:a05:600c:a0a:b0:477:7a53:f493 with SMTP id
 5b1f17b1804b1-48519895542mr45844535e9.23.1772641539675; 
 Wed, 04 Mar 2026 08:25:39 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:da6:dde3:e477:94d2?
 ([2a01:e0a:106d:1080:da6:dde3:e477:94d2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4851884224fsm62339335e9.4.2026.03.04.08.25.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Mar 2026 08:25:39 -0800 (PST)
Message-ID: <eb361483-736e-44ff-bf55-8b833f083ce2@linaro.org>
Date: Wed, 4 Mar 2026 17:25:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/2] drm/panel: simple: Add Powertip PH800480T032-ZHC19
 panel
To: Florijan Plohl <florijan.plohl@norik.com>,
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, upstream@lists.phytec.de
References: <20260217123759.169317-1-florijan.plohl@norik.com>
 <20260217123759.169317-2-florijan.plohl@norik.com>
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
In-Reply-To: <20260217123759.169317-2-florijan.plohl@norik.com>
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
X-Rspamd-Queue-Id: 67289204310
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:florijan.plohl@norik.com,m:jesszhan0024@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:thierry.reding@gmail.com,m:sam@ravnborg.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:upstream@lists.phytec.de,m:krzk@kernel.org,m:conor@kernel.org,m:thierryreding@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[norik.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,ravnborg.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[neil.armstrong@linaro.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,linaro.org:dkim,linaro.org:email,linaro.org:mid,linaro.org:replyto];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Action: no action

On 2/17/26 13:37, Florijan Plohl wrote:
> Add support for the Powertip PH800480T032-ZHC19 7" (800x480) parallel
> LCD-TFT panel.
> 
> Signed-off-by: Florijan Plohl <florijan.plohl@norik.com>
> ---
>   drivers/gpu/drm/panel/panel-simple.c | 30 ++++++++++++++++++++++++++++
>   1 file changed, 30 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 91ab280869ba..aa74f310d455 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -4068,6 +4068,33 @@ static const struct panel_desc powertip_ph800480t013_idf02  = {
>   	.connector_type = DRM_MODE_CONNECTOR_DPI,
>   };
>   
> +static const struct drm_display_mode powertip_ph800480t032_zhc19_mode = {
> +	.clock = 27200,
> +	.hdisplay = 800,
> +	.hsync_start = 800 + 52,
> +	.hsync_end = 800 + 52 + 2,
> +	.htotal = 800 + 52 + 2 + 44,
> +	.vdisplay = 480,
> +	.vsync_start = 480 + 7,
> +	.vsync_end = 480 + 7 + 2,
> +	.vtotal = 480 + 7 + 2 + 2,
> +};
> +
> +static const struct panel_desc powertip_ph800480t032_zhc19 = {
> +	.modes = &powertip_ph800480t032_zhc19_mode,
> +	.num_modes = 1,
> +	.bpc = 8,
> +	.size = {
> +		.width = 152,
> +		.height = 91,
> +	},
> +	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
> +	.bus_flags = DRM_BUS_FLAG_DE_HIGH |
> +		DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE |
> +		DRM_BUS_FLAG_SYNC_SAMPLE_NEGEDGE,
> +	.connector_type = DRM_MODE_CONNECTOR_DPI,
> +};
> +
>   static const struct drm_display_mode primeview_pm070wl4_mode = {
>   	.clock = 32000,
>   	.hdisplay = 800,
> @@ -5481,6 +5508,9 @@ static const struct of_device_id platform_of_match[] = {
>   	}, {
>   		.compatible = "powertip,ph800480t013-idf02",
>   		.data = &powertip_ph800480t013_idf02,
> +	}, {
> +		.compatible = "powertip,ph800480t032-zhc19",
> +		.data = &powertip_ph800480t032_zhc19,
>   	}, {
>   		.compatible = "primeview,pm070wl4",
>   		.data = &primeview_pm070wl4,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
