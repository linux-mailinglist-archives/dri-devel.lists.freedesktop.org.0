Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F548A21EF5
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 15:22:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3DE910E0E2;
	Wed, 29 Jan 2025 14:22:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="D9ngO9gG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5515D10E0E2
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 14:22:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id A4CFDA419B7;
 Wed, 29 Jan 2025 14:20:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1F19C4CEDF;
 Wed, 29 Jan 2025 14:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738160527;
 bh=7LU+104GySX0bit7gWT472rKcrJjYJPjMOVdrAH0IpE=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=D9ngO9gGyaf3+23A86bR2YSKhbS8TL625OHoWYscB/mpsKmQT9hF1n0iQfepU7JZg
 fJCp/+GCmPi4ycRKpnoSGfkydjOrjI8MAZP/QM5oKPqpsqiW13YXhUC5mMlflwLHOe
 YHM8V2amzpzfsX5IKWQp/Fu4ECm+mC7+pyMIGQZnEwcbe/KIliRqHMtoUXbXvce1h/
 ZINPOnNe7WyeGHajG0TPQ9vmBq9NLrU1EnzccgC53KDUKbVGRdoLPAlhdDV/JiTIno
 i2WOjKs3NnfXEObIiDurb3uku3ZkfLWD+gshXXA2wDqtoGqCr9QKhtociWn70aaPoa
 AD/J/Y+9I/pjQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 29 Jan 2025 15:21:53 +0100
Subject: [PATCH v2 1/4] drm/tests: hdmi: Fix WW_MUTEX_SLOWPATH failures
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250129-test-kunit-v2-1-fe59c43805d5@kernel.org>
References: <20250129-test-kunit-v2-0-fe59c43805d5@kernel.org>
In-Reply-To: <20250129-test-kunit-v2-0-fe59c43805d5@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1838; i=mripard@kernel.org;
 h=from:subject:message-id; bh=7LU+104GySX0bit7gWT472rKcrJjYJPjMOVdrAH0IpE=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDOmzLNtsbhyqm7s/uU2i7E7ugy8vJCVOhXaLJKYH3+Zge
 bKxpNmsYyoLgzAng6yYIssTmbDTy9sXVznYr/wBM4eVCWQIAxenAExkRxdjfd11w9JHlpNSdEvd
 Fi1P4bCLOPf41Ofr85gO/u2dKBvw9VrwW4GlS1oX7/mQ/m5NyzI+RcaGvwrhYctrlWz+ZXR9mfx
 v76dO470Mk22ObBaep/Up9nLSrVg+VZHpf7Y+71A9IWB23i0dAA==
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
Reported-by: Dave Airlie <airlied@gmail.com>
Closes: https://lore.kernel.org/r/CAPM=9tzJ4-ERDxvuwrCyUPY0=+P44orhp1kLWVGL7MCfpQjMEQ@mail.gmail.com/
Link: https://lore.kernel.org/r/20241031091558.2435850-1-mripard@kernel.org
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
index c3b693bb966f1f8b04066d19f520bfa4bf11c23d..e814b538c46c4d342604436beca64ac0bdb31526 100644
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
2.47.1

