Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95605A11CCD
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 10:04:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34A9210E57B;
	Wed, 15 Jan 2025 09:04:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="FZ8Jyj55";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4A3E10E57A
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 09:04:03 +0000 (UTC)
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id AC7C93B33;
 Wed, 15 Jan 2025 10:03:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1736931785;
 bh=3lV+l32vg2JpWZEq7vy7NUNpO/y6nBsRUh7Y4B6/+ho=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=FZ8Jyj55RQ93WqJAAiPdlxbMXxgUwhO2i4D3Z61ZBkeFDsZEGicPJn6/5tzFDTc+9
 1TUQFBqk2rRDRNJcnTCLlcUmIX9YOsU77lutn8H/VHKp1tynIMqs/evASQ/0cBLuUv
 zn9kin6qMoJOYmPcl2VGPvvOR8xe21bPbQ9R65fo=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 15 Jan 2025 11:03:36 +0200
Subject: [PATCH v2 07/10] drm: xlnx: zynqmp: Add support for XV15 & XV20
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250115-xilinx-formats-v2-7-160327ca652a@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=936;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=3lV+l32vg2JpWZEq7vy7NUNpO/y6nBsRUh7Y4B6/+ho=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnh3n66hQ9SWwHWE438qJQhC2mJUfR5g9T5WMjx
 tJLMQkt8eiJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ4d5+gAKCRD6PaqMvJYe
 9U6JD/43ai4K/IWdQarREzPRDtpuhU3w7wcJMXYYN5J2kpQ+mrcMOq6C2dWMm+VBznkGtjMZSwA
 c/Iir9PPohmZO5n68MYt/axhq5Vtv7EbsMYxiCObXbFALD4jCihovEqtnlyKAB+Gemngjdr6+cM
 n8Juj8iP9Rxv07y2bsmSIYTXpk7yKqKioV6JZPAGQzUM+q2SOVKCQPezdaDVYfD+ck14/JrNS28
 UofnGflMphGbr4tvc52C1nFWoe3h8C0daKdOkiCXAnDblQeakUragcV5guKzTkj9LyGYjYimubZ
 HnO0aLtEtpYw+mvnO4MaDRuPke5SHs1FYuGEwQg16Ih8yprvF55DELqaxUPpgH+y7AsaPaik9/T
 LD5fYEXzFUvQrbf376nrDFPbLhV2YiUHJaGkoiS/YG8yusfMghc3AAN1lXyJZiDhdtJcDjNrl1w
 gdWl4pEKVS6D708+W65GG8lGrETSty4vZDJkbUnuNjWacF2pOSwuxoBDfxocU2azbrT15pFgIo5
 9WHSH2qv8ASY47IcMQvI3UvXuMu/0tZMSyW6CyqJP3gXsUyPjkhmeNf9xfAZpoCY3T4gen4VmjM
 7MJ+/dKhGlmPTM3hT/BVLp2k28AM06PlU1QWzHk8tZ7Uh7zF06cGo+Kyn9y3GN67M75Og9HQs62
 ME+8LWfSDcA3raQ==
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

Add support for XV15 & XV20 formats.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/xlnx/zynqmp_disp.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
index 57221575cbd6..3998754e367e 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
@@ -299,6 +299,16 @@ static const struct zynqmp_disp_format avbuf_vid_fmts[] = {
 		.buf_fmt	= ZYNQMP_DISP_AV_BUF_FMT_NL_VID_YV16CI_420,
 		.swap		= true,
 		.sf		= scaling_factors_888,
+	}, {
+		.drm_fmt	= DRM_FORMAT_XV15,
+		.buf_fmt	= ZYNQMP_DISP_AV_BUF_FMT_NL_VID_YV16CI_420_10,
+		.swap		= false,
+		.sf		= scaling_factors_101010,
+	}, {
+		.drm_fmt	= DRM_FORMAT_XV20,
+		.buf_fmt	= ZYNQMP_DISP_AV_BUF_FMT_NL_VID_YV16CI_10,
+		.swap		= false,
+		.sf		= scaling_factors_101010,
 	},
 };
 

-- 
2.43.0

