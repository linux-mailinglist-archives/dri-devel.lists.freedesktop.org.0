Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB04BD59BA
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 19:54:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 392D110E4A5;
	Mon, 13 Oct 2025 17:54:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="OcXAX4cj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95D9A10E4A5;
 Mon, 13 Oct 2025 17:54:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 56CAB60282;
 Mon, 13 Oct 2025 17:48:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D75EDC4CEE7;
 Mon, 13 Oct 2025 17:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760377705;
 bh=ZdIBAWFzrHtYqH0jGDYXyDGwbLVNel0hknXRuAIjNIU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OcXAX4cj/NejI+9lD1+sudiNdbchlfcjVND8urE61nxlTqI9fFnH25UTb7Y7Aprcy
 B66rvVV8yQt8+aX8+R10iq74I7bWtjVBEy1eUhGmxeQ6CrjY5jCYueMi7neHO1Z2ZH
 AaSMoLE+FFP2wiLc1XXU3UZV7mAOJ8lxydS1TP2OI4pZ6q1L3L+Sa35RkzSrSVcR2Y
 JAn9xDilVGxRA11O5L6YPSh6WRIVJBQMaTVYzg/0RStAlh/R4kefUZ9az4DjGefxXj
 yzcrz7Hxedk1KNGmoeifJrEJwJNT9CO7/w/OejwSbV3ZMcy+gIxpRLWdS5bLLazvKR
 IczzJDI2W09PA==
From: "Mario Limonciello (AMD)" <superm1@kernel.org>
To: mario.limonciello@amd.com, airlied@gmail.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, dakr@kernel.org, gregkh@linuxfoundation.org,
 lenb@kernel.org, pavel@kernel.org, rafael@kernel.org, simona@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-pm@vger.kernel.org
Subject: [RFC PATCH 2/3] drm/amd: Drop special cases for thaw() callback
Date: Mon, 13 Oct 2025 12:47:10 -0500
Message-ID: <20251013174729.1101186-3-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251013174729.1101186-1-superm1@kernel.org>
References: <20251013174729.1101186-1-superm1@kernel.org>
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

The special cases to use pm_hibernate_is_recovering() and
pm_hibernation_mode_is_suspend() were for an optimization to avoid
turning the display on and moving memory around when the system
was about to hibernate anyway.

As the hibernate core skips thaw() unless it's necessary drop them.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 6d547f4e4bafc..4a37c3e517a9f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -2671,10 +2671,6 @@ static int amdgpu_pmops_thaw(struct device *dev)
 {
 	struct drm_device *drm_dev = dev_get_drvdata(dev);
 
-	/* do not resume device if it's normal hibernation */
-	if (!pm_hibernate_is_recovering() && !pm_hibernation_mode_is_suspend())
-		return 0;
-
 	return amdgpu_device_resume(drm_dev, true);
 }
 
-- 
2.43.0

