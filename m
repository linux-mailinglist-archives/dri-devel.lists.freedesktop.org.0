Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7213D64CC41
	for <lists+dri-devel@lfdr.de>; Wed, 14 Dec 2022 15:28:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 458F010E40A;
	Wed, 14 Dec 2022 14:28:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1108 seconds by postgrey-1.36 at gabe;
 Wed, 14 Dec 2022 14:27:59 UTC
Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59AB810E028
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Dec 2022 14:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202112;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=085ww/mXnOU4Dn+4T1MtfrF1AQxRz6j9A7dCMcwXzxM=; b=JyIgAssOMqBtTh5TQw0i8XztOl
 G6lRzdc+sTwaL3XSAUs4diXffQDK4IhzzeYzDGmRGFpPftVXYarK5lw2R5RJx/g23N+Ag2FJ0Y7ay
 g3WLT4q4dldwO73Xi7iechwgVs3URZqoWYuzDhpIIivGX3S8Nk60o3kjjiqP5/XK3fW7s/pzYFZMk
 IYF7BvsS7ggDAZWdcyJs4KG9XQQJGh01cE1JF94HOca5D0u0LMzpcErfzngPugxSk5y4o/Gif+0xD
 Lf86Cx0piPXqtsGAst9vrwU5dJqoboZ+dhfcB0EQdl4BNczBHd+FIeDPjJZDaxcYyxStOKfRWM7h2
 QklykCdA==;
Received: from 80.81-166-174.customer.lyse.net ([81.166.174.80]:59094
 helo=[192.168.10.61]) by smtp.domeneshop.no with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <noralf@tronnes.org>) id 1p5SPg-00AgNt-I4;
 Wed, 14 Dec 2022 15:07:13 +0100
Message-ID: <f54ad441-3758-f4fe-befe-9f77b2de364e@tronnes.org>
Date: Wed, 14 Dec 2022 15:07:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v2 0/3] drm/tiny: panel-mipi-dbi: Support separate I/O
 voltage supply
To: =?UTF-8?Q?Otto_Pfl=c3=bcger?= <otto.pflueger@abscue.de>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20221201160245.2093816-1-otto.pflueger@abscue.de>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20221201160245.2093816-1-otto.pflueger@abscue.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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



Den 01.12.2022 17.02, skrev Otto Pflüger:
> As stated in Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yml,
> the MIPI DBI specification defines two power supplies, one for powering
> the panel and one for the I/O voltage. The panel-mipi-dbi driver
> currently only supports specifying a single "power-supply" in the
> device tree.
> 
> Add support for a second power supply defined in a new "io-supply"
> device tree property to make the driver properly configure the voltage
> regulators on platforms where separate supplies are used.
> 
> Changes in v2:
>  - Don't list power-supply in the properties section of
>    panel-mipi-dbi-spi.yaml because it is already in panel-common.yaml
> 
> Otto Pflüger (3):
>   drm/mipi-dbi: Support separate I/O regulator
>   drm/tiny: panel-mipi-dbi: Read I/O supply from DT
>   dt-bindings: display: panel: mipi-dbi-spi: Add io-supply
> 

Series applied to drm-misc-next.

Noralf.
