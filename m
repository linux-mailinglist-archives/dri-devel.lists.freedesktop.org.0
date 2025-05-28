Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABEECAC68C2
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 14:02:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C91FA10E59B;
	Wed, 28 May 2025 12:02:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="TnmPfyrV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 313 seconds by postgrey-1.36 at gabe;
 Wed, 28 May 2025 12:02:50 UTC
Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com
 [91.218.175.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38CE410E1D2
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 12:02:50 +0000 (UTC)
Message-ID: <7313e3a4-24bf-42be-901d-e85eb260cc0f@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1748433448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zpupw+BL22wW70OO3ldtdTEci1KOss4N595RFWiCJy4=;
 b=TnmPfyrVIF0NjlC3AUNCJnSsxqqxgtgCTwUF7OW7oLZki32QTawdrmELLquh2uVwlAcBPj
 bDIz68KGKSnuyOAYV7kBX5p3DOA6xCVsY98lTTVYaIEG7I2cAHp6gNBRnFS5mVggr4CQJd
 XfiELFUSiUJizHXpFXqV5xZuVBvxcU4=
Date: Wed, 28 May 2025 17:26:35 +0530
MIME-Version: 1.0
Subject: Re: [PATCH v8 4/4] drm/tidss: Add OLDI bridge support
To: Michael Walle <mwalle@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Jyri Sarha <jyri.sarha@iki.fi>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Simona Vetter <simona@ffwll.ch>, Nishanth Menon <nm@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 Praneeth Bajjuri <praneeth@ti.com>, Udit Kumar <u-kumar1@ti.com>,
 Jayesh Choudhary <j-choudhary@ti.com>,
 Francesco Dolcini <francesco@dolcini.it>,
 Alexander Sverdlin <alexander.sverdlin@siemens.com>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Devicetree List <devicetree@vger.kernel.org>,
 Linux Kernel List <linux-kernel@vger.kernel.org>
References: <20250525151721.567042-1-aradhya.bhatia@linux.dev>
 <20250525151721.567042-5-aradhya.bhatia@linux.dev>
 <DA5ZNDCHXC6M.1CDYDG6KKMAP0@kernel.org>
 <a98ad2e7-50de-4d04-8d99-2cf77354b1d6@linux.dev>
 <DA6PRDARLY70.1CILNJ8YLIOA1@kernel.org>
 <fc77a1e2-be50-43b1-9863-f8ca70445428@linux.dev>
 <fc5f6000fbe1f01223f8a28a952b40ea@kernel.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Aradhya Bhatia <aradhya.bhatia@linux.dev>
In-Reply-To: <fc5f6000fbe1f01223f8a28a952b40ea@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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

Hi Michael,

On 28/05/25 13:57, Michael Walle wrote:
> Hi Aradhya,
> 
>>>> Something like this.
>>>>
>>>> &oldi0 {
>>>>     // primary oldi
>>>>     ti,companion-oldi = <&oldi1>;
>>>> };
>>>>
>>>>
>>>> &oldi1 {
>>>>     // secondary oldi
>>>>     ti,secondary-oldi = true;
>>>>     ti,companion-oldi = <&oldi0>;
>>>> };
>>>>
>>>>
>>>> If there is no companion for any OLDI dt node, then the OLDI TX will be
>>>> deemed as acting by itself, and in a single-link mode.
>>>
>>> And it's possible to still have these properties and treat them as
>>> two distinct transmitters? I'm wondering if it's possible to have
>>> the companion-oldi and secondary-oldi property inside the generic
>>> SoC dtsi, so you don't have to repeat it in every board dts.
>>>
>>> If I read the code correctly, the panel has to have the even and odd
>>> pixel properties to be detected as dual-link. Correct? Thus it would
>>> be possible to have
>>>
>>> oldi0: oldi@0 {
>>>      ti,companion-oldi = <&oldi1>;
>>> };
>>>
>>> oldi1: oldi@1 {
>>>      ti,secondary-oldi;
>>>      ti,companion-oldi = <&oldi0>;
>>> };
>>>
>>> in the soc.dtsi and in a board dts:
>>>
>>> panel {
>>>     port {
>>>         remote-endpoint = <&oldi0>;
>>>     };
>>> };
>>
>> In this case, the secondary OLDI (oldi1) would remain disabled from
>> soc.dtsi.
>>
>> I gave this a quick try. Turns out, of_parse_phandle() is not able to
>> return an error when primary OLDI tries to find a companion -- which is
>> important for the driver to detect an absence of any secondary OLDI.
>>
>> Since the driver code registers a companion for primary OLDI, and
>> further does not find the "dual-lvds-{odd,even}-pixels" properties,
>> the driver ends up trying for a Clone Mode.
>>
>> So, for single-link , we'd have to actively delete the "companion-oldi"
>> property, in the board.dts/panel.dtso.
> 
> Last time I've checked you cannot delete nodes or properties in DT
> overlays. So maybe it's better to make that a board property and don't
> set it by default in the soc dtsi.

I was not aware that deleting properties was not allowed/possible. So,
yes, seems like they are better left out of the soc.dtsi! =)

> 
>> But, say, the disabled-node's phandle parse is circumvented, somehow,
>> and we don't need to delete the property explicitly.
>>
>> There would still be one concern, I am afraid.
>>
>> In AM67A DSS (future scope at the moment), the 2 OLDIs can act
>> independently. Like a 2x Independent Single-Link. Both the OLDI dt nodes
>> will be enabled.
> 
> The first DSS0 can drive two single link displays? Reading your downstream
> AM67A DSS patches, thats not particular clear:

Not the DSS0 alone. DSS0 and DSS1 can each drive a single link OLDI
display simultaneously.

> 
>     The DSS0 HW supports one each of video pipeline (vid) and video-lite
>     pipeline (vidl1). It outputs OLDI signals on one video port (vp1) and
>     DPI signals on another (vp2). The video ports are connected to the
>     pipelines via 2 identical overlay managers (ovr1 and ovr2).
> 
> The TRM also doesn't tell much (or I just didn't find it yet).
> 
>> So, if the soc.dtsi has them already connected, then the
>> board.dts/panel.dtso would still need to explicitly delete those
>> properties to get the 2 OLDI TXes to work independently.
> 
> Yeah looks like that should really be a board property.
> 
> -michael

-- 
Regards
Aradhya

