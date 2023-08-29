Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C83478C8F8
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 17:59:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B15110E3D0;
	Tue, 29 Aug 2023 15:58:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B37E10E3C7;
 Tue, 29 Aug 2023 15:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693324726; x=1724860726;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rB6jTV1QKl1OfUoWo3vsbFXqCa6j/dbf0RZ5sbKnuU0=;
 b=bHb2EeR6HFdgkLAGvNZUm24Mej4YXVke1GXyjqGeDs2f7ql9m1sxCM6Z
 yAqdvaBxTSILIUHJ7Hlb+N0oJYF5d0lWpwiuqJ8IF8seRWTIlOIsXV7Tt
 RCK6sLTbeYx2HxBHFmuxAh65GPeko+64faS95yXOZ3aIZbZZa+mA8cASL
 4QPueM5XXJxkZjlMfnDVUIhNd9VPBU9jcAuQDGnb6tgTH38b0/u/bc1Mc
 r42efXzzNgE5D7b/uo8sZ/2hgQmQpVmY8k4z89Yq31lvRYSjFpWVx+GQY
 4AugtQx7RsCAQ6AK3/zlGtDMCs+Fx/zYob9B7ku8/YyGOXYAuMPpxW3TR w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="441769171"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="441769171"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 08:58:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="688554889"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="688554889"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by orsmga003.jf.intel.com with ESMTP; 29 Aug 2023 08:58:44 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC 01/33] drm/doc/rfc: Add RFC document for proposed Plane Color
 Pipeline
Date: Tue, 29 Aug 2023 21:33:50 +0530
Message-ID: <20230829160422.1251087-2-uma.shankar@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230829160422.1251087-1-uma.shankar@intel.com>
References: <20230829160422.1251087-1-uma.shankar@intel.com>
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
Cc: Uma Shankar <uma.shankar@intel.com>,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 wayland-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the documentation for the new proposed Plane Color Pipeline.

Co-developed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 .../gpu/rfc/plane_color_pipeline.rst          | 394 ++++++++++++++++++
 1 file changed, 394 insertions(+)
 create mode 100644 Documentation/gpu/rfc/plane_color_pipeline.rst

diff --git a/Documentation/gpu/rfc/plane_color_pipeline.rst b/Documentation/gpu/rfc/plane_color_pipeline.rst
new file mode 100644
index 000000000000..60ce515b6ea7
--- /dev/null
+++ b/Documentation/gpu/rfc/plane_color_pipeline.rst
@@ -0,0 +1,394 @@
+=======================================
+ Plane Color Pipeline: A UAPI proposal
+=======================================
+
+To build the proposal on, lets take the premise of a color pipeline as shown
+below.
+
+ +-------------------------------------------+
+ |                RAM                        |
+ |  +------+    +---------+    +---------+   |
+ |  | FB 1 |    |  FB 2   |    | FB N    |   |
+ |  +------+    +---------+    +---------+   |
+ +-------------------------------------------+
+       |  Plane Color Hardware Block |
+ +--------------------------------------------+
+ | +---v-----+   +---v-------+   +---v------+ |
+ | | Plane A |   | Plane B   |   | Plane N  | |
+ | | Pre-CSC |   | Pre-CSC   |   | Pre-CSC  | |
+ | +---+-----+   +---+-------+   +---+------+ |
+ |     |             |               |        |
+ | +---v-----+   +---v-------+   +---v------+ |
+ | |Plane A  |   | Plane B   |   | Plane N  | |
+ | |CSC/CTM  |   | CSC/CTM   |   | CSC/CTM  | |
+ | +---+-----+   +----+------+   +----+-----+ |
+ |     |              |               |       |
+ | +---v-----+   +----v------+   +----v-----+ |
+ | | Plane A |   | Plane B   |   | Plane N  | |
+ | |Post-CSC |   | Post-CSC  |   | Post-CSC | |
+ | +---+-----+   +----+------+   +----+-----+ |
+ |     |              |               |       |
+ +--------------------------------------------+
++------v--------------v---------------v-------|
+||                                           ||
+||           Pipe Blender                    ||
++--------------------+------------------------+
+|                    |                        |
+|        +-----------v----------+             |
+|        |  Pipe Pre-CSC        |             |
+|        |                      |             |
+|        +-----------+----------+             |
+|                    |            Pipe Color  |
+|        +-----------v----------+ Hardware    |
+|        |  Pipe CSC/CTM        |             |
+|        |                      |             |
+|        +-----------+----------+             |
+|                    |                        |
+|        +-----------v----------+             |
+|        |  Pipe Post-CSC       |             |
+|        |                      |             |
+|        +-----------+----------+             |
+|                    |                        |
++---------------------------------------------+
+                     |
+                     v
+                Pipe Output
+
+Each plane consists of the following color blocks
+ * Pre-CSC : This block can used to linearize the input frame buffer data.
+             The linear data then can be further acted on by the following
+             color hardware blocks in the display hardware pipeline
+
+ * CSC/CTM: Used to program color transformation matrix, this block is used
+            to perform color space conversions like BT2020 to BT709 or BT601
+            etc. This block acts on the linearized data coming from the
+            Pre-CSC HW block.
+
+ * Post-CSC: This HW block can be used to non-linearize frame buffer data to
+             match the sink. Another use case of it could be to perform Tone
+             mapping for HDR use-cases.
+
+Data from multiple planes will then be fed to pipe/crtc where it will get blended.
+There is a similar set of HW blocks available at pipe/crtc level which acts on
+this blended data.
+
+Below is a sample usecase fo video playback with sub-titles and playback
+controls
+
+┌────────────┐    ┌─────────────┐     ┌─────────────┐    ┌─────────────┐
+│FB1         │    │PRE-CSC      │     │ CTM Matrix  │    │ POST-CSC    │
+│            ├───►│Linearize    ├────►│ BT709 to    ├───►│ SDR to HDR  │
+│BT709 SDR   │    │             │     │ BT2020      │    │ Tone Mapping├─────┐
+└────────────┘    └─────────────┘     └─────────────┘    └─────────────┘     │
+(subtitles)                                                                  │
+                                                                             │
+┌────────────┐    ┌─────────────┐     ┌─────────────┐    ┌─────────────┐     │
+│FB2         │    │PRE-CSC      │     │ CTM Matrix  │    │ POST-CSC    │     │
+│            ├───►│Linearize    ├────►│ BT601 to    ├───►│ SDR to HDR  ├───┐ │
+│BT601 SDR   │    │             │     │ BT2020      │    │ Tone Mapping│   │ │
+└────────────┘    └─────────────┘     └─────────────┘    └─────────────┘   │ │
+(Playback controls UI)                                                     │ │
+                                                                           │ │
+┌────────────┐    ┌─────────────┐     ┌─────────────┐    ┌─────────────┐   │ │
+│FB2         │    │PRE-CSC      │     │ CTM Matrix  │    │ POST-CSC    │   │ │
+│            ├───►│Linearize    ├────►│ BT601 to    ├───►│ SDR to HDR  ├─┐ │ │
+│BT2020 HDR  │    │             │     │ pass-through│    │ pass-through│ │ │ │
+└────────────┘    └─────────────┘     └─────────────┘    └─────────────┘ │ │ │
+(video frame)                                                            │ │ │
+                                                                         │ │ │
+┌────────────────────────────────────────────────────────────────────────┴─┴─┘
+│
+│ ┌─────────────┐      ┌─────────────┐      ┌───────────────┐
+│ │ CRTC        │      │ CRTC        │      │ CRTC          │
+└─┤ PRE-CSC     ├─────►│ CSC/CTM     ├─────►│ POST-CSC      ├─────► TO Port
+  │             │      │             │      │               │
+  └─────────────┘      └─────────────┘      └───────────────┘
+
+This RFC is intended to propose an uAPI for the pre-blending color pipeline
+(however, can be also extended to post blending pipeline).
+
+Below are the design considerations while designing the uAPI.
+
+1. Individual HW blocks can be muxed. (e.g. out of two HW blocks only one can be used)
+2. Position of the HW block can be programmable
+3. LUTs can be one dimentional or three dimentional
+4. Number of LUT entries can vary across platforms
+5. Precision of LUT entries can vary across platforms
+6. Distribution of LUT entries may vary. e.g Mutli-segmented, Logarithmic,
+   Piece-Wise Linear(PWL) etc
+7. There can be parameterized/non-parameterized fixed function HW blocks.
+   e.g. Just a hardware bit, to convert from one color space to another.
+
+Plane Color Pipeline: Design Proposal
+=====================================
+Each Color Hardware block will be represented by the structure drm_color_op.
+
+struct drm_color_op {
+	enum color_op_block name;
+	enum color_op_type type;
+	u32 blob_id;
+	u32 private_flags;
+};
+
+The members of which will constitute:
+1. name: A standardised enum for the color hardware block
+2. type: The type of mathematical operation done by the hardware block.
+         e.g. 1D Curve, 3D Curve, Matrix etc.
+3. blob id: Id  pointing to a blob containing information about the hardware
+         block advertising the respective capabilities to the userspace.
+         It can be an optional field depending on the members "name" and "type".
+4. private_flags: This can be used to provide vendor specific hints
+         to user space
+
+
+   For example to represent LUTs, we introduce the drm_color_lut_range
+   structure. It can represent LUTs with varied number of entries and
+   distributions (Multi segmented, Logarithmic etc).
+
+   struct drm_color_lut_range {
+		/* DRM_MODE_LUT_* */
+		__u32 flags;
+		/* number of points on the curve */
+		__u16 count;
+		/* input/output bits per component */
+		__u8 input_bpc, output_bpc;
+		/* input start/end values */
+		__s32 start, end;
+		/* output min/max values */
+		__s32 min, max;
+   };
+
+Note: More details on exact usage and implementation of this structure can be
+      found in the RFC. This structure is taken as is from the series.
+      https://patchwork.freedesktop.org/series/90825/
+      However, we can add more members to it to encompass all use-cases.
+      For example. we can add a precision field to advertise the
+      bitdepth of the LUTs. Similarly, we can reserve some bits in the flag
+      field for vendor specific use cases.
+
+      At the same time, we don't need to pass any additional information for the
+      CSC block as userspace and driver already agrees struct drm_color_ctm as
+      a uAPI to pass on data.
+
+These color operations will form the building blocks of a color pipeline which
+best represents the underlying Hardware. Color operations can be re-arranged,
+substracted or added to create distinct color pipelines to accurately describe
+the Hardware blocks present in the display engine.
+
+In this proposal, a color pipeline is represented as an array of
+struct drm_color_op.
+
+struct drm_color_op color_pipeline_1[]
+
+For example to represent the pre-blending color pipeline as described above
+
+We can create a color pipeline like this.
+
+struct drm_color_op color_pipeline_1[] = {
+	{
+		.name = DRM_CB_PRE_CSC,
+		.type = CURVE_1D,
+		.blob_id = 0; /* actual value to be populated during plane
+						 initialization*/
+	},
+	{
+		.name = DRM_CB_CSC,
+		.type = MATRIX,
+		.blob_id = 0;
+	},
+	{
+		.name = DRM_CB_POST_CSC,
+		.type = CURVE_1D,
+		.blob_id = 0;
+	},
+};
+
+Then, for individual color operation, we add blobs to advertise the capability
+of the particular Hardware block. In case of the example pipeline, we add
+blobs of type drm_color_lut_range for the "pre-csc" and "post-csc".
+For the "csc" block we pass no blob id to user space as it is known to both
+user space and driver that drm_color_ctm structure is to be used for such
+operation.
+
+To represent, this in a diagram.
+
+   struct drm_color_op color_pipeline_1[]
+      +---------------------------+
+      |                           |           drm_color_op
+      |  +---------------------+--+-----------+---------------------+
+      |  |                     |  |           |                     |
+      |  |                     |  |           | +-----------------+ |
+      |  |                     |  |           | |     name        | |
+      |  |                     |  |           | +-----------------+ |
+      |  |                     |  |           | |     type        | |
+      |  |    color_op_1       |  |           | +-----------------+ |
+      |  |                     |  |           | |     blob id     | +--------+
+      |  |                     |  |           | +-----------------+ |        |
+      |  |                     |  |           | |     private     | |        |
+      |  |                     |  |           | |      flags      | |        |
+      |  |                     |  |           | +-----------------+ |        |
+      |  |                     |  |           |                     |        |
+      |  +---------------------+--+-----------+---------------------+        |
+      |                           |                                          |
+      |                           |                                          |
+      |  +---------------------+  |                                          |
+      |  |                     |  |           drm_color_lut_range            |
+      |  |    color_op_2       |  |           +-------------------------+    |
+      |  |                     |  |           |                         |    |
+      |  |                     |  |           | +---------------------+ |    |
+      |  +---------------------+  |           | | segment 1 {         | |<---+
+      |                           |           | |  ...                | |
+      |  +---------------------+  |           | |  .input_bpc = 16,   | |
+      |  |                     |  |           | |  .output_bpc = 16,  | |
+      |  |    color_op_3       |  |           | |  ...                | |
+      |  |                     |  |           | | }                   | |
+      |  |                     |  |           | +---------------------+ |
+      |  +---------------------+  |           |                         |
+      |             .             |           | +---------------------+ |
+      |             .             |           | | segment 2 {         | |
+      |             .             |           | | ...                 | |
+      +---------------------------+           | | }                   | |
+                                              | |                     | |
+                                              | |                     | |
+                                              | |                     | |
+                                              | +---------------------+ |
+                                              |            .            |
+                                              |            .            |
+                                              |            .            |
+                                              +-------------------------+
+
+
+
+This color pipeline is then packaged within a blob for the user space to
+retrieve it. Details can be found in the next section
+
+Exposing a color pipeline to user space
+=======================================
+
+To advertise the available color pipelines, an immutable ENUM property
+"GET_COLOR_PIPELINE" is introduced.
+This enum property has blob id's as values. With each blob id representing
+a distinct color pipeline based on underlying HW capabilities and their
+respective combinations.
+
+The following output of drm_info [1], shows how color pipelines are visible
+to userspace.
+
+├───Plane 0
+    │   ├───Object ID: 31
+    │   ├───CRTCs: {0}
+    │   ├───Legacy info
+        ...
+    │       ├───"GET_COLOR_PIPELINE" (immutable): enum {no color pipeline,
+						color pipeline 1, color pipeline 2}= no color pipeline
+
+To understand the capabilities of individual pipelines, first the userspace
+need to retrieve the pipeline blob with the blob ids retrieved by reading the
+enum property.
+
+Once the color pipeline is retrieved, user can then parse through
+individual drm_color_op blocks to understand the capabilities of each
+hardware block.
+
+Check IGT series to see how user space can parse through color pipelines.
+Refer the IGT series here: https://patchwork.freedesktop.org/series/123018/
+
+Setting up a color pipeline
+===========================
+
+Once the user space decides on a color pipeline, it can set the pipeline and
+the corresponding data for the hardware blocks within the pipeline with
+the BLOB property "SET_COLOR_PIPELINE".
+
+To achieve this two structures are introduced
+
+1.	struct drm_color_op_data: It represents data to be passed onto individual
+							  color hardware blocks. It contains three members
+                      a) name: to identify the color operation block
+                      b) blob_id: pointing to the blob with data for the
+                                  corresponding hardware block
+
+	struct drm_color_op_data {
+		enum color_op_block name;
+		u32 blob_id;
+	};
+
+2.	struct drm_color_pipeline: This structure represents the aggregate
+                                   pipeline to be set. it contains the following  members
+					  a) num: pipeline number to be selected
+					  b) size: size of the data to be passed onto the driver
+					  c) data: array of struct drm_color_op_data with data for
+                                                   the hardware block/s that userspace wants to
+                                                   set values for.
+
+	struct drm_color_pipeline {
+		int num;
+		int size;
+		struct drm_color_op_data *data;
+	};
+
+	User can either:
+	1. send data for all the color operations in a pipeline as shown in [2].
+	   The color operation data need not be in order that the pipeline advertises
+	   however, it should not contain data for any
+	   color operation that is not present in the pipeline.
+
+	   Note: This check for pipeline is not yet implemented but if the
+	   wider proposal is accepted we have few solutions in mind.
+
+	2. send data for a subset of color operations as shown in [3].For the
+	   color operation that userspace does not send data will retain their
+	   older state.
+
+	3. reset/disable the pipeline by setting the "SET_COLOR_PIPELINE" blob
+	   property to NULL as shown in both [2] and [3]
+
+	4. change the color pipeline as demonstrated in [3].
+	   On the new pipeline, the user is expected to setup all the color hardware block
+	   Once the user requests a pipeline change, the driver will provide it a clean slate
+           which means that all the data previously set by the user will be discarded even if
+           there are common hardware blocks between the two(previous and current) pipelines.
+
+IGT implementation can be found here [4]
+
+Representing Fixed function hardware
+====================================
+
+To provide support for fixed function hardware, the driver could expose vendor
+specific struct drm_color_op with parameters that both the userspace and
+driver agrees on. To demonstrate, let's consider a hyphothetical fixed
+function hardware block that converts BT601 to BT2020.
+The driver can choose to advertise the block as such.
+
+struct drm_color_op color_pipeline_X[] = {
+	{
+		.name = DRM_CB_PRIVATE,
+		.type = FIXED_FUNCTION,
+		.blob_id = 45;
+	},
+}
+
+Where the blob represents some vendor specific enums, strings or any other
+appropriate data types which both the user-space and drivers are aligned on.
+
+blob:45 {
+	VENDORXXX_BT602_TO_BT2020,
+};
+
+For enabling or passing parameters to such blocks, the user can send data
+to the driver wrapped within a blob like any other color operation block.
+
+	struct drm_color_op_data {
+		.name = DRM_CB_PRIVATE;
+		.blob_id = 46;
+	} ;
+
+where blob with id 46 contains data to enable the fixed function hardware(s).
+
+References
+==========
+
+[1] https://gitlab.freedesktop.org/emersion/drm_info
+[2] https://patchwork.freedesktop.org/patch/554827/?series=123018&rev=1
+[3] https://patchwork.freedesktop.org/patch/554826/?series=123018&rev=1
+[4] https://patchwork.freedesktop.org/series/123018/
-- 
2.38.1

