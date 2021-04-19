Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E02A5364E22
	for <lists+dri-devel@lfdr.de>; Tue, 20 Apr 2021 00:57:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC21A6E489;
	Mon, 19 Apr 2021 22:57:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA6896E489
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Apr 2021 22:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618873048;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T6QfesbtL6s5xMmkjhXG+OIAqnt95PHth9CwXA9Yr5k=;
 b=YBbH/hQ9eILNSY9zXW6ca6cy3nsdYp163/ZyXnPV0fPVF3bqZOTyBux/61MdmsczTKu99w
 9A/N0LtBUOcfV1Vuz+JgRw8OYmTz65zI734ixrlXZbpSBNyPkatd3XmcyhkSwltTTm293e
 wI7koTjV9nxHBBM3A05pG3+2xDVSaCQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-225-SAztK2CSMkCQT-A_-HTBmg-1; Mon, 19 Apr 2021 18:57:19 -0400
X-MC-Unique: SAztK2CSMkCQT-A_-HTBmg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2A84381746A;
 Mon, 19 Apr 2021 22:57:17 +0000 (UTC)
Received: from Ruby.lyude.net (ovpn-119-153.rdu2.redhat.com [10.10.119.153])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6D2E85C1C4;
 Mon, 19 Apr 2021 22:57:15 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v3 10/20] drm/dp: Always print aux channel name in logs
Date: Mon, 19 Apr 2021 18:55:12 -0400
Message-Id: <20210419225523.184856-11-lyude@redhat.com>
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since we're about to convert everything in drm_dp_helper.c over to using
drm_dbg_*(), let's also make our logging more consistent in drm_dp_helper.c
while we're at it to ensure that we always print the name of the AUX
channel in question.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/drm_dp_helper.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
index eaafc676aa0c..6dc1ccd4880b 100644
--- a/drivers/gpu/drm/drm_dp_helper.c
+++ b/drivers/gpu/drm/drm_dp_helper.c
@@ -139,8 +139,8 @@ void drm_dp_link_train_clock_recovery_delay(const struct drm_dp_aux *aux,
 					 DP_TRAINING_AUX_RD_MASK;
 
 	if (rd_interval > 4)
-		DRM_DEBUG_KMS("AUX interval %lu, out of range (max 4)\n",
-			      rd_interval);
+		DRM_DEBUG_KMS("%s: AUX interval %lu, out of range (max 4)\n",
+			      aux->name, rd_interval);
 
 	if (rd_interval == 0 || dpcd[DP_DPCD_REV] >= DP_DPCD_REV_14)
 		rd_interval = 100;
@@ -155,8 +155,8 @@ static void __drm_dp_link_train_channel_eq_delay(const struct drm_dp_aux *aux,
 						 unsigned long rd_interval)
 {
 	if (rd_interval > 4)
-		DRM_DEBUG_KMS("AUX interval %lu, out of range (max 4)\n",
-			      rd_interval);
+		DRM_DEBUG_KMS("%s: AUX interval %lu, out of range (max 4)\n",
+			      aux->name, rd_interval);
 
 	if (rd_interval == 0)
 		rd_interval = 400;
@@ -2819,7 +2819,7 @@ int drm_dp_pcon_frl_enable(struct drm_dp_aux *aux)
 	if (ret < 0)
 		return ret;
 	if (!(buf & DP_PCON_ENABLE_SOURCE_CTL_MODE)) {
-		DRM_DEBUG_KMS("PCON in Autonomous mode, can't enable FRL\n");
+		DRM_DEBUG_KMS("%s: PCON in Autonomous mode, can't enable FRL\n", aux->name);
 		return -EINVAL;
 	}
 	buf |= DP_PCON_ENABLE_HDMI_LINK;
@@ -2914,7 +2914,8 @@ void drm_dp_pcon_hdmi_frl_link_error_count(struct drm_dp_aux *aux,
 			num_error = 0;
 		}
 
-		DRM_ERROR("More than %d errors since the last read for lane %d", num_error, i);
+		DRM_ERROR("%s: More than %d errors since the last read for lane %d",
+			  aux->name, num_error, i);
 	}
 }
 EXPORT_SYMBOL(drm_dp_pcon_hdmi_frl_link_error_count);
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
