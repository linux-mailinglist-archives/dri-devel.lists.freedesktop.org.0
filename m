Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6A1A71768
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 14:23:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 033F610E6D0;
	Wed, 26 Mar 2025 13:23:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="EfwIHjRQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1516F10E6BF
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 13:23:28 +0000 (UTC)
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9AE2E1963;
 Wed, 26 Mar 2025 14:21:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1742995299;
 bh=slBT5ASGlHlLYRfFHdYzBrpOFjHVj6vIx9ezqvhm0zk=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=EfwIHjRQVLubJCVoeMMp3KoFoKUUhiKhawQtKOditfHbhDXfv0f7z+Y8C4fzubz3s
 5R+7hWkPYIh5iDBk4aZbqPBZjlZg9ffj6hmiPzEhfg4vMX7lcn9Txh59KBmO0moakN
 a3XsJQlLP1fpQ3lZ3bj39MLg3m0hRL6vW8Gz81RU=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 26 Mar 2025 15:22:54 +0200
Subject: [PATCH v4 11/11] drm: xlnx: zynqmp: Add support for XVUY2101010
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250326-xilinx-formats-v4-11-322a300c6d72@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=781;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=slBT5ASGlHlLYRfFHdYzBrpOFjHVj6vIx9ezqvhm0zk=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBn4//DsRCMB1WLCta1estzXkjXoSWER8pSvhQMe
 KB37gD3tzOJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ+P/wwAKCRD6PaqMvJYe
 9YjgD/4176gMq72C0vNw+apzQNHJlqYV3VbqPh3TMJ/E+F3SJ8igO26yenPGmMC6YL1NwmI8sD1
 VCRJ7Bzr/G0MG+FbqmU0eUeUGlJCwoixtjCTtiRW+fyoNYRJs+cVKJLrK4WAiylri44RPu138eD
 jh4ZFaS8Is9jAU3Qj1n5TwZsAhVof+4jWjqpX72+98iTUTklWo+Xwnz9b74qdwQ3rApzKAhX4aM
 hk3T/wJ4sDRFMrVimMG6TBrMvKQ0BRIQ+/cql6IxNwx9liLQbAtTL05IDTnydTNFqTad6YKKBhf
 RVRtykBfQzVP6z0gF/klnlVyGASfx1mIG8DoCfNINcCSC9k0PTGg7C6KI04V6y2W8/FxW4lOQWm
 LC9yedg2gVmS3AJPvkWtzdBog5DHf0GUZOW+A93385F/T9C7PvrjJRIcdw2dJe8WSL+eufWCul8
 kQYYvNeerHKWd+eUja/xUTQlbQ5AH4gs80zzdbfQ7xOIG3i0k68taatYwl1/MWrnyloAvSzs/yO
 lYCha1+wkeM7CnR6bM3dFzwkA2XE1n73A0/s1/dmZOfo1gb4HY2tDv0kStCfk0XrWM+ZvT3vAsx
 nsyBMKs5r1FoP5nPUPqpBcl8uqABtsYKzFu9wSDluGctgS9gSB56vV72Fgyw/MtJq9CknEbXLMI
 nQ0kBNBUuV7BMSw==
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

Add support for XVUY2101010 format.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/xlnx/zynqmp_disp.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
index ce685dfbf31f..79f58e06f38f 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
@@ -322,6 +322,11 @@ static const struct zynqmp_disp_format avbuf_vid_fmts[] = {
 		.buf_fmt	= ZYNQMP_DISP_AV_BUF_FMT_NL_VID_YV24_10,
 		.swap		= false,
 		.sf		= scaling_factors_101010,
+	}, {
+		.drm_fmt	= DRM_FORMAT_XVUY2101010,
+		.buf_fmt	= ZYNQMP_DISP_AV_BUF_FMT_NL_VID_YUV444_10,
+		.swap		= false,
+		.sf		= scaling_factors_101010,
 	},
 };
 

-- 
2.43.0

