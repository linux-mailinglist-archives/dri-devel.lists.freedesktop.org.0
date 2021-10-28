Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A97A43DEDC
	for <lists+dri-devel@lfdr.de>; Thu, 28 Oct 2021 12:29:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C0DC6E951;
	Thu, 28 Oct 2021 10:29:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFC106E94E;
 Thu, 28 Oct 2021 10:29:45 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10150"; a="230323334"
X-IronPort-AV: E=Sophos;i="5.87,189,1631602800"; d="scan'208";a="230323334"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2021 03:29:29 -0700
X-IronPort-AV: E=Sophos;i="5.87,189,1631602800"; d="scan'208";a="498331302"
Received: from ralfseng-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.251.214.156])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2021 03:29:24 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, 
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dim-tools@lists.freedesktop.org, 
Subject: [PULL] drm-intel-fixes
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Thu, 28 Oct 2021 13:29:21 +0300
Message-ID: <8735olh27y.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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


Hi Dave & Daniel -

Certainly more than I'd like at this stage, but it's mostly Cc: stable
material, and the tracepoint change is a last minute revert to dodge a
potential "tracepoints are uabi" bullet before it hits the final
release.


BR,
Jani.


drm-intel-fixes-2021-10-28:
drm/i915 fixes for v5.15 final:
- Remove unconditional clflushes
- Fix oops on boot due to sync state on disabled DP encoders
- Revert backend specific data added to tracepoints
- Remove useless and incorrect memory frequence calculation

BR,
Jani.

The following changes since commit 519d81956ee277b4419c723adfb154603c2565ba:

  Linux 5.15-rc6 (2021-10-17 20:00:13 -1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2021-10-=
28

for you to fetch changes up to 9a4aa3a2f1606a03c220b21049baa4a2b6169626:

  drm/i915: Revert 'guc_id' from i915_request tracepoint (2021-10-28 11:45:=
11 +0300)

----------------------------------------------------------------
drm/i915 fixes for v5.15 final:
- Remove unconditional clflushes
- Fix oops on boot due to sync state on disabled DP encoders
- Revert backend specific data added to tracepoints
- Remove useless and incorrect memory frequence calculation

----------------------------------------------------------------
Imre Deak (1):
      drm/i915/dp: Skip the HW readout of DPCD on disabled encoders

Joonas Lahtinen (1):
      drm/i915: Revert 'guc_id' from i915_request tracepoint

Jos=C3=A9 Roberto de Souza (1):
      drm/i915: Remove memory frequency calculation

Ville Syrj=C3=A4l=C3=A4 (2):
      drm/i915: Convert unconditional clflush to drm_clflush_virt_range()
      drm/i915: Catch yet another unconditioal clflush

 drivers/gpu/drm/i915/display/intel_dp.c  |  3 +++
 drivers/gpu/drm/i915/gt/intel_timeline.c |  4 ++--
 drivers/gpu/drm/i915/i915_reg.h          |  8 --------
 drivers/gpu/drm/i915/i915_trace.h        |  7 ++-----
 drivers/gpu/drm/i915/intel_dram.c        | 30 ++--------------------------=
--
 5 files changed, 9 insertions(+), 43 deletions(-)

--=20
Jani Nikula, Intel Open Source Graphics Center
