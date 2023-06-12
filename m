Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5737672C2C1
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jun 2023 13:24:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29A0010E20F;
	Mon, 12 Jun 2023 11:24:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E80610E20D
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 11:24:03 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a02:8010:65b5:0:1ac0:4dff:feee:236a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: alarumbe)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id F2CEA6606E9D;
 Mon, 12 Jun 2023 12:24:00 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1686569041;
 bh=cBP6h0Qj6xzi3ai4GIcJimJ3/B31KfrcJ0WCXAN8SKo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CKsga2UY5qkVj7HGWMbLxQLWmXmQrpAYewgxB3/bBuCrjjkXgQVssiPXceqGlBuK0
 PuroSuBmGX8TV0DxDBYWemQypis+HP9pMCRE9UuLqD9O6rCssEhrSqM/TEsfqaf2po
 s6wb+X0W9215nBGKLkyKtIPOPyix2HehAC0ah4/nhp4fhIC7tTfm686YF+NBmdeOji
 /5CTsJjf9EgDaQz8TI3b7F7+oOTK+t/oK0A+D1TqROF7QShpwofs3NYX471UBCQNHa
 VGN2g3nFZLZQa1nvL07TE1K0QsBPgUULykkCVON+8EXiXgxH2c6XAHiQ5ET8as4HM/
 Zo89QxXeDrTcg==
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: narmstrong@baylibre.com, khilman@baylibre.com,
 linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org,
 rfoss@kernel.org, andrzej.hajda@intel.com
Subject: [PATCH v2 2/3] dw-hdmi: truly enforce 420-only formats when drm mode
 demands it
Date: Mon, 12 Jun 2023 12:23:53 +0100
Message-Id: <20230612112354.4034489-3-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230612112354.4034489-1-adrian.larumbe@collabora.com>
References: <20230612112354.4034489-1-adrian.larumbe@collabora.com>
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
index e6a456b72610..3a788316e2e5 100644
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

