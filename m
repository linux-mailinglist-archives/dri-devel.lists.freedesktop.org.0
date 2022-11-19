Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93CF6630969
	for <lists+dri-devel@lfdr.de>; Sat, 19 Nov 2022 03:13:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14A2E10E7D6;
	Sat, 19 Nov 2022 02:13:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91BA010E724;
 Sat, 19 Nov 2022 02:13:14 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1FE72627C1;
 Sat, 19 Nov 2022 02:13:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CDC4C433C1;
 Sat, 19 Nov 2022 02:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668823993;
 bh=mmTliwXsNLCTNGG626gIBpomIlTwqu97eYzbGxNtVek=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=T15YcGhJZ8sdBJdYUAj41oikMue0ful0HOghaWFjkfF2Ft2vFDY6xWtVJbzV03Kb6
 pGlzTP/CyR4AZpK5CGyAddCOHyAhRPtz6nBEW5CZnyQJQ552ChFqC2wLaJIT0v28+U
 mIDI1JMyxnbfARDiNgQfoLrkzo6KUStq9cB2LFdKYK28JsBtBjvJP2liIuFDgoIpq5
 uBlOqWCI4ZDHuh2RCsHCDwYKWnGn3xPSjlO2kVUP7hIwDMV3gA0E3O1L5WZkU2Tupk
 ouuRmd3MjrOMdEBfFiZq89CXXEol+xpz5NwyL14oOQ8zO6cKKDwICUI4hMIf8GSPVq
 BwQKlQbF+ugjw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.0 38/44] drm/amdgpu: Unlock bo_list_mutex after
 error handling
Date: Fri, 18 Nov 2022 21:11:18 -0500
Message-Id: <20221119021124.1773699-38-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221119021124.1773699-1-sashal@kernel.org>
References: <20221119021124.1773699-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Philip Yang <Philip.Yang@amd.com>,
 Xinhui.Pan@amd.com, amd-gfx@lists.freedesktop.org, luben.tuikov@amd.com,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Philip Yang <Philip.Yang@amd.com>

[ Upstream commit 64f65135c41a75f933d3bca236417ad8e9eb75de ]

Get below kernel WARNING backtrace when pressing ctrl-C to kill kfdtest
application.

If amdgpu_cs_parser_bos returns error after taking bo_list_mutex, as
caller amdgpu_cs_ioctl will not unlock bo_list_mutex, this generates the
kernel WARNING.

Add unlock bo_list_mutex after amdgpu_cs_parser_bos error handling to
cleanup bo_list userptr bo.

 WARNING: kfdtest/2930 still has locks held!
 1 lock held by kfdtest/2930:
  (&list->bo_list_mutex){+.+.}-{3:3}, at: amdgpu_cs_ioctl+0xce5/0x1f10 [amdgpu]
  stack backtrace:
   dump_stack_lvl+0x44/0x57
   get_signal+0x79f/0xd00
   arch_do_signal_or_restart+0x36/0x7b0
   exit_to_user_mode_prepare+0xfd/0x1b0
   syscall_exit_to_user_mode+0x19/0x40
   do_syscall_64+0x40/0x80

Signed-off-by: Philip Yang <Philip.Yang@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index b7bae833c804..9d59f83c8faa 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -655,6 +655,7 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
 		}
 		mutex_unlock(&p->bo_list->bo_list_mutex);
 	}
+	mutex_unlock(&p->bo_list->bo_list_mutex);
 	return r;
 }
 
-- 
2.35.1

