Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 145C51BDF63
	for <lists+dri-devel@lfdr.de>; Wed, 29 Apr 2020 15:46:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 867376EE97;
	Wed, 29 Apr 2020 13:46:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30A056EEA0;
 Wed, 29 Apr 2020 13:46:07 +0000 (UTC)
IronPort-SDR: UewVU1s/p83LITc/c8KueP9hbwTBPMQehYTaruGgHyirf7ASqZvPUCTQcBeoNJiUq2RVGfl07V
 DM4xMKksIGaQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2020 06:46:06 -0700
IronPort-SDR: Odwn5yyBOA8RHCPM8VWMK4dHRgemDyAvqjBYP848YmxL9pbh6jeg4pxcxkxdhPe5g428yNXL11
 +yvYuY1wxzpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,332,1583222400"; d="scan'208";a="282507599"
Received: from ramaling-i9x.iind.intel.com ([10.99.66.154])
 by fmsmga004.fm.intel.com with ESMTP; 29 Apr 2020 06:46:04 -0700
From: Ramalingam C <ramalingam.c@intel.com>
To: dri-devel <dri-devel@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/i915/hdcp: Fix the return handling of
 drm_hdcp_check_ksvs_revoked
Date: Wed, 29 Apr 2020 19:15:55 +0530
Message-Id: <20200429134555.22106-1-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
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
Cc: Sean Paul <seanpaul@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_hdcp_check_ksvs_revoked() returns the number of revoked keys and
error codes when the SRM parsing is failed.

Errors in SRM parsing can't affect the HDCP auth, hence with this patch,
I915 will look out for revoked key count alone.

Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
cc: Sean Paul <seanpaul@chromium.org>
---
 drivers/gpu/drm/i915/display/intel_hdcp.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
index 2cbc4619b4ce..96bf6def9830 100644
--- a/drivers/gpu/drm/i915/display/intel_hdcp.c
+++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
@@ -576,7 +576,7 @@ int intel_hdcp_auth_downstream(struct intel_connector *connector)
 		goto err;
 
 	if (drm_hdcp_check_ksvs_revoked(&dev_priv->drm, ksv_fifo,
-					num_downstream)) {
+					num_downstream) > 0) {
 		drm_err(&dev_priv->drm, "Revoked Ksv(s) in ksv_fifo\n");
 		ret = -EPERM;
 		goto err;
@@ -682,7 +682,7 @@ static int intel_hdcp_auth(struct intel_connector *connector)
 	if (ret < 0)
 		return ret;
 
-	if (drm_hdcp_check_ksvs_revoked(&dev_priv->drm, bksv.shim, 1)) {
+	if (drm_hdcp_check_ksvs_revoked(&dev_priv->drm, bksv.shim, 1) > 0) {
 		drm_err(&dev_priv->drm, "BKSV is revoked\n");
 		return -EPERM;
 	}
@@ -1283,7 +1283,7 @@ static int hdcp2_authentication_key_exchange(struct intel_connector *connector)
 
 	if (drm_hdcp_check_ksvs_revoked(&dev_priv->drm,
 					msgs.send_cert.cert_rx.receiver_id,
-					1)) {
+					1) > 0) {
 		drm_err(&dev_priv->drm, "Receiver ID is revoked\n");
 		return -EPERM;
 	}
@@ -1484,7 +1484,7 @@ int hdcp2_authenticate_repeater_topology(struct intel_connector *connector)
 		      HDCP_2_2_DEV_COUNT_LO(rx_info[1]));
 	if (drm_hdcp_check_ksvs_revoked(&dev_priv->drm,
 					msgs.recvid_list.receiver_ids,
-					device_cnt)) {
+					device_cnt) > 0) {
 		drm_err(&dev_priv->drm, "Revoked receiver ID(s) is in list\n");
 		return -EPERM;
 	}
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
