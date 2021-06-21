Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF453AECFE
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 18:03:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52738898C8;
	Mon, 21 Jun 2021 16:03:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E20C898C8
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 16:03:12 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 36076a4c-d2aa-11eb-a36f-0050568cd888;
 Mon, 21 Jun 2021 16:03:25 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 3675F194B13;
 Mon, 21 Jun 2021 18:03:15 +0200 (CEST)
Date: Mon, 21 Jun 2021 18:03:08 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Tomohito Esaki <etom@igel.co.jp>
Subject: Re: [PATH 3/4] dt-bindings: display: Add virtual DRM
Message-ID: <20210621160308.GD823900@ravnborg.org>
References: <20210621064403.26663-1-etom@igel.co.jp>
 <20210621064403.26663-4-etom@igel.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210621064403.26663-4-etom@igel.co.jp>
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
Cc: devicetree@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-doc@vger.kernel.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomohito

> +
> +description:
> +  This document defines device tree properties virtual DRM. The initial
> +  position, size and z-position of the plane used in the virtual DRM is
> +  specified.


> +  The current limitation is that these settings are applied to all crtc.
This comment (I think) refers to the actual implmentation which is
irrelevant for the binding. The implementation may refer to the binding,
but the binding must be implementation agnostic.

> +
> +properties:
> +  compatible:
> +    const: virt-drm
> +
> +patternProperties:
> +  "^plane(@.*)?$":
> +    description: Information of the planes used in virtual DRM
> +    type: object
> +
> +    properties:
> +      x:
> +        type: int
This syntax looks wrong, I had expected something like:
	
	$ref: "/schemas/types.yaml#/definitions/uint32"

> +        description: x-coordinate of the left-top of the plane in pixels
> +
> +      y:
> +        type: int
> +        description: y-coordinate of the left-top of the plane in pixels
> +
> +      width:
> +        type: int
> +        description: width of the plane in pixels
> +
> +      height:
> +        type: int
> +	description: height of the plane in pixels
> +
> +      zpos:
> +        type: int
> +        description: z-position of the plane
> +
> +    required:
> +      - x
> +      - y
> +      - width
> +      - height
> +      - zpos
> +
> +required:
> +  - compatible

> +  - "^plane(@.*)?$"
If there is no node to match this binding does not take effect.
So I think ^plane... do not need to be specified.

> +
> +examples:
> + - |
> +   vdrm@0 {
> +       compatible = "virt-drm";
> +       plane@0 {
> +           x = <200>;
> +	   y = <100>;
> +	   width = <800>;
> +	   height = <600>;
> +	   zpos = <1>;
> +       };
> +   };
Do not mix spaces and tabd, be consistent and use 4 spaces as indent in
all the example.

	Sam
