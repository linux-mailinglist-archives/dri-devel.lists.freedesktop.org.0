Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C23768C8B50
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2024 19:41:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC7D710EF3A;
	Fri, 17 May 2024 17:41:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="wBHbaq7T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BB5110EF3A
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2024 17:41:06 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44HHetIk116593;
 Fri, 17 May 2024 12:40:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1715967655;
 bh=Z0Jtv/ACxyCng0G72W+TurXG21YdGWxQxYgqPeRPW3k=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=wBHbaq7T/IS+g9pzSpRs30RDyFKtefn5kA+Uq+ATKfcReki/7cvkxH0fiNs5/VVby
 UQYjJ+bPjhHSAAyIqa3TsAyId34uF4XwOsk/EICVTXzIz+d4bvKJtEdqrEkQLwTmtb
 O9VCao4US2juAc96sMtZ+/Mxf6/7jpvSKfLdXWP8=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44HHetkw031054
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 17 May 2024 12:40:55 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 17
 May 2024 12:40:55 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 17 May 2024 12:40:55 -0500
Received: from localhost (ti.dhcp.ti.com [172.24.227.95] (may be forged))
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44HHesjK018723;
 Fri, 17 May 2024 12:40:55 -0500
From: Devarsh Thakkar <devarsht@ti.com>
To: <mchehab@kernel.org>, <hverkuil-cisco@xs4all.nl>,
 <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <benjamin.gaignard@collabora.com>, <sebastian.fricke@collabora.com>,
 <p.zabel@pengutronix.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>
CC: <laurent.pinchart@ideasonboard.com>, <praneeth@ti.com>, <nm@ti.com>,
 <vigneshr@ti.com>, <a-bhatia1@ti.com>, <j-luthra@ti.com>,
 <b-brnich@ti.com>, <detheridge@ti.com>, <p-mantena@ti.com>,
 <vijayp@ti.com>, <devarsht@ti.com>, <andrzej.p@collabora.com>,
 <nicolas@ndufresne.ca>, <akpm@linux-foundation.org>,
 <gregkh@linuxfoundation.org>, <andriy.shevchenko@linux.intel.com>,
 <adobriyan@gmail.com>, <jani.nikula@intel.com>
Subject: [PATCH v8 10/10] gpu: ipu-v3: Use generic macro for rounding closest
 to specified value
Date: Fri, 17 May 2024 23:10:54 +0530
Message-ID: <20240517174054.812332-1-devarsht@ti.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20240517171532.748684-1-devarsht@ti.com>
References: <20240517171532.748684-1-devarsht@ti.com>
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

Use generic macro round_closest_up() for rounding closest to specified
value instead of using local macro round_closest().

There is no change from functionality point of view as round_closest_up()
is functionally same as the previously used local macro round_closest().

Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
---
V8: Update commit message
V1->V7 : (No change, patch introduced in V7)
---
 drivers/gpu/ipu-v3/ipu-image-convert.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/ipu-v3/ipu-image-convert.c b/drivers/gpu/ipu-v3/ipu-image-convert.c
index 841316582ea9..5192a8b5c02c 100644
--- a/drivers/gpu/ipu-v3/ipu-image-convert.c
+++ b/drivers/gpu/ipu-v3/ipu-image-convert.c
@@ -477,8 +477,6 @@ static int calc_image_resize_coefficients(struct ipu_image_convert_ctx *ctx,
 	return 0;
 }
 
-#define round_closest(x, y) round_down((x) + (y)/2, (y))
-
 /*
  * Find the best aligned seam position for the given column / row index.
  * Rotation and image offsets are out of scope.
@@ -565,7 +563,7 @@ static void find_best_seam(struct ipu_image_convert_ctx *ctx,
 		 * The closest input sample position that we could actually
 		 * start the input tile at, 19.13 fixed point.
 		 */
-		in_pos_aligned = round_closest(in_pos, 8192U * in_align);
+		in_pos_aligned = round_closest_up(in_pos, 8192U * in_align);
 		/* Convert 19.13 fixed point to integer */
 		in_pos_rounded = in_pos_aligned / 8192U;
 
-- 
2.39.1

