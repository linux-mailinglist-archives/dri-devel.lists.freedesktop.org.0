Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A99A11CCE
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 10:04:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB36510E57F;
	Wed, 15 Jan 2025 09:04:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qFEjk+vN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 931A910E57B
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 09:04:05 +0000 (UTC)
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 53EAF437A;
 Wed, 15 Jan 2025 10:03:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1736931787;
 bh=2kTYJooFMq+5La3iJTTLvA+HVNIvS8ojV7vTfwy1oII=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=qFEjk+vNWnvlpIMP+JuyPYHxsLHww49Ev7/nBgpam8MTKdWNqrxOehqXGYB6LkXNS
 XVWs3N3Td2U86TntBQcm7JxKYZA0aT3TFZSKyN1A+Vq53EvUsA0HFLBUG8cW8k6ERw
 /w9jxNCc1XX5cmRaORj7nh9X7bqBLhgPb2xBFrbQ=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 15 Jan 2025 11:03:38 +0200
Subject: [PATCH v2 09/10] drm: xlnx: zynqmp: Add support for X403
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250115-xilinx-formats-v2-9-160327ca652a@ideasonboard.com>
References: <20250115-xilinx-formats-v2-0-160327ca652a@ideasonboard.com>
In-Reply-To: <20250115-xilinx-formats-v2-0-160327ca652a@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=766;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=2kTYJooFMq+5La3iJTTLvA+HVNIvS8ojV7vTfwy1oII=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnh3n7rDWzvVthDhCLY3Y6GORczfioTlrLBnP+L
 KBPJ0Er9iuJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ4d5+wAKCRD6PaqMvJYe
 9XYFD/9BgsWoajurf28PxHK1BNO0U+5m6obei6KHLqmRelh7Hjy5bFR9oBQYxW1uTwHizBCD1Iu
 Sha686bPD6zgbkL43WOQyl9C/sJTXDSx/xGyN4CBhZKXoTCieKX9MLU8iAUcYHwguYQtxgvo402
 Cg5hO3XQiMySCU9sspZQv3Ic/KoAPMOb7017KnGW0kwDiXzr48Acb2vJxL8xvlIHzRO1Y6gt0zE
 ZuW259sWnuOrrzJuUltd2wY1qHfgzoov1H423s4tFArOAKeh9amPsGhLxxV5YpI4XzCBs5G+Kfr
 wNstw12LKQmlJD/YC9dVdf0nGJatWOQjyoV+BCjrnZvB72zPOnX9+YaghWTGJ0eRVNBzjVKtIj9
 iLJeZ4T79d1J75bJ7PEQ+63POUCcPX5NsglGEP4Kb5KV0rJeKHt4SFHFdgVSzOcsy0fTzgl1SrC
 C1rRYnOFwK20lr/kCxHeOn72c5DSnak5wej9fWYAWZrzksyGPV9R62VH+gPBOgVkIEMG2LJjJN2
 WiP7JFmaojT7lD6wHvEmhrJnRbTP+gJlgLxSuUty5Y1rVKaY833m2opAkZraPlcCrvL86/R48Bg
 QL4hKuUbbL5i6P8p5SGxkyQzjpn0ykoq7e7eG3MEJgFS8hkgkJgvU6Bw11uEzmO5RXsZtYeGV+C
 qIxUKKjG0jacl9w==
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

Add support for X403 format.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/xlnx/zynqmp_disp.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
index 44cfee6a0e32..622d1dfac42d 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
@@ -319,6 +319,11 @@ static const struct zynqmp_disp_format avbuf_vid_fmts[] = {
 		.buf_fmt	= ZYNQMP_DISP_AV_BUF_FMT_NL_VID_YONLY_10,
 		.swap		= false,
 		.sf		= scaling_factors_101010,
+	}, {
+		.drm_fmt	= DRM_FORMAT_X403,
+		.buf_fmt	= ZYNQMP_DISP_AV_BUF_FMT_NL_VID_YV24_10,
+		.swap		= false,
+		.sf		= scaling_factors_101010,
 	},
 };
 

-- 
2.43.0

