Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD50A42E17
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 21:40:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAC2310E4AD;
	Mon, 24 Feb 2025 20:40:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="vitKRRCT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BAC610E4AD
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 20:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
 t=1740429624; bh=YCBdJbUx0eezkgiS7e5oa20MNmUQMvngyjUjEqpjLTM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=vitKRRCT0FDO+MFCpM+oNGOuuzlj4/oKKiebkE8stMHaxMzf27bAxxqur33AcvwDI
 jc8GJxIppGPasCEOD/Poo5P0RmXlMxZ+GB2EMrSDEOeG41CiydyeaUxipL0012T3rz
 hweWP6i1Qg6AYnNs2JH26YtOcVVIXuoO1tAnzHtQ=
Message-ID: <8b67cea3-82f7-47f8-b026-fd26cfbf94b4@lucaweiss.eu>
Date: Mon, 24 Feb 2025 21:40:23 +0100
MIME-Version: 1.0
Subject: Re: [PATCH 2/4] dt-bindings: display: panel: Add Himax HX83112B
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20250222-fp3-display-v1-0-ccd812e16952@lucaweiss.eu>
 <20250222-fp3-display-v1-2-ccd812e16952@lucaweiss.eu>
 <77wat26ggsfqwssgt5wfq6yz6w3ccqz3pmn727a4aphqv4ljhx@vrzneg2rvzfj>
Content-Language: en-US
From: Luca Weiss <luca@lucaweiss.eu>
In-Reply-To: <77wat26ggsfqwssgt5wfq6yz6w3ccqz3pmn727a4aphqv4ljhx@vrzneg2rvzfj>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23-02-2025 7:25 p.m., Dmitry Baryshkov wrote:
> On Sat, Feb 22, 2025 at 06:58:05PM +0100, Luca Weiss wrote:
>> Himax HX83112B is a display driver IC used to drive LCD DSI panels.
>> Describe it and the Fairphone 3 panel from DJN using it.
>>
>> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
>> ---
>>   .../bindings/display/panel/himax,hx83112b.yaml     | 75 ++++++++++++++++++++++
>>   1 file changed, 75 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/panel/himax,hx83112b.yaml b/Documentation/devicetree/bindings/display/panel/himax,hx83112b.yaml
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..e6bd4b33d40be98e479d84617aea6d2af0df70e4
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/panel/himax,hx83112b.yaml
>> @@ -0,0 +1,75 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/panel/himax,hx83112b.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Himax HX83112B-based DSI display panels
>> +
>> +maintainers:
>> +  - Luca Weiss <luca@lucaweiss.eu>
>> +
>> +description:
>> +  The Himax HX83112B is a generic DSI Panel IC used to control
>> +  LCD panels.
>> +
>> +allOf:
>> +  - $ref: panel-common.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    contains:
>> +      const: djn,fairphone-fp3-panel
> 
> Would you know a better name or ID for a panel?

Initially no, as mentioned on the cover letter.

But I dug a bit more in some other documents and found this number now: 
"98-03057-6598B-I"

This also somewhat matches the format of the Fairphone 4 panel from DJN: 
("djn,9a-3r063-1102b").

So I'll change the compatible to "djn,98-03057-6598b-i" in the next 
revision.

Regards
Luca

> 
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  iovcc-supply:
>> +    description: I/O voltage rail
>> +
>> +  vsn-supply:
>> +    description: Positive source voltage rail
>> +
>> +  vsp-supply:
>> +    description: Negative source voltage rail
>> +
>> +  port: true
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - reset-gpios
>> +  - iovcc-supply
>> +  - vsn-supply
>> +  - vsp-supply
>> +  - port
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/gpio/gpio.h>
>> +
>> +    dsi {
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        panel@0 {
>> +            compatible = "djn,fairphone-fp3-panel";
>> +            reg = <0>;
>> +
>> +            reset-gpios = <&tlmm 61 GPIO_ACTIVE_LOW>;
>> +
>> +            iovcc-supply = <&pm8953_l6>;
>> +            vsn-supply = <&pmi632_lcdb_ncp>;
>> +            vsp-supply = <&pmi632_lcdb_ldo>;
>> +
>> +            port {
>> +                panel_in_0: endpoint {
>> +                    remote-endpoint = <&dsi0_out>;
>> +                };
>> +            };
>> +        };
>> +    };
>> +
>> +...
>>
>> -- 
>> 2.48.1
>>
> 

