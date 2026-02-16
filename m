Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AbYkG8xCk2kP3AEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 17:16:12 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF3B145FFA
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 17:16:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 775E910E3AF;
	Mon, 16 Feb 2026 16:16:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="l3qC4BEf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
 [209.85.128.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C074210E3AF
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 16:16:08 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id
 5b1f17b1804b1-4836e3288cdso20624295e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 08:16:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771258567; x=1771863367; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=UzxOuHGe7RwFZor2suXKbUzi02HF3A8BFOmM2FphvUE=;
 b=l3qC4BEfbs+M3WMcsiGBjEyggNj/kRJYQSaEr7RtvCED7aCekO3RJXhT9CWnJAh4of
 1GZ4eB7geQ8+sYutk5c85vwA8u6CeTPEQik5vzmR8Mg33SVGtDJs8Ypq0H45GrmC////
 KuItSlpUBttnn5y1p/tUsuDdt6k3QRrxFmyfI3yNAtcFbcXAlr3Bslvc4HCl/GbaD3Tb
 ixXXBPNTofmIwZvGYngrVFWRGbW+Iyoi5QrjZm+OdpaQyjbBkBiAKLx1UMTog8W4Z5aL
 QvmksVMUAhx5iGI0NpwgpGOMujd6nxOnSKu3mGWeWRBt6TAktuhH0/ilXTPezpzdJumV
 xUWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771258567; x=1771863367;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UzxOuHGe7RwFZor2suXKbUzi02HF3A8BFOmM2FphvUE=;
 b=Q8z9LeScv0lj07oHOPcHeAzIs2TcgR0+xoswiNSt/gyc8meI8Gpa+D1ad0CN6Cz1q9
 equyvjBVu4ZdpavXSuhBLeEHKomszoe7Xw7F5HOTVKTeCDf+ha30JLnMqgd+pyd0IH4j
 okJW6nbA9wrGCmzc9oT/oH2hJGCrRCEGH9T5p8E9HW5nkavcoGaBpBdjITj6IT2H7Ln9
 4UtfGtNP/OyZDR0evJsgp6x7iu3jU+JhhLHWCF7z2kucIl3P3986dLQFpZxSjesfATjo
 CU8Q7m3EOXwaR1dmWII/7BGL2/cOJdoReUN3USDtBCjwobzkfMHRexcKUffLd6K5kUEE
 m0rA==
X-Gm-Message-State: AOJu0Yy6rJ270CFOLYGmYRMlemITUPEYJWz3PWMQ8chIFFpQsJkL5xi2
 dKGFHmqGISTEGtXv0ql3TWlbNgFxbEKW1ymk3r6UKkNitOq5sBjPwJjoYjUy5a8ogac=
X-Gm-Gg: AZuq6aKz8mCZ7dtH5g6M3UEMp4VVlzSjxZB8iUUbGeGaHcW0tDSCLoKdpuve6mG1Jiu
 Wy9oZhtBqcYH2ISQXAGVaAg1WUPxE3vL1MIGg7+zKfdMqxr+8jpRyfLTFQzqrod28EJHv/nWArZ
 3t1r7C+pC8ARe9aGriI4ftXw/+ZeEK9clr3cuhp+g/IEPJguDLeZ+4ns+y0Qh54qrLXDxXR5tYR
 E0cLqDNKlGYCdDieGDUZD/8g/0czHP8V/ks6mcmU5G379XO6t1aU/gj/QBKlO1dn5XhkQwJhyCH
 dgeqnHGuOsWmbASdWg5SakCGRRdztrZGWN9RzaFpzMMftYEk1/LTTS1lLxPDdS3wade5NyaGWoM
 yqKTbkwRm4e5UTWWUh3oQfyzWGbKQRkuC2Bmm5Rqqw6UW/Pq6vQbNg00JESVV+i6kWJX8Qw/Gm5
 5Q98L3qR3vJysGPGW+Sn4NeuKW5ha1NLzCcPD/C4ywk4ZWHmT8sY6s6rLWJpRQfBF7+78Ke5g0K
 fIdew==
X-Received: by 2002:a05:600c:1553:b0:479:13e9:3d64 with SMTP id
 5b1f17b1804b1-48378da55eamr162741695e9.15.1771258551737; 
 Mon, 16 Feb 2026 08:15:51 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:80b4:8b51:72a6:9e2a?
 ([2a01:e0a:106d:1080:80b4:8b51:72a6:9e2a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4837a5d562esm173273025e9.15.2026.02.16.08.15.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Feb 2026 08:15:51 -0800 (PST)
Message-ID: <0bfa54c2-a212-48cb-819d-71d4ec2b05aa@linaro.org>
Date: Mon, 16 Feb 2026 17:15:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v1 4/5] drm/panel: r61307/r69328: return accumulated errors
To: Svyatoslav Ryhel <clamor95@gmail.com>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260215085140.20499-1-clamor95@gmail.com>
 <20260215085140.20499-5-clamor95@gmail.com>
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
In-Reply-To: <20260215085140.20499-5-clamor95@gmail.com>
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
X-Rspamd-Queue-Id: 1EF3B145FFA
X-Rspamd-Action: no action

On 2/15/26 09:51, Svyatoslav Ryhel wrote:
> Return accumulated errors from dsi function calls.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>   drivers/gpu/drm/panel/panel-renesas-r61307.c | 4 ++--
>   drivers/gpu/drm/panel/panel-renesas-r69328.c | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-renesas-r61307.c b/drivers/gpu/drm/panel/panel-renesas-r61307.c
> index 2cc3bd66d6d4..70bda074dd0d 100644
> --- a/drivers/gpu/drm/panel/panel-renesas-r61307.c
> +++ b/drivers/gpu/drm/panel/panel-renesas-r61307.c
> @@ -150,7 +150,7 @@ static int renesas_r61307_enable(struct drm_panel *panel)
>   	mipi_dsi_dcs_set_display_on_multi(&ctx);
>   	mipi_dsi_msleep(&ctx, 50);
>   
> -	return 0;
> +	return ctx.accum_err;
>   }
>   
>   static int renesas_r61307_disable(struct drm_panel *panel)
> @@ -162,7 +162,7 @@ static int renesas_r61307_disable(struct drm_panel *panel)
>   	mipi_dsi_msleep(&ctx, 100);
>   	mipi_dsi_dcs_enter_sleep_mode_multi(&ctx);
>   
> -	return 0;
> +	return ctx.accum_err;
>   }
>   
>   static int renesas_r61307_unprepare(struct drm_panel *panel)
> diff --git a/drivers/gpu/drm/panel/panel-renesas-r69328.c b/drivers/gpu/drm/panel/panel-renesas-r69328.c
> index b5fe127634ae..0ed143f77e50 100644
> --- a/drivers/gpu/drm/panel/panel-renesas-r69328.c
> +++ b/drivers/gpu/drm/panel/panel-renesas-r69328.c
> @@ -117,7 +117,7 @@ static int renesas_r69328_enable(struct drm_panel *panel)
>   	mipi_dsi_dcs_set_display_on_multi(&ctx);
>   	mipi_dsi_msleep(&ctx, 50);
>   
> -	return 0;
> +	return ctx.accum_err;
>   }
>   
>   static int renesas_r69328_disable(struct drm_panel *panel)
> @@ -129,7 +129,7 @@ static int renesas_r69328_disable(struct drm_panel *panel)
>   	mipi_dsi_msleep(&ctx, 60);
>   	mipi_dsi_dcs_enter_sleep_mode_multi(&ctx);
>   
> -	return 0;
> +	return ctx.accum_err;
>   }
>   
>   static int renesas_r69328_unprepare(struct drm_panel *panel)

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
