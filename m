Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC1B4EF1F6
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 16:45:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3509610F4B6;
	Fri,  1 Apr 2022 14:45:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F4DC10F4B4;
 Fri,  1 Apr 2022 14:44:58 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1555CB824D5;
 Fri,  1 Apr 2022 14:44:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA4F3C340EE;
 Fri,  1 Apr 2022 14:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648824295;
 bh=s/I9A8Qj+Pf3szN/trXnD8eZt55ywktSOqlEN9N+ss8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UaEDcqSSM6VPWoZQ7R4U1buZOqM1y2YyzzpRdYP3l6t9RV96vCPdWTz68NNjhce11
 mGp5X7iXNUfF6r0u30N0CnjYdmhb4J4t6P1e+6PU6elCMAbM59bgbNL/TO6N+Knlp6
 Qc3Y+WpCO3wFJkgXrShcLbyu7sJnm6BaRuHFHgD7M62vSKumsV5fvbaib1vCwDrnWx
 yjdfAWP0niOaXTAqlbUJ+62ofO7ZijaBfwJxv/njtNpWIZDBIUzqKsuxE2jqYm+rVc
 m1++KU+BHflEZzqbgC3B8ndBTyK4kaKB1GTWtJcIcEwN6/J1L4yD6mejNKw6IcAQh9
 LyDPaDJ66fguw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 03/37] drm/amd/amdgpu/amdgpu_cs: fix refcount leak
 of a dma_fence obj
Date: Fri,  1 Apr 2022 10:44:12 -0400
Message-Id: <20220401144446.1954694-3-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220401144446.1954694-1-sashal@kernel.org>
References: <20220401144446.1954694-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Xin Tan <tanxin.ctf@gmail.com>,
 airlied@linux.ie, dri-devel@lists.freedesktop.org, Xinhui.Pan@amd.com,
 Xin Xiong <xiongx18@fudan.edu.cn>, sumit.semwal@linaro.org,
 linaro-mm-sig@lists.linaro.org, JinhuiEric.Huang@amd.com, nirmoy.das@amd.com,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Lang.Yu@amd.com, =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Ken.Xue@amd.com, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Xin Xiong <xiongx18@fudan.edu.cn>

[ Upstream commit dfced44f122c500004a48ecc8db516bb6a295a1b ]

This issue takes place in an error path in
amdgpu_cs_fence_to_handle_ioctl(). When `info->in.what` falls into
default case, the function simply returns -EINVAL, forgetting to
decrement the reference count of a dma_fence obj, which is bumped
earlier by amdgpu_cs_get_fence(). This may result in reference count
leaks.

Fix it by decreasing the refcount of specific object before returning
the error code.

Reviewed-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Xin Xiong <xiongx18@fudan.edu.cn>
Signed-off-by: Xin Tan <tanxin.ctf@gmail.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index 82823d9a8ba8..fddeea2b17e5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -1542,6 +1542,7 @@ int amdgpu_cs_fence_to_handle_ioctl(struct drm_device *dev, void *data,
 		return 0;
 
 	default:
+		dma_fence_put(fence);
 		return -EINVAL;
 	}
 }
-- 
2.34.1

