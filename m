Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B736D8A3023
	for <lists+dri-devel@lfdr.de>; Fri, 12 Apr 2024 16:05:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E63A10EED2;
	Fri, 12 Apr 2024 14:05:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="mbXZ0Fx3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2346 seconds by postgrey-1.36 at gabe;
 Fri, 12 Apr 2024 14:05:42 UTC
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D39410EED2
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Apr 2024 14:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=iz1hx/7L8dynupfWEP0T92mcjVsCWFEKtgxf9KmzahQ=; b=mbXZ0Fx3KAMy1mPfFne1Fsa/Hu
 fDG/TD996uRBu7v9UWh2HzQ5So3yFLRfwWnRQiFk8ThTcX/KrjFKYNj6fdqVV81g8oxECk6dkqUrZ
 Tego2i3MBf0McWwZzDBMJs5MIIondjRluhI24lLR0KCyV2nAsBGWTitrKt5GYTQQi7dbBpctW9iPL
 STcwxxyxg2gKIFsqoCzmXURehHUWJmYMWo+cBoQSoBPt/hKGGjGcWfBsCUXX1s1CtO+k90ZmadSH5
 aeoRciGBSHEYo3Jp/JFioN61XSi4Ui+1U4b7rDWy6NAmWXKmoab00U0JAS0zzfKSYyuvyw08Rs4/Y
 9N6Su7TQ==;
Received: from [177.34.169.177] (helo=localhost.localdomain)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1rvGv6-003uCn-TC; Fri, 12 Apr 2024 15:26:21 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Maxime Ripard <mripard@kernel.org>, Melissa Wen <mwen@igalia.com>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Andre Przywara <andre.przywara@arm.com>,
 Romain Perier <romain.perier@gmail.com>, Stefan Wahren <wahrenst@gmx.net>
Cc: dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, kernel-dev@igalia.com,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
Subject: [PATCH] ARM: dts: bcm2835: Enable 3D rendering through V3D
Date: Fri, 12 Apr 2024 10:25:52 -0300
Message-ID: <20240412132559.2365947-1-mcanal@igalia.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

RPi 0-3 is packed with a GPU that provides 3D rendering capabilities to
the RPi. Currently, the downstream kernel uses an overlay to enable the
GPU and use GPU hardware acceleration. When deploying a mainline kernel
to the RPi 0-3, we end up without any GPU hardware acceleration
(essentially, we can't use the OpenGL driver).

Therefore, enable the V3D core for the RPi 0-3 in the mainline kernel.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---

I decided to add the status property to the `bcm2835-common.dtsi`, but
there are two other options:

1. To add the status property to the `bcm2835-rpi-common.dtsi` file
2. To add the status property to each individual RPi model, e.g.
`bcm2837-rpi-3-b.dts`.

Let me know which option is more suitable, and if `bcm2835-common.dtsi`
is not the best option, I can send a v2.

Best Regards,
- Maíra

 arch/arm/boot/dts/broadcom/bcm2835-common.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm2835-common.dtsi b/arch/arm/boot/dts/broadcom/bcm2835-common.dtsi
index 9261b67dbee1..851a6bce1939 100644
--- a/arch/arm/boot/dts/broadcom/bcm2835-common.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2835-common.dtsi
@@ -139,6 +139,7 @@ v3d: v3d@7ec00000 {
 			compatible = "brcm,bcm2835-v3d";
 			reg = <0x7ec00000 0x1000>;
 			interrupts = <1 10>;
+			status = "okay";
 		};
 
 		vc4: gpu {
-- 
2.44.0

