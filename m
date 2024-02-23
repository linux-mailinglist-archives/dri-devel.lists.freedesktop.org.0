Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFAFE86076D
	for <lists+dri-devel@lfdr.de>; Fri, 23 Feb 2024 01:10:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74A9410EACC;
	Fri, 23 Feb 2024 00:09:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bPd7uYEm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 350B710EACC
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Feb 2024 00:09:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C60F861967;
 Fri, 23 Feb 2024 00:09:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A932C433C7;
 Fri, 23 Feb 2024 00:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708646995;
 bh=RhRSFH5NSNo6CkhyLrfKQ5w4p4swe1ANA4xMk2MzezU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bPd7uYEmx+5AqH45QTZDVE/QqqrIRqRVliCaONRWsT0EttfngXCdL6t9fvJmNJX9q
 DL5q0N7U3aQHxTPe0hTjITppjBbMCqegTZhyYh9pcdRCI2wkGBNrvztZO4WKvMnGH6
 G26n2TC3XiIS/Z39B4qG95W+6raAP0dZ9mLCv9h27f1WwteRDAQDsgMZ2gMp63nAN3
 Cb4qi/Fy/ziIaDR2E1hl6bQJ6bgJ2bU+8uS9yAVJYuiX3xWWfbZJ6/Lglaqm9njm95
 NK3HBP0nC4u8OMPurCV8m3XqZlXZj1nhwnboA50I5S+cN2XW4eniu1WGpWVzVSEhtg
 C2BwAOwHa6u6Q==
Date: Thu, 22 Feb 2024 17:09:46 -0700
From: Rob Herring <robh@kernel.org>
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 4/4] dt-bindings: display: simple: hardware can use
 several properties
Message-ID: <20240223000946.GA3848625-robh@kernel.org>
References: <20240217-ltdc_mp13-v2-0-50881f1b394e@foss.st.com>
 <20240217-ltdc_mp13-v2-4-50881f1b394e@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240217-ltdc_mp13-v2-4-50881f1b394e@foss.st.com>
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

On Sat, Feb 17, 2024 at 12:02:58PM +0100, Raphael Gallais-Pou wrote:
> Setting a panel-timing in the device-tree overwrite the one specified in
> the driver and set it as preferred.  In that case 'height-mm',
> 'width-mm' and 'panel-timing' are properties that can be use for simple
> panels, according to panel-common.yaml
> 
> Fixes following warnings:
> arch/arm/boot/dts/st/stm32mp135f-dk.dtb: panel-rgb: 'height-mm', 'panel-timing', 'width-mm' do not match any of the regexes: 'pinctrl-[0-9]+'
> 	from schema $id: http://devicetree.org/schemas/display/panel/panel-simple.yaml#
> 
> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> ---
>  Documentation/devicetree/bindings/display/panel/panel-simple.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> index 634a10c6f2dd..c02cbbc7a100 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> @@ -352,6 +352,9 @@ properties:
>    no-hpd: true
>    hpd-gpios: true
>    data-mapping: true
> +  height-mm: true
> +  width-mm: true
> +  panel-timing: true

Instead, just change 'additionalProperties' to 'unevaluateProperties' 
and drop all these 'prop: true' lines. Pretty much anything from 
panel-common.yaml should be allowed.

Rob
