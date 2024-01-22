Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3088F8367A4
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 16:17:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7374610F379;
	Mon, 22 Jan 2024 15:17:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F32C110F355
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 15:17:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 826EAB80E99;
 Mon, 22 Jan 2024 15:17:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BEBEC433B2;
 Mon, 22 Jan 2024 15:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705936638;
 bh=/4gtotjwXX/OM490ZBA8EUHzvKc/zyuqzDmHJOrDef4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lZTo+qaN2BM2pDUn9/YmtptCBuI/JS1rgAEEQWRcBlUSimRKE0BgxiH4sDAEkcjb5
 qRhMyWgGq7n9iuNmj/GXgv0bCpv3KNAhDgy807dCWkL8bEtg40/yGRIRK9M6jmw/TB
 IEzyejHgscx6sA/ywbX85DR7Xnx/Ux3+org4C40282iP8jJT6eYJgE2X7BNXcA14PF
 20ulgPZn4X4Ibdx7vAahrMTsnHkt7VRdwZdu+Wd2G0GJymgijrd8OP2qo4nzsik/hj
 d42Q84ImhF/ME8W9MpLUiCXEzi4rH2FYokANb1EBtki9oYYyRp3jCBYijdrqDhqpas
 Kwk7wZLiDUDFQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 08/24] drm/framebuffer: Fix use of uninitialized
 variable
Date: Mon, 22 Jan 2024 10:16:22 -0500
Message-ID: <20240122151659.997085-8-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122151659.997085-1-sashal@kernel.org>
References: <20240122151659.997085-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.4.267
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
index 57564318ceea..e85fbbbc07f8 100644
--- a/drivers/gpu/drm/drm_framebuffer.c
+++ b/drivers/gpu/drm/drm_framebuffer.c
@@ -580,7 +580,7 @@ int drm_mode_dirtyfb_ioctl(struct drm_device *dev,
 	struct drm_framebuffer *fb;
 	unsigned flags;
 	int num_clips;
-	int ret;
+	int ret = 0;
 
 	if (!drm_core_check_feature(dev, DRIVER_MODESET))
 		return -EOPNOTSUPP;
-- 
2.43.0

