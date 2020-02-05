Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E20781536E3
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2020 18:45:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 010216E21E;
	Wed,  5 Feb 2020 17:45:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78CAB6E21E;
 Wed,  5 Feb 2020 17:45:33 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Feb 2020 09:45:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,406,1574150400"; d="scan'208";a="343803386"
Received: from plaxmina-desktop.iind.intel.com ([10.145.162.62])
 by fmsmga001.fm.intel.com with ESMTP; 05 Feb 2020 09:45:31 -0800
From: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
To: jani.nikula@linux.intel.com, daniel@ffwll.ch,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [Intel-gfx] [PATCH v6 0/7] drm: Introduce struct drm_device based
 WARN* and use them in i915
Date: Wed,  5 Feb 2020 23:04:12 +0530
Message-Id: <20200205173419.1695-1-pankaj.laxminarayan.bharadiya@intel.com>
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


*** BLURB HERE ***

Pankaj Bharadiya (7):
  drm/i915/display/cdclk: Make WARN* drm specific where drm_priv ptr is
    available
  drm/i915/display/ddi: Make WARN* drm specific where drm_device ptr is
    available
  drm/i915/display/display: Make WARN* drm specific where drm_device ptr
    is available
  drm/i915/display/power: Make WARN* drm specific where drm_priv ptr is
    available
  drm/i915/display/dp: Make WARN* drm specific where drm_device ptr is
    available
  drm/i915/display/global_state: Make WARN* drm specific where
    drm_device ptr is available
  drm/i915/display/hdcp: Make WARN* drm specific where drm_priv ptr is
    available

 drivers/gpu/drm/i915/display/intel_cdclk.c    |  85 ++++---
 drivers/gpu/drm/i915/display/intel_ddi.c      |  92 ++++---
 drivers/gpu/drm/i915/display/intel_display.c  | 238 ++++++++++--------
 .../drm/i915/display/intel_display_power.c    | 174 +++++++------
 drivers/gpu/drm/i915/display/intel_dp.c       | 118 +++++----
 .../gpu/drm/i915/display/intel_global_state.c |   4 +-
 drivers/gpu/drm/i915/display/intel_hdcp.c     |  20 +-
 7 files changed, 417 insertions(+), 314 deletions(-)

-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
