Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C6193E600
	for <lists+dri-devel@lfdr.de>; Sun, 28 Jul 2024 17:42:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E028010E1DE;
	Sun, 28 Jul 2024 15:42:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QRsq/lsX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D3F110E1DF;
 Sun, 28 Jul 2024 15:42:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 97FEFCE0104;
 Sun, 28 Jul 2024 15:42:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BF68C4AF0A;
 Sun, 28 Jul 2024 15:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722181372;
 bh=evwQZkRUF/zumdh/YjluMsV7L3aSvbNQgjm+zZAIJKg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QRsq/lsXjn+QjtYWSkB+KSo86gP8dNi37pNq5NlHsQ7zT5G1jERJT2SfmCdF4UDgI
 9caCRWWl0XPuqBFj71NM5LsIW7nIs8KhUvkGgVBDNEuwGdeRrkHm8bOsz3t2RnBvCj
 PMChTOsXXmoDhNAsCot2DOWeMVw68vXJH1wKQw75tlmOSkElBKUiNkVo0wqi9bj3wQ
 bqhkXg258oKyICWWLFri9bLdTV+OWYUCx+tqAQLvV8C84ROib3C9lybj/PszZtqzLv
 0wVBDLTg6oVsFnqjUBnQivnmP4zHJY9pywzrxnTbvU1J9lw7EL+xO7k/ohfUOSJbLn
 7uVEpCAwhnDdA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Tim Huang <Tim.Huang@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 Xinhui.Pan@amd.com, airlied@gmail.com, daniel@ffwll.ch,
 shashank.sharma@amd.com, Felix.Kuehling@amd.com, rajneesh.bhardwaj@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.10 04/34] drm/amdgpu: fix potential resource leak
 warning
Date: Sun, 28 Jul 2024 11:40:28 -0400
Message-ID: <20240728154230.2046786-4-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240728154230.2046786-1-sashal@kernel.org>
References: <20240728154230.2046786-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.10.2
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

From: Tim Huang <Tim.Huang@amd.com>

[ Upstream commit 22a5daaec0660dd19740c4c6608b78f38760d1e6 ]

Clear resource leak warning that when the prepare fails,
the allocated amdgpu job object will never be released.

Signed-off-by: Tim Huang <Tim.Huang@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
index 66e8a016126b8..9b748d7058b5c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
@@ -102,6 +102,11 @@ static int amdgpu_vm_sdma_prepare(struct amdgpu_vm_update_params *p,
 	if (!r)
 		r = amdgpu_sync_push_to_job(&sync, p->job);
 	amdgpu_sync_free(&sync);
+
+	if (r) {
+		p->num_dw_left = 0;
+		amdgpu_job_free(p->job);
+	}
 	return r;
 }
 
-- 
2.43.0

