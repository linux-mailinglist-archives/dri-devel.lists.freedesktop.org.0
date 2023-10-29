Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7BF7DAF17
	for <lists+dri-devel@lfdr.de>; Sun, 29 Oct 2023 23:56:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8812B10E1AA;
	Sun, 29 Oct 2023 22:56:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC3EB10E1A9;
 Sun, 29 Oct 2023 22:56:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0401160EDC;
 Sun, 29 Oct 2023 22:56:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 235FFC433A9;
 Sun, 29 Oct 2023 22:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1698620173;
 bh=001YAmpLETxjsM9j7Vvl/WXpAl9mBPA1mEwrmF4EQAw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eUSo1chgV/1QwDOuL4lMJw0aflRcbefarg4mIaCrhSmLID1NRw3ckUR8xzKXHR41J
 CAifWLXlcN0YsaPP/skQ6FwqSNlV7HAQDrX3CDEAofypDxO2/GtkSD/RU1CYJuvFMu
 N+1xaKhLM8SeZeuFHrm2s2QH1qE5VlpP2TN9lM8/Qq5Mqc8JwXv12ZfVlbbZ6TNNal
 bmM4KR1p8uCgYMDyQE2mn2esmTSfh2usIGWnpfvBgibLURFEtuh2miB0EbccacC16o
 tJg4te9cenjWUCzofVy78Apd5VbFo1DAeBwdN7SJO/C2oPYz7vKylCE3fheeZRLq9s
 v8K/SgMlXjW4Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.5 38/52] drm/amdgpu: Unset context priority is now
 invalid
Date: Sun, 29 Oct 2023 18:53:25 -0400
Message-ID: <20231029225441.789781-38-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231029225441.789781-1-sashal@kernel.org>
References: <20231029225441.789781-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.5.9
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
Cc: Sasha Levin <sashal@kernel.org>, pierre-eric.pelloux-prayer@amd.com,
 lijo.lazar@amd.com, dri-devel@lists.freedesktop.org, Xinhui.Pan@amd.com,
 amd-gfx@lists.freedesktop.org, Luben Tuikov <luben.tuikov@amd.com>,
 zhenguo.yin@amd.com, alexander.deucher@amd.com, James.Zhu@amd.com,
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
index 0dc9c655c4fbd..092962b93064f 100644
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

