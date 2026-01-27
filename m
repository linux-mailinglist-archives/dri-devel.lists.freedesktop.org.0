Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sNTpNjxveGmjpwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 08:54:36 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27BEB90DAF
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 08:54:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D58E910E290;
	Tue, 27 Jan 2026 07:54:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="KCyay8/V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1623A10E290
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 07:54:33 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-48068ed1eccso3280285e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 23:54:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1769500471; x=1770105271; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=o/VxnSF8krGk0nRSnDEyD6IFePycjSGM7bgvmgAJYHs=;
 b=KCyay8/VLcQ5dcgpZ5GBvLzbi0s3Z63W67kbrLcVxbH/aVjXkBa/jrPGLKcQiYwhky
 5j2Ki9EDHF+Vqg6IQkRzjqYiRyXlrhSMnyFXCeyr8tuNjTdEXw5VQOF9uWi1jFsexF+A
 jRC7r8WoVIkHbXLx8MSz7vdmoocQnj+lBVBEC+C6T8BkaBLVFEguu8ldj+Kmelt/OEoN
 ngY3Hw6Amk/TPJx3oFe0g81us8361+WXrZZkftOBeXJZRfbT4EqnshVe5OR6U0hbe4SV
 lHNuqS3n1P/zR+pqjDaa0eFkmcbpJJJYWLuiZkdb1bjE6MPoxZ4kZwsrgay/2zQenr1f
 nuyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769500471; x=1770105271;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o/VxnSF8krGk0nRSnDEyD6IFePycjSGM7bgvmgAJYHs=;
 b=U3n85TJGlub+IWLcqSxltexrOi6zBuRKY+RYTx9dzxVAsRjNj6M26QY2Cc7UlWQVUE
 kZKgWBIlT4d/rFNvyjh0guGhxZwJu3S/oSANqgFiWyMRItG96CEeKeoRK3ZnPB4e2cUp
 3IRs7d4EHjkZciM/7TN9xo3pg8LIVQH0X4R0GCRaNXo01M3YB5lB3d4+Ozt6SyG/i80x
 axlvl4sErDUch2n8FwVEJ9NX5ZDIA/zP0H7B8Uz7MckP4pINUuk/z6ULZ0Q+8mmLz9F+
 TCQKQ5Lkpvoi1oN40cuDKE8r9VSxAzIjrg3ztay9bT+wWW8kmsbMMVhiFqKaf156UU2n
 ZDeQ==
X-Gm-Message-State: AOJu0YzAw3bELdoTrRJhCllAWNoLxR8QEs5GkeSJaIImjkjRwTdOtnrO
 kfhRJFuCfTd/cQ6dRqHdTejqY4UjgqkEX0Q/gN9+KrCTlQez8Y1V8iwzDA/wEI/0FWw=
X-Gm-Gg: AZuq6aIW+UIKuKBUWWYfkuXjfCGn7rossj5KwtrfFCFs61h7bMVhKJ0CYUbvcq/9WMo
 VSMOXghYL5CwMkmLIYLoHpSGjTCQLAO1Rj4lo5STzWuxUKBx9RfQun5X09Suw93o4UegpJ+I0Me
 Whz5rzaKOb99Goi7gSIgIFtTm9/7GGGKW7eW7So+GUGDXgFJHvAn0V/EaMPYPMQ6zvsO/2RYLwU
 tixqztTQeNXFXbj2Btz2oROQdlKUNNpT6t8SwgHAVKdr2+45itlKa7wxvSHvf3H7vq0Qkll1r0I
 Z2YSVNt4pXaIPW+qgxIM8hOOQmAA9QLJxBsuqm2jjrOAr4W9MKVBNorBsSbKovYxpHMVjB3muvB
 BYm+W4Om+tkTl7C+1zbv92XioKIRKSfjuwKGhL4hUmLx1v3+T3r34jn7NNWmk382sVdOELGEVXB
 iwE0TELpcc7sZW+xZ01ivtF/85t4BP8f4WbGV9yj0MNWzyNKGd+jnX+IcBu609GkJ1KhEKxj5NI
 A==
X-Received: by 2002:a05:6000:4028:b0:435:add0:3d76 with SMTP id
 ffacd0b85a97d-435dd1cb92cmr1128900f8f.56.1769500471311; 
 Mon, 26 Jan 2026 23:54:31 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:53a6:bd3c:8e65:509d?
 ([2a01:e0a:3d9:2080:53a6:bd3c:8e65:509d])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435b1e715bfsm38117952f8f.22.2026.01.26.23.54.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jan 2026 23:54:30 -0800 (PST)
Message-ID: <7d9041a3-9d2b-469a-9fa7-89d53bbd2a1f@linaro.org>
Date: Tue, 27 Jan 2026 08:54:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/3] dt-bindings: display: lt9611: Add dsi-port-b property
To: Hongyang Zhao <hongyang.zhao@thundersoft.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Roger Shimizu <rosh@debian.org>
References: <20260127-rubikpi-next-20260116-v1-0-0286c75150c5@thundersoft.com>
 <20260127-rubikpi-next-20260116-v1-1-0286c75150c5@thundersoft.com>
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
In-Reply-To: <20260127-rubikpi-next-20260116-v1-1-0286c75150c5@thundersoft.com>
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
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:hongyang.zhao@thundersoft.com,m:andrzej.hajda@intel.com,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:rosh@debian.org,m:jernejskrabec@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[neil.armstrong@linaro.org,dri-devel-bounces@lists.freedesktop.org];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[thundersoft.com,intel.com,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,ffwll.ch,linux.intel.com,suse.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,linaro.org:replyto,linaro.org:dkim,linaro.org:mid,0.0.0.1:email];
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
X-Rspamd-Queue-Id: 27BEB90DAF
X-Rspamd-Action: no action

On 1/27/26 07:58, Hongyang Zhao wrote:
> Document the lontium,dsi-port-b property for selecting DSI Port B as
> the input source instead of the default Port A.
> 
> Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
> Reviewed-by: Roger Shimizu <rosh@debian.org>
> ---
>   .../devicetree/bindings/display/bridge/lontium,lt9611.yaml          | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml b/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml
> index 655db8cfdc25..9b7dba4e114c 100644
> --- a/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml
> @@ -37,6 +37,12 @@ properties:
>     vcc-supply:
>       description: Regulator for 3.3V IO power.
>   
> +  lontium,dsi-port-b:
> +    type: boolean
> +    description:
> +      Use DSI Port B as the input source instead of Port A or Port A + B.
> +      Required when the DSI is physically connected to Port B.

This is not how this should be solved, the ports links are here for this exact purpose.

port@0 represents port A, port@1 represent port B, so you need to describe the HW correctly
in the first place.

Populate only port1 and in the driver check which ports are population and change the
configuration.

Neil

> +
>     ports:
>       $ref: /schemas/graph.yaml#/properties/ports
>   
> 

