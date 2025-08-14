Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3612B26CBB
	for <lists+dri-devel@lfdr.de>; Thu, 14 Aug 2025 18:43:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AF1A10E8C4;
	Thu, 14 Aug 2025 16:43:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=icenowy.me header.i=uwu@icenowy.me header.b="FFckGQ8P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B66910E8C4
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 16:43:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1755189791; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=ZFVoaYb0BqXsCSXiY7Nt3GjCO/emmFJtWURWBkSKPzSG28oW6RH69rPSaZLEPwsBdDAqQrR0Up7jwRCAmiMl+2tU25UZAbWkoZdbAf0d1YLJZ/dxy+w/gDQxMmGe1fllk+bsh5aAJFEGM7RR4HHlOQpOztflo8BjSwxpEryCudc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1755189791;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=1/iclKhHRrvz1RndiLfggvb+V2P6DE4+wzZACrQdYXQ=; 
 b=PR74O+iTV635aQ+9dTX6kbR3SQUxshF5pVxH2ZoRFmXbNFB/f5F4ryJxgoNSNUuHCe8UvVCrIrrNeWtKFG3ME/3dZR/ojgkpaK+E6ego3V7Tv+0Ciri7O2ri8nz81hi9Kt+EmO8yYixXcGvsy/VznJrHqXgZ3lQgBgKPM8EyWvo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=icenowy.me;
 spf=pass  smtp.mailfrom=uwu@icenowy.me;
 dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755189791; 
 s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=1/iclKhHRrvz1RndiLfggvb+V2P6DE4+wzZACrQdYXQ=;
 b=FFckGQ8PrNiZ2CQY/GtDz7o2T+13e1b9kz3693PfFhJTAf1Scpp2WQqKMew0Gwh0
 Zx6zCs4lzMXSy35XGn++MTl5eWVl8H+NIMf6+rmvyreNA9xoEwy8XTgVK1OvuBOFiWT
 9vVZvGYqDNNvREeFxtxaqTyfNBLC0mUCgw0XQawDjTFpPyrUMIUxN8Twe9JR6sznWQE
 p4tD4Its+W4UyqIF4G7S8nSGBcDQD0q2xzrEH6BctKxO4nZn/HI3r7Z1QsMgdo1wTNf
 uj8NdBewPIsFR35vmaBgiXKZtxRsg7QmiU+l/Usvf3MwCFMPpOYZ6EGX/MaLeUFu0GI
 X+5kxT5bpQ==
Received: by mx.zohomail.com with SMTPS id 1755189789177857.0751333859133;
 Thu, 14 Aug 2025 09:43:09 -0700 (PDT)
From: Icenowy Zheng <uwu@icenowy.me>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Drew Fustini <fustini@kernel.org>,
 Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Heiko Stuebner <heiko@sntech.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Han Gao <rabenda.cn@gmail.com>, Yao Zi <ziyao@disroot.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Icenowy Zheng <uwu@icenowy.me>
Subject: [RFC PATCH 8/8] MAINTAINERS: assign myself as maintainer for
 verislicon DC driver
Date: Fri, 15 Aug 2025 00:40:48 +0800
Message-ID: <20250814164048.2336043-9-uwu@icenowy.me>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250814164048.2336043-1-uwu@icenowy.me>
References: <20250814164048.2336043-1-uwu@icenowy.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

As I am the author of this rewritten driver, it makes sense for me to be
the maintainer.

Confirm this in MAINTAINERS file.

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index eb84e36ded6d5..8c604de979680 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8385,6 +8385,13 @@ F:	Documentation/devicetree/bindings/display/brcm,bcm2835-*.yaml
 F:	drivers/gpu/drm/vc4/
 F:	include/uapi/drm/vc4_drm.h
 
+DRM DRIVERS FOR VERISILICON DISPLAY CONTROLLER IP
+M:	Icenowy Zheng <uwu@icenowy.me>
+L:	dri-devel@lists.freedesktop.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/verisilicon,dc.yaml
+F:	drivers/gpu/drm/verisilicon/
+
 DRM DRIVERS FOR VIVANTE GPU IP
 M:	Lucas Stach <l.stach@pengutronix.de>
 R:	Russell King <linux+etnaviv@armlinux.org.uk>
-- 
2.50.1

