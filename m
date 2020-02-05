Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA281536F2
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2020 18:46:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DF7B6F90B;
	Wed,  5 Feb 2020 17:46:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DDA16F90C;
 Wed,  5 Feb 2020 17:46:20 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Feb 2020 09:46:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,406,1574150400"; d="scan'208";a="343804050"
Received: from plaxmina-desktop.iind.intel.com ([10.145.162.62])
 by fmsmga001.fm.intel.com with ESMTP; 05 Feb 2020 09:46:15 -0800
From: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
To: jani.nikula@linux.intel.com, daniel@ffwll.ch,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Ramalingam C <ramalingam.c@intel.com>, Uma Shankar <uma.shankar@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [Intel-gfx] [PATCH v6 7/7] drm/i915/display/hdcp: Make WARN* drm
 specific where drm_priv ptr is available
Date: Wed,  5 Feb 2020 23:04:19 +0530
Message-Id: <20200205173419.1695-8-pankaj.laxminarayan.bharadiya@intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200205173419.1695-1-pankaj.laxminarayan.bharadiya@intel.com>
References: <20200205173419.1695-1-pankaj.laxminarayan.bharadiya@intel.com>
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
Cc: pankaj.laxminarayan.bharadiya@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm specific WARN* calls include device information in the
backtrace, so we know what device the warnings originate from.

Covert all the calls of WARN* with device specific drm_WARN*
variants in functions where drm_i915_private struct pointer is readily
available.

The conversion was done automatically with below coccinelle semantic
patch. checkpatch errors/warnings are fixed manually.

@rule1@
identifier func, T;
@@
func(...) {
...
struct drm_i915_private *T = ...;
<+...
(
-WARN(
+drm_WARN(&T->drm,
...)
|
-WARN_ON(
+drm_WARN_ON(&T->drm,
...)
|
-WARN_ONCE(
+drm_WARN_ONCE(&T->drm,
...)
|
-WARN_ON_ONCE(
+drm_WARN_ON_ONCE(&T->drm,
...)
)
...+>
}

@rule2@
identifier func, T;
@@
func(struct drm_i915_private *T,...) {
<+...
(
-WARN(
+drm_WARN(&T->drm,
...)
|
-WARN_ON(
+drm_WARN_ON(&T->drm,
...)
|
-WARN_ONCE(
+drm_WARN_ONCE(&T->drm,
...)
|
-WARN_ON_ONCE(
+drm_WARN_ON_ONCE(&T->drm,
...)
)
...+>
}

Signed-off-by: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
---
 drivers/gpu/drm/i915/display/intel_hdcp.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
index 4d1a33d13105..b30859c79924 100644
--- a/drivers/gpu/drm/i915/display/intel_hdcp.c
+++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
@@ -872,7 +872,8 @@ static int intel_hdcp_check_link(struct intel_connector *connector)
 		goto out;
 	}
 
-	if (WARN_ON(!intel_hdcp_in_use(dev_priv, cpu_transcoder, port))) {
+	if (drm_WARN_ON(&dev_priv->drm,
+			!intel_hdcp_in_use(dev_priv, cpu_transcoder, port))) {
 		drm_err(&dev_priv->drm,
 			"%s:%d HDCP link stopped encryption,%x\n",
 			connector->base.name, connector->base.base.id,
@@ -1561,8 +1562,9 @@ static int hdcp2_enable_encryption(struct intel_connector *connector)
 	enum transcoder cpu_transcoder = hdcp->cpu_transcoder;
 	int ret;
 
-	WARN_ON(intel_de_read(dev_priv, HDCP2_STATUS(dev_priv, cpu_transcoder, port)) &
-		LINK_ENCRYPTION_STATUS);
+	drm_WARN_ON(&dev_priv->drm,
+		    intel_de_read(dev_priv, HDCP2_STATUS(dev_priv, cpu_transcoder, port)) &
+		    LINK_ENCRYPTION_STATUS);
 	if (hdcp->shim->toggle_signalling) {
 		ret = hdcp->shim->toggle_signalling(intel_dig_port, true);
 		if (ret) {
@@ -1599,8 +1601,8 @@ static int hdcp2_disable_encryption(struct intel_connector *connector)
 	enum transcoder cpu_transcoder = hdcp->cpu_transcoder;
 	int ret;
 
-	WARN_ON(!(intel_de_read(dev_priv, HDCP2_STATUS(dev_priv, cpu_transcoder, port)) &
-			    LINK_ENCRYPTION_STATUS));
+	drm_WARN_ON(&dev_priv->drm, !(intel_de_read(dev_priv, HDCP2_STATUS(dev_priv, cpu_transcoder, port)) &
+				      LINK_ENCRYPTION_STATUS));
 
 	intel_de_write(dev_priv, HDCP2_CTL(dev_priv, cpu_transcoder, port),
 		       intel_de_read(dev_priv, HDCP2_CTL(dev_priv, cpu_transcoder, port)) & ~CTL_LINK_ENCRYPTION_REQ);
@@ -1720,7 +1722,8 @@ static int intel_hdcp2_check_link(struct intel_connector *connector)
 		goto out;
 	}
 
-	if (WARN_ON(!intel_hdcp2_in_use(dev_priv, cpu_transcoder, port))) {
+	if (drm_WARN_ON(&dev_priv->drm,
+			!intel_hdcp2_in_use(dev_priv, cpu_transcoder, port))) {
 		drm_err(&dev_priv->drm,
 			"HDCP2.2 link stopped the encryption, %x\n",
 			intel_de_read(dev_priv, HDCP2_STATUS(dev_priv, cpu_transcoder, port)));
@@ -1916,7 +1919,7 @@ void intel_hdcp_component_init(struct drm_i915_private *dev_priv)
 		return;
 
 	mutex_lock(&dev_priv->hdcp_comp_mutex);
-	WARN_ON(dev_priv->hdcp_comp_added);
+	drm_WARN_ON(&dev_priv->drm, dev_priv->hdcp_comp_added);
 
 	dev_priv->hdcp_comp_added = true;
 	mutex_unlock(&dev_priv->hdcp_comp_mutex);
@@ -1990,7 +1993,8 @@ int intel_hdcp_enable(struct intel_connector *connector,
 		return -ENOENT;
 
 	mutex_lock(&hdcp->mutex);
-	WARN_ON(hdcp->value == DRM_MODE_CONTENT_PROTECTION_ENABLED);
+	drm_WARN_ON(&dev_priv->drm,
+		    hdcp->value == DRM_MODE_CONTENT_PROTECTION_ENABLED);
 	hdcp->content_type = content_type;
 
 	if (INTEL_GEN(dev_priv) >= 12) {
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
