Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 413D593E630
	for <lists+dri-devel@lfdr.de>; Sun, 28 Jul 2024 17:44:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACFDB10E225;
	Sun, 28 Jul 2024 15:44:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FQfCyTn/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CE4110E225
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jul 2024 15:44:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 03C9D61222;
 Sun, 28 Jul 2024 15:44:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30249C4AF0B;
 Sun, 28 Jul 2024 15:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722181486;
 bh=FegstC6WxaJe/XJd+Gbxu8m87ingQNoL4dEP0GMn3Qk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FQfCyTn/542vBHiAu5JOYiygNmQurPsy/MKxUoi/fEEZzOA1ZKZctoTeLcSR6fdqj
 XHxrjPBM29KoY45aU6s/unGWJVLRS2PFho/VvgyQe2u0BxRW4j5ExIcVogvsAn1KO7
 jywTQfPPGkjfySqeoyfAgHWRkQnPCSEQdnn+rl5i9PYoeDsZ5Mkgkye9Y7ajOO4wBg
 BlPIu+ykZzy1M60I/KDW6a9zavCkmU1xs+l7ZhRLPWMMaDRgzu5v333MCJ3+gg9FkF
 iAqRH/hvIL0rYWaPthYsb6PBT7FbsfLHV7hlxadI+NHVDBrXG0ARDGkOQdLLCdCKKY
 w18ypnmmyGbMg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Jocelyn Falempe <jfalempe@redhat.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Sasha Levin <sashal@kernel.org>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.10 26/34] drm/panic: depends on !VT_CONSOLE
Date: Sun, 28 Jul 2024 11:40:50 -0400
Message-ID: <20240728154230.2046786-26-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240728154230.2046786-1-sashal@kernel.org>
References: <20240728154230.2046786-1-sashal@kernel.org>
MIME-Version: 1.0
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

From: Jocelyn Falempe <jfalempe@redhat.com>

[ Upstream commit 1ac6ac9ec069ed0cfdb1c207ae23f6c40ac57437 ]

The race condition between fbcon and drm_panic can only occurs if
VT_CONSOLE is set. So update drm_panic dependency accordingly.
This will make it easier for Linux distributions to enable drm_panic
by disabling VT_CONSOLE, and keeping fbcon terminal.
The only drawback is that fbcon won't display the boot kmsg, so it
should rely on userspace to do that.
At least plymouth already handle this case with
https://gitlab.freedesktop.org/plymouth/plymouth/-/merge_requests/224

Suggested-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20240613154041.325964-1-jfalempe@redhat.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index d0aa277fc3bff..3e286236aa430 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -106,7 +106,7 @@ config DRM_KMS_HELPER
 
 config DRM_PANIC
 	bool "Display a user-friendly message when a kernel panic occurs"
-	depends on DRM && !FRAMEBUFFER_CONSOLE
+	depends on DRM && !(FRAMEBUFFER_CONSOLE && VT_CONSOLE)
 	select DRM_KMS_HELPER
 	select FONT_SUPPORT
 	help
-- 
2.43.0

