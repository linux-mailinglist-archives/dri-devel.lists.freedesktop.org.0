Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E7079A705
	for <lists+dri-devel@lfdr.de>; Mon, 11 Sep 2023 11:51:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 928AB10E256;
	Mon, 11 Sep 2023 09:51:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62FB610E256
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Sep 2023 09:51:16 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B6EFF6104F;
 Mon, 11 Sep 2023 09:51:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD2B1C433C7;
 Mon, 11 Sep 2023 09:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1694425875;
 bh=e5uSUKmEcH/fCVQMCvFK+XpQngjeYTq9GMcSnKC6dpI=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=I0tNrtdGK/MB3ernvQQwRMXmwe4o+w+W+pUhcSL4yFjKkbtYAAb53uVtMZx4CdFgk
 qH+V+gZc/MSLzzNqLUVNXXDpfIkMjrlPKio3Pr2QSmrwGKD9YLSsoF7gutagFJB3C9
 SaeCift22DVwJCX6/J7gRYQlZCXSNkru9qkUQ8qK+1TDUX/aHc89BS+R7aOerRMAQv
 uSOBgPv9lr3AX95ferkcM5A/k/r9GqwcCRvHkD8yp/HRkwvJG2I/1mGG6pVJdHpEWb
 zgq1KXQ7F3thYH7BzjJ06cfwkYYl461H0JTE8s5073t1YmZEQJMW3SdM689MRkT3MT
 Hu7ZYhDyd9ulw==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 11 Sep 2023 11:51:05 +0200
Subject: [PATCH 1/2] kunit: Warn if tests are slow
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230911-kms-slow-tests-v1-1-d3800a69a1a1@kernel.org>
References: <20230911-kms-slow-tests-v1-0-d3800a69a1a1@kernel.org>
In-Reply-To: <20230911-kms-slow-tests-v1-0-d3800a69a1a1@kernel.org>
To: Brendan Higgins <brendan.higgins@linux.dev>, 
 David Gow <davidgow@google.com>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1555; i=mripard@kernel.org;
 h=from:subject:message-id; bh=e5uSUKmEcH/fCVQMCvFK+XpQngjeYTq9GMcSnKC6dpI=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCn/HvNWFd7+9C1yqeJ91sr22QYRCxXvi23c9/aDuQ7fT
 a4rhdNDO0pZGMS4GGTFFFlihM2XxJ2a9bqTjW8ezBxWJpAhDFycAjARthSG/7WRsv5aXEqv5Ipb
 FaY67dP33TjrSGztxs8Wgk/nTo97do3hD9fxWaw5h3XbpF5xF3Mbrvme6L9BrEk6Np//l070zgl
 aHAA=
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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
Cc: linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>,
 dri-devel@lists.freedesktop.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Kunit recently gained support to setup attributes, the first one being
the speed of a given test, then allowing to filter out slow tests.

A slow test is defined in the documentation as taking more than one
second. There's an another speed attribute called "super slow" but whose
definition is less clear.

Add support to the test runner to check the test execution time, and
report tests that should be marked as slow but aren't.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 lib/kunit/test.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/lib/kunit/test.c b/lib/kunit/test.c
index 49698a168437..a3b924501f3d 100644
--- a/lib/kunit/test.c
+++ b/lib/kunit/test.c
@@ -379,6 +379,9 @@ static void kunit_run_case_internal(struct kunit *test,
 				    struct kunit_suite *suite,
 				    struct kunit_case *test_case)
 {
+	struct timespec64 start, end;
+	struct timespec64 duration;
+
 	if (suite->init) {
 		int ret;
 
@@ -390,7 +393,20 @@ static void kunit_run_case_internal(struct kunit *test,
 		}
 	}
 
+	ktime_get_ts64(&start);
+
 	test_case->run_case(test);
+
+	ktime_get_ts64(&end);
+
+	duration = timespec64_sub(end, start);
+
+	if (duration.tv_sec >= 1 &&
+	    (test_case->attr.speed == KUNIT_SPEED_UNSET ||
+	     test_case->attr.speed >= KUNIT_SPEED_NORMAL))
+		kunit_warn(test,
+			   "Test should be marked slow (runtime: %lld.%09lds)",
+			   duration.tv_sec, duration.tv_nsec);
 }
 
 static void kunit_case_internal_cleanup(struct kunit *test)

-- 
2.41.0

