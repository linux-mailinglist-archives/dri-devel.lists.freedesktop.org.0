Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE257E3D6B
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 13:28:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9C7710E592;
	Tue,  7 Nov 2023 12:28:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1174510E592
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Nov 2023 12:28:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 71A89CE0F1F;
 Tue,  7 Nov 2023 12:28:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A84CC433CC;
 Tue,  7 Nov 2023 12:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699360108;
 bh=e7p5a03pSCO9byzAK2+njv6CMdRA/EG/kpKAQ1Fbfos=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TXIHpHpXtUuKaBHfMsmvRTsV5RrbLf3jJoKYA+wCsOx04Mx/qsQsEOaaomtaxJZhU
 XV/mhp0CV2EVze2whkJuRZNslFbv/3t1aZeY4PJ9IZW3ws9RIOWP2+WiuiYqs+4MOV
 Y5vy6Qq2xm8/BCUD8sBz9NMait3NUBXFkKst7k6sjTkZXm3HNNF/aFnatpGOJ4lC6B
 ucsAKOu/4ztpiiWYy/ZY6gbiTQeUiYBpG7o8JyZ8MjM4rdOSGnGCu9oZCE2FTMfb6b
 NiLShWgdjLlmJQPJO5tg8CJPBTwCPvnTZGZe/D1QONxTNDeqcfqCu+rwrYQNhMIX4/
 k5hYeY3Xt8AjA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 10/25] drm_lease.c: copy user-array safely
Date: Tue,  7 Nov 2023 07:26:49 -0500
Message-ID: <20231107122745.3761613-10-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231107122745.3761613-1-sashal@kernel.org>
References: <20231107122745.3761613-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.61
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
Cc: Sasha Levin <sashal@kernel.org>, Kees Cook <keescook@chromium.org>,
 Philipp Stanner <pstanner@redhat.com>, mripard@kernel.org,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de,
 David Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Philipp Stanner <pstanner@redhat.com>

[ Upstream commit f37d63e219c39199a59b8b8a211412ff27192830 ]

Currently, there is no overflow-check with memdup_user().

Use the new function memdup_array_user() instead of memdup_user() for
duplicating the user-space array safely.

Suggested-by: David Airlie <airlied@redhat.com>
Signed-off-by: Philipp Stanner <pstanner@redhat.com>
Reviewed-by: Kees Cook <keescook@chromium.org>
Reviewed-by: Zack Rusin <zackr@vmware.com>
Signed-off-by: Dave Airlie <airlied@redhat.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20230920123612.16914-6-pstanner@redhat.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/drm_lease.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_lease.c b/drivers/gpu/drm/drm_lease.c
index d72c2fac0ff1a..b7362356e5448 100644
--- a/drivers/gpu/drm/drm_lease.c
+++ b/drivers/gpu/drm/drm_lease.c
@@ -507,8 +507,8 @@ int drm_mode_create_lease_ioctl(struct drm_device *dev,
 	/* Handle leased objects, if any */
 	idr_init(&leases);
 	if (object_count != 0) {
-		object_ids = memdup_user(u64_to_user_ptr(cl->object_ids),
-					 array_size(object_count, sizeof(__u32)));
+		object_ids = memdup_array_user(u64_to_user_ptr(cl->object_ids),
+					       object_count, sizeof(__u32));
 		if (IS_ERR(object_ids)) {
 			ret = PTR_ERR(object_ids);
 			idr_destroy(&leases);
-- 
2.42.0

