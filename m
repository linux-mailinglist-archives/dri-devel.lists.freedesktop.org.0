Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F7D165C91
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2020 12:14:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C2FC6ED2E;
	Thu, 20 Feb 2020 11:14:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD26E6ED26;
 Thu, 20 Feb 2020 11:14:54 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Feb 2020 03:14:54 -0800
X-IronPort-AV: E=Sophos;i="5.70,464,1574150400"; d="scan'208";a="224831717"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Feb 2020 03:14:49 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, 
Subject: [PULL] drm-intel-fixes
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Thu, 20 Feb 2020 13:14:46 +0200
Message-ID: <87y2sxtsrd.fsf@intel.com>
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
Cc: , dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hi Dave & Daniel -

Due to issues in s2idle in v5.6-rc2, I've gotten CI results on these
with two hack reverts on top, and I threw them out just before making
the pull request. I had to revert:

fdde0ff8590b ("ACPI: PM: s2idle: Prevent spurious SCIs from waking up the system")
e3728b50cd9b ("ACPI: PM: s2idle: Avoid possible race related to the EC GPE")

I've been told the issues have been reported, hopefully we'll get the
fixes in Linus' upstream soon too.

drm-intel-fixes-2020-02-20:
drm/i915 fixes for v5.6-rc3:
- Workaround missing Display Stream Compression (DSC) state readout by
  forcing modeset when its enabled at probe
- Fix EHL port clock voltage level requirements
- Fix queuing retire workers on the virtual engine
- Fix use of partially initialized waiters
- Stop using drm_pci_alloc/drm_pci/free
- Fix rewind of RING_TAIL by forcing a context reload
- Fix locking on resetting ring->head
- Propagate our bug filing URL change to stable kernels

BR,
Jani.

The following changes since commit 11a48a5a18c63fd7621bb050228cebf13566e4d8:

  Linux 5.6-rc2 (2020-02-16 13:16:59 -0800)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2020-02-20

for you to fetch changes up to 15de9cb5c9c83a23be92b8f7a1178cead1486587:

  drm/i915/gt: Avoid resetting ring->head outside of its timeline mutex (2020-02-18 09:53:18 +0200)

----------------------------------------------------------------
drm/i915 fixes for v5.6-rc3:
- Workaround missing Display Stream Compression (DSC) state readout by
  forcing modeset when its enabled at probe
- Fix EHL port clock voltage level requirements
- Fix queuing retire workers on the virtual engine
- Fix use of partially initialized waiters
- Stop using drm_pci_alloc/drm_pci/free
- Fix rewind of RING_TAIL by forcing a context reload
- Fix locking on resetting ring->head
- Propagate our bug filing URL change to stable kernels

----------------------------------------------------------------
Chris Wilson (7):
      drm/i915/gem: Require per-engine reset support for non-persistent contexts
      drm/i915: Initialise basic fence before acquiring seqno
      drm/i915/gt: Prevent queuing retire workers on the virtual engine
      drm/i915/gt: Protect defer_request() from new waiters
      drm/i915: Wean off drm_pci_alloc/drm_pci_free
      drm/i915/execlists: Always force a context reload when rewinding RING_TAIL
      drm/i915/gt: Avoid resetting ring->head outside of its timeline mutex

Jani Nikula (3):
      MAINTAINERS: Update drm/i915 bug filing URL
      drm/i915: Update drm/i915 bug filing URL
      drm/i915/dsc: force full modeset whenever DSC is enabled at probe

Matt Roper (1):
      drm/i915/ehl: Update port clock voltage level requirements

 MAINTAINERS                                      |  2 +-
 drivers/gpu/drm/i915/Kconfig                     |  5 +-
 drivers/gpu/drm/i915/display/intel_ddi.c         |  4 +-
 drivers/gpu/drm/i915/display/intel_display.c     | 20 ++++-
 drivers/gpu/drm/i915/gem/i915_gem_context.c      | 16 ++++
 drivers/gpu/drm/i915/gem/i915_gem_object_types.h |  3 -
 drivers/gpu/drm/i915/gem/i915_gem_phys.c         | 98 ++++++++++++------------
 drivers/gpu/drm/i915/gt/intel_breadcrumbs.c      |  3 +
 drivers/gpu/drm/i915/gt/intel_gt_requests.c      |  3 +
 drivers/gpu/drm/i915/gt/intel_lrc.c              | 61 +++++++--------
 drivers/gpu/drm/i915/gt/intel_ring.c             |  1 +
 drivers/gpu/drm/i915/gt/intel_ring.h             |  8 ++
 drivers/gpu/drm/i915/gt/intel_ring_types.h       |  7 +-
 drivers/gpu/drm/i915/gt/selftest_lrc.c           |  2 +-
 drivers/gpu/drm/i915/i915_gem.c                  |  8 +-
 drivers/gpu/drm/i915/i915_gpu_error.c            |  3 +-
 drivers/gpu/drm/i915/i915_request.c              | 21 +++--
 drivers/gpu/drm/i915/i915_scheduler.c            |  6 +-
 drivers/gpu/drm/i915/i915_utils.c                |  5 +-
 19 files changed, 168 insertions(+), 108 deletions(-)

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
