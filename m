Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DEC6508964
	for <lists+dri-devel@lfdr.de>; Wed, 20 Apr 2022 15:30:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37C7F10F0C1;
	Wed, 20 Apr 2022 13:30:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 415AE10F0D1;
 Wed, 20 Apr 2022 13:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650461428; x=1681997428;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=olons+DftCZ6hGJpcWR970X/XiIs0zJ1Kyb+yns50DY=;
 b=AxedIXR13+MUViHJPGjpr5X9fKDxIkc3zRDNUPdx/ZqGuI0TjgDFYCFi
 h1PyGqXHv4FLfwQo2giUeCqreg3Kkyv3bWDr1paGLbUA2URnixgXDz/9K
 wuZL2Q5W2eWzg0I+12Eb7Q6R6RrvLCpEEV2lE3HkTX1jtE6lU6XZ+ybe4
 Ewd95Oa73YFecIlSJFEPVQN5glxsMMyVXWMAkn9RzB7WncOJgqdpbBWEk
 Rj9gUbVDIm6tkKTEOZIPUCzMBEP7EAq1Sj/TikV3/5sXIj1fcOKrStPJC
 Yk1MjCn8lEw+tenhYkInritxLkA0tVJJjsPhg5FGwFjVzH/oGAAY/+dqX g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10322"; a="251331368"
X-IronPort-AV: E=Sophos;i="5.90,275,1643702400"; d="scan'208";a="251331368"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2022 06:30:04 -0700
X-IronPort-AV: E=Sophos;i="5.90,275,1643702400"; d="scan'208";a="555193673"
Received: from mciobota-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.56.75])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2022 06:30:00 -0700
Date: Wed, 20 Apr 2022 16:29:58 +0300
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-fixes
Message-ID: <YmAKuHwon7hGyIoC@jlahtine-mobl.ger.corp.intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave & Daniel,

Here go drm-intel-fixes for v5.18-rc4.

Two display fixes: Disable VRR if user disables it from panel settings
and avoid claiming PSR2 is enabled when it is not supported by config.

Regards, Joonas

***

drm-intel-fixes-2022-04-20:

- Unset enable_psr2_sel_fetch if PSR2 detection fails
- Fix to detect when VRR is turned off from panel settings

The following changes since commit b2d229d4ddb17db541098b83524d901257e93845:

  Linux 5.18-rc3 (2022-04-17 13:57:31 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2022-04-20

for you to fetch changes up to bb02330408a7bde33b5f46aa14fd5d7bfe6093b7:

  drm/i915/display/psr: Unset enable_psr2_sel_fetch if other checks in intel_psr2_config_valid() fails (2022-04-20 07:51:14 +0300)

----------------------------------------------------------------
- Unset enable_psr2_sel_fetch if PSR2 detection fails
- Fix to detect when VRR is turned off from panel settings

----------------------------------------------------------------
José Roberto de Souza (1):
      drm/i915/display/psr: Unset enable_psr2_sel_fetch if other checks in intel_psr2_config_valid() fails

Manasi Navare (1):
      drm/i915/display/vrr: Reset VRR capable property on a long hpd

 drivers/gpu/drm/i915/display/intel_dp.c  | 17 +++++++++-----
 drivers/gpu/drm/i915/display/intel_psr.c | 38 ++++++++++++++++++--------------
 2 files changed, 32 insertions(+), 23 deletions(-)
