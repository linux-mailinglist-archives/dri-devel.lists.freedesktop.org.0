Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E145140DF7
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2020 16:35:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00C396F5F7;
	Fri, 17 Jan 2020 15:35:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p01-ob.smtp.rzone.de (mo6-p01-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5301::8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70C986F5F8
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2020 15:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1579275303;
 s=strato-dkim-0002; d=gerhold.net;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=GnI8Bp0K1YljVmvlfmAjnIh4XEe/cV0U0DPoo4WI4GA=;
 b=SEfbxBO5PfnCLpRrxn/ceWR4smGsixDGpPPSoM94hSda5KWtraexHATopSH1Wbu5Um
 LJWJK9NLefYt1BfWAWmWYd9TBOhpNbgk5i0fopFip3UuNjwCuBAE9b7xIibQHY5j1Zb+
 yvEFwAXuKgjPUAWD6edwGcjkehhWWYu6D5lDSMPyKAVGHOvzBn9MlQutFrRc1Am4PURI
 eXFj0hRrOq3D4kaLiYZRVEObAVaWgkPcpqacfw5s9kTT5RvWbVvDvk58eNCddq5m1Gp5
 TZXcsw3sedqqrP2wFzHAsWHB5cwLLqE99xIaVOZiCvVeTB2kc1DBsoVONZbza36PNoQ8
 m8lw==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXQrEOHTIXsNXwthI1"
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain by smtp.strato.de (RZmta 46.1.4 AUTH)
 with ESMTPSA id h048a6w0HFZ2opK
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Fri, 17 Jan 2020 16:35:02 +0100 (CET)
From: Stephan Gerhold <stephan@gerhold.net>
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH v3 1/2] drm/modes: Make sure to parse valid rotation value
 from cmdline
Date: Fri, 17 Jan 2020 16:34:28 +0100
Message-Id: <20200117153429.54700-2-stephan@gerhold.net>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200117153429.54700-1-stephan@gerhold.net>
References: <20200117153429.54700-1-stephan@gerhold.net>
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
Cc: David Airlie <airlied@linux.ie>, Stephan Gerhold <stephan@gerhold.net>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

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
---
 drivers/gpu/drm/drm_modes.c                       |  7 +++++++
 drivers/gpu/drm/selftests/drm_cmdline_selftests.h |  1 +
 .../gpu/drm/selftests/test-drm_cmdline_parser.c   | 15 +++++++++++++--
 3 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
index 10336b144c72..d4d64518e11b 100644
--- a/drivers/gpu/drm/drm_modes.c
+++ b/drivers/gpu/drm/drm_modes.c
@@ -1698,6 +1698,13 @@ static int drm_mode_parse_cmdline_options(const char *str,
 	if (rotation && freestanding)
 		return -EINVAL;
 
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
index ceac7af9a172..29e367db6118 100644
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
index 520f3e66a384..d96cd890def6 100644
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
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
