Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D902FA48688
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 18:26:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4535B10EB52;
	Thu, 27 Feb 2025 17:26:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="I52RF/4R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.denx.de (mx.denx.de [89.58.32.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ED2D10EB50
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 17:26:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B722510382F24; Thu, 27 Feb 2025 18:26:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
 t=1740677178;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z4OqO0DlmHTyAuXAgYbGzIkXg36xy2WA6u8k/uPoPPA=;
 b=I52RF/4RmJii3MfN1/Z74h9+4oa9hwjgxOCPH+oHDZwj4E3b6qEDxXRqbxa3A2GutMSz8n
 e8pIozchEVC9K2kZKq13KKYtSmYYsXuA8t4yBFhQ+XfVYVJ/TZHobjR1HIis418UoIV8dQ
 iR7Lz9ep20PlsCmzbPxEZd5J0FzLQSHo5f4sF8whxei2m6WiAgUoH/eLFzfHD/mNuVstvs
 drAsgJd5vut8VFuOo0wAP663gFSltxq+xcAK2wOR/n7CoHaSmAHjFAUte5ljno2pvTp5op
 +AC4aFkDRUlXO1mPjEoMS5GWeBaQcbNtVOBzY5PAW4WRrItNNjkTN10FKmziwA==
Message-ID: <601055ff-6a19-4d89-b4ae-fb437d3f1670@denx.de>
Date: Thu, 27 Feb 2025 18:26:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH 6/9] drm/panthor: Reset GPU after L2 cache power off
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
 David Airlie <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sebastian Reichel <sre@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Steven Price <steven.price@arm.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev
References: <20250227170012.124768-1-marex@denx.de>
 <20250227170012.124768-7-marex@denx.de>
 <20250227181748.3f99d67e@collabora.com>
Content-Language: en-US
In-Reply-To: <20250227181748.3f99d67e@collabora.com>
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

On 2/27/25 6:17 PM, Boris Brezillon wrote:

[...]

>> diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
>> index 671049020afaa..0f07ef7d9aea7 100644
>> --- a/drivers/gpu/drm/panthor/panthor_gpu.c
>> +++ b/drivers/gpu/drm/panthor/panthor_gpu.c
>> @@ -470,11 +470,12 @@ int panthor_gpu_soft_reset(struct panthor_device *ptdev)
>>    */
>>   void panthor_gpu_suspend(struct panthor_device *ptdev)
>>   {
>> -	/* On a fast reset, simply power down the L2. */
>> -	if (!ptdev->reset.fast)
>> -		panthor_gpu_soft_reset(ptdev);
>> -	else
>> -		panthor_gpu_power_off(ptdev, L2, 1, 20000);
>> +	/*
>> +	 * Power off the L2 and soft reset the GPU, that makes
>> +	 * iMX95 Mali G310 resume without firmware boot timeout.
>> +	 */
>> +	panthor_gpu_power_off(ptdev, L2, 1, 20000);
>> +	panthor_gpu_soft_reset(ptdev);
> 
> Unfortunately, if you do that unconditionally we no longer have a
> fast-reset. Would be good to figure out why the fast-reset doesn't work
> on this platform.

I was hoping to get some hint on this one, I spent quite a while trying 
to narrow this down, finally got it down to this particular bit.

The NXP downstream vendor kernel vendor Mali driver does not seem to 
have anything interesting regarding the L2 power handling, but I might 
have missed it, the code is difficult to read.

Have you ever seen anything problematic in this specific L2 department ?

Do you have any hints how I can debug this further ?
