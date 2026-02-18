Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iClBOrFolWk/QgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 08:22:25 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8EE153A07
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 08:22:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2B6D10E56D;
	Wed, 18 Feb 2026 07:22:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VluP5KnL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C092910E2E2;
 Wed, 18 Feb 2026 07:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771399343; x=1802935343;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gjnKdCZ4v6NKS1Ua9hQ4cf8K7q4wGogSui2GXqQG478=;
 b=VluP5KnLcThkpJXAlKbm7nQNufYV6h7ayMuUWzOaHKKlBZKhqWMHvFll
 DHsmuBNjioLCVC851g9ED8iKLisMiy8cCecc9lvmikfC3SIJbpvyUy1Xd
 IRgrCJLju1cdkgDdPteKyqnL/CnBD+1V/Zde554nGjuim3CxEPAzC8nv+
 siJlks/lesXz0wp4dfPkXNGTtIb30POOgEnU9ICCZiS2QeNv5dEo480Sq
 x54eb7fq2hrw3n5YmFyhC3DmQi9Xgf7yOvml7R1pw/1PrNQ9LJiwK0Nqo
 YkeRGpci3CBypWB6IY8jNDAypUe16Dmd/aIdQtdYwRSaw9HZcuzFOhYRA g==;
X-CSE-ConnectionGUID: 80W16FLoQ46cDlM0DZSe3A==
X-CSE-MsgGUID: AzGbCsU0SRutoz0fgcXMcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11704"; a="72519033"
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; d="scan'208";a="72519033"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2026 23:22:23 -0800
X-CSE-ConnectionGUID: mMRvToXyRey7KPCa7bk7NQ==
X-CSE-MsgGUID: MpeeHAJhTk67uOgFJ9r8mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; d="scan'208";a="213208222"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by orviesa006.jf.intel.com with ESMTP; 17 Feb 2026 23:22:18 -0800
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: contact@emersion.fr, alex.hung@amd.com, harry.wentland@amd.com,
 daniels@collabora.com, mwen@igalia.com, sebastian.wick@redhat.com,
 uma.shankar@intel.com, ville.syrjala@linux.intel.com,
 maarten.lankhorst@linux.intel.com, jani.nikula@intel.com,
 louis.chauvet@bootlin.com, stable@vger.kernel.org,
 chaitanya.kumar.borah@intel.com
Subject: [PATCH 0/2] drm/colorop: Keep colorop state consistent across atomic
 commits
Date: Wed, 18 Feb 2026 12:27:11 +0530
Message-Id: <20260218065713.326417-1-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.25.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[emersion.fr:email,collabora.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FROM_NEQ_ENVFROM(0.00)[chaitanya.kumar.borah@intel.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_NONE(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Queue-Id: 6F8EE153A07
X-Rspamd-Action: no action

This series aims to keep colorop state consistent across atomic
transactions by ensuring it accurately reflects committed hardware
state and remains part of the atomic update whenever its associated
plane is involved.

It contains two changes:
- Preserves the bypass value in duplicated colorop state.

_drm_atomic_helper_colorop_duplicate_state() unconditionally reset
bypass to true, which means the duplicated state no longer reflects the
committed hardware state. Since bypass directly controls whether the
colorop is active in hardware, this can lead to an unintended disable
during subsequent commits.

This could potentially be a problem also for colorops where bypass value
is immutably false.

Conceptually, I consider 'bypass' to behave similar to 'visible' in plane 
state - it represents current HW state and should therefore be preserved
across duplication.

- Add affected colorops with affected plane

Colorops are unique in the DRM model. While they are DRM objects with their
own states, they are logically attached to a plane and exposed through
a plane property. In some sense, they share the same hierarchy as CRTC and
planes while following a different 'ownership' model.

Given that enabling a CRTC pulls in all its affected planes into the atomic
state, it follows that when a plane is added, its associated colorops are
also included. Otherwise, during modesets or internal commits, colorop state
may be missing from the transaction, resulting in inconsistent or incomplete
state updates.

That said, I do have a concern about potentially inflating the atomic
state by automatically pulling in colorops from the core. It is not
entirely clear to me whether inclusion of affected colorops should be
handled in core, or left to individual drivers.

My understanding of the atomic framework is still evolving, so
I would appreciate feedback from those more familiar with the intended
design direction.

==
Chaitanya

P.S/Background/TL;DR:

I discovered inconsistency with the colorop state while analysing CRC mismatches
in kms_color_pipeline test cases[1]. Visual inspection reveals that while CRC is
being collected degamma block has been reset. This was traced back to the internal
commit that the driver does to disable PSR2 and selective fetch for CRC collection.

crtc_crc_open
    -> intel_crtc_set_crc_source
        -> intel_crtc_crc_setup_workarounds
            -> drm_atomic_commit

During this flow colorop states are never added to the atomic state which in turn
makes intel_plane_color_copy_uapi_to_hw_state() disable the colorops.

If we add the colorops, to the atomic state, the problem still persisted because
while duplicating the colorop state, 'bypass' was getting reset to true.

The two changes made in this series fixes the issue.

[1] https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18001/shard-mtlp-6/igt@kms_color_pipeline@plane-lut1d.html

Cc: Simon Ser <contact@emersion.fr>
Cc: Alex Hung <alex.hung@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Daniel Stone <daniels@collabora.com>
Cc: Melissa Wen <mwen@igalia.com>
Cc: Sebastian Wick <sebastian.wick@redhat.com>
Cc: Alex Hung <alex.hung@amd.com>
Cc: Uma Shankar <uma.shankar@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: <stable@vger.kernel.org> #v6.19+

Chaitanya Kumar Borah (2):
  drm/colorop: Preserve bypass value in duplicate_state()
  drm/atomic: Add affected colorops with affected planes

 drivers/gpu/drm/drm_atomic.c  | 5 +++++
 drivers/gpu/drm/drm_colorop.c | 2 --
 2 files changed, 5 insertions(+), 2 deletions(-)

-- 
2.25.1

