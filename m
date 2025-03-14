Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3556A61D3D
	for <lists+dri-devel@lfdr.de>; Fri, 14 Mar 2025 21:52:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86C1510E266;
	Fri, 14 Mar 2025 20:52:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O/6DifIt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (unknown [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 242F010E1D3;
 Fri, 14 Mar 2025 20:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741985552; x=1773521552;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vfzLOAe+jpZge8yuCkK8iQvpffTtzWjQ5OlWlcTn5kg=;
 b=O/6DifIt2sG7IAnbMGQdMLnayQVTWuc1qaH8+Us+nxQPhEB8To4obcNg
 +kpdk6bBtBlkLEltdL3pJ6gp8BKkJ9TDHgtrNa16psD8yII4fxS8AIhql
 e5pwoF+Tjh1/Rw0a72TQd4XixQU4H7w+n7CMIsB/c20XnOhRZOdOETVr8
 eEQAHlbG1HP1gBgJ8pHf4qM8la6yYjbbrWQgYNFklxISG2nrF8LWOqYsm
 W0/xiek3cINE2dsxuY7YamiqFTicgbVgdlOLp3UxzBMEfJASr0ng3I+1b
 gKUAdd58DMFxaiOrubJcwTr+DS78SoDyzHPtYdN0DImgsrVCmlL58tZZg A==;
X-CSE-ConnectionGUID: kOmFMV/0R3O6VszbSZm+Qg==
X-CSE-MsgGUID: 43Xe5P+qTHWQZ3GyA8nRmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11373"; a="43284789"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="43284789"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 13:52:21 -0700
X-CSE-ConnectionGUID: CvdAyOzKQw+MiitzJhmF8g==
X-CSE-MsgGUID: BpJxJI0ISpaVQlRkKEfrxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="121578428"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO
 jkrzyszt-mobl2.intranet) ([10.245.246.206])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 13:52:17 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: intel-gfx@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: [PATCH v5 0/3] drm/i915: Fix harmful driver register/unregister
 asymmetry
Date: Fri, 14 Mar 2025 21:38:32 +0100
Message-ID: <20250314205202.809563-5-janusz.krzysztofik@linux.intel.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
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

Starting with commit ec3e00b4ee27 ("drm/i915: stop registering if
drm_dev_register() fails"), we return from i915_driver_register()
immediately if drm_dev_register() fails, skipping remaining registration
steps, and continue only with remaining probe steps.  However, the
_unregister() counterpart called at driver remove knows nothing about that
skip and executes reverts of all those steps.  As a consequence, a number
of kernel warnings that taint the kernel are triggered:

Fix the asymmetry by failing the driver probe on device registration
failure and going through rewind paths.  For that to work as expected,
add missing PXP cleanup to probe error rewind path.  Also, downgrade
device registration error message if the error is injected by a test.

v5: Drop unsigned keyword from ret variable declaration (Krzysztof),
  - downgrde severity of injected device register errors with
    i915_prober_error() in a separate patch, then keep then "Failed to
    register driver for userspace access" error message (Krzysztof),
  - split PXP cleanup addition to rewind path out to a separate patch.
v4: Switch to taking an error rewind path on device registration failure
    (Krzysztof, Lucas).
v3: Based on Andi's commitment on introducing a flag, try to address
    Jani's "must find another way" by finding a better place and name for
    the flag (in hope that's what Jani had on mind),
  - split into a series of patches and limit the scope of the first (this)
    one to a minimum of omitting conditionally only those unregister
    (sub)steps that trigger kernel warnings when not registered.
v2: Check in _unregister whether the drm_dev_register has succeeded and
    skip some of the _unregister() steps. (Andi)

Cc: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>

Janusz Krzysztofik (3):
  drm/i915: Downgrade device register error if injected
  drm/i915: Fix PXP cleanup missing from probe error rewind
  drm/i915: Fix harmful driver register/unregister asymmetry

 drivers/gpu/drm/i915/i915_driver.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

-- 
2.48.1

