Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E0E2CF6D3
	for <lists+dri-devel@lfdr.de>; Fri,  4 Dec 2020 23:36:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EEAE6EC83;
	Fri,  4 Dec 2020 22:36:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 913B36EC82
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Dec 2020 22:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607121383;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/IFfx10jttIFgDv71kE6A1XPSJvUXqvYCAQXHW4fcWQ=;
 b=NZhahBXJ+X8pVHBNF+cHM0JHuDejmwt+4VrbHSTeoJbC0VK6JPC92zpVxWYZsn1DkWegXl
 m1dinFEQHAM5lm7rIIvUNr/h91TNH2HLQyvcru307U3+C/ppYNvl75hXl7eQk/c5naorQx
 s8UOzybyyveTVvpkyRq/CSN5QS1mkVA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-405-fJdX_3piOIqE4hkdkIDoSQ-1; Fri, 04 Dec 2020 17:36:20 -0500
X-MC-Unique: fJdX_3piOIqE4hkdkIDoSQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 54EC8107ACE6;
 Fri,  4 Dec 2020 22:36:17 +0000 (UTC)
Received: from Whitewolf.redhat.com (ovpn-112-159.rdu2.redhat.com
 [10.10.112.159])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B10461962F;
 Fri,  4 Dec 2020 22:36:14 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Dave Airlie <airlied@gmail.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v3 1/9] drm/i915/dp: Program source OUI on eDP panels
Date: Fri,  4 Dec 2020 17:35:55 -0500
Message-Id: <20201204223603.249878-2-lyude@redhat.com>
In-Reply-To: <20201204223603.249878-1-lyude@redhat.com>
References: <20201204223603.249878-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
Cc: thaytan@noraisin.net, David Airlie <airlied@linux.ie>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 open list <linux-kernel@vger.kernel.org>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Sean Paul <seanpaul@chromium.org>,
 Manasi Navare <manasi.d.navare@intel.com>,
 Wambui Karuga <wambui.karugax@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since we're about to start adding support for Intel's magic HDR
backlight interface over DPCD, we need to ensure we're properly
programming this field so that Intel specific sink services are exposed.
Otherwise, 0x300-0x3ff will just read zeroes.

We also take care not to reprogram the source OUI if it already matches
what we expect. This is just to be careful so that we don't accidentally
take the panel out of any backlight control modes we found it in.

v2:
* Add careful parameter to intel_edp_init_source_oui() to avoid
  re-writing the source OUI if it's already been set during driver
  initialization

Signed-off-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: thaytan@noraisin.net
Cc: Vasily Khoruzhick <anarsoul@gmail.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 33 +++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 2d4d5e95af84..4cb2bfee9c40 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -3583,6 +3583,29 @@ void intel_dp_sink_set_decompression_state(struct intel_dp *intel_dp,
 			    enable ? "enable" : "disable");
 }
 
+static void
+intel_edp_init_source_oui(struct intel_dp *intel_dp, bool careful)
+{
+	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
+	u8 oui[] = { 0x00, 0xaa, 0x01 };
+	u8 buf[3] = { 0 };
+
+	/*
+	 * During driver init, we want to be careful and avoid changing the source OUI if it's
+	 * already set to what we want, so as to avoid clearing any state by accident
+	 */
+	if (careful) {
+		if (drm_dp_dpcd_read(&intel_dp->aux, DP_SOURCE_OUI, buf, sizeof(buf)) < 0)
+			drm_err(&i915->drm, "Failed to read source OUI\n");
+
+		if (memcmp(oui, buf, sizeof(oui)) == 0)
+			return;
+	}
+
+	if (drm_dp_dpcd_write(&intel_dp->aux, DP_SOURCE_OUI, oui, sizeof(oui)) < 0)
+		drm_err(&i915->drm, "Failed to write source OUI\n");
+}
+
 /* If the device supports it, try to set the power state appropriately */
 void intel_dp_set_power(struct intel_dp *intel_dp, u8 mode)
 {
@@ -3604,6 +3627,10 @@ void intel_dp_set_power(struct intel_dp *intel_dp, u8 mode)
 
 		lspcon_resume(dp_to_dig_port(intel_dp));
 
+		/* Write the source OUI as early as possible */
+		if (intel_dp_is_edp(intel_dp))
+			intel_edp_init_source_oui(intel_dp, false);
+
 		/*
 		 * When turning on, we need to retry for 1ms to give the sink
 		 * time to wake up.
@@ -4869,6 +4896,12 @@ intel_edp_init_dpcd(struct intel_dp *intel_dp)
 	if (INTEL_GEN(dev_priv) >= 10 || IS_GEMINILAKE(dev_priv))
 		intel_dp_get_dsc_sink_cap(intel_dp);
 
+	/*
+	 * If needed, program our source OUI so we can make various Intel-specific AUX services
+	 * available (such as HDR backlight controls)
+	 */
+	intel_edp_init_source_oui(intel_dp, true);
+
 	return true;
 }
 
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
