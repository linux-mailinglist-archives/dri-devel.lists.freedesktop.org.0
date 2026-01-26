Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wGPZL156d2n7ggEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 15:29:50 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2551C8975F
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 15:29:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A61688F94;
	Mon, 26 Jan 2026 14:29:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Ml5DSLmW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BDA188F94
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 14:29:45 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4801bc328easo51946695e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 06:29:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1769437784; x=1770042584; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=QVbpIoypQImCLHhoakCf1rgOH70Z47rYPFZ9aJzUe5I=;
 b=Ml5DSLmWj/VRgxgkgHZ2alavAiqYcLGL8ohfVbW24frzPZ8QZIaxhM5gOUSSFhUUgU
 jkgijfo/YDvWub12tlL64f02SMNgB28Uj31yA5ixTl3+fIWvU1Z0qxwcoycyGmzWPZJW
 ejZrdPeBgQhblTB/myuu793pKF+ac+wyTQ1GOmhRSJgxVCCxvddXTHStzGjC6wJ3taRh
 V7Wqdizt5+EPib6b9379Au7tK7DetEcxVW7WKX2Yao85u57+6u5mZYqKVEvF4AG+uOi2
 7WxRPPCvT/BjhIZ0Rn9Rc8i2ilXRUackHXpenUarjN5gcwkE9oI+LQuN0Ci4Qi9+bOOA
 SHNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769437784; x=1770042584;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QVbpIoypQImCLHhoakCf1rgOH70Z47rYPFZ9aJzUe5I=;
 b=uoozAuKXaBLDsfRlxbKeF33zCHx8HWkeEqAf8HbOtWGU7HspiLoMtjGjh1Nx4EZZLH
 KrTHpkJX0fMNjblmAuXxmu+HGcRU2rEIY1H7cL+5g1cPCKObNczB3kf3aJ4HCe+f+McS
 hoQ4QeP+K1XNXluVllGVhz7dxv9SfKjdDBUAUsCKapRKjGEQCIw9+u+06IZo+PVBFJ1k
 O0YoaWOWS5fyRDNU3QBk8GnbbZ7Sh1WJoKDVnB7QfMQC7tio2d4p1JymIePdZlQA4P3o
 UO61enrAurqUz+w0GODQCkYgtf7BhtrC1QEEvjxMWhbvmUUIBqXhY2FA8QNhsiJdn/L5
 vWMA==
X-Gm-Message-State: AOJu0YzyaBwMGu2sn5lOWbQ5irZCrFJ1RV6ARFZzA7ZMGRByCCCYMKeR
 qlHbNMoJ/eLW6uKtCxP6CK9fQR0WhDi7oY8cSOHMi624JdsaTGtlHIu52ORfxnZZQ/g=
X-Gm-Gg: AZuq6aIEhuF4SHuNcUm6cYUR+5Bmc5LFEHtCNps0bjR3ULRN7l96DCMSuHXCVYSe/AR
 G8iUUGqJDWHj/bxDdF0FNFM1VEMNoZDk1g8dIk3FXFLlwDFqAXVqkgGbfSJIkfO6C0q1cD8ECMW
 XmmjgtlZHMM2sL/Cel8LYjoBWec8wmcptLVJym84RrDlSXaDs3rmiLFdVezknwvicJYmlliIvjt
 26jZtqRYFZ0uRASjUfM2SMWIp/Iyi4tPoPbHbCocIUt9gW6ra/2+aZAoo6cR9YS1OAJbttlcf9P
 kmdaref/OljFahk0uOLq3naL4TWVux0TdaQLzJx2CxY32D7VoYX016QRcDwu7rIcEf0AXr0Pdib
 PUWm5IQQzStFcFto+//wVU2jloguEh7sWFtzKmmxxFPiPNgpBbcY3cFtswI43ccfDHUrC5ZLi98
 xMLxq4BmKulh9ZN8fAVAgE8No2nGlK+GfRMbWaGf5oHgSoPxabqQZHb55NRb9e9Zo=
X-Received: by 2002:a05:600c:6818:b0:47e:e48b:506d with SMTP id
 5b1f17b1804b1-4805ce5068amr84761255e9.16.1769437783549; 
 Mon, 26 Jan 2026 06:29:43 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:9836:4e25:3927:bcad?
 ([2a01:e0a:3d9:2080:9836:4e25:3927:bcad])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4804daf23f4sm110028615e9.1.2026.01.26.06.29.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jan 2026 06:29:43 -0800 (PST)
Message-ID: <6acc5c4b-b043-42f9-a931-3fccb45697fc@linaro.org>
Date: Mon, 26 Jan 2026 15:29:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/panel: ilitek-ili9882t: Select DRM_DISPLAY_DSC_HELPER
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Langyan Ye <yelangyan@huaqin.corp-partner.google.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
References: <20260115125136.64866-1-mcanal@igalia.com>
 <176943134904.488301.12365695309428276734.b4-ty@igalia.com>
 <df078563-b831-4058-805f-5d1c1bff1780@linaro.org>
 <59724375-5f00-4021-bd2d-0de55975cb99@igalia.com>
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
In-Reply-To: <59724375-5f00-4021-bd2d-0de55975cb99@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:mcanal@igalia.com,m:jesszhan0024@gmail.com,m:yelangyan@huaqin.corp-partner.google.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:kernel-dev@igalia.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:replyto,linaro.org:dkim,linaro.org:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	FORGED_SENDER(0.00)[neil.armstrong@linaro.org,dri-devel-bounces@lists.freedesktop.org];
	HAS_ORG_HEADER(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[igalia.com,gmail.com,huaqin.corp-partner.google.com,kernel.org,suse.de];
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
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: 2551C8975F
X-Rspamd-Action: no action

On 1/26/26 15:23, Maíra Canal wrote:
> Hi Neil,
> 
> On 26/01/26 11:09, Neil Armstrong wrote:
>> Hi,
>>
>> On 1/26/26 13:42, Maíra Canal wrote:
>>>
>>> On Thu, 15 Jan 2026 09:50:48 -0300, Maíra Canal wrote:
>>>> The panel-ilitek-ili9882t driver uses drm_dsc_pps_payload_pack() which
>>>> is provided by the DRM_DISPLAY_DSC_HELPER. Add the missing Kconfig
>>>> select to fix the following build error:
>>>>
>>>>    ERROR: modpost: "drm_dsc_pps_payload_pack" [drivers/gpu/drm/panel/ panel-ilitek-ili9882t.ko] undefined!
>>>>
>>>>
>>>> [...]
>>>
>>> Applied, thanks!
>>>
>>> [1/1] drm/panel: ilitek-ili9882t: Select DRM_DISPLAY_DSC_HELPER
>>>        commit: 68e28facbc8ab3e701e1814323d397a75b400865
>>
>>
>> You applied to the wrong branch, it's supposed to be applied to drm- misc-next-fixes after rc6
>>
> 
> Before applying to drm-misc-next, I tried to apply to drm-misc-next-
> fixes, but the patch didn't apply to that branch (65ce1f5834e9 is not
> there yet). With that, I decided to apply to drm-misc-next.

Please ask before and let me apply the changes, now the patch will be applied for v6.21...
when asked, the drm-misc maintainers would prepare the drm- misc-next-fixes for use to apply.

@maxime, thomas, what the right step now ?

Neil

> 
> Best regards,
> - Maíra
> 
>> Neil
>>
>>>
>>> Best regards,
>>> - Maíra
>>
> 

