Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD6D8C1FD9
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 10:37:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40C7810E144;
	Fri, 10 May 2024 08:37:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="s9ihxDya";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1978110E144
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 08:37:08 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44A8avDI125634;
 Fri, 10 May 2024 03:36:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1715330217;
 bh=lrdTPlSx5uWnTmoVruaPcAiqQdb2LlFFka9SllqeKfQ=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=s9ihxDyaEkFoT1qugagSFAZqnMrFjFJT4bZxrZHjNX76TqLPV/S7fTiCwDAyVefbO
 mpDbb7wkkTYcJeUAHj4le3pfGlNxtfWTX/Hcku1VrTs7LWWHLz3U+tzXnBh0T+t4wS
 pwMqCF8M3wFllwNLX6ehlVeHHeheZeE488hBEbFs=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44A8avfc019127
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 10 May 2024 03:36:57 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 10
 May 2024 03:36:57 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 10 May 2024 03:36:57 -0500
Received: from localhost (ti.dhcp.ti.com [172.24.227.95] (may be forged))
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44A8auaK080419;
 Fri, 10 May 2024 03:36:56 -0500
From: Devarsh Thakkar <devarsht@ti.com>
To: <mchehab@kernel.org>, <hverkuil-cisco@xs4all.nl>,
 <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <benjamin.gaignard@collabora.com>, <sebastian.fricke@collabora.com>,
 <akpm@linux-foundation.org>, <gregkh@linuxfoundation.org>,
 <andriy.shevchenko@linux.intel.com>, <adobriyan@gmail.com>,
 <jani.nikula@intel.com>, <p.zabel@pengutronix.de>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>
CC: <laurent.pinchart@ideasonboard.com>, <praneeth@ti.com>, <nm@ti.com>,
 <vigneshr@ti.com>, <a-bhatia1@ti.com>, <j-luthra@ti.com>,
 <b-brnich@ti.com>, <detheridge@ti.com>, <p-mantena@ti.com>,
 <vijayp@ti.com>, <devarsht@ti.com>, <andrzej.p@collabora.com>,
 <nicolas@ndufresne.ca>
Subject: [PATCH RESEND v7 6/8] math.h Add macros to round to closest specified
 power of 2
Date: Fri, 10 May 2024 14:06:55 +0530
Message-ID: <20240510083655.1281540-1-devarsht@ti.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20240510082603.1263256-1>
References: <20240510082603.1263256-1>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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

Add macros to round to nearest specified power of 2. Two macros are added :
round_closest_up and round_closest_down which round up to nearest multiple
of 2 with a preference to round up or round down respectively if there are
two possible nearest values to the given number.

This patch is inspired from the Mentor Graphics IPU driver [1] which uses
similar macro locally and which can be updated to use this generic macro
instead along with other drivers having similar requirements.

[1]:
https://elixir.bootlin.com/linux/v6.8.9/source/drivers/gpu/ipu-v3/ipu-image-convert.c#L480

Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
---
V1->V6 (No change, patch introduced in V7)
---
 include/linux/math.h | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/include/linux/math.h b/include/linux/math.h
index dd4152711de7..82ee3265c910 100644
--- a/include/linux/math.h
+++ b/include/linux/math.h
@@ -34,6 +34,42 @@
  */
 #define round_down(x, y) ((x) & ~__round_mask(x, y))
 
+/**
+ * round_closest_up - round to nearest specified power of 2 with preference
+ *		      to rounding up
+ * @x: the value to round
+ * @y: multiple to round to (must be a power of 2)
+ *
+ * Rounds @x to nearest multiple of @y (which must be a power of 2).
+ * The rounded value can be greater than or less than @x depending
+ * upon it's nearness to @x. If there are two nearest possible values,
+ * then preference will be given to the greater value.
+ *
+ * Examples :
+ * round_closest_up(17, 4) = 16
+ * round_closest_up(15, 4) = 16
+ * round_closest_up(14, 4) = 16
+ */
+#define round_closest_up(x, y) round_down((x) + (y) / 2, (y))
+
+/**
+ * round_closest_down - round to nearest specified power of 2 with preference
+ *			to rounding down
+ * @x: the value to round
+ * @y: multiple to round down to (must be a power of 2)
+ *
+ * Rounds @x to nearest multiple of @y (which must be a power of 2).
+ * The rounded value can be greater than or less than @x depending
+ * upon it's nearness to @x. If there are two nearest possible values,
+ * then preference will be given to the lesser value.
+ *
+ * Examples :
+ * round_closest_down(17, 4) = 16
+ * round_closest_down(15, 4) = 16
+ * round_closest_down(14, 4) = 12
+ */
+#define round_closest_down(x, y) round_up((x) - (y) / 2, (y))
+
 #define DIV_ROUND_UP __KERNEL_DIV_ROUND_UP
 
 #define DIV_ROUND_DOWN_ULL(ll, d) \
-- 
2.39.1

