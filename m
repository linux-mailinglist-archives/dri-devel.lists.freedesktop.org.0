Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 777AF9FEB41
	for <lists+dri-devel@lfdr.de>; Mon, 30 Dec 2024 23:20:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E67810E39A;
	Mon, 30 Dec 2024 22:20:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="YRVsLB4z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.denx.de (mx.denx.de [89.58.32.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0C3C10E39A
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 22:20:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 02A65104855A2; Mon, 30 Dec 2024 23:20:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
 t=1735597243;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W0RN6NFic1SJk4BcW3RydaV5Qx5yppE2e75Iroc0II4=;
 b=YRVsLB4zoSRwpZ+/TbKt7LHkMVX7UexGNe1JYwsG6QOqBDN5gnh64f1ZwZp8b0o6ne/+94
 r7wuSjv6EQ6x1TTMSk76VSCPgqGZdGBN67H73nn8Qw4xG3FpvGcn/0SbiiLj0ZOATeyUm0
 gTRf+MC2iQf/gFTHVEIKUR2x1CNhCyPm2l4DC3o6G2z51+weRDnbpBx3sBrUu0vCPaV3Iw
 VP8311XQjM8/0ahL8WxudHySrjeM+/1/qVW2yvN7Ban+crr0xiANc3NtmFbHNcfrflkv7q
 OvNwpks+fIDwWksNvjOyxCALtY+lvi8N9xU2/NfgPJok+lazwti3L4ACU1LFnQ==
Message-ID: <828f28ce-007b-43c1-9ea4-98be5c14078e@denx.de>
Date: Mon, 30 Dec 2024 22:50:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] drm/mxsfb: add DRM_BRIDGE_ATTACH_NO_CONNECTOR flag
 to drm_bridge_attach
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
 <20241224014701.253490-3-marex@denx.de>
 <20f33e1e-b531-4755-b414-02ab897e16af@nxp.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20f33e1e-b531-4755-b414-02ab897e16af@nxp.com>
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

On 12/30/24 8:29 AM, Liu Ying wrote:

[...]

>> @@ -139,21 +140,35 @@ static int mxsfb_attach_bridge(struct mxsfb_drm_private *mxsfb)
>>   	if (!bridge)
>>   		return -ENODEV;
>>   
>> -	ret = drm_bridge_attach(&mxsfb->encoder, bridge, NULL, 0);
>> +	ret = drm_bridge_attach(&mxsfb->encoder, bridge, NULL,
>> +				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
>>   	if (ret)
>>   		return dev_err_probe(drm->dev, ret, "Failed to attach bridge\n");
>>   
>> -	mxsfb->bridge = bridge;
>> +	connector = drm_bridge_connector_init(drm, &mxsfb->encoder);
> 
> Nit: Drop connector and use mxsfb->connector?
The code becomes too wide. The rest is fixed in V3.
