Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B5B52C6439
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 13:07:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D09266EB93;
	Fri, 27 Nov 2020 12:07:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B77D6EB9A;
 Fri, 27 Nov 2020 12:07:30 +0000 (UTC)
IronPort-SDR: i2SE8a+UPUzSKcTC/hyj0Dubeck4kbKBDeSeD7DosHP8CWD9NCmheFj0MzfmQa/o4XGruhOWRy
 f418wf98S7nA==
X-IronPort-AV: E=McAfee;i="6000,8403,9817"; a="168883331"
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="168883331"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:07:28 -0800
IronPort-SDR: Tft5/uaodnLNJyHR7/ZqFjYzhOxzLaX3ZNaGfDG+iT/3ieXVUWYC+P6oIsbz9mL4oFESsds8PF
 NgjDTeiwGymw==
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="548028482"
Received: from mjgleeso-mobl.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.251.85.2])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:07:27 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH 001/162] drm/i915/selftest: also consider non-contiguous
 objects
Date: Fri, 27 Nov 2020 12:04:37 +0000
Message-Id: <20201127120718.454037-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201127120718.454037-1-matthew.auld@intel.com>
References: <20201127120718.454037-1-matthew.auld@intel.com>
MIME-Version: 1.0
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In igt_ppgtt_sanity_check we should also exercise the non-contiguous
option for LMEM, since this will give us slightly different sg layouts
and alignment.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/i915/gem/selftests/huge_pages.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
index 1f35e71429b4..0bf93947d89d 100644
--- a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
+++ b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
@@ -1333,6 +1333,7 @@ static int igt_ppgtt_sanity_check(void *arg)
 		unsigned int flags;
 	} backends[] = {
 		{ igt_create_system, 0,                        },
+		{ igt_create_local,  0,                        },
 		{ igt_create_local,  I915_BO_ALLOC_CONTIGUOUS, },
 	};
 	struct {
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
