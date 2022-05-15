Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A1F45279FB
	for <lists+dri-devel@lfdr.de>; Sun, 15 May 2022 22:44:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC8F710E12B;
	Sun, 15 May 2022 20:44:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91F7010E12B
 for <dri-devel@lists.freedesktop.org>; Sun, 15 May 2022 20:44:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: alarumbe) with ESMTPSA id 181AC1F40848
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652647459;
 bh=NDTySiDmKSwj7gbdz9Iao713A5gVozGrjrvvWD1ujRM=;
 h=From:To:Cc:Subject:Date:From;
 b=VS+hV8xjEEUP1cNYl11UorWIjKRuRCWdQ6QVD1u6Ta25skEYG4AoEhHHZjMccleBT
 GxRi5xhKU5BVKHNjgRRNAsqYRwOWDM2ghQczEg6y8JB+W4Q2ThjXwMKBK9u6QKFWHL
 SpPssIdbFuLi5UPjdI75MFtLNglA2riOBIjxJnqrVqfTGdbDPZvQBlPXRddio+I4gv
 4z/k42nCszeAUqB/Bc/xbeohlyRhwXd0DkBBb9PgVsdOxDHNSEFqd3K9nGr/hKrSoP
 uPfyx4rtB6YAO3k/NWQsJg5RET/cGLogFcjPTm4cRLsQ2ayGC6WDvOoO6u9gJ1EnfD
 9mWYX8owjtUoQ==
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: narmstrong@baylibre.com, khilman@baylibre.com,
 linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/meson: fix HDMI2 420 display mode selection logic
Date: Sun, 15 May 2022 21:44:12 +0100
Message-Id: <20220515204412.2733803-1-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: adrian.larumbe@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit e67f6037ae1be34b2b68 ("drm/meson: split out encoder from
meson_dw_hdmi") introduced a new way of calculating the display's pixel
clock. However, it leads to the wrong value being reckoned for Odroid N2+
boards, where clock frequency is never halved when the display's videomode
supports YCBCR420 output format.

Fix the selection logic.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/meson/meson_dw_hdmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
index 5cd2b2ebbbd3..6c9640f4c82e 100644
--- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
@@ -380,7 +380,7 @@ static int dw_hdmi_phy_init(struct dw_hdmi *hdmi, void *data,
 			 mode->clock > 340000 ? 40 : 10);
 
 	if (drm_mode_is_420_only(display, mode) ||
-	    (!is_hdmi2_sink &&
+	    (is_hdmi2_sink &&
 	     drm_mode_is_420_also(display, mode)))
 		mode_is_420 = true;
 
-- 
2.35.1

