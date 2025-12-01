Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 591A3C97353
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 13:19:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 994BB10E3AB;
	Mon,  1 Dec 2025 12:19:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="RJXJ3FbB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 444DA10E3DB
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Dec 2025 12:19:41 +0000 (UTC)
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5791C3A2E;
 Mon,  1 Dec 2025 13:17:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1764591436;
 bh=Z4gNQ9UWmg8H9YFAi8N+jXqbfBppeZnMk/tmq5k2slI=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=RJXJ3FbBvMVWTPHrWrkfjXJNm9lOXcQIIWeIVl2tZoYncqph+0l6rG/paaBigrg8C
 f4xJ5kNdoTqbrgjNqnyHZzj/8C35R3Fakg4ntH+gv2zWHFzJBZm8K8IrgvIl+L5Iw6
 rBNB9t784XR8156nGaiI9D+RJ98xCby47z3rfIfk=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Mon, 01 Dec 2025 14:18:52 +0200
Subject: [PATCH v7 10/11] drm: xlnx: zynqmp: Add support for X403
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251201-xilinx-formats-v7-10-1e1558adfefc@ideasonboard.com>
References: <20251201-xilinx-formats-v7-0-1e1558adfefc@ideasonboard.com>
In-Reply-To: <20251201-xilinx-formats-v7-0-1e1558adfefc@ideasonboard.com>
To: Vishal Sagar <vishal.sagar@amd.com>, 
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Pekka Paalanen <ppaalanen@gmail.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=883;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=Z4gNQ9UWmg8H9YFAi8N+jXqbfBppeZnMk/tmq5k2slI=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBpLYfFk2fgsv7vm6+EyIOht9Yod2Kz1oSBTtdML
 g10hiWbHXiJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaS2HxQAKCRD6PaqMvJYe
 9UpsD/48SBhHrXPQfvtY6G/LDIGvNqNyb5dQqRjJrBIHvTXP92mnPYt/Be+LzDKFdxeW8r3ernl
 ZfL0UVhux+plKgo/v5Vo0cKvnHTeUAKzdpBIILB6KeFn3nenAPR5NCss7krgeOFy+QPKV6SU87W
 08vX4FLcH2MicuzYV2JjQNG85E0U1hDuKeqsiFw64pXZOG54XXliUa1F1ubVUkpXMIHP17sMZVR
 K4pVcVRZKOWxceJxc7jKnzm0wtVgekFwF9+Dxj7530EN6wQepfLvSXdrMNQaTwrcwW3OKeIbghs
 3rtkj3PY1SNhD3hyzMoEdRyfuwZYjp1Xf6C42z9+86FlHeoRsaHYuxnPQ5YKSr7/LeK7MT/MzlG
 aeJv6XSoLCACdQxBopDOXi3riIZiHFOhaqNSH812oHv09g9juzb44+/kySehy/T7cZLN2gcKCzg
 CBU4WKvpeI17+Q+t0qLT/NPG7cnLjGJhJKi77m9QT090Fb3G6mnSS6YGU0/27J6Aw87uyYfaSAH
 nI0hQ6JgcJsaoxL5lCiatPNY2IxAUP4lVHs6irfqSzYe19K+NcO+Qj3Al76eqJg1bBp6KAIo3+i
 Gi0QYJTtt1se4zJGrTsy4P1FjgkdADipnUKID4LW2DgYzL/iRArgdXuN1p55H7UvMNU3ikVnzTB
 oowitBDtkubFxdw==
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

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Vishal Sagar <vishal.sagar@amd.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/xlnx/zynqmp_disp.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
index fe111fa8cc13..b7cc7a7581ad 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
@@ -317,6 +317,11 @@ static const struct zynqmp_disp_format avbuf_vid_fmts[] = {
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

