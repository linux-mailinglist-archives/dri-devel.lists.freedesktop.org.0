Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 609ADA50B26
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 20:12:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA01889613;
	Wed,  5 Mar 2025 19:12:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FneX1gYi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5874289613;
 Wed,  5 Mar 2025 19:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741201942; x=1772737942;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=r+Z/JRzJ0c8ge3H44YEREvPeqPUvd3EnV/gpRzk/W4o=;
 b=FneX1gYiNMuFrl2ux0WicPpLfc9GgDk7n7IXT5zKA+FI6SCUzMt6wHal
 T1JztNYd24Z1omHJrReGnBi6iqplRO1F9dbFHbu241dXlX84r5TxXIoc3
 qhn1MK5QUITjo5r2tJT96jSDLL8qvDI+UNLb1gewnFjr5AtzwNVBJvB/Y
 8CcVc6QtY2GiKDaDMbdCXYjLiu9otkzi8UUDcP9Q27dALy4W9F+O43sfL
 3sg//C7K3XDQP9PByW6saEHK0U7wlWzNuQN5v/q4+U0UK/CIjMK5aSp+f
 BiUNzS5m++0W2LMA2lpX2F9GbC9YWmdjAykqUJ8/6XA1cKHU0gLh1IfuM A==;
X-CSE-ConnectionGUID: ntUPo9zqTmy80uI4TBP44w==
X-CSE-MsgGUID: guX70XjCTo2BwqdD2AtNTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="46110872"
X-IronPort-AV: E=Sophos;i="6.14,224,1736841600"; d="scan'208";a="46110872"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 11:12:20 -0800
X-CSE-ConnectionGUID: 0PiOFZvjQOS3zDrFmDB6/Q==
X-CSE-MsgGUID: jZ9Qs2EAQaWsP6S8dvnKWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,224,1736841600"; d="scan'208";a="118802998"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.246.58])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 11:12:17 -0800
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
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: [PATCH v3 0/4] drm/i915: Fix harmfull driver register/unregister
 assymetry
Date: Wed,  5 Mar 2025 20:11:09 +0100
Message-ID: <20250305191152.164615-6-janusz.krzysztofik@linux.intel.com>
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
drm_dev_register() fails"), we may return from i915_driver_register()
immediately, skipping remaining registration steps.  However, the
_unregister() counterpart called at device remove knows nothing about that
skip and executes reverts of all those steps.  As a consequence, a number
of kernel warnings that taint the kernel are triggered.

Introduce a flag that indicates device registration status and raise it on
device registration success.  As a minimum (first patch), when that flag
is found not set while unregistering the driver, jump over those reverts
of registration steps omitted after device registration failure that are
not ready for being called unconditionally (and trigger the kernel
warnings).

With the second patch, also jump over reverts of other driver registration
steps that were not called due to device registration failure.  Some
unregister function calls, found implementing additional steps beyond the
register reverts, are still executed.

To simplify i915_driver_unregister() code, the third patch makes sure
reverts of driver registration steps executed before potentially
unsuccessful device registration are symmetrically called after
the device unplug.

Finally, the last patch further simplifies the i915_driver_unregister()
code by moving two required steps down, right after device unplug.

The first patch may be squashed with one or more of its follow-ups if so
decided.

Janusz Krzysztofik (4):
  drm/i915: Skip harmful unregister steps if not registered
  drm/i915: Omit unnecessary driver unregister steps
  drm/i915: Fix asymmetry in PMU register/unregister step order
  drm/i915: Group not skipped unregister steps

 drivers/gpu/drm/i915/gt/intel_gt.c |  6 ++++++
 drivers/gpu/drm/i915/i915_driver.c | 18 ++++++++++++------
 drivers/gpu/drm/i915/i915_drv.h    |  2 ++
 3 files changed, 20 insertions(+), 6 deletions(-)

-- 
2.48.1

