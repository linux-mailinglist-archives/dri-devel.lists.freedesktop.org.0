Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 246BEA2AFE1
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 19:10:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1838D10E0C6;
	Thu,  6 Feb 2025 18:10:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ja+gsOXu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FE4D10E0C6;
 Thu,  6 Feb 2025 18:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738865405; x=1770401405;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fQWxra/jdCshDpjB4xobaSRnCl4dQOzGwzO6m1AhH/Y=;
 b=ja+gsOXu7dXQkNtTM+Srj0Y4MNaSIirBBCKlQ8l+4AfM+ge6V1XwxlwS
 1Xv6B83jQbWSoIGnQ2kaAFfdii8cGxMo5OLlFFj6Yz76g+YyitQOKIegO
 A0WMqsjYCZ+9ontFG98oG1NgT2uFeVXOaaZKOoq26dYb/kV3Dn8DgRnHb
 aPg796UZTZHkgVjJS1e2xB7TaexlsAEeczvB1Xa7I3JZ2HTTovOx4rIku
 2bAuzYKk83QHGVHZ3Ns1UqTWmS3egG8ppHGEpx9lS/WhZ9lAkEiACo3Rk
 hXyhAxb8tV06eeCKyR7JT//nPlJ3uzP29BuHeVBt/s65Se2NhhwlZwN6F A==;
X-CSE-ConnectionGUID: AWdfF+CgTESvtR5fnhDXYw==
X-CSE-MsgGUID: zDsPmlcAR12U5wpjVLoaew==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="61965286"
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; d="scan'208";a="61965286"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 10:10:04 -0800
X-CSE-ConnectionGUID: vO6ZCQLSQ9GJQvEp5MUfHA==
X-CSE-MsgGUID: WPuwtlmFQnmV244TCS/5nQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; d="scan'208";a="111889296"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.246.55])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 10:10:01 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: [PATCH 0/3] drm/i915: Fix harmfull driver register/unregister
 assymetry
Date: Thu,  6 Feb 2025 19:07:38 +0100
Message-ID: <20250206180927.2237256-5-janusz.krzysztofik@linux.intel.com>
X-Mailer: git-send-email 2.47.1
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

We return immediately from i915_driver_register() if drm_dev_register()
fails, skipping remaining registration steps.  However, the _unregister()
counterpart called at device remove knows nothing about that skip and
executes reverts for all those steps.  For that to work correctly, those
revert functions must be resistant to being called even on uninitialized
objects, or we must not skip their initialization.

Three cases have been identified and fixes proposed.  Call traces are
taken from CI results of igt@i915_driver_load@reload-with-fault-injection
execution, reported to several separate Gitlab issues (links provided).

Immediate return was introduced to i915_driver_register() by commit
ec3e00b4ee27 ("drm/i915: stop registering if drm_dev_register() fails"),
however, quite a few things have changed since then.  That's why I haven't
mentioned it in a Fixes: tag to avoid it being picked up by stable, which
I haven't tested.

Janusz Krzysztofik (3):
  drm/i915: Fix PM reference not released if device register fails
  drm/i915: Fix GT sysfs unregister tried even if not registered
  drm/i915: Fix device sysfs teardown tried even if not set up

 drivers/gpu/drm/i915/gt/intel_gt_sysfs.c | 3 +++
 drivers/gpu/drm/i915/i915_driver.c       | 6 ++++--
 drivers/gpu/drm/i915/i915_sysfs.c        | 3 +++
 3 files changed, 10 insertions(+), 2 deletions(-)

-- 
2.47.1

