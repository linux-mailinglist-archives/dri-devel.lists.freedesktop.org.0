Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 327DC78C8F6
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 17:58:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2541B10E3C6;
	Tue, 29 Aug 2023 15:58:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D16CC10E3C6;
 Tue, 29 Aug 2023 15:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693324724; x=1724860724;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Cm7SZ4yqGMUbsrNjmFtoFxInf4PhL7C9YdsAZ1T4RLU=;
 b=Rp+iE7LEsJeead3+3RSuFSFGxuOrP4SSi0NgwUiR9nBl9jSQWAKJVx0A
 w0mUNgFTFUbUJPyPgA05CSBzns9rzoXnGjlgeVcSwLgukpAIgS8F4pOkd
 79tp8KLe1+4aR5D5oMD5aWtKZKwMJsjgHA9MU10bXPWj3yaaDVNRDlvxK
 b1ofvH5/yLgkgdKdX5gj7PQS2pAS3K6vSiXWr6TQrqy6bmdX43F6uSEy1
 4x+3Fq2siXaUSiGfzsbJYpnaQkeJjrQCnvgVUl5s2hfqnAwjOAH8mgdio
 6KBSobEH7iJHCeSGykuakNegKt0gjrGCR1FRg5sStLJgVE1UOgMWPl/Mx Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="441769157"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="441769157"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 08:58:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="688554867"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="688554867"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by orsmga003.jf.intel.com with ESMTP; 29 Aug 2023 08:58:39 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC 00/33] Add Support for Plane Color Pipeline
Date: Tue, 29 Aug 2023 21:33:49 +0530
Message-ID: <20230829160422.1251087-1-uma.shankar@intel.com>
X-Mailer: git-send-email 2.42.0
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Shashank Sharma <shashank.sharma@amd.com>, wayland-devel@lists.freedesktop.org,
 Melissa Wen <mwen@igalia.com>,
 =?UTF-8?q?Jonas=20=C3=85dahl?= <jadahl@redhat.com>,
 Uma Shankar <uma.shankar@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Introduction
============

Modern hardwares have various color processing capabilities both
at pre-blending and post-blending phases in the color pipeline.
The current drm implementation exposes only the post-blending
color hardware blocks. Support for pre-blending hardware is missing.
There are multiple use cases where pre-blending color hardware will
be useful:
	a) Linearization of input buffers encoded in various transfer
	   functions.
	b) Color Space conversion
	c) Tone mapping
	d) Frame buffer format conversion
	e) Non-linearization of buffer(apply transfer function)
	f) 3D Luts
	
and other miscellaneous color operations.

Hence, there is a need to expose the color capabilities of the hardware
to user-space. This will help userspace/middleware to use display
hardware for color processing and blending instead of doing it through
GPU shaders.


Work done so far and relevant references
========================================

Some implementation is done by Intel and AMD/Igalia to address the same.
Broad consensus is there that we need a generic API at drm core to suffice
the use case of various HW vendors. Below are the links capturing the
discussion so far.

Intel's Plane Color Implementation: https://patchwork.freedesktop.org/series/90825/
AMD's Plane Color Implementation: https://patchwork.freedesktop.org/series/116862/


Hackfest conclusions
====================

HDR/Color Hackfest was organised by Redhat to bring all the industry stakeholders
together and converge on a common uapi expectations. Participants from Intel, AMD,
Nvidia, Collabora, Redhat, Igalia and other prominent user-space developers and
maintainers.

Discussions happened on the uapi expectations, opens, nature of hardware of multiple
hardware vendors, challenges in generalizing the same and the path forward. Consensus
was made that drm core should implement descriptive APIs and not go with prescriptive
APIs. DRM core should just expose the hardware capabilities; enabling, customizing and
programming the same should be done by the user-space. Driver should just honor
the user space request without doing any operations internally.

Thanks to Simon Ser, for nicely documenting the design consensus and an UAPI RFC
which can be referred to here:

https://lore.kernel.org/dri-devel/QMers3awXvNCQlyhWdTtsPwkp5ie9bze_hD5nAccFW7a_RXlWjYB7MoUW_8CKLT2bSQwIXVi5H6VULYIxCdgvryZoAoJnC5lZgyK1QWn488=@emersion.fr/


Design considerations
=====================

Following are the important aspects taken into account while designing the current RFC
proposal:

	1. Individual HW blocks can be muxed. (e.g. out of two HW blocks only one can be used)
	2. Position of the HW block in the pipeline can be programmable
	3. LUTs can be one dimentional or three dimentional
	4. Number of LUT entries can vary across platforms
	5. Precision of LUT entries can vary across platforms
	6. Distribution of LUT entries may vary. e.g Mutli-segmented, Logarithmic,
	   Piece-Wise Linear(PWL) etc
	7. There can be parameterized/non-parameterized fixed function HW blocks.
	   e.g. Just a hardware bit, to convert from one color space to another.
	8. Custom non-standard HW implementation.
	9. Leaving scope for some vendor defined pescriptive implementation if required.
	10.Scope to handle any modification in hardware as technology evolves

The current proposal takes into account the above considerations while keeping the implementation
as generic as possible leaving scope for future additions or modifications.
 
This proposal is also in line to the details mentioned by Simon's RFC covering all
the aspects discussed in hackfest.


Outline of the implementation
============================

Each Color Hardware block will be represented by a data structure drm_color_op.
These color operations will form the building blocks of a color pipeline which
best represents the underlying Hardware. Color operations can be re-arranged,
substracted or added to create distinct color pipelines to accurately describe
the Hardware blocks present in the display engine.

In this proposal, a color pipeline is represented as an array of
struct drm_color_op. For individual color operation, we add blobs to advertise
the capability of the particular Hardware block.

This color pipeline is then packaged within a blob for the user space to
retrieve it.

To advertise the available color pipelines, an immutable ENUM property
"GET_COLOR_PIPELINE" is introduced. This enum property has blob id's as values.
With each blob id representing a distinct color pipeline based on underlying HW
capabilities and their respective combinations.

Once the user space decides on a color pipeline, it can set the pipeline and
the corresponding data for the hardware blocks within the pipeline with
the BLOB property "SET_COLOR_PIPELINE".

Refer to Documentation/gpu/rfc/plane_color_pipeline.rst added in the patch

IGT and test details
====================

A set of IGT tests is written to demonstrate the usage of the proposed UAPIs
along with some sanity validation.

Details of the IGT test can be found here:
https://patchwork.freedesktop.org/series/123018/

Opens
=====

a. To come up with a list of common HW blocks which can be defined generically by the DRM
   core in agreement with all the stakeholders
b. To enhance/finalize the data structure to define segmented LUTs generically.


Out of Scope
============

a. The coefficients for CTM and LUT value calculations are out of scope of the proposal.
b. The onus of programming the HW blocks and their values is on user-space. Driver will
   just provide the interface for the same.
c. In order to compute LUT values and coefficients, a helper library can be created in
   user-space. However, it is out of scope for the current proposal.

Acknowledgements and credits
============================

There are multiple contributors who have helped us to reach to this proposal. Special mention
to Ville Syrjala<ville.syrjala@linux.intel.com>, Pekka Paalanen<pekka.paalanen@collabora.com>,
Simon Ser<contact@emersion.fr>, Harry Wentland<harry.wentland@amd.com>,
Melissa Wen<mwen@igalia.com>, Jonas<jadahl@redhat.com>, Sebastian Wick<sebastian.wick@redhat.com>,
Bhanu<bhanuprakash.modem@intel.com> and Shashank<shashank.sharma@amd.com>.

Also, thanks to Carlos <csoriano@redhat.com> and the Redhat team for organizing the HDR hackfest.


UAPI dependency and Usermode development
========================================

The current KMS implementation requires a user space consumer for it to be accepted upstream.
Work is ongoing in weston and mutter community to get color management and HDR support implemented
in the respective stacks.

=================================================================================

We have tried to take care of all the scenarios and use-cases which possibly could exists in the
current proposal. Thanks to everyone who has contributed in all color management discussions so
far. Let's work together to improve the current proposal and get this thing implemented in
upstream linux. All the feedback and suggestions to enhance the design are welcome.

Regards,
Uma Shankar
Chaitanya Kumar Borah

Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
Cc: Simon Ser <contact@emersion.fr>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Melissa Wen <mwen@igalia.com>
Cc: Jonas Ådahl <jadahl@redhat.com>
Cc: Sebastian Wick <sebastian.wick@redhat.com> 
Cc: Shashank Sharma <shashank.sharma@amd.com>
Cc: Alexander Goins <agoins@nvidia.com>

Chaitanya Kumar Borah (14):
  drm: Add color operation structure
  drm: Add plane get color pipeline property
  drm: Add helper to add color pipeline
  drm: Manage color blob states
  drm: Replace individual color blobs
  drm: Reset pipeline when user sends NULL blob
  drm: Reset plane color state on pipeline switch request
  drm/i915/color: Add HDR plane LUT range data to color pipeline
  drm/i915/color: Add SDR plane LUT range data to color pipeline
  drm/i915/color: Add color pipelines to plane
  drm/i915/color: Create and attach set color pipeline property
  drm/i915/color: Enable plane color features
  drm/i915/color: Add a dummy pipeline with 3D LUT
  drm/i915/color: Add example implementation for vendor specific color
    operation

Uma Shankar (19):
  drm/doc/rfc: Add RFC document for proposed Plane Color Pipeline
  drm: Add structures for setting color pipeline
  drm: Add set colorpipeline property
  drm: Add Enhanced Gamma LUT precision structure
  drm: Add color lut range structure
  drm: Add color information to plane state
  drm/i915/color: Add lut range for SDR planes
  drm/i915/color: Add lut range for HDR planes
  drm/i915/color: Add color pipeline for HDR planes
  drm/i915/color: Add color pipeline for SDR planes
  drm/i915/color: Add plane color callbacks
  drm/i915/color: Load plane color luts from atomic flip
  drm/i915/xelpd: Add plane color check to glk_plane_color_ctl
  drm/i915/xelpd: Add register definitions for Plane Degamma
  drm/i915/color: Add color functions for ADL
  drm/i915/color: Program Plane Pre-CSC Registers
  drm/i915/xelpd: Add register definitions for Plane Post CSC
  drm/i915/xelpd: Program Plane Post CSC Registers
  drm/i915/color: Enable Plane CSC

 .../gpu/rfc/plane_color_pipeline.rst          | 394 ++++++++++
 drivers/gpu/drm/drm_atomic_state_helper.c     |  21 +
 drivers/gpu/drm/drm_atomic_uapi.c             | 218 ++++++
 drivers/gpu/drm/drm_color_mgmt.c              | 130 ++++
 drivers/gpu/drm/i915/display/intel_color.c    | 684 +++++++++++++++++-
 drivers/gpu/drm/i915/display/intel_color.h    |   7 +-
 .../drm/i915/display/skl_universal_plane.c    |  21 +-
 drivers/gpu/drm/i915/i915_reg.h               | 124 ++++
 include/drm/drm_plane.h                       |  82 +++
 include/uapi/drm/drm_mode.h                   | 196 +++++
 include/uapi/drm/i915_drm.h                   |  25 +
 11 files changed, 1899 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/gpu/rfc/plane_color_pipeline.rst

-- 
2.38.1

