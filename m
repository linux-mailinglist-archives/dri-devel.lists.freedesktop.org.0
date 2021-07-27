Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7983D6AB9
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 02:07:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9EF57334D;
	Tue, 27 Jul 2021 00:07:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F12EA731C5;
 Tue, 27 Jul 2021 00:06:05 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10057"; a="191932159"
X-IronPort-AV: E=Sophos;i="5.84,272,1620716400"; d="scan'208";a="191932159"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2021 17:06:03 -0700
X-IronPort-AV: E=Sophos;i="5.84,272,1620716400"; d="scan'208";a="662339239"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2021 17:06:03 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 29/33] drm/i915/selftest: Increase some timeouts in
 live_requests
Date: Mon, 26 Jul 2021 17:23:44 -0700
Message-Id: <20210727002348.97202-30-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210727002348.97202-1-matthew.brost@intel.com>
References: <20210727002348.97202-1-matthew.brost@intel.com>
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
Cc: daniele.ceraolospurio@intel.com, john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Requests may take slightly longer with GuC submission, let's increase
the timeouts in live_requests.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/selftests/i915_request.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/selftests/i915_request.c b/drivers/gpu/drm/i915/selftests/i915_request.c
index bd5c96a77ba3..d67710d10615 100644
--- a/drivers/gpu/drm/i915/selftests/i915_request.c
+++ b/drivers/gpu/drm/i915/selftests/i915_request.c
@@ -1313,7 +1313,7 @@ static int __live_parallel_engine1(void *arg)
 		i915_request_add(rq);
 
 		err = 0;
-		if (i915_request_wait(rq, 0, HZ / 5) < 0)
+		if (i915_request_wait(rq, 0, HZ) < 0)
 			err = -ETIME;
 		i915_request_put(rq);
 		if (err)
@@ -1419,7 +1419,7 @@ static int __live_parallel_spin(void *arg)
 	}
 	igt_spinner_end(&spin);
 
-	if (err == 0 && i915_request_wait(rq, 0, HZ / 5) < 0)
+	if (err == 0 && i915_request_wait(rq, 0, HZ) < 0)
 		err = -EIO;
 	i915_request_put(rq);
 
-- 
2.28.0

