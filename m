Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20CA6348CF2
	for <lists+dri-devel@lfdr.de>; Thu, 25 Mar 2021 10:31:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 711466ECEF;
	Thu, 25 Mar 2021 09:31:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59CC26ECEF;
 Thu, 25 Mar 2021 09:31:39 +0000 (UTC)
IronPort-SDR: 3l0f51qs0XDPsY+1K9C3scD4OFQock50FP4xXz6yIreBxpkyEVb1XcIPbOWqymOt8vASmmS8g5
 gH3pVQ3/5dHQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9933"; a="187589867"
X-IronPort-AV: E=Sophos;i="5.81,277,1610438400"; d="scan'208";a="187589867"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2021 02:31:38 -0700
IronPort-SDR: ToRGC3ERYCOEycZxNBjbt9PtQk4YFZt8/p6LtspgHDrio6IOySrBdXiF1UH1DNAug6WWM+A2/Z
 ahpjoB0ZDOsw==
X-IronPort-AV: E=Sophos;i="5.81,277,1610438400"; d="scan'208";a="436396721"
Received: from ssettalu-mobl1.amr.corp.intel.com (HELO intel.com)
 ([10.209.123.151])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2021 02:31:36 -0700
Date: Thu, 25 Mar 2021 05:31:34 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-fixes
Message-ID: <YFxYdrjqeUtSu+3p@intel.com>
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

with GT fence revocation runtime PM logic targeting 4.12+ stable,
here goes drm-intel-fixes-2021-03-25-1:

- DisplayPort LTTPR fixes around link training and limiting it
  according to supported spec version. (Imre)
- Fix enabled_planes bitmask to really represent only logically
  enabled planes (Ville).
- Fix DSS CTL registers for ICL DSI transcoders (Jani)
- Fix the GT fence revocation runtime PM logic. (Imre)

Thanks,
Rodrigo.

The following changes since commit 0d02ec6b3136c73c09e7859f0d0e4e2c4c07b49b:

  Linux 5.12-rc4 (2021-03-21 14:56:43 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2021-03-=
25-1

for you to fetch changes up to 8840e3bd981f128846b01c12d3966d115e8617c9:

  drm/i915: Fix the GT fence revocation runtime PM logic (2021-03-24 09:12:=
07 -0400)

----------------------------------------------------------------
- DisplayPort LTTPR fixes around link training and limiting it
  according to supported spec version. (Imre)
- Fix enabled_planes bitmask to really represent only logically
  enabled planes (Ville).
- Fix DSS CTL registers for ICL DSI transcoders (Jani)
- Fix the GT fence revocation runtime PM logic. (Imre)

----------------------------------------------------------------
Imre Deak (4):
      drm/i915/ilk-glk: Fix link training on links with LTTPRs
      drm/i915: Disable LTTPR support when the DPCD rev < 1.4
      drm/i915: Disable LTTPR support when the LTTPR rev < 1.4
      drm/i915: Fix the GT fence revocation runtime PM logic

Jani Nikula (1):
      drm/i915/dsc: fix DSS CTL register usage for ICL DSI transcoders

Ville Syrj=E4l=E4 (1):
      drm/i915: Fix enabled_planes bitmask

 drivers/gpu/drm/i915/display/intel_atomic_plane.c  |  5 +-
 drivers/gpu/drm/i915/display/intel_dp.c            |  4 +-
 drivers/gpu/drm/i915/display/intel_dp_aux.c        |  7 ++
 .../gpu/drm/i915/display/intel_dp_link_training.c  | 75 +++++++++++++++++-=
----
 .../gpu/drm/i915/display/intel_dp_link_training.h  |  2 +-
 drivers/gpu/drm/i915/display/intel_vdsc.c          | 10 +--
 drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c       | 13 +++-
 drivers/gpu/drm/i915/intel_runtime_pm.c            | 29 +++++++--
 drivers/gpu/drm/i915/intel_runtime_pm.h            |  5 ++
 9 files changed, 113 insertions(+), 37 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
