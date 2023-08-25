Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC85787F4E
	for <lists+dri-devel@lfdr.de>; Fri, 25 Aug 2023 07:37:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B849110E0F1;
	Fri, 25 Aug 2023 05:37:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E5CF10E0F1
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 05:37:19 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:b231:465::202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4RX7xl3YrDz9sbM;
 Fri, 25 Aug 2023 07:37:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oltmanns.dev;
 s=MBO0001; t=1692941835;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CtWNv86caywaEjwkohWs7vAaLBc1+BjOtBhmNdab+kQ=;
 b=LG9UBsKqOdgerrl9ZSTlYYJMPV7TR0xfA8XVmV5w0WgciQAtaR81Q7SkccExCNQ5PLrBjJ
 V93VXat6yB8Ox97X2rvzi2mGxyvAezSdAljZ0BqSK4fskRQwxOvp54t6NwrltIwWL9EAgy
 d4h4VJhgj2utNexNEHsa4XQrG3nwlFWHQDNsUl9C3jOovOlm88UDCJw0Ly3dnEV81aFTci
 a9ZqisdWAPR2iCBa/i8WJJZFPyOFufL8DOLzeQlaP802IkiF7++cpNopubYtRvE8uq2GwT
 yrN2/CRw3Xp/P8/D4/sh/AeXiCQus4HzQD948HRj81ddyYdhU1anXaWNo1xWAg==
From: Frank Oltmanns <frank@oltmanns.dev>
Date: Fri, 25 Aug 2023 07:36:38 +0200
Subject: [PATCH 2/3] clk: sunxi-ng: a64: keep rate of pll-mipi stable
 across parent rate changes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230825-pll-mipi_keep_rate-v1-2-35bc43570730@oltmanns.dev>
References: <20230825-pll-mipi_keep_rate-v1-0-35bc43570730@oltmanns.dev>
In-Reply-To: <20230825-pll-mipi_keep_rate-v1-0-35bc43570730@oltmanns.dev>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Ondrej Jirman <x@xnux.eu>, Icenowy Zheng <uwu@icenowy.me>
X-Developer-Signature: v=1; a=openpgp-sha256; l=956; i=frank@oltmanns.dev;
 h=from:subject:message-id; bh=zvqbUzAjOYwvk01SnxhIMjoc57Uv6Z82bewdgKFVkGA=;
 b=owEB7QES/pANAwAIAZppogiUStPHAcsmYgBk6D3/p5Vr8PmaxXx3YvNoCgTBhkxHsGUS++j05
 QkLFWRynMSJAbMEAAEIAB0WIQQC/SV7f5DmuaVET5aaaaIIlErTxwUCZOg9/wAKCRCaaaIIlErT
 x6A8C/9laYi7uMdpPfGT4cEdfSPWzp/olospIp/RZ7V6kkvJgaNGwYq70JKvfZLou03/1Mq9Fkb
 f3v0knivK0Vb8eYtPwl0g94hJp5UcQqZAFL9nGqX8bKz54brnriMyI1tp2LhBT6mMwisSkfWVLJ
 zhy0ublVtldseV9rqWdyrNRnAnj72ycrFmZpcWabADZDrYY4XwziwFMfD8EMoxq0lsn06pSVpKv
 gcEif70O6HXzmle+IRwUI2twW1ann6RJgm7GqkU7BbmmOixFaQ/eDRjqRFTT2dnZblNcP1ceDKf
 rzY+udlH7xcBL5ZE63JubDUt4D2yg3Kx6GlHWBQ5rr5pM70D9oOEDyxTBZGX3/kNpPuy8oCzR+Z
 sAY+IrPCnrNvGiRgiE8FNMc9zEV5F32eWwpOqf7S63NQiSfDP6T72cmtup00nJ/2QaUL7ZCnsUt
 zWc5Cj3KvY1NgjWukfkTcRC+v60m0Z0cQIJ26Q2CMgevyriWW1r+toyPYhQDUMeJyIN1M=
X-Developer-Key: i=frank@oltmanns.dev; a=openpgp;
 fpr=02FD257B7F90E6B9A5444F969A69A208944AD3C7
X-Rspamd-Queue-Id: 4RX7xl3YrDz9sbM
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
Cc: linux-kernel@vger.kernel.org, Frank Oltmanns <frank@oltmanns.dev>,
 dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Keep the clock rate of Allwinner A64's pll-mipi even when the parent
(pll-video0) changes its rate. This is required, to drive both an LCD
and HDMI display, because both have pll-video0 as an ancestor.

Signed-off-by: Frank Oltmanns <frank@oltmanns.dev>
---
 drivers/clk/sunxi-ng/ccu-sun50i-a64.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-a64.c b/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
index 8951ffc14ff5..d22094ce1d66 100644
--- a/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
+++ b/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
@@ -180,7 +180,8 @@ static struct ccu_nkm pll_mipi_clk = {
 		.reg		= 0x040,
 		.hw.init	= CLK_HW_INIT("pll-mipi", "pll-video0",
 					      &ccu_nkm_ops,
-					      CLK_SET_RATE_UNGATE | CLK_SET_RATE_PARENT),
+					      CLK_SET_RATE_UNGATE | CLK_SET_RATE_PARENT |
+					      CLK_KEEP_RATE),
 		.features	= CCU_FEATURE_CLOSEST_RATE,
 	},
 };

-- 
2.41.0

