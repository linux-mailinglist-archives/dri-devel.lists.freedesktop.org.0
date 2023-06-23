Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9F273BBC3
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 17:35:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18E4D10E658;
	Fri, 23 Jun 2023 15:35:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 450 seconds by postgrey-1.36 at gabe;
 Fri, 23 Jun 2023 15:35:04 UTC
Received: from knopi.disroot.org (knopi.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62CF810E658
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 15:35:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id 2CB8444CC3;
 Fri, 23 Jun 2023 17:27:32 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from knopi.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FpZaZEXR2z-q; Fri, 23 Jun 2023 17:27:31 +0200 (CEST)
From: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1687534051; bh=OQuLU9BDJDTLdjsCyljauuBB36B9J2a1Ln7ZVQudRBU=;
 h=From:To:Cc:Subject:Date;
 b=YZpTl87GoaspziwZBeb1I5pAHo9jBqZpNXjDY2LWc77NT8eaWU3DTBMGWjS+IC4R2
 bJ7inLRSu8G9AUqVGltHxC881fSA66lMEmZOvgSF/5tIhdpVcX4GhBXvqxRX7b9kCs
 H/FXQnPN4FlPrh2lF+d6CmSdiCg3vKZ5aCQgXpb7yAciMTre1KgdHcTh0mDxRdhmVs
 xgxbVZ3FnVZo+pvUMrq5grOaOXQlkesc3NwFDlvHJXhxMKZ1V8KNU+97zF1fda3LBc
 7vdRn9CGdY61HkktXFIZYLX+V9U/i9xsn8Kc1J7YW0IV+HpLUcHcjXS/h0lCp+7Wf2
 os8OiJ8rhcobg==
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/tests: Fix swapped test parameter names
Date: Fri, 23 Jun 2023 12:25:18 -0300
Message-Id: <20230623152518.8603-1-gcarlos@disroot.org>
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
Cc: michal.winiarski@intel.com, tales.aparecida@gmail.com, dlatypov@google.com,
 Carlos Eduardo Gallo Filho <gcarlos@disroot.org>, javierm@redhat.com,
 mairacanal@riseup.net, andrealmeid@riseup.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The "YVU420 DRM_MODE_FB_MODIFIERS set without modifier" test
hadn't DRM_MODE_FB_MODIFIERS set, so that it was in fact testing
another case, while the "YVU420 Normal sizes" test in turn was with
DRM_MODE_FB_MODIFIERS set and without modifiers, what should be
the case tested by the former, which also in turn fit in what
"YVU320 Normal sizes" should be, meaning that they were swapped.

Signed-off-by: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
---
 drivers/gpu/drm/tests/drm_framebuffer_test.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_framebuffer_test.c b/drivers/gpu/drm/tests/drm_framebuffer_test.c
index df235b7fdaa5..f759d9f3b76e 100644
--- a/drivers/gpu/drm/tests/drm_framebuffer_test.c
+++ b/drivers/gpu/drm/tests/drm_framebuffer_test.c
@@ -178,13 +178,13 @@ static const struct drm_framebuffer_test drm_framebuffer_create_cases[] = {
 		 .handles = { 1, 1, 1 }, .pitches = { 600, 600, 600 },
 	}
 },
-{ .buffer_created = 1, .name = "YVU420 Normal sizes",
+{ .buffer_created = 1, .name = "YVU420 DRM_MODE_FB_MODIFIERS set without modifier",
 	.cmd = { .width = 600, .height = 600, .pixel_format = DRM_FORMAT_YVU420,
 		 .handles = { 1, 1, 1 }, .flags = DRM_MODE_FB_MODIFIERS,
 		 .pitches = { 600, 300, 300 },
 	}
 },
-{ .buffer_created = 1, .name = "YVU420 DRM_MODE_FB_MODIFIERS set without modifier",
+{ .buffer_created = 1, .name = "YVU420 Normal sizes",
 	.cmd = { .width = 600, .height = 600, .pixel_format = DRM_FORMAT_YVU420,
 		 .handles = { 1, 1, 1 }, .pitches = { 600, 300, 300 },
 	}
-- 
2.39.3

