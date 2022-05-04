Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B75519382
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 03:30:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3510B10E0E7;
	Wed,  4 May 2022 01:30:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1E5910E0E7
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 01:30:13 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 4C72783C5A;
 Wed,  4 May 2022 03:30:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1651627811;
 bh=vX8SokEeZlfhXIYBDzYkPo2vLfAybtHuA9E6p997isQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=YJY4rgSqa7Vy7zzWA4+B4BbP1HdsAK6sipMc4azm9ksPpTFQL40faXml76fXDjEZ/
 mXdQqpMwheGIYsrCPgzbZN4kaiTjsxSy4qyhepqd3A+tLly/hEOSbngTUGYihxrItA
 C/z/7JSznhDUbPPsMZZ4PNy8lSnN0rKtzv+1bhYhOxC47MPZBbTkGxPrVOfZhpOtrP
 vo6gWZJyWaar7hdaLhJDVKaGFPgrlS+VrtNx5TmkwaWeE3PYWDkwcKWnBiDsg7riTM
 BvWiS0l8AbbF+CMFK+euHA/dw0LtzhKplHHc5fgy+CuiEIn7PhQjJaMQOu51FM4bVa
 ++H48kUcN8lxg==
Message-ID: <6a079a60-f6b6-f432-b9c2-0444ab5ecd09@denx.de>
Date: Wed, 4 May 2022 03:30:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v4 1/2] dt-bindings: display: bridge: ldb: Implement
 simple Freescale i.MX8MP LDB bridge
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
References: <20220426193645.244792-1-marex@denx.de>
 <YnB3008DXAVoUK7j@robh.at.kernel.org>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <YnB3008DXAVoUK7j@robh.at.kernel.org>
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
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, robert.foss@linaro.org,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>,
 Robby Cai <robby.cai@nxp.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/3/22 02:31, Rob Herring wrote:

Hi,

[...]

>>   .../bindings/display/bridge/fsl,ldb.yaml      | 92 +++++++++++++++++++
>>   1 file changed, 92 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml
> 
> A little quick on the applying...

Right

>> diff --git a/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml b/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml
>> new file mode 100644
>> index 000000000000..77f174eee424
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml
>> @@ -0,0 +1,92 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/bridge/fsl,ldb.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Freescale i.MX8MP DPI to LVDS bridge chip
>> +
>> +maintainers:
>> +  - Marek Vasut <marex@denx.de>
>> +
>> +description: |
>> +  The i.MX8MP mediamix contains two registers which are responsible
>> +  for configuring the on-SoC DPI-to-LVDS serializer. This describes
>> +  those registers as bridge within the DT.
> 
> This is a subblock of the mediamix? Please add 'reg' for the 2 registers
> even if you use a regmap.

I submitted a patch:
[PATCH] dt-bindings: display: bridge: ldb: Fill in reg property

> I didn't find a binding for mediamix. You really need the containing
> block binding before a child node.

Right, I'm tempted to send a revert outright and wait for the mediamix 
bindings to hit upstream.
