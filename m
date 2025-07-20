Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1530B0B46A
	for <lists+dri-devel@lfdr.de>; Sun, 20 Jul 2025 11:01:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE2C010E1A6;
	Sun, 20 Jul 2025 09:01:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=testtoast.com header.i=@testtoast.com header.b="V6rg/aCC";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="O8oTcGxf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fout-b3-smtp.messagingengine.com
 (fout-b3-smtp.messagingengine.com [202.12.124.146])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B88D10E179
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jul 2025 09:01:10 +0000 (UTC)
Received: from phl-compute-10.internal (phl-compute-10.phl.internal
 [10.202.2.50])
 by mailfout.stl.internal (Postfix) with ESMTP id B821E1D000CB;
 Sun, 20 Jul 2025 04:51:47 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-10.internal (MEProxy); Sun, 20 Jul 2025 04:51:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=fm2; t=1753001507; x=
 1753087907; bh=Sw64r7poXvIfYawSguph+VETTE+tXoISSyPPgWJCMM4=; b=V
 6rg/aCCvZoYnVTtjAn3tMa1qL/1ZAQI5COqC5/ocrd1hUPFfDAJ06ALk7pp3qyS+
 riFv9wevHMMbwSGJmlCRnmdJ94RXYQibwliv/LicCAiUjYHY2MXyvAB0vt8P3kl6
 T9AuQIAoNow+dK0X4yRT/ApffXdVRbHhZR/neZu9bJZNyx9cUaL3hMG4n8f4jQNh
 hf7w2rLQ7px2j6ELwGncHHSDA4zEqhQIkcOgHJQ4TUdVOWeT69nnpnTCxjAc8sEt
 tmzBBsAzgXyJhCzUN3LujRF26r9bWzIxNOquf3qRUam6uVBteSSF7ijzz1B5lL7D
 sAjsd85tpVEx2XMjDkhlg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; t=1753001507; x=1753087907; bh=S
 w64r7poXvIfYawSguph+VETTE+tXoISSyPPgWJCMM4=; b=O8oTcGxfAIX0I3b7P
 WVfd8Ozb/tQgt6MldmCeW70ciL3CzVS2/4FbQqKwiYMANlnWYVAzX4XDRs7v0vfU
 B3dXlXcE9aW0xqH+CkLiN1BiSurufKMmmIyEsywdKdOyfmp5JgNmpqAmP01IOdVA
 SRhi8Y5LT8PXzUySJK6oQHoZsS3TkL5KslTcr/pFJ2FwkV2ruUtW+ZkED7WzkP7a
 PZBUtI028M1O0CXqiW8PR/Qv1+Jiswts+praZ84fCW9UDQi38WV7KUrkUAsD52GO
 ANr69U3a757v7yiapauYkeTCCPx/fB6lLQaG0t6wBAZTnxku/t3YjIYCOYRu9Odi
 TmusQ==
X-ME-Sender: <xms:I658aLFfDU_lRkbeyjzFS4MLSI3ltajoxXPN9qY7Gypkfzx-IiQqww>
 <xme:I658aI80usISo-uk1M8X-4TbcNcuCAxUhBNKjbzBJiGwFP2LWzzETxDMBNSFA8rEU
 HX3okFzBjHJO-UX6g>
X-ME-Received: <xmr:I658aISq5gDdU-Hl_PQwNeNaPYJ5Y6YZQd7U4x1r-i6wDhZ-enG9w2JsP3otYQjiAV0-rlDpWBCUn9ZHiX2guxGWzrhYGw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeikeejjecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
 hrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefthigrnhcuhggr
 lhhklhhinhcuoehrhigrnhesthgvshhtthhorghsthdrtghomheqnecuggftrfgrthhtvg
 hrnhepffehieffgedtgfffjeetveegfeekleeileekveeuteffteetudffveegieeiheet
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprhihrg
 hnsehtvghsthhtohgrshhtrdgtohhmpdhnsggprhgtphhtthhopeduhedpmhhouggvpehs
 mhhtphhouhhtpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtth
 hopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgu
 theskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfigvnhhssegtshhivgdrohhrghdprh
 gtphhtthhopehjvghrnhgvjhdrshhkrhgrsggvtgesghhmrghilhdrtghomhdprhgtphht
 thhopehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgpdhrtghpthhtoheprghnughrvg
 drphhriiihfigrrhgrsegrrhhmrdgtohhmpdhrtghpthhtohepmhgrtghrohgrlhhphhgr
 kedvsehgmhgrihhlrdgtohhmpdhrtghpthhtohepkhhikhhutghhrghnleeksehgmhgrih
 hlrdgtohhm
X-ME-Proxy: <xmx:I658aNo8xGM9PcnousEhRvcUmyBWMZ9LI_6whZ1TFC6r7xBlP5zGKQ>
 <xmx:I658aFMk5aHfJbEBSW24g8nMAoJVenDjuyyK7yVYW_mKNdKqQfN0Ow>
 <xmx:I658aDyRCFg_OcWSEI8HlHVbcYG5eIs8BeRly3AVF2-9BQPNo1jtng>
 <xmx:I658aJz89_gaWU2IZIOD0SUE5bBbfUvBe3uK66xdZm_Lx70TNjtdiw>
 <xmx:I658aOcfFawIgoFSDCPQZ6GCol6tjQcdXTq5Je5DVHnTkGcB1IuywsxV>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 20 Jul 2025 04:51:43 -0400 (EDT)
From: Ryan Walklin <ryan@testtoast.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
 Chris Morgan <macroalpha82@gmail.com>,
 Hironori KIKUCHI <kikuchan98@gmail.com>,
 Philippe Simons <simons.philippe@gmail.com>, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH v2 07/12] drm/sun4i: tcon: add support for R40
Date: Sun, 20 Jul 2025 20:48:45 +1200
Message-ID: <20250720085047.5340-8-ryan@testtoast.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250720085047.5340-1-ryan@testtoast.com>
References: <20250720085047.5340-1-ryan@testtoast.com>
MIME-Version: 1.0
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

From: Jernej Skrabec <jernej.skrabec@gmail.com>

The Allwinner H616 and related SOCs have an LCD timing controller
(TCON) which is compatible with the R40 SOC's controller and existing
sun4i driver. The H616 does not expose this controller but the H700 and
T507 (based on the same die) do. The controller supports LVDS and RGB
output.

Add quirks and compatible string to cover these SOCs.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
---
 drivers/gpu/drm/sun4i/sun4i_tcon.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
index 960e83c8291d..8cc8488483ec 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
@@ -1514,6 +1514,14 @@ static const struct sun4i_tcon_quirks sun8i_a83t_tv_quirks = {
 	.has_channel_1		= true,
 };
 
+static const struct sun4i_tcon_quirks sun8i_r40_lcd_quirks = {
+	.supports_lvds		= true,
+	.has_channel_0		= true,
+	.set_mux		= sun8i_r40_tcon_tv_set_mux,
+	.dclk_min_div		= 1,
+	.setup_lvds_phy		= sun6i_tcon_setup_lvds_phy,
+};
+
 static const struct sun4i_tcon_quirks sun8i_r40_tv_quirks = {
 	.has_channel_1		= true,
 	.polarity_in_ch0	= true,
@@ -1555,6 +1563,7 @@ const struct of_device_id sun4i_tcon_of_table[] = {
 	{ .compatible = "allwinner,sun8i-a33-tcon", .data = &sun8i_a33_quirks },
 	{ .compatible = "allwinner,sun8i-a83t-tcon-lcd", .data = &sun8i_a83t_lcd_quirks },
 	{ .compatible = "allwinner,sun8i-a83t-tcon-tv", .data = &sun8i_a83t_tv_quirks },
+	{ .compatible = "allwinner,sun8i-r40-tcon-lcd", .data = &sun8i_r40_lcd_quirks },
 	{ .compatible = "allwinner,sun8i-r40-tcon-tv", .data = &sun8i_r40_tv_quirks },
 	{ .compatible = "allwinner,sun8i-v3s-tcon", .data = &sun8i_v3s_quirks },
 	{ .compatible = "allwinner,sun9i-a80-tcon-lcd", .data = &sun9i_a80_tcon_lcd_quirks },
-- 
2.50.1

