Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A33B9448AA
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 11:43:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D357E10E8D3;
	Thu,  1 Aug 2024 09:43:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="3DSbziDZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C31A110E8D3
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2024 09:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1722505399;
 bh=RIgEcQ8M7T7AXs8bBHXfSd4MAegcWjerjXlyDp/HZv0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=3DSbziDZU5+TjBC5B8vDpoOw8aCNIr06i23+pSszqinx/BJSCcsQoIuowNZ44OKL7
 1+xyZVsNbnfJBmOJouCnaqvlVLl7rsyQUBoG3XAB/Q07/6Fw5qapAeNkMDa7V/a4mq
 n53FxVfZK/mxesyVGKqhS/DJkhmqGh/zEOw4uH8qk+WTvpTFWG4inTBU5IrHzjPGmO
 G0vnnRn6ckmOMSXN55kO5NZVE9iiByTno1gT5r3c688A1zUSS3t0hnPlOD+0xHwF3+
 k72WpBfsEH5xBWZZBGka4LjZRGlygQK13crS9cX+YrrE2S63fYfnrnfwAZNBrrMR5s
 vYzudfUVd60mw==
Received: from [100.115.223.179] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: cristicc)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id DCAE8378220A;
 Thu,  1 Aug 2024 09:43:17 +0000 (UTC)
Message-ID: <274a023a-de27-49e7-aa03-7fd60ddfcb87@collabora.com>
Date: Thu, 1 Aug 2024 12:43:17 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/bridge: synopsys: Add DW HDMI QP TX Controller
 driver
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, Alexandre ARNOUD <aarnoud@me.com>,
 Luis de Arquer <ldearquer@gmail.com>, Algea Cao <algea.cao@rock-chips.com>
References: <20240801-dw-hdmi-qp-tx-v1-0-148f542de5fd@collabora.com>
 <20240801-dw-hdmi-qp-tx-v1-2-148f542de5fd@collabora.com>
 <19af747f-0911-4896-afba-b63c585554d4@kernel.org>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <19af747f-0911-4896-afba-b63c585554d4@kernel.org>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/1/24 11:50 AM, Krzysztof Kozlowski wrote:
> On 01/08/2024 04:05, Cristian Ciocaltea wrote:
>> The Synopsys DesignWare HDMI 2.1 Quad-Pixel (QP) TX Controller supports
>> the following features, among others:
> 
> ...
> 
>> +
>> +void dw_hdmi_qp_unbind(struct dw_hdmi_qp *hdmi)
>> +{
>> +}
>> +EXPORT_SYMBOL_GPL(dw_hdmi_qp_unbind);
> 
> This looks like quite useless export. Drop.
> 
> 
>> +
>> +void dw_hdmi_qp_resume(struct device *dev, struct dw_hdmi_qp *hdmi)
>> +{
>> +	dw_hdmi_qp_init_hw(hdmi);
>> +}
>> +EXPORT_SYMBOL_GPL(dw_hdmi_qp_resume);
>> +
>> +MODULE_AUTHOR("Algea Cao <algea.cao@rock-chips.com>");
>> +MODULE_AUTHOR("Cristian Ciocaltea <cristian.ciocaltea@collabora.com>");
>> +MODULE_DESCRIPTION("DW HDMI QP transmitter driver");
>> +MODULE_LICENSE("GPL");
>> +MODULE_ALIAS("platform:dw-hdmi-qp");
> 
> That's not a platform driver. That does not look like driver at all,
> just some helper code without any user

This is actually used to provide RK3588 HDMI output support:

https://lore.kernel.org/lkml/20240801-b4-rk3588-bridge-upstream-v2-3-9fa657a4e15b@collabora.com/

> 1. Drop alias.
> 2. Provide users for this code. You cannot add some helper functions
> which nothing uses.
> 3. Fix subject, commit msg, module description - there is no driver
> here, but helper functions. Otherwise how does it bind?

Indeed, that's just a left over from the initial dw-hdmi based 
implementation.  Will clean this up for v2.

Thanks for reviewing,
Cristian
