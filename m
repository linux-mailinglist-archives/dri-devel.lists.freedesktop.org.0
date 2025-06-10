Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB6CAD31F3
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 11:27:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E690B10E291;
	Tue, 10 Jun 2025 09:27:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DbRw67rI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D3F210E291
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 09:27:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id ACE675C434B;
 Tue, 10 Jun 2025 09:25:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44959C4CEFB;
 Tue, 10 Jun 2025 09:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749547663;
 bh=lfBamJGxY5k+dFxogqH5eoJqA8X1z7zpTPGsxWnNEMw=;
 h=From:To:Cc:Subject:Date:From;
 b=DbRw67rIApDToeSQaohj/IYtUXaxmet2X06VVVtEMc/pzT7jP+Esfx5dUB9SwZZdt
 Kf2ARcaInme/RHykD6bXQ8QmRpRe4kMJ5teA4TWVNKvWdNib61o+tFjJ7PxEGnPesw
 7fbXg+IPCGHYW5CGjr3TqupIMgeHaLHp/1n6q5zxdAA/BE6uXjfP+QKPXqWCiqlGe3
 7Qw0Seh6l3DB3BsSfPV+nXzO9u/v/x1zdx+F6sx3p4sagQctSj2JRghnEaHSo2UArn
 HNedLWqE2GXk2Va58A52uzpxXsmD0lZ2dy7/Q08WWanoscB0TqsCPMJqaNyOqZSgPq
 YlBZHY3yitH/w==
From: Arnd Bergmann <arnd@kernel.org>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Nathan Chancellor <nathan@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 "Dr. David Alan Gilbert" <linux@treblig.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
Subject: [PATCH] drm: omapdrm: reduce clang stack usage
Date: Tue, 10 Jun 2025 11:27:33 +0200
Message-Id: <20250610092737.2641862-1-arnd@kernel.org>
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

The thread sanitizer makes the stack usage explode from extra variable
spills in dispc_runtime_resume:

drivers/gpu/drm/omapdrm/dss/dispc.c:4735:27: error: stack frame size (1824) exceeds limit (1280) in 'dispc_runtime_resume' [-Werror,-Wframe-larger-than]

I could not figure out what exactly is going on here, but I see that
whenever dispc_restore_context() is not inlined, that function
and its caller shrink below 900 bytes combined of stack usage.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/omapdrm/dss/dispc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/dispc.c b/drivers/gpu/drm/omapdrm/dss/dispc.c
index 533f70e8a4a6..cf055815077c 100644
--- a/drivers/gpu/drm/omapdrm/dss/dispc.c
+++ b/drivers/gpu/drm/omapdrm/dss/dispc.c
@@ -524,7 +524,7 @@ static void dispc_save_context(struct dispc_device *dispc)
 	DSSDBG("context saved\n");
 }
 
-static void dispc_restore_context(struct dispc_device *dispc)
+static noinline_for_stack void dispc_restore_context(struct dispc_device *dispc)
 {
 	int i, j;
 
-- 
2.39.5

