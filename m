Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E457E4329B1
	for <lists+dri-devel@lfdr.de>; Tue, 19 Oct 2021 00:18:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0AFB6E103;
	Mon, 18 Oct 2021 22:18:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A17236E103
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Oct 2021 22:18:14 +0000 (UTC)
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 4164182051;
 Tue, 19 Oct 2021 00:18:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1634595492;
 bh=LH381WKcEJ4kjqt3z8TuPnPNDPdMSZcU4VwPzz5eqP0=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=bI8yTzyT5yJn/KRnImQyT+lt6Qhd6/+V8B/GYizs9jVf7XY3/6ndYBULJWbj4MEbE
 z8QP2w0aYBcmUkpkN3euf9ZbO7WaZ/9cRL53MGEyNg5n5NsDOqx4J72ppxcDR/lgGq
 g6Vwaq3MlwomfEsTxrgwLVipowTOvVULFWYGimyNYsQGKnLe77b1kfab2ls5EINSfJ
 oqWRCPTIL/CXDBNYpGKtE2E73MCft1Hg7DYalIXGo/I9oTJmhJXQH4KQ6W+DRAe9jo
 alJOqZ6ImLkmVRLBMH+HXea0YxCBEdZZWCxs2L7cZ3+ZKMMbJon6nR0npTtuQUPbAx
 u0fFVvMZGhV1Q==
Subject: Re: [PATCH v5 1/2] dt-bindings: display: bridge: lvds-codec: Document
 pixel data sampling edge select
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, devicetree@vger.kernel.org
References: <20211017001204.299940-1-marex@denx.de>
 <YW24EbfbtJdMMDRV@pendragon.ideasonboard.com>
 <c34f8a7e-eec6-9373-0c52-f6546ad689a8@denx.de>
 <YW3Rw0hZmB6plu+V@pendragon.ideasonboard.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <4f235f45-5c03-eaeb-69ac-3d801a1dd58c@denx.de>
Date: Tue, 19 Oct 2021 00:18:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YW3Rw0hZmB6plu+V@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/18/21 9:57 PM, Laurent Pinchart wrote:

Hi,

>>>> diff --git a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
>>>> index 1faae3e323a4..708de84ac138 100644
>>>> --- a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
>>>> +++ b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
>>>> @@ -79,6 +79,14 @@ properties:
>>>>          - port@0
>>>>          - port@1
>>>>    
>>>> +  pclk-sample:
>>>> +    description:
>>>> +      Data sampling on rising or falling edge.
>>>> +    enum:
>>>> +      - 0  # Falling edge
>>>> +      - 1  # Rising edge
>>>> +    default: 0
>>>> +
>>>
>>> Shouldn't this be moved to the endpoint, the same way data-mapping is
>>> defined as an endpoint property ?
>>
>> The strapping is a chip property, not port property, so no.
> 
> For this particular chip that's true. I'm still not convinced overall.
> For some cases it could be a per-port property

Can you be more specific about "some cases" ?

> , and moving it there for
> lvds-codec too could allow implementing helpers to parse DT properties,
> without much drawback for this particular use case as far as I can see.
> It's hard to predict the future with certainty of course, so I won't
> insist.

The DT bindings and the OS drivers are separate thing, we really 
shouldn't start bending DT bindings so that they would fit nicely with a 
specific OS driver model.
