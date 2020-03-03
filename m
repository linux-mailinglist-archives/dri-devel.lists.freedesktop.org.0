Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB70176ACB
	for <lists+dri-devel@lfdr.de>; Tue,  3 Mar 2020 03:46:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEEC56E934;
	Tue,  3 Mar 2020 02:46:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 480826E92D
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2020 02:46:33 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5A97224677;
 Tue,  3 Mar 2020 02:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1583203593;
 bh=AFLhECNdQynG25OAfG50zgqOns9HClcAwKK6FJTao+o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=xJjHOBD47LcgyomUacrzezbv0DBFJGYl2T2W7Q5rcGbB9AulGFxkG7G1ju9WuaE8z
 ofLmzFAKkQmpaMr2KfFUyIcOeMjMMi9nX3yB7gk3ZpvhB76NFnykojgFwSzeFWcQD/
 ZRjm3kpUjGgoI7ZwUMo7iK3e+MxsXZwbUJxLXnk4=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.5 14/66] drm/modes: Make sure to parse valid
 rotation value from cmdline
Date: Mon,  2 Mar 2020 21:45:23 -0500
Message-Id: <20200303024615.8889-14-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200303024615.8889-1-sashal@kernel.org>
References: <20200303024615.8889-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, dri-devel@lists.freedesktop.org,
 Maxime Ripard <maxime@cerno.tech>, Stephan Gerhold <stephan@gerhold.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Stephan Gerhold <stephan@gerhold.net>

[ Upstream commit e6980a727154b793adb218fbc7b4d6af52a7e364 ]

A rotation value should have exactly one rotation angle.
At the moment there is no validation for this when parsing video=
parameters from the command line. This causes problems later on
when we try to combine the command line rotation with the panel
orientation.

To make sure that we generate a valid rotation value:
  - Set DRM_MODE_ROTATE_0 by default (if no rotate= option is set)
  - Validate that there is exactly one rotation angle set
    (i.e. specifying the rotate= option multiple times is invalid)

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
Link: https://patchwork.freedesktop.org/patch/msgid/20200117153429.54700-2-stephan@gerhold.net
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/drm_modes.c                       |  7 +++++++
 drivers/gpu/drm/selftests/drm_cmdline_selftests.h |  1 +
 .../gpu/drm/selftests/test-drm_cmdline_parser.c   | 15 +++++++++++++--
 3 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
index 88232698d7a00..3fd35e6b9d535 100644
--- a/drivers/gpu/drm/drm_modes.c
+++ b/drivers/gpu/drm/drm_modes.c
@@ -1672,6 +1672,13 @@ static int drm_mode_parse_cmdline_options(char *str, size_t len,
 		}
 	}
 
+	if (!(rotation & DRM_MODE_ROTATE_MASK))
+		rotation |= DRM_MODE_ROTATE_0;
+
+	/* Make sure there is exactly one rotation defined */
+	if (!is_power_of_2(rotation & DRM_MODE_ROTATE_MASK))
+		return -EINVAL;
+
 	mode->rotation_reflection = rotation;
 
 	return 0;
diff --git a/drivers/gpu/drm/selftests/drm_cmdline_selftests.h b/drivers/gpu/drm/selftests/drm_cmdline_selftests.h
index 6d61a0eb5d64f..84e6bc050bf2c 100644
--- a/drivers/gpu/drm/selftests/drm_cmdline_selftests.h
+++ b/drivers/gpu/drm/selftests/drm_cmdline_selftests.h
@@ -53,6 +53,7 @@ cmdline_test(drm_cmdline_test_rotate_0)
 cmdline_test(drm_cmdline_test_rotate_90)
 cmdline_test(drm_cmdline_test_rotate_180)
 cmdline_test(drm_cmdline_test_rotate_270)
+cmdline_test(drm_cmdline_test_rotate_multiple)
 cmdline_test(drm_cmdline_test_rotate_invalid_val)
 cmdline_test(drm_cmdline_test_rotate_truncated)
 cmdline_test(drm_cmdline_test_hmirror)
diff --git a/drivers/gpu/drm/selftests/test-drm_cmdline_parser.c b/drivers/gpu/drm/selftests/test-drm_cmdline_parser.c
index 013de9d27c35d..035f86c5d6482 100644
--- a/drivers/gpu/drm/selftests/test-drm_cmdline_parser.c
+++ b/drivers/gpu/drm/selftests/test-drm_cmdline_parser.c
@@ -856,6 +856,17 @@ static int drm_cmdline_test_rotate_270(void *ignored)
 	return 0;
 }
 
+static int drm_cmdline_test_rotate_multiple(void *ignored)
+{
+	struct drm_cmdline_mode mode = { };
+
+	FAIL_ON(drm_mode_parse_command_line_for_connector("720x480,rotate=0,rotate=90",
+							  &no_connector,
+							  &mode));
+
+	return 0;
+}
+
 static int drm_cmdline_test_rotate_invalid_val(void *ignored)
 {
 	struct drm_cmdline_mode mode = { };
@@ -888,7 +899,7 @@ static int drm_cmdline_test_hmirror(void *ignored)
 	FAIL_ON(!mode.specified);
 	FAIL_ON(mode.xres != 720);
 	FAIL_ON(mode.yres != 480);
-	FAIL_ON(mode.rotation_reflection != DRM_MODE_REFLECT_X);
+	FAIL_ON(mode.rotation_reflection != (DRM_MODE_ROTATE_0 | DRM_MODE_REFLECT_X));
 
 	FAIL_ON(mode.refresh_specified);
 
@@ -913,7 +924,7 @@ static int drm_cmdline_test_vmirror(void *ignored)
 	FAIL_ON(!mode.specified);
 	FAIL_ON(mode.xres != 720);
 	FAIL_ON(mode.yres != 480);
-	FAIL_ON(mode.rotation_reflection != DRM_MODE_REFLECT_Y);
+	FAIL_ON(mode.rotation_reflection != (DRM_MODE_ROTATE_0 | DRM_MODE_REFLECT_Y));
 
 	FAIL_ON(mode.refresh_specified);
 
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
