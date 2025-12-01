Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B499C97365
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 13:19:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72C1F10E3C6;
	Mon,  1 Dec 2025 12:19:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="m0e8QnPD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADA5510E3B4
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Dec 2025 12:19:54 +0000 (UTC)
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7BEEB1E2F;
 Mon,  1 Dec 2025 13:17:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1764591434;
 bh=BqlrzuF9SVJTOtBOmexpRoqMva+a0mHR+U4P2a9DVlo=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=m0e8QnPD7REu4xoj75wIkFyVWzbym24RSsQlREbnfVON/YHwUC0rTga04FVuRSNoz
 ABxFHoeFGsLk5MBlLh5rUNs2qW2fyyQLnk/RAYxb+B3+hRlUQQX3pVi+YcI3QPW2/L
 twgnTp8zJ2TqP1Xih7Tu9fWimJNxGZWH6HO3ojPI=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Mon, 01 Dec 2025 14:18:50 +0200
Subject: [PATCH v7 08/11] drm: xlnx: zynqmp: Add support for XV15 & XV20
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251201-xilinx-formats-v7-8-1e1558adfefc@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1053;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=BqlrzuF9SVJTOtBOmexpRoqMva+a0mHR+U4P2a9DVlo=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBpLYfFwrt5/gzH5MM55abiHE5BtW3y0F2PH7NCn
 ShM9e7J88KJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaS2HxQAKCRD6PaqMvJYe
 9WptD/42n7d9GhmtGI3R7Dd0ENEX/gu5k/f/okNSKqZ8tTURHLAJR/9qAwri2NZkykpbSRb9sGm
 /ze/egv7DAgC9zLoyVtOX5gqnfoa1HGScQdRQuV+V74XnXJXAel3xvzy+O3j7HmZo8O6KLGDQ4Y
 0ETuh2A+M3MwCxXcFtFHCDzAoFIBz0YpjoWYf9uRv5vBrIMmwUp0FnZhXupBnjlXxph2rQeNCz9
 ZvVPkKoePMKTZa4ZeBElv09dhF3vsPDT+G3VYUvPkCGNf5E8CJ60JYARfcEhT3xH0Sskv9tE0B+
 AyRdVAcUuVNDdUjWyv0MHpVzoQ5Cps3eL7HHHdAk3IFAFxqjBfS17bpMNpRuXflIi7L9mlDjNdZ
 FWfEtG1ZiqaTg4GgpusjNIRa7dNpIHaIqGtnY1qZVr4ZDLhWhLmemD0fc5S7bnWl/RzHHaF+u3t
 neqGfmO4r36HMuhI4hvOGCHiRnSIyM/+a4uO+hJR8Lbc9yQdqB+QCOPICPaeOvN47xAr7SUzjHd
 O4fV/o+vDWK38ag+I2UWDRZU9ZmyW0CcSs0SKNSIHWRxnFruJZRCI2KZSCJA0mzr+hfMV7Sqpy7
 JLfwZ2KXj5QJWYEpaaE48jPIC8f8DqsZ19pGPNHQd6vSkfkdQPYgMpf3CtBiDBGsaOGNmKbqZno
 ktXEGFjt2xsuBew==
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

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Vishal Sagar <vishal.sagar@amd.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/xlnx/zynqmp_disp.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
index b9883ea2d03e..1dc77f2e4262 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
@@ -297,6 +297,16 @@ static const struct zynqmp_disp_format avbuf_vid_fmts[] = {
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

