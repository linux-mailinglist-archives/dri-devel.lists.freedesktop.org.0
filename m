Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5274A7E8A44
	for <lists+dri-devel@lfdr.de>; Sat, 11 Nov 2023 11:42:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7604210E265;
	Sat, 11 Nov 2023 10:42:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 167C310E265
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Nov 2023 10:42:40 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-53de8fc1ad8so4502611a12.0
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Nov 2023 02:42:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1699699358; x=1700304158;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cv+Nw99h5TQ+ZdPAOUHCJ7Is/AuyKPzv38qwm03SYTY=;
 b=EvINVtSlff9bpXj7myTl2NNrdjqyEIUIn3FhlYbLMWE7w01FC/lSV/XYtJxQJ0l+Xg
 5KOT8zBiWLBZ0at1pVmeRDNLixT6QSC+azZgZWk/Jagh2PZnvbgtlIIjYYbDuKr+xEt3
 Ty7zmr1H6Vx35o5bj18j3hxd6mpMyJzEXd7UI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699699358; x=1700304158;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cv+Nw99h5TQ+ZdPAOUHCJ7Is/AuyKPzv38qwm03SYTY=;
 b=gvKXyevRhUD1SOIBN/RC4A55X7XmyTX8khFWL16mxGtC9Z+MkJdUnzpZUZ/5KE0Tt7
 vTAD1GJ1Ups/kHGBm2x5a0CUwSlFdIn5Gjv6WzAvf4F95n8Ix+ll0qlLRBWJGu+QKv9R
 AhJbrNylmxdNBCeMFxBWpVZAVQAu0ee3DaR08ig70a860Eh+/KhvWz85G7yQMU55JoA+
 Kx9+wHwNeHBIfbpcg3DNA6a7zDiWbDIA48Uz6WVSJnX5uzjmB63JDOGCL15wXwRP2NYW
 z7Exrd5uEFRRDEODr+gZAfdf2ZGHlj1SFReM/O2ZSLW1fBklVaEQEKa/tYH4xDGQKcqk
 EhwQ==
X-Gm-Message-State: AOJu0YzpFhkU4nVhR5y8GdvnkSJ5HZGEgZL+X5SXqvosy0m04taNc1eJ
 H0VOF196Fqe4ntTh8cNcud0jqA==
X-Google-Smtp-Source: AGHT+IGV/oLH/5lcH7sOkoekG3D+ekNeJmSBIhCHEhoX0aYsTwH02HKUCdbRojD3+VixFTGso1kIJg==
X-Received: by 2002:a17:906:fc0a:b0:9e0:5d5c:aa81 with SMTP id
 ov10-20020a170906fc0a00b009e05d5caa81mr1063698ejb.27.1699699358600; 
 Sat, 11 Nov 2023 02:42:38 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-20-97-182.retail.telecomitalia.it. [79.20.97.182])
 by smtp.gmail.com with ESMTPSA id
 ga33-20020a1709070c2100b0099e12a49c8fsm872183ejc.173.2023.11.11.02.42.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Nov 2023 02:42:38 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 02/10] fbdev: imxfb: move PCR bitfields near their offset
Date: Sat, 11 Nov 2023 11:41:51 +0100
Message-ID: <20231111104225.136512-3-dario.binacchi@amarulasolutions.com>
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

The patch moves the bitfields of the PCR register near the macro that
defines its offset, just like for all the other registers.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 drivers/video/fbdev/imxfb.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/video/fbdev/imxfb.c b/drivers/video/fbdev/imxfb.c
index 7042a43b81d8..6af5f09d9c85 100644
--- a/drivers/video/fbdev/imxfb.c
+++ b/drivers/video/fbdev/imxfb.c
@@ -41,13 +41,6 @@
 #include <video/of_videomode.h>
 #include <video/videomode.h>
 
-#define PCR_TFT		(1 << 31)
-#define PCR_COLOR	(1 << 30)
-#define PCR_BPIX_8	(3 << 25)
-#define PCR_BPIX_12	(4 << 25)
-#define PCR_BPIX_16	(5 << 25)
-#define PCR_BPIX_18	(6 << 25)
-
 struct imx_fb_videomode {
 	struct fb_videomode mode;
 	u32 pcr;
@@ -88,6 +81,12 @@ struct imx_fb_videomode {
 #define LCDC_LCHCC	0x14
 
 #define LCDC_PCR	0x18
+#define PCR_TFT		(1 << 31)
+#define PCR_COLOR	(1 << 30)
+#define PCR_BPIX_8	(3 << 25)
+#define PCR_BPIX_12	(4 << 25)
+#define PCR_BPIX_16	(5 << 25)
+#define PCR_BPIX_18	(6 << 25)
 
 #define LCDC_HCR	0x1C
 #define HCR_H_WIDTH(x)	(((x) & 0x3f) << 26)
-- 
2.42.0

