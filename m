Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7258A9C686
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 13:02:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 115A510E94D;
	Fri, 25 Apr 2025 11:02:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="cwlt4lvl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C29310E948
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 11:02:01 +0000 (UTC)
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0AC0ED77;
 Fri, 25 Apr 2025 13:01:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1745578917;
 bh=vgUvtrRNpZAPQ2ZmQyEkc69x6eOUJGW8mLQ5lXY/P7Y=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=cwlt4lvlA+XMhHWdWlmQ0xkqfca76oV5KWxcoqKsbOHGKRbAE3Z1G8vkCrDs0vDkQ
 INZG0PqdlON0OmVWaJfoBWkP2qbJnoxiccmnAnJx5aaltwUZjX80P4HG3YfDJm7fT6
 Q7u16YgqOFDB+Uk2Vq/KDPdV9RPPiu9wkaZo6SPQ=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 25 Apr 2025 14:01:30 +0300
Subject: [PATCH v5 10/11] drm: xlnx: zynqmp: Add support for X403
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-xilinx-formats-v5-10-c74263231630@ideasonboard.com>
References: <20250425-xilinx-formats-v5-0-c74263231630@ideasonboard.com>
In-Reply-To: <20250425-xilinx-formats-v5-0-c74263231630@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=833;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=vgUvtrRNpZAPQ2ZmQyEkc69x6eOUJGW8mLQ5lXY/P7Y=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBoC2udE+M2IUzyHg+n0uVRE0pt0BMbSKufyO3ya
 mPxX0j9pI2JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaAtrnQAKCRD6PaqMvJYe
 9eP+D/4rxFktMuTr1S4TAmqadr6fgshnWoCW8feEkf/9Gz5K5SLslxT/189YdWyNqEheqWh+cUh
 hv8YvRNA2Xr1FgAh1aB2InKvbfLXgS7hZErx1ffJb28ZARteJb08jIGorQMfJ4dJM6kuYMpI1hl
 e2+txzudidZVgGxb5pzji1X5OkgW7O8ILD3gszMbmxqokATjcpBGAczvlSbiBShd4NBXQHe2xLX
 kfszcqMRYfdJe3eLoNL+S3oxV7C3OUCb4WavK1zhvXlJ8z4PzUaVv5AN20oncSy/8H/Yf/z3190
 1gcvyhmKxGdWIxilxuvLSi+3WzzAOENRlwoZovvu63h2VJljV4ykjqBQicoS5NofDzaUlw1KvsZ
 MuaHRi2770rdZBroF8yqAYgG1EK6urkBsNaLXtqi4luHeZ0uy5Pkp6eJzyYf2hSzKlbOU9sj1sW
 Nh/1/ibZRTbq6YbZ04EJLXeUqWbvFmmIC6ojkDd8JuqAukfEc3YOf1CA56ez6tnAdkAgbaGb/w+
 MBBF6eMe1WgCqO1x2swaXthx3NtHskfDCtn/pc/5GkWzagEmq+NTczTr368IYPgXUOdm/gz3wiT
 PacjpsByNTGQZ3tcn0e+PvFMBvWPNdNl6/iYwE8dAVUL5hAbcQ/zsTfZkO6x6N41nAARz1+QiTD
 tBd2YwzV/96vPlw==
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

