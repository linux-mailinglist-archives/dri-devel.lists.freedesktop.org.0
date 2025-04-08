Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D0FA7F661
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 09:34:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6445210E5EF;
	Tue,  8 Apr 2025 07:34:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UoOAfjsd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E654210E5EE
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Apr 2025 07:34:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id B662EA48ECD;
 Tue,  8 Apr 2025 07:28:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE3D4C4CEEA;
 Tue,  8 Apr 2025 07:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744097667;
 bh=dWe7Fz+nhJsB3QR1kEnLv2yiss8BTbIes6Bs4jDjbNI=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=UoOAfjsdM2w0CH240aPIYDb3rS5O76eBW44xynngk7QUfgt4oRHDbGiCO3P9Homru
 cRV/6z7Nd8oMBgAZ6/7baE6cRCVzbY3OBj5tk2yZXWvFZourDIbQfG1n0d8RC9+1Lk
 /TaFNSaT78zp6oB/5SYG2nvF/S0sMP7ZakviAhRwCKfdK72qua2OSC/6ni88LUaUKp
 iF47AQV1LecNHc9TfWsrYnhpn107F7WAjGMNl8L17QjF/ek5QHYgOMz5GuZjBqXc4k
 VfAf08HrHC+6EDQ7VTlsKnEPoBEYnue40t+p8RmP9ZtfnTKFv+PGY4oqAAXxW+C1Fz
 S0+g+sU8jwsXA==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 08 Apr 2025 09:34:08 +0200
Subject: [PATCH 2/7] drm/tests: modeset: Fix drm_display_mode memory leak
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-drm-kunit-drm-display-mode-memleak-v1-2-996305a2e75a@kernel.org>
References: <20250408-drm-kunit-drm-display-mode-memleak-v1-0-996305a2e75a@kernel.org>
In-Reply-To: <20250408-drm-kunit-drm-display-mode-memleak-v1-0-996305a2e75a@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: Philipp Stanner <phasta@mailbox.org>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1372; i=mripard@kernel.org;
 h=from:subject:message-id; bh=dWe7Fz+nhJsB3QR1kEnLv2yiss8BTbIes6Bs4jDjbNI=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDOlfLpZfe8822fVS1VGWR4x5pg73OHoT1N+fM5teq3A+/
 ubsznleHaUsDGJcDLJiiiwxwuZL4k7Net3JxjcPZg4rE8gQBi5OAZhI1TuGf9qh/94UTIxT3VTt
 7viVZ31MZEHu9dmrPPtSv5TvS+GcLsrIcNuPnWVZwNr4BoFDR78mzWXO/bC33N131pmC/TNcZmj
 s4QIA
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

drm_mode_find_dmt() returns a drm_display_mode that needs to be
destroyed later one. The drm_test_pick_cmdline_res_1920_1080_60() test
never does however, which leads to a memory leak.

Let's make sure it's freed.

Closes: https://lore.kernel.org/dri-devel/a7655158a6367ac46194d57f4b7433ef0772a73e.camel@mailbox.org/
Fixes: 8fc0380f6ba7 ("drm/client: Add some tests for drm_connector_pick_cmdline_mode()")
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/tests/drm_client_modeset_test.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_client_modeset_test.c b/drivers/gpu/drm/tests/drm_client_modeset_test.c
index 7516f6cb36e4e3a1ed3a655de6f6a4479a0efade..3e9518d7b8b7eb92f1be3ce376d850cbab638d10 100644
--- a/drivers/gpu/drm/tests/drm_client_modeset_test.c
+++ b/drivers/gpu/drm/tests/drm_client_modeset_test.c
@@ -93,10 +93,13 @@ static void drm_test_pick_cmdline_res_1920_1080_60(struct kunit *test)
 	int ret;
 
 	expected_mode = drm_mode_find_dmt(priv->drm, 1920, 1080, 60, false);
 	KUNIT_ASSERT_NOT_NULL(test, expected_mode);
 
+	ret = drm_kunit_add_mode_destroy_action(test, expected_mode);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
 	KUNIT_ASSERT_TRUE(test,
 			  drm_mode_parse_command_line_for_connector(cmdline,
 								    connector,
 								    cmdline_mode));
 

-- 
2.49.0

