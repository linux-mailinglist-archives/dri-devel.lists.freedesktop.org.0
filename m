Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D24A944F94
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 17:46:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EFF110E8D5;
	Thu,  1 Aug 2024 15:46:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="beq7y3oh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F59810E8D4;
 Thu,  1 Aug 2024 15:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722527176; x=1754063176;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ecXZBM9gQUmXIk0kNdfTlPVx3YXOkd/Uhs4jiZGk43E=;
 b=beq7y3ohT5G8UPcJr88Aif6QrFIZKwOLZvUh9rVNVXzb3w9EA/P9k0E1
 buBPO/UP2LmftzXBYTKD6GpufrSh4CMb1TlLzFAtIUNkpwPEE+MpDO19b
 /GAQu0H5XTRgb9mCjnHQAbIzhNoCA3hGsV4E20nWw6XgNoFWIp1MTshey
 0mRABxCtK7HGm8dL+5/kiVCuKsHSPstJf+kUxhQlWgzKrcBnBYSdjqKj+
 x64hB8CF+MHl70lJdFZrJbwxd2MubukYlyFOjQTVxRU2Ob8SsjN4sC7L6
 RNz1Mh9M6tDilH1PkznxldfAPmJBw++KVgFGQe7jHdvmpeXVn5tJg3OWv A==;
X-CSE-ConnectionGUID: 8W+3ozduRDOVLoazph0ugA==
X-CSE-MsgGUID: 8il40EfGRb6njB22eomhmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="20177029"
X-IronPort-AV: E=Sophos;i="6.09,255,1716274800"; d="scan'208";a="20177029"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 08:46:16 -0700
X-CSE-ConnectionGUID: 867iRaxcTJibeTnlXnTLow==
X-CSE-MsgGUID: ISht0V63QVu+dtJTyUzb2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,255,1716274800"; d="scan'208";a="55168231"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.23])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 08:46:13 -0700
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Nitin Gote <nitin.r.gote@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Nirmoy Das <nirmoy.das@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Subject: [PATCH] drm/i915/gt: Delete sysfs entries for engines on driver unload
Date: Thu,  1 Aug 2024 17:40:48 +0200
Message-ID: <20240801154047.115176-2-krzysztof.niemiec@intel.com>
X-Mailer: git-send-email 2.45.2
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

While the sysfs entries for engines are added in intel_engines_init()
during driver load, the corresponding function intel_engines_release()
does not correctly get rid of them. This can lead to a UAF if, after
failed initialization (for example when gt is set wedged on init), we
try to access the engines.

Empty the engines llist in intel_engines_release().

Suggested-by: Chris Wilson <chris.p.wilson@linux.intel.com>
Signed-off-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_engine_cs.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index 3b740ca25000..4d30a86016f2 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -693,6 +693,8 @@ void intel_engines_release(struct intel_gt *gt)
 
 		memset(&engine->reset, 0, sizeof(engine->reset));
 	}
+
+	llist_del_all(&gt->i915->uabi_engines_llist);
 }
 
 void intel_engine_free_request_pool(struct intel_engine_cs *engine)
-- 
2.45.2

