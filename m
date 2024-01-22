Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D74C8367C6
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 16:19:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5009610F407;
	Mon, 22 Jan 2024 15:19:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD85310F407
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 15:19:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4AE8B611C5;
 Mon, 22 Jan 2024 15:18:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E50AC433A6;
 Mon, 22 Jan 2024 15:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705936719;
 bh=HdXz9ZSHSHAv2wETRj/URGKhnJ4QGa4049mSpdOqN3s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KWUCWLNCypRggI822yrjrAOgqz+4KhQOGhvtrHbyzXABwjMXoYPuNyyh2yUWYhIuE
 981w+oO4ZQ2mSur4ivd2L0+U+pYIKypptFoFWFNZYROqI2NtN/kGf3oEPiLMUArskL
 nc7m1KYfwk+zKR3Ihbmc/EMlRvvQadk4JNPxoNKfs5PySW4C1ChfbDd8NEcjwZZn3A
 FZQcFpdUMa/srlmlM25kZnnF7ORF1AiQ02zDl1tVNuEVoC++D82tqWvQesFI/hIqO5
 cLCsxf4z2Fvqc7dE4QEy3ZFFK7NeXbDWETf38hCMT5jLz4Dq0HEfslT6x0HLoxq4JO
 znmjP4092xUfw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 07/23] drm/framebuffer: Fix use of uninitialized
 variable
Date: Mon, 22 Jan 2024 10:17:47 -0500
Message-ID: <20240122151823.997644-7-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122151823.997644-1-sashal@kernel.org>
References: <20240122151823.997644-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 4.19.305
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

[ Upstream commit f9af8f0c1dc567a5a6a6318ff324c45d80d4a60f ]

smatch reports:

drivers/gpu/drm/drm_framebuffer.c:654 drm_mode_getfb2_ioctl() error: uninitialized symbol 'ret'.

'ret' is possibly not set when there are no errors, causing the error
above. I can't say if that ever happens in real-life, but in any case I
think it is good to initialize 'ret' to 0.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Acked-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20231103-uninit-fixes-v2-2-c22b2444f5f5@ideasonboard.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/drm_framebuffer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_framebuffer.c
index b64a6ffc0aed..9fc4af4b10a6 100644
--- a/drivers/gpu/drm/drm_framebuffer.c
+++ b/drivers/gpu/drm/drm_framebuffer.c
@@ -538,7 +538,7 @@ int drm_mode_dirtyfb_ioctl(struct drm_device *dev,
 	struct drm_framebuffer *fb;
 	unsigned flags;
 	int num_clips;
-	int ret;
+	int ret = 0;
 
 	if (!drm_core_check_feature(dev, DRIVER_MODESET))
 		return -EINVAL;
-- 
2.43.0

