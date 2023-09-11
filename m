Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B6679A704
	for <lists+dri-devel@lfdr.de>; Mon, 11 Sep 2023 11:51:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1886D10E243;
	Mon, 11 Sep 2023 09:51:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A739410E243
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Sep 2023 09:51:13 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B71D460FD6;
 Mon, 11 Sep 2023 09:51:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDFE4C433C7;
 Mon, 11 Sep 2023 09:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1694425872;
 bh=k9hqH3sPaYwqFo8Oa0hcfW2HQ0WmwXu5RzJHIPp+VFA=;
 h=From:Subject:Date:To:Cc:From;
 b=r14eTcVwefBmq+cDh4FRg3zniV/NPqQ1h6rDVMFFDFRioza5917OEAnU+UnuxubiF
 PljQ1JstPHzCj1d+ojt6Rv53i/jKJWgbDn1uQerzpTk171Yfx17dK2iiNI1r+Wc1Mi
 66j+FiHx5YOynJ1DYzBDg64QgJQDKeK8ETOkqO/aBkedtPsQPWqzjNlcQ4TVS7+syO
 /Y5PRhiABoPZkwPjdROR0XDV5Ouu25LJHkkIRc+V3orUoaVyAcDReSwF+S/N8+wg9o
 mmnwIhipRlhM9B2yLippIVWf6IfYlrvCxhSavp6xSLx1yFqs4Bl58YHZyowly9z1x2
 PyK8Ceuh1fjAQ==
From: Maxime Ripard <mripard@kernel.org>
Subject: [PATCH 0/2] drm/tests: Flag slow kunit tests as such
Date: Mon, 11 Sep 2023 11:51:04 +0200
Message-Id: <20230911-kms-slow-tests-v1-0-d3800a69a1a1@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAjj/mQC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI2MDS0ND3ezcYt3inPxy3ZLU4pJiXQMjM8Ok1FTLRFOTJCWgpoKi1LTMCrC
 B0bG1tQBb9Va5YAAAAA==
To: Brendan Higgins <brendan.higgins@linux.dev>, 
 David Gow <davidgow@google.com>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1470; i=mripard@kernel.org;
 h=from:subject:message-id; bh=k9hqH3sPaYwqFo8Oa0hcfW2HQ0WmwXu5RzJHIPp+VFA=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCn/HvNGO/2M1XOb90ZlxhV17jcN1Uevn88I/X156a2Uj
 tQvgkJXOkpZGMS4GGTFFFlihM2XxJ2a9bqTjW8ezBxWJpAhDFycAjCRrdMYGVYcfBrac0qpnCvP
 M/B97Smrl/rdJ2sEpi7g/TJ35cW3P9cz/NNRcLi79GBkmP+Ruxd3hW7qkvVjnV2ifeFO82rj2ex
 xzpwA
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

Hi,

Here's a series that sets the speed attribute to slow on DRM tests that
are taking a while to execute.

With those patches, an initial run of the drm tests on arm64 were taking
59s to execute with:

$ ./tools/testing/kunit/kunit.py run \
	--kunitconfig=drivers/gpu/drm/tests \
	--arch arm64 \
	--cross_compile aarch64-linux-gnu-
...
[11:50:07] Testing complete. Ran 340 tests: passed: 340
[11:50:07] Elapsed time: 62.261s total, 0.001s configuring, 2.703s building, 59.532s running

and are now taking 1.7s when filtering out the slow tests:

$ ./tools/testing/kunit/kunit.py run \
	--kunitconfig=drivers/gpu/drm/tests \
	--arch arm64 \
	--cross_compile aarch64-linux-gnu- \
	--filter "speed>slow"
...
[11:47:52] Testing complete. Ran 332 tests: passed: 332
[11:47:52] Elapsed time: 6.449s total, 0.001s configuring, 4.728s building, 1.678s running

Let me know what you think,
Maxime

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
Maxime Ripard (2):
      kunit: Warn if tests are slow
      drm/tests: Flag slow tests as such

 drivers/gpu/drm/tests/drm_buddy_test.c |  2 +-
 drivers/gpu/drm/tests/drm_mm_test.c    | 14 +++++++-------
 lib/kunit/test.c                       | 16 ++++++++++++++++
 3 files changed, 24 insertions(+), 8 deletions(-)
---
base-commit: 0bb80ecc33a8fb5a682236443c1e740d5c917d1d
change-id: 20230911-kms-slow-tests-0261bee9a54b

Best regards,
-- 
Maxime Ripard <mripard@kernel.org>

