Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E2A62420FE
	for <lists+dri-devel@lfdr.de>; Tue, 11 Aug 2020 22:06:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E4C76E830;
	Tue, 11 Aug 2020 20:06:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0592B6E82F
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Aug 2020 20:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597176410;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2RiZk4OnV40D+B+CBO8SNNqSCNKf8gxT9xQ710UwP5I=;
 b=D4U1PwUjFE0xMSumdr5V51SfakSag4+hmw/qb5XgHB+EtH6vcrM4hJJOtAGRnSlZBuGSAA
 E1df8W+QiOGq78AnFs2/Ir9HO1OveNoY24sMOTfKNTPjBWVC0kd5CTUu8vhOedzRvio+kq
 Gugpjvlh6WlhWNXwDWw/wgqnBMbla8I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-137-n8Pp2CcHNxSvRbp3E4RR7Q-1; Tue, 11 Aug 2020 16:06:48 -0400
X-MC-Unique: n8Pp2CcHNxSvRbp3E4RR7Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5F48F106B246;
 Tue, 11 Aug 2020 20:06:45 +0000 (UTC)
Received: from Ruby.redhat.com (ovpn-119-184.rdu2.redhat.com [10.10.119.184])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 35D525D9D7;
 Tue, 11 Aug 2020 20:06:43 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [RFC 16/20] drm/i915/dp: Extract drm_dp_get_sink_count()
Date: Tue, 11 Aug 2020 16:04:53 -0400
Message-Id: <20200811200457.134743-17-lyude@redhat.com>
In-Reply-To: <20200811200457.134743-1-lyude@redhat.com>
References: <20200811200457.134743-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 open list <linux-kernel@vger.kernel.org>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Manasi Navare <manasi.d.navare@intel.com>, Uma Shankar <uma.shankar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 Wambui Karuga <wambui.karugax@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

And of course, we'll also need to read the sink count from other drivers
as well if we're checking whether or not it's supported. So, let's
extract the code for this into another helper.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/drm_dp_helper.c         | 20 ++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_dp.c | 17 +++++------------
 include/drm/drm_dp_helper.h             |  1 +
 3 files changed, 26 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
index 05bb47e589731..0ff2959c8f8e8 100644
--- a/drivers/gpu/drm/drm_dp_helper.c
+++ b/drivers/gpu/drm/drm_dp_helper.c
@@ -722,6 +722,26 @@ bool drm_dp_has_sink_count(struct drm_connector *connector,
 }
 EXPORT_SYMBOL(drm_dp_has_sink_count);
 
+/**
+ * drm_dp_get_sink_count() - Retrieve the sink count for a given sink
+ * @aux: The DP AUX channel to use
+ *
+ * Returns: The current sink count reported by @aux, or a negative error code
+ * otherwise.
+ */
+int drm_dp_get_sink_count(struct drm_dp_aux *aux)
+{
+	u8 count;
+	int ret;
+
+	ret = drm_dp_dpcd_readb(aux, DP_SINK_COUNT, &count);
+	if (ret < 1)
+		return -EIO;
+
+	return DP_GET_SINK_COUNT(count);
+}
+EXPORT_SYMBOL(drm_dp_get_sink_count);
+
 /*
  * I2C-over-AUX implementation
  */
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 35a4779a442e2..e343965a483df 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -4648,6 +4648,8 @@ intel_dp_has_sink_count(struct intel_dp *intel_dp)
 static bool
 intel_dp_get_dpcd(struct intel_dp *intel_dp)
 {
+	int ret;
+
 	if (!intel_dp_read_dpcd(intel_dp))
 		return false;
 
@@ -4664,20 +4666,10 @@ intel_dp_get_dpcd(struct intel_dp *intel_dp)
 	}
 
 	if (intel_dp_has_sink_count(intel_dp)) {
-		u8 count;
-		ssize_t r;
-
-		r = drm_dp_dpcd_readb(&intel_dp->aux, DP_SINK_COUNT, &count);
-		if (r < 1)
+		ret = drm_dp_get_sink_count(&intel_dp->aux);
+		if (ret < 0)
 			return false;
 
-		/*
-		 * Sink count can change between short pulse hpd hence
-		 * a member variable in intel_dp will track any changes
-		 * between short pulse interrupts.
-		 */
-		intel_dp->sink_count = DP_GET_SINK_COUNT(count);
-
 		/*
 		 * SINK_COUNT == 0 and DOWNSTREAM_PORT_PRESENT == 1 implies that
 		 * a dongle is present but no display. Unless we require to know
@@ -4685,6 +4677,7 @@ intel_dp_get_dpcd(struct intel_dp *intel_dp)
 		 * downstream port information. So, an early return here saves
 		 * time from performing other operations which are not required.
 		 */
+		intel_dp->sink_count = ret;
 		if (!intel_dp->sink_count)
 			return false;
 	}
diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
index a1413a531eaf4..0c141fc81aaa8 100644
--- a/include/drm/drm_dp_helper.h
+++ b/include/drm/drm_dp_helper.h
@@ -1635,6 +1635,7 @@ struct drm_dp_desc;
 bool drm_dp_has_sink_count(struct drm_connector *connector,
 			   const u8 dpcd[DP_RECEIVER_CAP_SIZE],
 			   const struct drm_dp_desc *desc);
+int drm_dp_get_sink_count(struct drm_dp_aux *aux);
 
 void drm_dp_remote_aux_init(struct drm_dp_aux *aux);
 void drm_dp_aux_init(struct drm_dp_aux *aux);
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
