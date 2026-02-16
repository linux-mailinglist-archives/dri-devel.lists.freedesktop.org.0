Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CCVZJDtCk2kA3AEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 17:13:47 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF64E145F93
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 17:13:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DEEF10E008;
	Mon, 16 Feb 2026 16:13:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="CUAY8Rr0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7731010E008
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 16:13:42 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4834826e5a0so32392645e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 08:13:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771258421; x=1771863221; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=aEwePtyMyyUDczCm6+o8trXCuKVnIQYR4FUVXztrg+o=;
 b=CUAY8Rr0ihQDRyfeVKOqot/cXw4PHxODvEv3bT9FLXYLwEcivuWqp9xfa3QuIGp9KK
 RyGIj0cA1wS60jghVz7Ve0wHGMrAtq6QaahIH1HK37CPHkIQWL0RH0WYiPxWwB/WVH+J
 XC4gg2DQ+DeEY8mk+3fBca3zkGGniI7r9Mxv2MfyflMhJFruhN/Va9WMmqN4kp28GIw7
 ppMsQbz3cYv7pnwMIq+82ES5bgnqX+FkPFGgDOjc94TL1/a2VGglMrWd+BywrDubnX9k
 amHaZPmdaWdSo/eNk7ApFuASpJ6LkjPCZJ9OB2HavplTgGSZnSAbkGZ2d+ysVMhX6m0M
 YvtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771258421; x=1771863221;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aEwePtyMyyUDczCm6+o8trXCuKVnIQYR4FUVXztrg+o=;
 b=U5pvFYrBNT4oS44Vuy37gm1KIFLYrMaBaSphKLI7RxNEe2cdyUF6fYonUAWTYeN1kc
 8rp52Eu90DeLqh2836s6kJqEU0deOdOY3rzCRnjq51jWaRCwinYB2T7xYcJqU2AQP1r9
 6m7sLxXdogFYGOKjYPtL60D0cT+ihx10eGnwfPAP/+xVIQInDexBN9wuZ8Lo1BrQsPQ8
 gX8VcEJFx3e4Foq7pio/vLX1cjAl5lMt30nn7lblPkJROVan0CqksMDgmu/aGCk925u9
 9V66mC9cExhykfMNcUvPYCt2VOTi094tplRICXqiWXZzte87klrnou9RS56dkVihT8Vr
 PBuw==
X-Gm-Message-State: AOJu0YytK8cBzojkvHCb4ZmeKAXEVzYLtd99f4CP//MVts6OrSXxsGe8
 Xn3DF+tcwg5J3iQ5TnQFEoAEXzdosmW3MFQjIHbvJWi5aEsLPzmMofYJ+RqUNF9miTQ=
X-Gm-Gg: AZuq6aLAG8tKExPjJoF6qigY7nVl0h9yB/D/BJhjG+fKPydGRsv8UBbCop/POpwIqSz
 JMw4HALlvHkn8+TULZzlFzXF3bJwMm3fP8monLvOa9rHzrrpscy+JNRPDOGrNq1TmLlNsV3V4Sv
 QKXtgCjifHOx02V7S9cobTZpQ2dp7tReEvYxR94/O76+SnYSjAsvPTOYj10xoETKzZVt1LQArHu
 kLWDAU6+90ASHnZK7eL77LKrN0BpaAmWl3XA0VtwJFX+6lCPD6zFtUHVZgyPyUSX9lGjquCcfff
 w1lvfOFSCrLgpjG7OPrFRb+ZZKTT/p0vRMUv8LV79tzq+FaOYOr7T4IOgqCtGqm3xtoDzxI0gPA
 EmZZOv2HeKsoSn8I8bx9tYpN4ks2x+JxJUXmwZHO9YZJkaXlKb2r9WeHJD9cXPtrFjRUNurvZYP
 yTJqwuG8aEea46qEdlQmbsKuQDOYwI08LbDe2ql4ghmMMHagdlvWiX8dfsN0itwWLHSyaRr9Eji
 FMPig==
X-Received: by 2002:a05:600c:4f46:b0:480:6c75:ddce with SMTP id
 5b1f17b1804b1-48373a79c63mr208413475e9.33.1771258420819; 
 Mon, 16 Feb 2026 08:13:40 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:80b4:8b51:72a6:9e2a?
 ([2a01:e0a:106d:1080:80b4:8b51:72a6:9e2a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796a6ba57sm22696798f8f.15.2026.02.16.08.13.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Feb 2026 08:13:40 -0800 (PST)
Message-ID: <286d6df9-ad6c-46e5-abb1-61d4ed056e91@linaro.org>
Date: Mon, 16 Feb 2026 17:13:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v1 1/5] drm/panel: r61307: align with schema property
To: Svyatoslav Ryhel <clamor95@gmail.com>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260215085140.20499-1-clamor95@gmail.com>
 <20260215085140.20499-2-clamor95@gmail.com>
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
In-Reply-To: <20260215085140.20499-2-clamor95@gmail.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:mid,linaro.org:replyto,linaro.org:dkim,linaro.org:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
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
X-Rspamd-Queue-Id: EF64E145F93
X-Rspamd-Action: no action

On 2/15/26 09:51, Svyatoslav Ryhel wrote:
> Rename renesas,inversion to renesas,column-inversion according to schema.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>   drivers/gpu/drm/panel/panel-renesas-r61307.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-renesas-r61307.c b/drivers/gpu/drm/panel/panel-renesas-r61307.c
> index 319415194839..873ef856184b 100644
> --- a/drivers/gpu/drm/panel/panel-renesas-r61307.c
> +++ b/drivers/gpu/drm/panel/panel-renesas-r61307.c
> @@ -259,7 +259,7 @@ static int renesas_r61307_probe(struct mipi_dsi_device *dsi)
>   		return dev_err_probe(dev, PTR_ERR(priv->reset_gpio),
>   				     "Failed to get reset gpios\n");
>   
> -	if (device_property_read_bool(dev, "renesas,inversion"))
> +	if (device_property_read_bool(dev, "renesas,column-inversion"))
>   		priv->inversion = true;
>   
>   	if (device_property_read_bool(dev, "renesas,contrast"))

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
