Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 184543200E0
	for <lists+dri-devel@lfdr.de>; Fri, 19 Feb 2021 22:56:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D973F6EC93;
	Fri, 19 Feb 2021 21:55:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63C5C6EC8D
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Feb 2021 21:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613771752;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qyo8ZXSOBR7fUIC7DAHAqaQeFKzTc+2LaaNUsc0lhJw=;
 b=Wbw97VXJOy6FE8cCfrR5sWLOW/ioZQGrEfIF4L/zOlPLqvavMizJw77zEP20apWNk0FizP
 rP2T8p8WHbIlCL23EPfLU/T4uUKVI7k+UOFmZgiHO0OsJS4uuyqAPwpZfpHbPTZJStwzo6
 rQpsTeJkQAU/MWXw1wEmFMGU2L1r+28=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-245-4ZkmLLbGPEewIxoVyDu3ZQ-1; Fri, 19 Feb 2021 16:55:48 -0500
X-MC-Unique: 4ZkmLLbGPEewIxoVyDu3ZQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CA5F6801965;
 Fri, 19 Feb 2021 21:55:44 +0000 (UTC)
Received: from Whitewolf.redhat.com (ovpn-118-5.rdu2.redhat.com [10.10.118.5])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A57C46A03C;
 Fri, 19 Feb 2021 21:55:42 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 26/30] drm/dp_dual_mode: Pass drm_device to
 drm_lspcon_(get|set)_mode()
Date: Fri, 19 Feb 2021 16:53:22 -0500
Message-Id: <20210219215326.2227596-27-lyude@redhat.com>
In-Reply-To: <20210219215326.2227596-1-lyude@redhat.com>
References: <20210219215326.2227596-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Cc: Kai-Heng Feng <kai.heng.feng@canonical.com>,
 David Airlie <airlied@linux.ie>, Lucas De Marchi <lucas.demarchi@intel.com>,
 open list <linux-kernel@vger.kernel.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, Uma Shankar <uma.shankar@intel.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

So that we can start using drm_dbg_*() throughout the DRM DP helpers.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/drm_dp_dual_mode_helper.c   |  8 +++++---
 drivers/gpu/drm/i915/display/intel_lspcon.c | 12 +++++++-----
 include/drm/drm_dp_dual_mode_helper.h       |  4 ++--
 3 files changed, 14 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_dual_mode_helper.c b/drivers/gpu/drm/drm_dp_dual_mode_helper.c
index c9c2952bcad2..dbf9b1fdec63 100644
--- a/drivers/gpu/drm/drm_dp_dual_mode_helper.c
+++ b/drivers/gpu/drm/drm_dp_dual_mode_helper.c
@@ -430,6 +430,7 @@ EXPORT_SYMBOL(drm_dp_get_dual_mode_type_name);
 /**
  * drm_lspcon_get_mode: Get LSPCON's current mode of operation by
  * reading offset (0x80, 0x41)
+ * @dev: &drm_device to use
  * @adapter: I2C-over-aux adapter
  * @mode: current lspcon mode of operation output variable
  *
@@ -437,7 +438,7 @@ EXPORT_SYMBOL(drm_dp_get_dual_mode_type_name);
  * 0 on success, sets the current_mode value to appropriate mode
  * -error on failure
  */
-int drm_lspcon_get_mode(struct i2c_adapter *adapter,
+int drm_lspcon_get_mode(const struct drm_device *dev, struct i2c_adapter *adapter,
 			enum drm_lspcon_mode *mode)
 {
 	u8 data;
@@ -477,13 +478,14 @@ EXPORT_SYMBOL(drm_lspcon_get_mode);
 /**
  * drm_lspcon_set_mode: Change LSPCON's mode of operation by
  * writing offset (0x80, 0x40)
+ * @dev: &drm_device to use
  * @adapter: I2C-over-aux adapter
  * @mode: required mode of operation
  *
  * Returns:
  * 0 on success, -error on failure/timeout
  */
-int drm_lspcon_set_mode(struct i2c_adapter *adapter,
+int drm_lspcon_set_mode(const struct drm_device *dev, struct i2c_adapter *adapter,
 			enum drm_lspcon_mode mode)
 {
 	u8 data = 0;
@@ -508,7 +510,7 @@ int drm_lspcon_set_mode(struct i2c_adapter *adapter,
 	 * so wait and retry until time out or done.
 	 */
 	do {
-		ret = drm_lspcon_get_mode(adapter, &current_mode);
+		ret = drm_lspcon_get_mode(dev, adapter, &current_mode);
 		if (ret) {
 			DRM_ERROR("can't confirm LSPCON mode change\n");
 			return ret;
diff --git a/drivers/gpu/drm/i915/display/intel_lspcon.c b/drivers/gpu/drm/i915/display/intel_lspcon.c
index ca25044e7d1b..ec0048024746 100644
--- a/drivers/gpu/drm/i915/display/intel_lspcon.c
+++ b/drivers/gpu/drm/i915/display/intel_lspcon.c
@@ -139,10 +139,11 @@ void lspcon_detect_hdr_capability(struct intel_lspcon *lspcon)
 
 static enum drm_lspcon_mode lspcon_get_current_mode(struct intel_lspcon *lspcon)
 {
+	struct intel_dp *intel_dp = lspcon_to_intel_dp(lspcon);
 	enum drm_lspcon_mode current_mode;
-	struct i2c_adapter *adapter = &lspcon_to_intel_dp(lspcon)->aux.ddc;
+	struct i2c_adapter *adapter = &intel_dp->aux.ddc;
 
-	if (drm_lspcon_get_mode(adapter, &current_mode)) {
+	if (drm_lspcon_get_mode(intel_dp->aux.drm_dev, adapter, &current_mode)) {
 		DRM_DEBUG_KMS("Error reading LSPCON mode\n");
 		return DRM_LSPCON_MODE_INVALID;
 	}
@@ -175,11 +176,12 @@ static enum drm_lspcon_mode lspcon_wait_mode(struct intel_lspcon *lspcon,
 static int lspcon_change_mode(struct intel_lspcon *lspcon,
 			      enum drm_lspcon_mode mode)
 {
+	struct intel_dp *intel_dp = lspcon_to_intel_dp(lspcon);
 	int err;
 	enum drm_lspcon_mode current_mode;
-	struct i2c_adapter *adapter = &lspcon_to_intel_dp(lspcon)->aux.ddc;
+	struct i2c_adapter *adapter = &intel_dp->aux.ddc;
 
-	err = drm_lspcon_get_mode(adapter, &current_mode);
+	err = drm_lspcon_get_mode(intel_dp->aux.drm_dev, adapter, &current_mode);
 	if (err) {
 		DRM_ERROR("Error reading LSPCON mode\n");
 		return err;
@@ -190,7 +192,7 @@ static int lspcon_change_mode(struct intel_lspcon *lspcon,
 		return 0;
 	}
 
-	err = drm_lspcon_set_mode(adapter, mode);
+	err = drm_lspcon_set_mode(intel_dp->aux.drm_dev, adapter, mode);
 	if (err < 0) {
 		DRM_ERROR("LSPCON mode change failed\n");
 		return err;
diff --git a/include/drm/drm_dp_dual_mode_helper.h b/include/drm/drm_dp_dual_mode_helper.h
index 01eec9ff5962..7ee482265087 100644
--- a/include/drm/drm_dp_dual_mode_helper.h
+++ b/include/drm/drm_dp_dual_mode_helper.h
@@ -114,8 +114,8 @@ int drm_dp_dual_mode_set_tmds_output(const struct drm_device *dev, enum drm_dp_d
 				     struct i2c_adapter *adapter, bool enable);
 const char *drm_dp_get_dual_mode_type_name(enum drm_dp_dual_mode_type type);
 
-int drm_lspcon_get_mode(struct i2c_adapter *adapter,
+int drm_lspcon_get_mode(const struct drm_device *dev, struct i2c_adapter *adapter,
 			enum drm_lspcon_mode *current_mode);
-int drm_lspcon_set_mode(struct i2c_adapter *adapter,
+int drm_lspcon_set_mode(const struct drm_device *dev, struct i2c_adapter *adapter,
 			enum drm_lspcon_mode reqd_mode);
 #endif
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
