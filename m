Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A23794B94FA
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 01:26:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40F1D10E6B3;
	Thu, 17 Feb 2022 00:26:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD10F10E68D
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 00:25:56 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 3E0A882DB7;
 Thu, 17 Feb 2022 01:25:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1645057555;
 bh=DeGVi7fSwef8945eZpuZEP5eIV5T4K8ZJYArxD65N3A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=tyvYEaJPKti1IPeT9zkiVbXrwPVD6O1B0DIMuWsEwx2GZRCP3MQ65itXaJNdyv+GY
 WAoqFZhQkb6AdoNcEBBia+DP+ykPAAIM/1qHZVYY+YStZk5L8ALj/39lNbsdODiGmh
 mwd9YA4QFJ1gFNwd/Gwc2VzwEx4+JjGIdIPDqlfrlggKKNMsAR1X6JU9GZU5Sxx5Bf
 /b0mbls61YQMYwleZ5taWc4lttr5Z5dy7ZmVDjKJf2fQq382oGDh8i0P8WCp6QwYVJ
 euYAkQKV0oEIZCL6rf6YdQ5DvB3x9MHbcM9B4zyaY7w1K/tmg9i14q8ti1w2+GHHMp
 4QYrdMcYYwX2A==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V2 07/12] drm: bridge: icn6211: Disable DPI color swap
Date: Thu, 17 Feb 2022 01:25:25 +0100
Message-Id: <20220217002530.396563-8-marex@denx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220217002530.396563-1-marex@denx.de>
References: <20220217002530.396563-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
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
Cc: Marek Vasut <marex@denx.de>, Robert Foss <robert.foss@linaro.org>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The chip is capable of swapping DPI RGB channels. The driver currently
does not implement support for this functionality. Write the MIPI_PN_SWAP
register to 0 to assure the color swap is disabled.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Jagan Teki <jagan@amarulasolutions.com>
Cc: Maxime Ripard <maxime@cerno.tech>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
To: dri-devel@lists.freedesktop.org
---
V2: Rebase on next-20220214
---
 drivers/gpu/drm/bridge/chipone-icn6211.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/chipone-icn6211.c b/drivers/gpu/drm/bridge/chipone-icn6211.c
index 2040596717139..f475426507f19 100644
--- a/drivers/gpu/drm/bridge/chipone-icn6211.c
+++ b/drivers/gpu/drm/bridge/chipone-icn6211.c
@@ -302,6 +302,7 @@ static void chipone_atomic_enable(struct drm_bridge *bridge,
 
 	ICN6211_DSI(icn, MIPI_PD_CK_LANE, 0xa0);
 	ICN6211_DSI(icn, PLL_CTRL(12), 0xff);
+	ICN6211_DSI(icn, MIPI_PN_SWAP, 0x00);
 
 	/* DPI HS/VS/DE polarity */
 	pol = ((mode->flags & DRM_MODE_FLAG_PHSYNC) ? BIST_POL_HSYNC_POL : 0) |
-- 
2.34.1

