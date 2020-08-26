Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB302253AA2
	for <lists+dri-devel@lfdr.de>; Thu, 27 Aug 2020 01:26:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 168D06EB0F;
	Wed, 26 Aug 2020 23:26:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 271D36E430;
 Wed, 26 Aug 2020 23:26:17 +0000 (UTC)
IronPort-SDR: hGFb8HrkLpc9CJEW7OJ9AGIagZRPtWXd2FwUkbB1JHTRXLgY+ZYFCEpyNh7rn7cX27kvZFo5CM
 KB9RFUb9z1GA==
X-IronPort-AV: E=McAfee;i="6000,8403,9725"; a="157428295"
X-IronPort-AV: E=Sophos;i="5.76,357,1592895600"; d="scan'208";a="157428295"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2020 16:26:16 -0700
IronPort-SDR: /LJ2bh6MXiJHmQVhnW6zJGvUbw68lfEOSdnjUxxpJjFp5ZSmzgkxKdZPXcPjmtRawVi8ux1ohJ
 C8znYuO1D0Iw==
X-IronPort-AV: E=Sophos;i="5.76,357,1592895600"; d="scan'208";a="500430547"
Received: from rdvivi-losangeles.jf.intel.com (HELO intel.com)
 ([10.165.21.201])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2020 16:26:15 -0700
Date: Wed, 26 Aug 2020 19:27:33 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-next
Message-ID: <20200826232733.GA129053@intel.com>
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

here goes the first pull request towards 5.10:

As requested, the gem patches have been separated into
a drm-intel/topic/drm-intel-gem-next that will be sent separately
by the gem team later.

Thanks,
Rodrigo.

drm-intel-next-2020-08-24-1:
UAPI Changes:

- Introduce a mechanism to extend execbuf2 (Lionel)
- Add syncobj timeline support (Lionel)

Driver Changes:

- Limit stolen mem usage on the compressed frame buffer (Ville)
- Some clean-up around display's cdclk (Ville)
- Some DDI changes for better DP link training according
  to spec (Imre)
- Provide the perf pmu.module (Chris)
- Remove dobious Valleyview PCI IDs (Alexei)
- Add new display power saving feature for gen12+ called
  HOBL (Jose)
- Move SKL's clock gating w/a to skl_init_clock_gating() (Ville)
- Rocket Lake display additions (Matt)
- Selftest: temporarily downgrade on severity of frequency
            scaling tests (Chris)
- Introduce a new display workaround for fixing FLR related
  issues on new PCH. (Jose)
- Temporarily disable FBC on TGL. It was the culprit of random
  underruns. (Uma).
- Copy default modparams to mock i915_device (Chris)
- Add compiler paranoia for checking HWSP values (Chris)
- Remove useless gen check before calling intel_rps_boost (Chris)
- Fix a null pointer dereference (Chris)
- Add a couple of missing i915_active_fini() (Chris)
- Update TGL display power's bw_buddy table according to
  update spec (Matt)
- Fix couple wrong return values (Tianjia)
- Selftest: Avoid passing random 0 into ilog2 (George)
- Many Tiger Lake display fixes and improvements for Type-C and
  DP compliance (Imre, Jose)
- Start the addition of PSR2 selective fetch (Jose)
- Update a few DMC and HuC firmware versions (Jose)
- Add gen11+ w/a to fix underuns (Matt)
- Fix cmd parser desc matching with mask (Mika)
The following changes since commit 62975d27d647a40c58d3b96c29b911fc4f33c310:

  drm/ttm: revert "drm/ttm: make TT creation purely optional v3" (2020-08-1=
2 13:26:28 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-next-2020-08-2=
4-1

for you to fetch changes up to ced026e959bec5046afa310d6474e147b6294da2:

  drm/i915: Update DRIVER_DATE to 20200824 (2020-08-24 14:26:38 -0400)

----------------------------------------------------------------
UAPI Changes:

- Introduce a mechanism to extend execbuf2 (Lionel)
- Add syncobj timeline support (Lionel)

Driver Changes:

- Limit stolen mem usage on the compressed frame buffer (Ville)
- Some clean-up around display's cdclk (Ville)
- Some DDI changes for better DP link training according
  to spec (Imre)
- Provide the perf pmu.module (Chris)
- Remove dobious Valleyview PCI IDs (Alexei)
- Add new display power saving feature for gen12+ called
  HOBL (Jose)
- Move SKL's clock gating w/a to skl_init_clock_gating() (Ville)
- Rocket Lake display additions (Matt)
- Selftest: temporarily downgrade on severity of frequency
            scaling tests (Chris)
- Introduce a new display workaround for fixing FLR related
  issues on new PCH. (Jose)
- Temporarily disable FBC on TGL. It was the culprit of random
  underruns. (Uma).
- Copy default modparams to mock i915_device (Chris)
- Add compiler paranoia for checking HWSP values (Chris)
- Remove useless gen check before calling intel_rps_boost (Chris)
- Fix a null pointer dereference (Chris)
- Add a couple of missing i915_active_fini() (Chris)
- Update TGL display power's bw_buddy table according to
  update spec (Matt)
- Fix couple wrong return values (Tianjia)
- Selftest: Avoid passing random 0 into ilog2 (George)
- Many Tiger Lake display fixes and improvements for Type-C and
  DP compliance (Imre, Jose)
- Start the addition of PSR2 selective fetch (Jose)
- Update a few DMC and HuC firmware versions (Jose)
- Add gen11+ w/a to fix underuns (Matt)
- Fix cmd parser desc matching with mask (Mika)

----------------------------------------------------------------
Alexei Podtelezhnikov (1):
      drm/i915: Remove dubious Valleyview PCI IDs

Chris Wilson (7):
      drm/i915: Provide the perf pmu.module
      drm/i915/selftests: Downgrade severity of CS/SRM frequency scaling te=
sts
      drm/i915: Copy default modparams to mock i915_device
      drm/i915/selftests: Add compiler paranoia for checking HWSP values
      drm/i915: Remove gen check before calling intel_rps_boost
      drm/i915/display: Check for an LPSP encoder before dereferencing
      drm/i915: Add a couple of missing i915_active_fini()

George Spelvin (1):
      drm/i915/selftests: Avoid passing a random 0 into ilog2

Imre Deak (4):
      drm/i915/ddi: Don't frob the DP link scramble disabling flag
      drm/i915/ddi: Don't rewrite DDI_BUF_CTL reg during DP link training
      drm/i915/tgl: Make sure TC-cold is blocked before enabling TC AUX pow=
er wells
      drm/i915/tgl: Fix TC-cold block/unblock sequence

Jos=E9 Roberto de Souza (8):
      drm/i915/display: Implement HOBL
      drm/i915: Implement WA 14011294188
      drm/i915/tgl: Set subplatforms
      drm/i915/tgl: Add new voltage swing table
      drm/i915: Initial implementation of PSR2 selective fetch
      drm/i915/display: Implement WA 1408330847
      drm/i915: Update TGL and RKL DMC firmware versions
      drm/i915: Update TGL and RKL HuC firmware versions

Lionel Landwerlin (2):
      drm/i915: introduce a mechanism to extend execbuf2
      drm/i915: add syncobj timeline support

Matt Atwood (1):
      drm/i915: Apply Wa_14011264657:gen11+

Matt Roper (8):
      drm/i915/rkl: Handle new DPCLKA_CFGCR0 layout
      drm/i915/rkl: Add initial workarounds
      drm/i915/rkl: Add DPLL4 support
      drm/i915/rkl: Handle HTI
      drm/i915/rkl: Add Wa_14011224835 for PHY B initialization
      drm/i915: Update bw_buddy pagemask table
      Revert "drm/i915/rkl: Add Wa_14011224835 for PHY B initialization"
      drm/i915/kbl: Fix revision ID checks

Mika Kuoppala (1):
      drm/i915: Fix cmd parser desc matching with masks

Rodrigo Vivi (1):
      drm/i915: Update DRIVER_DATE to 20200824

Tianjia Zhang (2):
      drm/i915: Fix wrong return value
      drm/i915: Fix wrong return value in intel_atomic_check()

Uma Shankar (1):
      drm/i915/display/fbc: Disable fbc by default on TGL

Ville Syrj=E4l=E4 (5):
      drm/i915/fbc: Limit cfb to the first 256MiB of stolen on g4x+
      drm/i915: Pack struct intel_cdclk_vals
      drm/i915: Fix some whitespace
      drm/i915: Make i830 .get_cdclk() assignment less confusing
      drm/i915: Move WaDisableDopClockGating:skl to skl_init_clock_gating()

 drivers/gpu/drm/i915/display/intel_cdclk.c         |  11 +-
 drivers/gpu/drm/i915/display/intel_cdclk.h         |   2 +-
 drivers/gpu/drm/i915/display/intel_csr.c           |   8 +-
 drivers/gpu/drm/i915/display/intel_ddi.c           | 111 ++++++-
 drivers/gpu/drm/i915/display/intel_display.c       |  90 ++++-
 .../gpu/drm/i915/display/intel_display_debugfs.c   |  10 +-
 drivers/gpu/drm/i915/display/intel_display_power.c |  30 +-
 drivers/gpu/drm/i915/display/intel_display_types.h |   6 +
 .../gpu/drm/i915/display/intel_dp_link_training.c  |  19 +-
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c      |  52 ++-
 drivers/gpu/drm/i915/display/intel_fbc.c           |  17 +
 drivers/gpu/drm/i915/display/intel_frontbuffer.c   |   2 +
 drivers/gpu/drm/i915/display/intel_psr.c           | 110 +++++-
 drivers/gpu/drm/i915/display/intel_psr.h           |   5 +
 drivers/gpu/drm/i915/display/intel_sprite.c        |   5 +-
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c     | 367 ++++++++++++++++-=
----
 drivers/gpu/drm/i915/gt/intel_lrc.c                |   2 +-
 drivers/gpu/drm/i915/gt/intel_workarounds.c        | 113 +++++--
 .../gpu/drm/i915/gt/selftest_engine_heartbeat.c    |   5 +-
 drivers/gpu/drm/i915/gt/selftest_rps.c             |   4 +-
 drivers/gpu/drm/i915/gt/selftest_timeline.c        |  24 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c           |   4 +-
 drivers/gpu/drm/i915/i915_active.c                 |   7 +-
 drivers/gpu/drm/i915/i915_cmd_parser.c             |  14 +-
 drivers/gpu/drm/i915/i915_drv.c                    |   5 +-
 drivers/gpu/drm/i915/i915_drv.h                    |  54 ++-
 drivers/gpu/drm/i915/i915_getparam.c               |   1 +
 drivers/gpu/drm/i915/i915_params.c                 |   5 +
 drivers/gpu/drm/i915/i915_params.h                 |   1 +
 drivers/gpu/drm/i915/i915_pci.c                    |   1 +
 drivers/gpu/drm/i915/i915_pmu.c                    |   7 +-
 drivers/gpu/drm/i915/i915_reg.h                    |  32 +-
 drivers/gpu/drm/i915/i915_request.c                |   7 +-
 drivers/gpu/drm/i915/intel_device_info.c           |  19 ++
 drivers/gpu/drm/i915/intel_device_info.h           |   1 +
 drivers/gpu/drm/i915/intel_pm.c                    |  14 +-
 drivers/gpu/drm/i915/selftests/i915_buddy.c        |  18 +-
 drivers/gpu/drm/i915/selftests/i915_request.c      |   2 +-
 drivers/gpu/drm/i915/selftests/mock_gem_device.c   |   3 +
 include/drm/i915_pciids.h                          |   4 +-
 include/uapi/drm/i915_drm.h                        |  59 +++-
 41 files changed, 978 insertions(+), 273 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
