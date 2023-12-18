Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D00817B19
	for <lists+dri-devel@lfdr.de>; Mon, 18 Dec 2023 20:36:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8693110E2C4;
	Mon, 18 Dec 2023 19:35:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FF8B10E2C4
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 19:33:45 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4Sv16y72qnz9snW;
 Mon, 18 Dec 2023 14:35:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oltmanns.dev;
 s=MBO0001; t=1702906555;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=tos2FwQlFwhzvaXEQTYM8a4T8bK+EoPuJg3G1O90NAc=;
 b=Fl4x0IcJYh9uwO1wNscgM7PXzen4xdJv0zkHkRoA8bMKdQpP9Yb4evGFvDqNTzWSXpg8kp
 l4LY/6hwrN3hBJNUTRQqM/2+1saX9qBfPA7U/CqG/RzepxnjiAEzE0ONFvQ7Gy3PMOm39+
 sXEyC8LMThAkARo0YuQw/AopJy0RtFyIoIdN0P0+rg/1nuUdhrsPAeAf89ghDCLPhLnkVR
 1CJtSGYpb2O818tAGiEnSEP+RdtGUHXbtnRAv3FTh/84jFw5VH6+HKVUSZ1wqCXDDkh4+0
 AYmfaLpT2t9iU0jnqeBMHHnabnNgFoUwKCsYuyejIy15q1gpb8KnFPTVHl+gzw==
From: Frank Oltmanns <frank@oltmanns.dev>
Subject: [PATCH 0/5] Pinephone video out fixes (flipping between two
 frames)
Date: Mon, 18 Dec 2023 14:35:18 +0100
Message-Id: <20231218-pinephone-pll-fixes-v1-0-e238b6ed6dc1@oltmanns.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJZKgGUC/x3LQQqAIBBG4avErBtIDYquEi1Cf2sgVBQikO6et
 Px4vEoFWVBo6Spl3FIkhgbVd2TPPRxgcc2kB22UVjMnCUhnDOB0XezlQeHBWucd9GQwUjtTxh/
 auG7v+wHb/Xl3ZQAAAA==
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
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Developer-Signature: v=1; a=openpgp-sha256; l=2183; i=frank@oltmanns.dev;
 h=from:subject:message-id; bh=olgN/dTexxSci4bqC/SYnH4Qe3D2ahceKuSWI8wI15w=;
 b=owEB7QES/pANAwAIAZppogiUStPHAcsmYgBlgEq04Zmk0Dn4zmQRslaV0ONyjY0uQhR1xoFlA
 vkMMXKgseaJAbMEAAEIAB0WIQQC/SV7f5DmuaVET5aaaaIIlErTxwUCZYBKtAAKCRCaaaIIlErT
 xypkC/4vBt6X+ZMcmFfqSZYPKcB1uMlq3fPUGuL3OQ8RVbGGg1oMRwBjyD2inb3eaSeHLBuhwwu
 uhjngKAE/R2HUtZnnj/0DLJpJ0p2a/tkDgybA6PZQ3y0hfLgMOb5/fv/aRErnxghSnNEFbcUDMB
 d8C+xiFEougioK35GpWb8LNb3QRdXm0W9+CTdjjVxv50Csy8RI1SeBGwnz1zMtMTZN5RlgeWFG2
 1GQU2wQABJEDqbdXg1Lr95BGKVgh3I1K2s5PkvqTBuEOzlfB0yJ6skd+ntb0D0hZqAwIK9WcjUT
 f/wzbaGMBrShGb6mVtsX2so96vQr8avsXamOb5XO13XTmN6v1QAfoDeXpiYXMYlnf8iPRurj6jk
 rEzFf6/XrcOUP48rybQOyYCkVw3Ga+TyXTtBN54NWIo8w28TuHGfFs4JtOW93SHQuViDmkDtZqf
 ARyJ0gEOu59hLRUxYwcPmVf+A5toFaw/UyUJx1lZZ6k5RHoQZwL6H4YtVnHtOA2gxOHzk=
X-Developer-Key: i=frank@oltmanns.dev; a=openpgp;
 fpr=02FD257B7F90E6B9A5444F969A69A208944AD3C7
X-Rspamd-Queue-Id: 4Sv16y72qnz9snW
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Frank Oltmanns <frank@oltmanns.dev>, linux-sunxi@lists.linux.dev,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On some pinephones the video output sometimes freezes (flips between two
frames) [1]. It seems to be that the reason for this behaviour is that
PLL-MIPI and PLL-VIDEO0 are operating outside there specified limits.

The changes I propose in this patch series consists of two major parts:
  1. sunxi-ng: Adhere to the following constraints given in the
     Allwinner A64 Manual:
      a. PLL-MIPI:
          * M/N >= 3
          * (PLL_VIDEO0)/M >= 24MHz
      b. PLL-VIDEO0:
          * 8 <= N/M <= 25

  2. Choose a higher clock rate for the ST7703 based XDB599 panel, so
     that the panel functions with the Allwinner A64 SOC. PLL-MIPI
     must run between 500 MHz and 1.4 GHz. As PLL-MIPI runs at 6 times
     the panel's clock rate, we need its clock to be at least 83.333
     MHz.

So far, I've tested the patches only on my pinephone. Before the patches
it would freeze at least every other day. With the patches it has not
shown this behavior in over a week.

I very much appreciate your feedback!

[1] https://gitlab.com/postmarketOS/pmaports/-/issues/805

Signed-off-by: Frank Oltmanns <frank@oltmanns.dev>
---
Frank Oltmanns (5):
      clk: sunxi-ng: nkm: Support constraints on m/n ratio and parent rate
      clk: sunxi-ng: a64: Add constraints on PLL-MIPI's n/m ratio and parent rate
      clk: sunxi-ng: nm: Support constraints on n/m ratio and parent rate
      clk: sunxi-ng: a64: Add constraints on PLL-VIDEO0's n/m ratio
      drm/panel: st7703: Drive XBD599 panel at higher clock rate

 drivers/clk/sunxi-ng/ccu-sun50i-a64.c         | 10 ++++++--
 drivers/clk/sunxi-ng/ccu_nkm.c                | 23 ++++++++++++++++++
 drivers/clk/sunxi-ng/ccu_nkm.h                |  8 +++++++
 drivers/clk/sunxi-ng/ccu_nm.c                 | 21 +++++++++++++++--
 drivers/clk/sunxi-ng/ccu_nm.h                 | 34 +++++++++++++++++++++++++--
 drivers/gpu/drm/panel/panel-sitronix-st7703.c | 14 +++++------
 6 files changed, 97 insertions(+), 13 deletions(-)
---
base-commit: d0ac5722dae5f4302bb4ef6df10d0afa718df80b
change-id: 20231218-pinephone-pll-fixes-0ccdfde273e4

Best regards,
-- 
Frank Oltmanns <frank@oltmanns.dev>

