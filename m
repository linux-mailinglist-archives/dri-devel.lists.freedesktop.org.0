Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C37AF6DFDE7
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 20:47:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C69010E0BF;
	Wed, 12 Apr 2023 18:47:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D03710E0BF
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 18:47:37 +0000 (UTC)
Received: from mail.denx.de (unknown
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: festevam@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 1019D85FB2;
 Wed, 12 Apr 2023 20:47:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1681325249;
 bh=EtZZqzZL2vJAf9fyVdNPVZrxI5cAm4RiU1gbQP4NE+8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=GgqWufzouxctSPf+epllIXpkN9PapbNIURu6tAFJD1M/oiQaKmTGxhkRdm2O2GwnI
 D52tlsMrvK9WeYupVftkKBumP3sS/ODeDsPMvYZBDU/18PQu9WOnEy0yePl5PCl0sV
 rkX0LzYemZ5UpC2aTvBBihgvUV27xvZOzrPyZkZtWWVU2cC/bChUhEo+fBkfeMcDpm
 Wu4X1F1mBYdh68EakzNny3wThNtKMwnFJXSu8lbIeNFW91UpMIERjUQFKYpTo2m2an
 jHGmzlrRRwyWUXB6PF+YLQsPS+UvsoBR3bZ45WFiYXb5vIpOrBFfCWcFkqTtXnx1GO
 RWp7nlRj2mp1Q==
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Wed, 12 Apr 2023 15:47:28 -0300
From: Fabio Estevam <festevam@denx.de>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: samsung,mipi-dsim: Add
 'lane-polarities'
In-Reply-To: <20230412144300.GA2328336-robh@kernel.org>
References: <20230406190354.1641352-1-festevam@gmail.com>
 <20230412144300.GA2328336-robh@kernel.org>
Message-ID: <4455923593064a4ad5b39a9030ded528@denx.de>
X-Sender: festevam@denx.de
User-Agent: Roundcube Webmail/1.3.6
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
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
Cc: marex@denx.de, neil.armstrong@linaro.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, jagan@amarulasolutions.com,
 krzysztof.kozlowski+dt@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob,

On 12/04/2023 11:43, Rob Herring wrote:

> No, this should be video-interfaces.yaml since you use properties from
> it.

Ok, will change it.

> 
>> +            unevaluatedProperties: false
>> +
>> +            properties:
>> +              data-lanes:
>> +                oneOf:
>> +                  - minItems: 1
>> +                    maxItems: 4
>> +                    uniqueItems: true
>> +                    items:
>> +                      enum: [ 1, 2, 3, 4 ]
> 
> The h/w really supports any combination of lanes to be used?

The MIPI DSIM IP supports the usage of 1, 2, 3, or 4 data lanes.

The following cases are possible:

data-lanes = <1>;
data-lanes = <1 2>;
data-lanes = <1 2 3>;
data-lanes = <1 2 3 4>;

Lane reordering is not supported.

> 
>> +                    description:
>> +                      See ../../media/video-interfaces.yaml for 
>> details.
>> +
>> +              lane-polarities:
>> +                minItems: 1
>> +                maxItems: 5
>> +                items:
>> +                  enum: [ 0, 1 ]
>> +                description:
>> +                  See ../../media/video-interfaces.yaml for details.
>> +                  The Samsung MIPI DSI IP requires that all the data 
>> lanes have
>> +                  the same polarity.
> 
> Sounds like a constraint:
> 
> oneOf:
>   - items:
>       const: 0
>   - items:
>       const: 1

Imagine a board that has 4 data lanes and only the clock lane is 
inverted.

The representation is (the first entry is the clock lane, followed by 
the 4 data lanes):

lane-polarities = <1 0 0 0 0>;

If the board has no inversion on the clock lane, and has the data lanes 
inverted:

lane-polarities = <0 1 1 1 1>;

Should I keep the data-lanes and lane-polarities description as in this 
patch?

Please advise.

Thanks,

Fabio Estevam
