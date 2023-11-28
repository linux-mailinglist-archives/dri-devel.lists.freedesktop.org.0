Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 536967FBBCB
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 14:39:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C71910E530;
	Tue, 28 Nov 2023 13:39:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7625210E53B
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 13:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1701178777; x=1732714777;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cBeN1PG9grbiECe7yaAUxlwcMB543KTle/ixoOM9pmc=;
 b=ngjspOeK8aQDZ91iLT10KQIV2R/guI0XQYAZTHQeWMfKduQ5W8K8YbE8
 LAXfq5Lm8mERRAT9jyniYNcAr/R0Pxj0vAJ5akI2cOe7wx3PNml0L4sVf
 VHldio6JCeLl36Ig9hIEWmUa2xI4EyG3uiCiBIE6OH8YhfjXx/YGHM2KT
 CjeLffkry+CRx1KbpO7sonp3CGmBmkDty4pEkQTPf2+qbaMpPZTu43IvN
 1QO4EchV1hm4UKy0KoPtC0cA/gfurhm7zGIaEvnQ/MUn3OVYAXjpQnlnh
 zd+oUxlLDujbPr+DuvnRjDKgBLnlZSV4racvZJrxmapJgkOb4C7/kIx4F g==;
X-IronPort-AV: E=Sophos;i="6.04,233,1695679200"; d="scan'208";a="34216336"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 28 Nov 2023 14:39:35 +0100
Received: from steina-w.tq-net.de (steina-w.tq-net.de [10.123.53.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 8F7C0280075;
 Tue, 28 Nov 2023 14:39:35 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 1/1] drm/bridge: tc358767: respect (e)DP output resolution
 limits
Date: Tue, 28 Nov 2023 14:39:33 +0100
Message-Id: <20231128133933.2923307-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
 Markus Niebel <Markus.Niebel@ew.tq-group.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Markus Niebel <Markus.Niebel@ew.tq-group.com>

Modes S21/P21, (e)DP output, support only resolutions up to 1920x1200.
Filter out modes from EDID larger than this limit. This especially
important for 4k monitors.

Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/gpu/drm/bridge/tc358767.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index 019b8f1432a7d..88bdd9dca41d0 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -1646,9 +1646,17 @@ tc_connector_detect(struct drm_connector *connector, bool force)
 		return connector_status_unknown;
 }
 
+static int tc_fill_modes(struct drm_connector *connector, uint32_t maxX,
+			 uint32_t maxY)
+{
+	return drm_helper_probe_single_connector_modes(connector,
+						       min(maxX, 1920U),
+						       min(maxY, 1200U));
+}
+
 static const struct drm_connector_funcs tc_connector_funcs = {
 	.detect = tc_connector_detect,
-	.fill_modes = drm_helper_probe_single_connector_modes,
+	.fill_modes = tc_fill_modes,
 	.destroy = drm_connector_cleanup,
 	.reset = drm_atomic_helper_connector_reset,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
-- 
2.34.1

