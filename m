Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9AF9A5CFD
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 09:28:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DE0F10E427;
	Mon, 21 Oct 2024 07:28:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="kzyYEsZj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0E04C10E427
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 07:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=gmjLE
 7ZfiDPnsgkk+1WmAmqTeadGIqt3ARNYz5u8TEc=; b=kzyYEsZjGd2zUP6ZkekdI
 5YjmdXs9gnZELqzMJnuULVMLxZ0BSiU9I53qPun9qOFIhD4Wd/p7j+25YKt3SxVU
 taHkCOQ7TADtC4SmKKFJGnCN517eojRufvOob+i2mvol6ytP6Dao7GEm22aETaBW
 6n3OJVE61CtD+huJXtK/fw=
Received: from ProDesk.. (unknown [58.22.7.114])
 by gzsmtp2 (Coremail) with SMTP id PSgvCgD396eTAhZnIAYQAA--.4735S2;
 Mon, 21 Oct 2024 15:28:23 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: mripard@kernel.org, enric.balletbo@collabora.com, tzimmermann@suse.de,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH] drm/rockchip: vop: Fix a dereferenced before check warning
Date: Mon, 21 Oct 2024 15:28:06 +0800
Message-ID: <20241021072818.61621-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PSgvCgD396eTAhZnIAYQAA--.4735S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7CFW8AF1fAw4UuFy5WrWktFb_yoW8GFWDpr
 WDAryjgr48Kayjqr9rJwnIvrs3GanFkayxKr97G3WSqFy7KanxCwn5urZ7urW7XrW7G347
 t3srJ3sxCF4jvw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j-6p9UUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiMwh-XmcV-hZ9LQAAsQ
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

From: Andy Yan <andy.yan@rock-chips.com>

The 'state' can't be NULL, we should check crtc_state.

Fix warning:
drivers/gpu/drm/rockchip/rockchip_drm_vop.c:1096
vop_plane_atomic_async_check() warn: variable dereferenced before check
'state' (see line 1077)

Fixes: 5ddb0bd4ddc3 ("drm/atomic: Pass the full state to planes async atomic check and update")
Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
---

 drivers/gpu/drm/rockchip/rockchip_drm_vop.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
index a13473b2d54c..26aff9c5644e 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
@@ -1093,10 +1093,10 @@ static int vop_plane_atomic_async_check(struct drm_plane *plane,
 	if (!plane->state->fb)
 		return -EINVAL;
 
-	if (state)
-		crtc_state = drm_atomic_get_existing_crtc_state(state,
-								new_plane_state->crtc);
-	else /* Special case for asynchronous cursor updates. */
+	crtc_state = drm_atomic_get_existing_crtc_state(state, new_plane_state->crtc);
+
+	/* Special case for asynchronous cursor updates. */
+	if (!crtc_state)
 		crtc_state = plane->crtc->state;
 
 	return drm_atomic_helper_check_plane_state(plane->state, crtc_state,
-- 
2.34.1

