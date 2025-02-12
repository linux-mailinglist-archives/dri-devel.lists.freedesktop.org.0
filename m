Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C83A32947
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 15:57:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A8B610E8E6;
	Wed, 12 Feb 2025 14:57:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="BiRJYl9J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 432A610E8E3
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 14:56:57 +0000 (UTC)
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7D6231AC0;
 Wed, 12 Feb 2025 15:55:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1739372137;
 bh=r57NaWWFPPhC7i0kzoRFR+eXfop5yw1bzEAG9VvJnXE=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=BiRJYl9J9v0stVfF9C+LuFyQgNUoZXoouVYNH5HOW6HQpJTV4LEa4s4l89GL1KVjq
 3E2ZVRSx2tY8OtFkCvmBKlufynggHdYWLchqFRIHQ3VXoNSsrSGA5Y9bIKJhP79XAb
 g9sn+JgvOlqOlWg251+nGevs4qCWV9VBMqbI8d9M=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 12 Feb 2025 16:56:14 +0200
Subject: [PATCH v3 10/11] drm: xlnx: zynqmp: Add support for X403
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250212-xilinx-formats-v3-10-90d0fe106995@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=766;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=r57NaWWFPPhC7i0kzoRFR+eXfop5yw1bzEAG9VvJnXE=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnrLarT4sfICZwSzQygIQW+qN3PxZZDHAA/ei0j
 k3MLQ7YGguJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ6y2qwAKCRD6PaqMvJYe
 9UbED/wKxuR1EVTmOmYxzy+5rw8WwlvAgm4Kbik5Q4/WErN0ROBdVOiGWokOh5dJY4pkLKBs7hv
 bjp1REkrTLmYSPJdfp8UIQF1Egdl1lxwkRccqxz/N401eiswBLFgdta5BFUwSxJdFOvAUFGqm6R
 QgaJBtubbCedV4hf4SqSodmthxw/LQ32M3LppfA86ujprm3s/1LEprHFotpUpNO3vbt502Q+iVm
 cHnmDWQADVTiEV4RXJanxgv26LQWiqS8H31zGrK1d382AIsYEHS9Ll3MFeR4iqDqzD4CDn3HpJZ
 9dMq6wOL+xGS2H2a0tKO+RD7ooD+xI4Y7jKWU7GutKWZYR2u1bynu2DfuC/CsL0aZOdU77cHIcG
 lK1aYWEdnW9dnc7uZ4XSJPnhU5cRq1yDY8ywsnmXkM91AF9qxEsd/kbWr3zFomvl5COGifL/9t6
 2bb8gOQyzyqXelsRnjetQSynirCF24nndjPBLIsqRle43k+61DlhQBnNCuBk1cdbQdItWrkNsWO
 eO0zjqUiCV2loS/jh2MU3SRRMMTE2SkdHbbwX9XtrsqpGToZDa2cD/Yb5L/ymuItf5LP/GMA+7T
 cITJm8TzxCrAip1yOGb5MOeV+YPEwjKENxNIVgmEmKZxXAmQjtnavm7BOHqgkya5B6nWhG1iYX7
 pnv2mCKj+uzAIDQ==
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
index c820df97aa28..7495e42677a6 100644
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

