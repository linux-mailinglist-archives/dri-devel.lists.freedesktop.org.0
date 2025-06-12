Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CEBBAD7A39
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 20:59:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A01DB10E152;
	Thu, 12 Jun 2025 18:59:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="XM21WvZ3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 490F510E12D
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 18:58:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1749754730; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=TRM8mOFWyaBYak++nZU8l9Lh9sNaOvaqbi+IF5KwOXAxpxEdhGnj1xHPo0BC8t9jwMsc9bX/n8u29ShdL0HXM2/KZSM6AifRSMqgUwexN+YhM7aeCbVbJShzARE4YkEzpYLZ5Kl1m5XncFNxaNW2TlIfz8bMHFHmUWtWiC97aWA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1749754730;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=40rYDysgIuUPOjEXjeVmWjUJjq2cy29Zm9mzxshoj3Q=; 
 b=eyNXOpLzG/KfGfQO4VVrBHoSStZG4ttQiQp3pf5y0tTiFbPx09TIH7qU1JY1Ukt6Z4f8vFGHQlc+pcugmiZctcmzwHuqHz5RNz4p72Jew++h8+/OXDSH+Xyy6r4Rtuycnl4JmsZQ67YaLGSpYcOaPW1FyrRNMi/XI1wpARBKEXo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1749754730; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=40rYDysgIuUPOjEXjeVmWjUJjq2cy29Zm9mzxshoj3Q=;
 b=XM21WvZ37+5lexo4sUsG3vQNVq/vd9yOHR5204FfyyT1AsygHfQnx7rmP30dSsCV
 gxz9M1jdmgWMM+DOtWyARQp9vl6GI3NO4/zPJEBCngqxsifVQJFImONiO6r9aufCazz
 n/10voaGC+YtJZJdXTRGZXwgCnTmvVrUrDtegWwQ=
Received: by mx.zohomail.com with SMTPS id 1749754729031715.0037807596458;
 Thu, 12 Jun 2025 11:58:49 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Thu, 12 Jun 2025 20:56:13 +0200
Subject: [PATCH 11/20] drm/rockchip: inno-hdmi: switch to HWORD_UPDATE
 macro
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-byeword-update-v1-11-f4afb8f6313f@collabora.com>
References: <20250612-byeword-update-v1-0-f4afb8f6313f@collabora.com>
In-Reply-To: <20250612-byeword-update-v1-0-f4afb8f6313f@collabora.com>
To: Yury Norov <yury.norov@gmail.com>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
 Jaehoon Chung <jh80.chung@samsung.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
 Shreeya Patel <shreeya.patel@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Shawn Lin <shawn.lin@rock-chips.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
 MyungJoo Ham <myungjoo.ham@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, Qin Jian <qinjian@cqplus1.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org, 
 linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-phy@lists.infradead.org, 
 linux-sound@vger.kernel.org, netdev@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-pci@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-clk@vger.kernel.org, llvm@lists.linux.dev, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2
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

The era of hand-rolled HIWORD_UPDATE macros is over, at least for those
drivers that use constant masks.

The inno-hdmi driver's own HIWORD_UPDATE macro is instantiated only
twice. Remove it, and replace its uses with HWORD_UPDATE. Since
HWORD_UPDATE shifts the value for us, we replace using the mask as the
value by simply using 1 instead.

With the new HWORD_UPDATE macro, we gain better error checking and a
central shared definition.

This has been compile-tested only as I lack hardware this old, but the
change is trivial enough that I am fairly certain it's equivalent.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/rockchip/inno_hdmi.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockchip/inno_hdmi.c
index db4b4038e51d5a963f9ddad568282485ed355040..ab6b1d91127885afe0f5e0feb265d6b7b02d88a7 100644
--- a/drivers/gpu/drm/rockchip/inno_hdmi.c
+++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/irq.h>
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/err.h>
@@ -31,8 +32,6 @@
 
 #include "inno_hdmi.h"
 
-#define HIWORD_UPDATE(val, mask)	((val) | (mask) << 16)
-
 #define INNO_HDMI_MIN_TMDS_CLOCK  25000000U
 
 #define RK3036_GRF_SOC_CON2	0x148
@@ -392,10 +391,10 @@ static int inno_hdmi_config_video_timing(struct inno_hdmi *hdmi,
 	int value, psync;
 
 	if (hdmi->variant->dev_type == RK3036_HDMI) {
-		psync = mode->flags & DRM_MODE_FLAG_PHSYNC ? RK3036_HDMI_PHSYNC : 0;
-		value = HIWORD_UPDATE(psync, RK3036_HDMI_PHSYNC);
-		psync = mode->flags & DRM_MODE_FLAG_PVSYNC ? RK3036_HDMI_PVSYNC : 0;
-		value |= HIWORD_UPDATE(psync, RK3036_HDMI_PVSYNC);
+		psync = mode->flags & DRM_MODE_FLAG_PHSYNC ? 1 : 0;
+		value = HWORD_UPDATE(RK3036_HDMI_PHSYNC, psync);
+		psync = mode->flags & DRM_MODE_FLAG_PVSYNC ? 1 : 0;
+		value |= HWORD_UPDATE(RK3036_HDMI_PVSYNC, psync);
 		regmap_write(hdmi->grf, RK3036_GRF_SOC_CON2, value);
 	}
 

-- 
2.49.0

