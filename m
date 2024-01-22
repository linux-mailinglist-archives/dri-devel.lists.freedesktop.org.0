Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA31836788
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 16:16:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4229010F2B7;
	Mon, 22 Jan 2024 15:16:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C74C10F2B7
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 15:16:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1AC836150B;
 Mon, 22 Jan 2024 15:15:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B893C433F1;
 Mon, 22 Jan 2024 15:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705936548;
 bh=fmNhLQmCfNnrEsba61EX41AiW53/0yH/dBbjhogA3oM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YwOUdquXoL3xfEuijiN6qcVd2x/jraPk10j3TkDICYAS6SXXUyWn7jjK73hiKBcfb
 3GYgUgiX4ns2fVX313Nktn3tE1tR3/UWTk85jSRp2gyev74DTbVBO+rdizli+/Qoga
 m29qRUOG3n25VZb+63T0YslcGy3tAhpNF7axUzno/1VHHomkz59pLUAq7PVhAP9tp7
 kIwDTExj1mzb1TK4Zc5/J2m76MZoQ9s/dMBh6HYsJZwx1DddwOlzSWWl5Bh0OlMrfO
 FhhFgdAIMMWY8F83Pi41MVWka5sITjSY+op3Dh7CWNCs6VpUQg71zma1hfr38mzk9u
 D4WcFyBuP+nOg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 10/28] drm/drm_file: fix use of uninitialized
 variable
Date: Mon, 22 Jan 2024 10:14:36 -0500
Message-ID: <20240122151521.996443-10-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122151521.996443-1-sashal@kernel.org>
References: <20240122151521.996443-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.10.208
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
Cc: Sasha Levin <sashal@kernel.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, daniel@ffwll.ch,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, airlied@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

[ Upstream commit 1d3062fad9c7313fff9970a88e0538a24480ffb8 ]

smatch reports:

drivers/gpu/drm/drm_file.c:967 drm_show_memory_stats() error: uninitialized symbol 'supported_status'.

'supported_status' is only set in one code path. I'm not familiar with
the code to say if that path will always be ran in real life, but
whether that is the case or not, I think it is good to initialize
'supported_status' to 0 to silence the warning (and possibly fix a bug).

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Acked-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20231103-uninit-fixes-v2-1-c22b2444f5f5@ideasonboard.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/drm_file.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index 537e7de8e9c3..93da7b5d785b 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -411,7 +411,7 @@ int drm_open(struct inode *inode, struct file *filp)
 {
 	struct drm_device *dev;
 	struct drm_minor *minor;
-	int retcode;
+	int retcode = 0;
 	int need_setup = 0;
 
 	minor = drm_minor_acquire(iminor(inode));
-- 
2.43.0

