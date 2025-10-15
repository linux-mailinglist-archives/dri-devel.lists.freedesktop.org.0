Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1867BDE25E
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 13:00:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A0DB10E293;
	Wed, 15 Oct 2025 11:00:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="UWkHY7b+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D462210E28A
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 11:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1760526045;
 bh=YGUltZGYpuQRY1vIkwugcZNN2EaaaWyw6aAziptf0/A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UWkHY7b+O8JMOvxQ6EXug4S4W5c8Y+h95484aa3XgVGrU1rUsSuDg+uVTvP+ke+3q
 m9r4Cc0YrDzdUJAYC1Dylyf1zauD0qZ/7glnx77lo3NMdkLSIeCn1OjlWzVkm81Zf4
 lEOW9/bOvkSTguxCaW0BCefLgGxvtbIGzP7P98rLhn41PPbakEtYHq2qHmM36G9rNf
 AG38+64ElKgYolsEWXUrZdFS211BaGLZ4Qom2nVTZk3OSjUaLDGtS/+/Z2xZJ4YxwC
 IygFRaf3Jz0b3LwrAZej0b1Cr9X5an/Tnwg1tnWFAWRB7+nICMUaTY4An/qmDVjupq
 G2X9v80TVap3A==
Received: from reinforced.mynet (unknown
 [IPv6:2a01:4b00:be1d:c600:6089:8bab:34a0:d4c5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: daniels)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 4B75D17E14FF;
 Wed, 15 Oct 2025 13:00:45 +0200 (CEST)
From: Daniel Stone <daniels@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: andy.yan@rock-chips.com, hjc@rock-chips.com, heiko@sntech.de,
 cristian.ciocaltea@collabora.com, kernel@collabora.com
Subject: [PATCH 06/13] drm/rockchip: Switch impossible format conditional to
 WARN_ON
Date: Wed, 15 Oct 2025 12:00:35 +0100
Message-ID: <20251015110042.41273-7-daniels@collabora.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251015110042.41273-1-daniels@collabora.com>
References: <20251015110042.41273-1-daniels@collabora.com>
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

We should never be able to create a framebuffer with an unsupported
format, so throw a warning if this ever happens, instead of attempting
to stagger on.

Signed-off-by: Daniel Stone <daniels@collabora.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index 284c8a048034..8c5042fb2e7e 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -1029,8 +1029,8 @@ static int vop2_plane_atomic_check(struct drm_plane *plane,
 		return 0;
 
 	format = vop2_convert_format(fb->format->format);
-	if (format < 0)
-		return format;
+	/* We shouldn't be able to create a fb for an unsupported format */
+	WARN_ON(format < 0);
 
 	/* Co-ordinates have now been clipped */
 	src_x = src->x1 >> 16;
-- 
2.51.0

