Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5851C7E8A55
	for <lists+dri-devel@lfdr.de>; Sat, 11 Nov 2023 11:43:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C898010E269;
	Sat, 11 Nov 2023 10:42:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE16010E268
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Nov 2023 10:42:42 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-9e62b14c9eeso215494266b.2
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Nov 2023 02:42:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1699699361; x=1700304161;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZuBW6agG70lIoCkGnVCWEFfcl6uwNB9B1+pa2Yxc8Go=;
 b=rYNHWJ0/1esf5wvZn2FPe9sPoa5GILSFRNt0tByOJCm7ZlRiONu4lI0I11IwxB0TxR
 JUlUBkHUBJtBZgEDm0fmN05UnAwUh509kDR1o/hB+/sj+14RDV6fO8H9bTyK8M/IjxSH
 Lu6eUzoW5K+BSS7MXrSL8zjtQrrv5rYMLU4HM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699699361; x=1700304161;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZuBW6agG70lIoCkGnVCWEFfcl6uwNB9B1+pa2Yxc8Go=;
 b=QFbcmD8L8lcWxZz7bKI8bL4cmrrqaaDV72/ADmCf956bKvEp2FdF0xUfCK9obaOLXK
 yB362hg7xLPdcMdC/ZE+zGHaZQ1re1Sna2UAAShOw/Fc/3DaO8Gdfb6V3QiPLrzJ9GKE
 6/kBRZh5QWzJw19ghVse6tOy9gUs0UhhO8hcy5NfkmGlVcORQF5xX/U2a16psKf5Y6aY
 AzeSbtru7N80ey+uyKAW1kAt/schTJq2rKzf2lStkP/HvyB5kgZpccwvtEvjcG6vkFPG
 vyL9EazFWAVXq/v1k4zSB+tHOmqnHTRibN6+Qx7TexyFtbuHLJDDJHA4D5ZOVXJD04nj
 f1Vg==
X-Gm-Message-State: AOJu0YyBRiYf42jjtVsm/MpQx1xScA/fJlJIJ15WJhECI4/v+1HOSyyq
 CanLGCuxcRtWzYAbihpnicFdyQ==
X-Google-Smtp-Source: AGHT+IFbVhFnBfDEfeThETUmx79l/FqCUdUKdBP1kZUSVO8UVeOwurpqW+LCgtJFLlAn08avd0DyXw==
X-Received: by 2002:a17:906:3c9:b0:9e6:59d5:7a86 with SMTP id
 c9-20020a17090603c900b009e659d57a86mr915376eja.57.1699699361285; 
 Sat, 11 Nov 2023 02:42:41 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-20-97-182.retail.telecomitalia.it. [79.20.97.182])
 by smtp.gmail.com with ESMTPSA id
 ga33-20020a1709070c2100b0099e12a49c8fsm872183ejc.173.2023.11.11.02.42.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Nov 2023 02:42:41 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 04/10] fbdev: imxfb: replace some magic numbers with constants
Date: Sat, 11 Nov 2023 11:41:53 +0100
Message-ID: <20231111104225.136512-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231111104225.136512-1-dario.binacchi@amarulasolutions.com>
References: <20231111104225.136512-1-dario.binacchi@amarulasolutions.com>
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
Cc: linux-fbdev@vger.kernel.org, linux-amarula@amarulasolutions.com,
 Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The patch gets rid of magic numbers replacing them with appropriate
macros.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 drivers/video/fbdev/imxfb.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/video/fbdev/imxfb.c b/drivers/video/fbdev/imxfb.c
index b7ef43a7930a..485e57fa9389 100644
--- a/drivers/video/fbdev/imxfb.c
+++ b/drivers/video/fbdev/imxfb.c
@@ -89,6 +89,7 @@ struct imx_fb_videomode {
 #define PCR_BPIX_12	4
 #define PCR_BPIX_16	5
 #define PCR_BPIX_18	6
+#define PCR_PCD_MASK	GENMASK(5, 0)
 
 #define LCDC_HCR	0x1C
 #define HCR_H_WIDTH_MASK	GENMASK(31, 26)
@@ -414,8 +415,8 @@ static int imxfb_check_var(struct fb_var_screeninfo *var, struct fb_info *info)
 
 	pcr = (unsigned int)tmp;
 
-	if (--pcr > 0x3F) {
-		pcr = 0x3F;
+	if (--pcr > PCR_PCD_MASK) {
+		pcr = PCR_PCD_MASK;
 		printk(KERN_WARNING "Must limit pixel clock to %luHz\n",
 				lcd_clk / pcr);
 	}
@@ -444,7 +445,7 @@ static int imxfb_check_var(struct fb_var_screeninfo *var, struct fb_info *info)
 	}
 
 	/* add sync polarities */
-	pcr |= imxfb_mode->pcr & ~(0x3f | (7 << 25));
+	pcr |= imxfb_mode->pcr & ~(PCR_PCD_MASK | PCR_BPIX_MASK);
 
 	fbi->pcr = pcr;
 	/*
-- 
2.42.0

