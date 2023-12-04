Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 63830804001
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 21:37:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19F5C10E400;
	Mon,  4 Dec 2023 20:37:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1304110E3FF;
 Mon,  4 Dec 2023 20:37:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id ADFD3CE0039;
 Mon,  4 Dec 2023 20:37:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DEF5C433C7;
 Mon,  4 Dec 2023 20:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701722238;
 bh=Psb9RTZFuE/U1pj2kV4Ja+LRykSEd4btKLMZAtk5CkY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=I5pIZjRkQ9rib2vSnlMKC6E+BzFIxi1+bXKGcW5fkmeHgmW9n9hoWrS26cY3l/C9K
 KTNeOszjSoWyk84cRbKV2Z7nlYHY5Aqzu7Dsbj5vMwhU7ACy9qdpn7f6MYN7q8BhNn
 64xtXpjF5tkIzaeTCAihpSJ1gg4yfwVlNJZEmsiAnfJQodkmaf1xo3U8HOEC9jD16o
 yCXXqWe+m+aY6Qn1zxELA8tbG3jwHSECwsTRkKHwffZ3lFRrMC34decI05ciY7Hv7G
 3nUGG5btWegQbx0gfqoA6PlIgZWIa6dxEjcONT6uxOxptKLA4zB8Q5i0SZVauMYSce
 /CK3UdSm7gAzg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 6/7] drm/amdgpu: Fix cat debugfs amdgpu_regs_didt
 causes kernel null pointer
Date: Mon,  4 Dec 2023 15:36:49 -0500
Message-ID: <20231204203656.2094777-6-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231204203656.2094777-1-sashal@kernel.org>
References: <20231204203656.2094777-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.10.202
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
Cc: Sasha Levin <sashal@kernel.org>, tom.stdenis@amd.com,
 srinivasan.shanmugam@amd.com, shashank.sharma@amd.com, Xinhui.Pan@amd.com,
 qu.huang@linux.dev, amd-gfx@lists.freedesktop.org, Lu Yao <yaolu@kylinos.cn>,
 le.ma@amd.com, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, andrealmeid@igalia.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Hawking.Zhang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Lu Yao <yaolu@kylinos.cn>

[ Upstream commit 2161e09cd05a50d80736fe397145340d2e8f6c05 ]

For 'AMDGPU_FAMILY_SI' family cards, in 'si_common_early_init' func, init
'didt_rreg' and 'didt_wreg' to 'NULL'. But in func
'amdgpu_debugfs_regs_didt_read/write', using 'RREG32_DIDT' 'WREG32_DIDT'
lacks of relevant judgment. And other 'amdgpu_ip_block_version' that use
these two definitions won't be added for 'AMDGPU_FAMILY_SI'.

So, add null pointer judgment before calling.

Reviewed-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Lu Yao <yaolu@kylinos.cn>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
index 48df32dd352ed..3e573077368b3 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
@@ -459,6 +459,9 @@ static ssize_t amdgpu_debugfs_regs_didt_read(struct file *f, char __user *buf,
 	if (size & 0x3 || *pos & 0x3)
 		return -EINVAL;
 
+	if (!adev->didt_rreg)
+		return -EOPNOTSUPP;
+
 	r = pm_runtime_get_sync(adev_to_drm(adev)->dev);
 	if (r < 0) {
 		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
@@ -518,6 +521,9 @@ static ssize_t amdgpu_debugfs_regs_didt_write(struct file *f, const char __user
 	if (size & 0x3 || *pos & 0x3)
 		return -EINVAL;
 
+	if (!adev->didt_wreg)
+		return -EOPNOTSUPP;
+
 	r = pm_runtime_get_sync(adev_to_drm(adev)->dev);
 	if (r < 0) {
 		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
-- 
2.42.0

