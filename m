Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC979B534B
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2024 21:22:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 940C710E3A9;
	Tue, 29 Oct 2024 20:22:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F49010E3A9
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2024 20:22:07 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPV6:::1])
 by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <a.fatoum@pengutronix.de>)
 id 1t5sis-0003Bv-TC; Tue, 29 Oct 2024 21:21:50 +0100
Message-ID: <7fad22ef-3403-46de-bd48-b551619fe237@pengutronix.de>
Date: Tue, 29 Oct 2024 21:21:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] dt-bindings: lcdif: Expand the imx6sl/imx6sll
 fallbacks
To: Marek Vasut <marex@denx.de>, Fabio Estevam <festevam@gmail.com>,
 shawnguo@kernel.org
Cc: andreas@kemnade.info, kernel@pengutronix.de, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Fabio Estevam <festevam@denx.de>
References: <20241029191640.379315-1-festevam@gmail.com>
 <20241029191640.379315-2-festevam@gmail.com>
 <94745526-055c-486e-aff1-ae178ae0f2a9@denx.de>
Content-Language: en-US
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <94745526-055c-486e-aff1-ae178ae0f2a9@denx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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

On 29.10.24 21:16, Marek Vasut wrote:
> On 10/29/24 8:16 PM, Fabio Estevam wrote:
>> From: Fabio Estevam <festevam@denx.de>
>>
>> mx6sl.dtsi and imx6sll.dtsi have the following lcdif entries:
>>
>> compatible = "fsl,imx6sl-lcdif", "fsl,imx28-lcdif";
>>
>> This causes dt-schema warnings as the current binding only
>> allow 'fsl,imx6sx-lcdif' as fallback.
>>
>> ['fsl,imx6sl-lcdif', 'fsl,imx28-lcdif'] is too long
>> ['fsl,imx6sll-lcdif', 'fsl,imx28-lcdif'] is too long
>>
>> The imx6sx-lcdif programming model has more advanced features, such
>> as overlay plane and the CRC32 support than the imx28-lcdif IP.
>>
>> Expand the imx6sl/imx6sll lcdif fallbacks to accept a less specific
>> fsl,imx28-lcdif fallback:
>>
>> compatible = "fsl,imx6sl-lcdif", "fsl,imx6sx-lcdif", "fsl,imx28-lcdif";
>>
>> This helps keeping DT compatibility as well as using the more advanced
>> lcdif features found on imx6sl and imx6sll.
>>
>> Signed-off-by: Fabio Estevam <festevam@denx.de>
>> ---
>> Changes since v2:
>> - Make the three compatible entres the only valid combination
>> for imx6sl and imx6sll (Andreas).
>>
>>   Documentation/devicetree/bindings/display/fsl,lcdif.yaml | 8 ++++++--
>>   1 file changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
>> index ad0cca562463..72e509bc975b 100644
>> --- a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
>> +++ b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
>> @@ -23,14 +23,18 @@ properties:
>>             - fsl,imx93-lcdif
>>         - items:
>>             - enum:
>> -              - fsl,imx6sl-lcdif
>> -              - fsl,imx6sll-lcdif
>>                 - fsl,imx6ul-lcdif
>>                 - fsl,imx7d-lcdif
>>                 - fsl,imx8mm-lcdif
>>                 - fsl,imx8mn-lcdif
>>                 - fsl,imx8mq-lcdif
>>             - const: fsl,imx6sx-lcdif
>> +      - items:
>> +          - enum:
>> +              - fsl,imx6sl-lcdif
>> +              - fsl,imx6sll-lcdif
>> +          - const: fsl,imx6sx-lcdif
>> +          - const: fsl,imx28-lcdif
> Shouldn't this be
> 
> - enum:
>   - fsl,imx6sl-lcdif
>   - fsl,imx6sll-lcdif
>   - fsl,imx6sx-lcdif
> - const: fsl,imx28-lcdif
> 
> So you wouldn't have to write three compatible strings for the 6sl/sll , but only two ? I.e. this:
> 
> compatible = "fsl,imx6sl-lcdif", "fsl,imx28-lcdif";
> compatible = "fsl,imx6sll-lcdif", "fsl,imx28-lcdif";
> compatible = "fsl,imx6sx-lcdif", "fsl,imx28-lcdif";

This would necessitate changing the Linux driver to match against the
fsl,imx6sl-lcdif & fsl,imx6sll-lcdif compatible as well, otherwise new features
like e.g. the overlay plane won't be available.

Cheers,
Ahmad

> 
> ?
> 


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
