Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2150386FABF
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 08:30:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 280E110FDA6;
	Mon,  4 Mar 2024 07:30:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oltmanns.dev header.i=@oltmanns.dev header.b="GMJy/Frx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A0C810FDA7
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 07:30:04 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4Tp9MD5Wltz9sp7;
 Mon,  4 Mar 2024 08:30:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oltmanns.dev;
 s=MBO0001; t=1709537400;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=NoCsY0uVPieE3Bki0yClO1kq6+DglOQe3SGQtQLnjtI=;
 b=GMJy/FrxoUhe66dmuSip7yLhn85T8/o5Pw4MZOhYaDRt4ckcRkuULKweChYZaDXWdhgr6I
 4O4PnCij30/5YG9dfZOrjrM0fRaJcwH8MzZQOStZtmUi5+p8V/Q6Ej94Gzg3cEVOw7HD43
 NrTBoWAVzbFhXlOm9EiElTj9Jyilj9WqnhImvbYxcRxTiRWlBbekJ3xdknOio5IvDB1Ugb
 61WmDNptyR0lsWVIQuLDEnpHHPjSNd4OToqrfY2m4Plg2z6wRVzH66HE54qps5JNCE3xkk
 O10pyaI3h4yANsmY7yeqrFcQEzBnnwnMUIo9965KXqmUr10WxIE8qFKtsAbdbQ==
From: Frank Oltmanns <frank@oltmanns.dev>
Subject: [PATCH v3 0/5] Pinephone video out fixes (flipping between two frames)
Date: Mon, 04 Mar 2024 08:29:16 +0100
Message-Id: <20240304-pinephone-pll-fixes-v3-0-94ab828f269a@oltmanns.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEx45WUC/33NQQ7CIBAF0Ks0rMXAULHtynsYFxSmlqQCgYZom
 t5d2sSNMS7/n/w3C0kYLSbSVQuJmG2y3pUgDhXRo3J3pNaUTICB4MAbGqzDMHqHNEwTHewTE2V
 am8EgnAXWpCxDxP1QhtdbyaNNs4+v/UnmW/vfy5wyiiCaXqKRRvOLn+aHci4dDWaykRk+TM2An
 X4zUJhWqloqMI1u+y9mXdc3KDivswABAAA=
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
 Frank Oltmanns <frank@oltmanns.dev>, stable@vger.kernel.org, 
 Diego Roversi <diegor@tiscali.it>
X-Developer-Signature: v=1; a=openpgp-sha256; l=3360; i=frank@oltmanns.dev;
 h=from:subject:message-id; bh=Gjmx1LoCeFmH3HZQN2zSbyKOB5bSkpnKc14O2QudTyc=;
 b=owEB7QES/pANAwAIAZppogiUStPHAcsmYgBl5XhwsffaJUTjKesrQMFXm9SL0rmYfvGrVtp+e
 o8WbpVFG1iJAbMEAAEIAB0WIQQC/SV7f5DmuaVET5aaaaIIlErTxwUCZeV4cAAKCRCaaaIIlErT
 xw1JC/4s83wVFPqgCyLwlwxOrDIhPUUecHpIS8lGXewEMxp/h32L7wyzeW+UxwBCskTIPbbSgZk
 PYfNUZpk7IOalDYXZMfQeR1HW0oMPQBTS7/YbjMmwz5NB1KpK/WMQ/FJRBI/Xpts4eLjCtPFWAm
 IyaKjK3f+niwlnuRdV5pVlgkxg+jhj+TueaP1b+DAJOYFWdMzIk+V/hKwPi680FEqLvIwdK9+Ut
 ByYnzM1BZlYBgy2jUc8b44dTZ5/OvVkRwX1ZAQGBLZwLwPCTjR3tejhmmNBtx8XxioAAVzBU4b2
 9xbRYfAyPxfqToJx0nshopXEPRsotlDyVJxORuZE1fJkT/wTvKk8JlOWZhnmeAqBxBw4Dh6id3P
 vmIQAGU95RWoj6PUm5IcZcMQp70f9RZSMD35KLwXRtpG/y4jWWzQqaRHzsRXvSwJwKp7c9k+EjJ
 W5CwokuXlcyh+nHidpUSJK9Sck0/D8Rji7HxtSXhDkQ3RkQDPwJn+CaEjgqqchZP5qaTI=
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

On some pinephones the video output sometimes freezes (flips between two
frames) [1]. It seems to be that the reason for this behaviour is that
PLL-MIPI is outside its limits, and the GPU is not running at a fixed
rate.

In this patch series I propose the following changes:
  1. sunxi-ng: Adhere to the following constraints given in the
     Allwinner A64 Manual regarding PLL-MIPI:
      * M/N <= 3
      * (PLL_VIDEO0)/M >= 24MHz
      * 500MHz <= clockrate <= 1400MHz

  2. Remove two operating points from the A64 DTS OPPs, so that the GPU
     runs at a fixed rate of 432 MHz.

Note, that when pinning the GPU to 432 MHz the issue [1] completely
disappears for me. I've searched the BSP and could not find any
indication that supports the idea of having the three OPPs. The only
frequency I found in the BPSs for A64 is 432 MHz, which has also proven
stable for me.

Another bigger change compared to the previous version is that I've
removed the patch to adapt the XBD599 panel's timings to Allwinner A64's
PLL-MIPI new constraints from this series. Mainly, because I'm currently
evaluationg other options that may or may not work. (It may work at
least until HDMI support is upstreamed.) I'll probably resend the patch
at a later point in time.

I very much appreciate your feedback!

[1] https://gitlab.com/postmarketOS/pmaports/-/issues/805

Signed-off-by: Frank Oltmanns <frank@oltmanns.dev>
---
Changes in v3:
- dts: Pin GPU to 432 MHz.
- nkm and a64: Move minimum and maximum rate handling to the common part
  of the sunxi-ng driver.
- Removed st7703 patch from series.
- Link to v2: https://lore.kernel.org/r/20240205-pinephone-pll-fixes-v2-0-96a46a2d8c9b@oltmanns.dev

Changes in v2:
- dts: Increase minimum GPU frequency to 192 MHz.
- nkm and a64: Add minimum and maximum rate for PLL-MIPI.
- nkm: Use the same approach for skipping invalid rates in
  ccu_nkm_find_best() as in ccu_nkm_find_best_with_parent_adj().
- nkm: Improve names for ratio struct members and hence get rid of
  describing comments.
- nkm and a64: Correct description in the commit messages: M/N <= 3
- Remove patches for nm as they were not needed.
- st7703: Rework the commit message to cover more background for the
  change.
- Link to v1: https://lore.kernel.org/r/20231218-pinephone-pll-fixes-v1-0-e238b6ed6dc1@oltmanns.dev

---
Frank Oltmanns (5):
      clk: sunxi-ng: common: Support minimum and maximum rate
      clk: sunxi-ng: a64: Set minimum and maximum rate for PLL-MIPI
      clk: sunxi-ng: nkm: Support constraints on m/n ratio and parent rate
      clk: sunxi-ng: a64: Add constraints on PLL-MIPI's n/m ratio and parent rate
      arm64: dts: allwinner: a64: Run GPU at 432 MHz

 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi |  8 --------
 drivers/clk/sunxi-ng/ccu-sun50i-a64.c         | 14 +++++++++-----
 drivers/clk/sunxi-ng/ccu_common.c             | 15 +++++++++++++++
 drivers/clk/sunxi-ng/ccu_common.h             |  3 +++
 drivers/clk/sunxi-ng/ccu_nkm.c                | 21 +++++++++++++++++++++
 drivers/clk/sunxi-ng/ccu_nkm.h                |  2 ++
 6 files changed, 50 insertions(+), 13 deletions(-)
---
base-commit: 216c1282dde38ca87ebdf1ccacee5a0682901574
change-id: 20231218-pinephone-pll-fixes-0ccdfde273e4

Best regards,
-- 
Frank Oltmanns <frank@oltmanns.dev>

