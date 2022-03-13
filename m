Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A40224D7713
	for <lists+dri-devel@lfdr.de>; Sun, 13 Mar 2022 18:09:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC96789DBA;
	Sun, 13 Mar 2022 17:09:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5C6E89DBA
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Mar 2022 17:09:52 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id C421281433;
 Sun, 13 Mar 2022 18:09:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1647191390;
 bh=JEIG/kelGQ3mPInvz+bCzQvT2mHQi64/NJOWNYBY+BU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=tjWV1pKrQVcJnPVWHanUOfzPPDqIrbK4+FgozXeddYXC/jl+z97C2VfPESVfZ/KY9
 +wVlR6lLmz2F0hMPGU+kCTz0Ea86HwMVI4iy8jJoONSsuaFGy0xIZyuZkvB6zIMrnZ
 p19OL6C7fxmTZ+/T/lxCf1wgvH6sJ6+raYSbjoFEe+Cx8+B5idh/0vuiFqjbmOtN6w
 HF3+1W3EI8cyK5R17FXh6U2cBWeW2I1druZ+raKbycGJXGbFzUtB4vuAKnaDLRYZ1q
 ev3ZGfvi91DnNv0L5WHRswaTns791VWgb2GfQgQ1qceLrYC3/eKwNP+orYN/0etFDj
 DId3lVtNhAwAg==
Message-ID: <a8a0278c-92f0-bd9c-927f-b8ee729251af@denx.de>
Date: Sun, 13 Mar 2022 18:09:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH 1/2] dt-bindings: display: bridge: ldb: Implement simple
 NXP i.MX8M LDB bridge
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>, dri-devel@lists.freedesktop.org
References: <20220313123852.207257-1-marex@denx.de>
 <9bda9a09-ec0a-0b6f-56b1-dff18821aa5d@kernel.org>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <9bda9a09-ec0a-0b6f-56b1-dff18821aa5d@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: devicetree@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
 Maxime Ripard <maxime@cerno.tech>, Robert Foss <robert.foss@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 Robby Cai <robby.cai@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/13/22 16:47, Krzysztof Kozlowski wrote:

Hi,

[...]

>> diff --git a/Documentation/devicetree/bindings/display/bridge/nxp,ldb.yaml b/Documentation/devicetree/bindings/display/bridge/nxp,ldb.yaml
>> new file mode 100644
>> index 0000000000000..a05dd05547836
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/bridge/nxp,ldb.yaml
>> @@ -0,0 +1,99 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/bridge/nxp,ldb.yaml#
> 
> In title, description and commit msg you point this is specific to
> i.MX8M, so maybe reflect it in the file name as well.

That's how it is so far, however NXP does recycle their IPs quite a bit 
so I don't want to encode the SoC type into the bindings file name. I do 
expect them to re-use this bridge somewhere else sooner rather than later.

[...]

The rest is fixed.

[...]

>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/imx8mp-clock.h>
>> +
>> +    lvds-ldb {
> 
> Generic node name, so "bridge" or "display-bridge"
> 
>> +        #address-cells = <0>;
>> +        #size-cells = <0>;
> 
> Why do you need address and size cells? This will complain if you test
> your bindings with proper compatible.

Because the subnodes of this bridge have no dimension, so address/size 
cells = 0.

I don't understand the second part about "proper compatible", can you 
elaborate ?

>> +        compatible = "fsl,imx8mp-ldb";
> 
> This does not look the same as documented here.

This is the right compatible string, fixed.
