Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5A6315894
	for <lists+dri-devel@lfdr.de>; Tue,  9 Feb 2021 22:29:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B92BC6EBA8;
	Tue,  9 Feb 2021 21:29:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0FEF6E98A
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Feb 2021 21:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612906147;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sCgxYhlKqouW5On/JyHP4QhxHmQ7Rz3iIIznSUlIx+I=;
 b=ZTZSdePSCgfyZDf76fPuk7yxbyKiyIV/jAgXWaTYwNhDVN63PDUPVhJS5i/laLNUgXI9hP
 HmTKFn5Euc8jplzrbJ0W91HLWk9kRRIkbKk+2+5rQtmkembDqtRaISVKrHC+tHfSgMdYJH
 SxDYfS0H7Roi0MpoTPtvky+Q4qCZJiU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-134-Ex30AsQsPLG-6M6wmYfpQA-1; Tue, 09 Feb 2021 16:29:03 -0500
X-MC-Unique: Ex30AsQsPLG-6M6wmYfpQA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 97EA6192D794;
 Tue,  9 Feb 2021 21:29:00 +0000 (UTC)
Received: from Whitewolf.redhat.com (ovpn-113-53.rdu2.redhat.com
 [10.10.113.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 74E1919C78;
 Tue,  9 Feb 2021 21:28:58 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v5 2/4] drm/i915/gen9_bc: Introduce TGP PCH DDC pin mappings
Date: Tue,  9 Feb 2021 16:28:29 -0500
Message-Id: <20210209212832.1401815-3-lyude@redhat.com>
In-Reply-To: <20210209212832.1401815-1-lyude@redhat.com>
References: <20210209212832.1401815-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Cc: "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Anshuman Gupta <anshuman.gupta@intel.com>, David Airlie <airlied@linux.ie>,
 Aditya Swarup <aditya.swarup@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 open list <linux-kernel@vger.kernel.org>, Uma Shankar <uma.shankar@intel.com>,
 Yijun Shen <Yijun.Shen@dell.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <seanpaul@chromium.org>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With the introduction of gen9_bc, where Intel combines Cometlake CPUs with
a Tigerpoint PCH, we'll need to introduce new DDC pin mappings for this
platform in order to make all of the display connectors work. So, let's do
that.

Changes since v4:
* Split this into it's own patch - vsyrjala

Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
[originally from Tejas's work]
Signed-off-by: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/i915/display/intel_bios.c |  9 +++++++++
 drivers/gpu/drm/i915/display/intel_hdmi.c | 20 ++++++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
index 7118530a1c38..1289f9d437e4 100644
--- a/drivers/gpu/drm/i915/display/intel_bios.c
+++ b/drivers/gpu/drm/i915/display/intel_bios.c
@@ -1638,6 +1638,12 @@ static const u8 adls_ddc_pin_map[] = {
 	[ADLS_DDC_BUS_PORT_TC4] = GMBUS_PIN_12_TC4_ICP,
 };
 
+static const u8 gen9bc_tgp_ddc_pin_map[] = {
+	[DDC_BUS_DDI_B] = GMBUS_PIN_2_BXT,
+	[DDC_BUS_DDI_C] = GMBUS_PIN_9_TC1_ICP,
+	[DDC_BUS_DDI_D] = GMBUS_PIN_10_TC2_ICP,
+};
+
 static u8 map_ddc_pin(struct drm_i915_private *dev_priv, u8 vbt_pin)
 {
 	const u8 *ddc_pin_map;
@@ -1651,6 +1657,9 @@ static u8 map_ddc_pin(struct drm_i915_private *dev_priv, u8 vbt_pin)
 	} else if (IS_ROCKETLAKE(dev_priv) && INTEL_PCH_TYPE(dev_priv) == PCH_TGP) {
 		ddc_pin_map = rkl_pch_tgp_ddc_pin_map;
 		n_entries = ARRAY_SIZE(rkl_pch_tgp_ddc_pin_map);
+	} else if (HAS_PCH_TGP(dev_priv) && IS_GEN9_BC(dev_priv)) {
+		ddc_pin_map = gen9bc_tgp_ddc_pin_map;
+		n_entries = ARRAY_SIZE(gen9bc_tgp_ddc_pin_map);
 	} else if (INTEL_PCH_TYPE(dev_priv) >= PCH_ICP) {
 		ddc_pin_map = icp_ddc_pin_map;
 		n_entries = ARRAY_SIZE(icp_ddc_pin_map);
diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index dad54e116bc4..49528d07c7f3 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -3138,6 +3138,24 @@ static u8 rkl_port_to_ddc_pin(struct drm_i915_private *dev_priv, enum port port)
 	return GMBUS_PIN_1_BXT + phy;
 }
 
+static u8 gen9bc_port_to_ddc_pin(struct drm_i915_private *i915, enum port port)
+{
+	enum phy phy = intel_port_to_phy(i915, port);
+
+	drm_WARN_ON(&i915->drm, port == PORT_A);
+
+	/*
+	 * Pin mapping for GEN9 BC depends on which PCH is present.  With TGP,
+	 * final two outputs use type-c pins, even though they're actually
+	 * combo outputs.  With CMP, the traditional DDI A-D pins are used for
+	 * all outputs.
+	 */
+	if (INTEL_PCH_TYPE(i915) >= PCH_TGP && phy >= PHY_C)
+		return GMBUS_PIN_9_TC1_ICP + phy - PHY_C;
+
+	return GMBUS_PIN_1_BXT + phy;
+}
+
 static u8 dg1_port_to_ddc_pin(struct drm_i915_private *dev_priv, enum port port)
 {
 	return intel_port_to_phy(dev_priv, port) + 1;
@@ -3202,6 +3220,8 @@ static u8 intel_hdmi_ddc_pin(struct intel_encoder *encoder)
 		ddc_pin = dg1_port_to_ddc_pin(dev_priv, port);
 	else if (IS_ROCKETLAKE(dev_priv))
 		ddc_pin = rkl_port_to_ddc_pin(dev_priv, port);
+	else if (IS_GEN9_BC(dev_priv) && HAS_PCH_TGP(dev_priv))
+		ddc_pin = gen9bc_port_to_ddc_pin(dev_priv, port);
 	else if (HAS_PCH_MCC(dev_priv))
 		ddc_pin = mcc_port_to_ddc_pin(dev_priv, port);
 	else if (INTEL_PCH_TYPE(dev_priv) >= PCH_ICP)
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
