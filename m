Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AABE1663D2
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2020 18:05:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D201A6EDEC;
	Thu, 20 Feb 2020 17:05:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 870F86EDE9;
 Thu, 20 Feb 2020 17:05:49 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Feb 2020 09:05:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,465,1574150400"; d="scan'208";a="349202447"
Received: from plaxmina-desktop.iind.intel.com ([10.145.162.62])
 by fmsmga001.fm.intel.com with ESMTP; 20 Feb 2020 09:05:45 -0800
From: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
To: jani.nikula@linux.intel.com, daniel@ffwll.ch,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [Intel-gfx] [PATCH v7 0/8] drm: Introduce struct drm_device based
 WARN* and use them in i915
Date: Thu, 20 Feb 2020 22:24:59 +0530
Message-Id: <20200220165507.16823-1-pankaj.laxminarayan.bharadiya@intel.com>
X-Mailer: git-send-email 2.23.0
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
Cc: pankaj.laxminarayan.bharadiya@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Device specific dev_WARN and dev_WARN_ONCE macros available in kernel
include device information in the backtrace, so we know what device
the warnings originate from.

Similar to this, add new struct drm_device based drm_WARN* macros. These
macros include device information in the backtrace, so we know
what device the warnings originate from. Knowing the device specific
information in the backtrace would be helpful in development all
around.

This patch series aims to convert calls of WARN(), WARN_ON(),
WARN_ONCE() and WARN_ON_ONCE() in i915 driver to use the drm
device-specific variants automatically wherever struct device pointer
is available.

To do this, this patch series -
  - introduces new struct drm_device based WARN* macros
  - automatically converts WARN* with device specific dev_WARN*
    variants using coccinelle semantic patch scripts.

The goal is to convert all the calls of WARN* with drm_WARN* in i915,
but there are still cases where device pointer is not readily
available in some functions (or I missed them somehow) using WARN*
hence some manual churning is needed. Handle such remaining cases
separately later.

changes since v6: 
   - rebase unmerged patches onto drm-tip
     (07350317e4b2 dm-tip: 2020y-02m-20d-12h-11m-40s UTC integration manifest)

changes since v5:
   - rebase unmerged patches onto drm-tip
     (db0579be2554 drm-tip: 2020y-02m-05d-10h-51m-13s UTC integration manifest)

changes since v4:
   - Address Jani's comment
     - split major i915/display related conversions per file into
       seperate patches so that non conflicting patches can be
       merged.

changes since v3:
  - rebase pending unmerged patches on drm-tip
	(bc626bbb5b6e drm-tip: 2020y-01m-25d-14h-28m-41s UTC integration manifest)

changes since v2:
  - rebase pending unmerged patches on drm-tip

changes since v1:
  - Address Jani's review comments
    - Fix typo in comment of patch 0001
    - Get rid of helper functions
    - Split patches by directory

Changes since RFC at [1]
  - Introduce drm_WARN* macros and use them as suggested by Sam and Jani
  - Get rid of extra local variables

[1] https://patchwork.freedesktop.org/series/71668/


Pankaj Bharadiya (8):
  drm/i915/display/cdclk: Make WARN* drm specific where drm_priv ptr is available
  drm/i915/display/ddi: Make WARN* drm specific where drm_device ptr is available
  drm/i915/display/display: Make WARN* drm specific where drm_device ptr is available
  drm/i915/display/power: Make WARN* drm specific where drm_priv ptr is available
  drm/i915/display/dp: Make WARN* drm specific where drm_device ptr is available
  drm/i915/display/hdcp: Make WARN* drm specific where drm_priv ptr is available
  drm/i915/gvt: Make WARN* drm specific where drm_priv ptr is available
  drm/i915/gvt: Make WARN* drm specific where vgpu ptr is available

 drivers/gpu/drm/i915/display/intel_cdclk.c    |  84 ++++---
 drivers/gpu/drm/i915/display/intel_ddi.c      |  92 ++++---
 drivers/gpu/drm/i915/display/intel_display.c  | 237 ++++++++++--------
 .../drm/i915/display/intel_display_power.c    | 181 +++++++------
 drivers/gpu/drm/i915/display/intel_dp.c       | 120 +++++----
 drivers/gpu/drm/i915/display/intel_hdcp.c     |  20 +-
 drivers/gpu/drm/i915/gvt/aperture_gm.c        |   6 +-
 drivers/gpu/drm/i915/gvt/cfg_space.c          |  23 +-
 drivers/gpu/drm/i915/gvt/cmd_parser.c         |   4 +-
 drivers/gpu/drm/i915/gvt/display.c            |   6 +-
 drivers/gpu/drm/i915/gvt/dmabuf.c             |   4 +-
 drivers/gpu/drm/i915/gvt/edid.c               |  19 +-
 drivers/gpu/drm/i915/gvt/gtt.c                |  21 +-
 drivers/gpu/drm/i915/gvt/gvt.c                |   4 +-
 drivers/gpu/drm/i915/gvt/handlers.c           |  22 +-
 drivers/gpu/drm/i915/gvt/interrupt.c          |  15 +-
 drivers/gpu/drm/i915/gvt/kvmgt.c              |  10 +-
 drivers/gpu/drm/i915/gvt/mmio.c               |  30 ++-
 drivers/gpu/drm/i915/gvt/mmio_context.c       |   8 +-
 drivers/gpu/drm/i915/gvt/scheduler.c          |   6 +-
 drivers/gpu/drm/i915/gvt/vgpu.c               |   6 +-
 21 files changed, 537 insertions(+), 381 deletions(-)

-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
