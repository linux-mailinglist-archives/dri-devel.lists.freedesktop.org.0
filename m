Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3149AC5134
	for <lists+dri-devel@lfdr.de>; Tue, 27 May 2025 16:46:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1659A10E42A;
	Tue, 27 May 2025 14:46:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="BNwJwpQl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com
 [95.215.58.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA63D10E42A
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 14:46:34 +0000 (UTC)
Message-ID: <fc77a1e2-be50-43b1-9863-f8ca70445428@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1748357190;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ik2RLMnsfWwLYke1BTsOZXwbZAxm0Sryd75+X2yF3Rs=;
 b=BNwJwpQlZxDUBnE9qtHM+Hg9qM/nS4N7/TdRps1gfAhHWGXfyqe4ImWQRshStisyPcniHx
 iS0HExzaiEczPvIBf4P8LD6GU7XvRhmM61/TYR30V3dlILRWpsrVWDLWgLT+UKev1LH+oY
 zemSODHL0YUdaTbGE26aW94lJPdsqsU=
Date: Tue, 27 May 2025 20:15:29 +0530
MIME-Version: 1.0
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Aradhya Bhatia <aradhya.bhatia@linux.dev>
Subject: Re: [PATCH v8 4/4] drm/tidss: Add OLDI bridge support
To: Michael Walle <mwalle@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Jyri Sarha <jyri.sarha@iki.fi>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
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
Content-Language: en-US
In-Reply-To: <DA6PRDARLY70.1CILNJ8YLIOA1@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 27/05/25 11:32, Michael Walle wrote:
> Hi Aradhya,
> 
> On Mon May 26, 2025 at 4:17 PM CEST, Aradhya Bhatia wrote:
>> Thank you for reviewing and testing the patches! =)
> 
> Thank you for your dedication to bring this feature upstream :)
> 
>> On 26/05/25 15:05, Michael Walle wrote:
>>>
>>>> +static int get_oldi_mode(struct device_node *oldi_tx, int *companion_instance)
>>>> +{
>>>> +	struct device_node *companion;
>>>> +	struct device_node *port0, *port1;
>>>> +	u32 companion_reg;
>>>> +	bool secondary_oldi = false;
>>>> +	int pixel_order;
>>>> +
>>>> +	/*
>>>> +	 * Find if the OLDI is paired with another OLDI for combined OLDI
>>>> +	 * operation (dual-link or clone).
>>>> +	 */
>>>> +	companion = of_parse_phandle(oldi_tx, "ti,companion-oldi", 0);
>>>> +	if (!companion)
>>>> +		/*
>>>> +		 * The OLDI TX does not have a companion, nor is it a
>>>> +		 * secondary OLDI. It will operate independently.
>>>> +		 */
>>>> +		return OLDI_MODE_SINGLE_LINK;
>>>
>>> How is this supposed to work? If I read this code correctly, the
>>> second (companion) port is always reported as SINGLE_LINK if its
>>> device tree node doesn't have a ti,companion-oldi property. But
>>> reading the device tree binding, the companion-old property is only
>>> for the first OLDI port.
>>
>> With this series, the dt-schema for oldi changes a bit as well. Both the
>> OLDIs, primary or secondary, need to pass each other's phandles now.
>> The "ti,companion-oldi" and "ti,secondary-oldi" properties are not
>> mutually exclusive anymore.
> 
> Ok, I thought so. But then you'll have to update the binding doc and
> example (Patch 2/3) ;)
> 

Ah, that's right. The example wasn't updated there. Thank you! =)

>> Something like this.
>>
>> &oldi0 {
>> 	// primary oldi
>> 	ti,companion-oldi = <&oldi1>;
>> };
>>
>>
>> &oldi1 {
>> 	// secondary oldi
>> 	ti,secondary-oldi = true;
>> 	ti,companion-oldi = <&oldi0>;
>> };
>>
>>
>> If there is no companion for any OLDI dt node, then the OLDI TX will be
>> deemed as acting by itself, and in a single-link mode.
> 
> And it's possible to still have these properties and treat them as
> two distinct transmitters? I'm wondering if it's possible to have
> the companion-oldi and secondary-oldi property inside the generic
> SoC dtsi, so you don't have to repeat it in every board dts.
> 
> If I read the code correctly, the panel has to have the even and odd
> pixel properties to be detected as dual-link. Correct? Thus it would
> be possible to have
> 
> oldi0: oldi@0 {
>  	ti,companion-oldi = <&oldi1>;
> };
> 
> oldi1: oldi@1 {
>  	ti,secondary-oldi;
>  	ti,companion-oldi = <&oldi0>;
> };
> 
> in the soc.dtsi and in a board dts:
> 
> panel {
> 	port {
> 		remote-endpoint = <&oldi0>;
> 	};
> };

In this case, the secondary OLDI (oldi1) would remain disabled from
soc.dtsi.

I gave this a quick try. Turns out, of_parse_phandle() is not able to
return an error when primary OLDI tries to find a companion -- which is
important for the driver to detect an absence of any secondary OLDI.

Since the driver code registers a companion for primary OLDI, and
further does not find the "dual-lvds-{odd,even}-pixels" properties,
the driver ends up trying for a Clone Mode.

So, for single-link , we'd have to actively delete the "companion-oldi"
property, in the board.dts/panel.dtso.


But, say, the disabled-node's phandle parse is circumvented, somehow,
and we don't need to delete the property explicitly.

There would still be one concern, I am afraid.

In AM67A DSS (future scope at the moment), the 2 OLDIs can act
independently. Like a 2x Independent Single-Link. Both the OLDI dt nodes
will be enabled.

So, if the soc.dtsi has them already connected, then the
board.dts/panel.dtso would still need to explicitly delete those
properties to get the 2 OLDI TXes to work independently.

-- 
Regards
Aradhya


> 
> Or with a dual link panel:
> 
> dualpanel {
> 	ports {
> 		port@0 {
> 			dual-lvds-odd-pixels;
> 			remote-endpoint = <&oldi0>;
> 		};
> 
> 		port@1 {
> 			dual-lvds-even-pixels;
> 			remote-endpoint = <&oldi1>;
> 		};
> 	};
> };
> 
>>>
>>> FWIW, I've tested this series and I get twice the clock rate as
>>> expected and the second link is reported as "OLDI_MODE_SINGLE_LINK".
>>> I'll dig deeper into this tomorrow.
>>>
>>
>> I was able to reproduce this behavior as you mention when the second
>> oldi dt does not have a companion-oldi property.
>>
>> However, upon analysis, I realize that even having the correct dt as I
>> mention above, will fall into another bug in the code and fail during
>> the OLDI init.
>>
>> Unfortunately, two wrongs in my setup yesterday caused my testing to
>> pass!
>>
>> I will post another revision, if you want to hold out on debugging
>> further!
> 
> Sure!
> 
> -michael

