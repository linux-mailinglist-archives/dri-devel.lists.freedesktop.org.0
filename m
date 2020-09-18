Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C65F26EB3E
	for <lists+dri-devel@lfdr.de>; Fri, 18 Sep 2020 04:04:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B14026E441;
	Fri, 18 Sep 2020 02:04:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42B6F6E440
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Sep 2020 02:04:24 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5ECA223119;
 Fri, 18 Sep 2020 02:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600394664;
 bh=f8gRk8eAyptuVsstm1uPSzF0miGBAcPzNLfF8INKp44=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GzuhfYwEojeUcWNHQwQwLq0XYRbt7pNkcRY7gvW4tP+4ImBMYBoJvRP4eJnszZ6u3
 02MuZpCCHoFxS7TCJIe++5pUQspmqm01h0S9wA+jjxYtmKbeOduW8Gd4SK+PjQ+Egv
 pbDwDEBbFhPduHPVHKCIJXMUdtsEnWEzkclxnsVE=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 158/330] drm/amdgpu: increase atombios cmd timeout
Date: Thu, 17 Sep 2020 21:58:18 -0400
Message-Id: <20200918020110.2063155-158-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200918020110.2063155-1-sashal@kernel.org>
References: <20200918020110.2063155-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 John Clements <john.clements@amd.com>, dri-devel@lists.freedesktop.org,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Clements <john.clements@amd.com>

[ Upstream commit 1b3460a8b19688ad3033b75237d40fa580a5a953 ]

mitigates race condition on BACO reset between GPU bootcode and driver reload

Reviewed-by: Hawking Zhang <Hawking.Zhang@amd.com>
Signed-off-by: John Clements <john.clements@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/atom.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/atom.c b/drivers/gpu/drm/amd/amdgpu/atom.c
index dd30f4e61a8cd..cae426c7c0863 100644
--- a/drivers/gpu/drm/amd/amdgpu/atom.c
+++ b/drivers/gpu/drm/amd/amdgpu/atom.c
@@ -744,8 +744,8 @@ static void atom_op_jump(atom_exec_context *ctx, int *ptr, int arg)
 			cjiffies = jiffies;
 			if (time_after(cjiffies, ctx->last_jump_jiffies)) {
 				cjiffies -= ctx->last_jump_jiffies;
-				if ((jiffies_to_msecs(cjiffies) > 5000)) {
-					DRM_ERROR("atombios stuck in loop for more than 5secs aborting\n");
+				if ((jiffies_to_msecs(cjiffies) > 10000)) {
+					DRM_ERROR("atombios stuck in loop for more than 10secs aborting\n");
 					ctx->abort = true;
 				}
 			} else {
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
