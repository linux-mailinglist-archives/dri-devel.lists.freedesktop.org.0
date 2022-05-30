Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB4F537C93
	for <lists+dri-devel@lfdr.de>; Mon, 30 May 2022 15:34:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5467010E89D;
	Mon, 30 May 2022 13:34:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DBB910E89D
 for <dri-devel@lists.freedesktop.org>; Mon, 30 May 2022 13:34:15 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E1E98B80DAF;
 Mon, 30 May 2022 13:34:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BEF0C3411A;
 Mon, 30 May 2022 13:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653917653;
 bh=Nk3kL6bonCgW2p1suaJIp+npmeYoouMji55NiDP4wXM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SazBpbz1mbQHuZYEeiYR7ywQEPMFKqcOxMjs5KKZ8pySmRkF9J4bZLEDosV24XaU5
 IROTsfJ+2Lr4S/BstpAf+rUgW162vD7vbKcK6QSOsPAtL+Lwu/cf0Bfl5jWgcs2nDI
 LKEsAbFbBFmLnUnlHZslNCSzRLrW3v1TWlcEUVDKOgdHn9wbl75qGvAdeHopKmaQ1w
 Pytz/8vxDB+xuChrE88VgqKftUVuhEYbJgCLRYmvl48DeGfN0FgFabrkRH6BdGXveD
 U/ufIsSKxhOq+R7UuKjukG5jqOI/bHjhVyssqbBpHExRr6WpHZQeCPiUhDR+qu6mt0
 kjabt/w8U5FUA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.17 054/135] drm/plane: Move range check for
 format_count earlier
Date: Mon, 30 May 2022 09:30:12 -0400
Message-Id: <20220530133133.1931716-54-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220530133133.1931716-1-sashal@kernel.org>
References: <20220530133133.1931716-1-sashal@kernel.org>
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
index 82afb854141b..fd0bf90fb4c2 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -249,6 +249,13 @@ static int __drm_universal_plane_init(struct drm_device *dev,
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
@@ -270,13 +277,6 @@ static int __drm_universal_plane_init(struct drm_device *dev,
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
 
-- 
2.35.1

