Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B18A6A9C687
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 13:02:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83F3910E94E;
	Fri, 25 Apr 2025 11:02:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="rdzHMyNk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8098010E948
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 11:01:59 +0000 (UTC)
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2A4E919C7;
 Fri, 25 Apr 2025 13:01:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1745578915;
 bh=dH/dlMLBYVvjaYgnpbn3Yiq6mH0D3zJAK+bYStHp0Qg=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=rdzHMyNkvRnhOjObcdN5P86oFgBBSbWxc/4aZXdda4BhJM1C/aV6ZLRA4JCgBC1F4
 yawicCiGmJjHDD8ZTqRZdLZ8bwBsg6DA+dkGjdE17nQPtJ7R/TvMjsAwdMK1RDUyOh
 YNfEkKypTvoXT51FbWSlbgY3aIJBjMq8ZXNhJPq8=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 25 Apr 2025 14:01:28 +0300
Subject: [PATCH v5 08/11] drm: xlnx: zynqmp: Add support for XV15 & XV20
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-xilinx-formats-v5-8-c74263231630@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1003;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=dH/dlMLBYVvjaYgnpbn3Yiq6mH0D3zJAK+bYStHp0Qg=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBoC2ucasYpFKolqxwj1G/ntFRZT2bUW8HAf9bIf
 i57uZDofk2JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaAtrnAAKCRD6PaqMvJYe
 9d73EACFLakNfJ8dpjR7ODhm+TmPkXNDk02LV1F05j4aZp/GhHlCDlQRS03BhSOkoBTTBT0lEQy
 xGNQZ1x7IhSnr6JHoM7qAcTbK3t4mkFwcWCgm81T5eNwrrBC5587Si4vnxMW8jx1k6bO9xegoC9
 ZGzYxGxXE2qJ7Nwteb4SNMvcD1+YjU9dtDN9YXFVWbHBLupns6KuVinQmKAnbT8qopVRSt9EC8J
 +EY91SBUuBywk4FURAHUo1gp/k7l7yrTFuP+chmllSW5+SygCc86iROUlFUqjKpk92PfywMH5Ms
 r5epi973lTaMOKICFjKTFMOcoRlIrGuWvQP6XNQbXDbucnk9o4SzvJIL/als8fyXJeOvdJRvCAp
 G4HpzdvF8wYuwibVVjiPhikMtjPyc6IBGK8dpUoCGaQpKdbF1fm2S6ZrybvBtFxP4swS0M7M1mH
 rSwl2IfKQNOllt3QRriKaD0WgidDfV+7Nbh/z7E9oWnk4uRrhvIM6ltWzbuo+HZSoCIymn/t7HV
 nurDIxn7df/FLJvW6PwhE95pLIk2EUwfyLKC2jfuPmmeRkdswFYyl/5PIvUp1vHBXaYExfDLm7W
 o1W4IVqIrpBBJZig2hp7xOjL7y3oQfpI6LLkmr7LIMLmxsoPpM40xaC/tKZYKIDjhlOMlPG+arB
 UfvXVopuV3KaPmg==
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

