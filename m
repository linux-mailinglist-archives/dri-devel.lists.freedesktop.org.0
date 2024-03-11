Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C98368782DC
	for <lists+dri-devel@lfdr.de>; Mon, 11 Mar 2024 16:13:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 040B710F083;
	Mon, 11 Mar 2024 15:13:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="E2rk8BTg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 770AC10F083
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Mar 2024 15:13:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EAF3460EBD;
 Mon, 11 Mar 2024 15:13:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87D22C43399;
 Mon, 11 Mar 2024 15:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1710170004;
 bh=DnBTn8M9ECog35VLJPBV08nJCttgdumjnhsnix40o/U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=E2rk8BTgXfnZM1mW5Ss3o7ltBqnltyIp69+8OH5uhAL++z6mT1fi8vpTK3vGyJfoa
 CdzTbxjeHrqHbCDxIXBPdoNjE1NCY6KTvdi1NafxN6Zia1GNpBGIJ7dLeXes1v8EP3
 JHjiMho1ielrIFPx3nQz7OcThGfDyHRETCmArj9qJCIonbnvjeK34R0dtxMGM7aGEo
 m18piY9inMNeR4r3QRmlWnE5726q7QtJjCKhO4qzJxVQe90REqo/WhEcTfTsDr0LD2
 jroItTdSOyB078I3pBoBxXIu9iYPAnvEMs9ZdWRSglCf5fF6/J6n9LcsdP5nGHBXBA
 Ii5NnCmusitlA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.6 06/17] drm/ttm/tests: depend on UML || COMPILE_TEST
Date: Mon, 11 Mar 2024 11:12:57 -0400
Message-ID: <20240311151314.317776-6-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240311151314.317776-1-sashal@kernel.org>
References: <20240311151314.317776-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.21
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

From: Christian König <christian.koenig@amd.com>

[ Upstream commit 9d3f8a723c7950e56e0b95ab84b572caee29e065 ]

At least the device test requires that no other driver using TTM is
loaded. So make those unit tests depend on UML || COMPILE_TEST to
prevent people from trying them on bare metal.

Signed-off-by: Christian König <christian.koenig@amd.com>
Acked-by: Alex Deucher <alexander.deucher@amd.com>
Link: https://lore.kernel.org/all/20240219230116.77b8ad68@yea/
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/Kconfig | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 3caa020391c75..ec4abf9ff47b5 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -198,7 +198,7 @@ config DRM_TTM
 config DRM_TTM_KUNIT_TEST
         tristate "KUnit tests for TTM" if !KUNIT_ALL_TESTS
         default n
-        depends on DRM && KUNIT && MMU
+        depends on DRM && KUNIT && MMU && (UML || COMPILE_TEST)
         select DRM_TTM
         select DRM_EXPORT_FOR_TESTS if m
         select DRM_KUNIT_TEST_HELPERS
@@ -206,7 +206,8 @@ config DRM_TTM_KUNIT_TEST
         help
           Enables unit tests for TTM, a GPU memory manager subsystem used
           to manage memory buffers. This option is mostly useful for kernel
-          developers.
+          developers. It depends on (UML || COMPILE_TEST) since no other driver
+          which uses TTM can be loaded while running the tests.
 
           If in doubt, say "N".
 
-- 
2.43.0

