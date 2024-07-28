Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5362393E656
	for <lists+dri-devel@lfdr.de>; Sun, 28 Jul 2024 17:46:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B779810E257;
	Sun, 28 Jul 2024 15:46:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TeL1bYP+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B05DE10E257;
 Sun, 28 Jul 2024 15:46:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 0942BCE0950;
 Sun, 28 Jul 2024 15:46:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3216DC32782;
 Sun, 28 Jul 2024 15:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722181604;
 bh=btrlw5K7Y/17sQ+h9eMqp5vAXw/5OjknoCfIgQbwb70=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TeL1bYP+d1drnLb+bkH+rgScJAlR3Sw8t/45tmM901jjgb+FJeL8/5/4RzPd9rWM7
 SHI+VFX4OmTzb7NdTXVxKPUaGE3ql0cJ7jZ6buOrXX8FSeIe7RhBk19wosXDRCM/hp
 Jx8I2E94vQtSbWrnnMQ9XO8IV26uo/3vl+nTbGLQ8aWSHeNErw2wa9ouq3a9riDOB0
 n/9pqY9lcURLCpy8+mnoiBBKri0ObJUo7mdwfGz6reboZSBY2bdURM5LDoH/yU+8Ne
 Ny7BTKpDO87+FNAieEGAFpWIvbgX8knvE3V95YokHesLPig2Gq+HaMQgoTrpbUZItg
 9iJJqigSupvAQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Jesse Zhang <jesse.zhang@amd.com>, Jesse Zhang <Jesse.Zhang@amd.com>,
 Tim Huang <Tim.Huang@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Sasha Levin <sashal@kernel.org>, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, airlied@gmail.com, daniel@ffwll.ch,
 Hawking.Zhang@amd.com, Stanley.Yang@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.6 07/20] drm/admgpu: fix dereferencing null pointer
 context
Date: Sun, 28 Jul 2024 11:45:05 -0400
Message-ID: <20240728154605.2048490-7-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240728154605.2048490-1-sashal@kernel.org>
References: <20240728154605.2048490-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.43
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

From: Jesse Zhang <jesse.zhang@amd.com>

[ Upstream commit 030ffd4d43b433bc6671d9ec34fc12c59220b95d ]

When user space sets an invalid ta type, the pointer context will be empty.
So it need to check the pointer context before using it

Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
Suggested-by: Tim Huang <Tim.Huang@amd.com>
Reviewed-by: Tim Huang <Tim.Huang@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c
index ca5c86e5f7cd6..8e8afbd237bcd 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c
@@ -334,7 +334,7 @@ static ssize_t ta_if_invoke_debugfs_write(struct file *fp, const char *buf, size
 
 	set_ta_context_funcs(psp, ta_type, &context);
 
-	if (!context->initialized) {
+	if (!context || !context->initialized) {
 		dev_err(adev->dev, "TA is not initialized\n");
 		ret = -EINVAL;
 		goto err_free_shared_buf;
-- 
2.43.0

