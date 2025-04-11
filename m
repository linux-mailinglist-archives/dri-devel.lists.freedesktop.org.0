Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53AFAA85DD3
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 14:55:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8578810EB9E;
	Fri, 11 Apr 2025 12:55:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="t+BmnKnX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33BC010EBA2
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Apr 2025 12:55:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E43D96845E;
 Fri, 11 Apr 2025 12:55:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D692C4CEE2;
 Fri, 11 Apr 2025 12:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744376137;
 bh=1JVVosuEJjtVUPPGOQoV/EL2ui4efcKyx8phzWVmkg0=;
 h=From:To:Cc:Subject:Date:From;
 b=t+BmnKnXy19PvUkWOcAzg7fOKFmhUnDU3SGCoUDWktvSqKtvbdhc85WCv2NbB5Kas
 ekrTOe/NVtTDWP+OSothG7PvNErTvbyd3xa1H8+uMZ7NbwiJ6BrLs1eV9l/+6KnQHw
 SJzItaX7lT0Hmzf9WqEBVCe7+5QSsRx6ZbTPTVZSDRHIskIuNrn/HeUYUr+tFGoPa/
 w3nSpmDEXpZA9Unqzu8zLKJ2mL39xsuF4p20tWW2JM82fdQXFLXpuwyPUwuVy8U4+H
 BFIhACQ1Rs+vq3PvT0oBE0zMPahH1LuxmHXCx5UJ68gvprFhbqMbKz+pDF0ZE6uwVa
 P003fDMkZRMfw==
From: Arnd Bergmann <arnd@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Christian Brauner <brauner@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Jocelyn Falempe <jfalempe@redhat.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Jani Nikula <jani.nikula@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm: ttm: select CONFIG_SHMEM
Date: Fri, 11 Apr 2025 14:55:25 +0200
Message-Id: <20250411125532.1444682-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
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

From: Arnd Bergmann <arnd@arndb.de>

ttm now directly calls into shmem code, which fails to build when
that is disabled at compile time.

ld.lld-21: error: undefined symbol: shmem_writeout
>>> referenced by ttm_backup.c
>>>               drivers/gpu/drm/ttm/ttm_backup.o:(ttm_backup_backup_page) in archive vmlinux.a

Select SHMEM here.

Fixes: fe75adffac33 ("ttm: Call shmem_writeout() from ttm_backup_backup_page()")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index b3bbb3f20b2a..831bd384f1fd 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -187,6 +187,7 @@ source "drivers/gpu/drm/display/Kconfig"
 config DRM_TTM
 	tristate
 	depends on DRM && MMU
+	select SHMEM
 	help
 	  GPU memory management subsystem for devices with multiple
 	  GPU memory types. Will be enabled automatically if a device driver
-- 
2.39.5

