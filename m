Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCCF77AC88B
	for <lists+dri-devel@lfdr.de>; Sun, 24 Sep 2023 15:17:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97FF210E175;
	Sun, 24 Sep 2023 13:17:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AE9410E15C;
 Sun, 24 Sep 2023 13:17:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 66217CE0B21;
 Sun, 24 Sep 2023 13:17:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 113A9C433C8;
 Sun, 24 Sep 2023 13:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695561442;
 bh=jCc8bMfwIQKo75O1YD6UF30RTC8JKvoVKARsjlheeGY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FUTFMjhWx2RIqKseJe3zSTMWXqeogyjQwe0xSUwudALMAmFcQMiKWbfgCF7OCslu0
 HM8ObEJ7ok5OhlX9QraUONeaBFVrnh767ZMPciMFa5BjaGjOAyn4D2lYKxGszhRBPy
 MTVuYJhBE4ouTN2TSmfLDeo07N63o6Gy7LcOICpM45Rm7ZZ3I30no0q4IcWf3/LPJZ
 11elpfPcCuYYtwnIA2d2xxGS/cMDWWRE4n3OnEXPeP1MA3W5A1h48DSHjQgYUF6F6r
 uJlHlO7HLNrC7xcxk2C/qjYj0rpX1IA8j6YfCBqOfmvPntXKkSGm4rIC17muMWzC03
 p9+Si9t2PcyAQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.5 31/41] drm/amdgpu: fallback to old RAS error
 message for aqua_vanjaram
Date: Sun, 24 Sep 2023 09:15:19 -0400
Message-Id: <20230924131529.1275335-31-sashal@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230924131529.1275335-1-sashal@kernel.org>
References: <20230924131529.1275335-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.5.5
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
Cc: Sasha Levin <sashal@kernel.org>, tao.zhou1@amd.com,
 Yang Wang <kevinyang.wang@amd.com>, Xinhui.Pan@amd.com,
 amd-gfx@lists.freedesktop.org, YiPeng.Chai@amd.com, Stanley.Yang@amd.com,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 christian.koenig@amd.com, Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Hawking Zhang <Hawking.Zhang@amd.com>

[ Upstream commit ffd6bde302061aeee405ab364403af30210f0b99 ]

So driver doesn't generate incorrect message until
the new format is settled down for aqua_vanjaram

Signed-off-by: Hawking Zhang <Hawking.Zhang@amd.com>
Reviewed-by: Yang Wang <kevinyang.wang@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
index 8aaa427f8c0f6..7d5019a884024 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
@@ -1061,7 +1061,8 @@ int amdgpu_ras_query_error_status(struct amdgpu_device *adev,
 	info->ce_count = obj->err_data.ce_count;
 
 	if (err_data.ce_count) {
-		if (adev->smuio.funcs &&
+		if (!adev->aid_mask &&
+		    adev->smuio.funcs &&
 		    adev->smuio.funcs->get_socket_id &&
 		    adev->smuio.funcs->get_die_id) {
 			dev_info(adev->dev, "socket: %d, die: %d "
@@ -1081,7 +1082,8 @@ int amdgpu_ras_query_error_status(struct amdgpu_device *adev,
 		}
 	}
 	if (err_data.ue_count) {
-		if (adev->smuio.funcs &&
+		if (!adev->aid_mask &&
+		    adev->smuio.funcs &&
 		    adev->smuio.funcs->get_socket_id &&
 		    adev->smuio.funcs->get_die_id) {
 			dev_info(adev->dev, "socket: %d, die: %d "
-- 
2.40.1

