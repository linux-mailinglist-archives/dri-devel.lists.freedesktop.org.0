Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D52908685
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 10:39:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1B6B10EC9C;
	Fri, 14 Jun 2024 08:39:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="c1tZGGvj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7F8A10EC9E
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 08:39:08 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-35f223e7691so1166768f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 01:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718354347; x=1718959147; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=gyw6TIQZ0Xcni+LNb3JwKvBdl1n46DFQH3QxBDRHvF0=;
 b=c1tZGGvjDQNA8Z2xHf9nU9y4Hpvch+RwAc7U8yP2F7uFUUwC1xqBvsU6zOgsv+QHkF
 SmDkgbAESotoZ5yFEWdw2nQOl7fK7jD2rWhN8KR40h7PbinbNlrteLJyeJjZywstiWMx
 iZxDbOMAhBNH2GbSpfVU+CdI69tmwxcslGuSIp1j98bi3q/L+lCnU9b3C7EjBc8TmXVY
 gTGKyR3/Ju/5GWpxf6NWVZVHAla7h1sSDyjESxho81ml+LaVvO2ApdYAhK/vi9ui/XY6
 dL/CAVaXP7fQZfvDFrqXnewoJIYXSb+ncnL4FVcvn0bDeG5IOruzykPYOWWre2dq5e9y
 LFLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718354347; x=1718959147;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=gyw6TIQZ0Xcni+LNb3JwKvBdl1n46DFQH3QxBDRHvF0=;
 b=ZWL4KnJ/7VnNnr/5zjOCdtXIeYH2KeGjOfi4+GNp9W0wivif1QD1WmV2dOA6hxfzWi
 x2wJA+FXi5Auqci0l9vZJ8xaFwRKHNL+I8RLyETXWhdRoAwda1o/dBleBflKdcLD+Eqx
 EdZTlzmpsGasKgns+cxxCMqYraYNrFZpqXHtCQUxyj1DgnyAIOazaE4AU7YpGKNHSCl6
 oiV4UgK9+WPnwOw1XahXSv/YsuV/JycxT2P5pnWIMHX5eqptxC4npPmH+jsdj32v9Z45
 kcsN49zmzJbs1+089pvskfb2RTmmuQV3e3PmZX2Ean7g4vd7Z7XdUEK3mmAQFOtR4PgQ
 4K6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxeYI6ehAdMJsH+iHnTb4+/Q4rVoym91HRwNSkk7nTgk4kGQkXVPVTnEBzbChDYhKfYLMAPvQ6g4BHDkCxeZ4VWoyM89GEtf95ppPeLjKs
X-Gm-Message-State: AOJu0Yy7Nx0dzhgg9EHVuPJmNC2009YA6smHoS2ERulIJkW0mI5YoYv6
 DCZinmWnE4PBqgTyuUsEU9MXjC+HdpKWLEFO/j+Cj1sPtiY0bSDZpyhfzyVepzc=
X-Google-Smtp-Source: AGHT+IGhakMQyioBHsX0F33tZUElM2k7k/HiK58xnch8pvg3F+O/gic2pejzHdQ0R1UImKTvpQJZYA==
X-Received: by 2002:adf:f04f:0:b0:35f:2551:b967 with SMTP id
 ffacd0b85a97d-360718de62emr5139003f8f.16.1718354346939; 
 Fri, 14 Jun 2024 01:39:06 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:261a:269e:a3a8:a2cc?
 ([2a01:e0a:982:cbb0:261a:269e:a3a8:a2cc])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-360750f249csm3717924f8f.75.2024.06.14.01.39.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jun 2024 01:39:06 -0700 (PDT)
Message-ID: <37e7b6a5-5345-48cb-996f-c50ec935cded@linaro.org>
Date: Fri, 14 Jun 2024 10:39:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 13/14] drm/bridge: synopsys: Add DW HDMI QP TX controller
 driver
To: Andy Yan <andyshrk@163.com>
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Sam Ravnborg <sam@ravnborg.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Mark Yao <markyao0591@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, kernel@collabora.com,
 Alexandre ARNOUD <aarnoud@me.com>, Luis de Arquer <ldearquer@gmail.com>,
 Algea Cao <algea.cao@rock-chips.com>
References: <20240601-b4-rk3588-bridge-upstream-v1-0-f6203753232b@collabora.com>
 <20240601-b4-rk3588-bridge-upstream-v1-13-f6203753232b@collabora.com>
 <20240601143226.GA2003970@ravnborg.org>
 <59519381-2729-4839-9882-65a981a0c551@collabora.com>
 <20240604204110.GA84949@ravnborg.org>
 <f656c72e-fac8-4345-9b65-1031ebe81c25@collabora.com>
 <304b4602-8722-4ed0-a555-8dada573ee79@collabora.com>
 <5dc16b34-d638-4fab-84e1-cb7db08ad80e@linaro.org>
 <2d8e9235.68f3.19015881d35.Coremail.andyshrk@163.com>
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
In-Reply-To: <2d8e9235.68f3.19015881d35.Coremail.andyshrk@163.com>
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
Reply-To: neil.armstrong@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14/06/2024 08:56, Andy Yan wrote:
> 
> 
> 
> 
> 
> 
> 
> Hi Neil，
> 
> At 2024-06-05 19:48:09, "Neil Armstrong" <neil.armstrong@linaro.org> wrote:
>> On 05/06/2024 12:11, Cristian Ciocaltea wrote:
>>> On 6/5/24 12:34 AM, Cristian Ciocaltea wrote:
>>>> On 6/4/24 11:41 PM, Sam Ravnborg wrote:
>>>>> Hi Cristian.
>>>>>
>>>>> On Tue, Jun 04, 2024 at 10:32:04PM +0300, Cristian Ciocaltea wrote:
>>>>>> Hi Sam,
>>>>>>
>>>>>> On 6/1/24 5:32 PM, Sam Ravnborg wrote:
>>>>>>> Hi Cristian,
>>>>>>>
>>>>>>> a few drive-by comments below.
>>>>>>>
>>>>>>> 	Sam
>>>>>>>
>>>>>>>
>>>>>>>> +
>>>>>>>> +static const struct drm_connector_funcs dw_hdmi_qp_connector_funcs = {
>>>>>>>> +	.fill_modes = drm_helper_probe_single_connector_modes,
>>>>>>>> +	.detect = dw_hdmi_connector_detect,
>>>>>>>> +	.destroy = drm_connector_cleanup,
>>>>>>>> +	.force = dw_hdmi_qp_connector_force,
>>>>>>>> +	.reset = drm_atomic_helper_connector_reset,
>>>>>>>> +	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
>>>>>>>> +	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
>>>>>>>> +};
>>>>>>>> +
>>>>>>>> +static int dw_hdmi_qp_bridge_attach(struct drm_bridge *bridge,
>>>>>>>> +				    enum drm_bridge_attach_flags flags)
>>>>>>>> +{
>>>>>>>> +	struct dw_hdmi *hdmi = bridge->driver_private;
>>>>>>>> +
>>>>>>>> +	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
>>>>>>>> +		return drm_bridge_attach(bridge->encoder, hdmi->next_bridge,
>>>>>>>> +					 bridge, flags);
>>>>>>>> +
>>>>>>>> +	return dw_hdmi_connector_create(hdmi, &dw_hdmi_qp_connector_funcs);
>>>>>>>> +}
>>>>>>>
>>>>>>> Are there any users left that requires the display driver to create the
>>>>>>> connector?
>>>>>>> In other words - could this driver fail if DRM_BRIDGE_ATTACH_NO_CONNECTOR
>>>>>>> is not passed and drop dw_hdmi_connector_create()?
>>>>>>>
>>>>>>> I did not try to verify this - just a naive question.
>>>>>>
>>>>>> I've just tested this and it doesn't work - dw_hdmi_connector_create()
>>>>>> is still needed.
>>>>>
>>>>> Hmm, seems the display driver or some other bridge driver fails to
>>>>> support "DRM_BRIDGE_ATTACH_NO_CONNECTOR".
>>>>> what other drivers are involved?
>>>>
>>>> Could it be related to the glue driver (updated in the next patch) which
>>>> is also responsible for setting up the encoder?
>>>>
>>>>> Note that my comments here should be seen as potential future
>>>>> improvements, and do not block the patch from being used.
>>>>
>>>> Thanks for the heads up! Will try to get back to this soon and investigate.
>>>    
>>> IIUC, modern bridges should not create the connector but rely on display
>>> drivers to take care of, which in this case is the VOP2 driver. However,
>>> it also handles some of the older SoCs relying on the non-QP variant of
>>> DW HDMI IP. Hence the existing dw-hdmi driver would be also impacted in
>>> order to come up with a proper solution.
>>>
>>> A quick check shows there are several users of this IP:
>>>
>>> $ git grep -E '= dw_hdmi_(bind|probe)\('
>>> drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c:    hdmi->dw_hdmi = dw_hdmi_probe(pdev, plat_data);
>>> drivers/gpu/drm/bridge/synopsys/dw-hdmi.c:      hdmi = dw_hdmi_probe(pdev, plat_data);
>>> drivers/gpu/drm/imx/ipuv3/dw_hdmi-imx.c:        hdmi->hdmi = dw_hdmi_probe(pdev, match->data);
>>> drivers/gpu/drm/ingenic/ingenic-dw-hdmi.c:      hdmi = dw_hdmi_probe(pdev, &ingenic_dw_hdmi_plat_data);
>>> drivers/gpu/drm/meson/meson_dw_hdmi.c:  meson_dw_hdmi->hdmi = dw_hdmi_probe(pdev, &meson_dw_hdmi->dw_plat_data);
>>> drivers/gpu/drm/renesas/rcar-du/rcar_dw_hdmi.c: hdmi = dw_hdmi_probe(pdev, &rcar_dw_hdmi_plat_data);
>>> drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c:            hdmi->hdmi = dw_hdmi_bind(pdev, encoder, plat_data);
>>> drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c:  hdmi->hdmi = dw_hdmi_bind(pdev, encoder, plat_data);
>>>
>>> I didn't check which display drivers would be involved, I'd guess there
>>> are quite a few of them as well. So it seems this ends up being a pretty
>>> complex task.
>>
>> If this would be a brand new driver, then it should only support DRM_BRIDGE_ATTACH_NO_CONNECTOR,
>> so you should not create a connector from the driver.
>>
>> The fact dw-hdmi accepts an attach without the flag is for legacy purpose
>> since some DRM drivers haven't switched to DRM_BRIDGE_ATTACH_NO_CONNECTOR yes,
>> but it's a requirement for new bridges so at some point you'll need to make
>> sure the rockchip glue and drm driver supports DRM_BRIDGE_ATTACH_NO_CONNECTOR.
>>
>> This will greatly simplify the driver!
> 
> Based on the previous discussion， the DW HDMI QP drivers will be implemented like this：
> 
> Core bridge library：
>   drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
> Rockchip platform specific glue：
> drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> 
> As a new bridge driver should only support DRM_BRIDGE_ATTACH_NO_CONNECTOR,
> Is it acceptable if we implement the connector at  the rockchip glue dw_hdmi_qp-rockchip.c ？
> 
> Our current combination is a bit complex：
> The display controller driver is  drivers/gpu/drm/rockchip/rockchip_drm_vop2.c ，which shared
> by rk3568， rk3588 and some upcoming soc like rk3528/rk3562.
> 
> For rk3588， we have totally new HDMI、DP、DSI2  IP， they need brand new bridge driver that
> should only support DRM_BRIDGE_ATTACH_NO_CONNECTOR， and there is also an eDP on rk3588
> use analogix_dp_core.c that create connector by analogix_dp bridge。
> 
> For  rk3568， the HDMI/eDP/DSI IP are based on old IP， the corresponding drivers are dw-hdmi，analogix_dp
> and dw-mipi-dsi, they both create drm connector by it's bridge driver. And rk3528/rk3562 are like this too。
> 
> So if we can create drm_connector at glue side (such as dw_hdmi_qp-rockchip.c), let the interface driver decide
> if it should create drm_connector or not will make the vop2 driver simpler。

I think you should start migration to drm_bridge_connector instead of hacking dw_hdmi_qp-rockchip.c into
fitting into DRM_BRIDGE_ATTACH_NO_CONNECTOR.

You'll add technical dept, and the migration will be even harder afterwards.

But in any case, bridge/synopsys/dw-hdmi-qp.c and rockchip/dw_hdmi_qp-rockchip.c should be send
in two separate patchsets, so how rockchip DRM_BRIDGE_ATTACH_NO_CONNECTOR is a different story.

Neil

> 
> 
> 
> 
> 
>>
>> Neil
>>
>>>
>>> Cristian

