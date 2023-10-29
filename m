Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D91D7DAF54
	for <lists+dri-devel@lfdr.de>; Sun, 29 Oct 2023 23:58:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C3D710E1B7;
	Sun, 29 Oct 2023 22:58:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4E0A10E1B5;
 Sun, 29 Oct 2023 22:58:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 42BFB60EEA;
 Sun, 29 Oct 2023 22:58:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56AAEC43140;
 Sun, 29 Oct 2023 22:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1698620310;
 bh=MVrCHjUsyLJe1/vu/4GDTO0vv90SAVL620SSJs29+oM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=a0aTanq1ENpshfRYguHYAkXcaSBStSCjCFCldbrGudyaU0Wk/lcwwgt1ZTYVcAlnC
 p777690JLa/trvtRTw2qXV3F+FYjHxia6B1TZfc852g/Hs31MSuGo5/pyEmqK8ERUe
 qrJGfUIF6oPCq00OOWuIV7MzDmgj6XHiLYZCMZnuet0tHEXBfL8NFIPkAFFgnsItrG
 i1wyO3u7u4W2sSo7oPpaBSkmLXjwGEeUs0AROv0hca2xS7j+LUzRZkPhRdo//3cc0S
 2GPjTIGM4q+u2a9pEOoOseWktHFSUE5r+I4VzQJalt0lgeKVkMeoxjZqLodZW+bFlB
 /hyOS7SSm3Otw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 28/39] drm/amdgpu: Unset context priority is now
 invalid
Date: Sun, 29 Oct 2023 18:57:00 -0400
Message-ID: <20231029225740.790936-28-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231029225740.790936-1-sashal@kernel.org>
References: <20231029225740.790936-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.60
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
Cc: Sasha Levin <sashal@kernel.org>, zhenguo.yin@amd.com, lijo.lazar@amd.com,
 pierre-eric.pelloux-prayer@amd.com, Xinhui.Pan@amd.com,
 amd-gfx@lists.freedesktop.org, Luben Tuikov <luben.tuikov@amd.com>,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com, James.Zhu@amd.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Luben Tuikov <luben.tuikov@amd.com>

[ Upstream commit eab0261967aeab528db4d0a51806df8209aec179 ]

A context priority value of AMD_CTX_PRIORITY_UNSET is now invalid--instead of
carrying it around and passing it to the Direct Rendering Manager--and it
becomes AMD_CTX_PRIORITY_NORMAL in amdgpu_ctx_ioctl(), the gateway to context
creation.

Cc: Alex Deucher <Alexander.Deucher@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Signed-off-by: Luben Tuikov <luben.tuikov@amd.com>
Acked-by: Alex Deucher <Alexander.Deucher@amd.com>
Link: https://lore.kernel.org/r/20231017035656.8211-1-luben.tuikov@amd.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
index d2139ac121595..fdbeafda4e80a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
@@ -47,7 +47,6 @@ const unsigned int amdgpu_ctx_num_entities[AMDGPU_HW_IP_NUM] = {
 bool amdgpu_ctx_priority_is_valid(int32_t ctx_prio)
 {
 	switch (ctx_prio) {
-	case AMDGPU_CTX_PRIORITY_UNSET:
 	case AMDGPU_CTX_PRIORITY_VERY_LOW:
 	case AMDGPU_CTX_PRIORITY_LOW:
 	case AMDGPU_CTX_PRIORITY_NORMAL:
@@ -55,6 +54,7 @@ bool amdgpu_ctx_priority_is_valid(int32_t ctx_prio)
 	case AMDGPU_CTX_PRIORITY_VERY_HIGH:
 		return true;
 	default:
+	case AMDGPU_CTX_PRIORITY_UNSET:
 		return false;
 	}
 }
-- 
2.42.0

