Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C581369CD
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2020 10:22:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0720C6E9F9;
	Fri, 10 Jan 2020 09:21:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D17676E9BC;
 Fri, 10 Jan 2020 09:21:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 6E637B2AA;
 Fri, 10 Jan 2020 09:21:38 +0000 (UTC)
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
Subject: [PATCH 09/23] drm: Remove struct drm_driver.get_scanout_position()
Date: Fri, 10 Jan 2020 10:21:13 +0100
Message-Id: <20200110092127.27847-10-tzimmermann@suse.de>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200110092127.27847-1-tzimmermann@suse.de>
References: <20200110092127.27847-1-tzimmermann@suse.de>
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

All users of struct drm_driver.get_scanout_position() have been
covnerted to the respective CRTC helper function. Remove the callback
from struct drm_driver.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_vblank.c | 13 ++-------
 include/drm/drm_drv.h        | 52 ------------------------------------
 2 files changed, 2 insertions(+), 63 deletions(-)

diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index c12f0b333e14..b84065911d69 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -633,8 +633,7 @@ bool drm_calc_vbltimestamp_from_scanoutpos(struct drm_device *dev,
 	}
 
 	/* Scanout position query not supported? Should not happen. */
-	if (!dev->driver->get_scanout_position ||
-	    !crtc->helper_private->get_scanout_position) {
+	if (!crtc->helper_private->get_scanout_position) {
 		DRM_ERROR("Called from CRTC w/o get_scanout_position()!?\n");
 		return false;
 	}
@@ -666,17 +665,9 @@ bool drm_calc_vbltimestamp_from_scanoutpos(struct drm_device *dev,
 		 * Get vertical and horizontal scanout position vpos, hpos,
 		 * and bounding timestamps stime, etime, pre/post query.
 		 */
-		if (crtc->helper_private->get_scanout_position) {
-			vbl_status =
-				crtc->helper_private->get_scanout_position(
+		vbl_status = crtc->helper_private->get_scanout_position(
 					crtc, in_vblank_irq, &vpos, &hpos,
 					&stime, &etime, mode);
-		} else {
-			vbl_status =
-				dev->driver->get_scanout_position(
-					dev, pipe, in_vblank_irq, &vpos,
-					&hpos, &stime, &etime, mode);
-		}
 
 		/* Return as no-op if scanout query unsupported or failed. */
 		if (!vbl_status) {
diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
index d0049e5786fc..b704e252f3b2 100644
--- a/include/drm/drm_drv.h
+++ b/include/drm/drm_drv.h
@@ -318,58 +318,6 @@ struct drm_driver {
 	 */
 	void (*disable_vblank) (struct drm_device *dev, unsigned int pipe);
 
-	/**
-	 * @get_scanout_position:
-	 *
-	 * Called by vblank timestamping code.
-	 *
-	 * Returns the current display scanout position from a crtc, and an
-	 * optional accurate ktime_get() timestamp of when position was
-	 * measured. Note that this is a helper callback which is only used if a
-	 * driver uses drm_calc_vbltimestamp_from_scanoutpos() for the
-	 * @get_vblank_timestamp callback.
-	 *
-	 * Parameters:
-	 *
-	 * dev:
-	 *     DRM device.
-	 * pipe:
-	 *     Id of the crtc to query.
-	 * in_vblank_irq:
-	 *     True when called from drm_crtc_handle_vblank().  Some drivers
-	 *     need to apply some workarounds for gpu-specific vblank irq quirks
-	 *     if flag is set.
-	 * vpos:
-	 *     Target location for current vertical scanout position.
-	 * hpos:
-	 *     Target location for current horizontal scanout position.
-	 * stime:
-	 *     Target location for timestamp taken immediately before
-	 *     scanout position query. Can be NULL to skip timestamp.
-	 * etime:
-	 *     Target location for timestamp taken immediately after
-	 *     scanout position query. Can be NULL to skip timestamp.
-	 * mode:
-	 *     Current display timings.
-	 *
-	 * Returns vpos as a positive number while in active scanout area.
-	 * Returns vpos as a negative number inside vblank, counting the number
-	 * of scanlines to go until end of vblank, e.g., -1 means "one scanline
-	 * until start of active scanout / end of vblank."
-	 *
-	 * Returns:
-	 *
-	 * True on success, false if a reliable scanout position counter could
-	 * not be read out.
-	 *
-	 * This is deprecated and should not be used by new drivers.
-	 * Use &drm_crtc_helper_funcs.get_scanout_position instead.
-	 */
-	bool (*get_scanout_position) (struct drm_device *dev, unsigned int pipe,
-				      bool in_vblank_irq, int *vpos, int *hpos,
-				      ktime_t *stime, ktime_t *etime,
-				      const struct drm_display_mode *mode);
-
 	/**
 	 * @get_vblank_timestamp:
 	 *
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
