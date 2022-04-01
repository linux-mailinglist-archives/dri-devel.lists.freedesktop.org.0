Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C8A4EEF3E
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 16:22:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9A8E10E592;
	Fri,  1 Apr 2022 14:22:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4134210E557;
 Fri,  1 Apr 2022 14:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648822940; x=1680358940;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4c7H+o9bbN5SHTcoDTRpdDwGyvl2CdoUMprdcNjaIqs=;
 b=h6eAJn+YGLZR3ktU48y6V9KimWkcKK03NlUJPSGDp0W9J68fTTkhEDe/
 PGvtGu63IxuTPYKaROlnQIp472Dmo/OnFGDjogHFub5NLRYWJYeyPu8iw
 ZHYkQ4sth7Bfu1/ogdZ/v80D6KHy/jIzLpkYcbmBacs62oN0ZJ1MggoVj
 KkPzbKtekD0Z8ZtDxrcGeRGIh92k71ZMo4B6z8Mrls4nQkBs7fz8Bk5Tp
 7X3bK2MvUP4HlMx1hy0XmAoT6H2PVAFWSsNFkZ+LYcFNK4xy73nb8SG9O
 roZmFMzmIkuBmvX0DLdrImu1UhNApH8KX4s4Hr0AMOSYcAv6qzjTwRRJa A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10304"; a="240085462"
X-IronPort-AV: E=Sophos;i="5.90,227,1643702400"; d="scan'208";a="240085462"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2022 07:22:19 -0700
X-IronPort-AV: E=Sophos;i="5.90,227,1643702400"; d="scan'208";a="655753564"
Received: from ewanhaye-mobl.ger.corp.intel.com (HELO tursulin-mobl2.home)
 ([10.213.217.32])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2022 07:22:18 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Subject: [CI 6/8] drm: Document fdinfo format specification
Date: Fri,  1 Apr 2022 15:22:03 +0100
Message-Id: <20220401142205.3123159-7-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220401142205.3123159-1-tvrtko.ursulin@linux.intel.com>
References: <20220401142205.3123159-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Proposal to standardise the fdinfo text format as optionally output by DRM
drivers.

Idea is that a simple but, well defined, spec will enable generic
userspace tools to be written while at the same time avoiding a more heavy
handed approach of adding a mid-layer to DRM.

i915 implements a subset of the spec, everything apart from the memory
stats currently, and a matching intel_gpu_top tool exists.

Open is to see if AMD can migrate to using the proposed GPU utilisation
key-value pairs, or if they are not workable to see whether to go
vendor specific, or if a standardised  alternative can be found which is
workable for both drivers.

Same for the memory utilisation key-value pairs proposal.

v2:
 * Update for removal of name and pid.

v3:
 * 'Drm-driver' tag will be obtained from struct drm_driver.name. (Daniel)

v4:
 * Added drm-engine-capacity- tag.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: David M Nieto <David.Nieto@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Daniel Stone <daniel@fooishbar.org>
Cc: Chris Healy <cphealy@gmail.com>
Acked-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 Documentation/gpu/drm-usage-stats.rst | 106 ++++++++++++++++++++++++++
 Documentation/gpu/index.rst           |   1 +
 2 files changed, 107 insertions(+)
 create mode 100644 Documentation/gpu/drm-usage-stats.rst

diff --git a/Documentation/gpu/drm-usage-stats.rst b/Documentation/gpu/drm-usage-stats.rst
new file mode 100644
index 000000000000..b8cc28f4da6f
--- /dev/null
+++ b/Documentation/gpu/drm-usage-stats.rst
@@ -0,0 +1,106 @@
+.. _drm-client-usage-stats:
+
+======================
+DRM client usage stats
+======================
+
+DRM drivers can choose to export partly standardised text output via the
+`fops->show_fdinfo()` as part of the driver specific file operations registered
+in the `struct drm_driver` object registered with the DRM core.
+
+One purpose of this output is to enable writing as generic as practicaly
+feasible `top(1)` like userspace monitoring tools.
+
+Given the differences between various DRM drivers the specification of the
+output is split between common and driver specific parts. Having said that,
+wherever possible effort should still be made to standardise as much as
+possible.
+
+File format specification
+=========================
+
+- File shall contain one key value pair per one line of text.
+- Colon character (`:`) must be used to delimit keys and values.
+- All keys shall be prefixed with `drm-`.
+- Whitespace between the delimiter and first non-whitespace character shall be
+  ignored when parsing.
+- Neither keys or values are allowed to contain whitespace characters.
+- Numerical key value pairs can end with optional unit string.
+- Data type of the value is fixed as defined in the specification.
+
+Key types
+---------
+
+1. Mandatory, fully standardised.
+2. Optional, fully standardised.
+3. Driver specific.
+
+Data types
+----------
+
+- <uint> - Unsigned integer without defining the maximum value.
+- <str> - String excluding any above defined reserved characters or whitespace.
+
+Mandatory fully standardised keys
+---------------------------------
+
+- drm-driver: <str>
+
+String shall contain the name this driver registered as via the respective
+`struct drm_driver` data structure.
+
+Optional fully standardised keys
+--------------------------------
+
+- drm-pdev: <aaaa:bb.cc.d>
+
+For PCI devices this should contain the PCI slot address of the device in
+question.
+
+- drm-client-id: <uint>
+
+Unique value relating to the open DRM file descriptor used to distinguish
+duplicated and shared file descriptors. Conceptually the value should map 1:1
+to the in kernel representation of `struct drm_file` instances.
+
+Uniqueness of the value shall be either globally unique, or unique within the
+scope of each device, in which case `drm-pdev` shall be present as well.
+
+Userspace should make sure to not double account any usage statistics by using
+the above described criteria in order to associate data to individual clients.
+
+- drm-engine-<str>: <uint> ns
+
+GPUs usually contain multiple execution engines. Each shall be given a stable
+and unique name (str), with possible values documented in the driver specific
+documentation.
+
+Value shall be in specified time units which the respective GPU engine spent
+busy executing workloads belonging to this client.
+
+Values are not required to be constantly monotonic if it makes the driver
+implementation easier, but are required to catch up with the previously reported
+larger value within a reasonable period. Upon observing a value lower than what
+was previously read, userspace is expected to stay with that larger previous
+value until a monotonic update is seen.
+
+- drm-engine-capacity-<str>: <uint>
+
+Engine identifier string must be the same as the one specified in the
+drm-engine-<str> tag and shall contain a greater than zero number in case the
+exported engine corresponds to a group of identical hardware engines.
+
+In the absence of this tag parser shall assume capacity of one. Zero capacity
+is not allowed.
+
+- drm-memory-<str>: <uint> [KiB|MiB]
+
+Each possible memory type which can be used to store buffer objects by the
+GPU in question shall be given a stable and unique name to be returned as the
+string here.
+
+Value shall reflect the amount of storage currently consumed by the buffer
+object belong to this client, in the respective memory region.
+
+Default unit shall be bytes with optional unit specifiers of 'KiB' or 'MiB'
+indicating kibi- or mebi-bytes.
diff --git a/Documentation/gpu/index.rst b/Documentation/gpu/index.rst
index b9c1214d8f23..b99dede9a5b1 100644
--- a/Documentation/gpu/index.rst
+++ b/Documentation/gpu/index.rst
@@ -10,6 +10,7 @@ Linux GPU Driver Developer's Guide
    drm-kms
    drm-kms-helpers
    drm-uapi
+   drm-usage-stats
    driver-uapi
    drm-client
    drivers
-- 
2.32.0

