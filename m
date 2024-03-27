Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2991A88ED4B
	for <lists+dri-devel@lfdr.de>; Wed, 27 Mar 2024 18:57:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20C5510FEED;
	Wed, 27 Mar 2024 17:56:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gyJhsudI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24A6610FEF1;
 Wed, 27 Mar 2024 17:56:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 723AD615EB;
 Wed, 27 Mar 2024 17:56:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04744C433F1;
 Wed, 27 Mar 2024 17:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711562213;
 bh=81om+e8n4vrHpgDjOmkmoW483t3RenxrqBAsOHmYQXk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gyJhsudIqBxcsetwtVDJDjAzhnfjap4Hzg1pjrXZ5cCmQa1Vqqz7A0QOCTALf4FUT
 4h90vDIO4lk4bJ3ZfqFOOin7pQoPPxGgVx5+5ih37g3RqMmJIAAQ23P33FgAMCTgNG
 owTlNx7ttatG0969MEJhQNXwhFckhUWGYA9Xpn5ST0eiJHZe5iVVkXGvLmzedg1Nw+
 EnUQjASGScYzvtYxv4m2NymSYBDaL/YJyewDAMBn6jDiU+A4Q94BAdlEz2DMRCeqs8
 DYgBqeobMUj5CrCcvvTR5C4BGKr1oxMH30ypWlM0ck2IQcjld91pSdaMzITphk9ynC
 w1YmFYlPSZ8Hg==
From: Miguel Ojeda <ojeda@kernel.org>
To: Dave Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Alon Levy <alevy@redhat.com>, Frediano Ziglio <fziglio@redhat.com>,
 Miguel Ojeda <ojeda@kernel.org>, virtualization@lists.linux.dev,
 spice-devel@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] drm/qxl: remove unused variable from
 `qxl_process_single_command()`
Date: Wed, 27 Mar 2024 18:55:56 +0100
Message-ID: <20240327175556.233126-2-ojeda@kernel.org>
In-Reply-To: <20240327175556.233126-1-ojeda@kernel.org>
References: <20240327175556.233126-1-ojeda@kernel.org>
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

Clang 14 in an (essentially) defconfig loongarch64 build for next-20240327
reports [1]:

     drivers/gpu/drm/qxl/qxl_ioctl.c:148:14: error: variable 'num_relocs'
     set but not used [-Werror,-Wunused-but-set-variable]

The variable was originally used in the `out_free_bos` label, but commit
74d9a6335dce ("drm/qxl: Simplify cleaning qxl processing command")
removed the use that happened in that label.

Thus remove the unused variable.

Fixes: 74d9a6335dce ("drm/qxl: Simplify cleaning qxl processing command")
Closes: https://lore.kernel.org/lkml/CANiq72kqqQfUxLkHJYqeBAhpc6YcX7bfR96gmmbF=j8hEOykqw@mail.gmail.com/ [1]
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 drivers/gpu/drm/qxl/qxl_ioctl.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/qxl/qxl_ioctl.c b/drivers/gpu/drm/qxl/qxl_ioctl.c
index dd0f834d881c..506ae1f5e099 100644
--- a/drivers/gpu/drm/qxl/qxl_ioctl.c
+++ b/drivers/gpu/drm/qxl/qxl_ioctl.c
@@ -145,7 +145,7 @@ static int qxl_process_single_command(struct qxl_device *qdev,
 	struct qxl_release *release;
 	struct qxl_bo *cmd_bo;
 	void *fb_cmd;
-	int i, ret, num_relocs;
+	int i, ret;
 	int unwritten;
 
 	switch (cmd->type) {
@@ -200,7 +200,6 @@ static int qxl_process_single_command(struct qxl_device *qdev,
 	}
 
 	/* fill out reloc info structs */
-	num_relocs = 0;
 	for (i = 0; i < cmd->relocs_num; ++i) {
 		struct drm_qxl_reloc reloc;
 		struct drm_qxl_reloc __user *u = u64_to_user_ptr(cmd->relocs);
@@ -230,7 +229,6 @@ static int qxl_process_single_command(struct qxl_device *qdev,
 			reloc_info[i].dst_bo = cmd_bo;
 			reloc_info[i].dst_offset = reloc.dst_offset + release->release_offset;
 		}
-		num_relocs++;
 
 		/* reserve and validate the reloc dst bo */
 		if (reloc.reloc_type == QXL_RELOC_TYPE_BO || reloc.src_handle) {
-- 
2.44.0

