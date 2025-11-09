Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2770CC445A5
	for <lists+dri-devel@lfdr.de>; Sun, 09 Nov 2025 20:11:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45BB510E089;
	Sun,  9 Nov 2025 19:11:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="pqjUqaiY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AAC810E089
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Nov 2025 19:11:11 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4d4MpN00fPz9spj;
 Sun,  9 Nov 2025 20:11:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1762715468;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qz9lQGFdKGtpGf5hNxRCycqEsoFiqWsV2nAo7e2G5M8=;
 b=pqjUqaiYzH2r+VQqOdcmBRU+enBbdlqmrTYJSzdshiwz0O/zE9LE4Z2VNctOktKqe2Dh7V
 Oudu+mYseqqa25zOZnjTspizxf+CCYzfo/sMyP2uOkJEPxOQ/4KUK9kyOQnoLZI4cnIlWR
 T2ajUQD2GcZjMF/K+y/raXnwI8BCGVSpXZSr9+z0J6RrL4O9UqyvWYAYCCWkWbpMqX/rHE
 fkw4/s0L6KW9IUg5pZfNUYC82zOgD+nBPbykzD4XcUjpZ/fIciOP8Nl7qh3w5UXtFAR/hz
 bTqmgcRMfhtED/dnvrGveSJ6Sld7u+V139YrngA5cX5J9SdHZrKSJ8MJrXzMEQ==
Message-ID: <de695268-1241-4658-871c-30dbf068ad92@mailbox.org>
Date: Sun, 9 Nov 2025 20:11:02 +0100
MIME-Version: 1.0
Subject: Re: [PATCH v4 07/14] drm/imx: dc: Add DPR channel support
To: Liu Ying <victor.liu@nxp.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
References: <20251016-imx8-dc-prefetch-v4-0-dfda347cb3c5@nxp.com>
 <20251016-imx8-dc-prefetch-v4-7-dfda347cb3c5@nxp.com>
 <174bdb5a-b5a8-4856-a0ac-8caaaefde136@mailbox.org>
 <24f99c46-ca5d-43cc-a2eb-a6e5029e9f86@nxp.com>
 <500852c9-2cd5-4897-a139-4e93988f5469@mailbox.org>
 <df8751ba-7215-4635-98b0-ca659ec786cd@nxp.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <df8751ba-7215-4635-98b0-ca659ec786cd@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: sinmtj6ays4tudk4uae5k9qryfi8goyt
X-MBO-RS-ID: cff78c7cf3058c1fefc
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

On 11/4/25 8:18 AM, Liu Ying wrote:

Hello Liu,

>>>>> +++ b/drivers/gpu/drm/imx/dc/Kconfig
>>>>> @@ -1,6 +1,7 @@
>>>>>     config DRM_IMX8_DC
>>>>>         tristate "Freescale i.MX8 Display Controller Graphics"
>>>>>         depends on DRM && COMMON_CLK && OF && (ARCH_MXC || COMPILE_TEST)
>>>>> +    depends on IMX_SCU
>>>> Can the SCU dependency be made optional,
>>>
>>> I don't think this can be done.  If you grep 'depends on IMX_SCU' in
>>> kernel, you may find a handful of existing dependancies.
>>
>> Sure, I do not dispute this part.
>>
>> But the SCU dependency can be contained in a component of this driver,
>> which is not used by MX95, and used only by MX8Q . Then there will be
>> no problem.
> 
> Which component?  You mean PRG and DPRC?
> 
> If we add something like CONFIG_DRM_IMX8_DC_PRG and make CONFIG_DRM_IMX8_DC_PRG
> depend on SCU, then should we make CONFIG_DRM_IMX8_DC depend on
> CONFIG_DRM_IMX8_DC_PRG?  That's yet another dependency.

I would say, if possible, put the SCU-dependent parts behind 
CONFIG_DRM_IMX8_DC_PRG symbol, and make that symbol configurable via 
Kconfig . Users of iMX95-only can turn it off, generic kernel config 
should keep it on.

>>>> or per-module,
>>>
>>> Well, DRM_IMX8_DC(for the imx8_dc_drm module) depends on IMX_SCU just as
>>> this patch does.
>>
>> I assume it shouldn't have to, because the SCU dependency is only relevant
>> for the prefetch engine ?
> 
> The SCU dependency is only relevant for the prefetch engine, agreed.
> But, how to avoid the dependency?

How about containing the SCU parts in a single file and put it behind a 
Kconfig symbol ? The common code can call the SCU parts and they would 
either use SCU (on MX8QXP) or do nothing (on MX95) . It should even be 
possible to discern this at runtime.

>>>> or somehow abstracted out (via regmap?),
>>>
>>> Like I replied to your i.MX95 DC patch series's cover letter, SCU accesses
>>> registers via Cortex-M core instead of Cortex-A core IIUC.  I really don't
>>> know how to abstract IMX_SCU out, especially via regmap.
>>
>> The simplest way would be to use regmap_config .reg_read and .reg_write ,
>> if there is no better way.
> 
> Can you shed more light on this?  Any examples?

I'll just reply to this part, because that is probably the most relevant 
to this whole conversation.

git grep '\.reg_write' drivers -> drivers/hwmon/aspeed-pwm-tacho.c as a 
simple example.

Then such a reg_write implementation can do:

if (SCU)
   use SCU accessor
else
   use writel() or so

>>>> so iMX95 support can be added into the driver easily too ?
>>>
>>> Like I replied to your i.MX95 DC patch series, I think i.MX95 DC support
>>> can be in drivers/gpu/drm/imx/dc, but it should be in a separate module
>>> (something like imx95_dc_drm) plus an additional common module(like
>>> imx_dc_drm_common).
>> This design part is something I do not fully understand. Sure, it can be
>> two modules, but in the end, the result would have to be capable of being
>> compiled into single kernel binary if both modules would be =y in Kconfig
>> anyway.
> 
> This is something like imx8qm_ldb, imx8qxp_ldb and imx_ldb_helper modules -
> DRM_IMX8QM_LDB and DRM_IMX8QXP_LDB select DRM_IMX_LDB_HELPER.
> 
> Note you may make CONFIG_DRM_IMX8QM_LDB=y and CONFIG_DRM_IMX8QXP_LDB=m with
> CONFIG_DRM_IMX_LDB_HELPER=y.
Do we have to make it this complicated right from the start ? Maybe we 
can start simple, with one module, and then split it up if it turns out 
to be unsuitable ?
