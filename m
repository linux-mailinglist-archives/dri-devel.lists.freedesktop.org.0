Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D408A5BA332
	for <lists+dri-devel@lfdr.de>; Fri, 16 Sep 2022 01:27:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 125B210EC17;
	Thu, 15 Sep 2022 23:27:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E8C410EC10;
 Thu, 15 Sep 2022 23:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663284420; x=1694820420;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=azKNFrdb4/EHtrrnoscy4apA69ozS+tLfVexlPXPy0g=;
 b=LLVPtKvMcPthp54HCiiSMh6KqQ3BzBPadE35j4GD96e+hZ0+A4M817Nt
 Ay4o+hlVjls+OKy8UfsYBUhZvRFzwElw0ip9+1XnXmgD8fpXgei5NKmzm
 16uiayqbdxO5MOO4UvBwVZ5Bg4dfmzSAxIZmY0MKs/qPN78oXmprkXMRn
 J7pqecvjB55Z3ubJV1YIzBbYTO7Fg1aIJw9YcuNoLsl5185bfn6leZg1r
 jY9uTd3fZ2vo58pmcSbWWG/wHO4Nt4ZG8PiIaOU5sH/2XFIVBsH+Vf6hY
 bOph3yFnIWosIcGhmxZp7uCokyQgEK35J/U6RWjwj4CTRf06/rUT8PWXR A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10471"; a="299689107"
X-IronPort-AV: E=Sophos;i="5.93,319,1654585200"; d="scan'208";a="299689107"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2022 16:26:59 -0700
X-IronPort-AV: E=Sophos;i="5.93,319,1654585200"; d="scan'208";a="685923296"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2022 16:26:59 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 0/4] Further multi-gt handling
Date: Thu, 15 Sep 2022 16:26:50 -0700
Message-Id: <20220915232654.3283095-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.37.3
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
Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that MTL is going to start providing two GTs, there are a few more
places in the driver that need to iterate over each GT instead of
operating directly on gt0.  Also some more deliberate cleanup is needed,
in cases where we fail GT/engine initialization after the first GT has
been fully setup.

v2:
 - Drop unnecessary helper function.  (Janusz)
 - Consolidate some adjacent GT loops (Daniele)

Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>

Chris Wilson (1):
  drm/i915/gt: Cleanup partial engine discovery failures

Tvrtko Ursulin (3):
  drm/i915: Make GEM resume all engines
  drm/i915: Make GEM suspend all GTs
  drm/i915: Handle all GTs on driver (un)load paths

 drivers/gpu/drm/i915/gem/i915_gem_pm.c    | 33 ++++++++++++++---
 drivers/gpu/drm/i915/gt/intel_engine_cs.c |  7 +++-
 drivers/gpu/drm/i915/i915_driver.c        |  3 +-
 drivers/gpu/drm/i915/i915_gem.c           | 43 ++++++++++++++++-------
 4 files changed, 68 insertions(+), 18 deletions(-)

-- 
2.37.3

