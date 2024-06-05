Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C36588FD042
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2024 15:57:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27B9D10E1F4;
	Wed,  5 Jun 2024 13:57:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="zIntRJWy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5796E10E1F4
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2024 13:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1717595859;
 bh=st5j0iGUSYPFxLJVLH10uqgCn92SsvH/nFRYz9+eP9E=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=zIntRJWychwIPEEtD6wN2opnKdjQfdMF2XHtKD1HlCgcwv+4oNkw+I0QnFbBgbnXH
 4p10t1xFzOC5gMWHiS1iL1xqOnuh3J3rPteiQ9ueIa6mGWUDRwTjXhMQ9eId66YptW
 ASwKKskbWCGpnzkjXrdaE8LHfbYYPJZOp4FrCafcJemkW1quwXZe8dp6vsKYkOVz2c
 GknLvbOv+hN3rN0SSyvqcbEUMagJV2OSqcS2hrYjfbwnC8qbkm2yOqzhVKVqgS190Z
 IaVahKfpPQ/LGAM+X+j7epFrwUbXs1eKtL8fFSVxl2kf32ntSSNbhJNp0hVL9YPSkV
 ZnTKhZoErb9WA==
Received: from [100.115.223.179] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: cristicc)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id C35A7378061A;
 Wed,  5 Jun 2024 13:57:37 +0000 (UTC)
Message-ID: <3fcef87b-6173-45fd-a7fc-f5e9d2541337@collabora.com>
Date: Wed, 5 Jun 2024 16:57:37 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/14] drm/bridge: synopsys: Add DW HDMI QP TX controller
 driver
To: neil.armstrong@linaro.org, Sam Ravnborg <sam@ravnborg.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
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
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Content-Language: en-US
In-Reply-To: <5dc16b34-d638-4fab-84e1-cb7db08ad80e@linaro.org>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/5/24 2:48 PM, Neil Armstrong wrote:
> On 05/06/2024 12:11, Cristian Ciocaltea wrote:
>> On 6/5/24 12:34 AM, Cristian Ciocaltea wrote:
>>> On 6/4/24 11:41 PM, Sam Ravnborg wrote:
>>>> Hi Cristian.
>>>>
>>>> On Tue, Jun 04, 2024 at 10:32:04PM +0300, Cristian Ciocaltea wrote:
>>>>> Hi Sam,
>>>>>
>>>>> On 6/1/24 5:32 PM, Sam Ravnborg wrote:
>>>>>> Hi Cristian,
>>>>>>
>>>>>> a few drive-by comments below.
>>>>>>
>>>>>>     Sam
>>>>>>
>>>>>>
>>>>>>> +
>>>>>>> +static const struct drm_connector_funcs
>>>>>>> dw_hdmi_qp_connector_funcs = {
>>>>>>> +    .fill_modes = drm_helper_probe_single_connector_modes,
>>>>>>> +    .detect = dw_hdmi_connector_detect,
>>>>>>> +    .destroy = drm_connector_cleanup,
>>>>>>> +    .force = dw_hdmi_qp_connector_force,
>>>>>>> +    .reset = drm_atomic_helper_connector_reset,
>>>>>>> +    .atomic_duplicate_state =
>>>>>>> drm_atomic_helper_connector_duplicate_state,
>>>>>>> +    .atomic_destroy_state =
>>>>>>> drm_atomic_helper_connector_destroy_state,
>>>>>>> +};
>>>>>>> +
>>>>>>> +static int dw_hdmi_qp_bridge_attach(struct drm_bridge *bridge,
>>>>>>> +                    enum drm_bridge_attach_flags flags)
>>>>>>> +{
>>>>>>> +    struct dw_hdmi *hdmi = bridge->driver_private;
>>>>>>> +
>>>>>>> +    if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
>>>>>>> +        return drm_bridge_attach(bridge->encoder,
>>>>>>> hdmi->next_bridge,
>>>>>>> +                     bridge, flags);
>>>>>>> +
>>>>>>> +    return dw_hdmi_connector_create(hdmi,
>>>>>>> &dw_hdmi_qp_connector_funcs);
>>>>>>> +}
>>>>>>
>>>>>> Are there any users left that requires the display driver to
>>>>>> create the
>>>>>> connector?
>>>>>> In other words - could this driver fail if
>>>>>> DRM_BRIDGE_ATTACH_NO_CONNECTOR
>>>>>> is not passed and drop dw_hdmi_connector_create()?
>>>>>>
>>>>>> I did not try to verify this - just a naive question.
>>>>>
>>>>> I've just tested this and it doesn't work - dw_hdmi_connector_create()
>>>>> is still needed.
>>>>
>>>> Hmm, seems the display driver or some other bridge driver fails to
>>>> support "DRM_BRIDGE_ATTACH_NO_CONNECTOR".
>>>> what other drivers are involved?
>>>
>>> Could it be related to the glue driver (updated in the next patch) which
>>> is also responsible for setting up the encoder?
>>>
>>>> Note that my comments here should be seen as potential future
>>>> improvements, and do not block the patch from being used.
>>>
>>> Thanks for the heads up! Will try to get back to this soon and
>>> investigate.
>>   IIUC, modern bridges should not create the connector but rely on
>> display
>> drivers to take care of, which in this case is the VOP2 driver. However,
>> it also handles some of the older SoCs relying on the non-QP variant of
>> DW HDMI IP. Hence the existing dw-hdmi driver would be also impacted in
>> order to come up with a proper solution.
>>
>> A quick check shows there are several users of this IP:
>>
>> $ git grep -E '= dw_hdmi_(bind|probe)\('
>> drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c:    hdmi->dw_hdmi =
>> dw_hdmi_probe(pdev, plat_data);
>> drivers/gpu/drm/bridge/synopsys/dw-hdmi.c:      hdmi =
>> dw_hdmi_probe(pdev, plat_data);
>> drivers/gpu/drm/imx/ipuv3/dw_hdmi-imx.c:        hdmi->hdmi =
>> dw_hdmi_probe(pdev, match->data);
>> drivers/gpu/drm/ingenic/ingenic-dw-hdmi.c:      hdmi =
>> dw_hdmi_probe(pdev, &ingenic_dw_hdmi_plat_data);
>> drivers/gpu/drm/meson/meson_dw_hdmi.c:  meson_dw_hdmi->hdmi =
>> dw_hdmi_probe(pdev, &meson_dw_hdmi->dw_plat_data);
>> drivers/gpu/drm/renesas/rcar-du/rcar_dw_hdmi.c: hdmi =
>> dw_hdmi_probe(pdev, &rcar_dw_hdmi_plat_data);
>> drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c:            hdmi->hdmi =
>> dw_hdmi_bind(pdev, encoder, plat_data);
>> drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c:  hdmi->hdmi =
>> dw_hdmi_bind(pdev, encoder, plat_data);
>>
>> I didn't check which display drivers would be involved, I'd guess there
>> are quite a few of them as well. So it seems this ends up being a pretty
>> complex task.
> 
> If this would be a brand new driver, then it should only support
> DRM_BRIDGE_ATTACH_NO_CONNECTOR,
> so you should not create a connector from the driver.
> 
> The fact dw-hdmi accepts an attach without the flag is for legacy purpose
> since some DRM drivers haven't switched to
> DRM_BRIDGE_ATTACH_NO_CONNECTOR yes,
> but it's a requirement for new bridges so at some point you'll need to make
> sure the rockchip glue and drm driver supports
> DRM_BRIDGE_ATTACH_NO_CONNECTOR.
> 
> This will greatly simplify the driver!

Got it, thanks for the clarifications!

Cristian
