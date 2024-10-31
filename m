Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D949B9299
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2024 14:53:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6076D10E9D5;
	Fri,  1 Nov 2024 13:53:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="S8wr92tM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37AF010E9D5
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Nov 2024 13:53:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 182315C8C92;
 Thu, 31 Oct 2024 09:15:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A6FDC4CEC3;
 Thu, 31 Oct 2024 09:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730366161;
 bh=XIugU4zHs73CsppReIRmbB2ZQRmZ2BWnahAnvlnYCFQ=;
 h=From:To:Cc:Subject:Date:From;
 b=S8wr92tMXdB8CSo3xyVqbXvu9EKLZCk4g09ytCWr+GyBfnuoHpHU1JkUZn5quXmAP
 TomKkIH8VpaKk2gjbOeYx5sXgODuel7sH5NvmF5PbA4gJVByeYj4NYqk/EQkjcNmUU
 WewcSS7rEixQ7euRrFQpIVU8ZsG+FFGElVhsXbg2cgNOHikprobpMSR3emaksxTSbG
 f0zGOtgOP/vPCITCK5ouDpFx5DxJt4WHea7rV8rSXlmxEwpE2A/7JpWji7MeQGrUhC
 Zohn/iZZBBluxaqZ7enhpepdITyr+368q7XKzgoMJavuYrNAUIyqMZ6UsXFEzcvt4J
 d0pdEK0MhUnrA==
From: Maxime Ripard <mripard@kernel.org>
To: Simona Vetter <simona.vetter@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/tests: hdmi: Fix WW_MUTEX_SLOWPATH failures
Date: Thu, 31 Oct 2024 10:15:57 +0100
Message-ID: <20241031091558.2435850-1-mripard@kernel.org>
X-Mailer: git-send-email 2.47.0
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

The light_up_connector helper function in the HDMI infrastructure unit
tests uses drm_atomic_set_crtc_for_connector(), but fails when it
returns an error.

This function can return EDEADLK though if the sequence needs to be
restarted, and WW_MUTEX_SLOWPATH is meant to test that we handle it
properly.

Let's handle EDEADLK and restart the sequence in our tests as well.

Fixes: eb66d34d793e ("drm/tests: Add output bpc tests")
Closes: https://lore.kernel.org/r/CAPM=9tzJ4-ERDxvuwrCyUPY0=+P44orhp1kLWVGL7MCfpQjMEQ@mail.gmail.com/
Reported-by: Dave Airlie <airlied@gmail.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
index 34ee95d41f29..e2441092a8e9 100644
--- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
@@ -68,14 +68,21 @@ static int light_up_connector(struct kunit *test,
 	int ret;
 
 	state = drm_kunit_helper_atomic_state_alloc(test, drm, ctx);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
 
+retry:
 	conn_state = drm_atomic_get_connector_state(state, connector);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, conn_state);
 
 	ret = drm_atomic_set_crtc_for_connector(conn_state, crtc);
+	if (ret == -EDEADLK) {
+		drm_atomic_state_clear(state);
+		ret = drm_modeset_backoff(ctx);
+		if (!ret)
+			goto retry;
+	}
 	KUNIT_EXPECT_EQ(test, ret, 0);
 
 	crtc_state = drm_atomic_get_crtc_state(state, crtc);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc_state);
 
-- 
2.47.0

