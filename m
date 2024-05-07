Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 344728BEFEA
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 00:44:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5AED11284C;
	Tue,  7 May 2024 22:44:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zia/GDyF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A2171126E2;
 Tue,  7 May 2024 22:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715121861; x=1746657861;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XBr0GQdnzId1kD+NH7fhmsHICfauMWGuVkV63TSE9C0=;
 b=Zia/GDyF15uZVOvr6l6sLhjlHvhvAjxFbejXX25q2bV88AK760aMUG7t
 Ym3jaZX13AR8rPV8WdjiypIsUqc0v2jI492LH4NDwZp+SyYmB0twv2EyX
 U3vHq8ry9APhq2p6MZnh55+rt7oqfUxu4xyG61fBDUU15HiU//2VxkdDP
 6hK25G1nQ84X7bGfnZVUA383lJGts+HNIqN797YmPIBfp9PhLPShXU9/X
 8K84djIwd72bthr2yoTRHu1EPID4OelSu2iSppzbBj73OEGwD9vleL62e
 wx/GGTC7J9Tzjx0T7Ceh/7Bbp3HWKhOvzqmOn1L3CxVDXuJXuBjjqvYuZ Q==;
X-CSE-ConnectionGUID: 6+QHdLA7SUSA/k2dlUWGvw==
X-CSE-MsgGUID: qIGYE7IfTJ6qNTjwSXoNOA==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="11108489"
X-IronPort-AV: E=Sophos;i="6.08,143,1712646000"; d="scan'208";a="11108489"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2024 15:44:20 -0700
X-CSE-ConnectionGUID: sn0N+AaIT9Wv+94Dox3nDw==
X-CSE-MsgGUID: JlKsqrcFRd6QgYmASDieNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,143,1712646000"; d="scan'208";a="29231494"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2024 15:44:20 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Tvrtko Ursulin <tursulin@ursulin.net>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 dri-devel@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v3 0/6] drm/xe: Per client usage
Date: Tue,  7 May 2024 15:45:04 -0700
Message-ID: <20240507224510.442971-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
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

Add per-client usage statistics to xe. This ports xe to use the common
method in drm to export the usage to userspace per client (where 1
client == 1 drm fd open).

However instead of using the current format measured in nsec, this
creates a new one. The intention here is not to mix the GPU clock domain
with the CPU clock. It allows to cover a few more use cases without
extra complications.

I tested this on DG2 and also checked gputop with i915 to make sure not
regressed. Last patch also contains the documentation for the new key
and sample output as requested in v1. Reproducing it partially here:

        - drm-total-cycles-<keystr>: <uint>

        Engine identifier string must be the same as the one specified in the
        drm-cycles-<keystr> tag and shall contain the total number cycles for the given
        engine.

        This is a timestamp in GPU unspecified unit that matches the update rate
        of drm-cycles-<keystr>. For drivers that implement this interface, the engine
        utilization can be calculated entirely on the GPU clock domain, without
        considering the CPU sleep time between 2 samples.

The pre-existent drm-cycles-<keystr> is used as is, which allows gputop
to work with xe.

This last patch still has some open discussion from v2, so we may need
to hold it a little more.

Test-with: 20240504064643.25863-1-lucas.demarchi@intel.com

v2:
  - Create a new drm-total-cycles instead of re-using drm-engine with a
    different unit
  - Add documentation for the new interface and clarify usage of
    xe_lrc_update_timestamp()

v3:
  - Fix bugs in "drm/xe: Add helper to accumulate exec queue runtime" -
    see commit message
  - Reorder commits so the ones that are useful in other patch series
    come first

Lucas De Marchi (4):
  drm/xe: Promote xe_hw_engine_class_to_str()
  drm/xe: Add XE_ENGINE_CLASS_OTHER to str conversion
  drm/xe: Add helper to capture engine timestamp
  drm/xe/client: Print runtime to fdinfo

Umesh Nerlige Ramappa (2):
  drm/xe/lrc: Add helper to capture context timestamp
  drm/xe: Add helper to accumulate exec queue runtime

 Documentation/gpu/drm-usage-stats.rst         |  16 ++-
 Documentation/gpu/xe/index.rst                |   1 +
 Documentation/gpu/xe/xe-drm-usage-stats.rst   |  10 ++
 drivers/gpu/drm/xe/regs/xe_lrc_layout.h       |   1 +
 drivers/gpu/drm/xe/xe_device_types.h          |   9 ++
 drivers/gpu/drm/xe/xe_drm_client.c            | 136 +++++++++++++++++-
 drivers/gpu/drm/xe/xe_exec_queue.c            |  35 +++++
 drivers/gpu/drm/xe/xe_exec_queue.h            |   1 +
 drivers/gpu/drm/xe/xe_execlist.c              |   1 +
 drivers/gpu/drm/xe/xe_guc_submit.c            |   2 +
 drivers/gpu/drm/xe/xe_hw_engine.c             |  27 ++++
 drivers/gpu/drm/xe/xe_hw_engine.h             |   3 +
 drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c |  18 ---
 drivers/gpu/drm/xe/xe_lrc.c                   |  11 ++
 drivers/gpu/drm/xe/xe_lrc.h                   |  14 ++
 drivers/gpu/drm/xe/xe_lrc_types.h             |   3 +
 16 files changed, 267 insertions(+), 21 deletions(-)
 create mode 100644 Documentation/gpu/xe/xe-drm-usage-stats.rst

-- 
2.43.0

