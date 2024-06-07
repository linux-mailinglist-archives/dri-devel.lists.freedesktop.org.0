Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96EBB9004F9
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2024 15:33:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEDEF10EC2A;
	Fri,  7 Jun 2024 13:33:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="L6NYNlPj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC44310EC2D
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2024 13:33:09 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 457DWsoO118337;
 Fri, 7 Jun 2024 08:32:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1717767174;
 bh=dnlV6EZfbKSSOB5yAkozQxyQBhab8cR780BU+/JTZrQ=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=L6NYNlPjRde1WkOLXLqkzPfOtF1fM01Iox5Db8LaU+PXPUP3EhmR0AJQgTT855PCg
 tTnKhY/zUIsqKBlWxrMXKA0TcDA8n1gwyMUoMGkd9zp2JBDjtBN/s3lVqfCEuBFLmg
 VlSqGMjGto1chRA//GNAmNzTk49pP8+u5raJiBZs=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 457DWsWD017223
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 7 Jun 2024 08:32:54 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 7
 Jun 2024 08:32:54 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 7 Jun 2024 08:32:54 -0500
Received: from localhost (ti.dhcp.ti.com [172.24.227.95] (may be forged))
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 457DWrnp119514;
 Fri, 7 Jun 2024 08:32:54 -0500
From: Devarsh Thakkar <devarsht@ti.com>
To: <mchehab@kernel.org>, <hverkuil-cisco@xs4all.nl>,
 <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <benjamin.gaignard@collabora.com>, <sebastian.fricke@collabora.com>,
 <dri-devel@lists.freedesktop.org>
CC: <laurent.pinchart@ideasonboard.com>, <praneeth@ti.com>, <nm@ti.com>,
 <vigneshr@ti.com>, <a-bhatia1@ti.com>, <j-luthra@ti.com>,
 <b-brnich@ti.com>, <detheridge@ti.com>, <p-mantena@ti.com>,
 <vijayp@ti.com>, <devarsht@ti.com>, <andrzej.p@collabora.com>,
 <nicolas@ndufresne.ca>, <p.zabel@pengutronix.de>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <akpm@linux-foundation.org>,
 <gregkh@linuxfoundation.org>, <andriy.shevchenko@linux.intel.com>,
 <adobriyan@gmail.com>, <jani.nikula@intel.com>
Subject: [PATCH v13 12/13] media: imagination: Round to closest multiple for
 cropping region
Date: Fri, 7 Jun 2024 19:02:53 +0530
Message-ID: <20240607133253.3559339-1-devarsht@ti.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20240607131900.3535250-1-devarsht@ti.com>
References: <20240607131900.3535250-1-devarsht@ti.com>
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

If neither of the flags to round down (V4L2_SEL_FLAG_LE) or round up
(V4L2_SEL_FLAG_GE) are specified by the user, then round to nearest
multiple of requested value while updating the crop rectangle coordinates.

Use the rounding macro which gives preference to rounding down in case two
nearest values (high and low) are possible to raise the probability of
cropping rectangle falling inside the bound region.

This complies with the VIDIOC_G_SELECTION, VIDIOC_S_SELECTION ioctl
description as documented in v4l uapi [1] which specifies that driver
should choose crop rectangle as close as possible if no flags are passed by
user-space, as quoted below :

"``0`` - The driver can adjust the rectangle size freely and shall choose a
crop/compose rectangle as close as possible to the requested
 one."

Link: https://www.kernel.org/doc/Documentation/userspace-api/media/v4l/vidioc-g-selection.rst [1]
Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
---
V9->V13: No change
V8: Update commit message with specification reference
V1->V7 (No change, patch introduced in V7)
---
 drivers/media/platform/imagination/e5010-jpeg-enc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/imagination/e5010-jpeg-enc.c b/drivers/media/platform/imagination/e5010-jpeg-enc.c
index 4b6fbe99d5ff..ea96b1bc5315 100644
--- a/drivers/media/platform/imagination/e5010-jpeg-enc.c
+++ b/drivers/media/platform/imagination/e5010-jpeg-enc.c
@@ -517,10 +517,10 @@ static int e5010_s_selection(struct file *file, void *fh, struct v4l2_selection
 
 	switch (s->flags) {
 	case 0:
-		s->r.width = round_down(s->r.width, queue->fmt->frmsize.step_width);
-		s->r.height = round_down(s->r.height, queue->fmt->frmsize.step_height);
-		s->r.left = round_down(s->r.left, queue->fmt->frmsize.step_width);
-		s->r.top = round_down(s->r.top, 2);
+		s->r.width = round_closest_down(s->r.width, queue->fmt->frmsize.step_width);
+		s->r.height = round_closest_down(s->r.height, queue->fmt->frmsize.step_height);
+		s->r.left = round_closest_down(s->r.left, queue->fmt->frmsize.step_width);
+		s->r.top = round_closest_down(s->r.top, 2);
 
 		if (s->r.left + s->r.width > queue->width)
 			s->r.width = round_down(s->r.width + s->r.left - queue->width,
-- 
2.39.1

