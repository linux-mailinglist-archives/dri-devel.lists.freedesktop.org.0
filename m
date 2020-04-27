Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF9A1B99C9
	for <lists+dri-devel@lfdr.de>; Mon, 27 Apr 2020 10:19:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABA666E0E6;
	Mon, 27 Apr 2020 08:19:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DED096E0A1
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 08:19:28 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id j3so16559982ljg.8
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 01:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QfDnC/975rlfCbjADEMfc9RfcMZxiMjnJ1FwoN1pIaw=;
 b=Y+VCrmeiZ2jmM3OhszHVJvbp76bmwxmRZKnIWg9C0NpYYcSYKbOcMjVa3hAZDJJB+c
 FHeumPFbaYsloZfvNYqUGLq3ebhsytZ848M5pa20j89r+WdufGrijqCh+GJ/4Grrreyb
 YHmmVE1+bHYw/STqjzbwX00Q4bLZjjqnz/TYWDgmTMjkiUH+rKcg/cHjJbquqrsV/JqH
 dhe5Was18Ck8dp7iTtZgwgmM7OYI0lIBcsNrbYNsvy9RWRrBuuDWu5EsKszDjPpWji+6
 u0Hx0Iv3qrg8R2KQamppyiMCddYY9sv4w48Bf1VdW0Aqnu65MEWa5M3k9OgwSX+pLhCI
 znqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=QfDnC/975rlfCbjADEMfc9RfcMZxiMjnJ1FwoN1pIaw=;
 b=ieNHOGHQMB3jCdazsKgJAWtbE526Qdb5zkNqOBFcL+gcdk0YhDW0mQE6B1UDk7cDEs
 DXL+V9rrB7MZT0ARhhxB2VlryThNUKfODxFkHpcAUySPPQ7Pa7E+erQxduimskCSkuE1
 qJi67o6cWk87OU9rxoeCus/o2KSpJU7kQghgbUBBMgh5OOvBAWBv1JKoI9tmLV+cRR6+
 GiNn1kymDMtNArvrbfuYEW9PoF8h8r1rC/nOzYXSAvRcE/pMhCcUEECebS0zKY5C8wRm
 LjT12G+OunBpb8D3mUOofYxsI8JerlSuHDie+MI+9kq25flovWtvxq8B5kEkqx5bBSH2
 qtqw==
X-Gm-Message-State: AGi0PuZDuGb82Qnh/s5I99kmqCn5UIwvkRZ0EpRD+w2qLa4xgliMeiNa
 lrhTxEqrVQiHBYApOeD8ylNmhhRy
X-Google-Smtp-Source: APiQypKr9YrT2I6gRGVcKAknhWnwS9ipPj+2G/YCTbXGTD3J58tEt+QMV6/RHkHYBXYl/ftuHn37Mw==
X-Received: by 2002:a2e:9084:: with SMTP id l4mr14159506ljg.132.1587975567063; 
 Mon, 27 Apr 2020 01:19:27 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 c20sm9846301ljk.59.2020.04.27.01.19.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2020 01:19:26 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v2 20/21] drm/bridge: nxp-ptn3460: make connector creation
 optional
Date: Mon, 27 Apr 2020 10:18:49 +0200
Message-Id: <20200427081850.17512-21-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200427081850.17512-1-sam@ravnborg.org>
References: <20200427081850.17512-1-sam@ravnborg.org>
MIME-Version: 1.0
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Martyn Welch <martyn.welch@collabora.co.uk>, Jonas Karlman <jonas@kwiboo.se>,
 Peter Senna Tschudin <peter.senna@gmail.com>,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Martin Donnelly <martin.donnelly@ge.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Make the connector creation optional to enable usage of the
nxp-ptn3460 bridge with the DRM bridge connector helper.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Andrzej Hajda <a.hajda@samsung.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jernej Skrabec <jernej.skrabec@siol.net>
---
 drivers/gpu/drm/bridge/nxp-ptn3460.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/nxp-ptn3460.c b/drivers/gpu/drm/bridge/nxp-ptn3460.c
index e253c185f94c..6a65657087f9 100644
--- a/drivers/gpu/drm/bridge/nxp-ptn3460.c
+++ b/drivers/gpu/drm/bridge/nxp-ptn3460.c
@@ -229,10 +229,8 @@ static int ptn3460_bridge_attach(struct drm_bridge *bridge,
 	if (ret < 0)
 		return ret;
 
-	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
-		DRM_ERROR("Fix bridge driver to make connector optional!");
-		return -EINVAL;
-	}
+	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
+		return 0;
 
 	if (!bridge->encoder) {
 		DRM_ERROR("Parent encoder object not found");
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
