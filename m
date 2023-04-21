Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 524DC6EA44D
	for <lists+dri-devel@lfdr.de>; Fri, 21 Apr 2023 09:07:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4B5E10ED8D;
	Fri, 21 Apr 2023 07:07:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09CD510ED8D
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Apr 2023 07:07:23 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3F41D64E2B;
 Fri, 21 Apr 2023 07:07:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 950C6C433D2;
 Fri, 21 Apr 2023 07:07:17 +0000 (UTC)
Message-ID: <e9bb9952-c2ef-c7a6-a787-aa2597c3ed4e@xs4all.nl>
Date: Fri, 21 Apr 2023 09:07:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/3] dt-bindings: display: synopsys, dw-hdmi: Add property
 for disabling CEC
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>
References: <20230415104613.61224-1-jernej.skrabec@gmail.com>
 <20230415104613.61224-2-jernej.skrabec@gmail.com>
 <20230418214115.GA2376963-robh@kernel.org>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20230418214115.GA2376963-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: linux-arm-kernel@lists.infradead.org, neil.armstrong@linaro.org,
 rfoss@kernel.org, andrzej.hajda@intel.com, samuel@sholland.org,
 jonas@kwiboo.se, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 wens@csie.org, Laurent.pinchart@ideasonboard.com,
 krzysztof.kozlowski+dt@linaro.org, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18/04/2023 23:41, Rob Herring wrote:
> On Sat, Apr 15, 2023 at 12:46:11PM +0200, Jernej Skrabec wrote:
>> Even though some DW-HDMI controllers have perfectly usable HDMI-CEC
>> implementation, some boards might prefer not to use it or even use
>> software implementation instead.
>>
>> Add property for disabling CEC so driver doesn't expose unused CEC
>> interface, if CEC pin isn't connected anywhere.
> 
> Isn't this all true for any bridge supporting CEC? Make this common.

I agree with that, there was a similar case in the past:

https://lore.kernel.org/linux-media/20180323125915.13986-1-hverkuil@xs4all.nl/

I never followed up to that, but I believe this is generic for any HDMI transmitter
or receiver with built-in CEC support where the CEC line is not actually hooked
up to the HDMI pin.

There is no way for the CEC driver to detect that, so this has to be communicated
in the device tree.

For standalone CEC devices you can just disable them in the device tree, of course,
but if it is incorporated into the HDMI device itself, then it needs to be told.

Regards,

	Hans

> 
>>
>> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
>> ---
>>  .../devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml b/Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml
>> index 4b7e54a8f037..624d32c024f6 100644
>> --- a/Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml
>> +++ b/Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml
>> @@ -48,6 +48,11 @@ properties:
>>    interrupts:
>>      maxItems: 1
>>  
>> +  snps,disable-cec:
>> +    $ref: /schemas/types.yaml#/definitions/flag
>> +    description:
>> +      Disable HDMI-CEC.
>> +
>>  additionalProperties: true
>>  
>>  ...
>> -- 
>> 2.40.0
>>

