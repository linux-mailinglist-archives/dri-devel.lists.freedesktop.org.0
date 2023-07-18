Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 306827576E0
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 10:42:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13CA310E004;
	Tue, 18 Jul 2023 08:42:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4EB910E004
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 08:42:24 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3fbef8ad9bbso54003985e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 01:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=shruggie-ro.20221208.gappssmtp.com; s=20221208; t=1689669743; x=1692261743; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lsS2Iaqm2U2paaIACaH5afuQDHJxmglgO9qoIKv0pEA=;
 b=MBDlFtSo/of5p9ZelE58JuefVNUOWIvorbrubSBnVW4BlQlEH6Mw/KO3D5xPrkLvV5
 SjCuvySBuxskdiacTSqHZE8FtqlTrzKsQH9dwejWswvEPK+E7O3uUrOkn2z+FLnn1xTV
 ndrxQtNgjWwsrEnkBQ+OfMy0U3OKdZ/0rVTDmFAmm9mOV96oobm6vISd/bBza2cfkgt2
 KjVkpasRnlhtPSLCF+HNi8EX/OOEHqjQSm4xD84sqxLv6ofaMfcCMw4LQyFTJWH4pYNh
 xPWmNsAQ+HUkVDnjMgqRhxpkJ9/Cu3azqGoEUrFTZ+afcCeFdxF4ZMJi8K8Ef0M/07wU
 1cHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689669743; x=1692261743;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lsS2Iaqm2U2paaIACaH5afuQDHJxmglgO9qoIKv0pEA=;
 b=BckSfikjQosdY4MRWYDKbsKhdbIvm1N3jQ4tTcc/w1wDnYhfgaORvojjzwvWIFKHfg
 jKPxcOgZQHxLa8VirtQd0Y3kwOObUo+R+VR9/r24oGVnoyFGnBVfm1X9fIgAVlVAXE84
 WpZVEkBvAdM44WsupTB59mZ4J6pabaJISSsYGw/cBUQ9B9VOZyqZkuPAkNOceqIAx3gK
 fGsmqM63vmjgJ9PuQUo/+rV5Ng7hohEYR7tFa7eiy2shxqKownOBpuYDHAoiuAOTPI5P
 hsNIAvtw9ZHmhEyjgD2+WIgJ4xV8MNFHIRR/NNDMCJ4BMDsFmiHOld0wO1kkQAi7IHF4
 d8og==
X-Gm-Message-State: ABy/qLaibr2Hg1XNmypGEiHk7gw/5cxraEg3r2y0rlhU/T/axMERXYSs
 HJrDvepfF98sUNe+X4LqYv31cg==
X-Google-Smtp-Source: APBJJlHTgcBHE/VSkW3ZfuCIg9Ibg4GpA1UxvEWc9NATxNplSnsgVIZFa9W55MLD+FD0CzX/38W9Ug==
X-Received: by 2002:a5d:68c6:0:b0:313:ef93:925a with SMTP id
 p6-20020a5d68c6000000b00313ef93925amr11695801wrw.24.1689669742696; 
 Tue, 18 Jul 2023 01:42:22 -0700 (PDT)
Received: from neptune.lan ([188.27.131.236]) by smtp.gmail.com with ESMTPSA id
 a1-20020adffac1000000b003143ac73fd0sm1751233wrs.1.2023.07.18.01.42.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jul 2023 01:42:22 -0700 (PDT)
From: Alexandru Ardelean <alex@shruggie.ro>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v3] drm: adv7511: Fix low refresh rate register for ADV7533/5
Date: Tue, 18 Jul 2023 11:42:15 +0300
Message-ID: <20230718084215.12767-1-alex@shruggie.ro>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20190716131005.761-1-bogdan.togorean@analog.com>
References: <20190716131005.761-1-bogdan.togorean@analog.com>
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
Cc: neil.armstrong@linaro.org, rfoss@kernel.org, andrzej.hajda@intel.com,
 jonas@kwiboo.se, nuno.sa@analog.com, Laurent.pinchart@ideasonboard.com,
 Alexandru Ardelean <alex@shruggie.ro>, bogdan.togorean@analog.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Bogdan Togorean <bogdan.togorean@analog.com>

For ADV7533 and ADV7535 low refresh rate is selected using
bits [3:2] of 0x4a main register.
So depending on ADV model write 0xfb or 0x4a register.

Fixes: 2437e7cd88e8 ("drm/bridge: adv7533: Initial support for ADV7533")
Reviewed-by: Nuno Sa <nuno.sa@analog.com>
Signed-off-by: Bogdan Togorean <bogdan.togorean@analog.com>
Signed-off-by: Alexandru Ardelean <alex@shruggie.ro>
---

Changelog v2 -> v3:
* https://lore.kernel.org/dri-devel/1c3fde3a873b0f948d3c4d37107c5bb67dc9f7bb.camel@gmail.com/T/#u
* Added my S-o-b tag back

Changelog v1 -> v2:
* https://lore.kernel.org/dri-devel/20190716131005.761-1-bogdan.togorean@analog.com/
* added Fixes: tag
* added Reviewed-by: tag for Nuno


 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index ddceafa7b637..09290a377957 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -786,8 +786,13 @@ static void adv7511_mode_set(struct adv7511 *adv7511,
 	else
 		low_refresh_rate = ADV7511_LOW_REFRESH_RATE_NONE;
 
-	regmap_update_bits(adv7511->regmap, 0xfb,
-		0x6, low_refresh_rate << 1);
+	if (adv7511->type == ADV7511)
+		regmap_update_bits(adv7511->regmap, 0xfb,
+			0x6, low_refresh_rate << 1);
+	else
+		regmap_update_bits(adv7511->regmap, 0x4a,
+			0xc, low_refresh_rate << 2);
+
 	regmap_update_bits(adv7511->regmap, 0x17,
 		0x60, (vsync_polarity << 6) | (hsync_polarity << 5));
 
-- 
2.41.0

