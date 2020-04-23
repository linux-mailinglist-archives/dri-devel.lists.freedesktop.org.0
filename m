Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA93F1B5AC8
	for <lists+dri-devel@lfdr.de>; Thu, 23 Apr 2020 13:51:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A50906E423;
	Thu, 23 Apr 2020 11:51:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CC716E423
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Apr 2020 11:51:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: aratiu) with ESMTPSA id C503C2A23DA
From: Adrian Ratiu <adrian.ratiu@collabora.com>
To: Angelo Ribeiro <Angelo.Ribeiro@synopsys.com>, Adrian Ratiu
 <adrian.ratiu@collabora.com>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>
Subject: RE: [PATCH v4] dt-bindings: display: dw_mipi_dsi.txt: convert to yaml
In-Reply-To: <MN2PR12MB378964868D3C1241FC649100CBD30@MN2PR12MB3789.namprd12.prod.outlook.com>
References: <20200423100058.1734009-1-adrian.ratiu@collabora.com>
 <MN2PR12MB378964868D3C1241FC649100CBD30@MN2PR12MB3789.namprd12.prod.outlook.com>
Date: Thu, 23 Apr 2020 14:52:14 +0300
Message-ID: <87wo66ifm9.fsf@collabora.com>
MIME-Version: 1.0
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
Cc: "kernel@collabora.com" <kernel@collabora.com>,
 Philippe CORNU <philippe.cornu@st.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Angelo,

On Thu, 23 Apr 2020, Angelo Ribeiro <Angelo.Ribeiro@synopsys.com> 
wrote:
> Hi Adrian, 
> 
> From: Adrian Ratiu <adrian.ratiu@collabora.com> Date: Thu, Apr 
> 23, 2020 at 11:00:58 
> 
>> This converts the Synopsis MIPI DSI binding documentation to 
>> yaml and should be quite straightforward. I've added a missing 
>> ref clk and also added Philippe as maintainer b/c he's the 
>> original txt author following the algorithm provided in 
>> Message-ID 20200420175909.GA5810@ravnborg.org.   Cc: Philippe 
>> CORNU <philippe.cornu@st.com> Cc: devicetree@vger.kernel.org 
>> Suggested-by: Laurent Pinchart 
>> <laurent.pinchart@ideasonboard.com> Reviewed-by: Rob Herring 
>> <robh@kernel.org> Signed-off-by: Adrian Ratiu 
>> <adrian.ratiu@collabora.com> --- Changes in v4: 
>>   - Dropped panel patternProperties (Rob) 
>>  Changes in v3: 
>>   - Added ports property and its children which are required 
>>   (Laurent) - Sorted required list alphabetically 
>>  Changes in v2: 
>>   - Removed unnecessary descriptions and maxItems (Rob) - 
>>   Changed maintainers entry / dropped Mark (Rob) - Added 
>>   dsi-controller.yaml ref (Rob) 
>> --- 
>>  .../bindings/display/bridge/dw_mipi_dsi.txt   | 32 --------- 
>>  .../display/bridge/snps,dw-mipi-dsi.yaml      | 68 
>>  +++++++++++++++++++ 2 files changed, 68 insertions(+), 32 
>>  deletions(-) delete mode 100644 
>>  Documentation/devicetree/bindings/display/bridge/dw_mipi_dsi.txt 
>>  create mode 100644 
>>  Documentation/devicetree/bindings/display/bridge/snps,dw-mipi-dsi.yaml 
>>  diff --git 
>> a/Documentation/devicetree/bindings/display/bridge/dw_mipi_dsi.txt 
>> b/Documentation/devicetree/bindings/display/bridge/dw_mipi_dsi.txt 
>> deleted file mode 100644 index b13adf30b8d3b..0000000000000 --- 
>> a/Documentation/devicetree/bindings/display/bridge/dw_mipi_dsi.txt 
>> +++ /dev/null @@ -1,32 +0,0 @@ -Synopsys DesignWare MIPI DSI 
>> host controller -============================================ - 
>> -This document defines device tree properties for the Synopsys 
>> DesignWare MIPI -DSI host controller. It doesn't constitue a 
>> device tree binding specification -by itself but is meant to be 
>> referenced by platform-specific device tree -bindings.  - -When 
>> referenced from platform device tree bindings the properties 
>> defined in -this document are defined as follows. The platform 
>> device tree bindings are -responsible for defining whether each 
>> optional property is used or not.  - -- reg: Memory mapped base 
>> address and length of the DesignWare MIPI DSI -  host 
>> controller registers. (mandatory) - -- clocks: References to 
>> all the clocks specified in the clock-names property -  as 
>> specified in [1]. (mandatory) - -- clock-names: -  - "pclk" is 
>> the peripheral clock for either AHB and APB. (mandatory) -  - 
>> "px_clk" is the pixel clock for the DPI/RGB input. (optional) - 
>> -- resets: References to all the resets specified in the 
>> reset-names property -  as specified in [2]. (optional) - -- 
>> reset-names: string reset name, must be "apb" if 
>> used. (optional) - -- panel or bridge node: see 
>> [3]. (mandatory) - -[1] 
>> Documentation/devicetree/bindings/clock/clock-bindings.txt -[2] 
>> Documentation/devicetree/bindings/reset/reset.txt -[3] 
>> Documentation/devicetree/bindings/display/mipi-dsi-bus.txt diff 
>> --git 
>> a/Documentation/devicetree/bindings/display/bridge/snps,dw-mipi-dsi.yaml 
>> b/Documentation/devicetree/bindings/display/bridge/snps,dw-mipi-dsi.yaml 
>> new file mode 100644 index 0000000000000..012aa8e7cb8cd --- 
>> /dev/null +++ 
>> b/Documentation/devicetree/bindings/display/bridge/snps,dw-mipi-dsi.yaml 
>> @@ -0,0 +1,68 @@ +# SPDX-License-Identifier: (GPL-2.0-only OR 
>> BSD-2-Clause) +%YAML 1.2 +--- +$id: 
>> https://urldefense.com/v3/__http://devicetree.org/schemas/display/bridge/snps,dw-mipi-dsi.yaml*__;Iw!!A4F2R9G_pg!Pn0TP0h4QkEcILgH_xBqMjSM4dJxlyU3iCvF4FSbmdQOSIV309ngWu8EKCpP901d$ 
>> +$schema: 
>> https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core.yaml*__;Iw!!A4F2R9G_pg!Pn0TP0h4QkEcILgH_xBqMjSM4dJxlyU3iCvF4FSbmdQOSIV309ngWu8EKPfhyNgW$ 
>> + +title: Synopsys DesignWare MIPI DSI host controller + 
>> +maintainers: +  - Philippe CORNU <philippe.cornu@st.com> + 
>> +description: | +  This document defines device tree properties 
>> for the Synopsys DesignWare MIPI +  DSI host controller. It 
>> doesn't constitue a device tree binding specification +  by 
>> itself but is meant to be referenced by platform-specific 
>> device tree +  bindings.  + +  When referenced from platform 
>> device tree bindings the properties defined in +  this document 
>> are defined as follows. The platform device tree bindings are + 
>> responsible for defining whether each property is required or 
>> optional.  + +allOf: +  - $ref: ../dsi-controller.yaml# + 
>> +properties: +  reg: +    maxItems: 1 + +  clocks: +    items: 
>> +      - description: Module clock +      - description: DSI 
>> bus clock for either AHB and APB +      - description: Pixel 
>> clock for the DPI/RGB input +    minItems: 2 + +  clock-names: 
>> +    items: +      - const: ref +      - const: pclk +      - 
>> const: px_clk +    minItems: 2 + +  resets: +    maxItems: 1 + 
>> +  reset-names: +    const: apb + +  ports: +    type: object + 
>> +    properties: +      port@0: +        type: object + 
>> description: Input node to receive pixel data.  +      port@1: 
>> +        type: object +        description: DSI output node to 
>> panel.  + +    required: +      - port@0 +      - port@1 + 
>> +required: +  - clock-names +  - clocks +  - ports +  - reg 
> 
> Shouldn't the reset and reset-names be stated as required?  From 
> what I understand the driver will return if the reset is not 
> available. 
>

I think the answer is no and is confirmed by other driver bindings 
(eg. st,stm-32-dsi.yaml) which define the apb reset but don't 
strictly require it.

I also did some runtime testing on my imx6dl board and even though 
the code in the dw_mipi_dsi.c bridge probe() is a bit confusing it 
doesn't strictly require the reset because IS_ERR(apb_rst) is 
FALSE when apb_rst is NULL, so everything works as expected 
without errors.

>> -- 
>> 2.26.0
>> 
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://urldefense.com/v3/__https://lists.freedesktop.org/mailman/listinfo/dri-devel__;!!A4F2R9G_pg!Pn0TP0h4QkEcILgH_xBqMjSM4dJxlyU3iCvF4FSbmdQOSIV309ngWu8EKDNeA2R5$ 
>
> Thanks,
> Angelo
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
