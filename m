Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A265B83A5
	for <lists+dri-devel@lfdr.de>; Wed, 14 Sep 2022 11:02:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8748810E8BA;
	Wed, 14 Sep 2022 09:02:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD47610E8BA
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Sep 2022 09:01:58 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3F7EA61982;
 Wed, 14 Sep 2022 09:01:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 966FFC433D6;
 Wed, 14 Sep 2022 09:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663146117;
 bh=iygKThSUt2oRdx8axchV5M5xahy5an58AJy+GGf6yAc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IwPZN5f2I1/CyjNHbA/ISFaxMKhcqSRmrcGcHDq02BsC+TQKHCDGqLoh2Wjlh9pK5
 ZK3YKk1DEK+3QlEJzunCVj4/oBxNmLg1bZKSmHD/zynZEHCwNt3ZYJixF10EiaJnUU
 bpYxjAKAAhdFwH3n+kJbSn8Vz2CwzWsk8FmMp+in+qU/z6PqDP0ACqusUz3gvO4yYo
 TTr3M6PefucpX2Na6/zLX6Mq6uMEqtwXWGhnreUylMVh/1lL8lE2XNUdIBpeG3iAPF
 ArcSWafMsEQhfO9VcrbpXQO4dDhOpPuR0aLw+h2TkSLxi22S+iIk0Un5p9ApguaA6K
 thSkp5PnySXEw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.19 15/22] drm/ttm: update bulk move object of ghost
 BO
Date: Wed, 14 Sep 2022 05:00:56 -0400
Message-Id: <20220914090103.470630-15-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220914090103.470630-1-sashal@kernel.org>
References: <20220914090103.470630-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: ZhenGuo Yin <zhenguo.yin@amd.com>, Sasha Levin <sashal@kernel.org>,
 airlied@linux.ie, dri-devel@lists.freedesktop.org, ray.huang@amd.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: ZhenGuo Yin <zhenguo.yin@amd.com>

[ Upstream commit d91c411c744b55e860fbafc9a499f4f22d64c762 ]

[Why]
Ghost BO is released with non-empty bulk move object. There is a
warning trace:
WARNING: CPU: 19 PID: 1582 at ttm/ttm_bo.c:366 ttm_bo_release+0x2e1/0x2f0 [amdttm]
Call Trace:
  amddma_resv_reserve_fences+0x10d/0x1f0 [amdkcl]
  amdttm_bo_put+0x28/0x30 [amdttm]
  amdttm_bo_move_accel_cleanup+0x126/0x200 [amdttm]
  amdgpu_bo_move+0x1a8/0x770 [amdgpu]
  ttm_bo_handle_move_mem+0xb0/0x140 [amdttm]
  amdttm_bo_validate+0xbf/0x100 [amdttm]

[How]
The resource of ghost BO should be moved to LRU directly, instead of
using bulk move. The bulk move object of ghost BO should set to NULL
before function ttm_bo_move_to_lru_tail_unlocked.

v2: set bulk move to NULL manually if no resource associated with ghost BO

Fixed: 5b951e487fd6bf5f ("drm/ttm: fix bulk move handling v2")
Signed-off-by: ZhenGuo Yin <zhenguo.yin@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Christian König <christian.koenig@amd.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20220906084619.2545456-1-zhenguo.yin@amd.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/ttm/ttm_bo_util.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index 1cbfb00c1d658..57a27847206ff 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -239,6 +239,9 @@ static int ttm_buffer_object_transfer(struct ttm_buffer_object *bo,
 	if (fbo->base.resource) {
 		ttm_resource_set_bo(fbo->base.resource, &fbo->base);
 		bo->resource = NULL;
+		ttm_bo_set_bulk_move(&fbo->base, NULL);
+	} else {
+		fbo->base.bulk_move = NULL;
 	}
 
 	dma_resv_init(&fbo->base.base._resv);
-- 
2.35.1

