Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qFGdCfZcqGmQtwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 17:25:26 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D5A2042EA
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 17:25:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F8A610E58C;
	Wed,  4 Mar 2026 16:25:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ZqUh++5P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6694E10E58C
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2026 16:25:22 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-483abed83b6so59844715e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Mar 2026 08:25:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772641521; x=1773246321; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=cSkir8rYUqLcHoLygq8oD5b/PcvzlUR+vP0RII4N708=;
 b=ZqUh++5Pba4h1nksDEe7/dZdvTSWmh1CHETJgw3QL6C3Rrbtz3CU2w9lH/AjSNQihP
 2jBC9Qey8jfoaeW6AckQt6ScDbRTP0NDgvKPJeL7PxTk9PnFh+pNB25hnJkT1GgVfc9I
 E3NNTTvJU1/OLPxx+7QcIUOrhU4Ya1DL4RWnOpqk3G9mXgUnNjaa+Vt54GX2AmewRKAs
 N8jOe+HQp7+gCjNAPl0VEcmLjMWKkXIqDYDaQzW3PO5Ue24cYIBQaAh7+eN+DQwHtp4b
 hPrjUlBCHuK0Q966LljUllLZI0m1AmngbvHiM67qm1Uc+0JJh5I7QF4oGYNBb5OqIXHN
 JLag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772641521; x=1773246321;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cSkir8rYUqLcHoLygq8oD5b/PcvzlUR+vP0RII4N708=;
 b=DWrlFQviHg3KUWmseA0qY4bceBx8DQ5nPKnOUUnxADVpiPpGnjminpg9x0nqH9JfWD
 OBQQyCermwuKmSuDHu4EBxw33mYdZKTVZLWbhfgEdVLscIBZ5FEkyXQllwSwsQFGxI5L
 8B0tzWhy9h1AMU9Z8ZXpF8CYGonpvoCJnW/iupLXBZ5BRSQ/+18EhkvjI9xc8xekAK/P
 bbBfJMTdgiRqf6gTK/2ZfLOnYyHuSd7nDSN5BNHK4ZBjdmGhRD3z1XuhgFql7Q9Xf8mr
 tXQJ9QspsK+7Hx0pRJq7FMQrZcJNcIRznHYX1GzkTDcfHxnhC9tqA8LYxaocE18hEXpI
 HpTA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6AtKJ639IuKjHmk5Gpn7ItLkeNmmwvqFaUs5a1YPPRAKAbzWjhXY9lh0vzW4fXAUhE6yoMeKh0gI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwxNIVdhEebOyxyNnB2qxr0ATEFOGwFJ4U6/xo4GRAUJ7qpqyf4
 ZIIRvBMuBnxm8cJeYFEtrcZH7gH9J+lchQo5gfNTEfPKEeoIz+O3YPUxFrxKLjJESb4=
X-Gm-Gg: ATEYQzykyr9fsDfZ9D0aW3H0hpdY/aQYuApA4Q1495caKaottI1yS5gSCDs1uGWE6oF
 tolHth2RzxRHzUoEW9m4d1G1Cj0AudcF+aYgCCpLndgQ4AmjCNudIJ0Ah2syRj/K+t64OCEsouN
 fOYrwXV80MLtNsO09Qwzvi9KC0SL/WncwIs5REKMnQx/OWS8YIf1ee8BscC+Uhs7BLXYS+JmfW7
 aY2OaWG00zmult6Nuc+j2wSEjugc/zr8KtXphmCRUvk99yYqg7YYiWXr1lp6pLZTFPGWaBwawsB
 OkJkr54c7Q7f0+joRTSf4NMC0S/OiwD3HFc4AuMYTwxaNauKfNjnc6fHn4hdTJfzsCng9xoGgF1
 M1xX8D195e/j1xMlsWe1kmzNrCQ1mR+p2JmX5hE9dY3CfdwA5SFnXQGirxmQ+Tf3oWAKzRl8r/M
 UyWEL+/w0I+u7f+5bUG6CXCSh5oHinkxwIL7GS8wfKTTAWuk7EgdwycBEvv8mReUj6KfXc1c/fh
 +57Nmpn1O4dVtg=
X-Received: by 2002:a05:600c:528e:b0:483:a895:9d85 with SMTP id
 5b1f17b1804b1-48519828c69mr47632675e9.2.1772641520738; 
 Wed, 04 Mar 2026 08:25:20 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:da6:dde3:e477:94d2?
 ([2a01:e0a:106d:1080:da6:dde3:e477:94d2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439c65e0b23sm8078081f8f.32.2026.03.04.08.25.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Mar 2026 08:25:20 -0800 (PST)
Message-ID: <4bda7a16-88a3-40b7-8ecf-16cbb7b6295f@linaro.org>
Date: Wed, 4 Mar 2026 17:25:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/panel: mantix: Drop the shutdown callback
To: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>,
 =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: kernel@puri.sm, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20260216-mantix-shutdown-v1-1-d2e93a8ccc4c@puri.sm>
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
In-Reply-To: <20260216-mantix-shutdown-v1-1-d2e93a8ccc4c@puri.sm>
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
X-Rspamd-Queue-Id: 81D5A2042EA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:sebastian.krzyszkowiak@puri.sm,m:agx@sigxcpu.org,m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:kernel@puri.sm,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,linaro.org:dkim,linaro.org:email,linaro.org:mid,linaro.org:replyto];
	FORGED_SENDER(0.00)[neil.armstrong@linaro.org,dri-devel-bounces@lists.freedesktop.org];
	HAS_ORG_HEADER(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[puri.sm,sigxcpu.org,gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Action: no action

On 2/16/26 18:50, Sebastian Krzyszkowiak wrote:
> It's the responsibility of the DRM modeset driver to unprepare
> and disable the panel. Doing so here leads to regulator underflows.
> 
> Signed-off-by: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
> ---
>   drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c | 11 -----------
>   1 file changed, 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c b/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c
> index 13352cb4ad77..02e203e9f41a 100644
> --- a/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c
> +++ b/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c
> @@ -295,20 +295,10 @@ static int mantix_probe(struct mipi_dsi_device *dsi)
>   	return 0;
>   }
>   
> -static void mantix_shutdown(struct mipi_dsi_device *dsi)
> -{
> -	struct mantix *ctx = mipi_dsi_get_drvdata(dsi);
> -
> -	drm_panel_unprepare(&ctx->panel);
> -	drm_panel_disable(&ctx->panel);
> -}
> -
>   static void mantix_remove(struct mipi_dsi_device *dsi)
>   {
>   	struct mantix *ctx = mipi_dsi_get_drvdata(dsi);
>   
> -	mantix_shutdown(dsi);
> -
>   	mipi_dsi_detach(dsi);
>   	drm_panel_remove(&ctx->panel);
>   }
> @@ -323,7 +313,6 @@ MODULE_DEVICE_TABLE(of, mantix_of_match);
>   static struct mipi_dsi_driver mantix_driver = {
>   	.probe	= mantix_probe,
>   	.remove = mantix_remove,
> -	.shutdown = mantix_shutdown,
>   	.driver = {
>   		.name = DRV_NAME,
>   		.of_match_table = mantix_of_match,
> 
> ---
> base-commit: 0f2acd3148e0ef42bdacbd477f90e8533f96b2ac
> change-id: 20260216-mantix-shutdown-bf8d0a6457c7
> 
> Best regards,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
