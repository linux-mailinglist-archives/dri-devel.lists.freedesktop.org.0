Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDDAB39AE88
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 01:20:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B16446E096;
	Thu,  3 Jun 2021 23:20:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5D1A6E096
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jun 2021 23:20:36 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id e11so9166901ljn.13
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Jun 2021 16:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yxHA+sJiwMSSGoYf4UO4kEN7pTrD5rjNQbunX7tu8rQ=;
 b=la0r5uIo7/pZfka3ZX+Y/OuMUgATLoqY6+btprbm3bpWtjaXoQ9iGsS1J1x3x/JSRd
 ReOOF4cyPKGYEtt1M1EKDTcS5irPrMBjRk6A3wijaVdrnefs4p6TvTjHA9BLfWHinHVI
 iitJaFD+SJAB0a4u+b5M+WuQtcizq6JPZ8sobSNvCOBVRopoGEvnTArnLtCTiol+IKY9
 yQtimr59uj2I12eWWO3ERtwGmUT3013CAwvYmdH2rA2k0cFMt1rVfmT4ClVHp5OodsJb
 uJSlx5Pn625Km6yhxTey0XMufV9G6WO3CE5sJGmzNgL9/712byAGvqUz+9hWBqq49WTB
 IrJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yxHA+sJiwMSSGoYf4UO4kEN7pTrD5rjNQbunX7tu8rQ=;
 b=hQY4qEyDbFkXLUicSOh3sTgE3X7tmzMHBdgaPaHebME+LL6k/cVmEyHVRpUO3OSt+Z
 Kdn6upg/yWG7N7/prAX950hH9720qNAGktyUMKhSH3QBN48JT1kF7JvzKSQ6g8pu1tJe
 BTSTDYWuL4yLR8fyLieYoTBV6C6pg87fAlfU/B6Y3GIBe0h64K+5BM/XfMnaORumDn9f
 faIoBIPAH50CZKliDLxUYoZXN1sli9om5PJ4Y83ftt8gFMeUNuANRmaYmESWo+xHcK9s
 6lKSGIJkd/Trd9PPUXg+4xd8sGS3ufM6oZOXeuVmvokge5y6qD9kMndTo2xLEpbaOzOi
 nSvQ==
X-Gm-Message-State: AOAM533it3CCocQWGMJq+Leln3/5LEZhMyhv+pszmy+/lRR+Clys+tuU
 yzgk1ZOb3KoEX1nJUoHGrwTf6g==
X-Google-Smtp-Source: ABdhPJxCay/38L/jU3BL6U7hwNFco+yDOoT1d6BzO7si1w1lNjm/kWMpCuTRDE0drJI4qufthCkHKg==
X-Received: by 2002:a2e:c52:: with SMTP id o18mr1182427ljd.411.1622762435102; 
 Thu, 03 Jun 2021 16:20:35 -0700 (PDT)
Received: from localhost.localdomain
 (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
 by smtp.gmail.com with ESMTPSA id x5sm443822lfu.233.2021.06.03.16.20.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 16:20:34 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/panel: nt35510: Do not fail if DSI read fails
Date: Fri,  4 Jun 2021 01:18:30 +0200
Message-Id: <20210603231830.3200040-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.31.1
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
Cc: newbyte@disroot.org, Stephan Gerhold <stephan@gerhold.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Failing to read the MTP over DSI should not bring down the
system and make us bail out from using the display, it turns
out that this happens when toggling the display off and on,
and that write is often still working so the display output
is just fine. Printing an error is enough.

Tested by killing the Gnome session repeatedly on the
Samsung Skomer.

Fixes: 899f24ed8d3a ("drm/panel: Add driver for Novatek NT35510-based panels")
Cc: Stephan Gerhold <stephan@gerhold.net>
Reported-by: newbyte@disroot.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpu/drm/panel/panel-novatek-nt35510.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-novatek-nt35510.c b/drivers/gpu/drm/panel/panel-novatek-nt35510.c
index ef70140c5b09..873cbd38e6d3 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt35510.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt35510.c
@@ -706,9 +706,7 @@ static int nt35510_power_on(struct nt35510 *nt)
 	if (ret)
 		return ret;
 
-	ret = nt35510_read_id(nt);
-	if (ret)
-		return ret;
+	nt35510_read_id(nt);
 
 	/* Set up stuff in  manufacturer control, page 1 */
 	ret = nt35510_send_long(nt, dsi, MCS_CMD_MAUCCTR,
-- 
2.31.1

