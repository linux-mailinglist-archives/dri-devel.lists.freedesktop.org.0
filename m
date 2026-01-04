Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A65B0CF159E
	for <lists+dri-devel@lfdr.de>; Sun, 04 Jan 2026 22:40:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00A2910E291;
	Sun,  4 Jan 2026 21:40:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="Msu6Gk2u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A95B10E291
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Jan 2026 21:40:23 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4dkrSg0v8tz9ssn;
 Sun,  4 Jan 2026 22:40:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1767562819;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gcJ4qySzjY0KVAwHFonFKf4MTj/0gwZsfwoy4TTth9c=;
 b=Msu6Gk2uRTh5Wq0JBpm6P79Un8o0EIiWk7gZyzhdv1eu7gjtktlm0JfFbc5Mru1GIjkcfm
 MSuBQ/6/odPVQ5sR9YsFCVD7dv+F5jq5STFexwJX3ae2hwQmh4J9bcEnJXf43Ak5KOuH5e
 CoJ5u5JHO6Nju1m8shUA/9tD/0WskxcnsFyMzo7B71D83LSFLg+bUlKBB02HfQm8JnzCZy
 sc7BoxXDNU806d5wxTCkSgWK6t4IQ5hEakURlxbah3WuTOzjSltSV26Z4zCeW9/2KABVUD
 FklBU0Nhat3neYUY6xLBuqDIUop6f8E/q3PIxutPe30bgGl67nbHIut9AA9yyg==
Message-ID: <e4504a0b-65af-4749-8702-7b51dc933059@mailbox.org>
Date: Sun, 4 Jan 2026 22:09:18 +0100
MIME-Version: 1.0
Subject: Re: [PATCH] drm/bridge: fsl-ldb: Parse register offsets from DT
To: Liu Ying <victor.liu@nxp.com>, dri-devel@lists.freedesktop.org
Cc: Abel Vesa <abelvesa@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lucas Stach <l.stach@pengutronix.de>, Peng Fan <peng.fan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
References: <20251017154029.105099-1-marek.vasut@mailbox.org>
 <dc4b1b65-542f-4bd2-bd91-af3fe4223b63@nxp.com>
 <55d44163-4f37-462f-b860-c862cb5ada5a@mailbox.org>
 <b65d9221-bdb3-4e69-beed-6b7646c5d5eb@nxp.com>
 <3064e20f-92c8-4e3b-82bc-ef949f312826@mailbox.org>
 <ac21053f-21d9-4844-9049-09deb3708a6d@nxp.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <ac21053f-21d9-4844-9049-09deb3708a6d@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 4ef6ba8cb8fdf258150
X-MBO-RS-META: 376wawhc1tkcnnz9scobhr58t5iu3ewg
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

On 11/4/25 6:25 AM, Liu Ying wrote:

Hello Liu,

sorry for my late reply.

>>>>>> +++ b/drivers/gpu/drm/bridge/fsl-ldb.c
>>>>>> @@ -61,24 +61,16 @@ enum fsl_ldb_devtype {
>>>>>>     };
>>>>>>       struct fsl_ldb_devdata {
>>>>>> -    u32 ldb_ctrl;
>>>>>> -    u32 lvds_ctrl;
>>>>>>         bool lvds_en_bit;
>>>>>>         bool single_ctrl_reg;
>>>>>
>>>>> single_ctrl_reg can be dropped then, as it can be expressed by failing to
>>>>> get the second register.
>>>>>
>>>>> Furthermore, with this done, lvds_en_bit is the only member left and hence
>>>>> struct fsl_ldb_devdata can also be dropped, as IIRC there is no need to
>>>>> use a structure for device data with only a flag.
>>>> I plan to add more bits into the driver match data when adding the MX95,
>>>> so I would like to retain these instead of removing them and the adding
>>>> them back.
>>>
>>> i.MX95 LDB supports two LVDS channels.  Two DRM bridges are needed in single
>>> or separate LDB mode, while one DRM bridge is needed in split LDB mode.
>>
>> What do you refer to by "split LDB mode" , some interleaving or some such
>> thing ?
> 
> I mean "Split Channel DI0" and "Split Channel DI1" use cases in the below
> table in i.MX95 TRM.
> 
> +------------------------------------------------------------+
> |Table: Channel Mapping                                      |
> |------------------------------------------------------------|
> |Use Case           |  LVDS Channel 0   |  LVDS Channel 1    |
> |------------------------------------------------------------|
> |Single Channel DI0 | DI0               | Disabled           |
> |------------------------------------------------------------|
> |Single Channel DI1 | Disabled          | DI1                |
> |------------------------------------------------------------|
> |Separate Channels  | DI0               | DI1                |
> |------------------------------------------------------------|
> |Dual Channels DI0  | DI0               | DI0                |
> |------------------------------------------------------------|
> |Dual Channels DI1  | DI1               | DI1                |
> |------------------------------------------------------------|
> |Split Channel DI0  | DI0 (first pixel) | DI0 (second pixel) |
> |------------------------------------------------------------|
> |Split Channel DI1  | DI1 (first pixel) | DI1 (second pixel) |
> +------------------------------------------------------------+
So yes, split mode is effectively interleaving. But that should only be 
a matter of syscon configuration.
