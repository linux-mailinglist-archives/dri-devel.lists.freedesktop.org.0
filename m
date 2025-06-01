Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A393ACA15B
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 01:26:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B61C610E382;
	Sun,  1 Jun 2025 23:26:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="klDzNrJq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F0E810E382
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Jun 2025 23:26:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 95D2561127;
 Sun,  1 Jun 2025 23:26:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 749C4C4CEE7;
 Sun,  1 Jun 2025 23:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748820383;
 bh=ZiUkEY/fA04/G5efdpgA0XeFvW3d3OGzxJQiCAm9cJE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=klDzNrJq1CgzFu/69DA0P6xuDAf0f/Emhc6Jeh2d0GifkOZBRpG/JhQU122u29Sd+
 bzb6UXt3vDfbX+bLGIGBIbQksZIXDAbbzJMKptmh9XPUVSle+bLZm4URQDtp5THaeV
 A1GWX0WEjOINdhJzGW1Spqs0DWBOw1Z88vC6xMdTS+4jcwcTtMDxF75L5tRh4wPBec
 W87Q0fZYDQeT7zfB97QCI6x1zBUp4oAAUw7jfHFQmu8ZS28+D1YSegZOY5ucr/PTpj
 dfrxRwcKUBVRbRb312qr/qMo7pE/YkVSRHDubVDsCK6qQDDPFsBhZPi4Sq1CItf1/I
 nTlQ0Qa1DqFqA==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Qasim Ijaz <qasdev00@gmail.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Sasha Levin <sashal@kernel.org>, ray.huang@amd.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, thomas.hellstrom@linux.intel.com,
 Arunpravin.PaneerSelvam@amd.com, karolina.stolarek@intel.com,
 jeff.johnson@oss.qualcomm.com, bigeasy@linutronix.de,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 6.15 042/110] drm/ttm/tests: fix incorrect assert in
 ttm_bo_unreserve_bulk()
Date: Sun,  1 Jun 2025 19:23:24 -0400
Message-Id: <20250601232435.3507697-42-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250601232435.3507697-1-sashal@kernel.org>
References: <20250601232435.3507697-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.15
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

From: Qasim Ijaz <qasdev00@gmail.com>

[ Upstream commit 878516a9e62cd220379e511d43dcf58df3a6ca9f ]

In the ttm_bo_unreserve_bulk() test function, resv is allocated using
kunit_kzalloc(), but the subsequent assertion mistakenly verifies the
ttm_dev pointer instead of the resv pointer.

Fix the assertion to properly verify the resv pointer.

Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20250313161424.10688-1-qasdev00@gmail.com
Reviewed-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

Let me check the commit message in the analysis: Based on my thorough
analysis, I can now provide a comprehensive assessment. **YES** This
commit should be backported to stable kernel trees. ## Detailed
Analysis: ### Nature of the Bug: The commit fixes a simple but
significant bug in the TTM (Translation Table Maps) test code. In the
`ttm_bo_unreserve_bulk()` test function, there's a copy-paste error
where: ```c resv = kunit_kzalloc(test, sizeof(*resv), GFP_KERNEL);
KUNIT_ASSERT_NOT_NULL(test, ttm_dev); // BUG: should be 'resv', not
'ttm_dev' ``` The assertion is checking the wrong pointer. It should be:
```c KUNIT_ASSERT_NOT_NULL(test, resv); ``` ### Why This Should Be
Backported: 1. **Important Test Infrastructure Bug**: This bug affects
TTM test validation, which is crucial for GPU driver stability. While
it's "only" test code, broken tests can mask real bugs or give false
confidence. 2. **Small, Contained Fix**: The change is minimal and
isolated - it only affects a single line in a test file with zero risk
of breaking production code. This matches the stable tree criteria of
minimal, low-risk fixes. 3. **Clear Bug Pattern**: This is an obvious
copy-paste error that was introduced in commit 588c4c8d58c4 when the
`resv` variable was added but the assertion wasn't updated accordingly.
4. **Follows Stable Tree Rules**: - Fixes an important bug (broken test
validation) - Extremely low regression risk (one-line change in test
code) - No architectural changes - Confined to a single subsystem 5.
**Historical Precedent**: Looking at similar commit #1 in the examples,
which was marked "Backport Status: YES", it also fixed TTM test code
with similar characteristics - a small, contained fix to test
infrastructure that ensures proper validation. 6. **Test Code
Importance**: Properly functioning tests are essential for kernel
stability. Broken tests in TTM could lead to GPU driver regressions
going undetected. ### Comparison with Similar Commits: - Similar to the
"YES" example which fixed TTM test warnings and was deemed suitable for
backporting - Unlike the "NO" examples which involved more complex logic
changes or reverts The commit message is clear, the change is minimal,
and it fixes a genuine bug in important test infrastructure without any
risk to production code.

 drivers/gpu/drm/ttm/tests/ttm_bo_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/tests/ttm_bo_test.c b/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
index f8f20d2f61740..e08e5a138420e 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
@@ -340,7 +340,7 @@ static void ttm_bo_unreserve_bulk(struct kunit *test)
 	KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
 
 	resv = kunit_kzalloc(test, sizeof(*resv), GFP_KERNEL);
-	KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
+	KUNIT_ASSERT_NOT_NULL(test, resv);
 
 	err = ttm_device_kunit_init(priv, ttm_dev, false, false);
 	KUNIT_ASSERT_EQ(test, err, 0);
-- 
2.39.5

