Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4737219033
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jul 2020 21:09:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A43886E30D;
	Wed,  8 Jul 2020 19:09:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9254C6E30D;
 Wed,  8 Jul 2020 19:09:43 +0000 (UTC)
IronPort-SDR: MDvaXYxCTw3kMy1pXDnssfP+oiae6u9ee3AaOoi80/k6NgIwnKBQzKYlX02NC43tbMdznKserd
 vjQSPTOHYYCg==
X-IronPort-AV: E=McAfee;i="6000,8403,9676"; a="212809782"
X-IronPort-AV: E=Sophos;i="5.75,328,1589266800"; d="scan'208";a="212809782"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2020 12:09:42 -0700
IronPort-SDR: WkMU+pBd0hRk5p5jZul8L332/An3Z0D076PBj5tbhfN6MjdSN3r4GsbXhwve2x/AY+ljIO6cui
 qtc2p59Rl/xw==
X-IronPort-AV: E=Sophos;i="5.75,328,1589266800"; d="scan'208";a="306142160"
Received: from rdvivi-losangeles.jf.intel.com (HELO intel.com)
 ([10.165.21.202])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2020 12:09:42 -0700
Date: Wed, 8 Jul 2020 12:06:54 -0700
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-fixes
Message-ID: <20200708190654.GA3924867@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
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
Cc: dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave and Daniel,

A few patches this week while I'm covering Joonas vacation.
Most of the patches below also target stable trees (5.5+)

Here goes drm-intel-fixes-2020-07-08:

One display's fbc patch fixing fence_y_offset calculation
from Ville and 4 patches from Chris on GEM: 1 fixing a debugfs
panic and others fixing vma construction and pin under vm->mutex.

Thanks,
Rodrigo.

The following changes since commit dcb7fd82c75ee2d6e6f9d8cc71c52519ed52e258:

  Linux 5.8-rc4 (2020-07-05 16:20:22 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2020-07-=
08

for you to fetch changes up to 5a383d443b29a140094430f3ad1d02fa1acc2b80:

  drm/i915/gt: Pin the rings before marking active (2020-07-07 18:00:15 -07=
00)

----------------------------------------------------------------
One display's fbc patch fixing fence_y_offset calculation
from Ville and 4 patches from Chris on GEM: 1 fixing a debugfs
panic and others fixing vma construction and pin under vm->mutex.

----------------------------------------------------------------
Chris Wilson (4):
      drm/i915: Skip stale object handle for debugfs per-file-stats
      drm/i915: Drop vm.ref for duplicate vma on construction
      drm/i915: Also drop vm.ref along error paths for vma construction
      drm/i915/gt: Pin the rings before marking active

Ville Syrj=E4l=E4 (1):
      drm/i915/fbc: Fix fence_y_offset handling

 drivers/gpu/drm/i915/display/intel_display.c | 11 ++++++++++
 drivers/gpu/drm/i915/display/intel_display.h |  1 +
 drivers/gpu/drm/i915/display/intel_fbc.c     | 32 +++++++++---------------=
----
 drivers/gpu/drm/i915/gt/intel_context.c      | 12 +++++------
 drivers/gpu/drm/i915/i915_debugfs.c          |  2 +-
 drivers/gpu/drm/i915/i915_drv.h              |  6 +++---
 drivers/gpu/drm/i915/i915_vma.c              | 15 ++++++-------
 7 files changed, 38 insertions(+), 41 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
