Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BCB61A2BAC
	for <lists+dri-devel@lfdr.de>; Thu,  9 Apr 2020 00:00:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFF306EB09;
	Wed,  8 Apr 2020 22:00:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FDDA6EB08;
 Wed,  8 Apr 2020 22:00:06 +0000 (UTC)
IronPort-SDR: u6yui/AXK9x9DpODHmF87ryF9S1vPxrawnTRkq655KjZS9iydU7AuxFe6ExeG+BkHuWs9FPcAt
 Qcx4Gty61hHw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2020 15:00:05 -0700
IronPort-SDR: aAyfJ+oQHBcVHP2WfSAdKaqrVqS0sEZvgd9PJ2Vp1dgEj2vMT2oDlKcN/7pQosqXTx60kAwWSR
 ozdYbGzpL5eQ==
X-IronPort-AV: E=Sophos;i="5.72,360,1580803200"; d="scan'208";a="286685553"
Received: from rdvivi-losangeles.jf.intel.com (HELO intel.com)
 ([10.165.21.202])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2020 15:00:04 -0700
Date: Wed, 8 Apr 2020 14:59:52 -0700
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-next-fixes
Message-ID: <20200408215952.GA1623934@intel.com>
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

Couple display fixes, including vswing table and display TypeC
port in TBT mode fix for ICL+
A few GT/GEM alloc/reloc fixes with one to flush all the
reloc_gpu batch which has cc:stable #5.2

Here goes drm-intel-next-fixes-2020-04-08:

- Flush all the reloc_gpu batch (Chris)
- Ignore readonly failures when updating relocs (Chris)
- Fill all the unused space in the GGTT (Chris)
- Return the right vswing table (Jose)
- Don't enable DDI IO power on a TypeC port in TBT mode for ICL+ (Imre)

Thanks,
Rodrigo.

The following changes since commit 17d0c1062a0c60e17c96538adf4a84c208930d9d:

  Merge tag 'gvt-next-fixes-2020-03-31' of https://github.com/intel/gvt-lin=
ux into drm-intel-next-fixes (2020-03-31 09:25:15 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-next-fixes-202=
0-04-08

for you to fetch changes up to 1aaea8476d9f014667d2cb24819f9bcaf3ebb7a4:

  drm/i915/gem: Flush all the reloc_gpu batch (2020-04-06 10:31:38 -0700)

----------------------------------------------------------------
- Flush all the reloc_gpu batch (Chris)
- Ignore readonly failures when updating relocs (Chris)
- Fill all the unused space in the GGTT (Chris)
- Return the right vswing table (Jose)
- Don't enable DDI IO power on a TypeC port in TBT mode for ICL+ (Imre)

----------------------------------------------------------------
Chris Wilson (3):
      drm/i915/gt: Fill all the unused space in the GGTT
      drm/i915/gem: Ignore readonly failures when updating relocs
      drm/i915/gem: Flush all the reloc_gpu batch

Imre Deak (1):
      drm/i915/icl+: Don't enable DDI IO power on a TypeC port in TBT mode

Jos=E9 Roberto de Souza (1):
      drm/i915/dp: Return the right vswing tables

 drivers/gpu/drm/i915/display/intel_ddi.c       | 11 +++++---
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 14 +++++-----
 drivers/gpu/drm/i915/gt/intel_ggtt.c           | 37 +++++++++++++++++++---=
----
 3 files changed, 42 insertions(+), 20 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
