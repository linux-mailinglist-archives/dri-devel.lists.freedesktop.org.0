Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D5788A4C9
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 15:39:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FF9C10E92B;
	Mon, 25 Mar 2024 14:39:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="RkpAcbia";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A9C410E936
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 14:39:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 2E070CE1A53;
 Mon, 25 Mar 2024 14:39:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DE25C41674;
 Mon, 25 Mar 2024 14:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711377582;
 bh=FjnS44ng3NPsn9900ILtiMh5uro5/JiC38NCbn+WTYw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RkpAcbiawu2zrTNsSnZevVXPSjwCNl7i9z7hG0I0A/7jZ6i6zvL1/9OrDI9MBg6LE
 x3udYirwdM7/VCWp6qcMvNWE//aqcmEUyrqKaVfZpGKkz9UjuF11Z+pNo1WTfsaWUQ
 uo9BQwFdP6Uxigvupxzgwmvw7CGjVbJS1DbF/TYibY7UZTSNDknpt9CCA7WnQVw96T
 eLw+ezpKL6ilfx4tTV/QsDBPtSRmybf/pUAMb3H/MjyFORS24NISod0DZiGqQMg8ew
 IfKIE1b/Rq8pksjUMb/+xqE3NcFUTUM2gmhHQI/YtsIni3oz5aomYN4d9LqyHZrol+
 GWNbUFuNmPf7Q==
Date: Mon, 25 Mar 2024 09:39:40 -0500
From: Rob Herring <robh@kernel.org>
To: Dharma Balasubiramani <dharma.b@microchip.com>
Cc: Rob Herring <robh+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 linux-kernel@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 dri-devel@lists.freedesktop.org, Conor Dooley <conor+dt@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v4] dt-bindings: display: atmel,lcdc: convert to dtschema
Message-ID: <171137757831.3350156.9187326461669491839.robh@kernel.org>
References: <20240318-lcdc-fb-v4-1-c533c7c2c706@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240318-lcdc-fb-v4-1-c533c7c2c706@microchip.com>
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


On Mon, 18 Mar 2024 11:10:13 +0530, Dharma Balasubiramani wrote:
> Convert the atmel,lcdc bindings to DT schema.
> Changes during conversion: add missing clocks and clock-names properties.
> 
> Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
> ---
> This patch converts the existing lcdc display text binding to JSON schema.
> The binding is split into two namely
> lcdc.yaml
> - Holds the frame buffer properties
> lcdc-display.yaml
> - Holds the display panel properties which is a phandle to the display
> property in lcdc fb node.
> 
> These bindings are tested using the following command.
> 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> ---
> Changes in v4:
> - Add maximum for atmel,guard-time property.
> - Add constraints for bits-per-pixel property.
> - Update the atmel,lcd-wiring-mode property's ref to point single string
>   rather than an array.
> - Add constraints for atmel,lcd-wiring-mode property.
> - Add maxItems to the atmel,power-control-gpio property.
> - Link to v3: https://lore.kernel.org/r/20240304-lcdc-fb-v3-1-8b616fbb0199@microchip.com
> 
> Changes in v3:
> - Remove the generic property "bits-per-pixel"
> - Link to v2: https://lore.kernel.org/r/20240304-lcdc-fb-v2-1-a14b463c157a@microchip.com
> 
> Changes in v2:
> - Run checkpatch and remove whitespace errors.
> - Add the standard interrupt flags.
> - Split the binding into two, namely lcdc.yaml and lcdc-display.yaml.
> - Link to v1: https://lore.kernel.org/r/20240223-lcdc-fb-v1-1-4c64cb6277df@microchip.com
> ---
>  .../bindings/display/atmel,lcdc-display.yaml       | 103 +++++++++++++++++++++
>  .../devicetree/bindings/display/atmel,lcdc.txt     |  87 -----------------
>  .../devicetree/bindings/display/atmel,lcdc.yaml    |  70 ++++++++++++++
>  3 files changed, 173 insertions(+), 87 deletions(-)
> 

Applied, thanks!

