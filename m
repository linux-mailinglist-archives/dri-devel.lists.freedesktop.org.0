Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F30ED26AAA3
	for <lists+dri-devel@lfdr.de>; Tue, 15 Sep 2020 19:30:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15B4D6E8B7;
	Tue, 15 Sep 2020 17:30:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDF7E6E8B6
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Sep 2020 17:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600191001;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=04+TiwbT5jJwo2O4cAAW4KPKyUOr/nEVAtPPLejpYmE=;
 b=XUBvKeEzSnBwjm/ruTr6e0RFz8B/OVmSHHgJ/a0bYz3oApbH1g/62UwL+KcfTZ2Hc+v67m
 WodDiZzi5MFBopYFVZa+vOLQdO2SfZwJ3noHR/SeDJqhoZsrikpFfhuiSfGtYxCzLMKh08
 KWHl5zFUQOeoSSuzEbuHk+mwX/kgBRY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-55-BwdTzHixPnCJo5xXDuAUbQ-1; Tue, 15 Sep 2020 13:29:59 -0400
X-MC-Unique: BwdTzHixPnCJo5xXDuAUbQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C0D8210BBEC3;
 Tue, 15 Sep 2020 17:29:54 +0000 (UTC)
Received: from Whitewolf.redhat.com (ovpn-113-129.rdu2.redhat.com
 [10.10.113.129])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CE49A61473;
 Tue, 15 Sep 2020 17:29:50 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC 1/5] drm/i915/dp: Program source OUI on eDP panels
Date: Tue, 15 Sep 2020 13:29:35 -0400
Message-Id: <20200915172939.2810538-2-lyude@redhat.com>
In-Reply-To: <20200915172939.2810538-1-lyude@redhat.com>
References: <20200915172939.2810538-1-lyude@redhat.com>
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
Cc: thaytan@noraisin.net, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Uma Shankar <uma.shankar@intel.com>,
 Sean Paul <seanpaul@chromium.org>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
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

Signed-off-by: Lyude Paul <lyude@redhat.com>
Cc: thaytan@noraisin.net
Cc: Vasily Khoruzhick <anarsoul@gmail.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 32 +++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 4bd10456ad188..b591672ec4eab 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -3428,6 +3428,7 @@ void intel_dp_sink_set_decompression_state(struct intel_dp *intel_dp,
 void intel_dp_sink_dpms(struct intel_dp *intel_dp, int mode)
 {
 	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
+	u8 edp_oui[] = { 0x00, 0xaa, 0x01 };
 	int ret, i;
 
 	/* Should have a valid DPCD by this point */
@@ -3443,6 +3444,14 @@ void intel_dp_sink_dpms(struct intel_dp *intel_dp, int mode)
 	} else {
 		struct intel_lspcon *lspcon = dp_to_lspcon(intel_dp);
 
+		/* Write the source OUI as early as possible */
+		if (intel_dp_is_edp(intel_dp)) {
+			ret = drm_dp_dpcd_write(&intel_dp->aux, DP_SOURCE_OUI, edp_oui,
+						sizeof(edp_oui));
+			if (ret < 0)
+				drm_err(&i915->drm, "Failed to write eDP source OUI\n");
+		}
+
 		/*
 		 * When turning on, we need to retry for 1ms to give the sink
 		 * time to wake up.
@@ -4530,6 +4539,23 @@ static void intel_dp_get_dsc_sink_cap(struct intel_dp *intel_dp)
 	}
 }
 
+static void
+intel_edp_init_source_oui(struct intel_dp *intel_dp)
+{
+	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
+	u8 oui[] = { 0x00, 0xaa, 0x01 };
+	u8 buf[3] = { 0 };
+
+	if (drm_dp_dpcd_read(&intel_dp->aux, DP_SOURCE_OUI, buf, sizeof(buf)) < 0)
+		drm_err(&i915->drm, "Failed to read source OUI\n");
+
+	if (memcmp(oui, buf, sizeof(oui)) == 0)
+		return;
+
+	if (drm_dp_dpcd_write(&intel_dp->aux, DP_SOURCE_OUI, oui, sizeof(oui)) < 0)
+		drm_err(&i915->drm, "Failed to write source OUI\n");
+}
+
 static bool
 intel_edp_init_dpcd(struct intel_dp *intel_dp)
 {
@@ -4607,6 +4633,12 @@ intel_edp_init_dpcd(struct intel_dp *intel_dp)
 	if (INTEL_GEN(dev_priv) >= 10 || IS_GEMINILAKE(dev_priv))
 		intel_dp_get_dsc_sink_cap(intel_dp);
 
+	/*
+	 * Program our source OUI so we can make various Intel-specific AUX
+	 * services available (such as HDR backlight controls)
+	 */
+	intel_edp_init_source_oui(intel_dp);
+
 	return true;
 }
 
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
