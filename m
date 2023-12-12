Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF7080E2CF
	for <lists+dri-devel@lfdr.de>; Tue, 12 Dec 2023 04:33:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38D3810E147;
	Tue, 12 Dec 2023 03:33:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7808B10E147
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Dec 2023 03:33:15 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id
 ca18e2360f4ac-7b7020f03c9so214379639f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 19:33:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702351994; x=1702956794; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3W+vl1pPQ5xbJbOBYqTUjLnDDv5t03VNIfECEsk3uHs=;
 b=hjKvtY8ZT3s/npSoq1UfxJHB81LCY32JSg8WliMmUuDztcZh0DJHuZOsEFAf7lPAY5
 qxm5p7ObNbKkQIhlkC+XBVpuD9cImQtOFJOHzH4reNQW4OwouoVPJUdHZf1iBFHv1TXK
 S/enTGAdp1gMOm5ezScQtQ2iTnu870UFpAVt8RNDTfiFu9hel36vaYYVmKJqEQS0I2p+
 1iJMug1uLxShIQdmITx8SERSc+EjqKK2jzEk5ghp4o1FKpQczpJ/gpAkjEyO91IIsC57
 aOdrW1k+iVWDBK8sz5RBuMT/fU7TKtgYCXd2kVxcBL8nkKTEl9+dC+hUkTlOffPvL0H4
 G9qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702351994; x=1702956794;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3W+vl1pPQ5xbJbOBYqTUjLnDDv5t03VNIfECEsk3uHs=;
 b=wRZwa3R9D00w6iGd2vtkzCdQX3YemDTfKo3BprEvsixB0e2sQGJPvuXvvaNFJ210UZ
 X8+JKgFbXZULtjXv+q2wjVPghA64Bwy8N2PTcYf1pPavgkyeqzIOru8BuxT1nyDx8okd
 L1Kde1ZF+igvyKa7DXEHB8+QDUKQ6QsgFcN+1yUvATSh1Gxb/v6vYJWiBvHUloOEIU0M
 bB1zy9ByWjwyuZocSPj89Z8bDbPsbJ+h0+Iq9sNbOpRwlvq8cXOv7Cr45LcsNmhWn9G4
 k25ISTGioEh6JPpE7ce5cZLrSjmMQESntpFN8BqJXZUDmicQdfyQJQDQ8NamGyfDoHqC
 thhQ==
X-Gm-Message-State: AOJu0YzIc8UhKVE4ACXv/YevaRy8VadicfTJgzsRFEL7FXL9m9gB8bUm
 6+Jxot9yYScbbQltCLSuegn+Iu5SFZF7vA==
X-Google-Smtp-Source: AGHT+IEQ2n6XFLN8H7+WSHX07ery6GbeFJs7zpiGoluH51/YRfXyjf+FLjsQ2RJap6WxnQE6JL1qIg==
X-Received: by 2002:a05:6602:274d:b0:7b7:e9f:b93f with SMTP id
 b13-20020a056602274d00b007b70e9fb93fmr6164628ioe.0.1702351994112; 
 Mon, 11 Dec 2023 19:33:14 -0800 (PST)
Received: from aford-System-Version.lan
 ([2601:447:d002:5be:6068:4690:ab38:4373])
 by smtp.gmail.com with ESMTPSA id
 y23-20020a5e8717000000b007b457153a6bsm2590049ioj.28.2023.12.11.19.33.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Dec 2023 19:33:13 -0800 (PST)
From: Adam Ford <aford173@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/bridge: samsung-dsim: Set P divider based on min/max
 of fin pll
Date: Mon, 11 Dec 2023 21:32:58 -0600
Message-Id: <20231212033259.189718-1-aford173@gmail.com>
X-Mailer: git-send-email 2.40.1
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
Cc: Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, aford@beaconembedded.com,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Marco Felsch <m.felsch@pengutronix.de>,
 Michael Tretter <m.tretter@pengutronix.de>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Adam Ford <aford173@gmail.com>,
 linux-kernel@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The P divider should be set based on the min and max values of
the fin pll which may vary between different platforms.
These ranges are defined per platform, but hard-coded values
were used instead which resulted in a smaller range available
on the i.MX8M[MNP] than what was possible.

Fixes: 846307185f0f ("drm/bridge: samsung-dsim: update PLL reference clock")
Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index be5914caa17d..239d253a7d71 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -573,8 +573,8 @@ static unsigned long samsung_dsim_pll_find_pms(struct samsung_dsim *dsi,
 	u16 _m, best_m;
 	u8 _s, best_s;
 
-	p_min = DIV_ROUND_UP(fin, (12 * MHZ));
-	p_max = fin / (6 * MHZ);
+	p_min = DIV_ROUND_UP(fin, (driver_data->pll_fin_max * MHZ));
+	p_max = fin / (driver_data->pll_fin_min * MHZ);
 
 	for (_p = p_min; _p <= p_max; ++_p) {
 		for (_s = 0; _s <= 5; ++_s) {
-- 
2.40.1

