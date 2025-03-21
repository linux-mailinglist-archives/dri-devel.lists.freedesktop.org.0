Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF3CA6C3CE
	for <lists+dri-devel@lfdr.de>; Fri, 21 Mar 2025 21:02:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7664010E190;
	Fri, 21 Mar 2025 20:02:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="UAPj7u9D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.denx.de (mx.denx.de [89.58.32.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81DAC10E830
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Mar 2025 20:02:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 635FF101E8FE9; Fri, 21 Mar 2025 21:02:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
 t=1742587339; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=drWgqDtEwtRQ/AqNec+865/QoSBEzToGMlvzXdRpbRc=;
 b=UAPj7u9D99BzWdmrqugwwfMF1kOr649TjzIBIrq4luHu3EKIxBSYIlVak1XBT5eZi8IlIx
 WH8Lb6E04i0EDXTUyFMYBabrxds3rJoJtAgSWLBRbbFg1/qhgZztdq2LGVCXJBvbyq+wc3
 KCVQSBu2VkznmY8lFrQcOqkpiG86I7rhBwo/QO2z86gNO5Q+jqWpP+GH2Zkr1wAGUnmEu3
 S9rvJQSGNl/aRqgtlG67xsnIuhxEIt5cFLHpccdkvSHaWRMeymOyJtuNiE0rhWoJytV8Jo
 4GAR5ZO7/E7pOVsavK64sbJ4OFsnVYm/NtqDV/yWRBm3yMYvCUFpfBCvDKZ+QQ==
Message-ID: <12a0c285-8f1a-4014-9253-0129a3a6ba21@denx.de>
Date: Fri, 21 Mar 2025 21:00:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/9] drm/panthor: Reset GPU after L2 cache power off
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
 David Airlie <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
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
 <Z8GY0nWXOxCKF-XL@e110455-lin.cambridge.arm.com>
 <fa88c1c1-89ba-4a10-bd57-0819d7740c0a@denx.de>
 <Z8Wb05rmGW0ORnJB@e110455-lin.cambridge.arm.com>
 <20250303133523.2c5153ed@collabora.com>
 <20250303134250.5ba726fc@collabora.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20250303134250.5ba726fc@collabora.com>
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

On 3/3/25 1:42 PM, Boris Brezillon wrote:

Hi,

>>> This looks like it has been part of a R50 release of the DDK, which is recent
>>> enough to consider it up-to-date. The issues you're seeing with fast resume are
>>> probably due to some integration issues or other quirks.
>>>
>>> Boris has the most recent experience with playing with fast resume, maybe
>>> he can share some tips on where to add messages in Panthor to try to debug
>>> your problem.
>>
>> If you end up with fast_reset=true, that means the FW claims it entered
>> a suspend state from which is can resume quickly (fast-reset), and in
>> that case, we're only supposed to power on the L2 block at resume time
>> AFAIK.
> 
> Can you try deasserting the reset lines at probe time and keeping them
> deasserted until the device is removed instead of re-asserting at
> suspend time? If that doesn't work, try doing the same with power
> domains.
I'm afraid either of this makes no difference, no.

I'll at least send a V2 now, so others can use the latest state of my work.
