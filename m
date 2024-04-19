Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2688AA93F
	for <lists+dri-devel@lfdr.de>; Fri, 19 Apr 2024 09:34:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4D0010FDC0;
	Fri, 19 Apr 2024 07:34:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="HMBWiD7o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E71F10FDC0
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Apr 2024 07:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1713512092;
 bh=DyISyQg7WS1Y2u3RPJgVFUSFFcKg59nL1uyitoy15Lc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=HMBWiD7oXdDRH9iC8ExLKlQq5mc7XNH3+hVD1yFkSG3rGi92pQAxlxV0ccasgXLnp
 SrBwxTUPSiRQNmJAfGlnnJuxOK3kcnZTIm+NuKq8cJa4NQq/6NZjBBpns1SEKdc8uj
 2OYNu64SxBUgcE6Hd8FNDHyZcAR4vKVghsHONTo7AS9C/3vkMxJ8gbWS8s15x+Go2a
 HLdSyhWI7bcxmUeqq+OeCTSuQo/hvWZP0r5dN+fJ2gKB6sLkIJ8n7N+OLM54UQkih1
 OOM1iqEEfSv3pQeCDQuV0ospWe4XU8Bkkp1XR7VuHlmNwtPKv93G8x72S9dpq3XqCx
 RIJlidE3jCP7A==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 867053781104;
 Fri, 19 Apr 2024 07:34:50 +0000 (UTC)
Message-ID: <46549dca-95c0-48f0-acd7-e4a7725437bc@collabora.com>
Date: Fri, 19 Apr 2024 09:34:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/17] clk: mediatek: mt8365-mm: fix DPI0 parent
To: Alexandre Mergnat <amergnat@baylibre.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Jitao Shi <jitao.shi@mediatek.com>,
 CK Hu <ck.hu@mediatek.com>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
 <u.kleine-koenig@pengutronix.de>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Fabien Parent <fparent@baylibre.com>,
 Markus Schneider-Pargmann <msp@baylibre.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <20231023-display-support-v3-0-53388f3ed34b@baylibre.com>
 <20231023-display-support-v3-12-53388f3ed34b@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20231023-display-support-v3-12-53388f3ed34b@baylibre.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 18/04/24 16:17, Alexandre Mergnat ha scritto:
> To have a working display through DPI, a workaround has been
> implemented downstream to add "mm_dpi0_dpi0" and "dpi0_sel" to
> the DPI node. Shortly, that add an extra clock.
> 
> It seems consistent to have the "dpi0_sel" as parent.
> Additionnaly, "vpll_dpix" isn't used/managed.
> 
> Then, set the "mm_dpi0_dpi0" parent clock to "dpi0_sel".
> 
> The new clock tree is:
> 
> clk26m
>    lvdspll
>      lvdspll_X (2, 4, 8, 16)
>        dpi0_sel
>          mm_dpi0_dpi0
> 
> Fixes: d46adccb7966 ("clk: mediatek: add driver for MT8365 SoC")
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>

I wonder what CLK_TOP_VPLL_DPIX_EN is for, but since you've ruled it out
by removing the dependency, this clock is 100% being disabled because unused
and the DPI interface clearly still works.

I also wonder if that clock is getting en/disabled by HW control mechanism...
...because that'd make sense, as this is .. well, a DPI clock.

That's just out of curiosity though, as I'd really like to understand whenwhatwhy
for stuff....

In any case, whether you have an answer or not, this commit is:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Cheers!
