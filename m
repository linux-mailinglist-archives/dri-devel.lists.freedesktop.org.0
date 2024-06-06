Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3A38FE0F2
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2024 10:28:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6C4510E02C;
	Thu,  6 Jun 2024 08:28:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=norik.com header.i=@norik.com header.b="a1wc5lvj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cpanel.siel.si (cpanel.siel.si [46.19.9.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C94510E02C
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2024 08:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com; 
 s=default;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=x2+y0ipvw9/Vy2jDpbW19iXnZKhk5ENbIrkj5TxdUAo=; b=a1wc5lvj/qqWeL1mcBgtu/fUX8
 9dfM5CxAFBm7zIHLyMs/dNaUjhFFEuE6VC7cze0+rFogayNd44qpV8REmAsMa2VHCIS3N6RTRW48Z
 3c3WE1gnaVe8I/yMNJTFnooerwgpC4f2YT2z2j8Jaq0uj19GDwrs2AU1Kn7NOAjveOezgVdaulXgi
 Zu50CX9ZiM2B/2tdGMwEpbo1fByyczgEddfAo5FProzQl78feIk4ET2UG3srCEXkWdtTeyJP7gSds
 FeqccFMlFvPx4rXm9f+zHNMeC+f25Zm2vmvv6MQ5rDKPxz7Hys9jB2pj9ieZH9iulJ3Q9oKEEDQwX
 Oov2ifQQ==;
Received: from [89.212.21.243] (port=59706 helo=localhost.localdomain)
 by cpanel.siel.si with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96.2)
 (envelope-from <primoz.fiser@norik.com>) id 1sF8UP-00BbFF-2Y;
 Thu, 06 Jun 2024 10:28:53 +0200
From: Primoz Fiser <primoz.fiser@norik.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Douglas Anderson <dianders@chromium.org>, Rob Herring <robh@kernel.org>,
 Primoz Fiser <primoz.fiser@norik.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: upstream@lists.phytec.de
Subject: [PATCH] drm/omap: dss: Support all VOUT ports
Date: Thu,  6 Jun 2024 10:28:50 +0200
Message-Id: <20240606082850.3746052-1-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id:
 primoz.fiser@norik.com
X-Authenticated-Sender: cpanel.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
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

Allow function dss_dpi_select_source_dra7xx() to set the channel in the
dra7xx DSS_CONTROL register for any VOUT port, not just VOUT1 (port 0).

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
 drivers/gpu/drm/omapdrm/dss/dss.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/dss.c b/drivers/gpu/drm/omapdrm/dss/dss.c
index 988888e164d7..f5a484ef0f48 100644
--- a/drivers/gpu/drm/omapdrm/dss/dss.c
+++ b/drivers/gpu/drm/omapdrm/dss/dss.c
@@ -796,7 +796,9 @@ static int dss_dpi_select_source_dra7xx(struct dss_device *dss, int port,
 {
 	switch (port) {
 	case 0:
-		return dss_dpi_select_source_omap5(dss, port, channel);
+		if (channel != OMAP_DSS_CHANNEL_LCD)
+			return -EINVAL;
+		break;
 	case 1:
 		if (channel != OMAP_DSS_CHANNEL_LCD2)
 			return -EINVAL;
@@ -809,7 +811,7 @@ static int dss_dpi_select_source_dra7xx(struct dss_device *dss, int port,
 		return -EINVAL;
 	}
 
-	return 0;
+	return dss_dpi_select_source_omap5(dss, port, channel);
 }
 
 int dss_dpi_select_source(struct dss_device *dss, int port,
-- 
2.25.1

