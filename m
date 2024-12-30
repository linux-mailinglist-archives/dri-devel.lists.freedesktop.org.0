Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B77789FEB44
	for <lists+dri-devel@lfdr.de>; Mon, 30 Dec 2024 23:21:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2A8D10E598;
	Mon, 30 Dec 2024 22:21:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="dyQOCkC4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.denx.de (mx.denx.de [89.58.32.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51D0B10E447
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 22:21:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id DB5AC1048559D; Mon, 30 Dec 2024 23:20:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
 t=1735597236;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SkIGZmwhg2neLO1jlUwO1QbcyyIDvbzGZHUYB0DXWPU=;
 b=dyQOCkC4zi2h/jh5Ubd0KW/ctVjjgO4bGU9YuZTP8ctxhxTBD6csQLevHwAQYl7FC3dBCb
 6wBhxmoe1dwJ3PUCNY3gXTJ7+GJRdAp1HMAlnoY8CyHJ24yajJmEXg9F+sFxeaHvqNbA6P
 fSLpfCkD66+q+/x9SWstwflEeQCLgYyLUsp/50WoX7mDC7Qf/713MONCsthuFyr21rjxL7
 Ur43H5ZfZxKZSAWrJLbICm7DSP2ziuoUZ1cJWWz1wPol8wyjnxwX50DItUlT1m+8LPniod
 feGIPFmfY2J1C+tqmozb2M0aW32P2kU7wKbzKn4Raelww25K+UXM5orsgLLaeg==
Message-ID: <defff8a2-4123-42cb-9099-445b209eb2f0@denx.de>
Date: Mon, 30 Dec 2024 22:41:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] drm/bridge: imx8mp-hdmi-tx: switch to bridge
 DRM_BRIDGE_ATTACH_NO_CONNECTOR
To: Liu Ying <victor.liu@nxp.com>, dri-devel@lists.freedesktop.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie
 <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Robert Foss <rfoss@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Stefan Agner <stefan@agner.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20241224014701.253490-1-marex@denx.de>
 <0140bb0c-35f0-4a5e-b100-32e09bc8c617@nxp.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <0140bb0c-35f0-4a5e-b100-32e09bc8c617@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
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

On 12/30/24 7:57 AM, Liu Ying wrote:

[...]

>> diff --git a/drivers/gpu/drm/bridge/imx/Kconfig b/drivers/gpu/drm/bridge/imx/Kconfig
>> index 9a480c6abb856..d8e9fbf75edbb 100644
>> --- a/drivers/gpu/drm/bridge/imx/Kconfig
>> +++ b/drivers/gpu/drm/bridge/imx/Kconfig
>> @@ -27,6 +27,7 @@ config DRM_IMX8MP_DW_HDMI_BRIDGE
>>   config DRM_IMX8MP_HDMI_PVI
>>   	tristate "Freescale i.MX8MP HDMI PVI bridge support"
>>   	depends on OF
>> +	select DRM_DISPLAY_CONNECTOR
> 
> Select it for DRM_IMX8MP_DW_HDMI_BRIDGE instead?
> Furthermore, if yes, should it be even selected for DRM_DW_HDMI instead?
> 
> I'm not sure if this is needed to be selected though, since only DRM_MESON is
> selecting it while CONFIG_DRM_DISPLAY_CONNECTOR is enabled in multiple
> defconfig files(like arch/arm/configs/multi_v7_defconfig).

It is necessary to update existing .config .

[...]
