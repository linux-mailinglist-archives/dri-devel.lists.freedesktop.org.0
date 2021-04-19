Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86DA9364E42
	for <lists+dri-devel@lfdr.de>; Tue, 20 Apr 2021 00:58:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F2BD6E4D4;
	Mon, 19 Apr 2021 22:57:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B1056E4D7
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Apr 2021 22:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618873069;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cTxDov8fqFDGgM20Fpmb8o7MyA69axtJ6Ag7INVRohE=;
 b=KNBmmNqzSryDPh9wmPYzZ6If4QOiK8qyo6RSI/pi8dKoaLtqJBpK2me1S1RCxHg9FQc6cg
 ILUCI6cu/rIbt881i/z4eKgQ0OcszR0W20mXinVGfbpBsWQy1dgC7q6dXAf+qyWtEmPrtH
 mHleKQDY774dbW3CrxDU+MCSJfUI+js=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-595-YgS2YtDQNQGJ-FiRLa1BYQ-1; Mon, 19 Apr 2021 18:57:45 -0400
X-MC-Unique: YgS2YtDQNQGJ-FiRLa1BYQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5DFD9801814;
 Mon, 19 Apr 2021 22:57:43 +0000 (UTC)
Received: from Ruby.lyude.net (ovpn-119-153.rdu2.redhat.com [10.10.119.153])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 83E6C5C1C4;
 Mon, 19 Apr 2021 22:57:41 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v3 18/20] drm/dp: Convert drm_dp_helper.c to using
 drm_err/drm_dbg_*()
Date: Mon, 19 Apr 2021 18:55:20 -0400
Message-Id: <20210419225523.184856-19-lyude@redhat.com>
In-Reply-To: <20210419225523.184856-1-lyude@redhat.com>
References: <20210419225523.184856-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 Robert Foss <robert.foss@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that we've added a back-pointer to drm_device to drm_dp_aux, made
drm_dp_aux available to any functions in drm_dp_helper.c which need to
print to the kernel log, and ensured all of our logging uses a consistent
format, let's do the final step of the conversion and actually move
everything over to using drm_err() and drm_dbg_*().

This was done by using the following cocci script:

  @@
  expression list expr;
  @@

  (
  - DRM_DEBUG_KMS(expr);
  + drm_dbg_kms(aux->drm_dev, expr);
  |
  - DRM_DEBUG_DP(expr);
  + drm_dbg_dp(aux->drm_dev, expr);
  |
  - DRM_DEBUG_ATOMIC(expr);
  + drm_dbg_atomic(aux->drm_dev, expr);
  |
  - DRM_DEBUG_KMS_RATELIMITED(expr);
  + drm_dbg_kms_ratelimited(aux->drm_dev, expr);
  |
  - DRM_ERROR(expr);
  + drm_err(aux->drm_dev, expr);
  )

Followed by correcting the resulting line-wrapping in the results by hand.

v2:
* Fix indenting in drm_dp_dump_access

Signed-off-by: Lyude Paul <lyude@redhat.com>
Cc: Robert Foss <robert.foss@linaro.org>
Reviewed-by: Robert Foss <robert.foss@linaro.org>
---
 drivers/gpu/drm/drm_dp_helper.c | 121 ++++++++++++++++----------------
 1 file changed, 59 insertions(+), 62 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
index 6dc1ccd4880b..75563987ab8c 100644
--- a/drivers/gpu/drm/drm_dp_helper.c
+++ b/drivers/gpu/drm/drm_dp_helper.c
@@ -139,8 +139,8 @@ void drm_dp_link_train_clock_recovery_delay(const struct drm_dp_aux *aux,
 					 DP_TRAINING_AUX_RD_MASK;
 
 	if (rd_interval > 4)
-		DRM_DEBUG_KMS("%s: AUX interval %lu, out of range (max 4)\n",
-			      aux->name, rd_interval);
+		drm_dbg_kms(aux->drm_dev, "%s: AUX interval %lu, out of range (max 4)\n",
+			    aux->name, rd_interval);
 
 	if (rd_interval == 0 || dpcd[DP_DPCD_REV] >= DP_DPCD_REV_14)
 		rd_interval = 100;
@@ -155,8 +155,8 @@ static void __drm_dp_link_train_channel_eq_delay(const struct drm_dp_aux *aux,
 						 unsigned long rd_interval)
 {
 	if (rd_interval > 4)
-		DRM_DEBUG_KMS("%s: AUX interval %lu, out of range (max 4)\n",
-			      aux->name, rd_interval);
+		drm_dbg_kms(aux->drm_dev, "%s: AUX interval %lu, out of range (max 4)\n",
+			    aux->name, rd_interval);
 
 	if (rd_interval == 0)
 		rd_interval = 400;
@@ -220,11 +220,11 @@ drm_dp_dump_access(const struct drm_dp_aux *aux,
 	const char *arrow = request == DP_AUX_NATIVE_READ ? "->" : "<-";
 
 	if (ret > 0)
-		DRM_DEBUG_DP("%s: 0x%05x AUX %s (ret=%3d) %*ph\n",
-			     aux->name, offset, arrow, ret, min(ret, 20), buffer);
+		drm_dbg_dp(aux->drm_dev, "%s: 0x%05x AUX %s (ret=%3d) %*ph\n",
+			   aux->name, offset, arrow, ret, min(ret, 20), buffer);
 	else
-		DRM_DEBUG_DP("%s: 0x%05x AUX %s (ret=%3d)\n",
-			     aux->name, offset, arrow, ret);
+		drm_dbg_dp(aux->drm_dev, "%s: 0x%05x AUX %s (ret=%3d)\n",
+			   aux->name, offset, arrow, ret);
 }
 
 /**
@@ -287,8 +287,8 @@ static int drm_dp_dpcd_access(struct drm_dp_aux *aux, u8 request,
 			err = ret;
 	}
 
-	DRM_DEBUG_KMS("%s: Too many retries, giving up. First error: %d\n",
-		      aux->name, err);
+	drm_dbg_kms(aux->drm_dev, "%s: Too many retries, giving up. First error: %d\n",
+		    aux->name, err);
 	ret = err;
 
 unlock:
@@ -524,44 +524,44 @@ bool drm_dp_send_real_edid_checksum(struct drm_dp_aux *aux,
 
 	if (drm_dp_dpcd_read(aux, DP_DEVICE_SERVICE_IRQ_VECTOR,
 			     &auto_test_req, 1) < 1) {
-		DRM_ERROR("%s: DPCD failed read at register 0x%x\n",
-			  aux->name, DP_DEVICE_SERVICE_IRQ_VECTOR);
+		drm_err(aux->drm_dev, "%s: DPCD failed read at register 0x%x\n",
+			aux->name, DP_DEVICE_SERVICE_IRQ_VECTOR);
 		return false;
 	}
 	auto_test_req &= DP_AUTOMATED_TEST_REQUEST;
 
 	if (drm_dp_dpcd_read(aux, DP_TEST_REQUEST, &link_edid_read, 1) < 1) {
-		DRM_ERROR("%s: DPCD failed read at register 0x%x\n",
-			  aux->name, DP_TEST_REQUEST);
+		drm_err(aux->drm_dev, "%s: DPCD failed read at register 0x%x\n",
+			aux->name, DP_TEST_REQUEST);
 		return false;
 	}
 	link_edid_read &= DP_TEST_LINK_EDID_READ;
 
 	if (!auto_test_req || !link_edid_read) {
-		DRM_DEBUG_KMS("%s: Source DUT does not support TEST_EDID_READ\n",
-			      aux->name);
+		drm_dbg_kms(aux->drm_dev, "%s: Source DUT does not support TEST_EDID_READ\n",
+			    aux->name);
 		return false;
 	}
 
 	if (drm_dp_dpcd_write(aux, DP_DEVICE_SERVICE_IRQ_VECTOR,
 			      &auto_test_req, 1) < 1) {
-		DRM_ERROR("%s: DPCD failed write at register 0x%x\n",
-			  aux->name, DP_DEVICE_SERVICE_IRQ_VECTOR);
+		drm_err(aux->drm_dev, "%s: DPCD failed write at register 0x%x\n",
+			aux->name, DP_DEVICE_SERVICE_IRQ_VECTOR);
 		return false;
 	}
 
 	/* send back checksum for the last edid extension block data */
 	if (drm_dp_dpcd_write(aux, DP_TEST_EDID_CHECKSUM,
 			      &real_edid_checksum, 1) < 1) {
-		DRM_ERROR("%s: DPCD failed write at register 0x%x\n",
-			  aux->name, DP_TEST_EDID_CHECKSUM);
+		drm_err(aux->drm_dev, "%s: DPCD failed write at register 0x%x\n",
+			aux->name, DP_TEST_EDID_CHECKSUM);
 		return false;
 	}
 
 	test_resp |= DP_TEST_EDID_CHECKSUM_WRITE;
 	if (drm_dp_dpcd_write(aux, DP_TEST_RESPONSE, &test_resp, 1) < 1) {
-		DRM_ERROR("%s: DPCD failed write at register 0x%x\n",
-			  aux->name, DP_TEST_RESPONSE);
+		drm_err(aux->drm_dev, "%s: DPCD failed write at register 0x%x\n",
+			aux->name, DP_TEST_RESPONSE);
 		return false;
 	}
 
@@ -604,17 +604,16 @@ static int drm_dp_read_extended_dpcd_caps(struct drm_dp_aux *aux,
 		return -EIO;
 
 	if (dpcd[DP_DPCD_REV] > dpcd_ext[DP_DPCD_REV]) {
-		DRM_DEBUG_KMS("%s: Extended DPCD rev less than base DPCD rev (%d > %d)\n",
-			      aux->name, dpcd[DP_DPCD_REV],
-			      dpcd_ext[DP_DPCD_REV]);
+		drm_dbg_kms(aux->drm_dev,
+			    "%s: Extended DPCD rev less than base DPCD rev (%d > %d)\n",
+			    aux->name, dpcd[DP_DPCD_REV], dpcd_ext[DP_DPCD_REV]);
 		return 0;
 	}
 
 	if (!memcmp(dpcd, dpcd_ext, sizeof(dpcd_ext)))
 		return 0;
 
-	DRM_DEBUG_KMS("%s: Base DPCD: %*ph\n",
-		      aux->name, DP_RECEIVER_CAP_SIZE, dpcd);
+	drm_dbg_kms(aux->drm_dev, "%s: Base DPCD: %*ph\n", aux->name, DP_RECEIVER_CAP_SIZE, dpcd);
 
 	memcpy(dpcd, dpcd_ext, sizeof(dpcd_ext));
 
@@ -649,8 +648,7 @@ int drm_dp_read_dpcd_caps(struct drm_dp_aux *aux,
 	if (ret < 0)
 		return ret;
 
-	DRM_DEBUG_KMS("%s: DPCD: %*ph\n",
-		      aux->name, DP_RECEIVER_CAP_SIZE, dpcd);
+	drm_dbg_kms(aux->drm_dev, "%s: DPCD: %*ph\n", aux->name, DP_RECEIVER_CAP_SIZE, dpcd);
 
 	return ret;
 }
@@ -694,8 +692,7 @@ int drm_dp_read_downstream_info(struct drm_dp_aux *aux,
 	if (ret != len)
 		return -EIO;
 
-	DRM_DEBUG_KMS("%s: DPCD DFP: %*ph\n",
-		      aux->name, len, downstream_ports);
+	drm_dbg_kms(aux->drm_dev, "%s: DPCD DFP: %*ph\n", aux->name, len, downstream_ports);
 
 	return 0;
 }
@@ -1412,11 +1409,11 @@ static int drm_dp_i2c_do_msg(struct drm_dp_aux *aux, struct drm_dp_aux_msg *msg)
 			 * Avoid spamming the kernel log with timeout errors.
 			 */
 			if (ret == -ETIMEDOUT)
-				DRM_DEBUG_KMS_RATELIMITED("%s: transaction timed out\n",
-							  aux->name);
+				drm_dbg_kms_ratelimited(aux->drm_dev, "%s: transaction timed out\n",
+							aux->name);
 			else
-				DRM_DEBUG_KMS("%s: transaction failed: %d\n",
-					      aux->name, ret);
+				drm_dbg_kms(aux->drm_dev, "%s: transaction failed: %d\n",
+					    aux->name, ret);
 			return ret;
 		}
 
@@ -1430,12 +1427,12 @@ static int drm_dp_i2c_do_msg(struct drm_dp_aux *aux, struct drm_dp_aux_msg *msg)
 			break;
 
 		case DP_AUX_NATIVE_REPLY_NACK:
-			DRM_DEBUG_KMS("%s: native nack (result=%d, size=%zu)\n",
-				      aux->name, ret, msg->size);
+			drm_dbg_kms(aux->drm_dev, "%s: native nack (result=%d, size=%zu)\n",
+				    aux->name, ret, msg->size);
 			return -EREMOTEIO;
 
 		case DP_AUX_NATIVE_REPLY_DEFER:
-			DRM_DEBUG_KMS("%s: native defer\n", aux->name);
+			drm_dbg_kms(aux->drm_dev, "%s: native defer\n", aux->name);
 			/*
 			 * We could check for I2C bit rate capabilities and if
 			 * available adjust this interval. We could also be
@@ -1449,8 +1446,8 @@ static int drm_dp_i2c_do_msg(struct drm_dp_aux *aux, struct drm_dp_aux_msg *msg)
 			continue;
 
 		default:
-			DRM_ERROR("%s: invalid native reply %#04x\n",
-				  aux->name, msg->reply);
+			drm_err(aux->drm_dev, "%s: invalid native reply %#04x\n",
+				aux->name, msg->reply);
 			return -EREMOTEIO;
 		}
 
@@ -1465,13 +1462,13 @@ static int drm_dp_i2c_do_msg(struct drm_dp_aux *aux, struct drm_dp_aux_msg *msg)
 			return ret;
 
 		case DP_AUX_I2C_REPLY_NACK:
-			DRM_DEBUG_KMS("%s: I2C nack (result=%d, size=%zu)\n",
-				      aux->name, ret, msg->size);
+			drm_dbg_kms(aux->drm_dev, "%s: I2C nack (result=%d, size=%zu)\n",
+				    aux->name, ret, msg->size);
 			aux->i2c_nack_count++;
 			return -EREMOTEIO;
 
 		case DP_AUX_I2C_REPLY_DEFER:
-			DRM_DEBUG_KMS("%s: I2C defer\n", aux->name);
+			drm_dbg_kms(aux->drm_dev, "%s: I2C defer\n", aux->name);
 			/* DP Compliance Test 4.2.2.5 Requirement:
 			 * Must have at least 7 retries for I2C defers on the
 			 * transaction to pass this test
@@ -1485,13 +1482,13 @@ static int drm_dp_i2c_do_msg(struct drm_dp_aux *aux, struct drm_dp_aux_msg *msg)
 			continue;
 
 		default:
-			DRM_ERROR("%s: invalid I2C reply %#04x\n",
-				  aux->name, msg->reply);
+			drm_err(aux->drm_dev, "%s: invalid I2C reply %#04x\n",
+				aux->name, msg->reply);
 			return -EREMOTEIO;
 		}
 	}
 
-	DRM_DEBUG_KMS("%s: Too many retries, giving up\n", aux->name);
+	drm_dbg_kms(aux->drm_dev, "%s: Too many retries, giving up\n", aux->name);
 	return -EREMOTEIO;
 }
 
@@ -1520,8 +1517,9 @@ static int drm_dp_i2c_drain_msg(struct drm_dp_aux *aux, struct drm_dp_aux_msg *o
 			return err == 0 ? -EPROTO : err;
 
 		if (err < msg.size && err < ret) {
-			DRM_DEBUG_KMS("%s: Partial I2C reply: requested %zu bytes got %d bytes\n",
-				      aux->name, msg.size, err);
+			drm_dbg_kms(aux->drm_dev,
+				    "%s: Partial I2C reply: requested %zu bytes got %d bytes\n",
+				    aux->name, msg.size, err);
 			ret = err;
 		}
 
@@ -1700,12 +1698,11 @@ static void drm_dp_aux_crc_work(struct work_struct *work)
 		}
 
 		if (ret == -EAGAIN) {
-			DRM_DEBUG_KMS("%s: Get CRC failed after retrying: %d\n",
-				      aux->name, ret);
+			drm_dbg_kms(aux->drm_dev, "%s: Get CRC failed after retrying: %d\n",
+				    aux->name, ret);
 			continue;
 		} else if (ret) {
-			DRM_DEBUG_KMS("%s: Failed to get a CRC: %d\n",
-				      aux->name, ret);
+			drm_dbg_kms(aux->drm_dev, "%s: Failed to get a CRC: %d\n", aux->name, ret);
 			continue;
 		}
 
@@ -2047,13 +2044,12 @@ int drm_dp_read_desc(struct drm_dp_aux *aux, struct drm_dp_desc *desc,
 
 	dev_id_len = strnlen(ident->device_id, sizeof(ident->device_id));
 
-	DRM_DEBUG_KMS("%s: DP %s: OUI %*phD dev-ID %*pE HW-rev %d.%d SW-rev %d.%d quirks 0x%04x\n",
-		      aux->name, is_branch ? "branch" : "sink",
-		      (int)sizeof(ident->oui), ident->oui,
-		      dev_id_len, ident->device_id,
-		      ident->hw_rev >> 4, ident->hw_rev & 0xf,
-		      ident->sw_major_rev, ident->sw_minor_rev,
-		      desc->quirks);
+	drm_dbg_kms(aux->drm_dev,
+		    "%s: DP %s: OUI %*phD dev-ID %*pE HW-rev %d.%d SW-rev %d.%d quirks 0x%04x\n",
+		    aux->name, is_branch ? "branch" : "sink",
+		    (int)sizeof(ident->oui), ident->oui, dev_id_len,
+		    ident->device_id, ident->hw_rev >> 4, ident->hw_rev & 0xf,
+		    ident->sw_major_rev, ident->sw_minor_rev, desc->quirks);
 
 	return 0;
 }
@@ -2819,7 +2815,8 @@ int drm_dp_pcon_frl_enable(struct drm_dp_aux *aux)
 	if (ret < 0)
 		return ret;
 	if (!(buf & DP_PCON_ENABLE_SOURCE_CTL_MODE)) {
-		DRM_DEBUG_KMS("%s: PCON in Autonomous mode, can't enable FRL\n", aux->name);
+		drm_dbg_kms(aux->drm_dev, "%s: PCON in Autonomous mode, can't enable FRL\n",
+			    aux->name);
 		return -EINVAL;
 	}
 	buf |= DP_PCON_ENABLE_HDMI_LINK;
@@ -2914,8 +2911,8 @@ void drm_dp_pcon_hdmi_frl_link_error_count(struct drm_dp_aux *aux,
 			num_error = 0;
 		}
 
-		DRM_ERROR("%s: More than %d errors since the last read for lane %d",
-			  aux->name, num_error, i);
+		drm_err(aux->drm_dev, "%s: More than %d errors since the last read for lane %d",
+			aux->name, num_error, i);
 	}
 }
 EXPORT_SYMBOL(drm_dp_pcon_hdmi_frl_link_error_count);
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
