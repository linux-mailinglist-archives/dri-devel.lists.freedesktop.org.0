Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 40558537E04
	for <lists+dri-devel@lfdr.de>; Mon, 30 May 2022 15:48:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2612B10EA9E;
	Mon, 30 May 2022 13:48:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (unknown [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33F8410EA9D
 for <dri-devel@lists.freedesktop.org>; Mon, 30 May 2022 13:48:01 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AB90160FDE;
 Mon, 30 May 2022 13:48:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0241EC3411A;
 Mon, 30 May 2022 13:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653918479;
 bh=4tvL/uObB8oELHOKTh9in7xifhIumfAmb8eA+LaNlpc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=F50vHFjVCwUXDCoJK2FgPIkyhMJK9dX9mj0DK+VpRO/KOlUhbrNDv8fGq7Sr0qWCy
 R6q6UCKWec9Cx3uS/g2aQT6ftbhwOXwZW4kc0bGp5aCjqsMR2vlaIkKyybfThn4EKX
 I94Sv+k1CiquoTCJi5UKUGFQ+k6s1kvB7CtRYiw3PThxkcEARNCGLEbRvJAmLlXH3h
 mdd/NAFzypk1wGSsf+ocCCgdXcpgO99cqZRjIOJdMsrniSNPkNAgtwYgeKuP4Cf1MQ
 8U3cfMMHHLrCGJiELFfJkT8Bystvwbf8a+jN1x6EQWe9bE6Av7T2MrPbumFXidy/HS
 4KLj0x4k+L8og==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 23/55] drm/plane: Move range check for
 format_count earlier
Date: Mon, 30 May 2022 09:46:29 -0400
Message-Id: <20220530134701.1935933-23-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220530134701.1935933-1-sashal@kernel.org>
References: <20220530134701.1935933-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, airlied@linux.ie,
 Liviu Dudau <liviu.dudau@arm.com>, Steven Price <steven.price@arm.com>,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Steven Price <steven.price@arm.com>

[ Upstream commit 4b674dd69701c2e22e8e7770c1706a69f3b17269 ]

While the check for format_count > 64 in __drm_universal_plane_init()
shouldn't be hit (it's a WARN_ON), in its current position it will then
leak the plane->format_types array and fail to call
drm_mode_object_unregister() leaking the modeset identifier. Move it to
the start of the function to avoid allocating those resources in the
first place.

Signed-off-by: Steven Price <steven.price@arm.com>
Signed-off-by: Liviu Dudau <liviu.dudau@arm.com>
Link: https://lore.kernel.org/dri-devel/20211203102815.38624-1-steven.price@arm.com/
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/drm_plane.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index d6ad60ab0d38..6bdebcca5690 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -186,6 +186,13 @@ int drm_universal_plane_init(struct drm_device *dev, struct drm_plane *plane,
 	if (WARN_ON(config->num_total_plane >= 32))
 		return -EINVAL;
 
+	/*
+	 * First driver to need more than 64 formats needs to fix this. Each
+	 * format is encoded as a bit and the current code only supports a u64.
+	 */
+	if (WARN_ON(format_count > 64))
+		return -EINVAL;
+
 	WARN_ON(drm_drv_uses_atomic_modeset(dev) &&
 		(!funcs->atomic_destroy_state ||
 		 !funcs->atomic_duplicate_state));
@@ -207,13 +214,6 @@ int drm_universal_plane_init(struct drm_device *dev, struct drm_plane *plane,
 		return -ENOMEM;
 	}
 
-	/*
-	 * First driver to need more than 64 formats needs to fix this. Each
-	 * format is encoded as a bit and the current code only supports a u64.
-	 */
-	if (WARN_ON(format_count > 64))
-		return -EINVAL;
-
 	if (format_modifiers) {
 		const uint64_t *temp_modifiers = format_modifiers;
 		while (*temp_modifiers++ != DRM_FORMAT_MOD_INVALID)
-- 
2.35.1

