Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C88852919
	for <lists+dri-devel@lfdr.de>; Tue, 13 Feb 2024 07:40:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E882F10E851;
	Tue, 13 Feb 2024 06:40:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z/eP5BE4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6391810E848;
 Tue, 13 Feb 2024 06:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707806438; x=1739342438;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7/bt9H/4VynJKMTzmsPjHoeJlvbGjaaLz06gdfbCr+Q=;
 b=Z/eP5BE4KU3TXRD9YFxkEBNHP69kQZRrLx/61nsGcT+OgmAo0Tu1nUMl
 wulqUD5X+BPXCGNsX9EYcG0rrs01NRpqEppSj1ok9o1VFF/DOfMKjtT8Z
 nDcIKL/sXUDtsc7w/KqIBq7symaIjiJYsAb98MJDShP46gxMUdVyOk/sM
 pAfBR+q8Ix6DBogbKh57KkDebXjA/tT+Vcu/x2DIsioddPYLT1Nw6W9La
 zccCR/jEbzHNseyJdRkbZqadCPa8r+kheP8+jKWLRdXV/ImqARC5zb7qY
 ssZ/toonh9iAHv16gwIXeclxfpxFZ6YNxA39ff/BO5HMohGwld5y7JHMX Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="436947640"
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; d="scan'208";a="436947640"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2024 22:40:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; 
   d="scan'208";a="7450113"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by orviesa003.jf.intel.com with ESMTP; 12 Feb 2024 22:40:28 -0800
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, pekka.paalanen@collabora.com,
 contact@emersion.fr, harry.wentland@amd.com, mwen@igalia.com,
 jadahl@redhat.com, sebastian.wick@redhat.com, shashank.sharma@amd.com,
 agoins@nvidia.com, joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org,
 xaver.hugl@gmail.com, victoria@system76.com, daniel@ffwll.ch,
 quic_naseer@quicinc.com, quic_cbraga@quicinc.com,
 quic_abhinavk@quicinc.com, arthurgrillo@riseup.net, marcan@marcan.st,
 Liviu.Dudau@arm.com, sashamcintosh@google.com, sean@poorly.run,
 Uma Shankar <uma.shankar@intel.com>
Subject: [PATCH 01/28] [NOT FOR REVIEW] drm: color pipeline base work
Date: Tue, 13 Feb 2024 12:18:08 +0530
Message-ID: <20240213064835.139464-2-uma.shankar@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240213064835.139464-1-uma.shankar@intel.com>
References: <20240213064835.139464-1-uma.shankar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Harry Wentland <harry.wentland@amd.com>

This is a squashed patch based on a series sent out by Harry wentland.
It contains all the changes in the series(v3) currently under review
below.

https://patchwork.freedesktop.org/patch/566614/?series=123446&rev=3

This patch lays the ground work for incremental changes and Intel
specific pipeline changes.

NOTE: This patch is not meant for review. Any review related to this
patch should be done on the original series. In order not to diverge
the discussion from the main series.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 Documentation/gpu/rfc/color_pipeline.rst      | 352 ++++++++
 drivers/gpu/drm/Makefile                      |   1 +
 drivers/gpu/drm/drm_atomic.c                  | 147 ++++
 drivers/gpu/drm/drm_atomic_helper.c           |  12 +
 drivers/gpu/drm/drm_atomic_state_helper.c     |   5 +
 drivers/gpu/drm/drm_atomic_uapi.c             | 161 ++++
 drivers/gpu/drm/drm_colorop.c                 | 292 +++++++
 drivers/gpu/drm/drm_ioctl.c                   |   7 +
 drivers/gpu/drm/drm_mode_config.c             |   7 +
 drivers/gpu/drm/tests/Makefile                |   4 +-
 drivers/gpu/drm/tests/drm_fixp_test.c         |  69 ++
 drivers/gpu/drm/vkms/Kconfig                  |   5 +
 drivers/gpu/drm/vkms/Makefile                 |   4 +-
 drivers/gpu/drm/vkms/tests/.kunitconfig       |   4 +
 drivers/gpu/drm/vkms/tests/vkms_color_tests.c | 355 ++++++++
 drivers/gpu/drm/vkms/vkms_colorop.c           | 115 +++
 drivers/gpu/drm/vkms/vkms_composer.c          | 117 ++-
 drivers/gpu/drm/vkms/vkms_drv.h               |   8 +
 drivers/gpu/drm/vkms/vkms_luts.c              | 802 ++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_luts.h              |  12 +
 drivers/gpu/drm/vkms/vkms_plane.c             |   2 +
 include/drm/drm_atomic.h                      |  84 ++
 include/drm/drm_atomic_uapi.h                 |   3 +
 include/drm/drm_colorop.h                     | 258 ++++++
 include/drm/drm_file.h                        |   7 +
 include/drm/drm_fixed.h                       |  18 +
 include/drm/drm_mode_config.h                 |  18 +
 include/drm/drm_plane.h                       |  10 +
 include/uapi/drm/drm.h                        |  18 +
 include/uapi/drm/drm_mode.h                   |   6 +
 30 files changed, 2899 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/gpu/rfc/color_pipeline.rst
 create mode 100644 drivers/gpu/drm/drm_colorop.c
 create mode 100644 drivers/gpu/drm/tests/drm_fixp_test.c
 create mode 100644 drivers/gpu/drm/vkms/tests/.kunitconfig
 create mode 100644 drivers/gpu/drm/vkms/tests/vkms_color_tests.c
 create mode 100644 drivers/gpu/drm/vkms/vkms_colorop.c
 create mode 100644 drivers/gpu/drm/vkms/vkms_luts.c
 create mode 100644 drivers/gpu/drm/vkms/vkms_luts.h
 create mode 100644 include/drm/drm_colorop.h

diff --git a/Documentation/gpu/rfc/color_pipeline.rst b/Documentation/gpu/rfc/color_pipeline.rst
new file mode 100644
index 000000000000..efc70570a592
--- /dev/null
+++ b/Documentation/gpu/rfc/color_pipeline.rst
@@ -0,0 +1,352 @@
+========================
+Linux Color Pipeline API
+========================
+
+What problem are we solving?
+============================
+
+We would like to support pre-, and post-blending complex color
+transformations in display controller hardware in order to allow for
+HW-supported HDR use-cases, as well as to provide support to
+color-managed applications, such as video or image editors.
+
+It is possible to support an HDR output on HW supporting the Colorspace
+and HDR Metadata drm_connector properties, but that requires the
+compositor or application to render and compose the content into one
+final buffer intended for display. Doing so is costly.
+
+Most modern display HW offers various 1D LUTs, 3D LUTs, matrices, and other
+operations to support color transformations. These operations are often
+implemented in fixed-function HW and therefore much more power efficient than
+performing similar operations via shaders or CPU.
+
+We would like to make use of this HW functionality to support complex color
+transformations with no, or minimal CPU or shader load.
+
+
+How are other OSes solving this problem?
+========================================
+
+The most widely supported use-cases regard HDR content, whether video or
+gaming.
+
+Most OSes will specify the source content format (color gamut, encoding transfer
+function, and other metadata, such as max and average light levels) to a driver.
+Drivers will then program their fixed-function HW accordingly to map from a
+source content buffer's space to a display's space.
+
+When fixed-function HW is not available the compositor will assemble a shader to
+ask the GPU to perform the transformation from the source content format to the
+display's format.
+
+A compositor's mapping function and a driver's mapping function are usually
+entirely separate concepts. On OSes where a HW vendor has no insight into
+closed-source compositor code such a vendor will tune their color management
+code to visually match the compositor's. On other OSes, where both mapping
+functions are open to an implementer they will ensure both mappings match.
+
+This results in mapping algorithm lock-in, meaning that no-one alone can
+experiment with or introduce new mapping algorithms and achieve
+consistent results regardless of which implementation path is taken.
+
+Why is Linux different?
+=======================
+
+Unlike other OSes, where there is one compositor for one or more drivers, on
+Linux we have a many-to-many relationship. Many compositors; many drivers.
+In addition each compositor vendor or community has their own view of how
+color management should be done. This is what makes Linux so beautiful.
+
+This means that a HW vendor can now no longer tune their driver to one
+compositor, as tuning it to one could make it look fairly different from
+another compositor's color mapping.
+
+We need a better solution.
+
+
+Descriptive API
+===============
+
+An API that describes the source and destination colorspaces is a descriptive
+API. It describes the input and output color spaces but does not describe
+how precisely they should be mapped. Such a mapping includes many minute
+design decision that can greatly affect the look of the final result.
+
+It is not feasible to describe such mapping with enough detail to ensure the
+same result from each implementation. In fact, these mappings are a very active
+research area.
+
+
+Prescriptive API
+================
+
+A prescriptive API describes not the source and destination colorspaces. It
+instead prescribes a recipe for how to manipulate pixel values to arrive at the
+desired outcome.
+
+This recipe is generally an ordered list of straight-forward operations,
+with clear mathematical definitions, such as 1D LUTs, 3D LUTs, matrices,
+or other operations that can be described in a precise manner.
+
+
+The Color Pipeline API
+======================
+
+HW color management pipelines can significantly differ between HW
+vendors in terms of availability, ordering, and capabilities of HW
+blocks. This makes a common definition of color management blocks and
+their ordering nigh impossible. Instead we are defining an API that
+allows user space to discover the HW capabilities in a generic manner,
+agnostic of specific drivers and hardware.
+
+
+drm_colorop Object & IOCTLs
+===========================
+
+To support the definition of color pipelines we define the DRM core
+object type drm_colorop. Individual drm_colorop objects will be chained
+via the NEXT property of a drm_colorop to constitute a color pipeline.
+Each drm_colorop object is unique, i.e., even if multiple color
+pipelines have the same operation they won't share the same drm_colorop
+object to describe that operation.
+
+Note that drivers are not expected to map drm_colorop objects statically
+to specific HW blocks. The mapping of drm_colorop objects is entirely a
+driver-internal detail and can be as dynamic or static as a driver needs
+it to be. See more in the Driver Implementation Guide section below.
+
+Just like other DRM objects the drm_colorop objects are discovered via
+IOCTLs:
+
+DRM_IOCTL_MODE_GETCOLOROPRESOURCES: This IOCTL is used to retrieve the
+number of all drm_colorop objects.
+
+DRM_IOCTL_MODE_GETCOLOROP: This IOCTL is used to read one drm_colorop.
+It includes the ID for the colorop object, as well as the plane_id of
+the associated plane. All other values should be registered as
+properties.
+
+Each drm_colorop has three core properties:
+
+TYPE: The type of transformation, such as
+* enumerated curve
+* custom (uniform) 1D LUT
+* 3x3 matrix
+* 3x4 matrix
+* 3D LUT
+* etc.
+
+Depending on the type of transformation other properties will describe
+more details.
+
+BYPASS: A boolean property that can be used to easily put a block into
+bypass mode. While setting other properties might fail atomic check,
+setting the BYPASS property to true should never fail. The BYPASS
+property is not mandatory for a colorop, as long as the entire pipeline
+can get bypassed by setting the COLOR_PIPELINE on a plane to '0'.
+
+NEXT: The ID of the next drm_colorop in a color pipeline, or 0 if this
+drm_colorop is the last in the chain.
+
+An example of a drm_colorop object might look like one of these::
+
+    /* 1D enumerated curve */
+    Color operation 42
+    ├─ "TYPE": immutable enum {1D enumerated curve, 1D LUT, 3x3 matrix, 3x4 matrix, 3D LUT, etc.} = 1D enumerated curve
+    ├─ "BYPASS": bool {true, false}
+    ├─ "CURVE_1D_TYPE": enum {sRGB EOTF, sRGB inverse EOTF, PQ EOTF, PQ inverse EOTF, …}
+    └─ "NEXT": immutable color operation ID = 43
+
+    /* custom 4k entry 1D LUT */
+    Color operation 52
+    ├─ "TYPE": immutable enum {1D enumerated curve, 1D LUT, 3x3 matrix, 3x4 matrix, 3D LUT, etc.} = 1D LUT
+    ├─ "BYPASS": bool {true, false}
+    ├─ "LUT_1D_SIZE": immutable range = 4096
+    ├─ "LUT_1D": blob
+    └─ "NEXT": immutable color operation ID = 0
+
+    /* 17^3 3D LUT */
+    Color operation 72
+    ├─ "TYPE": immutable enum {1D enumerated curve, 1D LUT, 3x3 matrix, 3x4 matrix, 3D LUT, etc.} = 3D LUT
+    ├─ "BYPASS": bool {true, false}
+    ├─ "LUT_3D_SIZE": immutable range = 17
+    ├─ "LUT_3D": blob
+    └─ "NEXT": immutable color operation ID = 73
+
+
+COLOR_PIPELINE Plane Property
+=============================
+
+Color Pipelines are created by a driver and advertised via a new
+COLOR_PIPELINE enum property on each plane. Values of the property
+always include '0', which is the default and means all color processing
+is disabled. Additional values will be the object IDs of the first
+drm_colorop in a pipeline. A driver can create and advertise none, one,
+or more possible color pipelines. A DRM client will select a color
+pipeline by setting the COLOR PIPELINE to the respective value.
+
+The COLOR_PIPELINE property is only exposed when the
+DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE is set. Drivers are expected to
+reject setting any existing pre-blend color operations when this cap is
+set, such as COLOR_RANGE or COLOR_ENCODING. If drivers want to support
+COLOR_RANGE or COLOR_ENCODING functionality when the color pipeline
+client cap is set, they are expected to expose colorops in the pipeline
+to allow for the appropriate color transformation.
+
+An example of a COLOR_PIPELINE property on a plane might look like this::
+
+    Plane 10
+    ├─ "type": immutable enum {Overlay, Primary, Cursor} = Primary
+    ├─ …
+    └─ "color_pipeline": enum {0, 42, 52} = 0
+
+
+Color Pipeline Discovery
+========================
+
+A DRM client wanting color management on a drm_plane will:
+
+1. Read all drm_colorop objects
+2. Get the COLOR_PIPELINE property of the plane
+3. iterate all COLOR_PIPELINE enum values
+4. for each enum value walk the color pipeline (via the NEXT pointers)
+   and see if the available color operations are suitable for the
+   desired color management operations
+
+An example of chained properties to define an AMD pre-blending color
+pipeline might look like this::
+
+    Plane 10
+    ├─ "TYPE" (immutable) = Primary
+    └─ "COLOR_PIPELINE": enum {0, 44} = 0
+
+    Color operation 44
+    ├─ "TYPE" (immutable) = 1D enumerated curve
+    ├─ "BYPASS": bool
+    ├─ "CURVE_1D_TYPE": enum {sRGB EOTF, PQ EOTF} = sRGB EOTF
+    └─ "NEXT" (immutable) = 45
+
+    Color operation 45
+    ├─ "TYPE" (immutable) = 3x4 Matrix
+    ├─ "BYPASS": bool
+    ├─ "MATRIX_3_4": blob
+    └─ "NEXT" (immutable) = 46
+
+    Color operation 46
+    ├─ "TYPE" (immutable) = 1D enumerated curve
+    ├─ "BYPASS": bool
+    ├─ "CURVE_1D_TYPE": enum {sRGB Inverse EOTF, PQ Inverse EOTF} = sRGB EOTF
+    └─ "NEXT" (immutable) = 47
+
+    Color operation 47
+    ├─ "TYPE" (immutable) = 1D LUT
+    ├─ "LUT_1D_SIZE": immutable range = 4096
+    ├─ "LUT_1D_DATA": blob
+    └─ "NEXT" (immutable) = 48
+
+    Color operation 48
+    ├─ "TYPE" (immutable) = 3D LUT
+    ├─ "LUT_3D_SIZE" (immutable) = 17
+    ├─ "LUT_3D_DATA": blob
+    └─ "NEXT" (immutable) = 49
+
+    Color operation 49
+    ├─ "TYPE" (immutable) = 1D enumerated curve
+    ├─ "BYPASS": bool
+    ├─ "CURVE_1D_TYPE": enum {sRGB EOTF, PQ EOTF} = sRGB EOTF
+    └─ "NEXT" (immutable) = 0
+
+
+Color Pipeline Programming
+==========================
+
+Once a DRM client has found a suitable pipeline it will:
+
+1. Set the COLOR_PIPELINE enum value to the one pointing at the first
+   drm_colorop object of the desired pipeline
+2. Set the properties for all drm_colorop objects in the pipeline to the
+   desired values, setting BYPASS to true for unused drm_colorop blocks,
+   and false for enabled drm_colorop blocks
+3. Perform atomic_check/commit as desired
+
+To configure the pipeline for an HDR10 PQ plane and blending in linear
+space, a compositor might perform an atomic commit with the following
+property values::
+
+    Plane 10
+    └─ "COLOR_PIPELINE" = 42
+
+    Color operation 42 (input CSC)
+    └─ "BYPASS" = true
+
+    Color operation 44 (DeGamma)
+    └─ "BYPASS" = true
+
+    Color operation 45 (gamut remap)
+    └─ "BYPASS" = true
+
+    Color operation 46 (shaper LUT RAM)
+    └─ "BYPASS" = true
+
+    Color operation 47 (3D LUT RAM)
+    └─ "LUT_3D_DATA" = Gamut mapping + tone mapping + night mode
+
+    Color operation 48 (blend gamma)
+    └─ "CURVE_1D_TYPE" = PQ EOTF
+
+
+Driver Implementer's Guide
+==========================
+
+What does this all mean for driver implementations? As noted above the
+colorops can map to HW directly but don't need to do so. Here are some
+suggestions on how to think about creating your color pipelines:
+
+- Try to expose pipelines that use already defined colorops, even if
+  your hardware pipeline is split differently. This allows existing
+  userspace to immediately take advantage of the hardware.
+
+- Additionally, try to expose your actual hardware blocks as colorops.
+  Define new colorop types where you believe it can offer significant
+  benefits if userspace learns to program them.
+
+- Avoid defining new colorops for compound operations with very narrow
+  scope. If you have a hardware block for a special operation that
+  cannot be split further, you can expose that as a new colorop type.
+  However, try to not define colorops for "use cases", especially if
+  they require you to combine multiple hardware blocks.
+
+- Design new colorops as prescriptive, not descriptive; by the
+  mathematical formula, not by the assumed input and output.
+
+A defined colorop type must be deterministic. The exact behavior of the
+colorop must be documented entirely, whether via a mathematical formula
+or some other description. Its operation can depend only on its
+properties and input and nothing else, allowed error tolerance
+notwithstanding.
+
+
+Driver Forward/Backward Compatibility
+=====================================
+
+As this is uAPI drivers can't regress color pipelines that have been
+introduced for a given HW generation. New HW generations are free to
+abandon color pipelines advertised for previous generations.
+Nevertheless, it can be beneficial to carry support for existing color
+pipelines forward as those will likely already have support in DRM
+clients.
+
+Introducing new colorops to a pipeline is fine, as long as they can be
+disabled or are purely informational. DRM clients implementing support
+for the pipeline can always skip unknown properties as long as they can
+be confident that doing so will not cause unexpected results.
+
+If a new colorop doesn't fall into one of the above categories
+(bypassable or informational) the modified pipeline would be unusable
+for user space. In this case a new pipeline should be defined.
+
+
+References
+==========
+
+1. https://lore.kernel.org/dri-devel/QMers3awXvNCQlyhWdTtsPwkp5ie9bze_hD5nAccFW7a_RXlWjYB7MoUW_8CKLT2bSQwIXVi5H6VULYIxCdgvryZoAoJnC5lZgyK1QWn488=@emersion.fr/
\ No newline at end of file
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 104b42df2e95..4b14dcbb6117 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -16,6 +16,7 @@ drm-y := \
 	drm_client.o \
 	drm_client_modeset.o \
 	drm_color_mgmt.o \
+	drm_colorop.o \
 	drm_connector.o \
 	drm_crtc.o \
 	drm_displayid.o \
diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index a91737adf8e7..ad8483972f56 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -42,6 +42,7 @@
 #include <drm/drm_mode.h>
 #include <drm/drm_print.h>
 #include <drm/drm_writeback.h>
+#include <drm/drm_colorop.h>
 
 #include "drm_crtc_internal.h"
 #include "drm_internal.h"
@@ -108,6 +109,7 @@ void drm_atomic_state_default_release(struct drm_atomic_state *state)
 	kfree(state->connectors);
 	kfree(state->crtcs);
 	kfree(state->planes);
+	kfree(state->colorops);
 	kfree(state->private_objs);
 }
 EXPORT_SYMBOL(drm_atomic_state_default_release);
@@ -139,6 +141,10 @@ drm_atomic_state_init(struct drm_device *dev, struct drm_atomic_state *state)
 				sizeof(*state->planes), GFP_KERNEL);
 	if (!state->planes)
 		goto fail;
+	state->colorops = kcalloc(dev->mode_config.num_colorop,
+				  sizeof(*state->colorops), GFP_KERNEL);
+	if (!state->colorops)
+		goto fail;
 
 	/*
 	 * Because drm_atomic_state can be committed asynchronously we need our
@@ -250,6 +256,20 @@ void drm_atomic_state_default_clear(struct drm_atomic_state *state)
 		state->planes[i].new_state = NULL;
 	}
 
+	for (i = 0; i < config->num_colorop; i++) {
+		struct drm_colorop *colorop = state->colorops[i].ptr;
+
+		if (!colorop)
+			continue;
+
+		drm_colorop_atomic_destroy_state(colorop,
+						 state->colorops[i].state);
+		state->colorops[i].ptr = NULL;
+		state->colorops[i].state = NULL;
+		state->colorops[i].old_state = NULL;
+		state->colorops[i].new_state = NULL;
+	}
+
 	for (i = 0; i < state->num_private_objs; i++) {
 		struct drm_private_obj *obj = state->private_objs[i].ptr;
 
@@ -571,6 +591,56 @@ drm_atomic_get_plane_state(struct drm_atomic_state *state,
 }
 EXPORT_SYMBOL(drm_atomic_get_plane_state);
 
+
+/**
+ * drm_atomic_get_colorop_state - get colorop state
+ * @state: global atomic state object
+ * @colorop: colorop to get state object for
+ *
+ * This function returns the colorop state for the given colorop, allocating it
+ * if needed. It will also grab the relevant plane lock to make sure that the
+ * state is consistent.
+ *
+ * Returns:
+ *
+ * Either the allocated state or the error code encoded into the pointer. When
+ * the error is EDEADLK then the w/w mutex code has detected a deadlock and the
+ * entire atomic sequence must be restarted. All other errors are fatal.
+ */
+struct drm_colorop_state *
+drm_atomic_get_colorop_state(struct drm_atomic_state *state,
+			     struct drm_colorop *colorop)
+{
+	int ret, index = drm_colorop_index(colorop);
+	struct drm_colorop_state *colorop_state;
+
+	WARN_ON(!state->acquire_ctx);
+
+	colorop_state = drm_atomic_get_existing_colorop_state(state, colorop);
+	if (colorop_state)
+		return colorop_state;
+
+	ret = drm_modeset_lock(&colorop->plane->mutex, state->acquire_ctx);
+	if (ret)
+		return ERR_PTR(ret);
+
+	colorop_state = drm_atomic_helper_colorop_duplicate_state(colorop);
+	if (!colorop_state)
+		return ERR_PTR(-ENOMEM);
+
+	state->colorops[index].state = colorop_state;
+	state->colorops[index].ptr = colorop;
+	state->colorops[index].old_state = colorop->state;
+	state->colorops[index].new_state = colorop_state;
+	colorop_state->state = state;
+
+	drm_dbg_atomic(colorop->dev, "Added [COLOROP:%d:%d] %p state to %p\n",
+		       colorop->base.id, colorop->type, colorop_state, state);
+
+	return colorop_state;
+}
+EXPORT_SYMBOL(drm_atomic_get_colorop_state);
+
 static bool
 plane_switching_crtc(const struct drm_plane_state *old_plane_state,
 		     const struct drm_plane_state *new_plane_state)
@@ -713,6 +783,20 @@ static int drm_atomic_plane_check(const struct drm_plane_state *old_plane_state,
 	return 0;
 }
 
+
+
+static void drm_atomic_colorop_print_state(struct drm_printer *p,
+		const struct drm_colorop_state *state)
+{
+	struct drm_colorop *colorop = state->colorop;
+
+	drm_printf(p, "colorop[%u]:\n", colorop->base.id);
+	drm_printf(p, "\ttype=%s\n", drm_get_colorop_type_name(colorop->type));
+	drm_printf(p, "\tbypass=%u\n", state->bypass);
+	drm_printf(p, "\tcurve_1d_type=%s\n", drm_get_colorop_curve_1d_type_name(state->curve_1d_type));
+	drm_printf(p, "\tnext=%d\n", colorop->next ? colorop->next->base.id : 0);
+}
+
 static void drm_atomic_plane_print_state(struct drm_printer *p,
 		const struct drm_plane_state *state)
 {
@@ -734,6 +818,14 @@ static void drm_atomic_plane_print_state(struct drm_printer *p,
 	drm_printf(p, "\tcolor-range=%s\n",
 		   drm_get_color_range_name(state->color_range));
 	drm_printf(p, "\tcolor_mgmt_changed=%d\n", state->color_mgmt_changed);
+#if 0
+       drm_printf(p, "\tcolor-pipeline=%s\n",
+                  drm_get_color_pipeline_name(state->color_pipeline));
+#else
+       drm_printf(p, "\tcolor-pipeline=%d\n",
+                  state->color_pipeline ? state->color_pipeline->base.id : 0);
+#endif
+
 
 	if (plane->funcs->atomic_print_state)
 		plane->funcs->atomic_print_state(p, state);
@@ -1374,6 +1466,52 @@ drm_atomic_add_affected_planes(struct drm_atomic_state *state,
 }
 EXPORT_SYMBOL(drm_atomic_add_affected_planes);
 
+/**
+ * drm_atomic_add_affected_colorops - add colorops for plane
+ * @state: atomic state
+ * @plane: DRM plane
+ *
+ * This function walks the current configuration and adds all colorops
+ * currently used by @plane to the atomic configuration @state. This is useful
+ * when an atomic commit also needs to check all currently enabled colorop on
+ * @plane, e.g. when changing the mode. It's also useful when re-enabling a plane
+ * to avoid special code to force-enable all colorops.
+ *
+ * Since acquiring a colorop state will always also acquire the w/w mutex of the
+ * current plane for that colorop (if there is any) adding all the colorop states for
+ * a plane will not reduce parallelism of atomic updates.
+ *
+ * Returns:
+ * 0 on success or can fail with -EDEADLK or -ENOMEM. When the error is EDEADLK
+ * then the w/w mutex code has detected a deadlock and the entire atomic
+ * sequence must be restarted. All other errors are fatal.
+ */
+int
+drm_atomic_add_affected_colorops(struct drm_atomic_state *state,
+				 struct drm_plane *plane)
+{
+	struct drm_colorop *colorop;
+	struct drm_colorop_state *colorop_state;
+
+	WARN_ON(!drm_atomic_get_new_plane_state(state, plane));
+
+	drm_dbg_atomic(plane->dev,
+		       "Adding all current colorops for [plane:%d:%s] to %p\n",
+		       plane->base.id, plane->name, state);
+
+	drm_for_each_colorop(colorop, plane->dev) {
+		if (colorop->plane != plane)
+			continue;
+
+		colorop_state = drm_atomic_get_colorop_state(state, colorop);
+		if (IS_ERR(colorop_state))
+			return PTR_ERR(colorop_state);
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_atomic_add_affected_colorops);
+
 /**
  * drm_atomic_check_only - check whether a given config would work
  * @state: atomic configuration to check
@@ -1770,6 +1908,7 @@ static void __drm_state_dump(struct drm_device *dev, struct drm_printer *p,
 			     bool take_locks)
 {
 	struct drm_mode_config *config = &dev->mode_config;
+	struct drm_colorop *colorop;
 	struct drm_plane *plane;
 	struct drm_crtc *crtc;
 	struct drm_connector *connector;
@@ -1779,6 +1918,14 @@ static void __drm_state_dump(struct drm_device *dev, struct drm_printer *p,
 	if (!drm_drv_uses_atomic_modeset(dev))
 		return;
 
+	list_for_each_entry(colorop, &config->colorop_list, head) {
+		if (take_locks)
+			drm_modeset_lock(&colorop->plane->mutex, NULL);
+		drm_atomic_colorop_print_state(p, colorop->state);
+		if (take_locks)
+			drm_modeset_unlock(&colorop->plane->mutex);
+	}
+
 	list_for_each_entry(plane, &config->plane_list, head) {
 		if (take_locks)
 			drm_modeset_lock(&plane->mutex, NULL);
diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 39ef0a6addeb..282aa1f7b9a6 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -3022,6 +3022,8 @@ int drm_atomic_helper_swap_state(struct drm_atomic_state *state,
 	struct drm_crtc_state *old_crtc_state, *new_crtc_state;
 	struct drm_plane *plane;
 	struct drm_plane_state *old_plane_state, *new_plane_state;
+	struct drm_colorop *colorop;
+	struct drm_colorop_state *old_colorop_state, *new_colorop_state;
 	struct drm_crtc_commit *commit;
 	struct drm_private_obj *obj;
 	struct drm_private_state *old_obj_state, *new_obj_state;
@@ -3099,6 +3101,16 @@ int drm_atomic_helper_swap_state(struct drm_atomic_state *state,
 		}
 	}
 
+	for_each_oldnew_colorop_in_state(state, colorop, old_colorop_state, new_colorop_state, i) {
+		WARN_ON(colorop->state != old_colorop_state);
+
+		old_colorop_state->state = state;
+		new_colorop_state->state = NULL;
+
+		state->colorops[i].state = old_colorop_state;
+		colorop->state = new_colorop_state;
+	}
+
 	for_each_oldnew_plane_in_state(state, plane, old_plane_state, new_plane_state, i) {
 		WARN_ON(plane->state != old_plane_state);
 
diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index 519228eb1095..d1dd082b1286 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -267,6 +267,11 @@ void __drm_atomic_helper_plane_state_reset(struct drm_plane_state *plane_state,
 			plane_state->color_range = val;
 	}
 
+	if (plane->color_pipeline_property) {
+		/* default is always NULL, i.e., bypass */
+		plane_state->color_pipeline = NULL;
+	}
+
 	if (plane->zpos_property) {
 		if (!drm_object_property_get_default_value(&plane->base,
 							   plane->zpos_property,
diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 29d4940188d4..64657d961755 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -34,6 +34,7 @@
 #include <drm/drm_drv.h>
 #include <drm/drm_writeback.h>
 #include <drm/drm_vblank.h>
+#include <drm/drm_colorop.h>
 
 #include <linux/dma-fence.h>
 #include <linux/uaccess.h>
@@ -255,6 +256,38 @@ drm_atomic_set_fb_for_plane(struct drm_plane_state *plane_state,
 }
 EXPORT_SYMBOL(drm_atomic_set_fb_for_plane);
 
+
+/**
+ * drm_atomic_set_colorop_for_plane - set colorop for plane
+ * @plane_state: atomic state object for the plane
+ * @colorop: colorop to use for the plane
+ *
+ * Changing the assigned framebuffer for a plane requires us to grab a reference
+ * to the new fb and drop the reference to the old fb, if there is one. This
+ * function takes care of all these details besides updating the pointer in the
+ * state object itself.
+ */
+void
+drm_atomic_set_colorop_for_plane(struct drm_plane_state *plane_state,
+				 struct drm_colorop *colorop)
+{
+	struct drm_plane *plane = plane_state->plane;
+
+	if (colorop)
+		drm_dbg_atomic(plane->dev,
+			       "Set [COLOROP:%d] for [PLANE:%d:%s] state %p\n",
+			       colorop->base.id, plane->base.id, plane->name,
+			       plane_state);
+	else
+		drm_dbg_atomic(plane->dev,
+			       "Set [NOCOLOROP] for [PLANE:%d:%s] state %p\n",
+			       plane->base.id, plane->name, plane_state);
+
+	plane_state->color_pipeline = colorop;
+}
+EXPORT_SYMBOL(drm_atomic_set_colorop_for_plane);
+
+
 /**
  * drm_atomic_set_crtc_for_connector - set CRTC for connector
  * @conn_state: atomic state object for the connector
@@ -535,9 +568,35 @@ static int drm_atomic_plane_set_property(struct drm_plane *plane,
 	} else if (property == plane->zpos_property) {
 		state->zpos = val;
 	} else if (property == plane->color_encoding_property) {
+		if (file_priv->plane_color_pipeline) {
+			drm_dbg_atomic(dev,
+				       "Setting COLOR_PIPELINE plane property not permitted when DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE is set\n");
+			return -EINVAL;
+		}
 		state->color_encoding = val;
 	} else if (property == plane->color_range_property) {
+		if (file_priv->plane_color_pipeline) {
+			drm_dbg_atomic(dev,
+				       "Setting COLOR_PIPELINE plane property not permitted when DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE is set\n");
+			return -EINVAL;
+		}
 		state->color_range = val;
+	} else if (property == plane->color_pipeline_property) {
+		if (!file_priv->plane_color_pipeline) {
+			drm_dbg_atomic(dev,
+				       "Setting COLOR_PIPELINE plane property not permitted unless DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE is set\n");
+			return -EINVAL;
+		}
+
+		/* find DRM colorop object */
+		struct drm_colorop *colorop = NULL;
+		colorop = drm_colorop_find(dev, file_priv, val);
+
+		if (val && !colorop)
+			return -EACCES;
+
+		/* set it on drm_plane_state */
+		drm_atomic_set_colorop_for_plane(state, colorop);
 	} else if (property == config->prop_fb_damage_clips) {
 		ret = drm_property_replace_blob_from_id(dev,
 					&state->fb_damage_clips,
@@ -620,6 +679,8 @@ drm_atomic_plane_get_property(struct drm_plane *plane,
 		*val = state->color_encoding;
 	} else if (property == plane->color_range_property) {
 		*val = state->color_range;
+	} else if (property == plane->color_pipeline_property) {
+		*val = (state->color_pipeline) ? state->color_pipeline->base.id : 0;
 	} else if (property == config->prop_fb_damage_clips) {
 		*val = (state->fb_damage_clips) ?
 			state->fb_damage_clips->base.id : 0;
@@ -642,6 +703,74 @@ drm_atomic_plane_get_property(struct drm_plane *plane,
 	return 0;
 }
 
+static int drm_atomic_color_set_data_property(struct drm_colorop *colorop,
+		struct drm_colorop_state *state,
+		struct drm_property *property, uint64_t val)
+{
+	ssize_t elem_size = -1;
+	ssize_t size = -1;
+	bool replaced;
+
+
+	switch (colorop->type) {
+	case DRM_COLOROP_CTM_3X4:
+		size = sizeof(struct drm_color_ctm_3x4);
+		break;
+	default:
+		/* should never get here */
+		return -EINVAL;
+	}
+
+	return drm_property_replace_blob_from_id(colorop->dev,
+						 &state->data,
+						 val,
+						 size,
+						 elem_size,
+						 &replaced);
+}
+
+static int drm_atomic_colorop_set_property(struct drm_colorop *colorop,
+		struct drm_colorop_state *state, struct drm_file *file_priv,
+		struct drm_property *property, uint64_t val)
+{
+	if (property == colorop->bypass_property) {
+		state->bypass = val;
+	} else if (property == colorop->curve_1d_type_property) {
+		state->curve_1d_type = val;
+	} else if (property == colorop->data_property) {
+		return drm_atomic_color_set_data_property(colorop,
+					state, property, val);
+	} else {
+		drm_dbg_atomic(colorop->dev,
+			       "[COLOROP:%d:%d] unknown property [PROP:%d:%s]]\n",
+			       colorop->base.id, colorop->type,
+			       property->base.id, property->name);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int
+drm_atomic_colorop_get_property(struct drm_colorop *colorop,
+		const struct drm_colorop_state *state,
+		struct drm_property *property, uint64_t *val)
+{
+	if (property == colorop->type_property) {
+		*val = colorop->type;
+	} else if (property == colorop->bypass_property) {
+		*val = state->bypass;
+	} else if (property == colorop->curve_1d_type_property) {
+		*val = state->curve_1d_type;
+	} else if (property == colorop->data_property) {
+		*val = (state->data) ? state->data->base.id : 0;
+	} else {
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static int drm_atomic_set_writeback_fb_for_connector(
 		struct drm_connector_state *conn_state,
 		struct drm_framebuffer *fb)
@@ -904,6 +1033,16 @@ int drm_atomic_get_property(struct drm_mode_object *obj,
 				plane->state, property, val);
 		break;
 	}
+	case DRM_MODE_OBJECT_COLOROP: {
+		struct drm_colorop *colorop = obj_to_colorop(obj);
+
+		if (colorop->plane)
+			WARN_ON(!drm_modeset_is_locked(&colorop->plane->mutex));
+
+		ret = drm_atomic_colorop_get_property(colorop,
+				colorop->state, property, val);
+		break;
+	}
 	default:
 		drm_dbg_atomic(dev, "[OBJECT:%d] has no properties\n", obj->id);
 		ret = -EINVAL;
@@ -1084,6 +1223,28 @@ int drm_atomic_set_property(struct drm_atomic_state *state,
 		ret = drm_atomic_plane_set_property(plane,
 				plane_state, file_priv,
 				prop, prop_value);
+
+		break;
+	}
+	case DRM_MODE_OBJECT_COLOROP: {
+		if (!file_priv->plane_color_pipeline) {
+			drm_dbg_atomic(prop->dev,
+				       "[OBJECT:%d] is a colorop but DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE not set\n",
+				       obj->id);
+			ret = -EINVAL;
+		}
+		struct drm_colorop *colorop = obj_to_colorop(obj);
+		struct drm_colorop_state *colorop_state;
+
+		colorop_state = drm_atomic_get_colorop_state(state, colorop);
+		if (IS_ERR(colorop_state)) {
+			ret = PTR_ERR(colorop_state);
+			break;
+		}
+
+		ret = drm_atomic_colorop_set_property(colorop,
+				colorop_state, file_priv,
+				prop, prop_value);
 		break;
 	}
 	default:
diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
new file mode 100644
index 000000000000..67e6efc90803
--- /dev/null
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -0,0 +1,292 @@
+/*
+ * Copyright (C) 2023 Advanced Micro Devices, Inc. All rights reserved.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ * Authors: AMD
+ *
+ */
+
+#include <drm/drm_colorop.h>
+#include <drm/drm_print.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_plane.h>
+
+#include "drm_crtc_internal.h"
+
+/* TODO big colorop doc, including properties, etc. */
+
+static const struct drm_prop_enum_list drm_colorop_type_enum_list[] = {
+	{ DRM_COLOROP_1D_CURVE, "1D Curve" },
+	{ DRM_COLOROP_CTM_3X4, "3x4 Matrix"}
+};
+
+static const struct drm_prop_enum_list drm_colorop_curve_1d_type_enum_list[] = {
+	{ DRM_COLOROP_1D_CURVE_SRGB_EOTF, "sRGB EOTF" },
+	{ DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF, "sRGB Inverse EOTF" },
+};
+
+/* Init Helpers */
+
+int drm_colorop_init(struct drm_device *dev, struct drm_colorop *colorop,
+		     struct drm_plane *plane, enum drm_colorop_type type)
+{
+	struct drm_mode_config *config = &dev->mode_config;
+	struct drm_property *prop;
+	int ret = 0;
+
+	ret = drm_mode_object_add(dev, &colorop->base, DRM_MODE_OBJECT_COLOROP);
+	if (ret)
+		return ret;
+
+	colorop->base.properties = &colorop->properties;
+	colorop->dev = dev;
+	colorop->type = type;
+	colorop->plane = plane;
+	colorop->next = NULL;
+
+	list_add_tail(&colorop->head, &config->colorop_list);
+	colorop->index = config->num_colorop++;
+
+	/* add properties */
+
+	/* type */
+	prop = drm_property_create_range(dev,
+					DRM_MODE_PROP_IMMUTABLE,
+					"TYPE", type, type);
+
+	if (!prop)
+		return -ENOMEM;
+
+	colorop->type_property = prop;
+
+	drm_object_attach_property(&colorop->base,
+				   colorop->type_property,
+				   colorop->type);
+
+	/* bypass */
+	/* TODO can we reuse the mode_config->active_prop? */
+	prop = drm_property_create_bool(dev, DRM_MODE_PROP_ATOMIC,
+					"BYPASS");
+	if (!prop)
+		return -ENOMEM;
+
+	colorop->bypass_property = prop;
+	drm_object_attach_property(&colorop->base,
+				   colorop->bypass_property,
+				   1);
+
+	/* curve_1d_type */
+	/* TODO move to mode_config? */
+	prop = drm_property_create_enum(dev, DRM_MODE_PROP_ATOMIC,
+					"CURVE_1D_TYPE",
+					drm_colorop_curve_1d_type_enum_list,
+					ARRAY_SIZE(drm_colorop_curve_1d_type_enum_list));
+	if (!prop)
+		return -ENOMEM;
+
+	colorop->curve_1d_type_property = prop;
+	drm_object_attach_property(&colorop->base,
+				   colorop->curve_1d_type_property,
+				   0);
+
+	/* data */
+	if (type == DRM_COLOROP_CTM_3X4) {
+		prop = drm_property_create(dev, DRM_MODE_PROP_ATOMIC | DRM_MODE_PROP_BLOB,
+					   "DATA", 0);
+		if (!prop)
+			return -ENOMEM;
+
+		colorop->data_property = prop;
+		drm_object_attach_property(&colorop->base,
+					   colorop->data_property,
+					   0);
+	}
+
+	/* next */
+	prop = drm_property_create_object(dev, DRM_MODE_PROP_IMMUTABLE | DRM_MODE_PROP_ATOMIC,
+			"NEXT", DRM_MODE_OBJECT_COLOROP);
+	if (!prop)
+		return -ENOMEM;
+	colorop->next_property = prop;
+	drm_object_attach_property(&colorop->base,
+				   colorop->next_property,
+				   0);
+
+	return ret;
+}
+EXPORT_SYMBOL(drm_colorop_init);
+
+static void __drm_atomic_helper_colorop_duplicate_state(struct drm_colorop *colorop,
+							struct drm_colorop_state *state)
+{
+	memcpy(state, colorop->state, sizeof(*state));
+
+	state->bypass = true;
+}
+
+struct drm_colorop_state *
+drm_atomic_helper_colorop_duplicate_state(struct drm_colorop *colorop)
+{
+	struct drm_colorop_state *state;
+
+	if (WARN_ON(!colorop->state))
+		return NULL;
+
+	state = kmalloc(sizeof(*state), GFP_KERNEL);
+	if (state)
+		__drm_atomic_helper_colorop_duplicate_state(colorop, state);
+
+	return state;
+}
+
+
+void drm_colorop_atomic_destroy_state(struct drm_colorop *colorop,
+				      struct drm_colorop_state *state)
+{
+	kfree(state);
+}
+
+/**
+ * drm_colorop_destroy_state - default state destroy hook
+ * @colorop: drm colorop
+ * @state: colorop state object to release
+ *
+ * Default colorop state destroy hook for drivers which don't have their own
+ * subclassed colorop state structure.
+ */
+void drm_colorop_destroy_state(struct drm_colorop *colorop,
+			       struct drm_colorop_state *state)
+{
+	kfree(state);
+}
+EXPORT_SYMBOL(drm_colorop_destroy_state);
+
+/**
+ * __drm_colorop_state_reset - resets colorop state to default values
+ * @colorop_state: atomic colorop state, must not be NULL
+ * @colorop: colorop object, must not be NULL
+ *
+ * Initializes the newly allocated @colorop_state with default
+ * values. This is useful for drivers that subclass the CRTC state.
+ */
+static void __drm_colorop_state_reset(struct drm_colorop_state *colorop_state,
+				      struct drm_colorop *colorop)
+{
+	colorop_state->colorop = colorop;
+	colorop_state->bypass = true;
+}
+
+/**
+ * __drm_colorop_reset - reset state on colorop
+ * @colorop: drm colorop
+ * @colorop_state: colorop state to assign
+ *
+ * Initializes the newly allocated @colorop_state and assigns it to
+ * the &drm_crtc->state pointer of @colorop, usually required when
+ * initializing the drivers or when called from the &drm_colorop_funcs.reset
+ * hook.
+ *
+ * This is useful for drivers that subclass the colorop state.
+ */
+static void __drm_colorop_reset(struct drm_colorop *colorop,
+				struct drm_colorop_state *colorop_state)
+{
+	if (colorop_state)
+		__drm_colorop_state_reset(colorop_state, colorop);
+
+	colorop->state = colorop_state;
+}
+
+/**
+ * drm_colorop_reset - reset colorop atomic state
+ * @colorop: drm colorop
+ *
+ * Resets the atomic state for @colorop by freeing the state pointer (which might
+ * be NULL, e.g. at driver load time) and allocating a new empty state object.
+ */
+void drm_colorop_reset(struct drm_colorop *colorop)
+{
+	kfree(colorop->state);
+	colorop->state = kzalloc(sizeof(*colorop->state), GFP_KERNEL);
+
+	if (colorop->state)
+		__drm_colorop_reset(colorop, colorop->state);
+}
+EXPORT_SYMBOL(drm_colorop_reset);
+
+
+static const char * const colorop_type_name[] = {
+	[DRM_COLOROP_1D_CURVE] = "1D Curve",
+	[DRM_COLOROP_CTM_3X4] = "3x4 Matrix"
+};
+
+static const char * const colorop_curve_1d_type_name[] = {
+	[DRM_COLOROP_1D_CURVE_SRGB_EOTF] = "sRGB EOTF",
+	[DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF] = "sRGB Inverse EOTF",
+};
+
+/**
+ * drm_get_colorop_type_name - return a string for colorop type
+ * @type: colorop type to compute name of
+ *
+ * In contrast to the other drm_get_*_name functions this one here returns a
+ * const pointer and hence is threadsafe.
+ */
+const char *drm_get_colorop_type_name(enum drm_colorop_type type)
+{
+	if (WARN_ON(type >= ARRAY_SIZE(colorop_type_name)))
+		return "unknown";
+
+	return colorop_type_name[type];
+}
+
+/**
+ * drm_get_colorop_curve_1d_type_name - return a string for 1D curve type
+ * @range: 1d curve type to compute name of
+ *
+ * In contrast to the other drm_get_*_name functions this one here returns a
+ * const pointer and hence is threadsafe.
+ */
+const char *drm_get_colorop_curve_1d_type_name(enum drm_colorop_curve_1d_type type)
+{
+	if (WARN_ON(type >= ARRAY_SIZE(colorop_curve_1d_type_name)))
+		return "unknown";
+
+	return colorop_curve_1d_type_name[type];
+}
+
+/**
+ * drm_colorop_set_next_property - sets the next pointer
+ * @colorop: drm colorop
+ * @next: next colorop
+ *
+ * Should be used when constructing the color pipeline
+ */
+void drm_colorop_set_next_property(struct drm_colorop *colorop, struct drm_colorop *next)
+{
+	if (!colorop->next_property)
+		return;
+
+	drm_object_property_set_value(&colorop->base,
+				      colorop->next_property,
+				      next->base.id);
+	colorop->next = next;
+}
+EXPORT_SYMBOL(drm_colorop_set_next_property);
diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
index e368fc084c77..da59e37ae228 100644
--- a/drivers/gpu/drm/drm_ioctl.c
+++ b/drivers/gpu/drm/drm_ioctl.c
@@ -373,6 +373,13 @@ drm_setclientcap(struct drm_device *dev, void *data, struct drm_file *file_priv)
 			return -EINVAL;
 		file_priv->supports_virtualized_cursor_plane = req->value;
 		break;
+	case DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE:
+		if (!file_priv->atomic)
+			return -EINVAL;
+		if (req->value > 1)
+			return -EINVAL;
+		file_priv->plane_color_pipeline = req->value;
+		break;
 	default:
 		return -EINVAL;
 	}
diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
index 48fd2d67f352..e9253f401239 100644
--- a/drivers/gpu/drm/drm_mode_config.c
+++ b/drivers/gpu/drm/drm_mode_config.c
@@ -29,6 +29,7 @@
 #include <drm/drm_managed.h>
 #include <drm/drm_mode_config.h>
 #include <drm/drm_print.h>
+#include <drm/drm_colorop.h>
 #include <linux/dma-resv.h>
 
 #include "drm_crtc_internal.h"
@@ -182,11 +183,15 @@ int drm_mode_getresources(struct drm_device *dev, void *data,
 void drm_mode_config_reset(struct drm_device *dev)
 {
 	struct drm_crtc *crtc;
+	struct drm_colorop *colorop;
 	struct drm_plane *plane;
 	struct drm_encoder *encoder;
 	struct drm_connector *connector;
 	struct drm_connector_list_iter conn_iter;
 
+	drm_for_each_colorop(colorop, dev)
+		drm_colorop_reset(colorop);
+
 	drm_for_each_plane(plane, dev)
 		if (plane->funcs->reset)
 			plane->funcs->reset(plane);
@@ -413,6 +418,7 @@ int drmm_mode_config_init(struct drm_device *dev)
 	INIT_LIST_HEAD(&dev->mode_config.property_list);
 	INIT_LIST_HEAD(&dev->mode_config.property_blob_list);
 	INIT_LIST_HEAD(&dev->mode_config.plane_list);
+	INIT_LIST_HEAD(&dev->mode_config.colorop_list);
 	INIT_LIST_HEAD(&dev->mode_config.privobj_list);
 	idr_init_base(&dev->mode_config.object_idr, 1);
 	idr_init_base(&dev->mode_config.tile_idr, 1);
@@ -434,6 +440,7 @@ int drmm_mode_config_init(struct drm_device *dev)
 	dev->mode_config.num_crtc = 0;
 	dev->mode_config.num_encoder = 0;
 	dev->mode_config.num_total_plane = 0;
+	dev->mode_config.num_colorop = 0;
 
 	if (IS_ENABLED(CONFIG_LOCKDEP)) {
 		struct drm_modeset_acquire_ctx modeset_ctx;
diff --git a/drivers/gpu/drm/tests/Makefile b/drivers/gpu/drm/tests/Makefile
index d6183b3d7688..010c338f9c19 100644
--- a/drivers/gpu/drm/tests/Makefile
+++ b/drivers/gpu/drm/tests/Makefile
@@ -19,6 +19,8 @@ obj-$(CONFIG_DRM_KUNIT_TEST) += \
 	drm_modes_test.o \
 	drm_plane_helper_test.o \
 	drm_probe_helper_test.o \
-	drm_rect_test.o
+	drm_rect_test.o	\
+	drm_exec_test.o \
+	drm_fixp_test.o
 
 CFLAGS_drm_mm_test.o := $(DISABLE_STRUCTLEAK_PLUGIN)
diff --git a/drivers/gpu/drm/tests/drm_fixp_test.c b/drivers/gpu/drm/tests/drm_fixp_test.c
new file mode 100644
index 000000000000..f420f173ff66
--- /dev/null
+++ b/drivers/gpu/drm/tests/drm_fixp_test.c
@@ -0,0 +1,69 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright 2022 Advanced Micro Devices, Inc.
+ */
+
+#include <kunit/test.h>
+#include <drm/drm_fixed.h>
+
+static void drm_test_sm2fixp(struct kunit *test)
+{
+	KUNIT_EXPECT_EQ(test, 0x7fffffffffffffffll, ((1LL << 63) - 1));
+
+	/* 1 */
+	KUNIT_EXPECT_EQ(test, drm_int2fixp(1), drm_sm2fixp(1ull << DRM_FIXED_POINT));
+
+	/* -1 */
+	KUNIT_EXPECT_EQ(test, drm_int2fixp(-1), drm_sm2fixp((1ull << 63) | (1ull << DRM_FIXED_POINT)));
+
+	/* 0.5 */
+	KUNIT_EXPECT_EQ(test, drm_fixp_from_fraction(1, 2), drm_sm2fixp(1ull << (DRM_FIXED_POINT - 1)));
+
+	/* -0.5 */
+	KUNIT_EXPECT_EQ(test, drm_fixp_from_fraction(-1, 2), drm_sm2fixp((1ull << 63) | (1ull << (DRM_FIXED_POINT - 1))));
+
+}
+
+static void drm_test_int2fixp(struct kunit *test)
+{
+	/* 1 */
+	KUNIT_EXPECT_EQ(test, 1ll << 32, drm_int2fixp(1));
+
+	/* -1 */
+	KUNIT_EXPECT_EQ(test, -(1ll << 32), drm_int2fixp(-1));
+
+	/* 1 + (-1) = 0 */
+	KUNIT_EXPECT_EQ(test, 0, drm_int2fixp(1) + drm_int2fixp(-1));
+
+	/* 1 / 2 */
+	KUNIT_EXPECT_EQ(test, 1ll << 31, drm_fixp_from_fraction(1, 2));
+
+	/* -0.5 */
+	KUNIT_EXPECT_EQ(test, -(1ll << 31), drm_fixp_from_fraction(-1, 2));
+
+	/* (1 / 2) + (-1) = 0.5 */
+	KUNIT_EXPECT_EQ(test, 1ll << 31, drm_fixp_from_fraction(-1, 2) + drm_int2fixp(1));
+
+	/* (1 / 2) - 1) = 0.5 */
+	KUNIT_EXPECT_EQ(test, -(1ll << 31), drm_fixp_from_fraction(1, 2) + drm_int2fixp(-1));
+
+	/* (1 / 2) - 1) = 0.5 */
+	KUNIT_EXPECT_EQ(test, -(1ll << 31), drm_fixp_from_fraction(1, 2) - drm_int2fixp(1));
+
+}
+
+static struct kunit_case drm_fixp_tests[] = {
+	KUNIT_CASE(drm_test_int2fixp),
+	KUNIT_CASE(drm_test_sm2fixp),
+	{ }
+};
+
+static struct kunit_suite drm_rect_test_suite = {
+	.name = "drm_fixp",
+	.test_cases = drm_fixp_tests,
+};
+
+kunit_test_suite(drm_rect_test_suite);
+
+MODULE_AUTHOR("AMD");
+MODULE_LICENSE("GPL and additional rights");
\ No newline at end of file
diff --git a/drivers/gpu/drm/vkms/Kconfig b/drivers/gpu/drm/vkms/Kconfig
index b9ecdebecb0b..c1f8b343ff0e 100644
--- a/drivers/gpu/drm/vkms/Kconfig
+++ b/drivers/gpu/drm/vkms/Kconfig
@@ -13,3 +13,8 @@ config DRM_VKMS
 	  a VKMS.
 
 	  If M is selected the module will be called vkms.
+
+config DRM_VKMS_KUNIT_TESTS
+	tristate "Tests for VKMS" if !KUNIT_ALL_TESTS
+	depends on DRM_VKMS && KUNIT
+	default KUNIT_ALL_TESTS
diff --git a/drivers/gpu/drm/vkms/Makefile b/drivers/gpu/drm/vkms/Makefile
index 1b28a6a32948..c38455c46be4 100644
--- a/drivers/gpu/drm/vkms/Makefile
+++ b/drivers/gpu/drm/vkms/Makefile
@@ -6,6 +6,8 @@ vkms-y := \
 	vkms_formats.o \
 	vkms_crtc.o \
 	vkms_composer.o \
-	vkms_writeback.o
+	vkms_writeback.o \
+	vkms_colorop.o \
+	vkms_luts.o
 
 obj-$(CONFIG_DRM_VKMS) += vkms.o
diff --git a/drivers/gpu/drm/vkms/tests/.kunitconfig b/drivers/gpu/drm/vkms/tests/.kunitconfig
new file mode 100644
index 000000000000..70e378228cbd
--- /dev/null
+++ b/drivers/gpu/drm/vkms/tests/.kunitconfig
@@ -0,0 +1,4 @@
+CONFIG_KUNIT=y
+CONFIG_DRM=y
+CONFIG_DRM_VKMS=y
+CONFIG_DRM_VKMS_KUNIT_TESTS=y
diff --git a/drivers/gpu/drm/vkms/tests/vkms_color_tests.c b/drivers/gpu/drm/vkms/tests/vkms_color_tests.c
new file mode 100644
index 000000000000..3eaa2233afbb
--- /dev/null
+++ b/drivers/gpu/drm/vkms/tests/vkms_color_tests.c
@@ -0,0 +1,355 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+
+#include <kunit/test.h>
+
+#include <drm/drm_fixed.h>
+#include <drm/drm_mode.h>
+
+#define TEST_LUT_SIZE 16
+
+static struct drm_color_lut test_linear_array[TEST_LUT_SIZE] = {
+	{ 0x0, 0x0, 0x0, 0 },
+	{ 0x1111, 0x1111, 0x1111, 0 },
+	{ 0x2222, 0x2222, 0x2222, 0 },
+	{ 0x3333, 0x3333, 0x3333, 0 },
+	{ 0x4444, 0x4444, 0x4444, 0 },
+	{ 0x5555, 0x5555, 0x5555, 0 },
+	{ 0x6666, 0x6666, 0x6666, 0 },
+	{ 0x7777, 0x7777, 0x7777, 0 },
+	{ 0x8888, 0x8888, 0x8888, 0 },
+	{ 0x9999, 0x9999, 0x9999, 0 },
+	{ 0xaaaa, 0xaaaa, 0xaaaa, 0 },
+	{ 0xbbbb, 0xbbbb, 0xbbbb, 0 },
+	{ 0xcccc, 0xcccc, 0xcccc, 0 },
+	{ 0xdddd, 0xdddd, 0xdddd, 0 },
+	{ 0xeeee, 0xeeee, 0xeeee, 0 },
+	{ 0xffff, 0xffff, 0xffff, 0 },
+};
+
+const struct vkms_color_lut test_linear_lut = {
+	.base = test_linear_array,
+	.lut_length = TEST_LUT_SIZE,
+	.channel_value2index_ratio = 0xf000fll
+};
+
+static void vkms_color_test_get_lut_index(struct kunit *test)
+{
+	int i;
+
+	KUNIT_EXPECT_EQ(test, drm_fixp2int(get_lut_index(&test_linear_lut, test_linear_array[0].red)), 0);
+
+	for (i = 0; i < TEST_LUT_SIZE; i++)
+		KUNIT_EXPECT_EQ(test, drm_fixp2int_ceil(get_lut_index(&test_linear_lut, test_linear_array[i].red)), i);
+
+	KUNIT_EXPECT_EQ(test, drm_fixp2int(get_lut_index(&srgb_eotf, 0x0)), 0x0);
+	KUNIT_EXPECT_EQ(test, drm_fixp2int_ceil(get_lut_index(&srgb_eotf, 0x0)), 0x0);
+	KUNIT_EXPECT_EQ(test, drm_fixp2int_ceil(get_lut_index(&srgb_eotf, 0x101)), 0x1);
+	KUNIT_EXPECT_EQ(test, drm_fixp2int_ceil(get_lut_index(&srgb_eotf, 0x202)), 0x2);
+
+	KUNIT_EXPECT_EQ(test, drm_fixp2int(get_lut_index(&srgb_inv_eotf, 0x0)), 0x0);
+	KUNIT_EXPECT_EQ(test, drm_fixp2int_ceil(get_lut_index(&srgb_inv_eotf, 0x0)), 0x0);
+	KUNIT_EXPECT_EQ(test, drm_fixp2int_ceil(get_lut_index(&srgb_inv_eotf, 0x101)), 0x1);
+	KUNIT_EXPECT_EQ(test, drm_fixp2int_ceil(get_lut_index(&srgb_inv_eotf, 0x202)), 0x2);
+
+	KUNIT_EXPECT_EQ(test, drm_fixp2int_ceil(get_lut_index(&srgb_eotf, 0xfefe)), 0xfe);
+	KUNIT_EXPECT_EQ(test, drm_fixp2int_ceil(get_lut_index(&srgb_eotf, 0xffff)), 0xff);
+}
+
+static void vkms_color_test_lerp(struct kunit *test)
+{
+	KUNIT_EXPECT_EQ(test, lerp_u16(0x0, 0x10, 0x80000000), 0x8);
+}
+
+static void vkms_color_test_linear(struct kunit *test)
+{
+	for (int i = 0; i < LUT_SIZE; i++) {
+		int linear = apply_lut_to_channel_value(&linear_eotf, i * 0x101, LUT_RED);
+		KUNIT_EXPECT_EQ(test, DIV_ROUND_CLOSEST(linear, 0x101), i);
+	}
+}
+
+static void vkms_color_srgb_inv_srgb(struct kunit *test)
+{
+	u16 srgb, final;
+
+	for (int i = 0; i < LUT_SIZE; i++) {
+		srgb = apply_lut_to_channel_value(&srgb_eotf, i * 0x101, LUT_RED);
+		final = apply_lut_to_channel_value(&srgb_inv_eotf, srgb, LUT_RED);
+
+		KUNIT_EXPECT_GE(test, final / 0x101, i-1);
+		KUNIT_EXPECT_LE(test, final / 0x101, i+1);
+	}
+}
+
+#define FIXPT_HALF        (DRM_FIXED_ONE >> 1)
+#define FIXPT_QUARTER     (DRM_FIXED_ONE >> 2)
+
+const struct drm_color_ctm_3x4 test_matrix_3x4_50_desat = { {
+	FIXPT_HALF, FIXPT_QUARTER, FIXPT_QUARTER, 0,
+	FIXPT_QUARTER, FIXPT_HALF, FIXPT_QUARTER, 0,
+	FIXPT_QUARTER, FIXPT_QUARTER, FIXPT_HALF, 0
+} };
+
+static void vkms_color_ctm_3x4_50_desat(struct kunit *test)
+{
+	struct pixel_argb_s32 ref, out;
+
+	/* full white */
+	ref.a = 0x0;
+	ref.r = 0xffff;
+	ref.g = 0xffff;
+	ref.b = 0xffff;
+
+	memcpy(&out, &ref, sizeof(out));
+	apply_3x4_matrix(&out, &test_matrix_3x4_50_desat);
+
+	KUNIT_EXPECT_MEMEQ(test, &ref, &out, sizeof(out));
+
+	/* full black */
+	ref.a = 0x0;
+	ref.r = 0x0;
+	ref.g = 0x0;
+	ref.b = 0x0;
+
+	memcpy(&out, &ref, sizeof(out));
+	apply_3x4_matrix(&out, &test_matrix_3x4_50_desat);
+
+	KUNIT_EXPECT_MEMEQ(test, &ref, &out, sizeof(out));
+
+	/* 50% grey */
+	ref.a = 0x0;
+	ref.r = 0x8000;
+	ref.g = 0x8000;
+	ref.b = 0x8000;
+
+	memcpy(&out, &ref, sizeof(out));
+	apply_3x4_matrix(&out, &test_matrix_3x4_50_desat);
+
+	KUNIT_EXPECT_MEMEQ(test, &ref, &out, sizeof(out));
+
+	/* full red to 50% desat */
+	ref.a = 0x0;
+	ref.r = 0x7fff;
+	ref.g = 0x3fff;
+	ref.b = 0x3fff;
+
+	out.a = 0x0;
+	out.r = 0xffff;
+	out.g = 0x0;
+	out.b = 0x0;
+
+	apply_3x4_matrix(&out, &test_matrix_3x4_50_desat);
+
+	KUNIT_EXPECT_MEMEQ(test, &ref, &out, sizeof(out));
+}
+
+const struct drm_color_ctm_3x4 test_matrix_3x4_bt709_enc = { {
+	0x00000000366cf400ull, 0x00000000b7175900ull, 0x0000000127bb300ull, 0,
+	0x800000001993b3a0ull, 0x800000005609fe80ull, 0x000000006f9db200ull, 0,
+	0x000000009d70a400ull, 0x800000008f011100ull, 0x800000000e6f9330ull, 0
+} };
+
+static void vkms_color_ctm_3x4_bt709(struct kunit *test)
+{
+	struct pixel_argb_s32 ref, out;
+
+	/* full white to bt709 */
+	ref.a = 0x0;
+	ref.r = 0xfffe; /* off by one in 16bpc not a big deal */
+	ref.g = 0x0;
+	ref.b = 0x0;
+
+	out.a = 0x0;
+	out.r = 0xffff;
+	out.g = 0xffff;
+	out.b = 0xffff;
+
+	apply_3x4_matrix(&out, &test_matrix_3x4_bt709_enc);
+
+	/* red 255 */
+	KUNIT_EXPECT_GT(test, out.r, 0xfe00);
+
+	/* green 0 */
+	KUNIT_EXPECT_LT(test, out.g, 0x0100);
+
+	/* blue 0 */
+	KUNIT_EXPECT_LT(test, out.b, 0x0100);
+
+	/* full black to bt709 */
+	ref.a = 0x0;
+	ref.r = 0x0; /* off by one in 16bpc not a big deal */
+	ref.g = 0x0;
+	ref.b = 0x0;
+
+	out.a = 0x0;
+	out.r = 0x0;
+	out.g = 0x0;
+	out.b = 0x0;
+
+	apply_3x4_matrix(&out, &test_matrix_3x4_bt709_enc);
+
+	/* red 0 */
+	KUNIT_EXPECT_LT(test, out.r, 0x100);
+
+	/* green 0 */
+	KUNIT_EXPECT_LT(test, out.g, 0x0100);
+
+	/* blue 0 */
+	KUNIT_EXPECT_LT(test, out.b, 0x0100);
+
+	/* gray to bt709 */
+	ref.a = 0x0;
+	ref.r = 0x7fff; /* off by one in 16bpc not a big deal */
+	ref.g = 0x0;
+	ref.b = 0x0;
+
+	out.a = 0x0;
+	out.r = 0x7fff;
+	out.g = 0x7fff;
+	out.b = 0x7fff;
+
+	apply_3x4_matrix(&out, &test_matrix_3x4_bt709_enc);
+
+	/* red 127 */
+	KUNIT_EXPECT_GT(test, out.r, 0x7e00);
+	KUNIT_EXPECT_LT(test, out.r, 0x8000);
+
+	/* green 0 */
+	KUNIT_EXPECT_LT(test, out.g, 0x0100);
+
+	/* blue 0 */
+	KUNIT_EXPECT_LT(test, out.b, 0x0100);
+
+	/* == red 255 - bt709 enc == */
+	out.a = 0x0;
+	out.r = 0xffff;
+	out.g = 0x0;
+	out.b = 0x0;
+
+	apply_3x4_matrix(&out, &test_matrix_3x4_bt709_enc);
+
+	/* red 54 */
+	KUNIT_EXPECT_GT(test, out.r, 0x3500);
+	KUNIT_EXPECT_LT(test, out.r, 0x3700);
+
+	/* green 0 */
+	KUNIT_EXPECT_LT(test, out.g, 0x0100);
+
+	/* blue 157 */
+	KUNIT_EXPECT_GT(test, out.b, 0x9C00);
+	KUNIT_EXPECT_LT(test, out.b, 0x9E00);
+
+
+	/* == green 255 - bt709 enc == */
+	out.a = 0x0;
+	out.r = 0x0;
+	out.g = 0xffff;
+	out.b = 0x0;
+
+	apply_3x4_matrix(&out, &test_matrix_3x4_bt709_enc);
+
+	/* red 182 */
+	KUNIT_EXPECT_GT(test, out.r, 0xB500);
+	KUNIT_EXPECT_LT(test, out.r, 0xB780); /* laxed by half*/
+
+	/* green 0 */
+	KUNIT_EXPECT_LT(test, out.g, 0x0100);
+
+	/* blue 0 */
+	KUNIT_EXPECT_LT(test, out.b, 0x0100);
+
+	/* == blue 255 - bt709 enc == */
+	out.a = 0x0;
+	out.r = 0x0;
+	out.g = 0x0;
+	out.b = 0xffff;
+
+	apply_3x4_matrix(&out, &test_matrix_3x4_bt709_enc);
+
+	/* red 18 */
+	KUNIT_EXPECT_GT(test, out.r, 0x1100);
+	KUNIT_EXPECT_LT(test, out.r, 0x1300);
+
+	/* green 111 */
+	KUNIT_EXPECT_GT(test, out.g, 0x6E00);
+	KUNIT_EXPECT_LT(test, out.g, 0x7000);
+
+	/* blue 0 */
+	KUNIT_EXPECT_LT(test, out.b, 0x0100);
+
+	/* == red 140 - bt709 enc == */
+	out.a = 0x0;
+	out.r = 0x8c8c;
+	out.g = 0x0;
+	out.b = 0x0;
+
+	apply_3x4_matrix(&out, &test_matrix_3x4_bt709_enc);
+
+	/* red 30 */
+	KUNIT_EXPECT_GT(test, out.r, 0x1D00);
+	KUNIT_EXPECT_LT(test, out.r, 0x1F00);
+
+	/* green 0 */
+	KUNIT_EXPECT_LT(test, out.g, 0x100);
+
+	/* blue 87 */
+	KUNIT_EXPECT_GT(test, out.b, 0x5600);
+	KUNIT_EXPECT_LT(test, out.b, 0x5800);
+
+	/* == green 140 - bt709 enc == */
+	out.a = 0x0;
+	out.r = 0x0;
+	out.g = 0x8c8c;
+	out.b = 0x0;
+
+	apply_3x4_matrix(&out, &test_matrix_3x4_bt709_enc);
+
+	/* red 30 */
+	KUNIT_EXPECT_GT(test, out.r, 0x6400);
+	KUNIT_EXPECT_LT(test, out.r, 0x6600);
+
+	/* green 0 */
+	KUNIT_EXPECT_LT(test, out.g, 0x100);
+
+	/* blue 0 */
+	KUNIT_EXPECT_LT(test, out.b, 0x100);
+
+
+	/* == blue 140 - bt709 enc == */
+	out.a = 0x0;
+	out.r = 0x0;
+	out.g = 0x0;
+	out.b = 0x8c8c;
+
+	apply_3x4_matrix(&out, &test_matrix_3x4_bt709_enc);
+
+	/* red 30 */
+	KUNIT_EXPECT_GT(test, out.r, 0x900);
+	KUNIT_EXPECT_LT(test, out.r, 0xB00);
+
+	/* green 61 */
+	KUNIT_EXPECT_GT(test, out.g, 0x3C00);
+	KUNIT_EXPECT_LT(test, out.g, 0x3E00);
+
+	/* blue 0 */
+	KUNIT_EXPECT_LT(test, out.b, 0x100);
+
+}
+
+static struct kunit_case vkms_color_test_cases[] = {
+	KUNIT_CASE(vkms_color_test_get_lut_index),
+	KUNIT_CASE(vkms_color_test_lerp),
+	KUNIT_CASE(vkms_color_test_linear),
+	KUNIT_CASE(vkms_color_srgb_inv_srgb),
+	KUNIT_CASE(vkms_color_ctm_3x4_50_desat),
+	KUNIT_CASE(vkms_color_ctm_3x4_bt709),
+	{}
+};
+
+static struct kunit_suite vkms_color_test_suite = {
+	.name = "vkms-color",
+	.test_cases = vkms_color_test_cases,
+};
+kunit_test_suite(vkms_color_test_suite);
+
+MODULE_LICENSE("GPL");
\ No newline at end of file
diff --git a/drivers/gpu/drm/vkms/vkms_colorop.c b/drivers/gpu/drm/vkms/vkms_colorop.c
new file mode 100644
index 000000000000..4e37e805c443
--- /dev/null
+++ b/drivers/gpu/drm/vkms/vkms_colorop.c
@@ -0,0 +1,115 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+
+#include <linux/slab.h>
+#include <drm/drm_colorop.h>
+#include <drm/drm_print.h>
+#include <drm/drm_property.h>
+#include <drm/drm_plane.h>
+
+#define MAX_COLOR_PIPELINES 5
+
+const int vkms_initialize_tf_pipeline(struct drm_plane *plane, struct drm_prop_enum_list *list)
+{
+
+	struct drm_colorop *op, *prev_op;
+	struct drm_device *dev = plane->dev;
+	int ret;
+
+	/* 1st op: 1d curve */
+	op = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
+	if (!op) {
+		DRM_ERROR("KMS: Failed to allocate colorop\n");
+		return -ENOMEM;
+	}
+
+	ret = drm_colorop_init(dev, op, plane, DRM_COLOROP_1D_CURVE);
+	if (ret)
+		return ret;
+
+	list->type = op->base.id;
+	list->name = kasprintf(GFP_KERNEL, "Color Pipeline %d", op->base.id);
+
+	prev_op = op;
+
+	/* 2nd op: 3x4 matrix */
+	op = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
+	if (!op) {
+		DRM_ERROR("KMS: Failed to allocate colorop\n");
+		return -ENOMEM;
+	}
+
+	ret = drm_colorop_init(dev, op, plane, DRM_COLOROP_CTM_3X4);
+	if (ret)
+		return ret;
+
+	drm_colorop_set_next_property(prev_op, op);
+
+	prev_op = op;
+
+	/* 3rd op: 3x4 matrix */
+	op = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
+	if (!op) {
+		DRM_ERROR("KMS: Failed to allocate colorop\n");
+		return -ENOMEM;
+	}
+
+	ret = drm_colorop_init(dev, op, plane, DRM_COLOROP_CTM_3X4);
+	if (ret)
+		return ret;
+
+	drm_colorop_set_next_property(prev_op, op);
+
+	prev_op = op;
+
+	/* 4th op: 1d curve */
+	op = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
+	if (!op) {
+		DRM_ERROR("KMS: Failed to allocate colorop\n");
+		return -ENOMEM;
+	}
+
+	ret = drm_colorop_init(dev, op, plane, DRM_COLOROP_1D_CURVE);
+	if (ret)
+		return ret;
+
+	drm_colorop_set_next_property(prev_op, op);
+
+	return 0;
+}
+
+int vkms_initialize_colorops(struct drm_plane *plane)
+{
+	struct drm_device *dev = plane->dev;
+	struct drm_property *prop;
+	struct drm_prop_enum_list pipelines[MAX_COLOR_PIPELINES];
+	int len = 0;
+	int ret;
+
+	/* Add "Bypass" (i.e. NULL) pipeline */
+	pipelines[len].type = 0;
+	pipelines[len].name = "Bypass";
+	len++;
+
+	/* Add pipeline consisting of transfer functions */
+	ret = vkms_initialize_tf_pipeline(plane, &(pipelines[len]));
+	if (ret)
+		return ret;
+	len++;
+
+	/* Create COLOR_PIPELINE property and attach */
+	prop = drm_property_create_enum(dev, DRM_MODE_PROP_ATOMIC,
+					"COLOR_PIPELINE",
+					pipelines, len);
+	if (!prop)
+		return -ENOMEM;
+
+	plane->color_pipeline_property = prop;
+
+	drm_object_attach_property(&plane->base, prop, 0);
+
+	/* TODO do we even need this? */
+	if (plane->state)
+		plane->state->color_pipeline = NULL;
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index e7441b227b3c..4ead5346007a 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -12,6 +12,7 @@
 #include <linux/minmax.h>
 
 #include "vkms_drv.h"
+#include "vkms_luts.h"
 
 static u16 pre_mul_blend_channel(u16 src, u16 dst, u16 alpha)
 {
@@ -91,7 +92,7 @@ static void fill_background(const struct pixel_argb_u16 *background_color,
 }
 
 // lerp(a, b, t) = a + (b - a) * t
-static u16 lerp_u16(u16 a, u16 b, s64 t)
+u16 lerp_u16(u16 a, u16 b, s64 t)
 {
 	s64 a_fp = drm_int2fixp(a);
 	s64 b_fp = drm_int2fixp(b);
@@ -101,7 +102,7 @@ static u16 lerp_u16(u16 a, u16 b, s64 t)
 	return drm_fixp2int(a_fp + delta);
 }
 
-static s64 get_lut_index(const struct vkms_color_lut *lut, u16 channel_value)
+s64 get_lut_index(const struct vkms_color_lut *lut, u16 channel_value)
 {
 	s64 color_channel_fp = drm_int2fixp(channel_value);
 
@@ -163,6 +164,111 @@ static void apply_lut(const struct vkms_crtc_state *crtc_state, struct line_buff
 	}
 }
 
+void apply_3x4_matrix(struct pixel_argb_s32 *pixel, const struct drm_color_ctm_3x4 *matrix)
+{
+	s64 rf, gf, bf;
+
+	rf = drm_fixp_mul(drm_sm2fixp(matrix->matrix[0]), drm_int2fixp(pixel->r)) +
+	     drm_fixp_mul(drm_sm2fixp(matrix->matrix[1]), drm_int2fixp(pixel->g)) +
+	     drm_fixp_mul(drm_sm2fixp(matrix->matrix[2]), drm_int2fixp(pixel->b)) +
+	     drm_sm2fixp(matrix->matrix[3]);
+
+	gf = drm_fixp_mul(drm_sm2fixp(matrix->matrix[4]), drm_int2fixp(pixel->r)) +
+	     drm_fixp_mul(drm_sm2fixp(matrix->matrix[5]), drm_int2fixp(pixel->g)) +
+	     drm_fixp_mul(drm_sm2fixp(matrix->matrix[6]), drm_int2fixp(pixel->b)) +
+	     drm_sm2fixp(matrix->matrix[7]);
+
+	bf = drm_fixp_mul(drm_sm2fixp(matrix->matrix[8]), drm_int2fixp(pixel->r)) +
+	     drm_fixp_mul(drm_sm2fixp(matrix->matrix[9]), drm_int2fixp(pixel->g)) +
+	     drm_fixp_mul(drm_sm2fixp(matrix->matrix[10]), drm_int2fixp(pixel->b)) +
+	     drm_sm2fixp(matrix->matrix[11]);
+
+	pixel->r = drm_fixp2int(rf);
+	pixel->g = drm_fixp2int(gf);
+	pixel->b = drm_fixp2int(bf);
+}
+
+static void apply_colorop(struct pixel_argb_s32 *pixel, struct drm_colorop *colorop)
+{
+	/* TODO is this right? */
+	struct drm_colorop_state *colorop_state = colorop->state;
+
+	if (colorop->type == DRM_COLOROP_1D_CURVE) {
+		switch (colorop_state->curve_1d_type) {
+			case DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF:
+				pixel->r = apply_lut_to_channel_value(&srgb_inv_eotf, pixel->r, LUT_RED);
+				pixel->g = apply_lut_to_channel_value(&srgb_inv_eotf, pixel->g, LUT_GREEN);
+				pixel->b = apply_lut_to_channel_value(&srgb_inv_eotf, pixel->b, LUT_BLUE);
+				break;
+			case DRM_COLOROP_1D_CURVE_SRGB_EOTF:
+				pixel->r = apply_lut_to_channel_value(&srgb_eotf, pixel->r, LUT_RED);
+				pixel->g = apply_lut_to_channel_value(&srgb_eotf, pixel->g, LUT_GREEN);
+				pixel->b = apply_lut_to_channel_value(&srgb_eotf, pixel->b, LUT_BLUE);
+				break;
+			default:
+				DRM_DEBUG_DRIVER("unkown colorop 1D curve type %d\n", colorop_state->curve_1d_type);
+				break;
+		}
+	} else if (colorop->type == DRM_COLOROP_CTM_3X4) {
+		if (colorop_state->data)
+			apply_3x4_matrix(pixel, (struct drm_color_ctm_3x4 *) colorop_state->data->data);
+	}
+
+}
+
+static void pre_blend_color_transform(const struct vkms_plane_state *plane_state, struct line_buffer *output_buffer)
+{
+	struct drm_colorop *colorop;
+	struct pixel_argb_s32 pixel;
+
+	for (size_t x = 0; x < output_buffer->n_pixels; x++) {
+
+		/*
+		 * Some operations, such as applying a BT709 encoding matrix,
+		 * followed by a decoding matrix, require that we preserve
+		 * values above 1.0 and below 0.0 until the end of the pipeline.
+		 *
+		 * Convert values to s32 for our internal pipeline and go back
+		 * to u16 values at the end.
+		 */
+		pixel.a = output_buffer->pixels[x].a;
+		pixel.r = output_buffer->pixels[x].r;
+		pixel.g = output_buffer->pixels[x].g;
+		pixel.b = output_buffer->pixels[x].b;
+
+		colorop = plane_state->base.base.color_pipeline;
+		while (colorop) {
+			struct drm_colorop_state *colorop_state;
+
+			if (!colorop)
+				return;
+
+			/* TODO this is probably wrong */
+			colorop_state = colorop->state;
+
+			if (!colorop_state)
+				return;
+
+			if (!colorop_state->bypass)
+				apply_colorop(&pixel, colorop);
+
+			colorop = colorop->next;
+		}
+
+		/* clamp pixel */
+		pixel.a = max(min(pixel.a, 0xffff), 0x0);
+		pixel.r = max(min(pixel.r, 0xffff), 0x0);
+		pixel.g = max(min(pixel.g, 0xffff), 0x0);
+		pixel.b = max(min(pixel.b, 0xffff), 0x0);
+
+		/* put back to output_buffer */
+		output_buffer->pixels[x].a = pixel.a;
+		output_buffer->pixels[x].r = pixel.r;
+		output_buffer->pixels[x].g = pixel.g;
+		output_buffer->pixels[x].b = pixel.b;
+	}
+}
+
 /**
  * blend - blend the pixels from all planes and compute crc
  * @wb: The writeback frame buffer metadata
@@ -200,6 +306,9 @@ static void blend(struct vkms_writeback_job *wb,
 				continue;
 
 			vkms_compose_row(stage_buffer, plane[i], y_pos);
+
+			pre_blend_color_transform(plane[i], stage_buffer);
+
 			pre_mul_alpha_blend(plane[i]->frame_info, stage_buffer,
 					    output_buffer);
 		}
@@ -435,3 +544,7 @@ int vkms_set_crc_source(struct drm_crtc *crtc, const char *src_name)
 
 	return ret;
 }
+
+#ifdef CONFIG_DRM_VKMS_KUNIT_TESTS
+#include "tests/vkms_color_tests.c"
+#endif
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index 8f5710debb1e..fadb7685a360 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -36,6 +36,10 @@ struct vkms_frame_info {
 	unsigned int cpp;
 };
 
+struct pixel_argb_s32 {
+	s32 a, r, g, b;
+};
+
 struct pixel_argb_u16 {
 	u16 a, r, g, b;
 };
@@ -170,4 +174,8 @@ void vkms_writeback_row(struct vkms_writeback_job *wb, const struct line_buffer
 /* Writeback */
 int vkms_enable_writeback_connector(struct vkms_device *vkmsdev);
 
+/* Colorops */
+int vkms_initialize_colorops(struct drm_plane *plane);
+
+
 #endif /* _VKMS_DRV_H_ */
diff --git a/drivers/gpu/drm/vkms/vkms_luts.c b/drivers/gpu/drm/vkms/vkms_luts.c
new file mode 100644
index 000000000000..6553d6d442b4
--- /dev/null
+++ b/drivers/gpu/drm/vkms/vkms_luts.c
@@ -0,0 +1,802 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+
+#include <drm/drm_mode.h>
+
+#include "vkms_drv.h"
+#include "vkms_luts.h"
+
+static struct drm_color_lut linear_array[LUT_SIZE] = {
+	{ 0x0, 0x0, 0x0, 0 },
+	{ 0x101, 0x101, 0x101, 0 },
+	{ 0x202, 0x202, 0x202, 0 },
+	{ 0x303, 0x303, 0x303, 0 },
+	{ 0x404, 0x404, 0x404, 0 },
+	{ 0x505, 0x505, 0x505, 0 },
+	{ 0x606, 0x606, 0x606, 0 },
+	{ 0x707, 0x707, 0x707, 0 },
+	{ 0x808, 0x808, 0x808, 0 },
+	{ 0x909, 0x909, 0x909, 0 },
+	{ 0xa0a, 0xa0a, 0xa0a, 0 },
+	{ 0xb0b, 0xb0b, 0xb0b, 0 },
+	{ 0xc0c, 0xc0c, 0xc0c, 0 },
+	{ 0xd0d, 0xd0d, 0xd0d, 0 },
+	{ 0xe0e, 0xe0e, 0xe0e, 0 },
+	{ 0xf0f, 0xf0f, 0xf0f, 0 },
+	{ 0x1010, 0x1010, 0x1010, 0 },
+	{ 0x1111, 0x1111, 0x1111, 0 },
+	{ 0x1212, 0x1212, 0x1212, 0 },
+	{ 0x1313, 0x1313, 0x1313, 0 },
+	{ 0x1414, 0x1414, 0x1414, 0 },
+	{ 0x1515, 0x1515, 0x1515, 0 },
+	{ 0x1616, 0x1616, 0x1616, 0 },
+	{ 0x1717, 0x1717, 0x1717, 0 },
+	{ 0x1818, 0x1818, 0x1818, 0 },
+	{ 0x1919, 0x1919, 0x1919, 0 },
+	{ 0x1a1a, 0x1a1a, 0x1a1a, 0 },
+	{ 0x1b1b, 0x1b1b, 0x1b1b, 0 },
+	{ 0x1c1c, 0x1c1c, 0x1c1c, 0 },
+	{ 0x1d1d, 0x1d1d, 0x1d1d, 0 },
+	{ 0x1e1e, 0x1e1e, 0x1e1e, 0 },
+	{ 0x1f1f, 0x1f1f, 0x1f1f, 0 },
+	{ 0x2020, 0x2020, 0x2020, 0 },
+	{ 0x2121, 0x2121, 0x2121, 0 },
+	{ 0x2222, 0x2222, 0x2222, 0 },
+	{ 0x2323, 0x2323, 0x2323, 0 },
+	{ 0x2424, 0x2424, 0x2424, 0 },
+	{ 0x2525, 0x2525, 0x2525, 0 },
+	{ 0x2626, 0x2626, 0x2626, 0 },
+	{ 0x2727, 0x2727, 0x2727, 0 },
+	{ 0x2828, 0x2828, 0x2828, 0 },
+	{ 0x2929, 0x2929, 0x2929, 0 },
+	{ 0x2a2a, 0x2a2a, 0x2a2a, 0 },
+	{ 0x2b2b, 0x2b2b, 0x2b2b, 0 },
+	{ 0x2c2c, 0x2c2c, 0x2c2c, 0 },
+	{ 0x2d2d, 0x2d2d, 0x2d2d, 0 },
+	{ 0x2e2e, 0x2e2e, 0x2e2e, 0 },
+	{ 0x2f2f, 0x2f2f, 0x2f2f, 0 },
+	{ 0x3030, 0x3030, 0x3030, 0 },
+	{ 0x3131, 0x3131, 0x3131, 0 },
+	{ 0x3232, 0x3232, 0x3232, 0 },
+	{ 0x3333, 0x3333, 0x3333, 0 },
+	{ 0x3434, 0x3434, 0x3434, 0 },
+	{ 0x3535, 0x3535, 0x3535, 0 },
+	{ 0x3636, 0x3636, 0x3636, 0 },
+	{ 0x3737, 0x3737, 0x3737, 0 },
+	{ 0x3838, 0x3838, 0x3838, 0 },
+	{ 0x3939, 0x3939, 0x3939, 0 },
+	{ 0x3a3a, 0x3a3a, 0x3a3a, 0 },
+	{ 0x3b3b, 0x3b3b, 0x3b3b, 0 },
+	{ 0x3c3c, 0x3c3c, 0x3c3c, 0 },
+	{ 0x3d3d, 0x3d3d, 0x3d3d, 0 },
+	{ 0x3e3e, 0x3e3e, 0x3e3e, 0 },
+	{ 0x3f3f, 0x3f3f, 0x3f3f, 0 },
+	{ 0x4040, 0x4040, 0x4040, 0 },
+	{ 0x4141, 0x4141, 0x4141, 0 },
+	{ 0x4242, 0x4242, 0x4242, 0 },
+	{ 0x4343, 0x4343, 0x4343, 0 },
+	{ 0x4444, 0x4444, 0x4444, 0 },
+	{ 0x4545, 0x4545, 0x4545, 0 },
+	{ 0x4646, 0x4646, 0x4646, 0 },
+	{ 0x4747, 0x4747, 0x4747, 0 },
+	{ 0x4848, 0x4848, 0x4848, 0 },
+	{ 0x4949, 0x4949, 0x4949, 0 },
+	{ 0x4a4a, 0x4a4a, 0x4a4a, 0 },
+	{ 0x4b4b, 0x4b4b, 0x4b4b, 0 },
+	{ 0x4c4c, 0x4c4c, 0x4c4c, 0 },
+	{ 0x4d4d, 0x4d4d, 0x4d4d, 0 },
+	{ 0x4e4e, 0x4e4e, 0x4e4e, 0 },
+	{ 0x4f4f, 0x4f4f, 0x4f4f, 0 },
+	{ 0x5050, 0x5050, 0x5050, 0 },
+	{ 0x5151, 0x5151, 0x5151, 0 },
+	{ 0x5252, 0x5252, 0x5252, 0 },
+	{ 0x5353, 0x5353, 0x5353, 0 },
+	{ 0x5454, 0x5454, 0x5454, 0 },
+	{ 0x5555, 0x5555, 0x5555, 0 },
+	{ 0x5656, 0x5656, 0x5656, 0 },
+	{ 0x5757, 0x5757, 0x5757, 0 },
+	{ 0x5858, 0x5858, 0x5858, 0 },
+	{ 0x5959, 0x5959, 0x5959, 0 },
+	{ 0x5a5a, 0x5a5a, 0x5a5a, 0 },
+	{ 0x5b5b, 0x5b5b, 0x5b5b, 0 },
+	{ 0x5c5c, 0x5c5c, 0x5c5c, 0 },
+	{ 0x5d5d, 0x5d5d, 0x5d5d, 0 },
+	{ 0x5e5e, 0x5e5e, 0x5e5e, 0 },
+	{ 0x5f5f, 0x5f5f, 0x5f5f, 0 },
+	{ 0x6060, 0x6060, 0x6060, 0 },
+	{ 0x6161, 0x6161, 0x6161, 0 },
+	{ 0x6262, 0x6262, 0x6262, 0 },
+	{ 0x6363, 0x6363, 0x6363, 0 },
+	{ 0x6464, 0x6464, 0x6464, 0 },
+	{ 0x6565, 0x6565, 0x6565, 0 },
+	{ 0x6666, 0x6666, 0x6666, 0 },
+	{ 0x6767, 0x6767, 0x6767, 0 },
+	{ 0x6868, 0x6868, 0x6868, 0 },
+	{ 0x6969, 0x6969, 0x6969, 0 },
+	{ 0x6a6a, 0x6a6a, 0x6a6a, 0 },
+	{ 0x6b6b, 0x6b6b, 0x6b6b, 0 },
+	{ 0x6c6c, 0x6c6c, 0x6c6c, 0 },
+	{ 0x6d6d, 0x6d6d, 0x6d6d, 0 },
+	{ 0x6e6e, 0x6e6e, 0x6e6e, 0 },
+	{ 0x6f6f, 0x6f6f, 0x6f6f, 0 },
+	{ 0x7070, 0x7070, 0x7070, 0 },
+	{ 0x7171, 0x7171, 0x7171, 0 },
+	{ 0x7272, 0x7272, 0x7272, 0 },
+	{ 0x7373, 0x7373, 0x7373, 0 },
+	{ 0x7474, 0x7474, 0x7474, 0 },
+	{ 0x7575, 0x7575, 0x7575, 0 },
+	{ 0x7676, 0x7676, 0x7676, 0 },
+	{ 0x7777, 0x7777, 0x7777, 0 },
+	{ 0x7878, 0x7878, 0x7878, 0 },
+	{ 0x7979, 0x7979, 0x7979, 0 },
+	{ 0x7a7a, 0x7a7a, 0x7a7a, 0 },
+	{ 0x7b7b, 0x7b7b, 0x7b7b, 0 },
+	{ 0x7c7c, 0x7c7c, 0x7c7c, 0 },
+	{ 0x7d7d, 0x7d7d, 0x7d7d, 0 },
+	{ 0x7e7e, 0x7e7e, 0x7e7e, 0 },
+	{ 0x7f7f, 0x7f7f, 0x7f7f, 0 },
+	{ 0x8080, 0x8080, 0x8080, 0 },
+	{ 0x8181, 0x8181, 0x8181, 0 },
+	{ 0x8282, 0x8282, 0x8282, 0 },
+	{ 0x8383, 0x8383, 0x8383, 0 },
+	{ 0x8484, 0x8484, 0x8484, 0 },
+	{ 0x8585, 0x8585, 0x8585, 0 },
+	{ 0x8686, 0x8686, 0x8686, 0 },
+	{ 0x8787, 0x8787, 0x8787, 0 },
+	{ 0x8888, 0x8888, 0x8888, 0 },
+	{ 0x8989, 0x8989, 0x8989, 0 },
+	{ 0x8a8a, 0x8a8a, 0x8a8a, 0 },
+	{ 0x8b8b, 0x8b8b, 0x8b8b, 0 },
+	{ 0x8c8c, 0x8c8c, 0x8c8c, 0 },
+	{ 0x8d8d, 0x8d8d, 0x8d8d, 0 },
+	{ 0x8e8e, 0x8e8e, 0x8e8e, 0 },
+	{ 0x8f8f, 0x8f8f, 0x8f8f, 0 },
+	{ 0x9090, 0x9090, 0x9090, 0 },
+	{ 0x9191, 0x9191, 0x9191, 0 },
+	{ 0x9292, 0x9292, 0x9292, 0 },
+	{ 0x9393, 0x9393, 0x9393, 0 },
+	{ 0x9494, 0x9494, 0x9494, 0 },
+	{ 0x9595, 0x9595, 0x9595, 0 },
+	{ 0x9696, 0x9696, 0x9696, 0 },
+	{ 0x9797, 0x9797, 0x9797, 0 },
+	{ 0x9898, 0x9898, 0x9898, 0 },
+	{ 0x9999, 0x9999, 0x9999, 0 },
+	{ 0x9a9a, 0x9a9a, 0x9a9a, 0 },
+	{ 0x9b9b, 0x9b9b, 0x9b9b, 0 },
+	{ 0x9c9c, 0x9c9c, 0x9c9c, 0 },
+	{ 0x9d9d, 0x9d9d, 0x9d9d, 0 },
+	{ 0x9e9e, 0x9e9e, 0x9e9e, 0 },
+	{ 0x9f9f, 0x9f9f, 0x9f9f, 0 },
+	{ 0xa0a0, 0xa0a0, 0xa0a0, 0 },
+	{ 0xa1a1, 0xa1a1, 0xa1a1, 0 },
+	{ 0xa2a2, 0xa2a2, 0xa2a2, 0 },
+	{ 0xa3a3, 0xa3a3, 0xa3a3, 0 },
+	{ 0xa4a4, 0xa4a4, 0xa4a4, 0 },
+	{ 0xa5a5, 0xa5a5, 0xa5a5, 0 },
+	{ 0xa6a6, 0xa6a6, 0xa6a6, 0 },
+	{ 0xa7a7, 0xa7a7, 0xa7a7, 0 },
+	{ 0xa8a8, 0xa8a8, 0xa8a8, 0 },
+	{ 0xa9a9, 0xa9a9, 0xa9a9, 0 },
+	{ 0xaaaa, 0xaaaa, 0xaaaa, 0 },
+	{ 0xabab, 0xabab, 0xabab, 0 },
+	{ 0xacac, 0xacac, 0xacac, 0 },
+	{ 0xadad, 0xadad, 0xadad, 0 },
+	{ 0xaeae, 0xaeae, 0xaeae, 0 },
+	{ 0xafaf, 0xafaf, 0xafaf, 0 },
+	{ 0xb0b0, 0xb0b0, 0xb0b0, 0 },
+	{ 0xb1b1, 0xb1b1, 0xb1b1, 0 },
+	{ 0xb2b2, 0xb2b2, 0xb2b2, 0 },
+	{ 0xb3b3, 0xb3b3, 0xb3b3, 0 },
+	{ 0xb4b4, 0xb4b4, 0xb4b4, 0 },
+	{ 0xb5b5, 0xb5b5, 0xb5b5, 0 },
+	{ 0xb6b6, 0xb6b6, 0xb6b6, 0 },
+	{ 0xb7b7, 0xb7b7, 0xb7b7, 0 },
+	{ 0xb8b8, 0xb8b8, 0xb8b8, 0 },
+	{ 0xb9b9, 0xb9b9, 0xb9b9, 0 },
+	{ 0xbaba, 0xbaba, 0xbaba, 0 },
+	{ 0xbbbb, 0xbbbb, 0xbbbb, 0 },
+	{ 0xbcbc, 0xbcbc, 0xbcbc, 0 },
+	{ 0xbdbd, 0xbdbd, 0xbdbd, 0 },
+	{ 0xbebe, 0xbebe, 0xbebe, 0 },
+	{ 0xbfbf, 0xbfbf, 0xbfbf, 0 },
+	{ 0xc0c0, 0xc0c0, 0xc0c0, 0 },
+	{ 0xc1c1, 0xc1c1, 0xc1c1, 0 },
+	{ 0xc2c2, 0xc2c2, 0xc2c2, 0 },
+	{ 0xc3c3, 0xc3c3, 0xc3c3, 0 },
+	{ 0xc4c4, 0xc4c4, 0xc4c4, 0 },
+	{ 0xc5c5, 0xc5c5, 0xc5c5, 0 },
+	{ 0xc6c6, 0xc6c6, 0xc6c6, 0 },
+	{ 0xc7c7, 0xc7c7, 0xc7c7, 0 },
+	{ 0xc8c8, 0xc8c8, 0xc8c8, 0 },
+	{ 0xc9c9, 0xc9c9, 0xc9c9, 0 },
+	{ 0xcaca, 0xcaca, 0xcaca, 0 },
+	{ 0xcbcb, 0xcbcb, 0xcbcb, 0 },
+	{ 0xcccc, 0xcccc, 0xcccc, 0 },
+	{ 0xcdcd, 0xcdcd, 0xcdcd, 0 },
+	{ 0xcece, 0xcece, 0xcece, 0 },
+	{ 0xcfcf, 0xcfcf, 0xcfcf, 0 },
+	{ 0xd0d0, 0xd0d0, 0xd0d0, 0 },
+	{ 0xd1d1, 0xd1d1, 0xd1d1, 0 },
+	{ 0xd2d2, 0xd2d2, 0xd2d2, 0 },
+	{ 0xd3d3, 0xd3d3, 0xd3d3, 0 },
+	{ 0xd4d4, 0xd4d4, 0xd4d4, 0 },
+	{ 0xd5d5, 0xd5d5, 0xd5d5, 0 },
+	{ 0xd6d6, 0xd6d6, 0xd6d6, 0 },
+	{ 0xd7d7, 0xd7d7, 0xd7d7, 0 },
+	{ 0xd8d8, 0xd8d8, 0xd8d8, 0 },
+	{ 0xd9d9, 0xd9d9, 0xd9d9, 0 },
+	{ 0xdada, 0xdada, 0xdada, 0 },
+	{ 0xdbdb, 0xdbdb, 0xdbdb, 0 },
+	{ 0xdcdc, 0xdcdc, 0xdcdc, 0 },
+	{ 0xdddd, 0xdddd, 0xdddd, 0 },
+	{ 0xdede, 0xdede, 0xdede, 0 },
+	{ 0xdfdf, 0xdfdf, 0xdfdf, 0 },
+	{ 0xe0e0, 0xe0e0, 0xe0e0, 0 },
+	{ 0xe1e1, 0xe1e1, 0xe1e1, 0 },
+	{ 0xe2e2, 0xe2e2, 0xe2e2, 0 },
+	{ 0xe3e3, 0xe3e3, 0xe3e3, 0 },
+	{ 0xe4e4, 0xe4e4, 0xe4e4, 0 },
+	{ 0xe5e5, 0xe5e5, 0xe5e5, 0 },
+	{ 0xe6e6, 0xe6e6, 0xe6e6, 0 },
+	{ 0xe7e7, 0xe7e7, 0xe7e7, 0 },
+	{ 0xe8e8, 0xe8e8, 0xe8e8, 0 },
+	{ 0xe9e9, 0xe9e9, 0xe9e9, 0 },
+	{ 0xeaea, 0xeaea, 0xeaea, 0 },
+	{ 0xebeb, 0xebeb, 0xebeb, 0 },
+	{ 0xecec, 0xecec, 0xecec, 0 },
+	{ 0xeded, 0xeded, 0xeded, 0 },
+	{ 0xeeee, 0xeeee, 0xeeee, 0 },
+	{ 0xefef, 0xefef, 0xefef, 0 },
+	{ 0xf0f0, 0xf0f0, 0xf0f0, 0 },
+	{ 0xf1f1, 0xf1f1, 0xf1f1, 0 },
+	{ 0xf2f2, 0xf2f2, 0xf2f2, 0 },
+	{ 0xf3f3, 0xf3f3, 0xf3f3, 0 },
+	{ 0xf4f4, 0xf4f4, 0xf4f4, 0 },
+	{ 0xf5f5, 0xf5f5, 0xf5f5, 0 },
+	{ 0xf6f6, 0xf6f6, 0xf6f6, 0 },
+	{ 0xf7f7, 0xf7f7, 0xf7f7, 0 },
+	{ 0xf8f8, 0xf8f8, 0xf8f8, 0 },
+	{ 0xf9f9, 0xf9f9, 0xf9f9, 0 },
+	{ 0xfafa, 0xfafa, 0xfafa, 0 },
+	{ 0xfbfb, 0xfbfb, 0xfbfb, 0 },
+	{ 0xfcfc, 0xfcfc, 0xfcfc, 0 },
+	{ 0xfdfd, 0xfdfd, 0xfdfd, 0 },
+	{ 0xfefe, 0xfefe, 0xfefe, 0 },
+	{ 0xffff, 0xffff, 0xffff, 0 },
+};
+
+const struct vkms_color_lut linear_eotf = {
+	.base = linear_array,
+	.lut_length = LUT_SIZE,
+	.channel_value2index_ratio = 0xff00ffll
+};
+
+
+static struct drm_color_lut srgb_array[LUT_SIZE] = {
+	{ 0x0, 0x0, 0x0, 0 },
+	{ 0x13, 0x13, 0x13, 0 },
+	{ 0x27, 0x27, 0x27, 0 },
+	{ 0x3b, 0x3b, 0x3b, 0 },
+	{ 0x4f, 0x4f, 0x4f, 0 },
+	{ 0x63, 0x63, 0x63, 0 },
+	{ 0x77, 0x77, 0x77, 0 },
+	{ 0x8b, 0x8b, 0x8b, 0 },
+	{ 0x9f, 0x9f, 0x9f, 0 },
+	{ 0xb3, 0xb3, 0xb3, 0 },
+	{ 0xc6, 0xc6, 0xc6, 0 },
+	{ 0xdb, 0xdb, 0xdb, 0 },
+	{ 0xf0, 0xf0, 0xf0, 0 },
+	{ 0x107, 0x107, 0x107, 0 },
+	{ 0x11f, 0x11f, 0x11f, 0 },
+	{ 0x139, 0x139, 0x139, 0 },
+	{ 0x153, 0x153, 0x153, 0 },
+	{ 0x16f, 0x16f, 0x16f, 0 },
+	{ 0x18c, 0x18c, 0x18c, 0 },
+	{ 0x1aa, 0x1aa, 0x1aa, 0 },
+	{ 0x1ca, 0x1ca, 0x1ca, 0 },
+	{ 0x1eb, 0x1eb, 0x1eb, 0 },
+	{ 0x20d, 0x20d, 0x20d, 0 },
+	{ 0x231, 0x231, 0x231, 0 },
+	{ 0x256, 0x256, 0x256, 0 },
+	{ 0x27d, 0x27d, 0x27d, 0 },
+	{ 0x2a4, 0x2a4, 0x2a4, 0 },
+	{ 0x2ce, 0x2ce, 0x2ce, 0 },
+	{ 0x2f9, 0x2f9, 0x2f9, 0 },
+	{ 0x325, 0x325, 0x325, 0 },
+	{ 0x352, 0x352, 0x352, 0 },
+	{ 0x381, 0x381, 0x381, 0 },
+	{ 0x3b2, 0x3b2, 0x3b2, 0 },
+	{ 0x3e4, 0x3e4, 0x3e4, 0 },
+	{ 0x418, 0x418, 0x418, 0 },
+	{ 0x44d, 0x44d, 0x44d, 0 },
+	{ 0x484, 0x484, 0x484, 0 },
+	{ 0x4bc, 0x4bc, 0x4bc, 0 },
+	{ 0x4f6, 0x4f6, 0x4f6, 0 },
+	{ 0x531, 0x531, 0x531, 0 },
+	{ 0x56e, 0x56e, 0x56e, 0 },
+	{ 0x5ad, 0x5ad, 0x5ad, 0 },
+	{ 0x5ed, 0x5ed, 0x5ed, 0 },
+	{ 0x62f, 0x62f, 0x62f, 0 },
+	{ 0x672, 0x672, 0x672, 0 },
+	{ 0x6b7, 0x6b7, 0x6b7, 0 },
+	{ 0x6fe, 0x6fe, 0x6fe, 0 },
+	{ 0x746, 0x746, 0x746, 0 },
+	{ 0x791, 0x791, 0x791, 0 },
+	{ 0x7dc, 0x7dc, 0x7dc, 0 },
+	{ 0x82a, 0x82a, 0x82a, 0 },
+	{ 0x879, 0x879, 0x879, 0 },
+	{ 0x8ca, 0x8ca, 0x8ca, 0 },
+	{ 0x91d, 0x91d, 0x91d, 0 },
+	{ 0x971, 0x971, 0x971, 0 },
+	{ 0x9c7, 0x9c7, 0x9c7, 0 },
+	{ 0xa1f, 0xa1f, 0xa1f, 0 },
+	{ 0xa79, 0xa79, 0xa79, 0 },
+	{ 0xad4, 0xad4, 0xad4, 0 },
+	{ 0xb32, 0xb32, 0xb32, 0 },
+	{ 0xb91, 0xb91, 0xb91, 0 },
+	{ 0xbf2, 0xbf2, 0xbf2, 0 },
+	{ 0xc54, 0xc54, 0xc54, 0 },
+	{ 0xcb9, 0xcb9, 0xcb9, 0 },
+	{ 0xd1f, 0xd1f, 0xd1f, 0 },
+	{ 0xd88, 0xd88, 0xd88, 0 },
+	{ 0xdf2, 0xdf2, 0xdf2, 0 },
+	{ 0xe5e, 0xe5e, 0xe5e, 0 },
+	{ 0xecc, 0xecc, 0xecc, 0 },
+	{ 0xf3c, 0xf3c, 0xf3c, 0 },
+	{ 0xfad, 0xfad, 0xfad, 0 },
+	{ 0x1021, 0x1021, 0x1021, 0 },
+	{ 0x1096, 0x1096, 0x1096, 0 },
+	{ 0x110e, 0x110e, 0x110e, 0 },
+	{ 0x1187, 0x1187, 0x1187, 0 },
+	{ 0x1203, 0x1203, 0x1203, 0 },
+	{ 0x1280, 0x1280, 0x1280, 0 },
+	{ 0x12ff, 0x12ff, 0x12ff, 0 },
+	{ 0x1380, 0x1380, 0x1380, 0 },
+	{ 0x1404, 0x1404, 0x1404, 0 },
+	{ 0x1489, 0x1489, 0x1489, 0 },
+	{ 0x1510, 0x1510, 0x1510, 0 },
+	{ 0x1599, 0x1599, 0x1599, 0 },
+	{ 0x1624, 0x1624, 0x1624, 0 },
+	{ 0x16b2, 0x16b2, 0x16b2, 0 },
+	{ 0x1741, 0x1741, 0x1741, 0 },
+	{ 0x17d2, 0x17d2, 0x17d2, 0 },
+	{ 0x1865, 0x1865, 0x1865, 0 },
+	{ 0x18fb, 0x18fb, 0x18fb, 0 },
+	{ 0x1992, 0x1992, 0x1992, 0 },
+	{ 0x1a2c, 0x1a2c, 0x1a2c, 0 },
+	{ 0x1ac8, 0x1ac8, 0x1ac8, 0 },
+	{ 0x1b65, 0x1b65, 0x1b65, 0 },
+	{ 0x1c05, 0x1c05, 0x1c05, 0 },
+	{ 0x1ca7, 0x1ca7, 0x1ca7, 0 },
+	{ 0x1d4b, 0x1d4b, 0x1d4b, 0 },
+	{ 0x1df1, 0x1df1, 0x1df1, 0 },
+	{ 0x1e99, 0x1e99, 0x1e99, 0 },
+	{ 0x1f44, 0x1f44, 0x1f44, 0 },
+	{ 0x1ff0, 0x1ff0, 0x1ff0, 0 },
+	{ 0x209f, 0x209f, 0x209f, 0 },
+	{ 0x2150, 0x2150, 0x2150, 0 },
+	{ 0x2203, 0x2203, 0x2203, 0 },
+	{ 0x22b8, 0x22b8, 0x22b8, 0 },
+	{ 0x2370, 0x2370, 0x2370, 0 },
+	{ 0x2429, 0x2429, 0x2429, 0 },
+	{ 0x24e5, 0x24e5, 0x24e5, 0 },
+	{ 0x25a3, 0x25a3, 0x25a3, 0 },
+	{ 0x2663, 0x2663, 0x2663, 0 },
+	{ 0x2726, 0x2726, 0x2726, 0 },
+	{ 0x27ea, 0x27ea, 0x27ea, 0 },
+	{ 0x28b1, 0x28b1, 0x28b1, 0 },
+	{ 0x297a, 0x297a, 0x297a, 0 },
+	{ 0x2a45, 0x2a45, 0x2a45, 0 },
+	{ 0x2b13, 0x2b13, 0x2b13, 0 },
+	{ 0x2be3, 0x2be3, 0x2be3, 0 },
+	{ 0x2cb5, 0x2cb5, 0x2cb5, 0 },
+	{ 0x2d89, 0x2d89, 0x2d89, 0 },
+	{ 0x2e60, 0x2e60, 0x2e60, 0 },
+	{ 0x2f39, 0x2f39, 0x2f39, 0 },
+	{ 0x3014, 0x3014, 0x3014, 0 },
+	{ 0x30f2, 0x30f2, 0x30f2, 0 },
+	{ 0x31d2, 0x31d2, 0x31d2, 0 },
+	{ 0x32b4, 0x32b4, 0x32b4, 0 },
+	{ 0x3398, 0x3398, 0x3398, 0 },
+	{ 0x347f, 0x347f, 0x347f, 0 },
+	{ 0x3569, 0x3569, 0x3569, 0 },
+	{ 0x3654, 0x3654, 0x3654, 0 },
+	{ 0x3742, 0x3742, 0x3742, 0 },
+	{ 0x3832, 0x3832, 0x3832, 0 },
+	{ 0x3925, 0x3925, 0x3925, 0 },
+	{ 0x3a1a, 0x3a1a, 0x3a1a, 0 },
+	{ 0x3b11, 0x3b11, 0x3b11, 0 },
+	{ 0x3c0b, 0x3c0b, 0x3c0b, 0 },
+	{ 0x3d07, 0x3d07, 0x3d07, 0 },
+	{ 0x3e05, 0x3e05, 0x3e05, 0 },
+	{ 0x3f06, 0x3f06, 0x3f06, 0 },
+	{ 0x400a, 0x400a, 0x400a, 0 },
+	{ 0x410f, 0x410f, 0x410f, 0 },
+	{ 0x4218, 0x4218, 0x4218, 0 },
+	{ 0x4322, 0x4322, 0x4322, 0 },
+	{ 0x442f, 0x442f, 0x442f, 0 },
+	{ 0x453f, 0x453f, 0x453f, 0 },
+	{ 0x4650, 0x4650, 0x4650, 0 },
+	{ 0x4765, 0x4765, 0x4765, 0 },
+	{ 0x487c, 0x487c, 0x487c, 0 },
+	{ 0x4995, 0x4995, 0x4995, 0 },
+	{ 0x4ab1, 0x4ab1, 0x4ab1, 0 },
+	{ 0x4bcf, 0x4bcf, 0x4bcf, 0 },
+	{ 0x4cf0, 0x4cf0, 0x4cf0, 0 },
+	{ 0x4e13, 0x4e13, 0x4e13, 0 },
+	{ 0x4f39, 0x4f39, 0x4f39, 0 },
+	{ 0x5061, 0x5061, 0x5061, 0 },
+	{ 0x518b, 0x518b, 0x518b, 0 },
+	{ 0x52b9, 0x52b9, 0x52b9, 0 },
+	{ 0x53e8, 0x53e8, 0x53e8, 0 },
+	{ 0x551b, 0x551b, 0x551b, 0 },
+	{ 0x5650, 0x5650, 0x5650, 0 },
+	{ 0x5787, 0x5787, 0x5787, 0 },
+	{ 0x58c1, 0x58c1, 0x58c1, 0 },
+	{ 0x59fd, 0x59fd, 0x59fd, 0 },
+	{ 0x5b3c, 0x5b3c, 0x5b3c, 0 },
+	{ 0x5c7e, 0x5c7e, 0x5c7e, 0 },
+	{ 0x5dc2, 0x5dc2, 0x5dc2, 0 },
+	{ 0x5f09, 0x5f09, 0x5f09, 0 },
+	{ 0x6052, 0x6052, 0x6052, 0 },
+	{ 0x619e, 0x619e, 0x619e, 0 },
+	{ 0x62ec, 0x62ec, 0x62ec, 0 },
+	{ 0x643d, 0x643d, 0x643d, 0 },
+	{ 0x6591, 0x6591, 0x6591, 0 },
+	{ 0x66e7, 0x66e7, 0x66e7, 0 },
+	{ 0x6840, 0x6840, 0x6840, 0 },
+	{ 0x699b, 0x699b, 0x699b, 0 },
+	{ 0x6afa, 0x6afa, 0x6afa, 0 },
+	{ 0x6c5a, 0x6c5a, 0x6c5a, 0 },
+	{ 0x6dbe, 0x6dbe, 0x6dbe, 0 },
+	{ 0x6f24, 0x6f24, 0x6f24, 0 },
+	{ 0x708c, 0x708c, 0x708c, 0 },
+	{ 0x71f8, 0x71f8, 0x71f8, 0 },
+	{ 0x7366, 0x7366, 0x7366, 0 },
+	{ 0x74d6, 0x74d6, 0x74d6, 0 },
+	{ 0x764a, 0x764a, 0x764a, 0 },
+	{ 0x77c0, 0x77c0, 0x77c0, 0 },
+	{ 0x7938, 0x7938, 0x7938, 0 },
+	{ 0x7ab4, 0x7ab4, 0x7ab4, 0 },
+	{ 0x7c32, 0x7c32, 0x7c32, 0 },
+	{ 0x7db3, 0x7db3, 0x7db3, 0 },
+	{ 0x7f36, 0x7f36, 0x7f36, 0 },
+	{ 0x80bc, 0x80bc, 0x80bc, 0 },
+	{ 0x8245, 0x8245, 0x8245, 0 },
+	{ 0x83d1, 0x83d1, 0x83d1, 0 },
+	{ 0x855f, 0x855f, 0x855f, 0 },
+	{ 0x86f0, 0x86f0, 0x86f0, 0 },
+	{ 0x8884, 0x8884, 0x8884, 0 },
+	{ 0x8a1a, 0x8a1a, 0x8a1a, 0 },
+	{ 0x8bb4, 0x8bb4, 0x8bb4, 0 },
+	{ 0x8d50, 0x8d50, 0x8d50, 0 },
+	{ 0x8eee, 0x8eee, 0x8eee, 0 },
+	{ 0x9090, 0x9090, 0x9090, 0 },
+	{ 0x9234, 0x9234, 0x9234, 0 },
+	{ 0x93db, 0x93db, 0x93db, 0 },
+	{ 0x9585, 0x9585, 0x9585, 0 },
+	{ 0x9732, 0x9732, 0x9732, 0 },
+	{ 0x98e1, 0x98e1, 0x98e1, 0 },
+	{ 0x9a93, 0x9a93, 0x9a93, 0 },
+	{ 0x9c48, 0x9c48, 0x9c48, 0 },
+	{ 0x9e00, 0x9e00, 0x9e00, 0 },
+	{ 0x9fbb, 0x9fbb, 0x9fbb, 0 },
+	{ 0xa178, 0xa178, 0xa178, 0 },
+	{ 0xa338, 0xa338, 0xa338, 0 },
+	{ 0xa4fb, 0xa4fb, 0xa4fb, 0 },
+	{ 0xa6c1, 0xa6c1, 0xa6c1, 0 },
+	{ 0xa88a, 0xa88a, 0xa88a, 0 },
+	{ 0xaa56, 0xaa56, 0xaa56, 0 },
+	{ 0xac24, 0xac24, 0xac24, 0 },
+	{ 0xadf5, 0xadf5, 0xadf5, 0 },
+	{ 0xafc9, 0xafc9, 0xafc9, 0 },
+	{ 0xb1a0, 0xb1a0, 0xb1a0, 0 },
+	{ 0xb37a, 0xb37a, 0xb37a, 0 },
+	{ 0xb557, 0xb557, 0xb557, 0 },
+	{ 0xb736, 0xb736, 0xb736, 0 },
+	{ 0xb919, 0xb919, 0xb919, 0 },
+	{ 0xbafe, 0xbafe, 0xbafe, 0 },
+	{ 0xbce6, 0xbce6, 0xbce6, 0 },
+	{ 0xbed2, 0xbed2, 0xbed2, 0 },
+	{ 0xc0c0, 0xc0c0, 0xc0c0, 0 },
+	{ 0xc2b0, 0xc2b0, 0xc2b0, 0 },
+	{ 0xc4a4, 0xc4a4, 0xc4a4, 0 },
+	{ 0xc69b, 0xc69b, 0xc69b, 0 },
+	{ 0xc895, 0xc895, 0xc895, 0 },
+	{ 0xca91, 0xca91, 0xca91, 0 },
+	{ 0xcc91, 0xcc91, 0xcc91, 0 },
+	{ 0xce93, 0xce93, 0xce93, 0 },
+	{ 0xd098, 0xd098, 0xd098, 0 },
+	{ 0xd2a1, 0xd2a1, 0xd2a1, 0 },
+	{ 0xd4ac, 0xd4ac, 0xd4ac, 0 },
+	{ 0xd6ba, 0xd6ba, 0xd6ba, 0 },
+	{ 0xd8cb, 0xd8cb, 0xd8cb, 0 },
+	{ 0xdadf, 0xdadf, 0xdadf, 0 },
+	{ 0xdcf7, 0xdcf7, 0xdcf7, 0 },
+	{ 0xdf11, 0xdf11, 0xdf11, 0 },
+	{ 0xe12e, 0xe12e, 0xe12e, 0 },
+	{ 0xe34e, 0xe34e, 0xe34e, 0 },
+	{ 0xe571, 0xe571, 0xe571, 0 },
+	{ 0xe796, 0xe796, 0xe796, 0 },
+	{ 0xe9bf, 0xe9bf, 0xe9bf, 0 },
+	{ 0xebeb, 0xebeb, 0xebeb, 0 },
+	{ 0xee1a, 0xee1a, 0xee1a, 0 },
+	{ 0xf04c, 0xf04c, 0xf04c, 0 },
+	{ 0xf281, 0xf281, 0xf281, 0 },
+	{ 0xf4b9, 0xf4b9, 0xf4b9, 0 },
+	{ 0xf6f4, 0xf6f4, 0xf6f4, 0 },
+	{ 0xf932, 0xf932, 0xf932, 0 },
+	{ 0xfb73, 0xfb73, 0xfb73, 0 },
+	{ 0xfdb7, 0xfdb7, 0xfdb7, 0 },
+	{ 0xffff, 0xffff, 0xffff, 0 },
+};
+
+const struct vkms_color_lut srgb_eotf = {
+	.base = srgb_array,
+	.lut_length = LUT_SIZE,
+	.channel_value2index_ratio = 0xff00ffll
+};
+
+static struct drm_color_lut srgb_inv_array[LUT_SIZE] = {
+	{ 0x0, 0x0, 0x0, 0 },
+	{ 0xcc2, 0xcc2, 0xcc2, 0 },
+	{ 0x15be, 0x15be, 0x15be, 0 },
+	{ 0x1c56, 0x1c56, 0x1c56, 0 },
+	{ 0x21bd, 0x21bd, 0x21bd, 0 },
+	{ 0x2666, 0x2666, 0x2666, 0 },
+	{ 0x2a8a, 0x2a8a, 0x2a8a, 0 },
+	{ 0x2e4c, 0x2e4c, 0x2e4c, 0 },
+	{ 0x31c0, 0x31c0, 0x31c0, 0 },
+	{ 0x34f6, 0x34f6, 0x34f6, 0 },
+	{ 0x37f9, 0x37f9, 0x37f9, 0 },
+	{ 0x3acf, 0x3acf, 0x3acf, 0 },
+	{ 0x3d80, 0x3d80, 0x3d80, 0 },
+	{ 0x4010, 0x4010, 0x4010, 0 },
+	{ 0x4284, 0x4284, 0x4284, 0 },
+	{ 0x44dd, 0x44dd, 0x44dd, 0 },
+	{ 0x4720, 0x4720, 0x4720, 0 },
+	{ 0x494e, 0x494e, 0x494e, 0 },
+	{ 0x4b69, 0x4b69, 0x4b69, 0 },
+	{ 0x4d73, 0x4d73, 0x4d73, 0 },
+	{ 0x4f6e, 0x4f6e, 0x4f6e, 0 },
+	{ 0x5159, 0x5159, 0x5159, 0 },
+	{ 0x5337, 0x5337, 0x5337, 0 },
+	{ 0x5509, 0x5509, 0x5509, 0 },
+	{ 0x56cf, 0x56cf, 0x56cf, 0 },
+	{ 0x588a, 0x588a, 0x588a, 0 },
+	{ 0x5a3b, 0x5a3b, 0x5a3b, 0 },
+	{ 0x5be2, 0x5be2, 0x5be2, 0 },
+	{ 0x5d80, 0x5d80, 0x5d80, 0 },
+	{ 0x5f16, 0x5f16, 0x5f16, 0 },
+	{ 0x60a4, 0x60a4, 0x60a4, 0 },
+	{ 0x6229, 0x6229, 0x6229, 0 },
+	{ 0x63a8, 0x63a8, 0x63a8, 0 },
+	{ 0x6520, 0x6520, 0x6520, 0 },
+	{ 0x6691, 0x6691, 0x6691, 0 },
+	{ 0x67fc, 0x67fc, 0x67fc, 0 },
+	{ 0x6961, 0x6961, 0x6961, 0 },
+	{ 0x6ac0, 0x6ac0, 0x6ac0, 0 },
+	{ 0x6c19, 0x6c19, 0x6c19, 0 },
+	{ 0x6d6e, 0x6d6e, 0x6d6e, 0 },
+	{ 0x6ebd, 0x6ebd, 0x6ebd, 0 },
+	{ 0x7008, 0x7008, 0x7008, 0 },
+	{ 0x714d, 0x714d, 0x714d, 0 },
+	{ 0x728f, 0x728f, 0x728f, 0 },
+	{ 0x73cc, 0x73cc, 0x73cc, 0 },
+	{ 0x7504, 0x7504, 0x7504, 0 },
+	{ 0x7639, 0x7639, 0x7639, 0 },
+	{ 0x776a, 0x776a, 0x776a, 0 },
+	{ 0x7897, 0x7897, 0x7897, 0 },
+	{ 0x79c1, 0x79c1, 0x79c1, 0 },
+	{ 0x7ae7, 0x7ae7, 0x7ae7, 0 },
+	{ 0x7c09, 0x7c09, 0x7c09, 0 },
+	{ 0x7d28, 0x7d28, 0x7d28, 0 },
+	{ 0x7e44, 0x7e44, 0x7e44, 0 },
+	{ 0x7f5d, 0x7f5d, 0x7f5d, 0 },
+	{ 0x8073, 0x8073, 0x8073, 0 },
+	{ 0x8186, 0x8186, 0x8186, 0 },
+	{ 0x8296, 0x8296, 0x8296, 0 },
+	{ 0x83a4, 0x83a4, 0x83a4, 0 },
+	{ 0x84ae, 0x84ae, 0x84ae, 0 },
+	{ 0x85b6, 0x85b6, 0x85b6, 0 },
+	{ 0x86bc, 0x86bc, 0x86bc, 0 },
+	{ 0x87bf, 0x87bf, 0x87bf, 0 },
+	{ 0x88bf, 0x88bf, 0x88bf, 0 },
+	{ 0x89be, 0x89be, 0x89be, 0 },
+	{ 0x8ab9, 0x8ab9, 0x8ab9, 0 },
+	{ 0x8bb3, 0x8bb3, 0x8bb3, 0 },
+	{ 0x8cab, 0x8cab, 0x8cab, 0 },
+	{ 0x8da0, 0x8da0, 0x8da0, 0 },
+	{ 0x8e93, 0x8e93, 0x8e93, 0 },
+	{ 0x8f84, 0x8f84, 0x8f84, 0 },
+	{ 0x9073, 0x9073, 0x9073, 0 },
+	{ 0x9161, 0x9161, 0x9161, 0 },
+	{ 0x924c, 0x924c, 0x924c, 0 },
+	{ 0x9335, 0x9335, 0x9335, 0 },
+	{ 0x941d, 0x941d, 0x941d, 0 },
+	{ 0x9503, 0x9503, 0x9503, 0 },
+	{ 0x95e7, 0x95e7, 0x95e7, 0 },
+	{ 0x96c9, 0x96c9, 0x96c9, 0 },
+	{ 0x97aa, 0x97aa, 0x97aa, 0 },
+	{ 0x9889, 0x9889, 0x9889, 0 },
+	{ 0x9966, 0x9966, 0x9966, 0 },
+	{ 0x9a42, 0x9a42, 0x9a42, 0 },
+	{ 0x9b1c, 0x9b1c, 0x9b1c, 0 },
+	{ 0x9bf5, 0x9bf5, 0x9bf5, 0 },
+	{ 0x9ccc, 0x9ccc, 0x9ccc, 0 },
+	{ 0x9da1, 0x9da1, 0x9da1, 0 },
+	{ 0x9e76, 0x9e76, 0x9e76, 0 },
+	{ 0x9f49, 0x9f49, 0x9f49, 0 },
+	{ 0xa01a, 0xa01a, 0xa01a, 0 },
+	{ 0xa0ea, 0xa0ea, 0xa0ea, 0 },
+	{ 0xa1b9, 0xa1b9, 0xa1b9, 0 },
+	{ 0xa286, 0xa286, 0xa286, 0 },
+	{ 0xa352, 0xa352, 0xa352, 0 },
+	{ 0xa41d, 0xa41d, 0xa41d, 0 },
+	{ 0xa4e7, 0xa4e7, 0xa4e7, 0 },
+	{ 0xa5af, 0xa5af, 0xa5af, 0 },
+	{ 0xa676, 0xa676, 0xa676, 0 },
+	{ 0xa73c, 0xa73c, 0xa73c, 0 },
+	{ 0xa801, 0xa801, 0xa801, 0 },
+	{ 0xa8c5, 0xa8c5, 0xa8c5, 0 },
+	{ 0xa987, 0xa987, 0xa987, 0 },
+	{ 0xaa48, 0xaa48, 0xaa48, 0 },
+	{ 0xab09, 0xab09, 0xab09, 0 },
+	{ 0xabc8, 0xabc8, 0xabc8, 0 },
+	{ 0xac86, 0xac86, 0xac86, 0 },
+	{ 0xad43, 0xad43, 0xad43, 0 },
+	{ 0xadff, 0xadff, 0xadff, 0 },
+	{ 0xaeba, 0xaeba, 0xaeba, 0 },
+	{ 0xaf74, 0xaf74, 0xaf74, 0 },
+	{ 0xb02d, 0xb02d, 0xb02d, 0 },
+	{ 0xb0e5, 0xb0e5, 0xb0e5, 0 },
+	{ 0xb19c, 0xb19c, 0xb19c, 0 },
+	{ 0xb252, 0xb252, 0xb252, 0 },
+	{ 0xb307, 0xb307, 0xb307, 0 },
+	{ 0xb3bb, 0xb3bb, 0xb3bb, 0 },
+	{ 0xb46f, 0xb46f, 0xb46f, 0 },
+	{ 0xb521, 0xb521, 0xb521, 0 },
+	{ 0xb5d3, 0xb5d3, 0xb5d3, 0 },
+	{ 0xb683, 0xb683, 0xb683, 0 },
+	{ 0xb733, 0xb733, 0xb733, 0 },
+	{ 0xb7e2, 0xb7e2, 0xb7e2, 0 },
+	{ 0xb890, 0xb890, 0xb890, 0 },
+	{ 0xb93d, 0xb93d, 0xb93d, 0 },
+	{ 0xb9ea, 0xb9ea, 0xb9ea, 0 },
+	{ 0xba96, 0xba96, 0xba96, 0 },
+	{ 0xbb40, 0xbb40, 0xbb40, 0 },
+	{ 0xbbea, 0xbbea, 0xbbea, 0 },
+	{ 0xbc94, 0xbc94, 0xbc94, 0 },
+	{ 0xbd3c, 0xbd3c, 0xbd3c, 0 },
+	{ 0xbde4, 0xbde4, 0xbde4, 0 },
+	{ 0xbe8b, 0xbe8b, 0xbe8b, 0 },
+	{ 0xbf31, 0xbf31, 0xbf31, 0 },
+	{ 0xbfd7, 0xbfd7, 0xbfd7, 0 },
+	{ 0xc07b, 0xc07b, 0xc07b, 0 },
+	{ 0xc120, 0xc120, 0xc120, 0 },
+	{ 0xc1c3, 0xc1c3, 0xc1c3, 0 },
+	{ 0xc266, 0xc266, 0xc266, 0 },
+	{ 0xc308, 0xc308, 0xc308, 0 },
+	{ 0xc3a9, 0xc3a9, 0xc3a9, 0 },
+	{ 0xc449, 0xc449, 0xc449, 0 },
+	{ 0xc4e9, 0xc4e9, 0xc4e9, 0 },
+	{ 0xc589, 0xc589, 0xc589, 0 },
+	{ 0xc627, 0xc627, 0xc627, 0 },
+	{ 0xc6c5, 0xc6c5, 0xc6c5, 0 },
+	{ 0xc763, 0xc763, 0xc763, 0 },
+	{ 0xc7ff, 0xc7ff, 0xc7ff, 0 },
+	{ 0xc89b, 0xc89b, 0xc89b, 0 },
+	{ 0xc937, 0xc937, 0xc937, 0 },
+	{ 0xc9d2, 0xc9d2, 0xc9d2, 0 },
+	{ 0xca6c, 0xca6c, 0xca6c, 0 },
+	{ 0xcb06, 0xcb06, 0xcb06, 0 },
+	{ 0xcb9f, 0xcb9f, 0xcb9f, 0 },
+	{ 0xcc37, 0xcc37, 0xcc37, 0 },
+	{ 0xcccf, 0xcccf, 0xcccf, 0 },
+	{ 0xcd66, 0xcd66, 0xcd66, 0 },
+	{ 0xcdfd, 0xcdfd, 0xcdfd, 0 },
+	{ 0xce93, 0xce93, 0xce93, 0 },
+	{ 0xcf29, 0xcf29, 0xcf29, 0 },
+	{ 0xcfbe, 0xcfbe, 0xcfbe, 0 },
+	{ 0xd053, 0xd053, 0xd053, 0 },
+	{ 0xd0e7, 0xd0e7, 0xd0e7, 0 },
+	{ 0xd17a, 0xd17a, 0xd17a, 0 },
+	{ 0xd20d, 0xd20d, 0xd20d, 0 },
+	{ 0xd2a0, 0xd2a0, 0xd2a0, 0 },
+	{ 0xd331, 0xd331, 0xd331, 0 },
+	{ 0xd3c3, 0xd3c3, 0xd3c3, 0 },
+	{ 0xd454, 0xd454, 0xd454, 0 },
+	{ 0xd4e4, 0xd4e4, 0xd4e4, 0 },
+	{ 0xd574, 0xd574, 0xd574, 0 },
+	{ 0xd603, 0xd603, 0xd603, 0 },
+	{ 0xd692, 0xd692, 0xd692, 0 },
+	{ 0xd720, 0xd720, 0xd720, 0 },
+	{ 0xd7ae, 0xd7ae, 0xd7ae, 0 },
+	{ 0xd83c, 0xd83c, 0xd83c, 0 },
+	{ 0xd8c9, 0xd8c9, 0xd8c9, 0 },
+	{ 0xd955, 0xd955, 0xd955, 0 },
+	{ 0xd9e1, 0xd9e1, 0xd9e1, 0 },
+	{ 0xda6d, 0xda6d, 0xda6d, 0 },
+	{ 0xdaf8, 0xdaf8, 0xdaf8, 0 },
+	{ 0xdb83, 0xdb83, 0xdb83, 0 },
+	{ 0xdc0d, 0xdc0d, 0xdc0d, 0 },
+	{ 0xdc97, 0xdc97, 0xdc97, 0 },
+	{ 0xdd20, 0xdd20, 0xdd20, 0 },
+	{ 0xdda9, 0xdda9, 0xdda9, 0 },
+	{ 0xde31, 0xde31, 0xde31, 0 },
+	{ 0xdeb9, 0xdeb9, 0xdeb9, 0 },
+	{ 0xdf41, 0xdf41, 0xdf41, 0 },
+	{ 0xdfc8, 0xdfc8, 0xdfc8, 0 },
+	{ 0xe04f, 0xe04f, 0xe04f, 0 },
+	{ 0xe0d5, 0xe0d5, 0xe0d5, 0 },
+	{ 0xe15b, 0xe15b, 0xe15b, 0 },
+	{ 0xe1e0, 0xe1e0, 0xe1e0, 0 },
+	{ 0xe266, 0xe266, 0xe266, 0 },
+	{ 0xe2ea, 0xe2ea, 0xe2ea, 0 },
+	{ 0xe36f, 0xe36f, 0xe36f, 0 },
+	{ 0xe3f3, 0xe3f3, 0xe3f3, 0 },
+	{ 0xe476, 0xe476, 0xe476, 0 },
+	{ 0xe4f9, 0xe4f9, 0xe4f9, 0 },
+	{ 0xe57c, 0xe57c, 0xe57c, 0 },
+	{ 0xe5fe, 0xe5fe, 0xe5fe, 0 },
+	{ 0xe680, 0xe680, 0xe680, 0 },
+	{ 0xe702, 0xe702, 0xe702, 0 },
+	{ 0xe783, 0xe783, 0xe783, 0 },
+	{ 0xe804, 0xe804, 0xe804, 0 },
+	{ 0xe884, 0xe884, 0xe884, 0 },
+	{ 0xe905, 0xe905, 0xe905, 0 },
+	{ 0xe984, 0xe984, 0xe984, 0 },
+	{ 0xea04, 0xea04, 0xea04, 0 },
+	{ 0xea83, 0xea83, 0xea83, 0 },
+	{ 0xeb02, 0xeb02, 0xeb02, 0 },
+	{ 0xeb80, 0xeb80, 0xeb80, 0 },
+	{ 0xebfe, 0xebfe, 0xebfe, 0 },
+	{ 0xec7b, 0xec7b, 0xec7b, 0 },
+	{ 0xecf9, 0xecf9, 0xecf9, 0 },
+	{ 0xed76, 0xed76, 0xed76, 0 },
+	{ 0xedf2, 0xedf2, 0xedf2, 0 },
+	{ 0xee6f, 0xee6f, 0xee6f, 0 },
+	{ 0xeeeb, 0xeeeb, 0xeeeb, 0 },
+	{ 0xef66, 0xef66, 0xef66, 0 },
+	{ 0xefe2, 0xefe2, 0xefe2, 0 },
+	{ 0xf05d, 0xf05d, 0xf05d, 0 },
+	{ 0xf0d7, 0xf0d7, 0xf0d7, 0 },
+	{ 0xf152, 0xf152, 0xf152, 0 },
+	{ 0xf1cc, 0xf1cc, 0xf1cc, 0 },
+	{ 0xf245, 0xf245, 0xf245, 0 },
+	{ 0xf2bf, 0xf2bf, 0xf2bf, 0 },
+	{ 0xf338, 0xf338, 0xf338, 0 },
+	{ 0xf3b0, 0xf3b0, 0xf3b0, 0 },
+	{ 0xf429, 0xf429, 0xf429, 0 },
+	{ 0xf4a1, 0xf4a1, 0xf4a1, 0 },
+	{ 0xf519, 0xf519, 0xf519, 0 },
+	{ 0xf590, 0xf590, 0xf590, 0 },
+	{ 0xf608, 0xf608, 0xf608, 0 },
+	{ 0xf67e, 0xf67e, 0xf67e, 0 },
+	{ 0xf6f5, 0xf6f5, 0xf6f5, 0 },
+	{ 0xf76b, 0xf76b, 0xf76b, 0 },
+	{ 0xf7e1, 0xf7e1, 0xf7e1, 0 },
+	{ 0xf857, 0xf857, 0xf857, 0 },
+	{ 0xf8cd, 0xf8cd, 0xf8cd, 0 },
+	{ 0xf942, 0xf942, 0xf942, 0 },
+	{ 0xf9b7, 0xf9b7, 0xf9b7, 0 },
+	{ 0xfa2b, 0xfa2b, 0xfa2b, 0 },
+	{ 0xfaa0, 0xfaa0, 0xfaa0, 0 },
+	{ 0xfb14, 0xfb14, 0xfb14, 0 },
+	{ 0xfb88, 0xfb88, 0xfb88, 0 },
+	{ 0xfbfb, 0xfbfb, 0xfbfb, 0 },
+	{ 0xfc6e, 0xfc6e, 0xfc6e, 0 },
+	{ 0xfce1, 0xfce1, 0xfce1, 0 },
+	{ 0xfd54, 0xfd54, 0xfd54, 0 },
+	{ 0xfdc6, 0xfdc6, 0xfdc6, 0 },
+	{ 0xfe39, 0xfe39, 0xfe39, 0 },
+	{ 0xfeaa, 0xfeaa, 0xfeaa, 0 },
+	{ 0xff1c, 0xff1c, 0xff1c, 0 },
+	{ 0xff8d, 0xff8d, 0xff8d, 0 },
+	{ 0xffff, 0xffff, 0xffff, 0 },
+};
+
+const struct vkms_color_lut srgb_inv_eotf = {
+	.base = srgb_inv_array,
+	.lut_length = LUT_SIZE,
+	.channel_value2index_ratio = 0xff00ffll
+};
diff --git a/drivers/gpu/drm/vkms/vkms_luts.h b/drivers/gpu/drm/vkms/vkms_luts.h
new file mode 100644
index 000000000000..053512a643f7
--- /dev/null
+++ b/drivers/gpu/drm/vkms/vkms_luts.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+
+#ifndef _VKMS_LUTS_H_
+#define _VKMS_LUTS_H_
+
+#define LUT_SIZE 256
+
+extern const struct vkms_color_lut linear_eotf;
+extern const struct vkms_color_lut srgb_eotf;
+extern const struct vkms_color_lut srgb_inv_eotf;
+
+#endif /* _VKMS_LUTS_H_ */
\ No newline at end of file
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index e5c625ab8e3e..8520ee0534d1 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -215,5 +215,7 @@ struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
 	drm_plane_create_rotation_property(&plane->base, DRM_MODE_ROTATE_0,
 					   DRM_MODE_ROTATE_MASK | DRM_MODE_REFLECT_MASK);
 
+	vkms_initialize_colorops(&plane->base);
+
 	return plane;
 }
diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index 4d7f4c5f2001..898b02689d6d 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -30,6 +30,7 @@
 
 #include <drm/drm_crtc.h>
 #include <drm/drm_util.h>
+#include <drm/drm_colorop.h>
 
 /**
  * struct drm_crtc_commit - track modeset commits on a CRTC
@@ -157,6 +158,11 @@ struct drm_crtc_commit {
 	bool abort_completion;
 };
 
+struct __drm_colorops_state {
+	struct drm_colorop *ptr;
+	struct drm_colorop_state *state, *old_state, *new_state;
+};
+
 struct __drm_planes_state {
 	struct drm_plane *ptr;
 	struct drm_plane_state *state, *old_state, *new_state;
@@ -416,6 +422,9 @@ struct drm_atomic_state {
 	 */
 	struct __drm_planes_state *planes;
 
+	/* TODO: Add documentation */
+	struct __drm_colorops_state *colorops;
+
 	/**
 	 * @crtcs:
 	 *
@@ -549,6 +558,9 @@ drm_atomic_get_crtc_state(struct drm_atomic_state *state,
 struct drm_plane_state * __must_check
 drm_atomic_get_plane_state(struct drm_atomic_state *state,
 			   struct drm_plane *plane);
+struct drm_colorop_state *
+drm_atomic_get_colorop_state(struct drm_atomic_state *state,
+			     struct drm_colorop *colorop);
 struct drm_connector_state * __must_check
 drm_atomic_get_connector_state(struct drm_atomic_state *state,
 			       struct drm_connector *connector);
@@ -678,6 +690,55 @@ drm_atomic_get_new_plane_state(const struct drm_atomic_state *state,
 	return state->planes[drm_plane_index(plane)].new_state;
 }
 
+
+/**
+ * drm_atomic_get_existing_colorop_state - get colorop state, if it exists
+ * @state: global atomic state object
+ * @colorop: colorop to grab
+ *
+ * This function returns the colorop state for the given colorop, or NULL
+ * if the colorop is not part of the global atomic state.
+ *
+ * This function is deprecated, @drm_atomic_get_old_colorop_state or
+ * @drm_atomic_get_new_colorop_state should be used instead.
+ */
+static inline struct drm_colorop_state *
+drm_atomic_get_existing_colorop_state(struct drm_atomic_state *state,
+				    struct drm_colorop *colorop)
+{
+	return state->colorops[drm_colorop_index(colorop)].state;
+}
+
+/**
+ * drm_atomic_get_old_colorop_state - get colorop state, if it exists
+ * @state: global atomic state object
+ * @colorop: colorop to grab
+ *
+ * This function returns the old colorop state for the given colorop, or
+ * NULL if the colorop is not part of the global atomic state.
+ */
+static inline struct drm_colorop_state *
+drm_atomic_get_old_colorop_state(struct drm_atomic_state *state,
+			       struct drm_colorop *colorop)
+{
+	return state->colorops[drm_colorop_index(colorop)].old_state;
+}
+
+/**
+ * drm_atomic_get_new_colorop_state - get colorop state, if it exists
+ * @state: global atomic state object
+ * @colorop: colorop to grab
+ *
+ * This function returns the new colorop state for the given colorop, or
+ * NULL if the colorop is not part of the global atomic state.
+ */
+static inline struct drm_colorop_state *
+drm_atomic_get_new_colorop_state(struct drm_atomic_state *state,
+			       struct drm_colorop *colorop)
+{
+	return state->colorops[drm_colorop_index(colorop)].new_state;
+}
+
 /**
  * drm_atomic_get_existing_connector_state - get connector state, if it exists
  * @state: global atomic state object
@@ -925,6 +986,29 @@ void drm_state_dump(struct drm_device *dev, struct drm_printer *p);
 			     (new_crtc_state) = (__state)->crtcs[__i].new_state, \
 			     (void)(new_crtc_state) /* Only to avoid unused-but-set-variable warning */, 1))
 
+/**
+ * for_each_oldnew_colorop_in_state - iterate over all colorops in an atomic update
+ * @__state: &struct drm_atomic_state pointer
+ * @colorop: &struct drm_colorop iteration cursor
+ * @old_colorop_state: &struct drm_colorop_state iteration cursor for the old state
+ * @new_colorop_state: &struct drm_colorop_state iteration cursor for the new state
+ * @__i: int iteration cursor, for macro-internal use
+ *
+ * This iterates over all colorops in an atomic update, tracking both old and
+ * new state. This is useful in places where the state delta needs to be
+ * considered, for example in atomic check functions.
+ */
+#define for_each_oldnew_colorop_in_state(__state, colorop, old_colorop_state, new_colorop_state, __i) \
+	for ((__i) = 0;							\
+	     (__i) < (__state)->dev->mode_config.num_colorop;	\
+	     (__i)++)							\
+		for_each_if ((__state)->colorops[__i].ptr &&		\
+			     ((colorop) = (__state)->colorops[__i].ptr,	\
+			      (void)(colorop) /* Only to avoid unused-but-set-variable warning */, \
+			      (old_colorop_state) = (__state)->colorops[__i].old_state,\
+			      (new_colorop_state) = (__state)->colorops[__i].new_state, 1))
+
+
 /**
  * for_each_oldnew_plane_in_state - iterate over all planes in an atomic update
  * @__state: &struct drm_atomic_state pointer
diff --git a/include/drm/drm_atomic_uapi.h b/include/drm/drm_atomic_uapi.h
index 4c6d39d7bdb2..436315523326 100644
--- a/include/drm/drm_atomic_uapi.h
+++ b/include/drm/drm_atomic_uapi.h
@@ -37,6 +37,7 @@ struct drm_crtc;
 struct drm_connector_state;
 struct dma_fence;
 struct drm_framebuffer;
+struct drm_colorop;
 
 int __must_check
 drm_atomic_set_mode_for_crtc(struct drm_crtc_state *state,
@@ -49,6 +50,8 @@ drm_atomic_set_crtc_for_plane(struct drm_plane_state *plane_state,
 			      struct drm_crtc *crtc);
 void drm_atomic_set_fb_for_plane(struct drm_plane_state *plane_state,
 				 struct drm_framebuffer *fb);
+void drm_atomic_set_colorop_for_plane(struct drm_plane_state *plane_state,
+				      struct drm_colorop *colorop);
 int __must_check
 drm_atomic_set_crtc_for_connector(struct drm_connector_state *conn_state,
 				  struct drm_crtc *crtc);
diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
new file mode 100644
index 000000000000..faca6eba10e1
--- /dev/null
+++ b/include/drm/drm_colorop.h
@@ -0,0 +1,258 @@
+/*
+ * Copyright (C) 2023 Advanced Micro Devices, Inc. All rights reserved.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ * Authors: AMD
+ *
+ */
+
+#ifndef __DRM_COLOROP_H__
+#define __DRM_COLOROP_H__
+
+#include <drm/drm_mode_object.h>
+#include <drm/drm_mode.h>
+#include <drm/drm_property.h>
+
+enum drm_colorop_curve_1d_type {
+	DRM_COLOROP_1D_CURVE_SRGB_EOTF,
+	DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF
+};
+
+/**
+ * struct drm_colorop_state - mutable colorop state
+ */
+struct drm_colorop_state {
+	/** @colorop: backpointer to the colorop */
+	struct drm_colorop *colorop;
+
+	/* colorop properties */
+
+	/**
+	 * @bypass:
+	 *
+	 * True if colorop shall be bypassed. False if colorop is
+	 * enabled.
+	 */
+	bool bypass;
+
+	/**
+	 * @curve_1d_type:
+	 *
+	 * Type of 1D curve.
+	 */
+	enum drm_colorop_curve_1d_type curve_1d_type;
+
+	/**
+	 * @data:
+	 *
+	 * Data blob for any TYPE that requires such a blob. The
+	 * interpretation of the blob is TYPE-specific.
+	 */
+	struct drm_property_blob *data;
+
+	/** @state: backpointer to global drm_atomic_state */
+	struct drm_atomic_state *state;
+};
+
+/**
+ * struct drm_colorop - DRM color operation control structure
+ *
+ * A colorop represents one color operation. They can be chained via
+ * the 'next' pointer to build a color pipeline.
+ */
+struct drm_colorop {
+	/** @dev: parent DRM device */
+	struct drm_device *dev;
+
+	/**
+	 * @head:
+	 *
+	 * List of all colorops on @dev, linked from &drm_mode_config.colorop_list.
+	 * Invariant over the lifetime of @dev and therefore does not need
+	 * locking.
+	 */
+	struct list_head head;
+
+	/**
+	 * @index: Position inside the mode_config.list, can be used as an array
+	 * index. It is invariant over the lifetime of the plane.
+	 */
+	unsigned index;
+
+	/* TODO do we need a separate mutex or will we tag along with the plane mutex? */
+
+	/** @base base mode object*/
+	struct drm_mode_object base;
+
+	/**
+	 * @plane:
+	 *
+	 * The plane on which the colorop sits. A drm_colorop is always unique
+	 * to a plane.
+	 */
+	struct drm_plane *plane;
+
+	/**
+	 * @state:
+	 *
+	 * Current atomic state for this colorop.
+	 *
+	 * This is protected by @mutex. Note that nonblocking atomic commits
+	 * access the current colorop state without taking locks. Either by
+	 * going through the &struct drm_atomic_state pointers, see
+	 * for_each_oldnew_plane_in_state(), for_each_old_plane_in_state() and
+	 * for_each_new_plane_in_state(). Or through careful ordering of atomic
+	 * commit operations as implemented in the atomic helpers, see
+	 * &struct drm_crtc_commit.
+	 *
+	 * TODO keep, remove, or rewrite above plane references?
+	 */
+	struct drm_colorop_state *state;
+
+	/* colorop properties */
+
+	/** @properties: property tracking for this plane */
+	struct drm_object_properties properties;
+
+	/**
+	 * @type:
+	 *
+	 * Read-only
+	 * Type of color operation
+	 */
+	enum drm_colorop_type type;
+
+	/**
+	 * @next:
+	 *
+	 * Read-only
+	 * Pointer to next drm_colorop in pipeline
+	 */
+	struct drm_colorop *next;
+
+	/**
+	 * @type_property:
+	 *
+	 * Read-only "TYPE" property for specifying the type of
+	 * this color operation. The type is enum drm_colorop_type.
+	 */
+	struct drm_property *type_property;
+
+	/**
+	 * @bypass_property:
+	 *
+	 * Boolean property to control enablement of the color
+	 * operation. Setting bypass to "true" shall always be supported
+	 * in order to allow compositors to quickly fall back to
+	 * alternate methods of color processing. This is important
+	 * since setting color operations can fail due to unique
+	 * HW constraints.
+	 */
+	struct drm_property *bypass_property;
+
+	/**
+	 * @curve_1d_type:
+	 *
+	 * Sub-type for DRM_COLOROP_1D_CURVE type.
+	 */
+	struct drm_property *curve_1d_type_property;
+
+	/**
+	 * @data:
+	 *
+	 * blob property for any TYPE that requires a blob of data,
+	 * such as 1DLUT, CTM, 3DLUT, etc.
+	 *
+	 * The way this blob is interpreted depends on the TYPE of
+	 * this
+	 */
+	struct drm_property *data_property;
+
+	/**
+	 * @next_property
+	 *
+	 * Read-only property to next colorop in the pipeline
+	 */
+	struct drm_property *next_property;
+
+};
+
+#define obj_to_colorop(x) container_of(x, struct drm_colorop, base)
+
+
+
+
+/**
+ * drm_crtc_find - look up a Colorop object from its ID
+ * @dev: DRM device
+ * @file_priv: drm file to check for lease against.
+ * @id: &drm_mode_object ID
+ *
+ * This can be used to look up a Colorop from its userspace ID. Only used by
+ * drivers for legacy IOCTLs and interface, nowadays extensions to the KMS
+ * userspace interface should be done using &drm_property.
+ */
+static inline struct drm_colorop *drm_colorop_find(struct drm_device *dev,
+		struct drm_file *file_priv,
+		uint32_t id)
+{
+	struct drm_mode_object *mo;
+	mo = drm_mode_object_find(dev, file_priv, id, DRM_MODE_OBJECT_COLOROP);
+	return mo ? obj_to_colorop(mo) : NULL;
+}
+
+int drm_colorop_init(struct drm_device *dev, struct drm_colorop *colorop,
+		     struct drm_plane *plane, enum drm_colorop_type type);
+
+struct drm_colorop_state *
+drm_atomic_helper_colorop_duplicate_state(struct drm_colorop *colorop);
+
+void drm_colorop_atomic_destroy_state(struct drm_colorop *colorop,
+				      struct drm_colorop_state *state);
+
+void drm_colorop_reset(struct drm_colorop *colorop);
+
+/**
+ * drm_colorop_index - find the index of a registered colorop
+ * @colorop: colorop to find index for
+ *
+ * Given a registered colorop, return the index of that colorop within a DRM
+ * device's list of colorops.
+ */
+static inline unsigned int drm_colorop_index(const struct drm_colorop *colorop)
+{
+	return colorop->index;
+}
+
+
+#define drm_for_each_colorop(colorop, dev) \
+	list_for_each_entry(colorop, &(dev)->mode_config.colorop_list, head)
+
+const char *drm_get_color_pipeline_name(struct drm_colorop *colorop);
+
+const char *drm_get_colorop_type_name(enum drm_colorop_type type);
+const char *drm_get_colorop_curve_1d_type_name(enum drm_colorop_curve_1d_type type);
+
+void drm_colorop_set_next_property(struct drm_colorop *colorop, struct drm_colorop *next);
+uint32_t drm_colorop_get_next_property(struct drm_colorop *colorop);
+struct drm_colorop *drm_colorop_get_next(struct drm_colorop *colorop);
+
+
+#endif /* __DRM_COLOROP_H__ */
diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
index ab230d3af138..63c1d29b8520 100644
--- a/include/drm/drm_file.h
+++ b/include/drm/drm_file.h
@@ -204,6 +204,13 @@ struct drm_file {
 	 */
 	bool writeback_connectors;
 
+	/**
+	 * @plane_color_pipeline:
+	 *
+	 * True if client understands plane color pipelines
+	 */
+	bool plane_color_pipeline;
+
 	/**
 	 * @was_master:
 	 *
diff --git a/include/drm/drm_fixed.h b/include/drm/drm_fixed.h
index 0c9f917a4d4b..cb842ba80ddd 100644
--- a/include/drm/drm_fixed.h
+++ b/include/drm/drm_fixed.h
@@ -78,6 +78,24 @@ static inline u32 dfixed_div(fixed20_12 A, fixed20_12 B)
 #define DRM_FIXED_EPSILON	1LL
 #define DRM_FIXED_ALMOST_ONE	(DRM_FIXED_ONE - DRM_FIXED_EPSILON)
 
+/**
+ * @drm_sm2fixp
+ *
+ * Convert a 1.31.32 signed-magnitude fixed point to 32.32
+ * 2s-complement fixed point
+ *
+ * @return s64 2s-complement fixed point
+ */
+static inline s64 drm_sm2fixp(__u64 a)
+{
+	if ((a & (1LL << 63))) {
+		return -(a & 0x7fffffffffffffffll);
+	} else {
+		return a;
+	}
+
+}
+
 static inline s64 drm_int2fixp(int a)
 {
 	return ((s64)a) << DRM_FIXED_POINT;
diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
index 973119a9176b..492b8c120c80 100644
--- a/include/drm/drm_mode_config.h
+++ b/include/drm/drm_mode_config.h
@@ -505,6 +505,24 @@ struct drm_mode_config {
 	 */
 	struct list_head plane_list;
 
+	/**
+	 * @num_colorop:
+	 *
+	 * Number of colorop objects on this device.
+	 * This is invariant over the lifetime of a device and hence doesn't
+	 * need any locks.
+	 */
+	int num_colorop;
+
+	/**
+	 * @colorops_list:
+	 *
+	 * List of colorop objects linked with &drm_colorop.head. This is
+	 * invariant over the lifetime of a device and hence doesn't need any
+	 * locks.
+	 */
+	struct list_head colorop_list;
+
 	/**
 	 * @num_crtc:
 	 *
diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
index 641fe298052d..0a124e44c3f2 100644
--- a/include/drm/drm_plane.h
+++ b/include/drm/drm_plane.h
@@ -241,6 +241,8 @@ struct drm_plane_state {
 	 */
 	enum drm_scaling_filter scaling_filter;
 
+	struct drm_colorop *color_pipeline;
+
 	/**
 	 * @commit: Tracks the pending commit to prevent use-after-free conditions,
 	 * and for async plane updates.
@@ -764,6 +766,14 @@ struct drm_plane {
 	 */
 	struct drm_property *color_range_property;
 
+	/**
+	 * @color_pipeline_property:
+	 *
+	 * Optional "COLOR_PIPELINE" enum property for specifying
+	 * a color pipeline to use on the plane.
+	 */
+	struct drm_property *color_pipeline_property;
+
 	/**
 	 * @scaling_filter_property: property to apply a particular filter while
 	 * scaling.
diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
index 16122819edfe..94a0fab3f35e 100644
--- a/include/uapi/drm/drm.h
+++ b/include/uapi/drm/drm.h
@@ -875,6 +875,21 @@ struct drm_get_cap {
  */
 #define DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT	6
 
+/**
+ * DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE
+ *
+ * If set to 1, the DRM core will
+ * - expose plane COLOR_PIPELINE properties for pre-blending color management.
+ * - reject setting of these plane properties:
+ *   - COLOR_ENCODING
+ *   - COLOR_RANGE
+ *
+ * The client must enable &DRM_CLIENT_CAP_ATOMIC first.
+ *
+ * This capability is currently in development.
+ */
+#define DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE	7
+
 /* DRM_IOCTL_SET_CLIENT_CAP ioctl argument type */
 struct drm_set_client_cap {
 	__u64 capability;
@@ -1288,6 +1303,9 @@ extern "C" {
  */
 #define DRM_IOCTL_MODE_CLOSEFB		DRM_IOWR(0xD0, struct drm_mode_closefb)
 
+#define DRM_IOCTL_MODE_GETCOLOROPRESOURCES DRM_IOWR(0xD0, struct drm_mode_get_colorop_res)
+#define DRM_IOCTL_MODE_GETCOLOROP          DRM_IOWR(0xD1, struct drm_mode_get_colorop)
+
 /*
  * Device specific ioctls should only be in their respective headers
  * The device specific ioctl range is from 0x40 to 0x9f.
diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index 7040e7ea80c7..f16318f1785f 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -629,6 +629,7 @@ struct drm_mode_connector_set_property {
 #define DRM_MODE_OBJECT_FB 0xfbfbfbfb
 #define DRM_MODE_OBJECT_BLOB 0xbbbbbbbb
 #define DRM_MODE_OBJECT_PLANE 0xeeeeeeee
+#define DRM_MODE_OBJECT_COLOROP 0xfafafafa
 #define DRM_MODE_OBJECT_ANY 0
 
 struct drm_mode_obj_get_properties {
@@ -865,6 +866,11 @@ struct drm_color_lut {
 	__u16 reserved;
 };
 
+enum drm_colorop_type {
+	DRM_COLOROP_1D_CURVE,
+	DRM_COLOROP_CTM_3X4,
+};
+
 /**
  * struct hdr_metadata_infoframe - HDR Metadata Infoframe Data.
  *
-- 
2.42.0

