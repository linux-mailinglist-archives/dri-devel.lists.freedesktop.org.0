Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A917139CF
	for <lists+dri-devel@lfdr.de>; Sun, 28 May 2023 16:00:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE7B310E174;
	Sun, 28 May 2023 14:00:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F34410E0CB
 for <dri-devel@lists.freedesktop.org>; Sun, 28 May 2023 14:00:11 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a02:8010:65b5:0:1ac0:4dff:feee:236a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: alarumbe)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 9D44966031F4;
 Sun, 28 May 2023 15:00:09 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1685282409;
 bh=AsSXYHUkFyBX1xgopDi8EBlEKBrTYKvlfNS5sqv9JVE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kAhAaQYozMNIKdNTBTlcc6WGY8wUBBc4pzekU+PtDLhwE4CI9IsCDKkG/nfcTxIZW
 GfkjgIovEGLmpMTH8aEDspjs3aqOXDSyi30INr0hz6z10f8klkk2GS4mgL0Qhed9bD
 tggd6+JQyD6xUekLw/1xXD2OWgSCYtLi1JePs1+XM1ws4+jdcU747kvjy/RQl3aRR5
 z2pkiM9FtmmpqhYm5Nz8e8MSFva+8N0WZWVEGcvriNjr+ffsxL5DUoFv58N3K90mgx
 Y0OmCDT3AD2dPQBMxkkGstsv5MBLvl8pfSH+R+34wb0QEuGce00yXqBkvNkatFGT5i
 YkCMK0mt7NThw==
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: narmstrong@baylibre.com, khilman@baylibre.com,
 linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org,
 rfoss@kernel.org, andrzej.hajda@intel.com
Subject: [PATCH 2/3] dw-hdmi: truly enforce 420-only formats when drm mode
 demands it
Date: Sun, 28 May 2023 15:00:00 +0100
Message-Id: <20230528140001.1057084-3-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230528140001.1057084-1-adrian.larumbe@collabora.com>
References: <20230528140001.1057084-1-adrian.larumbe@collabora.com>
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
Cc: adrian.larumbe@collabora.com, kernel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The current output bus format selection logic is enforcing YUV420 even
when the drm mode allows for other bus formats as well.
Fix it by adding check for 420-only drm modes.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index d59a547f9cb2..1afb8f2603a0 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -2710,9 +2710,10 @@ static u32 *dw_hdmi_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
 		/* Default 8bit fallback */
 		output_fmts[i++] = MEDIA_BUS_FMT_UYYVYY8_0_5X24;
 
-		*num_output_fmts = i;
-
-		return output_fmts;
+		if (drm_mode_is_420_only(info, mode)) {
+			*num_output_fmts = i;
+			return output_fmts;
+		}
 	}
 
 	/*
-- 
2.40.0

