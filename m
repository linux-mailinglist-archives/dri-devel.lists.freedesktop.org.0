Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF077D4BA6
	for <lists+dri-devel@lfdr.de>; Tue, 24 Oct 2023 11:12:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF80710E302;
	Tue, 24 Oct 2023 09:12:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 645A410E302
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Oct 2023 09:12:50 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 271BE66072F6;
 Tue, 24 Oct 2023 10:12:48 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1698138769;
 bh=XfXPQ0oVnRctPph3CPb1I9j9606bGUTiH9V9O3ZMIGk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ZAayU1HWjcx40JeBjgKxWYWr2uAdaRzRDwg9CptGRQK3F8N4pyyUl2MsZhjqgUsQD
 fhbujYDWpmUiB7lf2ZUIY/Xu5puKX9BnVL5bj/iwpU7ejqKeJGJ6QbSFys85w9jz0Q
 kbioJO+PH7U7OYD0xsCDzUgpA/uWV4NE9CPdTF02KEEc5cONRV686zrqpC1gL8lZYE
 zlOo8aeMWJR46gNbtozQval7ZcQpcrrmQFPKf9lg7yH565yJyyiSrBSPtDfYCyKSMu
 aJN/1EZcPEim62/9Ew16sOnkydctMMXSRwMOtR6x2wlHI2uFOxKc+AJSNUkdG2TM2f
 6FrBSYu0Pe33g==
Message-ID: <cf25a3cc-6411-45f5-bc7a-6b69cf28c860@collabora.com>
Date: Tue, 24 Oct 2023 11:12:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/18] drm/mediatek: dpi: add support for dpi clock
Content-Language: en-US
To: amergnat@baylibre.com, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Jitao Shi <jitao.shi@mediatek.com>,
 Xinlei Lee <xinlei.lee@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
References: <20231023-display-support-v1-0-5c860ed5c33b@baylibre.com>
 <20231023-display-support-v1-14-5c860ed5c33b@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231023-display-support-v1-14-5c860ed5c33b@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: devicetree@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Fabien Parent <fparent@baylibre.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 23/10/23 16:40, amergnat@baylibre.com ha scritto:
> From: Fabien Parent <fparent@baylibre.com>
> 
> MT8365 requires an additional clock for DPI. Add support for that
> additional clock.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>

I'm not convinced that this is right... at all.

 From a fast check of the MT8365 DPI clocks, I can see that the DPI0 clock declares
parent VPLL_DPIX (a fixed clock), but nothing ever has VPLL_DPIX_EN (which is the
GATE clock, enabling output of DPIx VPLL?).

But then, there's even more: no clock ever references the CLK_TOP_DPI0_SEL nor the
CLK_TOP_DPI1_SEL gate, which is a PLL parent selector... in other platforms, that
is muxing through the TVDPLL, but on MT8365 that is LVDSPLL?!

I have many questions now:
* Two PLLs are apparently brought up, but which one is the right one?!
   * Is the LVDS PLL really used for DisplayPort? (dpi0_sel)
   * Is the VPLL_DPIx PLL used for DisplayPort instead? (dpi0_dpi0)
* Why is the LVDSTX_PXL clock using the same PLL as DPI0?!
   * Why is the VPLL_DPIx gate never enabled?
* Are you sure that CLK_MM_DPI0_DPI0's parent shouldn't be dpi0_sel instead?
* Where is DPI1 in this SoC? Why is there a dpi1_sel clock, but no MM clock
   for the DPI1 controller? Is there any DPI1 controller, even?!
   * Why is there a DPI1 MUX, if there's no DPI1 controller?!

Answering all those questions will lead you to the right change, which I believe
to be in the clock drivers, not here in mtk_dpi.c.

Cheers!
Angelo

