Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 684312C952A
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 03:27:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25EC989D6C;
	Tue,  1 Dec 2020 02:27:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
 [209.85.166.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1690189D6C
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 02:27:24 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id i9so112437ioo.2
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 18:27:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nxyhjNtLh80XTa42mU4p2SAwKcHJYzeEFt1OD/Owp4w=;
 b=djm8y+W3+SOW/CZsCdBHW3CD290LVnmk2MHiJjoTjmpmK0uuYBFeb3tvjKZ9WqNBE4
 ft1xhlmJ+RSXzhlkfT0W2YIaVEsyO29rTquHwRcgWAR9z+jnTBRPggSiRi0llmEdQmE0
 AhQihPkuQbiFBUufmrHWuNQ31zQyVnOabf6uXySunA/fbspZ6qAM3RkZD7eYIsRL9sun
 YucBAaAj3EIghJZdJx1flMckRuMetf2FhwBk18KZqJqYmqwHNhLuxO64z0FiUoxp1okX
 ZTQm0mi7QBHeVkKvr5uP31lPZC7tHPQaJkRR3J67Kn1isTiln8ogNv1FejQhl/4IDwMu
 0ciA==
X-Gm-Message-State: AOAM531DZbpz2hm0Ji0kipPbxgetM0F6iR6fhXc8QAjt6dgLkLNFeShS
 DfTsu/5GiGa1kInSblowhg==
X-Google-Smtp-Source: ABdhPJzaWe5D2nmPZBjO3pgEXBkemPgAp9Sp5+ixIO46hJra6+5Nh89fsVwvO0FHLfIk/tB/POA5Gw==
X-Received: by 2002:a6b:7206:: with SMTP id n6mr688822ioc.118.1606789643388;
 Mon, 30 Nov 2020 18:27:23 -0800 (PST)
Received: from xps15 ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id y8sm248076iln.12.2020.11.30.18.27.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Nov 2020 18:27:22 -0800 (PST)
Received: (nullmailer pid 3523582 invoked by uid 1000);
 Tue, 01 Dec 2020 02:27:21 -0000
Date: Mon, 30 Nov 2020 19:27:21 -0700
From: Rob Herring <robh@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3] dt-bindings: display: mcde: Convert to YAML schema
Message-ID: <20201201022721.GA3523505@robh.at.kernel.org>
References: <20201115185145.566772-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201115185145.566772-1-linus.walleij@linaro.org>
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
Cc: devicetree@vger.kernel.org, Sean Paul <sean@poorly.run>,
 dri-devel@lists.freedesktop.org, Sam Ravnborg <sam@ravnborg.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 15 Nov 2020 19:51:45 +0100, Linus Walleij wrote:
> This moves the MCDE bindings over to using the YAML schema
> to describe the ST-Ericsson MCDE display controller,
> making use of the generic DSI controller schema.
> 
> In the process we correct an error in the old text bindings:
> the clocks for the SDI host controllers were specified as
> part of the main MCDE component while they should be
> specified in the DSI host controller subnodes. This was
> a leftover from an earlier iteration of the first patch
> series adding the MCDE.
> 
> We also add the "port" node, we will use this when adding
> LCD panels using the direct parallel interface DPI instead
> of DSI.
> 
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v2->v3:
> - Add resets to the bindings for future-proofing, set
>   additionalProperties: false
> - Extend commit message to explain the the old bindings
>   were incorrect.
> ChangeLog v1->v2:
> - Cut the description on the interrupts.
> - Drop maxItems: 3 on clocks and clock-names: implicit from
>   the number of listed items.
> - Tag the DSI ports with unevaluatedProperties: false
> - Tag the MCDE as such with additionalProperties: true
> - It was a bit hard to test this because of the code base
>   being out of phase with the validation tools but it seems
>   to check out.
> ---
>  .../devicetree/bindings/display/ste,mcde.txt  | 104 -----------
>  .../devicetree/bindings/display/ste,mcde.yaml | 169 ++++++++++++++++++
>  2 files changed, 169 insertions(+), 104 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/ste,mcde.txt
>  create mode 100644 Documentation/devicetree/bindings/display/ste,mcde.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
