Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A445E2FFE82
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jan 2021 09:46:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82DFE6E9C0;
	Fri, 22 Jan 2021 08:45:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay01.th.seeweb.it (relay01.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80EB96E904
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jan 2021 19:34:30 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 1990D1FA8B;
 Thu, 21 Jan 2021 20:34:27 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
To: maarten.lankhorst@linux.intel.com
Subject: [PATCH] drm: drm_modes: Fix signed-integer-overflow UBSAN warning
Date: Thu, 21 Jan 2021 20:34:14 +0100
Message-Id: <20210121193414.482139-1-angelogioacchino.delregno@somainline.org>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 22 Jan 2021 08:45:43 +0000
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
Cc: tzimmermann@suse.de, airlied@linux.ie, konrad.dybcio@somainline.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 marijn.suijten@somainline.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

During a UBSAN run on ARM64 MSM8998, kernel built with GCC 7.5.0,
a signed integer overflow was shown.
To solve this warning split the multiplication by assigning the
mode clock first to the "num" variable and then multiply: this
way was chosen because no explicit casting is required.

Solves the following warning:
[    2.028003] UBSAN: signed-integer-overflow in drivers/gpu/drm/drm_modes.c:765:20
[    2.028721] 2376000 * 1000 cannot be represented in type 'int'
[    2.029134] CPU: 6 PID: 62 Comm: kworker/6:1 Tainted: G        W         5.11.0-rc4-00115-g38e7d22724f4-dirty #8
[    2.029884] Hardware name: F(x)tec Pro1 (QX1000) (DT)
[    2.030583] Workqueue: events deferred_probe_work_func
[    2.031043] Call trace:
[    2.031419]  dump_backtrace+0x0/0x288
[    2.032144]  show_stack+0x14/0x60
[    2.032564]  dump_stack+0xd4/0x12c
[    2.032985]  ubsan_epilogue+0xc/0x50
[    2.033693]  handle_overflow+0xd0/0xf8
[    2.034092]  __ubsan_handle_mul_overflow+0x10/0x18
[    2.034493]  drm_mode_vrefresh+0xd8/0xf8
[    2.035181]  cea_mode_alternate_clock+0x18/0xb0
[    2.035592]  drm_match_cea_mode.part.26+0xa8/0x198
[    2.036004]  drm_match_cea_mode+0x14/0x28
[    2.036689]  drm_mode_validate_ycbcr420+0x14/0x78
[    2.037098]  drm_helper_probe_single_connector_modes+0x5fc/0x910
[    2.037815]  drm_client_modeset_probe+0x26c/0x16f8
[    2.038225]  __drm_fb_helper_initial_config_and_unlock+0x44/0x7b8
[    2.038931]  drm_fb_helper_initial_config+0x48/0x68
[    2.039337]  msm_fbdev_init+0x80/0xe0
[    2.039735]  msm_drm_bind+0x4d8/0x6d0

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
---
 drivers/gpu/drm/drm_modes.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
index 33fb2f05ce66..dd374c628cc5 100644
--- a/drivers/gpu/drm/drm_modes.c
+++ b/drivers/gpu/drm/drm_modes.c
@@ -762,7 +762,8 @@ int drm_mode_vrefresh(const struct drm_display_mode *mode)
 	if (mode->htotal == 0 || mode->vtotal == 0)
 		return 0;
 
-	num = mode->clock * 1000;
+	num = mode->clock;
+	num *= 1000;
 	den = mode->htotal * mode->vtotal;
 
 	if (mode->flags & DRM_MODE_FLAG_INTERLACE)
-- 
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
