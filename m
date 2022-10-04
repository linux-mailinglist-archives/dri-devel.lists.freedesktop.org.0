Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 802D45F4408
	for <lists+dri-devel@lfdr.de>; Tue,  4 Oct 2022 15:17:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B138C10E63B;
	Tue,  4 Oct 2022 13:17:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B88D910E63B
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Oct 2022 13:17:07 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 23DD72D9;
 Tue,  4 Oct 2022 15:17:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1664889426;
 bh=f1RHm/OBzxHqpuDxQR9wiXt9MAc/9sUP+yL/aI5Rouw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tu2q72DURGA8c9qN/0N10mEcsZeFqdEGTh9q1tHkA7N7ApKAakihpD6tuK0C5Yew2
 n5I5swKCKOzS0grki1Q4Tdy3x3pNWtOQJmkR92856x6nBJf1s34DJW8CAm1GD34Z9x
 nv5mbiOKVUy4fC65/t60jKosn9MsqQR/uVuCW+4M=
Date: Tue, 4 Oct 2022 16:17:03 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] dt-bindings: display: panel: use spi-peripheral-props.yaml
Message-ID: <YzwyT28hf7daYqa1@pendragon.ideasonboard.com>
References: <20221004120907.72767-1-krzysztof.kozlowski@linaro.org>
 <YzwvDEKAzbqjSYjT@pendragon.ideasonboard.com>
 <64a355f2-e9a1-dcca-cb86-48805acae8d5@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <64a355f2-e9a1-dcca-cb86-48805acae8d5@linaro.org>
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
Cc: devicetree@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 Dillon Min <dillon.minfei@gmail.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Daniel Mack <daniel@zonque.org>, Markuss Broks <markuss.broks@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Krzysztof,

On Tue, Oct 04, 2022 at 03:10:29PM +0200, Krzysztof Kozlowski wrote:
> On 04/10/2022 15:03, Laurent Pinchart wrote:
> > On Tue, Oct 04, 2022 at 02:09:07PM +0200, Krzysztof Kozlowski wrote:
> >> For devices connectable by SPI bus (e.g. already using
> >> "spi-max-frequency" property), reference the "spi-peripheral-props.yaml"
> >> schema to allow using all SPI device properties, even these which device
> >> bindings author did not tried yet.
> > 
> > Isn't this done implicitly by spi-controller.yaml ? SPI devices that are
> > children of an SPI controller should match the patternProperties
> > "^.*@[0-9a-f]+$" in that file, which has a $ref: spi-peripheral-props.yaml.
> > Is there something I'm missing ?
> 
> You are correct about one side of this - SPI controller bindings.
> However these schemas here have clear: additional/unevaluatedProperties:
> false, thus when they find DTS like:
> panel@xxx {
>   compatible = "one of these spi panels";
>   ...
>   spi-cs-high;
>   spi-rx-delay-us = <50>;
>   ... and some more from specific controllers
> }
> 
> you will get errors, because the panel schema does not allow them.
> 
> The bindings were done (some time ago) in such way, that they require
> that both SPI controller and SPI device reference spi-props.

You're absolutely right that additionalProperties needs to be replaced
by unevaluatedProperties. Can the additions of $ref be dropped, or is
that needed too ?

-- 
Regards,

Laurent Pinchart
