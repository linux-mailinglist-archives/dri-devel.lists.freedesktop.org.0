Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF35F8A44B2
	for <lists+dri-devel@lfdr.de>; Sun, 14 Apr 2024 20:48:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78BFA10E393;
	Sun, 14 Apr 2024 18:48:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=yandex.com header.i=@yandex.com header.b="hx/WIMir";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 350 seconds by postgrey-1.36 at gabe;
 Sun, 14 Apr 2024 18:48:07 UTC
Received: from forward500c.mail.yandex.net (forward500c.mail.yandex.net
 [178.154.239.208])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9939A10E393
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Apr 2024 18:48:07 +0000 (UTC)
Received: from mail-nwsmtp-smtp-production-main-37.myt.yp-c.yandex.net
 (mail-nwsmtp-smtp-production-main-37.myt.yp-c.yandex.net
 [IPv6:2a02:6b8:c12:3e2b:0:640:4907:0])
 by forward500c.mail.yandex.net (Yandex) with ESMTPS id 50D5D60DB6;
 Sun, 14 Apr 2024 21:41:43 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-37.myt.yp-c.yandex.net
 (smtp/Yandex) with ESMTPSA id bfj4CAaOquQ0-YSWkSvTO; 
 Sun, 14 Apr 2024 21:41:41 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.com; s=mail;
 t=1713120101; bh=ncgw3ctShNCfiFpi/FXlW6n3ZHZ090VzmVPeVuJ4WG8=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=hx/WIMirvaFCrgVKL514C7kSdfwgUCLT9g1KU9X+RNRMBLfFYw8R3sVG8zDqFCx8M
 2UyesONdvD5RNSKLbPJ5/tefVCpL7ghXTyPJdfumJxC0wRlEiR77wKffMwVmc68QZe
 3NET90A/Xs/tX3c0BUmffpYeKTHkWj1L9Hp7HU2Y=
Authentication-Results: mail-nwsmtp-smtp-production-main-37.myt.yp-c.yandex.net;
 dkim=pass header.i=@yandex.com
Message-ID: <0facfa2a-bff7-4cf1-b43a-349bba2f2342@yandex.com>
Date: Sun, 14 Apr 2024 20:41:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] dt-bindings: display: rockchip,dw-hdmi: Fix
 sound-dai-cells warning
To: Jonas Karlman <jonas@kwiboo.se>, Heiko Stuebner <heiko@sntech.de>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Mark Yao <markyao0591@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20240414151135.1774981-1-jonas@kwiboo.se>
 <20240414151135.1774981-4-jonas@kwiboo.se>
Content-Language: en-US
From: Johan Jonker <jbx6244@yandex.com>
In-Reply-To: <20240414151135.1774981-4-jonas@kwiboo.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 4/14/24 17:11, Jonas Karlman wrote:
> The rockchip,dw-hdmi node can be used as a sound dai codec, however,
> dtbs_check may report the following issue:
> 
>   hdmi@fe0a0000: Unevaluated properties are not allowed ('#sound-dai-cells' was unexpected)
>   from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-hdmi.yaml#
> 
> Add a reference to dai-common.yaml and add the #sound-dai-cells prop to
> resolve this warning.
> 
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> ---

> v2: New patch to fix #sound-dai-cells warning

Hi,

You are #4 that does an attempt on this subject.
Coincidence with my patches??
If other notifications could be fixed with the same amount of interest?
Please be welcome to pick some other random Rockchip related ones.

Johan

===

[PATCH v1 1/3] dt-bindings: display: add #sound-dai-cells property to rockchip dw hdmi
https://lore.kernel.org/linux-rockchip/3a035c16-75b5-471d-aa9d-e91c2bb9f8d0@gmail.com/

[PATCH] dt-bindings: display: rockchip: add missing #sound-dai-cells to dw-hdmi
https://lore.kernel.org/linux-rockchip/20240326172801.1163200-1-heiko@sntech.de/

[PATCH 6/6] dt-bindings: display: rockchip: dw-hdmi: Add missing sound-dai-cells property
https://lore.kernel.org/linux-rockchip/20231222-pinetab2-v1-6-e148a7f61bd1@mecka.net/

> ---
>  .../bindings/display/rockchip/rockchip,dw-hdmi.yaml           | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml
> index af638b6c0d21..3285fff54416 100644
> --- a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml
> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml
> @@ -15,6 +15,7 @@ description: |
>  
>  allOf:
>    - $ref: ../bridge/synopsys,dw-hdmi.yaml#
> +  - $ref: /schemas/sound/dai-common.yaml#
>  
>  properties:
>    compatible:
> @@ -124,6 +125,9 @@ properties:
>      description:
>        phandle to the GRF to mux vopl/vopb.
>  
> +  "#sound-dai-cells":
> +    const: 0
> +
>  required:
>    - compatible
>    - reg
