Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C44472D7C
	for <lists+dri-devel@lfdr.de>; Mon, 13 Dec 2021 14:36:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2EEF10E717;
	Mon, 13 Dec 2021 13:36:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EF2A10E717
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Dec 2021 13:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1639402597; x=1670938597;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ufYaztoM7btUy9LuPRGwqpeGKIKUMrwofkGEOKopoSs=;
 b=ZnnM+mubbqCBvQxlRpttwO104EfIb/mSGUjU7ysLJZZd6ok6KDL9jFOp
 9C6NFDdFKU0ZXDFKY1oT5mVNeAdM/wco79SWoCdPSoeDDUijUFF3b+BGA
 gTRZvslNQPZSdqxbRiOfmIi88F2m7uoOXdl07yl1OeSJN5qrEiqFQ+72c
 yv3rOhB3uwKB83XU8i7apR9Nkh2mBTX6RHM/PG90bder2mwdpyVu38AjG
 qmdgK1gwlvo+xdqMvMj4kNUwOSdScgPE46eqNw5vp7Uteg1hC5J0vFvns
 60fzLAjP1nLBSUTRXvs8fiMXcnCwQeo/Jb1F4NoN9m9FRWqAlfbgwhnWc Q==;
X-IronPort-AV: E=Sophos;i="5.88,202,1635199200"; d="scan'208";a="21012622"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 13 Dec 2021 14:36:34 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Mon, 13 Dec 2021 14:36:34 +0100
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Mon, 13 Dec 2021 14:36:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1639402594; x=1670938594;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ufYaztoM7btUy9LuPRGwqpeGKIKUMrwofkGEOKopoSs=;
 b=KKj+3NMxyj6W07qYUFOR8sqRTVsvFBiGLmoZtc8gxWUUyxOpo6ggjE1X
 dDGAo7aFwzbn9OuuduhVYRYQbxe/KtnNjnmMJKTxzcXf9GEkM+QHL2zqi
 UoWf+HA/U8Fqms0QFKcJGR6VaQmmSAQybktKbMGoCjDppWWfPPigSP5RJ
 ugl0ff+IoV/RQRMr8ND8WBk8TJ0JGaskMTBnfG0f075s6lq3Sr40tj4PA
 p28kLvsYG+6YzruKHBZLmJJyz2Nm1Ee7tvAcjyyGuWJGA4+msOb31zbtH
 vyMGYZ8Ps2jRlnAIanszLb3UjC/0ODf9Ahof5fvezIfgaAkKRPlLXxOFp A==;
X-IronPort-AV: E=Sophos;i="5.88,202,1635199200"; d="scan'208";a="21012621"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 13 Dec 2021 14:36:34 +0100
Received: from steina-w.tq-net.de (unknown [10.123.49.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 31B95280075;
 Mon, 13 Dec 2021 14:36:34 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v5 1/4] dt-bindings: display: bridge: sn65dsi83: Make enable
 GPIO optional
Date: Mon, 13 Dec 2021 14:36:23 +0100
Message-Id: <20211213133626.2498056-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211213133626.2498056-1-alexander.stein@ew.tq-group.com>
References: <20211213133626.2498056-1-alexander.stein@ew.tq-group.com>
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
 devicetree@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

The SN65DSI8x EN signal may be tied to VCC, or otherwise controlled by
means not available to the kernel. Make the GPIO optional.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../devicetree/bindings/display/bridge/ti,sn65dsi83.yaml         | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
index b446d0f0f1b4..c3f3e73f740a 100644
--- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
@@ -91,7 +91,6 @@ properties:
 required:
   - compatible
   - reg
-  - enable-gpios
   - ports
 
 allOf:
-- 
2.25.1

