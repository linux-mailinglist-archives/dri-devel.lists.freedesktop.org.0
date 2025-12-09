Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E87A1CAFBBC
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 12:15:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48C0D10E51D;
	Tue,  9 Dec 2025 11:15:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="jSBSe9/b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55FF610E51D
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Dec 2025 11:15:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1765278918; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=M/O43k2hYGpfnvnTH3+QLd+z/1WOPyPdc8xtPcABXMwiYkaq1g9SqQEaquGczbpdeL2uKrjarGrx4MAU1Pavo7YZ48dj6GcLyP652BVHlS1Nl4PZz8/UHfHQQwYl/b58Qy2Dz20KgbfEUDaBLytPOW8kGtT6lT1Q9skhmuC8yOg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1765278918;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=CS0QxKNP3vOnv8q3yaF11BPDVZZzculrxSbgljutXxk=; 
 b=YbVx0fTb121vjUNWXOPU4JAHzUqTS51aW2mXln7st6qrYiOQwaHcNqwSXyZfJXrovZFW4qIagRZ9KRKY38S+fRIh/cNrcKsQ+y0NV3EchdfLYHJgADAct4HKQHywG95QUBtHdJyn7qBjL7lkr/1oCbK9iaR5SBbCiHiz2Akq1Fs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1765278918; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=CS0QxKNP3vOnv8q3yaF11BPDVZZzculrxSbgljutXxk=;
 b=jSBSe9/bwG0kWjdRrLCBGvuWjTMaTDv9/2AGOnZiW6rT7zcKnH217cm32MPYKOdO
 4AsftTnRt1S4CaVYdm8ZYe0DiUUtuuQb/n/LIuQlwCYfNmgd4bfE/mdvH1cQx70JD/7
 M3QrWRPqliYlyc5eH5xt3VUvpPA13/gZ3N0mfjQg=
Received: by mx.zohomail.com with SMTPS id 1765278917298884.6425701616823;
 Tue, 9 Dec 2025 03:15:17 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Tue, 09 Dec 2025 12:14:20 +0100
Subject: [PATCH v3 7/8] drm/rockchip: vop2: Use drm_is_afbc helper function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251209-vop2-atomic-fixups-v3-7-07c48f0f1f0d@collabora.com>
References: <20251209-vop2-atomic-fixups-v3-0-07c48f0f1f0d@collabora.com>
In-Reply-To: <20251209-vop2-atomic-fixups-v3-0-07c48f0f1f0d@collabora.com>
To: Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Daniel Stone <daniels@collabora.com>, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.3
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

From: Daniel Stone <daniels@collabora.com>

We don't need to do a long open-coded walk here; we can simply check the
modifier value.

Signed-off-by: Daniel Stone <daniels@collabora.com>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index 337b01ed29a6..ea84aa5c625e 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -1207,7 +1207,7 @@ static void vop2_plane_atomic_update(struct drm_plane *plane,
 		return;
 	}
 
-	afbc_en = rockchip_afbc(plane, fb->modifier);
+	afbc_en = drm_is_afbc(fb->modifier);
 
 	offset = (src->x1 >> 16) * fb->format->cpp[0];
 

-- 
2.52.0

