Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0D18A44F4
	for <lists+dri-devel@lfdr.de>; Sun, 14 Apr 2024 21:39:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32935112335;
	Sun, 14 Apr 2024 19:39:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=kwiboo.se header.i=@kwiboo.se header.b="Jj3dw/SS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [167.172.40.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94853112335
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Apr 2024 19:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1713123551;
 bh=o6KhYcJny4LUz13HWMoNmuFaXLpJ75r6XYs3Wyyjsn0=;
 b=Jj3dw/SS1uWBYWnKC2+iIwomidObAw4zcDmASNvZGT1l8nULx7feXRQ0klobgeTI/gSH0w9X7
 TA097UQzP/TBcuwyPetojxBqEWBwauINCZaJr80Y+jrzmYids+UzJmLgELJlVx0qYreV5W4Dr9u
 At0a3xUMeCMxvDas80pPjBIGETXXqv8glxGjndisIB3giV05BykwwwgYc8ROubiEJdJJt36mC/O
 GiHNAUn4njlfisHG3S76NgRLcTXWzZv0H6K71U22aD8LJQCIGNQoiWQhvBxOL0Y4sJkGMhGJmf3
 NBiTDhKvOYXv/KFVAg/FI+tIA7cytFa8Uxa9CzaeSzuw==
Message-ID: <ef4b9abc-6796-40bf-98f9-a12f007ed846@kwiboo.se>
Date: Sun, 14 Apr 2024 20:53:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] dt-bindings: display: rockchip,dw-hdmi: Fix
 sound-dai-cells warning
To: Johan Jonker <jbx6244@yandex.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Sandy Huang <hjc@rock-chips.com>, Andy Yan
 <andy.yan@rock-chips.com>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann
 <tzimmermann@suse.de>, Mark Yao <markyao0591@gmail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20240414151135.1774981-1-jonas@kwiboo.se>
 <20240414151135.1774981-4-jonas@kwiboo.se>
 <0facfa2a-bff7-4cf1-b43a-349bba2f2342@yandex.com>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <0facfa2a-bff7-4cf1-b43a-349bba2f2342@yandex.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Report-Abuse-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-ForwardEmail-Version: 0.4.40
X-ForwardEmail-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 167.172.40.54
X-ForwardEmail-ID: 661c2644309b3fe15baf7834
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

On 2024-04-14 20:41, Johan Jonker wrote:
> On 4/14/24 17:11, Jonas Karlman wrote:
>> The rockchip,dw-hdmi node can be used as a sound dai codec, however,
>> dtbs_check may report the following issue:
>>
>>   hdmi@fe0a0000: Unevaluated properties are not allowed ('#sound-dai-cells' was unexpected)
>>   from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-hdmi.yaml#
>>
>> Add a reference to dai-common.yaml and add the #sound-dai-cells prop to
>> resolve this warning.
>>
>> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
>> ---
> 
>> v2: New patch to fix #sound-dai-cells warning
> 
> Hi,
> 
> You are #4 that does an attempt on this subject.
> Coincidence with my patches??
> If other notifications could be fixed with the same amount of interest?
> Please be welcome to pick some other random Rockchip related ones.

Hehe, I should have looked deeper at what existing patches was out there.

Will send a v3 without this patch and instead reference your patch.

Regards,
Jonas

> 
> Johan
> 
> ===
> 
> [PATCH v1 1/3] dt-bindings: display: add #sound-dai-cells property to rockchip dw hdmi
> https://lore.kernel.org/linux-rockchip/3a035c16-75b5-471d-aa9d-e91c2bb9f8d0@gmail.com/
> 
> [PATCH] dt-bindings: display: rockchip: add missing #sound-dai-cells to dw-hdmi
> https://lore.kernel.org/linux-rockchip/20240326172801.1163200-1-heiko@sntech.de/
> 
> [PATCH 6/6] dt-bindings: display: rockchip: dw-hdmi: Add missing sound-dai-cells property
> https://lore.kernel.org/linux-rockchip/20231222-pinetab2-v1-6-e148a7f61bd1@mecka.net/
> 
>> ---
>>  .../bindings/display/rockchip/rockchip,dw-hdmi.yaml           | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml
>> index af638b6c0d21..3285fff54416 100644
>> --- a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml
>> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml
>> @@ -15,6 +15,7 @@ description: |
>>  
>>  allOf:
>>    - $ref: ../bridge/synopsys,dw-hdmi.yaml#
>> +  - $ref: /schemas/sound/dai-common.yaml#
>>  
>>  properties:
>>    compatible:
>> @@ -124,6 +125,9 @@ properties:
>>      description:
>>        phandle to the GRF to mux vopl/vopb.
>>  
>> +  "#sound-dai-cells":
>> +    const: 0
>> +
>>  required:
>>    - compatible
>>    - reg

