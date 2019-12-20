Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B7A01292A4
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2019 09:11:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC7506E1AA;
	Mon, 23 Dec 2019 08:10:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x449.google.com (mail-pf1-x449.google.com
 [IPv6:2607:f8b0:4864:20::449])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 365F06ECA5
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2019 20:04:02 +0000 (UTC)
Received: by mail-pf1-x449.google.com with SMTP id i196so6847422pfe.6
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2019 12:04:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=HFGK/jzmj099oZxmaZy0Wc1mP94dwEMKMl/9yR9MCsk=;
 b=RN3FiMIB9Q3LTQ9bN7d3D5HXhSOMs5Rme6hFakYjBUWQxVnFJSlMHcLonddab/dCm6
 um13YQ5PVjEzARoHhfQ/PPD0f8CXQN5btM2txtjutYTaJvjxw7v43p7HvJrbFL7tIgME
 oXUOk8NurFns8Aq7UAPWUABwpvP+aTehtvR4rgu9QFDcDxFwViLpu4kM/0dQ8ppGQS9n
 wwFA2utSy88fGLeg9aJ/6gFGL3OUoStZsCNBdROJ2cMDUCxsDlaVM6TrvjnaLU+TfhGb
 Hjrj8LO6hmEin68dmvICYg4RVbcUPTMDXAyBKrE6b+HiUlMzkaXMBo3by30WTDjF3b8K
 k0/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=HFGK/jzmj099oZxmaZy0Wc1mP94dwEMKMl/9yR9MCsk=;
 b=HoOzc9qZPvjaYZiqHpOCvKn2CLR4L5vXdnH3L3ruL6Khdtp1yqgc0R0IkOWLvuuVrM
 t0k4CwHFT/Nwu5B9nNHR76zF7qBNvYsinFEj49cO/gE8sQC9KfLAhXzC1yhY22jPHFZC
 lDgPD6Dq+j33u+F7eQt5DPdpY483hLYOGfpJubtE+MJvRuvp4/BgM8zwCuqNGcgLFsdY
 tZJOLVNZAAU9OL/kLULU23jfpSfVe5d3HCWK1NSmUk2RfcbXvvIUXM7jTomtNtlLQqYw
 Ujagcpiago1r2TL5H6jMd3V2+T5IQzsZfcdZ1tZgK3QcQw/eQ7ql/otWHSk+Rlp60FdW
 2jEg==
X-Gm-Message-State: APjAAAUunR85o4TWOPS6l0LQ5vOux83fnQixed7pVGG7wzeI4gZZpKyS
 kuQ5rmzgbIyd0NbEfzAiMwGPk4tgvs6z
X-Google-Smtp-Source: APXvYqyT/lrqJJkGjr7+wgsmASl/W6VMYo2Q2Dvr2spodHbJZ9jEixR6ehQdZn+Dl+9Yy0APNQfTuhZXwrSW
X-Received: by 2002:a63:8c48:: with SMTP id q8mr17337335pgn.213.1576872241527; 
 Fri, 20 Dec 2019 12:04:01 -0800 (PST)
Date: Fri, 20 Dec 2019 12:03:52 -0800
In-Reply-To: <20191220200353.252399-1-rajatja@google.com>
Message-Id: <20191220200353.252399-2-rajatja@google.com>
Mime-Version: 1.0
References: <20191220200353.252399-1-rajatja@google.com>
X-Mailer: git-send-email 2.24.1.735.g03f4e72817-goog
Subject: [PATCH v5 2/3] drm/i915: Lookup and attach ACPI device node for
 connectors
From: Rajat Jain <rajatja@google.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 "=?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?=" <ville.syrjala@linux.intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>, Imre Deak <imre.deak@intel.com>, 
 "=?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?=" <jose.souza@intel.com>,
 linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 gregkh@linuxfoundation.org, mathewk@google.com, 
 Daniel Thompson <daniel.thompson@linaro.org>, Jonathan Corbet <corbet@lwn.net>,
 Pavel Machek <pavel@denx.de>, seanpaul@google.com,
 Duncan Laurie <dlaurie@google.com>, 
 jsbarnes@google.com, Thierry Reding <thierry.reding@gmail.com>
X-Mailman-Approved-At: Mon, 23 Dec 2019 08:10:46 +0000
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
Cc: Rajat Jain <rajatja@google.com>, rajatxjain@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Lookup and attach ACPI nodes for intel connectors. The lookup is done
in compliance with ACPI Spec 6.3
https://uefi.org/sites/default/files/resources/ACPI_6_3_final_Jan30.pdf
(Ref: Pages 1119 - 1123).

This can be useful for any connector specific platform properties. (This
will be used for privacy screen in next patch).

Signed-off-by: Rajat Jain <rajatja@google.com>
---
v5: same as v4
v4: Same as v3
v3: fold the code into existing acpi_device_id_update() function
v2: formed by splitting the original patch into ACPI lookup, and privacy
    screen property. Also move it into i915 now that I found existing code
    in i915 that can be re-used.

 drivers/gpu/drm/i915/display/intel_acpi.c     | 24 +++++++++++++++++++
 .../drm/i915/display/intel_display_types.h    |  3 +++
 drivers/gpu/drm/i915/display/intel_dp.c       |  3 +++
 3 files changed, 30 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_acpi.c b/drivers/gpu/drm/i915/display/intel_acpi.c
index e21fb14d5e07..101a56c08996 100644
--- a/drivers/gpu/drm/i915/display/intel_acpi.c
+++ b/drivers/gpu/drm/i915/display/intel_acpi.c
@@ -222,11 +222,23 @@ static u32 acpi_display_type(struct intel_connector *connector)
 	return display_type;
 }
 
+/*
+ * Ref: ACPI Spec 6.3
+ * https://uefi.org/sites/default/files/resources/ACPI_6_3_final_Jan30.pdf
+ * Pages 1119 - 1123 describe, what I believe, a standard way of
+ * identifying / addressing "display panels" in the ACPI. It provides
+ * a way for the ACPI to define devices for the display panels attached
+ * to the system. It thus provides a way for the BIOS to export any panel
+ * specific properties to the system via ACPI (like device trees).
+ */
 void intel_acpi_device_id_update(struct drm_i915_private *dev_priv)
 {
 	struct drm_device *drm_dev = &dev_priv->drm;
 	struct intel_connector *connector;
 	struct drm_connector_list_iter conn_iter;
+	struct device *dev = &drm_dev->pdev->dev;
+	struct acpi_device *conn_dev;
+	u64 conn_addr;
 	u8 display_index[16] = {};
 
 	/* Populate the ACPI IDs for all connectors for a given drm_device */
@@ -242,6 +254,18 @@ void intel_acpi_device_id_update(struct drm_i915_private *dev_priv)
 		device_id |= display_index[type]++ << ACPI_DISPLAY_INDEX_SHIFT;
 
 		connector->acpi_device_id = device_id;
+
+		/* Build the _ADR to look for */
+		conn_addr = device_id | ACPI_DEVICE_ID_SCHEME |
+				ACPI_BIOS_CAN_DETECT;
+
+		DRM_DEV_INFO(dev, "Checking connector ACPI node at _ADR=%llX\n",
+			     conn_addr);
+
+		/* Look up the connector device, under the PCI device */
+		conn_dev = acpi_find_child_device(ACPI_COMPANION(dev),
+						  conn_addr, false);
+		connector->acpi_handle = conn_dev ? conn_dev->handle : NULL;
 	}
 	drm_connector_list_iter_end(&conn_iter);
 }
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 1a7334dbe802..0a4a04116091 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -407,6 +407,9 @@ struct intel_connector {
 	/* ACPI device id for ACPI and driver cooperation */
 	u32 acpi_device_id;
 
+	/* ACPI handle corresponding to this connector display, if found */
+	void *acpi_handle;
+
 	/* Reads out the current hw, returning true if the connector is enabled
 	 * and active (i.e. dpms ON state). */
 	bool (*get_hw_state)(struct intel_connector *);
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index b05b2191b919..93cece8e2516 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -45,6 +45,7 @@
 #include "i915_debugfs.h"
 #include "i915_drv.h"
 #include "i915_trace.h"
+#include "intel_acpi.h"
 #include "intel_atomic.h"
 #include "intel_audio.h"
 #include "intel_connector.h"
@@ -6623,6 +6624,8 @@ intel_dp_add_properties(struct intel_dp *intel_dp, struct drm_connector *connect
 
 		connector->state->scaling_mode = DRM_MODE_SCALE_ASPECT;
 
+		/* Lookup the ACPI node corresponding to the connector */
+		intel_acpi_device_id_update(dev_priv);
 	}
 }
 
-- 
2.24.1.735.g03f4e72817-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
