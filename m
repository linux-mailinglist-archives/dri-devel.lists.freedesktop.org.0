Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE48142513
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2020 09:23:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29DAE6E5CF;
	Mon, 20 Jan 2020 08:23:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 675B36E5D1;
 Mon, 20 Jan 2020 08:23:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B8468B213;
 Mon, 20 Jan 2020 08:23:30 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, alexander.deucher@amd.com,
 christian.koenig@amd.com, David1.Zhou@amd.com,
 maarten.lankhorst@linux.intel.com, patrik.r.jakobsson@gmail.com,
 robdclark@gmail.com, sean@poorly.run, benjamin.gaignard@linaro.org,
 vincent.abriou@st.com, yannick.fertre@st.com, philippe.cornu@st.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@st.com, eric@anholt.net,
 rodrigosiqueiramelo@gmail.com, hamohammed.sa@gmail.com,
 linux-graphics-maintainer@vmware.com, thellstrom@vmware.com,
 bskeggs@redhat.com, harry.wentland@amd.com, sunpeng.li@amd.com,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com
Subject: [PATCH v3 01/22] drm: Remove internal setup of struct
 drm_device.vblank_disable_immediate
Date: Mon, 20 Jan 2020 09:22:53 +0100
Message-Id: <20200120082314.14756-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200120082314.14756-1-tzimmermann@suse.de>
References: <20200120082314.14756-1-tzimmermann@suse.de>
MIME-Version: 1.0
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
Cc: linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, nouveau@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VBLANK interrupts can be disabled immediately or with a delay, where the
latter is the default. The former option can be selected by setting
get_vblank_timestamp and enabling vblank_disable_immediate in struct
drm_device. Simplify the code in preparation of the removal of struct
drm_device.get_vblank_timestamp.

v3:
	* remove internal setup of vblank_disable_immediate

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_vblank.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index 1659b13b178c..326db52f2ad8 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -480,19 +480,6 @@ int drm_vblank_init(struct drm_device *dev, unsigned int num_crtcs)
 
 	DRM_INFO("Supports vblank timestamp caching Rev 2 (21.10.2013).\n");
 
-	/* Driver specific high-precision vblank timestamping supported? */
-	if (dev->driver->get_vblank_timestamp)
-		DRM_INFO("Driver supports precise vblank timestamp query.\n");
-	else
-		DRM_INFO("No driver support for vblank timestamp query.\n");
-
-	/* Must have precise timestamping for reliable vblank instant disable */
-	if (dev->vblank_disable_immediate && !dev->driver->get_vblank_timestamp) {
-		dev->vblank_disable_immediate = false;
-		DRM_INFO("Setting vblank_disable_immediate to false because "
-			 "get_vblank_timestamp == NULL\n");
-	}
-
 	return 0;
 
 err:
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
