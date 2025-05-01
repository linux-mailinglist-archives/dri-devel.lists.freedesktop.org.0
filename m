Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43597AA6532
	for <lists+dri-devel@lfdr.de>; Thu,  1 May 2025 23:17:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05F4610E363;
	Thu,  1 May 2025 21:17:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CDJ3QtPG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3DF810E359;
 Thu,  1 May 2025 21:17:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 33845A4C062;
 Thu,  1 May 2025 21:12:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0AEBC4CEEF;
 Thu,  1 May 2025 21:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746134263;
 bh=PaL6fSpxU3x6hlhh7NpF14QNceBepBMnGGT5NyW1Kk4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CDJ3QtPGpXRAm5yXpFnRjAiAArom0g+X7z9IkpMCHFbp6js7r9C9Ie7NVFIE2vPxT
 gHlT9P8Tb7CzR/cMLwbHoK6irWKYvgij9cm23DAI/a/Grd8oAV8RUc3XPUY/m5QnCQ
 Jli4WO6CSEuJoBDlmpfPaA2I/B1T4VMIivsMXVjDLg50d84xwrCFnYQTCE4qfnYRKA
 4ZVsuL9h+lSNdurO2vZV7BaTN6PdJOOYYhphhp2kRpjDj0rD7qF25N/Yvk/KPahcw9
 YyNOGAW7w5itvGbDVKZEyKCfapIstkEbbREc3cDIGLP9kVyjg0XEO6ZMBb4w54JhY9
 kPBg8AJTWhwgw==
From: Mario Limonciello <superm1@kernel.org>
To: Alex Deucher <alexander.deucher@amd.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org (open list:RADEON and AMDGPU DRM DRIVERS),
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 linux-pm@vger.kernel.org (open list:HIBERNATION (aka Software Suspend,
 aka swsusp)), Mario Limonciello <mario.limonciello@amd.com>
Subject: [RFC 2/2] drm/amd: Use suspend and hibernate post freeze notifications
Date: Thu,  1 May 2025 16:17:33 -0500
Message-ID: <20250501211734.2434369-3-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250501211734.2434369-1-superm1@kernel.org>
References: <20250501211734.2434369-1-superm1@kernel.org>
MIME-Version: 1.0
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

commit 2965e6355dcd ("drm/amd: Add Suspend/Hibernate notification
callback support") introduced a VRAM eviction earlier in the PM
sequences when swap was still available for evicting to. This helped
to fix a number of memory pressure related bugs but also exposed a
new one.

If a userspace process is actively using the GPU when suspend starts
then a deadlock could occur.

Instead of going off the prepare notifier, use the PM notifiers that
occur after processes have been frozen to do evictions.

Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/4178
Fixes: 2965e6355dcd ("drm/amd: Add Suspend/Hibernate notification callback support")
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 7f354cd532dc1..cad311b9fd834 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -4917,10 +4917,10 @@ static int amdgpu_device_pm_notifier(struct notifier_block *nb, unsigned long mo
 	int r;
 
 	switch (mode) {
-	case PM_HIBERNATION_PREPARE:
+	case PM_HIBERNATION_POST_FREEZE:
 		adev->in_s4 = true;
 		fallthrough;
-	case PM_SUSPEND_PREPARE:
+	case PM_SUSPEND_POST_FREEZE:
 		r = amdgpu_device_evict_resources(adev);
 		/*
 		 * This is considered non-fatal at this time because
-- 
2.43.0

