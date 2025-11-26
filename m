Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4227EC8A6AF
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 15:46:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E694210E648;
	Wed, 26 Nov 2025 14:46:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="Ae3ryvOa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9E5D10E023
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 14:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1764168394; x=1795704394;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=Wh5qWNSDKTzzXZXPEH9y3bA7NSZ31m6bdnGJGmdFr0U=;
 b=Ae3ryvOa13S4d6Wh15Gs4uwdHenePX8u997u/FNUoWlPeey9MRbWNsb/
 HhEzqwyxzeI60KTFnc7aBtmKk8+VF7EHp+Y0kRWfP0Kw9qdT++PTvAQ0d
 BhwgRkc1qy+6gZWQO9uCPYzVNprDe3w4RoSZ7dva/iT2HL21+IMA9EIet
 GDqUMDGcs2yFnvaXmi4bVrA5ZvD59sb+mMR87Easmww5tWJtEJSgY1uga
 zrBZ4BJnW1sTY/p3w5r0VFs3a12dVw1TQuMN93+lbYdNFZrZLrhZaKCr9
 hXcCk3DKTASbzqO/0lUATfxcvaITAvujI8hadWeVedhBldshZd3tFx/ZB w==;
X-CSE-ConnectionGUID: E0+1SGJ4QVKpwD0EtjIQkQ==
X-CSE-MsgGUID: u4lNOa0HSKWKZotGTIW+bg==
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; d="scan'208";a="56295466"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Nov 2025 07:46:33 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Wed, 26 Nov 2025 07:46:10 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Wed, 26 Nov 2025 07:46:08 -0700
From: Ludovic Desroches <ludovic.desroches@microchip.com>
Date: Wed, 26 Nov 2025 15:44:44 +0100
Subject: [PATCH 1/3] drm/gem-dma: revert the 8-byte alignment constraint
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20251126-lcd_pitch_alignment-v1-1-991610a1e369@microchip.com>
References: <20251126-lcd_pitch_alignment-v1-0-991610a1e369@microchip.com>
In-Reply-To: <20251126-lcd_pitch_alignment-v1-0-991610a1e369@microchip.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 "Ludovic Desroches" <ludovic.desroches@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=995;
 i=ludovic.desroches@microchip.com; h=from:subject:message-id;
 bh=Wh5qWNSDKTzzXZXPEH9y3bA7NSZ31m6bdnGJGmdFr0U=;
 b=kA0DAAoBPjnmE/d7ZC0ByyZiAGknEq/I8/ftr9puw2cw7lYsgNME7mZK5jnOmuMng0sfq/O8O
 okCMwQAAQoAHRYhBAAwS8mJaaxbjW01TT455hP3e2QtBQJpJxKvAAoJED455hP3e2Qt1DcP+wfF
 0NESQJmXE40mTlP34/PzHfl5bkpsMOAzvoRLuay7c0MUOpHzB+r5+Mg2d+v+M71Y5fH1hi5KgQV
 LJr8AcZhYDGO23gSvBX4TPKwY6utPE1mPn5smzQxm5+GJ0i0Up9u7v7tuTbL4jbPBFAumwEWdHE
 UdkVxV5jZ96LqrM8me6vhvyX+sSJEfOoAoJ75W3Y54QBGPg8gobeJ7ogk8Ygbx1JErtZOHhoJj7
 zHqT7U4ROKW8sp3eS4+r59Mm1/lEtkT3ZgzWDRRmu712WMunBYiibV91Fd28Y1VCLbJcutrD5Vz
 hmVoydIMNJUYMTJ3A4MijsRFeIUaV8TgW/ukbZeNVm4IIATPe7/OO4EK6ZhDVAks5O/UxX1wTYV
 1zNaM2M7AJWI+taYm6AonI9qddLZjZ5SMxODk78VFDPKVpgdJHGUDRlkT3XyDWeb2e9JAYrE+vJ
 dMTYvdVF3zH+8P6YuZGjiw71d1CoxTQGvgcwXEnO+XeKGNuE+xozFzkD0uO8QFyPmSSR0+ISad+
 FME8IGjcJ4qpR8/SxVbUSLup6skzHxQ+jLftSYXJiHa9EzLVcglCvk8tzhSkvxpRgXvVuOOhlPg
 ThcQ4vW2ngzAhebr+/Oaly7ud7iQhhvvpxM6scrZkTI4hcIs4YvkP72hO1B5rkPlYHASYfKtYaC
 SgS1K
X-Developer-Key: i=ludovic.desroches@microchip.com; a=openpgp;
 fpr=665BAA7297BE089A28B77696E332995F09DCC11A
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

Using drm_mode_size_dumb() to compute the size of dumb buffers introduced
an 8-byte alignment constraint on the pitch that wasn’t present before.
Let’s remove this constraint, which isn’t necessarily required and may
cause buffers to be allocated larger than needed.

Signed-off-by: Ludovic Desroches <ludovic.desroches@microchip.com>
---
 drivers/gpu/drm/drm_gem_dma_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_gem_dma_helper.c b/drivers/gpu/drm/drm_gem_dma_helper.c
index 12d8307997a0a90a9b5c0469bd742130fa6722d5..eb56ba2347966040a3c7fd27e09c8b81bc797daa 100644
--- a/drivers/gpu/drm/drm_gem_dma_helper.c
+++ b/drivers/gpu/drm/drm_gem_dma_helper.c
@@ -308,7 +308,7 @@ int drm_gem_dma_dumb_create(struct drm_file *file_priv,
 	struct drm_gem_dma_object *dma_obj;
 	int ret;
 
-	ret = drm_mode_size_dumb(drm, args, SZ_8, 0);
+	ret = drm_mode_size_dumb(drm, args, 0, 0);
 	if (ret)
 		return ret;
 

-- 
2.51.0

