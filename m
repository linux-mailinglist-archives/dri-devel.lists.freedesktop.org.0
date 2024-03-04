Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B27FF86FAC3
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 08:30:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFC2F10FDAB;
	Mon,  4 Mar 2024 07:30:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oltmanns.dev header.i=@oltmanns.dev header.b="l8NQhouH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18AB310FDA9
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 07:30:16 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4Tp9MS4RGFz9stR;
 Mon,  4 Mar 2024 08:30:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oltmanns.dev;
 s=MBO0001; t=1709537412;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UgpgzV2Q/GbIWREFNI+aQD05ef1VFT6JlXRe9heDTVQ=;
 b=l8NQhouHHw02zPiTPi8CTZt2BeXjrl2oCRomvK5kD34eSkkb7kG1pZQzb6XkyYNJfWrQDg
 4eBe0rijvramhPIZKQXWJZxYusiy2oGxBjEtRySfBvmXvlrb03fhZtY6h+MQSxM2M9c4RB
 fo2eGErHtXOpSXtV9NQauTzBIkQPezQrbzQqac43IjSENN9kSbyw5zRSO5+H7uSZ/rvNDN
 DdLMpSG1q8i8bKprRsfAJHwDvVpBLiUTFK37W+fGR8KjomsoOA1iNbn3lL6fN2ID8LeyP7
 toYasuIckywR9/yEi91m/ikvhHwSuaavJ9XjgKKPxzLU9y+CFyw7bm9r0iW3+w==
From: Frank Oltmanns <frank@oltmanns.dev>
Date: Mon, 04 Mar 2024 08:29:18 +0100
Subject: [PATCH v3 2/5] clk: sunxi-ng: a64: Set minimum and maximum rate
 for PLL-MIPI
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240304-pinephone-pll-fixes-v3-2-94ab828f269a@oltmanns.dev>
References: <20240304-pinephone-pll-fixes-v3-0-94ab828f269a@oltmanns.dev>
In-Reply-To: <20240304-pinephone-pll-fixes-v3-0-94ab828f269a@oltmanns.dev>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 =?utf-8?q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, 
 Purism Kernel Team <kernel@puri.sm>, Ondrej Jirman <megi@xff.cz>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 Frank Oltmanns <frank@oltmanns.dev>, Diego Roversi <diegor@tiscali.it>, 
 stable@vger.kernel.org
X-Developer-Signature: v=1; a=openpgp-sha256; l=1471; i=frank@oltmanns.dev;
 h=from:subject:message-id; bh=kDpws4iby8ib+0jukh7K9mXcEL8OMyePEolpMUL5c7o=;
 b=owEB7QES/pANAwAIAZppogiUStPHAcsmYgBl5XhwgX3a4/s+n5hG05HBi6whjKEoqn9VxH3hT
 kU0ltspgoWJAbMEAAEIAB0WIQQC/SV7f5DmuaVET5aaaaIIlErTxwUCZeV4cAAKCRCaaaIIlErT
 x4QCC/9XbbJOFIoX2zdz6xo2rY0S6JXjrsQNk3zEBcedF7tVA3C9NOEGeThCxeRGBwyEM0G1Jm/
 6b9GqpMRi0NcAEpIiaVMK71o59Z/S0DXxbkPTa9oYkpkq1KzehEcGS0K7dNtE5LfwRYFPUVYjyi
 gDEGQkO+ncjBo9uXbdpFNHeLg/j0Hah4k8lFJfSoQwK3m4/Dz7nZ3tC1Ul/iDHluuchD/3F0Fu8
 q/4Due10vh8EHiDO7K0lZpbE6a2oL4EZXSL/YWlJo3EPufvOQzVNmX0dEsEbf/0Cv3bdDylPsPT
 m2Rw0gzhMjLvudqz96hBz30qgVA+bmUyx2ENM9ME7jhu0wmgwqww2PCFJwTUtaYyq5v+R5LbxzC
 6dMobEI5ahAEJZypeV5yc+kZGa+uok8d6f0qGs7ZVOlWfjeob8vzEgv1GqLkRkA6Fn5W17vOuya
 8rKnEmKvmA1XVqI1XacEtkXDFpLjYF1+Ab4b51STuQCNx+POYQWvRTh4dCrS7C9hdLoQU=
X-Developer-Key: i=frank@oltmanns.dev; a=openpgp;
 fpr=02FD257B7F90E6B9A5444F969A69A208944AD3C7
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

When the Allwinner A64's TCON0 searches the ideal rate for the connected
panel, it may happen that it requests a rate from its parent PLL-MIPI
which PLL-MIPI does not support.

This happens for example on the Olimex TERES-I laptop where TCON0
requests PLL-MIPI to change to a rate of several GHz which causes the
panel to stay blank. It also happens on the pinephone where a rate of
less than 500 MHz is requested which causes instabilities on some
phones.

Set the minimum and maximum rate of Allwinner A64's PLL-MIPI according
to the Allwinner User Manual.

Fixes: ca1170b69968 ("clk: sunxi-ng: a64: force select PLL_MIPI in TCON0 mux")
Reported-by: Diego Roversi <diegor@tiscali.it>
Closes: https://groups.google.com/g/linux-sunxi/c/Rh-Uqqa66bw
Signed-off-by: Frank Oltmanns <frank@oltmanns.dev>
Tested-by: Diego Roversi <diegor@tiscali.it>
Cc: stable@vger.kernel.org
---
 drivers/clk/sunxi-ng/ccu-sun50i-a64.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-a64.c b/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
index 8951ffc14ff5..6a4b2b9ef30a 100644
--- a/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
+++ b/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
@@ -182,6 +182,8 @@ static struct ccu_nkm pll_mipi_clk = {
 					      &ccu_nkm_ops,
 					      CLK_SET_RATE_UNGATE | CLK_SET_RATE_PARENT),
 		.features	= CCU_FEATURE_CLOSEST_RATE,
+		.min_rate	= 500000000,
+		.max_rate	= 1400000000,
 	},
 };
 

-- 
2.44.0

