Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F0FA32948
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 15:57:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 059EB10E8E3;
	Wed, 12 Feb 2025 14:57:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="EQbHYksG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9449B10E8E3
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 14:56:56 +0000 (UTC)
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id A1DBA19BF;
 Wed, 12 Feb 2025 15:55:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1739372135;
 bh=fFbDQjMv08pbZ+GS9RJNCrHnwyHjHAt8x+pQ0R0Cwsw=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=EQbHYksGFVBrAPeQOt4ESxawcmddUdC44o7mKYJo+RIOhxvP5++M0OPiZRHDiJ0lD
 7wWjjX/lcdx0yHATsaMlZlP+RksKqnrDgWcpzD2InIA3+uiGmU1/y7EEUBJcZp5AQu
 sAwKNRb6O+t31BHbPkOBXi8n2RKvMOZDr4NRAZq0=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 12 Feb 2025 16:56:12 +0200
Subject: [PATCH v3 08/11] drm: xlnx: zynqmp: Add support for XV15 & XV20
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250212-xilinx-formats-v3-8-90d0fe106995@ideasonboard.com>
References: <20250212-xilinx-formats-v3-0-90d0fe106995@ideasonboard.com>
In-Reply-To: <20250212-xilinx-formats-v3-0-90d0fe106995@ideasonboard.com>
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
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=936;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=fFbDQjMv08pbZ+GS9RJNCrHnwyHjHAt8x+pQ0R0Cwsw=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnrLarqUOAtxO9XOj3PUvphZINF3knc3icLJQG6
 81LK1Kf0H2JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ6y2qwAKCRD6PaqMvJYe
 9VLjEACrytYdowKq5+iV/VBNe6O/sHK+aFX+jMOqwgw1KGLf5MMkAwQUBWfcrmM4Mi3JYlvtEK4
 +F4BnGjmJhU5/REefGoocQbKywgGZoxLr5cqneqv0+365KqRc0aStsW1j6q0iuaQ+tSQ6zQdhBI
 TSFtLSf617oM4y0cWbiP6+Xbabh9MJhPiKVdjnaZibNJdiqqtAYAzANMRKRQoctdJFOBKDMTKRu
 OCqrDFMeT+pi7VdJ9cNEO4gXT3ZTyTMHGtKnsSmvm28aTz5zt4/KT7hwbxF1GTprbu/+Jd8bOwQ
 wyU058IHkWF5AJhpnlxJ/PhIQcwXKX2llzLx6NHroHovVi8hjvwGO+oiopE4uRY8g8Zz4qCCHoS
 liDpR+sq4XFnZE0ih88E1kraUaoYlN2A4fdX3OLSWqVR5pIHn5oumj4IXRHVG0HaNy5qj2fJlAQ
 FQ1WV+L2wSGPsNxF4WRgIP8yl80JDJLSkrXQtETXcNslCBQ921AdUBzeD9NNv/CE6/tKFd64Hc5
 m5tJk6BMJ0AexLS7AoERsWoCi5BrV8McL15fahtvAfzk7bR681EuC4iaUNCVuyJbxFxIgbT7qQh
 LtzAhwfTdCuWxWy+kizRlOBymFADr/Ri/OJbYL8uj2CFAjtDSyTVE3djgCIq7p48JD5Zslu+FlU
 gkGzI8gSoa+h1lg==
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
index 3d4ade571f0f..32031f52e114 100644
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

