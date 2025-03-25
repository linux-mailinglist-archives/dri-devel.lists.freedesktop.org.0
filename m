Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96493A7039F
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 15:27:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3CAF10E589;
	Tue, 25 Mar 2025 14:27:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="h8mxzJOU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.denx.de (mx.denx.de [89.58.32.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F44E10E589
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 14:27:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BB247102EBA49; Tue, 25 Mar 2025 15:27:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
 t=1742912836; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=mVgBuvwlTjig0oSmPB6BQKFdvM38TG/M7XXOVQoAWGo=;
 b=h8mxzJOUJNe4zDuFBuk4WSVlR1MP4YPHN94AvvdVP8/HeTviSAij+0yoyOlAiTqC1PZd+1
 DYMXeaNmqBrD+Bofx4bbFOjfLiKkkqMUY8aM/crN9XyBiZN+62LmcRvDdajK5zDPDU80vT
 L8fgD0eajwg4l66xHAyIK3DR413TwDeMZXixGQfXruUpaVUAyNQXrmtV3u71JnmUJYeTZ4
 W/61WRvMhOHEgeXsoo4BeeFl2gAmduhB/eSKxZr/7q9nokMBqVaYnBrqSiZUBCCQ6zN4+8
 nxA3IJEAz5BcZ1wu42KB2Ls7BFnRB2PO2iZ43hjimhge5T2UbRgWYsIhcETcIA==
Message-ID: <7233d56f-d07d-46c3-9954-57eb583a36ac@denx.de>
Date: Tue, 25 Mar 2025 15:27:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/9] drm/panthor: Implement optional reset
To: Philipp Zabel <p.zabel@pengutronix.de>,
 Boris Brezillon <boris.brezillon@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
 David Airlie <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Sebastian Reichel <sre@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Steven Price <steven.price@arm.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev
References: <20250321200625.132494-1-marex@denx.de>
 <20250321200625.132494-5-marex@denx.de>
 <20250324094333.7afb17a1@collabora.com>
 <22187ae5-7486-416b-b612-53021bfca11e@denx.de>
 <13376dff8d861389464b7ecdb2f82fe211638500.camel@pengutronix.de>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <13376dff8d861389464b7ecdb2f82fe211638500.camel@pengutronix.de>
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

On 3/25/25 3:12 PM, Philipp Zabel wrote:
> On Mo, 2025-03-24 at 20:05 +0100, Marek Vasut wrote:
>> On 3/24/25 9:43 AM, Boris Brezillon wrote:
>>
>> [...]
>>
>>>> @@ -563,6 +585,7 @@ int panthor_device_suspend(struct device *dev)
>>>>    
>>>>    	panthor_devfreq_suspend(ptdev);
>>>>    
>>>> +	reset_control_assert(ptdev->resets);
>>>
>>> Hm, that might be the cause of the fast reset issue (which is a fast
>>> resume more than a fast reset BTW): if you re-assert the reset line on
>>> runtime suspend, I guess this causes a full GPU reset, and the MCU ends
>>> up in a state where it needs a slow reset (all data sections reset to
>>> their initial state). Can you try to move the reset_control_[de]assert
>>> to the unplug/init functions?
>> The reset on the MX95 is not really a reset, it is clear-only
>> set-never-again bit which goes only one way, the "unreset" way, so I
>> don't think this has any impact.
> 
> This sounds like the bit is initially set to 1 (reset asserted) and can
> be cleared by writing 0 (once, to deassert the reset). But in the
> reset-simple patch it looks to be the other way around (active_low =
> true)?
> 
> If the reset control can't be asserted again on this hardware, it would
> be better to have custom driver that doesn't implement the .assert()
> callback at all.
Maybe the reset-simple driver can be extended with some mode of 
operation like this instead , to make it skip assert once deasserted , 
for specific reset controllers ?
