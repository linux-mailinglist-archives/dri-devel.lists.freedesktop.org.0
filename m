Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2926C94A6EC
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2024 13:23:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 804CE10E4BD;
	Wed,  7 Aug 2024 11:23:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=cristian.ciocaltea@collabora.com header.b="RHiWTX6B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o14.zoho.com (sender4-op-o14.zoho.com
 [136.143.188.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE16310E4BD
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Aug 2024 11:23:23 +0000 (UTC)
Delivered-To: kernel@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1723028896; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=nwDcFS+XVFi0a4twvEviFIqeAstYMHzekutR5w2dKOp6Grj39TpvK9mnyMDq4j1af4Bg2jF0jiY92cOUPTQugVSCb48EDFs7ccEsxnu5BO8i9ypcPk5VQhh51V8/ReWN+1dYoNgPvcaC/ryP6JdwyPg7DRl17dfmDOqKi5xuGnI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1723028896;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=EkC4WSUbPnQOQmSPBmNPJYFUfUrufucZSvrElYLGaGU=; 
 b=lxDMw9dX9fvHF5QkwCf8CRFskdOG926owJw38dspYKOWdDXJUO5suvCjyd/RgZEyxCaQKSfKnuM2ULzmsriqQqsuvP0nE9QKNyf6bXCmSShaQCTttu65ae9Tr76wRXR2UwY3gI4JMt4R/57YaPt0SrdrTOwDgVgqpBdAnNZ1WNQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=cristian.ciocaltea@collabora.com;
 dmarc=pass header.from=<cristian.ciocaltea@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1723028896; 
 s=zohomail; d=collabora.com; i=cristian.ciocaltea@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=EkC4WSUbPnQOQmSPBmNPJYFUfUrufucZSvrElYLGaGU=;
 b=RHiWTX6B3JQkP6UmNE1AzOwuKuyZV9R7Ap1fziuSBIjogX0IMAgRbujv2nbF5L8W
 91SF76ffsGndBaeXnpX5IzAOSD0IM+ACs03mArUk6P9Ib1kUNxcX/yjSQKw05rQv1+/
 Rgbz6F9LKcZo3ttt2CwNPwlLChap4hhyi71lBv1o=
Received: by mx.zohomail.com with SMTPS id 1723028895968785.0625405019965;
 Wed, 7 Aug 2024 04:08:15 -0700 (PDT)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Wed, 07 Aug 2024 14:07:26 +0300
Subject: [PATCH v3 4/5] drm/rockchip: Explicitly include bits header
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240807-b4-rk3588-bridge-upstream-v3-4-60d6bab0dc7c@collabora.com>
References: <20240807-b4-rk3588-bridge-upstream-v3-0-60d6bab0dc7c@collabora.com>
In-Reply-To: <20240807-b4-rk3588-bridge-upstream-v3-0-60d6bab0dc7c@collabora.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Mark Yao <markyao0591@gmail.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 devicetree@vger.kernel.org, kernel@collabora.com, 
 Alexandre ARNOUD <aarnoud@me.com>, Luis de Arquer <ldearquer@gmail.com>
X-Mailer: b4 0.14.1
X-ZohoMailClient: External
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

Driver makes use of the BIT() macro, but relies on the bits header being
implicitly included.

Explicitly pull the header in to avoid potential build failures in some
configurations.

While at it, reorder include directives alphabetically.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_drv.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_drv.h b/drivers/gpu/drm/rockchip/rockchip_drm_drv.h
index bbb9e0bf6804..8d566fcd80a2 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_drv.h
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_drv.h
@@ -12,9 +12,10 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_gem.h>
 
+#include <linux/bits.h>
+#include <linux/component.h>
 #include <linux/i2c.h>
 #include <linux/module.h>
-#include <linux/component.h>
 
 #define ROCKCHIP_MAX_FB_BUFFER	3
 #define ROCKCHIP_MAX_CONNECTOR	2

-- 
2.45.2

