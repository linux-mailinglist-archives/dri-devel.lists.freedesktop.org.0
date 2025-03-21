Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F98A6C3CF
	for <lists+dri-devel@lfdr.de>; Fri, 21 Mar 2025 21:02:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 766C310E830;
	Fri, 21 Mar 2025 20:02:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="VDxZ2EQ/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.denx.de (mx.denx.de [89.58.32.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 816E610E190
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Mar 2025 20:02:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8A42E101E8FE7; Fri, 21 Mar 2025 21:02:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
 t=1742587336; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=3Ulsbme4hNQzYTq8vlOulaN2Y8LowM5FPAQmz8elBPM=;
 b=VDxZ2EQ/5tg99PzI7sO7Iev5h1/wFCQ+DuZIPurcNhRu42cjUBDXfEBThUs7hHKYmEHyVb
 j9OYINwC6QB3Sd1o1XsGYvtnGKqSXJpNCTVm2g7uEiYxd112uSCJ8xvB29ci2Zh3RX/euB
 YddxYDnEYqWs9UsY0f9AWgBniVPLPyf4a32wbwjAvNiy73gpUA51StDBQRVb7BS5OiYfvg
 3hXbQJ3zduLUkKjTAbwn9pjp8jobnNBp1cK/kWQYCtY8Vvx46VeoZDzvVv2eXelpVASJI4
 5UnSh2YmrAM3yZ+T/+LNggwYMMjh+8oBMiFHZ/pUqesF43NhZK3OjJJIW4m7wQ==
Message-ID: <d19fa0b9-b07b-46cf-aa3f-3c2e65fecd67@denx.de>
Date: Fri, 21 Mar 2025 20:54:26 +0100
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
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20250303133523.2c5153ed@collabora.com>
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

On 3/3/25 1:35 PM, Boris Brezillon wrote:

Hi,

>> This looks like it has been part of a R50 release of the DDK, which is recent
>> enough to consider it up-to-date. The issues you're seeing with fast resume are
>> probably due to some integration issues or other quirks.
>>
>> Boris has the most recent experience with playing with fast resume, maybe
>> he can share some tips on where to add messages in Panthor to try to debug
>> your problem.
> 
> If you end up with fast_reset=true, that means the FW claims it entered
> a suspend state from which is can resume quickly (fast-reset), and in
> that case, we're only supposed to power on the L2 block at resume time
> AFAIK. If there's a component that can tell us more, it's probably the
> FW, unfortunately, it doesn't tell us much through the FW interface,
> especially if it's not booting properly. Do you hit this error [1]
> without this patch, and if you do, what's the status reported there?
> 
> [1]https://elixir.bootlin.com/linux/v6.14-rc4/source/drivers/gpu/drm/panthor/panthor_fw.c#L1051

Sorry for the late reply. I get the following, so I think the status is 
"fatal" ?

panthor 4d900000.gpu: [drm] clock rate = 1000000000
panthor 4d900000.gpu: EM: created perf domain
panthor 4d900000.gpu: [drm] mali-g310 id 0xac74 major 0x0 minor 0x0 
status 0x1
panthor 4d900000.gpu: [drm] Features: L2:0x7110306 Tiler:0x809 Mem:0x1 
MMU:0x2830 AS:0xff
panthor 4d900000.gpu: [drm] shader_present=0x1 l2_present=0x1 
tiler_present=0x1
panthor 4d900000.gpu: [drm] Firmware protected mode entry not be 
supported, ignoring
panthor 4d900000.gpu: [drm] Firmware git sha: 
8e5cfcfec20cc8aff8509d37e72babc935d34a3b
panthor 4d900000.gpu: [drm] CSF FW using interface v1.1.0, Features 0x0 
Instrumentation features 0x71
[drm] Initialized panthor 1.3.0 for 4d900000.gpu on minor 0
panthor 4d900000.gpu: [drm] *ERROR* Failed to boot MCU (status=fatal)
panthor 4d900000.gpu: [drm] *ERROR* FW fast reset failed
panthor 4d900000.gpu: [drm] *ERROR* Fast reset failed, trying a slow reset
panthor 4d900000.gpu: [drm] *ERROR* Failed to boot MCU (status=fatal)
panthor 4d900000.gpu: [drm] *ERROR* FW slow reset failed
