Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC591CB72CE
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 21:41:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 625BF10E2B5;
	Thu, 11 Dec 2025 20:41:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="i5H8CIpH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 429B510E288
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 20:41:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1765485657; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=WBkitdwJz9dfAeHGANV0qWkGie5Q52vUHt2nYnvJ5NzD5JtU/j3I+x1F57yCc5clt97Q/eOTynuGHIhIKA5+gxyxMYwbqYRHdNKaywy1PNnh/RHZHWdBbICjUxHF0430pC4WDEoKjnMFFOhCoAmOnPwvYVDvCPWGsofEsFrmOQ0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1765485657;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=Cg4WUfMDQUwvwvbTJsa9XBH4T44qYNwtUMAw30CfLvQ=; 
 b=Qeh1WLcmAkJBifekdvlq3k0MXXut5K3NiKTb4EhtSQHlR/GkH6arYl5rPgPd0NSkWEehpQn1kUF0cMgMi7bKu4auKM5FjwfdVDXfzluJX8GTxAbbYfDF+FsMA5em3g+FgLhETxrdHvQvFcxLUQx/ZsT49R5e99bKwkv9tqG4kQs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1765485657; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=Cg4WUfMDQUwvwvbTJsa9XBH4T44qYNwtUMAw30CfLvQ=;
 b=i5H8CIpHjYGxo7s5vL60QrceF/q6gP8ijx93fnfxAOiuJYj0wd3ylce+eEfl4fkn
 x5kGwXr017YJnJL7RqyxCBigVkDjOffWHhpTzb6UqFLFfOvFmS7hXo534rT8YF0/2jm
 a8o0/3wvhxRiRUVdFQRFLPZHkZq+EPdXwTPN8eHo=
Received: by mx.zohomail.com with SMTPS id 1765485655793219.61784133741503;
 Thu, 11 Dec 2025 12:40:55 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Thu, 11 Dec 2025 21:40:31 +0100
Subject: [PATCH v4 1/8] drm/rockchip: vop2: Switch impossible format
 conditional to WARN_ON
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251211-vop2-atomic-fixups-v4-1-5d50eda26bf8@collabora.com>
References: <20251211-vop2-atomic-fixups-v4-0-5d50eda26bf8@collabora.com>
In-Reply-To: <20251211-vop2-atomic-fixups-v4-0-5d50eda26bf8@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Daniel Stone <daniels@collabora.com>, kernel@collabora.com, 
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

We should never be able to create a framebuffer with an unsupported
format, so throw a warning if this ever happens, instead of attempting
to stagger on.

Signed-off-by: Daniel Stone <daniels@collabora.com>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index 498df0ce4680..20b49209ddcd 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -1030,7 +1030,8 @@ static int vop2_plane_atomic_check(struct drm_plane *plane,
 		return 0;
 
 	format = vop2_convert_format(fb->format->format);
-	if (format < 0)
+	/* We shouldn't be able to create a fb for an unsupported format */
+	if (WARN_ON(format < 0))
 		return format;
 
 	/* Co-ordinates have now been clipped */

-- 
2.52.0

