Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D4E86C9BF
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 14:08:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DB4210E0C5;
	Thu, 29 Feb 2024 13:07:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OSACl6xN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C49C10E08F;
 Thu, 29 Feb 2024 13:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709212074; x=1740748074;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=qZrjrJoQ7nPZZFqulomubYTs00zz6ojJVToACP2OeVo=;
 b=OSACl6xN6ZD4POa+tcQzdE63tYXN7L+0awFytxK3dInOMJgEXdAOkOdl
 5v+6Ng4vAYBKwQRXAFfQ97aNdQLbgdjCVAgtP+BxXllMwWyZnASNZwVKf
 mtslVgIiXInL5QQ/MNJs84NUGfdQtiaPMnIxUktnGrmZdKhGi04Dvag77
 eTL3rzSxcsew5pdMnax4EJiM/m8eNb32ayYkfr+JuvcxMSZy2iFPTs6rm
 wnae3joekZDsaxZd2bUnegmnrDIJthvxkShzWqjxwJtygMuplyVwUl0Ue
 bJ6NtssUapQ1NwQv/lcYJ+nIN5zSys12mQViK14bWyjHp0OU2qov5mRYa Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="15120438"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; d="scan'208";a="15120438"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 05:07:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; d="scan'208";a="12501066"
Received: from srdoo-mobl1.ger.corp.intel.com (HELO fedora) ([10.252.3.93])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 05:07:50 -0800
Date: Thu, 29 Feb 2024 14:07:36 +0100
From: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: [PULL] drm-xe-fixes
Message-ID: <ZeCBg4MA2hd1oggN@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
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

Dave, Sima

The xe fixes for -rc7. It's mostly uapi sanitizing and future-proofing,
and a couple of driver fixes.

drm-xe-fixes-2024-02-29:
UAPI Changes:
- A couple of tracepoint updates from Priyanka and Lucas.
- Make sure BINDs are completed before accepting UNBINDs on LR vms.
- Don't arbitrarily restrict max number of batched binds.
- Add uapi for dumpable bos (agreed on IRC).
- Remove unused uapi flags and a leftover comment.

Driver Changes:
- A couple of fixes related to the execlist backend.
- A 32-bit fix.

/Thomas


The following changes since commit 6650d23f3e20ca00482a71a4ef900f0ea776fb15:

  drm/xe: Fix modpost warning on xe_mocs kunit module (2024-02-21 11:06:52 +0100)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-fixes-2024-02-29

for you to fetch changes up to 8188cae3cc3d8018ec97ca9ab8caa3acc69a056d:

  drm/xe/xe_trace: Add move_lacks_source detail to xe_bo_move trace (2024-02-29 12:32:15 +0100)

----------------------------------------------------------------
UAPI Changes:
- A couple of tracepoint updates from Priyanka and Lucas.
- Make sure BINDs are completed before accepting UNBINDs on LR vms.
- Don't arbitrarily restrict max number of batched binds.
- Add uapi for dumpable bos (agreed on IRC).
- Remove unused uapi flags and a leftover comment.

Driver Changes:
- A couple of fixes related to the execlist backend.
- A 32-bit fix.
----------------------------------------------------------------
Arnd Bergmann (1):
      drm/xe/mmio: fix build warning for BAR resize on 32-bit

Francois Dugast (1):
      drm/xe/uapi: Remove unused flags

José Roberto de Souza (1):
      drm/xe/uapi: Remove DRM_XE_VM_BIND_FLAG_ASYNC comment left over

Lucas De Marchi (1):
      drm/xe: Use pointers in trace events

Maarten Lankhorst (1):
      drm/xe: Add uapi for dumpable bos

Matthew Brost (3):
      drm/xe: Fix execlist splat
      drm/xe: Don't support execlists in xe_gt_tlb_invalidation layer
      drm/xe: Use vmalloc for array of bind allocation in bind IOCTL

Mika Kuoppala (2):
      drm/xe: Expose user fence from xe_sync_entry
      drm/xe: Deny unbinds if uapi ufence pending

Paulo Zanoni (1):
      drm/xe: get rid of MAX_BINDS

Priyanka Dandamudi (2):
      drm/xe/xe_bo_move: Enhance xe_bo_move trace
      drm/xe/xe_trace: Add move_lacks_source detail to xe_bo_move trace

 drivers/gpu/drm/xe/xe_bo.c                  | 11 +++-
 drivers/gpu/drm/xe/xe_bo.h                  |  1 +
 drivers/gpu/drm/xe/xe_drm_client.c          | 12 +---
 drivers/gpu/drm/xe/xe_exec_queue.c          | 88 +----------------------------
 drivers/gpu/drm/xe/xe_exec_queue_types.h    | 10 ----
 drivers/gpu/drm/xe/xe_execlist.c            |  2 +-
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 12 ++++
 drivers/gpu/drm/xe/xe_lrc.c                 | 10 +---
 drivers/gpu/drm/xe/xe_mmio.c                |  2 +-
 drivers/gpu/drm/xe/xe_sync.c                | 58 +++++++++++++++----
 drivers/gpu/drm/xe/xe_sync.h                |  4 ++
 drivers/gpu/drm/xe/xe_sync_types.h          |  2 +-
 drivers/gpu/drm/xe/xe_trace.h               | 59 +++++++++++++------
 drivers/gpu/drm/xe/xe_vm.c                  | 80 ++++++++++++++++++--------
 drivers/gpu/drm/xe/xe_vm_types.h            | 11 ++--
 include/uapi/drm/xe_drm.h                   | 21 +------
 16 files changed, 187 insertions(+), 196 deletions(-)
