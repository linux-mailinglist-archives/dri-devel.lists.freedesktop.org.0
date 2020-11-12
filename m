Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B637F2B0F35
	for <lists+dri-devel@lfdr.de>; Thu, 12 Nov 2020 21:49:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9306C6E435;
	Thu, 12 Nov 2020 20:49:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 715646E435
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 20:49:18 +0000 (UTC)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com
 [209.85.167.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 00E412224A
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 20:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605214158;
 bh=wrKaWD3LoEi3Ttr+MBj6uJxawKgQ0puebVWPB/EXaKA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=OAXMhXziASJ9REsiyRT2peJV1Eni+CQ+BxxB7kFyOWOmPL0t7MXJJHVZXZ8Vw9wYa
 k/tm6+ld1H/u1bxUqtTYnLLSfhxxnpPyrLSRB8mzNhOpIsX6bB96xdDpr4/puUVDa0
 RpPBwJYmQxFkGA4jWWgz8sxf5zuszFvylq35kQkw=
Received: by mail-oi1-f171.google.com with SMTP id k26so7980255oiw.0
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 12:49:17 -0800 (PST)
X-Gm-Message-State: AOAM532b4ZXhoeTIGaEpR+3kM+ZjP2Mpe+slZJKUea+KngwnVY2s1jwv
 EfcWa4oB88E9GP8FKeL6LpEp08R5L23XOhyFcQ==
X-Google-Smtp-Source: ABdhPJxcMk1WB5wVFqixYLOd/a/1Gfq63/2/MzkP3fgZwh7SStQ67/N9bG8B4VYXQBSpsfyYuH7oJ2H2gy6M000/fXU=
X-Received: by 2002:aca:5dc2:: with SMTP id r185mr1100963oib.106.1605214157168; 
 Thu, 12 Nov 2020 12:49:17 -0800 (PST)
MIME-Version: 1.0
References: <20201102203656.220187-1-robh@kernel.org>
 <20201102203656.220187-2-robh@kernel.org>
In-Reply-To: <20201102203656.220187-2-robh@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Thu, 12 Nov 2020 14:49:06 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKYA+8VgVNsoU4O1taYzJACntjm-i+Jm0GDS7KEf08F9A@mail.gmail.com>
Message-ID: <CAL_JsqKYA+8VgVNsoU4O1taYzJACntjm-i+Jm0GDS7KEf08F9A@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: Convert graph bindings to json-schema
To: Sameer Pujar <spujar@nvidia.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Mark Brown <broonie@kernel.org>
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
Cc: devicetree@vger.kernel.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 2, 2020 at 2:36 PM Rob Herring <robh@kernel.org> wrote:
>
> From: Sameer Pujar <spujar@nvidia.com>
>
> Convert device tree bindings of graph to YAML format. Currently graph.txt
> doc is referenced in multiple files and all of these need to use schema
> references. For now graph.txt is updated to refer to graph.yaml.
>
> For users of the graph binding, they should reference to the graph
> schema from either 'ports' or 'port' property:
>
> properties:
>   ports:
>     type: object
>     $ref: graph.yaml#/properties/ports
>
>     properties:
>       port@0:
>         description: What data this port has
>
>       ...
>
> Or:
>
> properties:
>   port:
>     description: What data this port has
>     type: object
>     $ref: graph.yaml#/properties/port
>
> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> Acked-by: Philipp Zabel <p.zabel@pengutronix.de>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> v3:
>  - Move port 'reg' to port@* and make required
>  - Make remote-endpoint required
>  - Add 'additionalProperties: true' now required
>  - Fix yamllint warnings
>
>  Documentation/devicetree/bindings/graph.txt  | 129 +-----------
>  Documentation/devicetree/bindings/graph.yaml | 199 +++++++++++++++++++
>  2 files changed, 200 insertions(+), 128 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/graph.yaml

I've decided to move this to the dt-schema repo instead[1]. I think
that will be easier to manage dependencies (audio-graph.yaml plus
anything else landing this cycle) than subsystems pulling a shared
branch. I haven't merged it yet, so let me know if any
comments/objections. Note that the meta-schema will have to come a bit
later once existing users are updated (which I have patches for).

Rob

[1] https://github.com/devicetree-org/dt-schema/tree/of-graph
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
