Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0B6A95AF0
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 04:16:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D2B010E4C6;
	Tue, 22 Apr 2025 02:16:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="owfgF3vp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 800CC10E4C6;
 Tue, 22 Apr 2025 02:16:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 62D89A4BF36;
 Tue, 22 Apr 2025 02:11:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32F71C4CEE4;
 Tue, 22 Apr 2025 02:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745288201;
 bh=XjK+fqyfu3sbCTr2fhtQxmZHWNvGXOO/Irtpev2JQZE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=owfgF3vpkmwnUk5tA+niskvwR8z2ZJXM0ORWKnNqiMYzheY3D59LyKXFS+oS86Mz/
 ndMOOGBKB4HIfI+6Ymvi8EHnzA4zvy5F4EsyxKR+RKj2CuXBbL0YUM22UJ483SHERU
 mczH5rFWY3HoDyHYm7BeNZwxnIzxY6jg052zKs8uS01aD9lYuJUzN+TAKQ3/pt4t7z
 Ame3mp+QF/XLO0GNr631aq5SHW6sn7l06Ir0ZlKbuA+SJvhFOUZLPGL4+f4cSqxnAb
 DIj++MFHd/V1L9m6Z4DNWnGJsYBCypBNp/i3nDDBNsPdji5ZZ7T1soang9Gk6HyMyg
 rJpA76fb/b5Xg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Mario Limonciello <mario.limonciello@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch,
 lijo.lazar@amd.com, Hawking.Zhang@amd.com, sunil.khatri@amd.com,
 Jesse.zhang@amd.com, linux@treblig.org, zhangzekun11@huawei.com,
 victor.skvortsov@amd.com, tzimmermann@suse.de, Ramesh.Errabolu@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.14 26/30] drm/amd: Forbid suspending into
 non-default suspend states
Date: Mon, 21 Apr 2025 22:15:46 -0400
Message-Id: <20250422021550.1940809-26-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250422021550.1940809-1-sashal@kernel.org>
References: <20250422021550.1940809-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.3
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

From: Mario Limonciello <mario.limonciello@amd.com>

[ Upstream commit 1657793def101dac7c9d3b2250391f6a3dd934ba ]

On systems that default to 'deep' some userspace software likes
to try to suspend in 'deep' first.  If there is a failure for any
reason (such as -ENOMEM) the failure is ignored and then it will
try to use 's2idle' as a fallback. This fails, but more importantly
it leads to graphical problems.

Forbid this behavior and only allow suspending in the last state
supported by the system.

Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/4093
Acked-by: Alex Deucher <alexander.deucher@amd.com>
Link: https://lore.kernel.org/r/20250408180957.4027643-1-superm1@kernel.org
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
(cherry picked from commit 2aabd44aa8a3c08da3d43264c168370f6da5e81d)
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h     |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 14 +++++++++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index 69895fccb474a..bbfeba7816075 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -1119,6 +1119,7 @@ struct amdgpu_device {
 	bool				in_s3;
 	bool				in_s4;
 	bool				in_s0ix;
+	suspend_state_t			last_suspend_state;
 
 	enum pp_mp1_state               mp1_state;
 	struct amdgpu_doorbell_index doorbell_index;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index c0ddbe7d6f0bc..284cf70562907 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -2511,8 +2511,20 @@ static int amdgpu_pmops_suspend(struct device *dev)
 		adev->in_s0ix = true;
 	else if (amdgpu_acpi_is_s3_active(adev))
 		adev->in_s3 = true;
-	if (!adev->in_s0ix && !adev->in_s3)
+	if (!adev->in_s0ix && !adev->in_s3) {
+		/* don't allow going deep first time followed by s2idle the next time */
+		if (adev->last_suspend_state != PM_SUSPEND_ON &&
+		    adev->last_suspend_state != pm_suspend_target_state) {
+			drm_err_once(drm_dev, "Unsupported suspend state %d\n",
+				     pm_suspend_target_state);
+			return -EINVAL;
+		}
 		return 0;
+	}
+
+	/* cache the state last used for suspend */
+	adev->last_suspend_state = pm_suspend_target_state;
+
 	return amdgpu_device_suspend(drm_dev, true);
 }
 
-- 
2.39.5

