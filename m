Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0060F2B5B48
	for <lists+dri-devel@lfdr.de>; Tue, 17 Nov 2020 09:52:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D03D76E151;
	Tue, 17 Nov 2020 08:52:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73F8289D6C;
 Mon, 16 Nov 2020 14:33:18 +0000 (UTC)
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CZWks1Lz3zhYqb;
 Mon, 16 Nov 2020 22:32:53 +0800 (CST)
Received: from localhost.localdomain (10.175.101.6) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.487.0; Mon, 16 Nov 2020 22:32:58 +0800
From: Zhang Xiaoxu <zhangxiaoxu5@huawei.com>
To: <zhangxiaoxu5@huawei.com>, <chris@chris-wilson.co.uk>,
 <jani.nikula@linux.intel.com>, <rodrigo.vivi@intel.com>,
 <mika.kuoppala@linux.intel.com>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/i915/selftests: Fix wrong return value of
 perf_request_latency()
Date: Mon, 16 Nov 2020 09:35:40 -0500
Message-ID: <20201116143540.3648870-1-zhangxiaoxu5@huawei.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-Originating-IP: [10.175.101.6]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 17 Nov 2020 08:51:59 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If intel context create failed, the perf_request_latency() will return 0
rather than error, because we doesn't initialize the return value.

Fixes: 25c26f18ea79 ("drm/i915/selftests: Measure dispatch latency")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Zhang Xiaoxu <zhangxiaoxu5@huawei.com>
---
 drivers/gpu/drm/i915/selftests/i915_request.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/selftests/i915_request.c b/drivers/gpu/drm/i915/selftests/i915_request.c
index 64bbb8288249..6b512fc13ca7 100644
--- a/drivers/gpu/drm/i915/selftests/i915_request.c
+++ b/drivers/gpu/drm/i915/selftests/i915_request.c
@@ -2293,8 +2293,10 @@ static int perf_request_latency(void *arg)
 		struct intel_context *ce;
 
 		ce = intel_context_create(engine);
-		if (IS_ERR(ce))
+		if (IS_ERR(ce)) {
+			err = PTR_ERR(ce);
 			goto out;
+		}
 
 		err = intel_context_pin(ce);
 		if (err) {
-- 
2.25.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
