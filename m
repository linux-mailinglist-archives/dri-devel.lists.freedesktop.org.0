Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E698F60E4E6
	for <lists+dri-devel@lfdr.de>; Wed, 26 Oct 2022 17:36:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CA3510E573;
	Wed, 26 Oct 2022 15:36:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52CEA10E576
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Oct 2022 15:36:18 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 3656585065;
 Wed, 26 Oct 2022 17:36:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1666798576;
 bh=GnMxCkL6ZT14et//qNqhta1Q3JUIlhoXBTn8qTA4JAU=;
 h=From:To:Cc:Subject:Date:From;
 b=AXhlqYTVhcju7grNmLgD1EX19Y8YLJH5+WlGWv++i73tHkxsfyM3vjr9OhmxPaMwI
 W5QjDy/g12mZxPAJLFYMMOb0RGfWqvpUOPbARQcAG2kEyHvob7LXb8sDDQaltOv686
 1jWUCBcmhSmWJLYYfQQDi79MKyKDsEkf3KOXUPVNwJhOSEmJUExbs8YLH1TGFysuCF
 TL4wJEaYEo05UiXfV5uipa1fdiY0f3ucLsZtMp3XXAM46j8WGr8n8R/C+K75Ek4PnU
 /VxtDcqQIKKuQI7WP4b399U7bIeBpZwgIyTImEbl0NInKWikEV6IxxNUPzRcddU4gZ
 W3YnmImJvq5ew==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/3] drm: bridge: Add DSI HS clock frequency limits to bridge
 state
Date: Wed, 26 Oct 2022 17:35:57 +0200
Message-Id: <20221026153559.387041-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
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
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the ability to pass DSI HS clock frequency constraints between
neighboring DSI bridges via struct drm_bridge_state . This way the
DSI HS clock frequency negotiation can be implemented instead of
the current ad-hoc method where each bridge attempts to guess the
neighbor HS clock frequency setting or expectation.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Maxime Ripard <maxime@cerno.tech>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 include/drm/drm_atomic.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index 10b1990bc1f68..eece7557933d2 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -1117,6 +1117,8 @@ struct drm_bridge_state {
 	 * @input_bus_cfg: input bus configuration
 	 */
 	struct drm_bus_cfg input_bus_cfg;
+	unsigned long hs_rate_min;
+	unsigned long hs_rate_max;
 
 	/**
 	 * @output_bus_cfg: input bus configuration
-- 
2.35.1

