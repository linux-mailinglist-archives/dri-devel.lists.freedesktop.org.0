Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C9885185DE
	for <lists+dri-devel@lfdr.de>; Tue,  3 May 2022 15:46:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AC93112044;
	Tue,  3 May 2022 13:46:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFFE8112041
 for <dri-devel@lists.freedesktop.org>; Tue,  3 May 2022 13:46:06 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 3C2578186D;
 Tue,  3 May 2022 15:46:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1651585564;
 bh=S62zju50AR86PtJj89G+DBN81Uzx9E62NaSdLZMQVFc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=rJNGcQCMz7nWyzB8sVdKGLQzongwKgapAaEWUtJe/Wr1cnPBXBLa2WxJ7/kY1U2BT
 sXHR56NiJdWOl8V14wXacEvk0faYktw/K4E+Gn/lycBEx1037zKdHi4xra76rcZ9lF
 81LbxmKNFFrnlIsXJJN2n8lGsXlSqis2+olCqmaYFrLnAyeYNruPYV7Izn7I8ciixi
 kxljdMSyLiBaQCYw4wUKqoyc20oc3ptlb7CnNQan1APHDBTvWDAAHJ24GJbd/+62of
 msMQ6fO745sSmlHgPj3oQbAa7ZIuBsG+u/ItHFBcfPLCYoJhlV4DRGP5S2Jq9/oBuu
 cgD8QxXuyKvzw==
Message-ID: <ffe878d7-fc00-cadf-7516-d8bb2551a77f@denx.de>
Date: Tue, 3 May 2022 15:46:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v4 1/2] dt-bindings: display: bridge: ldb: Implement
 simple Freescale i.MX8MP LDB bridge
Content-Language: en-US
To: Robert Foss <robert.foss@linaro.org>, Rob Herring <robh@kernel.org>
References: <20220426193645.244792-1-marex@denx.de>
 <YnB3008DXAVoUK7j@robh.at.kernel.org>
 <CAG3jFyte+ePjD6aYoFCW-+3sBW37ROcL8cYNuBGq31YpOUbGcA@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CAG3jFyte+ePjD6aYoFCW-+3sBW37ROcL8cYNuBGq31YpOUbGcA@mail.gmail.com>
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
 dri-devel@lists.freedesktop.org, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 Robby Cai <robby.cai@nxp.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/3/22 14:03, Robert Foss wrote:
> On Tue, 3 May 2022 at 02:31, Rob Herring <robh@kernel.org> wrote:
>>
>> On Tue, Apr 26, 2022 at 09:36:44PM +0200, Marek Vasut wrote:
>>> The i.MX8MP contains two syscon registers which are responsible
>>> for configuring the on-SoC DPI-to-LVDS serializer. Add DT binding
>>> which represents this serializer as a bridge.
>>>
>>> Acked-by: Sam Ravnborg <sam@ravnborg.org>
>>> Signed-off-by: Marek Vasut <marex@denx.de>
>>> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>> Cc: Lucas Stach <l.stach@pengutronix.de>
>>> Cc: Maxime Ripard <maxime@cerno.tech>
>>> Cc: Peng Fan <peng.fan@nxp.com>
>>> Cc: Rob Herring <robh+dt@kernel.org>
>>> Cc: Robby Cai <robby.cai@nxp.com>
>>> Cc: Robert Foss <robert.foss@linaro.org>
>>> Cc: Sam Ravnborg <sam@ravnborg.org>
>>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>>> Cc: devicetree@vger.kernel.org
>>> To: dri-devel@lists.freedesktop.org
>>> ---
>>> V2: - Consistently use fsl,imx8mp-ldb as compatible
>>>      - Drop items: from compatible:
>>>      - Replace minItems with maxItems in clocks:
>>>      - Drop quotes from clock-names const: ldb
>>>      - Rename syscon to fsl,syscon
>>>      - Use generic name of ldb-lvds in example
>>> V3: - Add AB from Sam
>>>      - Consistently use MX8MP
>>> V4: - Rename to fsl-ldb all over the place
>>>      - Put the LDB node under media block controller in the example
>>> ---
>>>   .../bindings/display/bridge/fsl,ldb.yaml      | 92 +++++++++++++++++++
>>>   1 file changed, 92 insertions(+)
>>>   create mode 100644 Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml
>>
>> A little quick on the applying...
> 
> Darnit, you're right.
> 
> Marek: Can you supply a new patch with all of the relevant changes?

Sure, it's coming today-ish or so.
