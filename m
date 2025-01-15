Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F165A11CCB
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 10:04:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1063C10E570;
	Wed, 15 Jan 2025 09:04:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="nBvNIVCM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DB6510E4EC
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 09:03:59 +0000 (UTC)
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id AFEDA73E;
 Wed, 15 Jan 2025 10:02:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1736931780;
 bh=BAt3uc6nPGNZCBjCplDEQ3lvr4SijGOwtJPTUPOoygU=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=nBvNIVCMJcFLjsyAAiwgEAt22A7Vww6QXRNRtXliezNxkib1UBowCwAzEcZtiayev
 k8umeN5vz1EJ4/dxA3u0hlEgTp20+ceuRbSyDFK/VW+km0RuHALpHpfcGORL6K562f
 +TEuOYVo2flPlgQZ1bVaYq9z59ioFnLF539Px4Ps=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 15 Jan 2025 11:03:30 +0200
Subject: [PATCH v2 01/10] drm/fourcc: Add warning for bad bpp
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250115-xilinx-formats-v2-1-160327ca652a@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1442;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=BAt3uc6nPGNZCBjCplDEQ3lvr4SijGOwtJPTUPOoygU=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnh3n48iSXc2BjCEN+uQsHpIk0Q7sns9A9Gr17N
 grkQiX/f7CJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ4d5+AAKCRD6PaqMvJYe
 9fDDD/43GBkraeVwOyPiSc0RunT0Nk4jtVZ9ZopUVkIIdWStVtde4EhMxJPHIa+gPEmUnzmr1tX
 m+/LjX5qGj/UKXLdEOd0m3BqfjGbUBg6nsR3nDc8r3d4dJEZgp+0hPNbbIXemb/FKtvRobqSr2w
 wrzOQUEk7Q0boBDI+9uJUrf+laEhRCOKBkLedKtsJ1Vla6EXuaORV8CUx7oXvPOHNJ05QM+ekPa
 HAX2OMcRbhvAHC0f1XhXc3AxoEH+CV3m2SytVRLkowQoEkS2WKcC3DVomB177DbjxC9Pj5Sz57g
 LqFf8D901TFXmVvTAzB0eLHniNjDzN67AGFdCmcIX0ozGZklFpjfJS6oyWa62VPOzumjsny2NOU
 Pm6M9e6zGCfScXU8DUExHBvfcoLCtLpWV6eLJM0VA7CVgNS3BLZ66E8Cv4WsP9hmhKUmIoCrAP0
 3MTY+e9Gle6idG/+K7iDcyfJS5KMeJiHmkH6CO8BuGvneaMBVzVOZ2d3XMtEXOOiPLeZvMsFMZL
 iqz535t+/p/o3wiueR4CC+QgUD2R7K6pMK8OqA6Bb/i+3B4fZ93L/UkwxR5vXooQvL03l+RHJ08
 y4GDcL+NROcYz6NBpAJOczSZ+QNtjk7p2W4EApu+05V1qmPUpR1t76GR96ATbCxLRJZoDStgp0z
 DW0Hj54r1NWFmUg==
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

drm_format_info_bpp() cannot be used for formats which do not have an
integer bits-per-pixel in a pixel block.

E.g. DRM_FORMAT_XV15's (not yet in upstream) plane 0 has three 10-bit
pixels (Y components), and two padding bits, in a 4 byte block. That is
10.666... bits per pixel when considering the whole 4 byte block, which
is what drm_format_info_bpp() does. Thus a driver that supports such
formats cannot use drm_format_info_bpp(),

It is a driver bug if this happens, but so handle wrong calls by
printing a warning and returning 0.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/drm_fourcc.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
index 193cf8ed7912..e84c4ed6928c 100644
--- a/drivers/gpu/drm/drm_fourcc.c
+++ b/drivers/gpu/drm/drm_fourcc.c
@@ -429,6 +429,13 @@ unsigned int drm_format_info_bpp(const struct drm_format_info *info, int plane)
 	if (!info || plane < 0 || plane >= info->num_planes)
 		return 0;
 
+	if (info->char_per_block[plane] * 8 %
+	    (drm_format_info_block_width(info, plane) *
+	     drm_format_info_block_height(info, plane))) {
+		pr_warn("unable to return an integer bpp\n");
+		return 0;
+	}
+
 	return info->char_per_block[plane] * 8 /
 	       (drm_format_info_block_width(info, plane) *
 		drm_format_info_block_height(info, plane));

-- 
2.43.0

