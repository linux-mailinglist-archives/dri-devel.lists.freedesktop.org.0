Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oF8INMdCk2kA3AEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 17:16:07 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F22145FF3
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 17:16:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FB3410E0D2;
	Mon, 16 Feb 2026 16:16:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="osinRoJt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8982C10E0D2
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 16:16:03 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-4362507f0bcso2862291f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 08:16:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771258562; x=1771863362; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=DKJ7LQxP686mUB8k5bHigcsySoErWd50V3vEEJlbK3c=;
 b=osinRoJtPx5Z/BGYRl4RlgqYMuMUTWL55VwBUxss/7BKmu99OyoKwPOVhFzVRV4r7C
 uSFMoIo2DfVOPC1UrvZ1HR793G7OKPyE1DjH6/m17R57O2miz5SWwg8BAjFCJr55ouEC
 htY3Uj83ooGRdcgMJT1ljUO19qYzaGbMQzBHInH/cI6FExyLMxPg3Mrucyc7HOAV3rI3
 KJP0M34JsDRIezEXmjUnFeb2JhfwpI4fNhTJ1lADo/h4NS5Qfhl9r7FflxC0OoQb4Utq
 tdwwJpi1KmzItvkzdAJLVYs97jOTPPEfKDNgdfspcVd4G3mhiKmnw6Ky74cT0sM254xR
 Cumw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771258562; x=1771863362;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DKJ7LQxP686mUB8k5bHigcsySoErWd50V3vEEJlbK3c=;
 b=dKRowySsQBVOhx4VJ4LQw+lXT3XzLWl0i+OdRTOBerjbjAUi+xOk1dEaaw7x/Rs/it
 /N2vM3PJipm4syNjkqfwZBE4a8nPomJvm9akd8qArBTMYcx5+6C7SohSc6eF1iXV0uyA
 iICrgBTttUtXFORLt+pjg36QL0Yjg6kfr5fyVWMebqa62aPBaWIe3hkB0mb6VvUPJ76i
 D9fJogQ0NbXWMtCszIk4B0+Sw3nbCsugFuxj70Y76XDgMkQVEkkID1YOwTel2UCJKXH8
 gMNkFbCnJvII9adAbQhavSVXYYhmU8DNrqgYH+fMwAMHjbRWy5UjPJI57mFTuoQ9Mqub
 dnOw==
X-Gm-Message-State: AOJu0Yx31WjfEZa1PrYSbsRjj7zZ33fG0Au7WzfuV02x56gISgZVM+5f
 q/FCgX59Y2ymkaq29zXcEkA5BgLwFZfoINeLY5s1rx2Tq4YDpU7W8mcj+gLMV70kL28=
X-Gm-Gg: AZuq6aJ9uum/c0+zBIkkFm7Ku17aTKa8SndFKpW4fIdmjXVKXfSGjUd440lWOAUF3n1
 oiwSJ4lchfVZ+aVMqH4iqtR6W20M3w76xTeXJfbc9ddQjlvsqhEkyDgwNkZe32wKOu2hYJjIrnp
 tI5n+ikWzlOwo684xhEJJ7XVBtr7qWPxudTOTGZ+TlBefXLRKDWkqjlRrEGWaWLj4dxUAwXNDMQ
 QX7BinVewEzAlAzpcjejGm5OAN0Z6UaOUaYYGAkggx+UIRdRf9q1YODh3BskjcQH1iYZgnZcC86
 5hr/+uXmgNc8elxJlq4/PXe3Kp8VRsA/FtGFKmBNyDG5xswNtpNW+5AZ2SKYvjm8nQYv4qQCALO
 n8MUFBsDkux6P1MCLoy8dxku5h1XEhs55i1PHf6083cHSCDoE5jAsPFh8cxzWCTYt4ZXhde65DZ
 R88U3oVck7oOaCARPou9sUme9jsL0cnEeivwYuwAlxS+E1/OYBX5qWEVT8x+Hv6p8pzzDqJ8jea
 /MOFg==
X-Received: by 2002:a05:6000:228a:b0:430:fd0e:a502 with SMTP id
 ffacd0b85a97d-4379d61a68amr14266998f8f.22.1771258561718; 
 Mon, 16 Feb 2026 08:16:01 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:80b4:8b51:72a6:9e2a?
 ([2a01:e0a:106d:1080:80b4:8b51:72a6:9e2a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796a5ac87sm30128089f8f.3.2026.02.16.08.16.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Feb 2026 08:16:01 -0800 (PST)
Message-ID: <8e3416cc-4221-4ff2-91ef-9bd55e6bdf0e@linaro.org>
Date: Mon, 16 Feb 2026 17:16:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v1 5/5] drm/panel: r61307/r69328: convert to
 devm_mipi_dsi_attach
To: Svyatoslav Ryhel <clamor95@gmail.com>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260215085140.20499-1-clamor95@gmail.com>
 <20260215085140.20499-6-clamor95@gmail.com>
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
In-Reply-To: <20260215085140.20499-6-clamor95@gmail.com>
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
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:clamor95@gmail.com,m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_TO(0.00)[gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch];
	FORGED_SENDER(0.00)[neil.armstrong@linaro.org,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,linaro.org:mid,linaro.org:replyto,linaro.org:dkim,linaro.org:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: 38F22145FF3
X-Rspamd-Action: no action

On 2/15/26 09:51, Svyatoslav Ryhel wrote:
> Switch to device managed version of mipi_dsi_attach.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>   drivers/gpu/drm/panel/panel-renesas-r61307.c | 7 +------
>   drivers/gpu/drm/panel/panel-renesas-r69328.c | 7 +------
>   2 files changed, 2 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-renesas-r61307.c b/drivers/gpu/drm/panel/panel-renesas-r61307.c
> index 70bda074dd0d..d8185cc1b5d6 100644
> --- a/drivers/gpu/drm/panel/panel-renesas-r61307.c
> +++ b/drivers/gpu/drm/panel/panel-renesas-r61307.c
> @@ -261,7 +261,7 @@ static int renesas_r61307_probe(struct mipi_dsi_device *dsi)
>   
>   	drm_panel_add(&priv->panel);
>   
> -	ret = mipi_dsi_attach(dsi);
> +	ret = devm_mipi_dsi_attach(dev, dsi);
>   	if (ret) {
>   		drm_panel_remove(&priv->panel);
>   		return dev_err_probe(dev, ret, "Failed to attach to DSI host\n");
> @@ -273,11 +273,6 @@ static int renesas_r61307_probe(struct mipi_dsi_device *dsi)
>   static void renesas_r61307_remove(struct mipi_dsi_device *dsi)
>   {
>   	struct renesas_r61307 *priv = mipi_dsi_get_drvdata(dsi);
> -	int ret;
> -
> -	ret = mipi_dsi_detach(dsi);
> -	if (ret)
> -		dev_err(&dsi->dev, "Failed to detach from DSI host: %d\n", ret);
>   
>   	drm_panel_remove(&priv->panel);
>   }
> diff --git a/drivers/gpu/drm/panel/panel-renesas-r69328.c b/drivers/gpu/drm/panel/panel-renesas-r69328.c
> index 0ed143f77e50..bfe2787f8f53 100644
> --- a/drivers/gpu/drm/panel/panel-renesas-r69328.c
> +++ b/drivers/gpu/drm/panel/panel-renesas-r69328.c
> @@ -217,7 +217,7 @@ static int renesas_r69328_probe(struct mipi_dsi_device *dsi)
>   
>   	drm_panel_add(&priv->panel);
>   
> -	ret = mipi_dsi_attach(dsi);
> +	ret = devm_mipi_dsi_attach(dev, dsi);
>   	if (ret) {
>   		drm_panel_remove(&priv->panel);
>   		return dev_err_probe(dev, ret, "Failed to attach to DSI host\n");
> @@ -229,11 +229,6 @@ static int renesas_r69328_probe(struct mipi_dsi_device *dsi)
>   static void renesas_r69328_remove(struct mipi_dsi_device *dsi)
>   {
>   	struct renesas_r69328 *priv = mipi_dsi_get_drvdata(dsi);
> -	int ret;
> -
> -	ret = mipi_dsi_detach(dsi);
> -	if (ret)
> -		dev_err(&dsi->dev, "Failed to detach from DSI host: %d\n", ret);
>   
>   	drm_panel_remove(&priv->panel);
>   }


Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
