Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC4748E30D
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jan 2022 04:49:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F8E110EB6B;
	Fri, 14 Jan 2022 03:49:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B80010EB6F
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 03:49:01 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 0118883042;
 Fri, 14 Jan 2022 04:48:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1642132140;
 bh=fPLPtkzDc+R9dlV0BuT1QPFi6iDt5+t9qjaopWVHJ9U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qvKQ6PKV74cGYYXcNPVtEbmR2FADOaKNqlWtHGfPOsc8YBSGP9fVX8akqnSHEUXpt
 pPYqQsvOE8+ll1QnxNBeqGwWwXWE1noBT3NsTL4tYvQxcb0KvA5D+DU6uyat4gtouI
 dgOPtykUG4as24sexXpoIUrxxvbhIrixUBX0mNnqGeHLE8TRVGRxfwKMFPLXdWtTXm
 ZghojJGt3HzL2woJoG7FqpoDbp6kIXlIG6duvg9DyDcyCXYnRj5gKrBe4kW8sjRESI
 DMoJMsCvf0rauffUIcD6mf+A1IbRcTskGN/3StZQc2zM+7unWTrKpMirvLxZZmPJx+
 NSgul55Fa2Lrw==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 10/14] drm: bridge: icn6211: Disable DPI color swap
Date: Fri, 14 Jan 2022 04:48:34 +0100
Message-Id: <20220114034838.546267-10-marex@denx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220114034838.546267-1-marex@denx.de>
References: <20220114034838.546267-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Marek Vasut <marex@denx.de>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sam Ravnborg <sam@ravnborg.org>, Jagan Teki <jagan@amarulasolutions.com>,
 Robert Foss <robert.foss@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The chip is capable of swapping DPI RGB channels. The driver currently
does not implement support for this functionality. Write the MIPI_PN_SWAP
register to 0 to assure the color swap is disabled.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Jagan Teki <jagan@amarulasolutions.com>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
To: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/bridge/chipone-icn6211.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/chipone-icn6211.c b/drivers/gpu/drm/bridge/chipone-icn6211.c
index 6daf2f8013733..e41e671fed46d 100644
--- a/drivers/gpu/drm/bridge/chipone-icn6211.c
+++ b/drivers/gpu/drm/bridge/chipone-icn6211.c
@@ -325,6 +325,7 @@ static void chipone_atomic_enable(struct drm_bridge *bridge,
 
 	ICN6211_DSI(icn, MIPI_PD_CK_LANE, 0xa0);
 	ICN6211_DSI(icn, PLL_CTRL(12), 0xff);
+	ICN6211_DSI(icn, MIPI_PN_SWAP, 0x00);
 
 	/* DPI HS/VS/DE polarity */
 	pol = ((mode->flags & DRM_MODE_FLAG_PHSYNC) ? BIST_POL_HSYNC_POL : 0) |
-- 
2.34.1

