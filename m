Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9E7A4A175
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 19:27:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3D0710E0EA;
	Fri, 28 Feb 2025 18:27:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="dILOl6dK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.denx.de (mx.denx.de [89.58.32.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D3E610E102
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 18:27:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 083DA1034EAF8; Fri, 28 Feb 2025 19:26:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
 t=1740767223;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EEWR1Biyrz/i/9OwEZXDJ1J5UyzPcJrvLTGLj7Exnds=;
 b=dILOl6dKlPvSkD8jJQ3pREfonS5ajNyFDt0yNkJ2Bmgk2sqUHs9TQKM747E5dq1gdWxUT5
 JjYuCzYPpZwkW/JK5vHS+mvIUP1E0Q4opAw9di3+a/A4GykvnQGp+XO7xLmhV5kKDcTaRm
 BQ+xQqFdvPo4EMC8nTKIoHdotUusxvCf410fQLT1RjkHqA69JqwIljUIAjar1HUGbXC+nt
 wfQUeDba/PRyfRG9wRFGfJp8B8WVC1ftkaWvMOFyXtJPmmIuVty/XMp4YEtvOjy1c2wVzR
 JUnEsnCLSI618BX+wB5nIc70D9Rir0sWbtYEJCIPHhd67M6oCcKTVHCvakQTZw==
Message-ID: <bf3486cb-4f87-4cf4-ab6a-6c8cc627ce53@denx.de>
Date: Fri, 28 Feb 2025 17:43:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/9] reset: simple: Add support for Freescale i.MX95 GPU
 reset
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sebastian Reichel <sre@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Steven Price <steven.price@arm.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, devicetree@vger.kernel.org, imx@lists.linux.dev
References: <20250227170012.124768-1-marex@denx.de>
 <20250227170012.124768-3-marex@denx.de> <2425297.NG923GbCHz@steina-w>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <2425297.NG923GbCHz@steina-w>
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

On 2/28/25 10:58 AM, Alexander Stein wrote:

Hi,

>>   drivers/reset/reset-simple.c | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/drivers/reset/reset-simple.c b/drivers/reset/reset-simple.c
>> index 2760678398308..1415a941fd6eb 100644
>> --- a/drivers/reset/reset-simple.c
>> +++ b/drivers/reset/reset-simple.c
>> @@ -133,9 +133,17 @@ static const struct reset_simple_devdata reset_simple_active_low = {
>>   	.status_active_low = true,
>>   };
>>   
>> +static const struct reset_simple_devdata reset_simple_fsl_imx95_gpu_blk_ctrl = {
>> +	.reg_offset = 0x8,
> 
> Shouldn't you add ".nr_resets = 1"? Otherwise this will have 8 resets
> (resource_size(res) * BITS_PER_BYTE).

I should, thanks.

> On a side note: RM says this is a write-once register. Do we consider writing
> this register again?
> BTW: Would it be possible to disable it completely (until reset) by writing 1?
My observation is that this register is set and cannot be cleared by 
writing 0 into it, if I write 0 into this register and read it back, it 
stays at 1 .

Maybe NXP can clarify whether modelling this as reset-simple is really a 
good idea or whether it would be better to rewrite this as custom reset 
driver ?

[...]
