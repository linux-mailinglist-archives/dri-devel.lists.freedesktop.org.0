Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB1AA91248
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 06:40:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68F9710E0D6;
	Thu, 17 Apr 2025 04:40:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=etehtsea.me header.i=@etehtsea.me header.b="vhp8GUSL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 604 seconds by postgrey-1.36 at gabe;
 Thu, 17 Apr 2025 04:40:39 UTC
Received: from outbound.pv.icloud.com
 (p-west1-cluster4-host8-snip4-1.eps.apple.com [57.103.65.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A5AF10E0D6
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 04:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=etehtsea.me; s=sig1;
 bh=s8Ze0YrAsRvM56Guf/YtrV37Q0EOqSVlsBXfjoOyn44=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme;
 b=vhp8GUSLBS9mDgmUKnWpMptHb4zydL8N8Q+yPOxVFS09PTXCud15z3gPBzO3dX0tR
 D4wVQlPUv8ekGnXXgWTPArmYE6P2Y6kszaQHor1oci2Z/C9hnySBVEzGfLk3hBNe8q
 AC/QsW4+2F4JhMYw+Eu6KJIeJMpHTfz0x62ti+hy4zjPqqwxNXEXVpiReEFhK15o4j
 FkDWrllt0iUyfxzUfxKthOgXrLhnmgvdJb0pxbfuuzh5af/kGWDmqem406WC+lW6rJ
 GNjjuiW/KPBzFldVR55+nCT0DHzALxy5khBU+U60TmdYsBtoB0PkifETVNBABr2GmB
 EmaixC3zjIU5Q==
Received: from localhost (pv-asmtp-me-k8s.p00.prod.me.com [17.56.9.36])
 by outbound.pv.icloud.com (Postfix) with ESMTPSA id CF1A418000AF;
 Thu, 17 Apr 2025 04:21:18 +0000 (UTC)
From: Konstantin Shabanov <mail@etehtsea.me>
To: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Konstantin Shabanov <mail@etehtsea.me>,
 Daniel Stone <daniel@fooishbar.org>, Andy Yan <andyshrk@163.com>,
 Dan Callaghan <djc@djc.id.au>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3] drm/rockchip: Disable AFBC for res >2560 on rk3399
Date: Thu, 17 Apr 2025 04:20:08 +0000
Message-ID: <20250417042008.28536-1-mail@etehtsea.me>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250414095332.9674-1-mail@etehtsea.me>
References: <20250414095332.9674-1-mail@etehtsea.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: MXRK0RV78ZYYop4SgACsYfnc7XchLLpL
X-Proofpoint-ORIG-GUID: MXRK0RV78ZYYop4SgACsYfnc7XchLLpL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_01,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 suspectscore=0
 mlxlogscore=999 clxscore=1030 spamscore=0 malwarescore=0 mlxscore=0
 bulkscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2504170032
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

As it isn't supported by hardware. At least, RK3399 doesn't support
it. From the datasheet[1]
("1.2.10 Video IN/OUT", "Display Interface", p. 17):

  Support AFBC function co-operation with GPU
    * support 2560x1600 UI

Manually tested on RockPro64 (rk3399):
- ARM_AFBC modifier is used for 1920x1080
- DRM_FORMAT_MOD_LINEAR modifier us used for 3840x2160
- No noise on the screen when sway is running in 4k
- Dynamic resolution switching works correctly in sway

Signed-off-by: Konstantin Shabanov <mail@etehtsea.me>
Cc: Daniel Stone <daniel@fooishbar.org>
Cc: Andy Yan <andyshrk@163.com>
Reported-by: Dan Callaghan <djc@djc.id.au>
Closes: https://gitlab.freedesktop.org/mesa/mesa/-/issues/7968

[1]: https://opensource.rock-chips.com/images/d/d7/Rockchip_RK3399_Datasheet_V2.1-20200323.pdf
---
V2 -> V3: Run check only on rk3399
V1 -> V2: Move the check to the fb_create callback

Hi Andy and Daniel!
Thank you for the review!

Best wishes,
Konstantin

 drivers/gpu/drm/rockchip/rockchip_drm_fb.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_fb.c b/drivers/gpu/drm/rockchip/rockchip_drm_fb.c
index dcc1f07632c3..6ca757f80a30 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_fb.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_fb.c
@@ -5,6 +5,7 @@
  */

 #include <linux/kernel.h>
+#include <linux/of.h>

 #include <drm/drm.h>
 #include <drm/drm_atomic.h>
@@ -17,6 +18,9 @@
 #include "rockchip_drm_drv.h"
 #include "rockchip_drm_fb.h"
 #include "rockchip_drm_gem.h"
+#include "rockchip_drm_vop.h"
+
+#define RK3399_AFBC_MAX_WIDTH		2560

 static const struct drm_framebuffer_funcs rockchip_drm_fb_funcs = {
 	.destroy       = drm_gem_fb_destroy,
@@ -52,6 +56,15 @@ rockchip_fb_create(struct drm_device *dev, struct drm_file *file,
 	}

 	if (drm_is_afbc(mode_cmd->modifier[0])) {
+		if (of_machine_is_compatible("rockchip,rk3399")) {
+			if (mode_cmd->width > RK3399_AFBC_MAX_WIDTH) {
+				DRM_DEBUG_KMS("AFBC is not supported for the width %d (max %d)\n",
+					      mode_cmd->width,
+					      RK3399_AFBC_MAX_WIDTH);
+				return ERR_PTR(-EINVAL);
+			};
+		}
+
 		int ret, i;

 		ret = drm_gem_fb_afbc_init(dev, mode_cmd, afbc_fb);

base-commit: 4890d68db651562ea80250f2c93205a5c0327a6a
--
2.48.1
