Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D6C9FEB46
	for <lists+dri-devel@lfdr.de>; Mon, 30 Dec 2024 23:21:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9EB810E59D;
	Mon, 30 Dec 2024 22:21:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="MQ8jQUC0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.denx.de (mx.denx.de [89.58.32.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D289510E59D
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 22:21:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id EB676104855A5; Mon, 30 Dec 2024 23:20:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
 t=1735597247;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+1aqRMHNMzLaQa6vxtrEZIq/gKd1oypuSqRY/qdQISU=;
 b=MQ8jQUC02Vi9tztaW6KMyrHmVikWXRPJCkNuOVO4p0MVDOBDA4BmRU0abBaUgXMLWYLQNe
 vgU3noAgdyo252spI9eoH2iWEoCPdiFyn39HYCwhDoP2KpEdMIS01r+JNscauPmHNTJuRm
 ye69UcjGudnOLbLXoJ9uwywMf4zN00A72tUWfEO4tdj3Rr5lVZfVDgqE8+kkQCSbaoTCo4
 fSoHdmOXrVy0XKVeNLEQ1djn0YFfHODWpTTuTR0iOcHELvuQ3714PP82hU5AYav/chKedE
 zXa1jpmoNIRm3g45ldfaQoKbCzHpAhRyM30Ikm661QTEDklXwYgJpyfuzplxMA==
Message-ID: <59523b40-dfdd-4293-9b02-e16be632d1d2@denx.de>
Date: Mon, 30 Dec 2024 23:11:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] drm/lcdif: add DRM_BRIDGE_ATTACH_NO_CONNECTOR flag
 to drm_bridge_attach
To: Liu Ying <victor.liu@nxp.com>, dri-devel@lists.freedesktop.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie <airlied@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
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
 <20241224014701.253490-2-marex@denx.de>
 <a543e24a-1333-42ef-b940-fec01353db5b@nxp.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <a543e24a-1333-42ef-b940-fec01353db5b@nxp.com>
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

On 12/30/24 8:18 AM, Liu Ying wrote:

[...]

>> diff --git a/drivers/gpu/drm/mxsfb/Kconfig b/drivers/gpu/drm/mxsfb/Kconfig
>> index 264e74f455547..07fb6901996ae 100644
>> --- a/drivers/gpu/drm/mxsfb/Kconfig
>> +++ b/drivers/gpu/drm/mxsfb/Kconfig
>> @@ -30,6 +30,7 @@ config DRM_IMX_LCDIF
>>   	select DRM_CLIENT_SELECTION
>>   	select DRM_MXS
>>   	select DRM_KMS_HELPER
>> +	select DRM_BRIDGE_CONNECTOR
> 
> Select DRM_DISPLAY_HELPER.
Without select DRM_BRIDGE_CONNECTOR, the drm_bridge_connector_init() is 
not defined .
