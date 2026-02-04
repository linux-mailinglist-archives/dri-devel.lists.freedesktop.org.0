Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MMz6CPo/g2kPkQMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 13:47:54 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 673DCE5FA9
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 13:47:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FC3110E0D4;
	Wed,  4 Feb 2026 12:47:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="VUjUlfCY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23DE510E0D4
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Feb 2026 12:47:48 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-42fb6ce71c7so5775506f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Feb 2026 04:47:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770209267; x=1770814067; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=JZ4TgjfnscnBfCWxdLeUdMlZj/3MYBeNA0M0+tMlZq8=;
 b=VUjUlfCYtiXxT4gSoO4cSR0hyqOBcGGSmLiixiP/A8AqOZhKSotFKtOFUXuC3WH6Gj
 OkGdyYkMwSFDAdMz+CtsasT0vZoQyjxAuARGqY6jIKf+c2ENfTxYZ2yh6HbSPgywuJpV
 TWZS7av8Wtqx5ZU+PofCP63HInfWXckgHuMUToVOr/ovugwXH28U3IR62chAROI3RXQw
 aVp5a+4eeEBp4T4Ute32c2jFChSs8ZMuc++35U16n/GkuP9S9947zcObZEjXJINH9PDm
 Zgpw63DBFzVmlQU+Sqm0Iqctx88204Vx6qO5CSLitWyxaE7H94BwMjVf8jNKKOHy49/t
 Az0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770209267; x=1770814067;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JZ4TgjfnscnBfCWxdLeUdMlZj/3MYBeNA0M0+tMlZq8=;
 b=GcqPHM5dgDU+Yz2WE4YaAxOeJGcnGBYsSghHFQg0Cecjmz4XmtAVe0zPu0Rs7rqX2j
 /9Xt2xUPDDHzcQWDKNZ4AyQ2PqqVoDePsvo7YWLQbde7yxPauA+dDsZxlwL+mWTTStOW
 n9X4r5Ml/sbDqrn617igvgTsfcFIkmDbhXhp5345+Qah6NZuboKWHTiddKkBVVkpeTiL
 oWOTV/70AvBdpLH70N257pna9Wv3qmt6q2I+ovpaRQS6JoLwAddWzLBEt0SGhw8vyFcb
 mQ2xjYHDRXhxHZiemKgxOiHFbpkrUqVjvtg14gDiZJwjB9aRkaD5Qax30rW8IJXO+4wz
 FbJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVdCW9yYkm6BqxxukTcG0mhLXAiliX9BKLEq7B7ZcFKu27Culs/oe03Amck5vHlR1m4P8qmsOoK/co=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyz9MSNGtDt/LPmvXMuiqXrNE8UfaudkYyY/4Q8n0BZPRsexjtQ
 A2ZHMHgJUsQ8FTQP6GUPgP3rIBhENF+U9nxfcQup67JeTM5Y+XZrtN1Czyd21R/3rGo=
X-Gm-Gg: AZuq6aJ2ZaaEaWi44CzoQs90t3bKwgVAJJViCTcPypk4qF9EI2HSRuuzyCZUQooGKfz
 chqyY5hEmXh++ho20sxO4j4Y5L3kX+7bSmHohoBMCuGbqXOxXW9RtjYfgN0xBYEo1/V4o2UhnC3
 Q8V+EuRV6S5/RXcC+T4ZSgVNrsKnNO2lzRS66wpzt+kztmi8FWE4g/x7u0xA2G7IXVW7eTLlwrd
 sjjXIgLjFohLnBvjjTK1P4AUKWsZUEVTQdeRhdeaRRjeA0rxSzpDR7tk3gsrx21/RnFl8cQ8BXc
 Fnsw5H8DoZ/vRTLXGQhECXPABZOMtgmNMjqxG5wffNCJHZvjVogD0XXj3uYFZvnCUE6pd9JXGgm
 74wY4IV6LKG5/DBKHCKiibv826BvfXda3keruWwpDeRgSr6F1F3Xe6BRA6lISiS3jMRyQrICVqV
 Youl9bgbGE7IZsa/PAEQ2OmeUv855PIo5uN12//vwobLYmD6U9BKqstG8X/G14YQ8=
X-Received: by 2002:a05:6000:60f:b0:432:5d73:79a1 with SMTP id
 ffacd0b85a97d-436180615e4mr3671943f8f.55.1770209266489; 
 Wed, 04 Feb 2026 04:47:46 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:b55c:58f7:42fa:3dbf?
 ([2a01:e0a:3d9:2080:b55c:58f7:42fa:3dbf])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4361805f25dsm6504064f8f.29.2026.02.04.04.47.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Feb 2026 04:47:46 -0800 (PST)
Message-ID: <02c99c62-4f53-41ec-b127-ac6e8653608c@linaro.org>
Date: Wed, 4 Feb 2026 13:47:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 0/4] drm/panel: ilitek-ili9806e: add Rocktech
 RK050HR345-CT106A support
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com, Conor Dooley <conor+dt@kernel.org>,
 David Airlie <airlied@gmail.com>, Jessica Zhang <jesszhan0024@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20260203075548.14907-1-dario.binacchi@amarulasolutions.com>
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
In-Reply-To: <20260203075548.14907-1-dario.binacchi@amarulasolutions.com>
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
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dario.binacchi@amarulasolutions.com,m:linux-kernel@vger.kernel.org,m:linux-amarula@amarulasolutions.com,m:conor+dt@kernel.org,m:airlied@gmail.com,m:jesszhan0024@gmail.com,m:krzk+dt@kernel.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:mwalle@kernel.org,m:robh@kernel.org,m:simona@ffwll.ch,m:tzimmermann@suse.de,m:devicetree@vger.kernel.org,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[neil.armstrong@linaro.org,dri-devel-bounces@lists.freedesktop.org];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[amarulasolutions.com,kernel.org,gmail.com,linux.intel.com,ffwll.ch,suse.de,vger.kernel.org,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:replyto,linaro.org:dkim,linaro.org:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
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
X-Rspamd-Queue-Id: 673DCE5FA9
X-Rspamd-Action: no action

On 2/3/26 08:54, Dario Binacchi wrote:
> This series extends the Ilitek ILI9806E panel driver to support the
> Rocktech RK050HR345-CT106A model via SPI.
> 
> To achieve this, the current driver (previously restricted to DSI) is
> refactored to support both DSI and SPI variants independently.
> 
> The series includes:
>   - A refactoring of the existing driver and Kconfig to support
>     multiple buses.
>   - DT binding documentation for the Rocktech RK050HR345-CT106A.
>   - The implementation of the SPI-based driver for the Rocktech panel.
> 
> Changes in v3:
> - Add Reviewed-by tag of Rob Herring
> 
> Changes in v2:
> - Introduce DRM_PANEL_ILITEK_ILI9806E_CORE hidden kconfig option.
> - Split core and DSI logic.
> - Restore vdd-supply as required for both DSI and SPI types in the
>    dt-bindings.
> - Dop useless settings in case of rocktech,rk050hr345-ct106a in the
>    dt-bindings.
> 
> Dario Binacchi (4):
>    drm/panel: ilitek-ili9806e: rename to specific DSI driver
>    drm/panel: ilitek-ili9806e: split core and DSI logic
>    dt-bindings: ili9806e: add Rocktech RK050HR345-CT106A display
>    drm/panel: ilitek-ili9806e: add Rocktech RK050HR345-CT106A SPI panel
> 
>   .../display/panel/ilitek,ili9806e.yaml        |  38 ++-
>   MAINTAINERS                                   |   3 +-
>   drivers/gpu/drm/panel/Kconfig                 |  24 +-
>   drivers/gpu/drm/panel/Makefile                |   4 +-
>   .../drm/panel/panel-ilitek-ili9806e-core.c    | 134 ++++++++
>   .../drm/panel/panel-ilitek-ili9806e-core.h    |  15 +
>   ...ili9806e.c => panel-ilitek-ili9806e-dsi.c} | 153 +++------
>   .../gpu/drm/panel/panel-ilitek-ili9806e-spi.c | 323 ++++++++++++++++++
>   8 files changed, 576 insertions(+), 118 deletions(-)
>   create mode 100644 drivers/gpu/drm/panel/panel-ilitek-ili9806e-core.c
>   create mode 100644 drivers/gpu/drm/panel/panel-ilitek-ili9806e-core.h
>   rename drivers/gpu/drm/panel/{panel-ilitek-ili9806e.c => panel-ilitek-ili9806e-dsi.c} (82%)
>   create mode 100644 drivers/gpu/drm/panel/panel-ilitek-ili9806e-spi.c
> 

Looks good overall, please find the kconfig dependency issue reported

Thanks,
Neil
