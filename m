Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B2C4955E66
	for <lists+dri-devel@lfdr.de>; Sun, 18 Aug 2024 19:51:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64E5110E071;
	Sun, 18 Aug 2024 17:51:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="XJPEn9w3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18C3E10E071
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Aug 2024 17:51:47 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2AC57541;
 Sun, 18 Aug 2024 19:50:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1724003445;
 bh=tidVSY8rGlKZOZ/mG0BgYK99Ekuv0IZphfvjl/fYTac=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XJPEn9w358MvTwtX9mZJn4kwOCClwMA9nTvzWfvCUsCSXYW0tXEIm9nUbkT/Zcm51
 U575WtWwgZVHkV808z4eMjUADz8zbVaPfaz4bBCMcL/w9FnPjN6HCTpaicl52ru8zC
 bCqtaoRLB5jovSx5CXxohuVgF3CluwiVfdlAT1Wo=
Date: Sun, 18 Aug 2024 20:51:18 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: display: renesas,du: narrow interrupts
 and resets per variants
Message-ID: <20240818175118.GF29465@pendragon.ideasonboard.com>
References: <20240818173003.122025-1-krzysztof.kozlowski@linaro.org>
 <20240818174137.GC29465@pendragon.ideasonboard.com>
 <4615f52b-4e4c-4fe4-bfef-a66e196410d7@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4615f52b-4e4c-4fe4-bfef-a66e196410d7@linaro.org>
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

On Sun, Aug 18, 2024 at 07:44:22PM +0200, Krzysztof Kozlowski wrote:
> On 18/08/2024 19:41, Laurent Pinchart wrote:
> > Hi Krzysztof,
> > 
> > Thank you for the patch.
> > 
> > On Sun, Aug 18, 2024 at 07:30:02PM +0200, Krzysztof Kozlowski wrote:
> >> Each variable-length property like interrupts or resets must have fixed
> >> constraints on number of items for given variant in binding.  The
> >> clauses in "if:then:" block should define both limits: upper and lower.
> > 
> > I thought that, when only one of minItems or maxItems was specified, the
> > other automatically defaulted to the same value. I'm pretty sure I
> > recall Rob asking me to drop one of the two in some bindings. Has the
> > rule changes ? Is it documented somewhere ?
> 
> New dtschema changed it and, even if previous behavior is restored, the
> size in if:then: always had to be constrained. You could have skipped
> one side of limit if it was equal to outer/top-level limit, e.g:
> 
> properties:
>   clocks:
>     minItems: 1
>     maxItems: 2
> 
> 
> if:then:properties:
>   clocks:
>     minItems: 2

Where can I find a description of the behaviour of the new dtschema
(hopefully with some documentation) ?

-- 
Regards,

Laurent Pinchart
