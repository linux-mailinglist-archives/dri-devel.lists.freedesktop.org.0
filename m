Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B621197D16D
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2024 09:04:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F40D510E297;
	Fri, 20 Sep 2024 07:04:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="lRQlSgpj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACFC210E297
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Sep 2024 07:04:23 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-42cacabd2e0so14052455e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Sep 2024 00:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726815862; x=1727420662; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=AEk9Erg33oAKF+NP+nw1TwEyfMvfxRqOWUUv41eeefs=;
 b=lRQlSgpjNdfX3wueDDFeVYJLgcbyPeNHI/oL/cQzccu7/H+Ys98PFO29yED7YfqS3y
 ENDgWLv+Tmwvoyz/G9KHxzxCSLqSMqzUoKJhcFUywcmLfDWNn6HWZP5wdUDqy2yl9bDc
 uVd/CTG04nsHztHgnHaSjGp7QmWEKA31n94zQ7I13vHgBs2MddwRxlnxXKBRTFrfomvl
 vWA8+zojiupld5rqBA56EdZyi1U+GzbzUZSvFtYrXJl+pS6ynQEA2c9UausuO76kOzO/
 MBhN1Yuso9cubAP+SHf+XUJwznNR7JiaJg2ukMn7N1z2rGkmRZ0FUbga6IQGeFR6LwVm
 ur/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726815862; x=1727420662;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=AEk9Erg33oAKF+NP+nw1TwEyfMvfxRqOWUUv41eeefs=;
 b=bzB3S6gPHQezySBtDKvOtu9adSUZ0cnx7FvlMQemK2Mv9h//TL9pGUkoW3YjTYH5Qr
 DtTdtc9JF1xWZ/64rs6vIpFuPgJXPRjHka3CFMa4LLnJNFdMq9CjJ6r2IKIYCZnLaYK3
 2K05agmSaZw4YwhcgpNhUsUHZGXJCkNiuQ4Yh2rjgBM/qYUrQcziieh4yiSBxMjgLitN
 MwYsgpJYUeDae6x7WB55/Jkiavzq3leq5jro3/rrsqYTVQ6fgd86wnq5ks5bpfJ8ypin
 nJGRXvswpt6ggV8vDPlq3MxpwbgxNWTBKk7sxUF1BPSTKWMcjE94SsGCPiddy2Vqi6LK
 AYcw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUeiC6sNwlTOZvDF4GKPGIexfX+id7wqqt1nMo3Z3TgYMRVYe7P/4F8IW9PKIs4PCcMgcKLpRIdCSo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyJj0tsAJ91GtP7v+io1+4Y4qXEg73pdTysnCBPbcaNUFJnMcYx
 NFNUialni82w45U1WjZj1tVXhrL85g4Y7L4ot3xgZsGSJuyz8r07lKZRYjur4xY=
X-Google-Smtp-Source: AGHT+IGNO1dkgtnCZ5YKP/6A9L3EnlKsnH+ZENC9f0ny9GIW8vEezb6z+4c9DmLBMtGeBqMGf/ZOOA==
X-Received: by 2002:a05:600c:354a:b0:42c:c1f6:6ded with SMTP id
 5b1f17b1804b1-42e7ad9afabmr11697595e9.29.1726815861834; 
 Fri, 20 Sep 2024 00:04:21 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:b3d5:235d:4ae1:4c0f?
 ([2a01:e0a:982:cbb0:b3d5:235d:4ae1:4c0f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42e7aff08b1sm14316095e9.40.2024.09.20.00.04.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Sep 2024 00:04:21 -0700 (PDT)
Message-ID: <e865e42c-a528-45bb-bdf5-df1cd103e695@linaro.org>
Date: Fri, 20 Sep 2024 09:04:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 09/10] drm: bridge: dw_hdmi: Update EDID during hotplug
 processing
To: Jonas Karlman <jonas@kwiboo.se>, Maxime Ripard <mripard@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Christian Hewitt <christianshewitt@gmail.com>,
 Diederik de Haas <didi.debian@cknow.org>, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240908132823.3308029-1-jonas@kwiboo.se>
 <20240908132823.3308029-10-jonas@kwiboo.se>
 <4bc6a5e6-f2cf-43ab-8555-4f8aaf9f2cd0@linaro.org>
 <0dcb03be-dae1-4dcb-84d8-6ec204eab6ba@kwiboo.se>
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
In-Reply-To: <0dcb03be-dae1-4dcb-84d8-6ec204eab6ba@kwiboo.se>
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
Reply-To: neil.armstrong@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 19/09/2024 22:34, Jonas Karlman wrote:
> Hi Neil,
> 
> On 2024-09-13 10:02, Neil Armstrong wrote:
>> On 08/09/2024 15:28, Jonas Karlman wrote:
>>> Update successfully read EDID during hotplug processing to ensure the
>>> connector diplay_info is always up-to-date.
>>>
>>> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
>>> ---
>>> v2: No change
>>> ---
>>>    drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 12 ++++++++++++
>>>    1 file changed, 12 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>>> index c19307120909..7bd9f895f03f 100644
>>> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>>> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>>> @@ -2457,6 +2457,18 @@ dw_hdmi_connector_detect(struct drm_connector *connector, bool force)
>>>    
>>>    	status = dw_hdmi_detect(hdmi);
>>>    
>>> +	/* Update EDID during hotplug processing (force=false) */
>>> +	if (status == connector_status_connected && !force) {
>>> +		const struct drm_edid *drm_edid;
>>> +
>>> +		drm_edid = dw_hdmi_edid_read(hdmi, connector);
>>> +		if (drm_edid)
>>> +			drm_edid_connector_update(connector, drm_edid);
>>> +		cec_notifier_set_phys_addr(hdmi->cec_notifier,
>>> +			connector->display_info.source_physical_address);
>>> +		drm_edid_free(drm_edid);
>>> +	}
>>> +
>>>    	if (status == connector_status_disconnected)
>>>    		cec_notifier_phys_addr_invalidate(hdmi->cec_notifier);
>>>    
>>
>> I wonder why we should read edid at each dw_hdmi_connector_detect() call,
>> AFAIK it should only be when we have HPD pulses
> 
> That is what this change intends to help do.
> 
> As stated in the short comment EDID is only updated at HPD processing,
> i.e. when force=false. To be on the safe side EDID is also only updated
> here when connected and EDID could be read.
> 
> drm_helper_probe_detect() is called with force=true in the
> fill_modes/get_modes call path that is triggered by userspace
> or the kernel kms client.
> 
> After a HPD interrupt the call to drm_helper_hpd_irq_event() will call
> check_connector_changed() that in turn calls drm_helper_probe_detect()
> with force=false to check/detect if connector status has changed. It is
> in this call chain the EDID may be read and updated in this detect ops.
> 
> Reading EDID here at HPD processing may not be fully needed, however it
> help kernel keep the internal EDID state in better sync with sink when
> userspace does not act on the HOTPLUG=1 uevent.


I understand but if somehow a dw-hdmi integration fails to have HDP working
properly, EDID will be read continuously which is really not what we want.

HDMI 1.4b specifies in Section 8.5 and Appendix A:
============><==========================================
An HDMI Sink shall not assert high voltage level on its Hot Plug Detect pin when the E-EDID
is not available for reading.
An HDMI Sink shall indicate any change to the contents of the E-EDID by driving a low
voltage level pulse on the Hot Plug Detect pin. This pulse shall be at least 100 msec.
============><==========================================

So this is OK with the first sentence, and should also work with the second one because
right after the pulse we will read the EDID again, but I think we should have a much
more robust way to detect those 100ms pulses, no ?

Maxime, do you have an opinion on this ?

Neil

> 
> Regards,
> Jonas
> 
>>
>> Neil
> 

