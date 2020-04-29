Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B31181BD7AB
	for <lists+dri-devel@lfdr.de>; Wed, 29 Apr 2020 10:54:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D49FF6EA91;
	Wed, 29 Apr 2020 08:54:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D96216EA91
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Apr 2020 08:54:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) (Authenticated sender: rcn)
 with ESMTPSA id 7E19926B66A
Date: Wed, 29 Apr 2020 10:54:45 +0200
From: Ricardo =?utf-8?Q?Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [RFC PATCH] dt-bindings: display: ti,tfp410.txt: convert to yaml
Message-ID: <20200429085445.5g42pouc3jfgwjuv@rcn-XPS-13-9360>
Mail-Followup-To: Sam Ravnborg <sam@ravnborg.org>, robh+dt@kernel.org,
 devicetree@vger.kernel.org, jason@lakedaemon.net,
 dri-devel@lists.freedesktop.org, tomi.valkeinen@ti.com,
 kernel@collabora.com, linux-arm-kernel@lists.infradead.org
References: <20200428092048.14939-1-ricardo.canuelo@collabora.com>
 <20200428192117.GA13894@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200428192117.GA13894@ravnborg.org>
User-Agent: NeoMutt/20171215
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
Cc: devicetree@vger.kernel.org, jason@lakedaemon.net, robh+dt@kernel.org,
 tomi.valkeinen@ti.com, dri-devel@lists.freedesktop.org, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On mar 28-04-2020 21:21:17, Sam Ravnborg wrote:
> Hi Ricardo.
> 
> Thanks for looking into this bridge binding.
> Some comments in the following.

Thanks for reviewing it, Sam. I agree with your suggestions, some
comments below:

> Can you define it as an enum like this:
> 
> 	enum: [-4, -3, -2, -1, 0, 1, 2, 3]
> 
> And then maybe in the descrition describe how they map to 0..7.
> The problem is that the binding is an API so we cannot just change
> the interpretation of the value 0 etc.

This is similar to what I wanted to do at first, specifying minimum and
maximum values, but it'd have the same problem with the yaml
checker. See, problem is in the yaml checking itself, the actual
parameter parsing in the driver already works with negative integers.

The issue with this particular property is that:

  - it's vendor specific, so it must have a type definition.

  - the actual value is signed, so the proper type definition to use
    should be a signed integer.

  - but then, if you use a negative value for this it will be cast into
    a very large u32 (that's what cells are, after all) beyond the
    maximum value of a positive int32.

  - Range constraints can't be properly checked either, since any
    negative integer interpreted as unsigned will result in a positive
    number beyond the top end of the value range (3 in this case).

So unless there's a way of making the yaml check process aware of
negative integers, I think the only way to pass the checks is to use
unsigned integers and avoid defining the range constraints.

FWIW, the only other similar case I found (adi,ltc2983.yaml) uses uint64
and no range constraints.

Cheers,
Ricardo
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
