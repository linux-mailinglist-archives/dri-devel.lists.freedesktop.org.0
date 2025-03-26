Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6605DA71767
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 14:23:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBEBA10E6CB;
	Wed, 26 Mar 2025 13:23:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="loFlaOpS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D2BF10E6BF
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 13:23:27 +0000 (UTC)
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id B7D1FA57;
 Wed, 26 Mar 2025 14:21:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1742995298;
 bh=oFm4U0hkZjYLWnEJeFMKYjlk7egwcLGFKCoUSOTzMSo=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=loFlaOpSHXOIfkLHMiTp3pdPZtMRlGyEB9+OTGbJq36Yo6Q27gTsb4K7q6zZ3M3yQ
 eiHVOojyCF47fxt/HJwoS+qzJFieWgnH84D6sqlS4M0+5ecoGIKH4wuacBfOM8vdGQ
 H4L21cO3qSiCWNYcMvhUEnV+s4/LauCyqRhQjzvk=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 26 Mar 2025 15:22:53 +0200
Subject: [PATCH v4 10/11] drm: xlnx: zynqmp: Add support for X403
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250326-xilinx-formats-v4-10-322a300c6d72@ideasonboard.com>
References: <20250326-xilinx-formats-v4-0-322a300c6d72@ideasonboard.com>
In-Reply-To: <20250326-xilinx-formats-v4-0-322a300c6d72@ideasonboard.com>
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
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=766;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=oFm4U0hkZjYLWnEJeFMKYjlk7egwcLGFKCoUSOTzMSo=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBn4//Dis0L4uQRt67L4P2Qc6MhWqd7lhV/jzhvR
 sHl9RUreaGJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ+P/wwAKCRD6PaqMvJYe
 9WPOD/42/uhBYTjLB+c6OwGMl9PEeXPllE5b/M6xr6cut6fEWSE3OOMpJxPdZU0gVaXy1JND/Tg
 AfWAAXNMX9oed7VtBx5tmWlzRZBZAJ0fpo0Dkr7vNYq3DqcBtvoXSEzpChs0H9Ak8uezBSQXJzP
 yMo58+ab4qdyak5zjbxFKuy9f/ltofwWSTpAQfi4F0coGleM3oyIEIibcjV94G63J3TajGOqsuY
 hBA0sopkfh70UIgxE5Zi9JkLz1wz9ply8pziDfVc0VDdHH8/VNaQEW5S3Zr0zzQ8UJF0Kas0n1H
 3Q3pCZIAqSOUNX1E4phi8G+A0QiRkHx8ZNldxtq3JOI85Vloyf9WdXvG+uZRI0xDMzqdAS6lqgn
 2OS6D/zay9zmNTc5/nG8tMwrolUQIFxicGDM08j/15Mr9ig0s3Adzm3vF5xHfmOoaQiFw8yHKHT
 moxsWwZUuVxXD/3yAMmAurU79czTpt9jc8PpJN0dE9ZVUnpWk60MB9tluBACrDoGa1e7IARVIP9
 gvZSBuwTMA6P3nMayh5H+zYE0M/vfH5GCcisvc36lwIoKDFd7gMj/e19goNXoI2YfK58r4oCZkR
 NioIgz5ZvSQKqKoz7lyZQVT96XFeN+2OhO0l/8D+w2GlRDo4RtTjirCiyLZQ2DNslN+xaXM0gEu
 ZiYS1ObRywAVzwg==
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
index ae8b4073edf6..ce685dfbf31f 100644
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

