Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4B09E36AC
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2024 10:31:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C168710ECAD;
	Wed,  4 Dec 2024 09:31:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ERHyhezw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEB0110ECA3
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2024 09:31:42 +0000 (UTC)
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 80E4A4D4;
 Wed,  4 Dec 2024 10:31:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1733304674;
 bh=3gLGxW2HVXpkPQ5AFOvirBqMHKf9n4CAMSQ7dIjYRdc=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=ERHyhezwQJQSY6qmbamAteHL38TD59NbuSoPylS+hX0amw7ud1DENxnW669cRcxOY
 xJ4AZUV5/KdKiYxE6h5sLIVymbD8Q3JeMJBFP7XB4fNoON/pMbNHYaMMNO5wN1/9WA
 6U6rJhOQCJCjr+yDdtrtDYmLleby8B19RCMDW6yc=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 04 Dec 2024 11:31:10 +0200
Subject: [PATCH 10/10] drm: xlnx: zynqmp: Fix max dma segment size
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241204-xilinx-formats-v1-10-0bf2c5147db1@ideasonboard.com>
References: <20241204-xilinx-formats-v1-0-0bf2c5147db1@ideasonboard.com>
In-Reply-To: <20241204-xilinx-formats-v1-0-0bf2c5147db1@ideasonboard.com>
To: Vishal Sagar <vishal.sagar@amd.com>, 
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=764;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=3gLGxW2HVXpkPQ5AFOvirBqMHKf9n4CAMSQ7dIjYRdc=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnUCF0ZBts/F3Q3/nmyZ3acCAUk/Z9QNIzpazk9
 2p+d0+xOBqJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ1AhdAAKCRD6PaqMvJYe
 9dTzD/4264e5H9nuI6cbErkz9dOv3nzTmuYcoJ/vwyiVHnu3c8oBYbQVe/fwBR7vsyAptznjqaW
 m2MydIEztef4OKL/JdUmXfogn29iHkdT8G40q85rHxFRNX3yhMFgWt/MfYtMUcx1WPHGO8sNmVi
 UZ+uT3uBqd43EHBnRW1k9xVXgRryZrZqlGza0o1kAARG27GW4k309oIT9TpzhIhkbGSFy6T+5y5
 zCyJQ/fpr5YJ2P4j4lcQ1xfx+0bOMOwRdPOeSBNn5JmBcBAe/eZIyi3torKvRNJrDNROqucq/fb
 80wub34XYvF4GGjxiTd3v25ZHN51SGczWZEDmVYp34o13Gq1kmq+98ReAU9FO/+OQvsjZpXQijH
 YROOL8y00upWzXM3eqtRZLJ2OeE/Rsas1BjUqy8ikJLR2dXErDrLZs+FN2nykdRU3eKUwX/liBw
 3KcpQsL6cyKruROnYb0uGBQACBom+mJO1Ot8/c8M3vlM1/AQldZlP7YZK4+Muwo6xGHcBufYyJW
 xVrhvgw+Kq47O8Au+Dd5iY+dlmGMBRQl1DGU9T/MRdZgnm4U8eCU8M7usEyCxvC7Jo4Bj/VLE5j
 FE1lLM7dVNEpOoOkVbI26XvBZ+mBRJt+jVPr9RpFppcMTFYpXWPG3KE4w0gW+L9EPNbswnojw2e
 S3M31bU/5fkpoLg==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
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

Fix "mapping sg segment longer than device claims to support" warning by
setting the max segment size.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/xlnx/zynqmp_dpsub.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
index f5781939de9c..a25b22238e3d 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
@@ -231,6 +231,8 @@ static int zynqmp_dpsub_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	dma_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
+
 	/* Try the reserved memory. Proceed if there's none. */
 	of_reserved_mem_device_init(&pdev->dev);
 

-- 
2.43.0

