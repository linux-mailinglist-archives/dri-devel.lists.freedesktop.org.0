Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0CE7EDD5F
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 10:07:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 496F210E145;
	Thu, 16 Nov 2023 09:07:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 584 seconds by postgrey-1.36 at gabe;
 Thu, 16 Nov 2023 06:40:46 UTC
Received: from mail.nppct.ru (mail.nppct.ru [195.133.245.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0A4410E0FE
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 06:40:46 +0000 (UTC)
Received: from mail.nppct.ru (localhost [127.0.0.1])
 by mail.nppct.ru (Postfix) with ESMTP id 59D5E1C0D49
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 09:30:58 +0300 (MSK)
Authentication-Results: mail.nppct.ru (amavisd-new); dkim=pass (1024-bit key)
 reason="pass (just generated,
 assumed good)" header.d=nppct.ru
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nppct.ru; h=
 content-transfer-encoding:mime-version:x-mailer:message-id:date
 :date:subject:subject:to:from:from; s=dkim; t=1700116257; x=
 1700980258; bh=/9MO8o7o6nntPf+7n/of28fm2Es83s6OBU6s1H6hwTA=; b=s
 HeYkQoRwz0Szky7dzmleNuXRv0FBJ1caHfRp8sEEfuAk4BkB2Y4qXHxHKJWmSK4l
 bV0GeAYJQoAbHhCBqOln0jVXD6sFILijoHK72Vxsf+JUwiBXbXVP48GmV2xJlsxw
 h82wbF4wQWDkQ4ABYjqgCpsKlgGXoNb+W920jsh1Bw=
X-Virus-Scanned: Debian amavisd-new at mail.nppct.ru
Received: from mail.nppct.ru ([127.0.0.1])
 by mail.nppct.ru (mail.nppct.ru [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id oiCozx535_4d for <dri-devel@lists.freedesktop.org>;
 Thu, 16 Nov 2023 09:30:57 +0300 (MSK)
Received: from localhost.localdomain (mail.dev-ai-melanoma.ru
 [185.130.227.204])
 by mail.nppct.ru (Postfix) with ESMTPSA id 57B921C061A;
 Thu, 16 Nov 2023 09:30:55 +0300 (MSK)
From: Andrey Shumilin <shum.sdl@nppct.ru>
To: Karol Herbst <kherbst@redhat.com>
Subject: [PATCH] therm.c: Adding an array index check before accessing an
 element.
Date: Thu, 16 Nov 2023 09:30:28 +0300
Message-Id: <20231116063028.35871-1-shum.sdl@nppct.ru>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 16 Nov 2023 09:06:53 +0000
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
Cc: nouveau@lists.freedesktop.org, Andrey Shumilin <shum.sdl@nppct.ru>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 vefanov@ispras.ru, ykarpov@ispras.ru, Danilo Krummrich <dakr@redhat.com>,
 vmerzlyakov@ispras.ru, khoroshilov@ispras.ru
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It is possible to access an element at index -1 if at the first iteration of the loop the result of switch is equal to 0x25

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Signed-off-by: Andrey Shumilin <shum.sdl@nppct.ru>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/bios/therm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/therm.c b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/therm.c
index 5babc5a7c7d5..78387053f214 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/therm.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/therm.c
@@ -180,6 +180,8 @@ nvbios_therm_fan_parse(struct nvkm_bios *bios, struct nvbios_therm_fan *fan)
 			cur_trip->fan_duty = duty_lut[(value & 0xf000) >> 12];
 			break;
 		case 0x25:
+			if (fan->nr_fan_trip == 0)
+				fan->nr_fan_trip++;
 			cur_trip = &fan->trip[fan->nr_fan_trip - 1];
 			cur_trip->fan_duty = value;
 			break;
-- 
2.30.2

