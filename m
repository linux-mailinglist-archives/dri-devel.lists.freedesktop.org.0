Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69669BB0777
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 15:23:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E63110E70D;
	Wed,  1 Oct 2025 13:22:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="iXw0QNt5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4224810E710
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Oct 2025 13:22:57 +0000 (UTC)
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9B83D19AD;
 Wed,  1 Oct 2025 15:21:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1759324887;
 bh=Z4gNQ9UWmg8H9YFAi8N+jXqbfBppeZnMk/tmq5k2slI=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=iXw0QNt5bU8P8raD8mTzXneQXaVochjSwjAIh8vIUYNORHRz6hTYyNDMcZOtYz6Gk
 Pnk9lmsmyK9HleUt+UuhlEbejANCBP7QBqrEoRmAvluAtHVXcxtCi0Bgmy//7ZqELr
 yCPjgnSVBR0CJuTYPg6UZslspfwgN/URCc2UfXyQ=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 01 Oct 2025 16:22:22 +0300
Subject: [PATCH v6 10/11] drm: xlnx: zynqmp: Add support for X403
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251001-xilinx-formats-v6-10-014b076b542a@ideasonboard.com>
References: <20251001-xilinx-formats-v6-0-014b076b542a@ideasonboard.com>
In-Reply-To: <20251001-xilinx-formats-v6-0-014b076b542a@ideasonboard.com>
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
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBo3SskYkFp71Muh/vUeiWioR8OLa3U9Z/Il8HAI
 lOM9I75I8OJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaN0rJAAKCRD6PaqMvJYe
 9ak5D/4keFN+7hSFuZnonz+gZBC9uEwApG91/goDKyuXfmHO2g1O3ubofSDBSPvup6LdJUQobdz
 Ye5ROKzfhx+AyeFVcwcjAVZPP96nQxFn6jOd5J8X0qCT0gI6QeJZaOD+7YOgIL92bsJbZ8hbIPp
 EJnC4ukbUkzgrWejxmeV06/o1XISDsvPsgrU10PcjMzcfSEsCPcFfyHeJDT4AJujxdNOMaToeqb
 mx9aTzI5qyrQhgT9RPaNPxZ9XC4Yktt406dnv2KMkKNZxz6As7fgNreAPjq7KckthBMc6tKG9Sd
 4qyZkIjjy++saCjxL0QYAHnW78K2/BjeNW3Y9LYhgVDpW36xFWP0acqBje1F4AFrwa5pu+QjS7i
 4E08hnN+vFQ/YK6Cj5CswnGg7y3L2tgivO3FJymWBTShsjTg8OjtCJrkeo6rLMAyMtYLoiI3BMt
 gBTpqAWrGksduaEU3XuyWQBXQOE1gh2EOVd09ziE1/OSuDOThqD/pzmB3RJ28zmN6lcb1ihzJrG
 cm2GCA6fJOcjmSJZE2cSxFQ7d14F28Vb7QHisMwBt0Zt7bpkhvTGwKhKqxx9a9IeWDRENNmvxCy
 9OuB2/vrdjb8SlTyU1vsfKa1UHZTE+cmKtfmdqv68W1YW2XvgoMxGxqD2dJs+KoCFpIUmaafPRw
 6Iucigxyk+8Ge7w==
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

