Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 918A1962C16
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 17:23:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1846F10E58F;
	Wed, 28 Aug 2024 15:23:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="QmzhNP3P";
	dkim=pass (1024-bit key; unprotected) header.d=amazonses.com header.i=@amazonses.com header.b="Jw0sWklz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 737 seconds by postgrey-1.36 at gabe;
 Wed, 28 Aug 2024 15:23:19 UTC
Received: from a7-31.smtp-out.eu-west-1.amazonses.com
 (a7-31.smtp-out.eu-west-1.amazonses.com [54.240.7.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FB4A10E58D
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 15:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=4232tfv5ebdrjdwkr5zzm7kytdkokgug; d=collabora.com; t=1724857861;
 h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
 bh=+z4DNLofnJ+4TntmnJnx8/LI+3LWZKrJMGa2MghZgVM=;
 b=QmzhNP3PR3k7RAi3a9umg1oYoxuZ5JH9AdRqMWT0EmsfuahswvU1OkwDSual5N8Q
 gO+Qsou+vQ0s6TfS7PcDbkNb2QeFRDi+lEZdNIMQXKfnErwh2LbYre6M0zLMCwHPAMM
 IawfDLXi2Dk2LjqHgv6NnNAsj0xapMHX1ecVqVn03t41a9vqP1xxkGyZsiR6r+sHaQJ
 xYQkF57SgrCCdUFpMgUFEK1aFWy0tytwMYDXBqaEPRIIlxTLNSA8k/91kXf0BlV40cV
 WkG/9QiZ9aDYkmrmn3A/giQaOkIYH7dOfEKaO0dswBgGbsK/CIsJJ+uAYLc0IJZDKha
 kNA6Webg7w==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=uku4taia5b5tsbglxyj6zym32efj7xqv; d=amazonses.com; t=1724857861;
 h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
 bh=+z4DNLofnJ+4TntmnJnx8/LI+3LWZKrJMGa2MghZgVM=;
 b=Jw0sWklzgiWxA6Qbr8zsz+/n2UL6zTfLrL/OIi43vVND+kKoDIdVzkbOsh96V7C0
 fqiZfA+Lb1GyUbPmyK8aq47N1MmF+jJrv+DM5wx0ZyCa4MFnL3gsNsR0qt8aLoM34r3
 +/GgZ/iDKgIH9wbRBMGdsRM+zb0n3dd73cIsJJqg=
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Andi Shyti <andi.shyti@kernel.org>, Lee Jones <lee@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, 
 Chris Morgan <macromorgan@hotmail.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Tim Lunn <tim@feathertop.org>, 
 Chukun Pan <amadeus@jmu.edu.cn>, 
 Muhammed Efe Cetin <efectn@protonmail.com>, 
 Andy Yan <andyshrk@163.com>, Jagan Teki <jagan@edgeble.ai>, 
 Dragan Simic <dsimic@manjaro.org>, 
 Detlev Casanova <detlev.casanova@collabora.com>, 
 Ondrej Jirman <megi@xff.cz>, Jimmy Hon <honyuenkwun@gmail.com>, 
 Elon Zhang <zhangzj@rock-chips.com>, 
 Finley Xiao <finley.xiao@rock-chips.com>, 
 Elaine Zhang <zhangqing@rock-chips.com>, Liang Chen <cl@rock-chips.com>, 
 Yifeng Zhao <yifeng.zhao@rock-chips.com>, 
 Jisheng Zhang <jszhang@kernel.org>, Jamie Iles <jamie@jamieiles.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 linux-i2c@vger.kernel.org, linux-mmc@vger.kernel.org, 
 linux-serial@vger.kernel.org, linux-spi@vger.kernel.org, 
 linux-watchdog@vger.kernel.org, kernel@collabora.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 05/11] dt-bindings: serial: snps-dw-apb-uart: Add Rockchip
 RK3576
Date: Wed, 28 Aug 2024 15:11:00 +0000
Message-ID: <01020191998a4243-5da1b756-08a1-4f40-9e54-18eb91b8ad5c-000000@eu-west-1.amazonses.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240828151028.41255-1-detlev.casanova@collabora.com>
References: <20240828151028.41255-1-detlev.casanova@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Feedback-ID: ::1.eu-west-1.YpP9ZbxnARFfy3Cb5pfsLd/pdsXBCNK0KEM7HforL4k=:AmazonSES
X-SES-Outgoing: 2024.08.28-54.240.7.31
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

Add a Rockchip RK3576 compatible.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Heiko Stuebner <heiko@sntech.de>
---
 Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
index 4cdb0dcaccf3..cfcfd7a6b78f 100644
--- a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
@@ -49,6 +49,7 @@ properties:
               - rockchip,rk3368-uart
               - rockchip,rk3399-uart
               - rockchip,rk3568-uart
+              - rockchip,rk3576-uart
               - rockchip,rk3588-uart
               - rockchip,rv1108-uart
               - rockchip,rv1126-uart
-- 
2.46.0

