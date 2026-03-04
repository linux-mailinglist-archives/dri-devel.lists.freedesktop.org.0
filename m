Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sLytFxhdqGmQtwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 17:26:00 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E88204336
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 17:25:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC16510EA57;
	Wed,  4 Mar 2026 16:25:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="tWXIcNRD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1A5C10EA57
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2026 16:25:56 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4833115090dso72265425e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Mar 2026 08:25:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772641555; x=1773246355; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=Wwg8sZsmNLzy2afJrRo0Q5NqhKFtZWIyse4Xvl/uhBM=;
 b=tWXIcNRDnAST1xtNcPIhkgYPNMQKNuIjw9pChn3ugjCvZ+16oDoRQNGZxVIDRpJrm3
 udjgw453aCEUmRgHPeIxiqcyIH2KwfYb33j2Rd++OO+FGk7Wcilu7VMIjnvsk1v+XSwX
 tfqXaLPniSx7b68sQxKvuCrQrGR2hYS6FYeL2jU18C4O1jNLNxftN27CeZKPeEw09llF
 332X3EiU8AUdsadTlffbGUZjJRhXdFdQoqiBvIuIFXQwx+36qML0JpYw/Se9iZd43v8m
 YP4a/zb8PlcYMq0xSQA+fywE6BzwhhmP3SCnHnf4gS8YNLTIH33LeKVhHtsIS4jw64GS
 NDwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772641555; x=1773246355;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Wwg8sZsmNLzy2afJrRo0Q5NqhKFtZWIyse4Xvl/uhBM=;
 b=vA94tXhzFvi4JNp76opPaAN62XO+MxEmL/A6CyhCbrRZVZJMNWReFZBW8Vn07HY/aG
 LNSbpHowJE9NgGooXSINFKW/7XIbq+wNwUYGHwdw557OQ85nMWI2EFPsKAEtL9npBcyC
 JzjKOdpxLj9hYBdxVuBDJbzmRPaOK++08El3hxuLg9r0/07xM2fp/sJXfKdzux+/vvIw
 8gABtLAAGh4t0RKiFk6Hhao6zrVZ45P5cua3Dcx28MXMOH0emH/oqK8ZVahzubSWbfUO
 eAAP0s86cZmcyLEsDMWLrIm+WOfo5Q9ZYhuYmYEhyVOaq4Ahry8JR4r2gf6uADiV38kh
 VaAQ==
X-Gm-Message-State: AOJu0YxSteUuGrqqcaK+ewXmN53C6NI+77jSNt3CEwRw998tcIhq1PE8
 adGNQhqI1zDqNgC/u3mJuV55auuQGd0anyajZhYuWlohroys6n2oswUmFinnkxy+6cQ=
X-Gm-Gg: ATEYQzxbrbdJjPy2X/AwjmjSA9I89G9w4LExDYlWCfn7FKwVTCzxCivraS1Ofa9Mowl
 DrxdjBJ9NXTUgdRNgMMzQloEacSTb77z5oN9rI28L9mnbsOlFT48v81TtG11b6KFSGnjosZHSoj
 gYJPvIXeBySpZo/3wHOmKzRc5VC4+tv/mm6O38dPg2XaPRsylzLbG+xg5+PUNvoxHDXmsXUqE5/
 bQRuIabV3sa9tgtOjXLLDGfyduYez0KTuMI3pOssiD7jSsOcQEm19a/kafkDgEnBYD6oWliuEXX
 wTxa0U1h8aIspvtypCaNCxkao8cq1BxkpK9hhdKWDCio5vDHKnTZbFTAuRgvBb3HSzErUPN4gOo
 kKE7OR4ihPw/fNQW+95bqchojeYRy5cPJfhUokC2auWz1+AY1YS9viS6qWcOVDLw8DjDypdGHWt
 OPGIIKR1Hpvb4YEzv5xmB8sHPhpQt/iCbeBizuFh1UMyMlSPhDMrybpbul5AVYYshtUvvvM4tOw
 iy+kj8EUrnE8Dg=
X-Received: by 2002:a05:600c:4452:b0:47a:935f:61a0 with SMTP id
 5b1f17b1804b1-485197f6ae3mr51598625e9.0.1772641555044; 
 Wed, 04 Mar 2026 08:25:55 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:da6:dde3:e477:94d2?
 ([2a01:e0a:106d:1080:da6:dde3:e477:94d2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-485188a20c4sm55675245e9.15.2026.03.04.08.25.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Mar 2026 08:25:54 -0800 (PST)
Message-ID: <dc617b26-fc08-48f1-a4c8-f1eb1dddda26@linaro.org>
Date: Wed, 4 Mar 2026 17:25:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/panel: simple: Correct G190EAN01 prepare timing
To: Ian Ray <ian.ray@gehealthcare.com>, Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sam Ravnborg <sam@ravnborg.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260217142528.68613-1-ian.ray@gehealthcare.com>
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
In-Reply-To: <20260217142528.68613-1-ian.ray@gehealthcare.com>
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
X-Rspamd-Queue-Id: B4E88204336
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gehealthcare.com,gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,ravnborg.org,collabora.com];
	FORGED_RECIPIENTS(0.00)[m:ian.ray@gehealthcare.com,m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sam@ravnborg.org,m:sebastian.reichel@collabora.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[neil.armstrong@linaro.org,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:email,linaro.org:mid,linaro.org:replyto,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,collabora.com:email,gehealthcare.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Action: no action

On 2/17/26 15:25, Ian Ray wrote:
> From: Sebastian Reichel <sebastian.reichel@collabora.com>
> 
> The prepare timing specified by the G190EAN01 datasheet should be
> between 30 and 50 ms. Considering it might take some time for the
> LVDS encoder to enable the signal, we should only wait the min.
> required time in the panel driver and not the max. allowed time.
> 
> Fixes: 2f7b832fc992 ("drm/panel: simple: Add support for AUO G190EAN01 panel")
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> Signed-off-by: Ian Ray <ian.ray@gehealthcare.com>
> ---
>   drivers/gpu/drm/panel/panel-simple.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 91ab280869ba..a242ae284db5 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -1295,7 +1295,7 @@ static const struct panel_desc auo_g190ean01 = {
>   		.height = 301,
>   	},
>   	.delay = {
> -		.prepare = 50,
> +		.prepare = 30,
>   		.enable = 200,
>   		.disable = 110,
>   		.unprepare = 1000,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
