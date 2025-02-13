Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D64A3494E
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 17:13:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ED4210E45D;
	Thu, 13 Feb 2025 16:13:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6B10C10E45D
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 16:13:30 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 598D21756;
 Thu, 13 Feb 2025 08:13:50 -0800 (PST)
Received: from e112269-lin.cambridge.arm.com (e112269-lin.cambridge.arm.com
 [10.1.194.64])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CE70B3F6A8;
 Thu, 13 Feb 2025 08:13:27 -0800 (PST)
From: Steven Price <steven.price@arm.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 David Airlie <airlied@gmail.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: Steven Price <steven.price@arm.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Will Deacon <will@kernel.org>
Subject: [PATCH] drm/panthor: Clean up FW version information display
Date: Thu, 13 Feb 2025 16:12:48 +0000
Message-Id: <20250213161248.1642392-1-steven.price@arm.com>
X-Mailer: git-send-email 2.39.5
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

Assigning a string to an array which is too small to include the NUL
byte at the end causes a warning on some compilers. But this function
also has some other oddities like the 'header' array which is only ever
used within sizeof().

Tidy up the function by removing the 'header' array, allow the NUL byte
to be present in git_sha_header, and calculate the length directly from
git_sha_header.

Reported-by: Will Deacon <will@kernel.org>
Fixes: 9d443deb0441 ("drm/panthor: Display FW version information")
Signed-off-by: Steven Price <steven.price@arm.com>
---
Note that there should be no functional change from this patch.
---
 drivers/gpu/drm/panthor/panthor_fw.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
index 4a9c4afa9ad7..645fc6d2e63b 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.c
+++ b/drivers/gpu/drm/panthor/panthor_fw.c
@@ -636,8 +636,8 @@ static int panthor_fw_read_build_info(struct panthor_device *ptdev,
 				      u32 ehdr)
 {
 	struct panthor_fw_build_info_hdr hdr;
-	char header[9];
-	const char git_sha_header[sizeof(header)] = "git_sha: ";
+	const char git_sha_header[] = "git_sha: ";
+	const int header_len = sizeof(git_sha_header) - 1;
 	int ret;
 
 	ret = panthor_fw_binary_iter_read(ptdev, iter, &hdr, sizeof(hdr));
@@ -651,8 +651,7 @@ static int panthor_fw_read_build_info(struct panthor_device *ptdev,
 		return 0;
 	}
 
-	if (memcmp(git_sha_header, fw->data + hdr.meta_start,
-		   sizeof(git_sha_header))) {
+	if (memcmp(git_sha_header, fw->data + hdr.meta_start, header_len)) {
 		/* Not the expected header, this isn't metadata we understand */
 		return 0;
 	}
@@ -665,7 +664,7 @@ static int panthor_fw_read_build_info(struct panthor_device *ptdev,
 	}
 
 	drm_info(&ptdev->base, "Firmware git sha: %s\n",
-		 fw->data + hdr.meta_start + sizeof(git_sha_header));
+		 fw->data + hdr.meta_start + header_len);
 
 	return 0;
 }
-- 
2.39.5

