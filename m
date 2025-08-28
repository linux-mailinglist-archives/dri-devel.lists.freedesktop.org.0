Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C221AB3A46C
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 17:30:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A71C410EA2B;
	Thu, 28 Aug 2025 15:30:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.b="T7XblH1I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23EEE10EA2B
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 15:30:01 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57SCptZ5028910;
 Thu, 28 Aug 2025 17:29:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 Q+ZOslRtpNRUZ4+XX/3wjkjYQUhaaQzOaxkNs+zbYV4=; b=T7XblH1IKrV6Pegh
 1MrbFDJraMubPXe0LnwuE7uuXeipDfgsOlZ/a0odT+os3JDoRAhJMnwza9k1yI05
 JB+2Eni0xsS8F96DDqlA8950xsGWNZa6gm6VwL9u5AiCUIMfICWm57qEob878CWN
 MRe4If7gUM9i7L7BbAdSORTbljsHLE4FoHgfB6tfgO65fM6S3uo+IUPel1BmXScS
 wn96aGYh3M67qzDgtAJk0TV5KpWF978wFPkAYcfhTrcnnv4yoIrUzdR9CwOtxhRD
 SI6j5qqH/Q1hVQC7JiQrf0WgqrcLRP39Uls9Ete6YjesuJ6SCHxwPoHJOyqfm8Ms
 kHRhig==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48q5tt5rvv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Aug 2025 17:29:49 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 2C40540045;
 Thu, 28 Aug 2025 17:28:14 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4321376B303;
 Thu, 28 Aug 2025 17:27:13 +0200 (CEST)
Received: from [10.48.86.145] (10.48.86.145) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 28 Aug
 2025 17:27:12 +0200
Message-ID: <4f0d417a-3a57-5ed7-9bbb-758679a9625d@foss.st.com>
Date: Thu, 28 Aug 2025 17:27:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v5 00/13] Enable display support for STM32MP25
Content-Language: en-US
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, Yannick Fertre
 <yannick.fertre@foss.st.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Christophe Roullier
 <christophe.roullier@foss.st.com>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250822-drm-misc-next-v5-0-9c825e28f733@foss.st.com>
From: Philippe CORNU <philippe.cornu@foss.st.com>
In-Reply-To: <20250822-drm-misc-next-v5-0-9c825e28f733@foss.st.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.48.86.145]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_04,2025-08-28_01,2025-03-28_01
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



On 8/22/25 16:34, Raphael Gallais-Pou wrote:
> This series aims to add and enable sufficient LVDS display support for
> STM32MP257F-EV1 board.
> 
> LVDS is the default use case to drive a display panel on STM32MP257F-EV,
> even though DSI panels will be supported in the near future.
> 
> The LTDC needs a pixel rate in sync with the bridge currently in use.
> For that both DSI and LVDS bridges need to declare an internal clock and
> become clock provider to the mux. The mux then selects the reference
> clock for the LTDC pixel rate generation.
> 
> For now this mux is handled internally in the LTDC, while waiting for
> the STM32 clock framework to merge a 'clk-mux' based on the SYSCFG.
> This explains the link done in the patch [7/8] between the LVDS,
> providing the reference clock for the LTDC internals.
> 
>    +----------+              |\
>    |  DSI PHY |------------->| \           +------------+
>    |          |ck_dsi_phy    |  |          |            |
>    +----------+              |  |--------->|    LTDC    |
>    +----------+              |  |pixel_clk |            |
>    | LVDS PHY |------------->|  |          +------------+
>    |          |clk_pix_lvds  |  |
>    +----------+              |  |
>                              |  |
>     ck_ker_ltdc ------------>| /
>                              |/|
>                                └- SYSCFG
> 
> Clock selection applies as follow:
> - 0b00: Selects ck_dsi_phy
> - 0b01: Selects clk_pix_lvds
> - 0b10: Selects ck_ker_ltdc (for parallel or DSI display).
> - 0b11: Reserved
> 
> The reset value of the register controlling the mux is 0b01, meaning
> that the default clock assigned is the clk_pix_lvds.  This causes two
> things:
> 
> - In order to get basic display on the LVDS encoder, like intended,
> nothing has to be done on this mux within the LTDC driver (which for now
> explains the unused syscfg phandle on the LTDC node in the device-tree).
> 
> - 'pixel_clk' is dependent from 'clk_pix_lvds' because of the LTDC clock
> domains.  They also need to be sync to get a coherent pixel rate though
> the display clock tree (which explains the LVDS phandle on the LTDC node
> in the device-tree).
> 
> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> ---
> Changes in v5:
> - Documentation:
>    - LTDC: Clamp correctly min/maxItems value (again)
> - Add Yannick's trailers where relevant except in patch [01/13] which
>    has been modified
> - Link to v4: https://lore.kernel.org/r/20250821-drm-misc-next-v4-0-7060500f8fd3@foss.st.com
> 
> Changes in v4:
> - Documentation:
>    - LTDC: Add "st,stm32mp255-ltdc" compatible.  After internal
>      discussion, we came to the solution that the LTDC on STM32MP255 SoC
>      needs its own compatible, since it does have the same amount of
>      clocks than on STM32MP251 SoC.
> - Devicetree:
>    - Add "st,stm32mp255" compatible on corresponding dtsi
> - Drivers:
>    - LTDC: Handle "st,stm32mp255" compatible
> - Remove Rob's r-b from patch [01/13] since it was modified.
> - Link to v3: https://lore.kernel.org/r/20250819-drm-misc-next-v3-0-04153978ebdb@foss.st.com
> 
> Changes in v3:
> - Rebased on latest drm-misc-next
> - Documentation:
>    - LTDC: Clamp correctly min/maxItems value
>    - LVDS: Remove second 'items' keyword
> - Add Krzysztof's trailer where relevant
> - Link to v2: https://lore.kernel.org/r/20250812-drm-misc-next-v2-0-132fd84463d7@foss.st.com
> 
> Changes in v2:
> - Documentation:
>    - Add support for new compatible "st,stm32mp255-lvds"
>    - Change LTDC compatible for SoC compliant one
>    - Make clearer LTDC clock-names property
> - Devicetree:
>    - Change compatible according to the documentation
>    - Change clock and clock-names order to match documentation (and avoid
>      warnings)
> - Drivers:
>    - Change LTDC compatible
> - Add Rob's trailer where relevant
> - Link to v1: https://lore.kernel.org/r/20250725-drm-misc-next-v1-0-a59848e62cf9@foss.st.com
> 
> ---
> Raphael Gallais-Pou (11):
>        dt-bindings: display: st: add two new compatibles to LTDC device
>        dt-bindings: display: st,stm32-ltdc: add access-controllers property
>        dt-bindings: display: st: add new compatible to LVDS device
>        dt-bindings: display: st,stm32mp25-lvds: add access-controllers property
>        dt-bindings: display: st,stm32mp25-lvds: add power-domains property
>        dt-bindings: arm: stm32: add required #clock-cells property
>        arm64: dts: st: add ltdc support on stm32mp251
>        arm64: dts: st: add ltdc support on stm32mp255
>        arm64: dts: st: add lvds support on stm32mp255
>        arm64: dts: st: add clock-cells to syscfg node on stm32mp251
>        arm64: dts: st: enable display support on stm32mp257f-ev1 board
> 
> Yannick Fertre (2):
>        drm/stm: ltdc: support new hardware version for STM32MP25 SoC
>        drm/stm: ltdc: handle lvds pixel clock
> 
>   .../bindings/arm/stm32/st,stm32-syscon.yaml        | 31 ++++++---
>   .../devicetree/bindings/display/st,stm32-ltdc.yaml | 55 ++++++++++++++-
>   .../bindings/display/st,stm32mp25-lvds.yaml        | 13 +++-
>   arch/arm64/boot/dts/st/stm32mp251.dtsi             | 19 ++++++
>   arch/arm64/boot/dts/st/stm32mp255.dtsi             | 20 +++++-
>   arch/arm64/boot/dts/st/stm32mp257f-ev1.dts         | 79 ++++++++++++++++++++++
>   drivers/gpu/drm/stm/drv.c                          | 12 +++-
>   drivers/gpu/drm/stm/ltdc.c                         | 58 +++++++++++++++-
>   drivers/gpu/drm/stm/ltdc.h                         |  6 ++
>   9 files changed, 275 insertions(+), 18 deletions(-)
> ---
> base-commit: c8cea4371e5eca30cda8660aabb337747dabc51d
> change-id: 20250617-drm-misc-next-4af406c1c45f
> 
> Best regards,

Hi Raphael,
Thank you for these great patches.

If you agree, I think you can merge 01-08 in misc.

Best regards
Philippe :-)
