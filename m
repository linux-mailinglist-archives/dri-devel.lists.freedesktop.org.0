Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9120F6E8B10
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 09:13:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E93D10EBAD;
	Thu, 20 Apr 2023 07:13:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCA5C10E38E
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 06:30:33 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[127.0.0.1]) by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <j.zink@pengutronix.de>)
 id 1pp1Ki-0001LL-6R; Wed, 19 Apr 2023 08:30:24 +0200
Message-ID: <b4cb0a91-26f9-94d6-4bde-87cfc9ba2a47@pengutronix.de>
Date: Wed, 19 Apr 2023 08:29:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 1/2] dt-bindings: display: simple: support non-default
 data-mapping
To: Rob Herring <robh@kernel.org>
References: <20230414161116.3673911-1-j.zink@pengutronix.de>
 <20230414161116.3673911-2-j.zink@pengutronix.de>
 <20230418212058.GA2351633-robh@kernel.org>
Content-Language: en-US, de-DE
From: Johannes Zink <j.zink@pengutronix.de>
In-Reply-To: <20230418212058.GA2351633-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: j.zink@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
X-Mailman-Approved-At: Thu, 20 Apr 2023 07:12:56 +0000
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
Cc: devicetree@vger.kernel.org, sam@ravnborg.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, thierry.reding@gmail.com,
 krzysztof.kozlowski+dt@linaro.org, kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob,

On 4/18/23 23:20, Rob Herring wrote:
> On Fri, Apr 14, 2023 at 06:11:15PM +0200, Johannes Zink wrote:
>> Some Displays support more than just a single default lvds data mapping,
>> which can be used to run displays on only 3 LVDS lanes in the jeida-18
>> data-mapping mode.
>>
>> Add an optional data-mapping property, analogously to panel-lvds, to
>> allow overriding the default data mapping.
>>
>> Signed-off-by: Johannes Zink <j.zink@pengutronix.de>
>> ---
>>   .../bindings/display/panel/panel-simple.yaml  | 51 +++++++++++++++++++
>>   1 file changed, 51 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
>> index 18241f4051d2..6e219f67dd67 100644
>> --- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
>> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
>> @@ -349,6 +349,57 @@ properties:
>>     power-supply: true
>>     no-hpd: true
>>     hpd-gpios: true
>> +  data-mapping:
>> +    enum:
>> +      - jeida-18
>> +      - jeida-24
>> +      - vesa-24
>> +    description: |
>> +      The color signals mapping order.
>> +
>> +      LVDS data mappings are defined as follows.
>> +
>> +      - "jeida-18" - 18-bit data mapping compatible with the [JEIDA], [LDI] and
>> +        [VESA] specifications. Data are transferred as follows on 3 LVDS lanes.
>> +
>> +      Slot          0       1       2       3       4       5       6
>> +                ________________                         _________________
>> +      Clock                     \_______________________/
>> +                  ______  ______  ______  ______  ______  ______  ______
>> +      DATA0     ><__G0__><__R5__><__R4__><__R3__><__R2__><__R1__><__R0__><
>> +      DATA1     ><__B1__><__B0__><__G5__><__G4__><__G3__><__G2__><__G1__><
>> +      DATA2     ><_CTL2_><_CTL1_><_CTL0_><__B5__><__B4__><__B3__><__B2__><
>> +
>> +      - "jeida-24" - 24-bit data mapping compatible with the [DSIM] and [LDI]
>> +        specifications. Data are transferred as follows on 4 LVDS lanes.
>> +
>> +      Slot          0       1       2       3       4       5       6
>> +                ________________                         _________________
>> +      Clock                     \_______________________/
>> +                  ______  ______  ______  ______  ______  ______  ______
>> +      DATA0     ><__G2__><__R7__><__R6__><__R5__><__R4__><__R3__><__R2__><
>> +      DATA1     ><__B3__><__B2__><__G7__><__G6__><__G5__><__G4__><__G3__><
>> +      DATA2     ><_CTL2_><_CTL1_><_CTL0_><__B7__><__B6__><__B5__><__B4__><
>> +      DATA3     ><_CTL3_><__B1__><__B0__><__G1__><__G0__><__R1__><__R0__><
>> +
>> +      - "vesa-24" - 24-bit data mapping compatible with the [VESA] specification.
>> +        Data are transferred as follows on 4 LVDS lanes.
>> +
>> +      Slot          0       1       2       3       4       5       6
>> +                ________________                         _________________
>> +      Clock                     \_______________________/
>> +                  ______  ______  ______  ______  ______  ______  ______
>> +      DATA0     ><__G0__><__R5__><__R4__><__R3__><__R2__><__R1__><__R0__><
>> +      DATA1     ><__B1__><__B0__><__G5__><__G4__><__G3__><__G2__><__G1__><
>> +      DATA2     ><_CTL2_><_CTL1_><_CTL0_><__B5__><__B4__><__B3__><__B2__><
>> +      DATA3     ><_CTL3_><__B7__><__B6__><__G7__><__G6__><__R7__><__R6__><
>> +
>> +      Control signals are mapped as follows.
>> +
>> +      CTL0: HSync
>> +      CTL1: VSync
>> +      CTL2: Data Enable
>> +      CTL3: 0
> 
> Why do you duplicate what's in display/lvds.yaml?

I don't think any of the other properties from display/lvds.yaml 
currently make any sense to be put into simple-panel, thus I selectively 
picked this one.

If there is a way to selectively pick only the data_mapping, please let 
me know and I send a V2

> 
> This also just made 'data-mapping' valid on non-LVDS panels.

what is the canonical way of restricting the data-mapping property to 
LVDS panels only? Or ist the proper way to go to move the panel I use 
(innolux,g101ice-l01) to its own yaml file, include panel-simple.yaml 
and leave the others alone? I think other LVDS panels might benefit from 
this series though, which is why I think it makes sense to add the 
property to all LVDS panels.

Best regards
Johannes

> 
> Rob
> 

-- 
Pengutronix e.K.                | Johannes Zink                  |
Steuerwalder Str. 21            | https://www.pengutronix.de/    |
31137 Hildesheim, Germany       | Phone: +49-5121-206917-0       |
Amtsgericht Hildesheim, HRA 2686| Fax:   +49-5121-206917-5555    |

