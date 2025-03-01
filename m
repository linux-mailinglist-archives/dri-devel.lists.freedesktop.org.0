Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EACF0A4ABBF
	for <lists+dri-devel@lfdr.de>; Sat,  1 Mar 2025 15:26:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1797D10E221;
	Sat,  1 Mar 2025 14:26:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZDfEA0sb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B05010E221
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Mar 2025 14:26:17 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-2234bec7192so28677555ad.2
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Mar 2025 06:26:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740839177; x=1741443977; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TZw0QJRtM6IhR4KZmh2KNqroHre3ebnX5GDU+1y6qXk=;
 b=ZDfEA0sb4ZD+mtnAbrz3TR8CHuolqwOoN5ZN9exib6RKrJT4ewZz4Cb5IpUOn/KoG6
 KB5gvcKQ+afmBMywU4GTwu7qrw8vxgJc3FJsK2UW04fYzCOkCzSg7m3dKilCr8znvP55
 pQAYEEsBwgKutDN3oFoBoz6cMEqoxGYazduXX9sz2a0MiE3HLK0PROl0BDOpMpLXOgut
 NWeK6tIpyhbR+yNFjmAcnUgmXlL1z3BlAZ3QfxNGUnjUL2mOBOkQOwhwm8cuKH9+WjyR
 cqxUxZSqlhyJR3qSWSd6lGY6PyM2jmoow5BpK24GItctBNgSRITHD2UNtPFI+K6Y1mVi
 ezFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740839177; x=1741443977;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TZw0QJRtM6IhR4KZmh2KNqroHre3ebnX5GDU+1y6qXk=;
 b=jYTkvJwHoyYfs9m+ngUyTFWMzwAB/zI/hTe8tp/2WzuHypnSgoado4a4Mls6wfSjnO
 JJSXoTPa+JC8Qt8ZSIQJC6ynZfsEohGnN5qRW3aqKrmmwKlU7POzEORnQEV8aOVfqCup
 55BRv7Em3G2Avm8TJp/7DRMfMnUjPtBXq3+jaAYVv4TRTaQ2LSvnhYzuezbRpdvdNIhc
 0gTnKp8WYO5jKjVjTVV1uLO5lHbRhvN3oa+bTvtJxrg5f+u9gkPF8OrWiXIevm0NCHzQ
 AcHQemumny33X9YVsVB8Wn042jjeh8plgvts8Vf9BCtrX0TXMIXTxnT59NHXcSByVUsT
 LwVQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWaTNG2+NF0obFcJKjPTwxyVHLPrxQkhGwsP5lIEqqr2NrFEEgBPCo7LNAoq3ADCxjBZ29/YS/O/es=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxu7rfuGZLxp3+If5dQqVZjkR8XTFQWqHjiU7cZPgudGSzWgUkp
 IRhnAUeNLwQgAj+Gs+8HhL7mYlJ6Gr+m8yjKqKgCX7gVaLiwwv9l
X-Gm-Gg: ASbGncvMpHIH7sVvJADKTfPYgwbxWD9k3inQZ9P9Ncb+jUl9XvzlAW/uCd4R0IfzBMs
 lgyVYdP3Ht52er/CdiDzO67bIz02nRuHucR+5rtc9tRu1pkO04FOOJsKQrXF0G8GKwuPbQtgM/a
 vODKpSNQ8g7rLgjhKACLGgLQYNL8JQOIpbhgy/LljHA6vj3moNEe3ocaf+pYRuMmIY1FMt2bCAc
 mbM1yGCRKSfgBWLacy+4orJClvKugg/7tPXaIzcrJbVyssReHI6z6D1cT0vFNZlw+kM4iu3eweu
 fwImmATM7fK+Wsn05y7J8UEoT19B64Gw2tYmIv14EtNK/j5P0oXh5xJfaxPuqfB2mMGm+R57L04
 =
X-Google-Smtp-Source: AGHT+IHr7/bNocCASgkhvMFxO0zdSkmZKMBxSgSw4TIYugdqe+gxkfqzHvRXHP0fkW72YV0RkO2YNg==
X-Received: by 2002:a17:903:2ca:b0:223:4b88:780f with SMTP id
 d9443c01a7336-22368f7558dmr109533355ad.17.1740839177198; 
 Sat, 01 Mar 2025 06:26:17 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-223501fa8f1sm49231965ad.90.2025.03.01.06.26.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Mar 2025 06:26:16 -0800 (PST)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, jk@ozlabs.org, joel@jms.id.au,
 eajames@linux.ibm.com, andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 rfoss@kernel.org, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dmitry.torokhov@gmail.com, mchehab@kernel.org, awalls@md.metrocast.net,
 hverkuil@xs4all.nl, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, louis.peens@corigine.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 parthiban.veerasooran@microchip.com, arend.vanspriel@broadcom.com,
 johannes@sipsolutions.net, gregkh@linuxfoundation.org,
 jirislaby@kernel.org, yury.norov@gmail.com, akpm@linux-foundation.org
Cc: hpa@zytor.com, alistair@popple.id.au, linux@rasmusvillemoes.dk,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, kuba@kernel.org, linux-kernel@vger.kernel.org,
 linux-fsi@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 linux-input@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mtd@lists.infradead.org, oss-drivers@corigine.com,
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com,
 linux-serial@vger.kernel.org, bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw,
 david.laight.linux@gmail.com, andrew.cooper3@citrix.com,
 Kuan-Wei Chiu <visitorckw@gmail.com>, Yu-Chun Lin <eleanor15x@gmail.com>
Subject: [PATCH v2 06/18] media: saa7115: Replace open-coded parity
 calculation with parity8()
Date: Sat,  1 Mar 2025 22:23:57 +0800
Message-Id: <20250301142409.2513835-7-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250301142409.2513835-1-visitorckw@gmail.com>
References: <20250301142409.2513835-1-visitorckw@gmail.com>
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

Refactor parity calculations to use the standard parity8() helper. This
change eliminates redundant implementations and improves code
efficiency.

Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 drivers/media/i2c/saa7115.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/media/i2c/saa7115.c b/drivers/media/i2c/saa7115.c
index a1c71187e773..b8b8f206ec3a 100644
--- a/drivers/media/i2c/saa7115.c
+++ b/drivers/media/i2c/saa7115.c
@@ -25,6 +25,7 @@
 
 #include "saa711x_regs.h"
 
+#include <linux/bitops.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/slab.h>
@@ -664,15 +665,6 @@ static const unsigned char saa7115_init_misc[] = {
 	0x00, 0x00
 };
 
-static int saa711x_odd_parity(u8 c)
-{
-	c ^= (c >> 4);
-	c ^= (c >> 2);
-	c ^= (c >> 1);
-
-	return c & 1;
-}
-
 static int saa711x_decode_vps(u8 *dst, u8 *p)
 {
 	static const u8 biphase_tbl[] = {
@@ -1227,7 +1219,7 @@ static int saa711x_decode_vbi_line(struct v4l2_subdev *sd, struct v4l2_decode_vb
 		vbi->type = V4L2_SLICED_TELETEXT_B;
 		break;
 	case 4:
-		if (!saa711x_odd_parity(p[0]) || !saa711x_odd_parity(p[1]))
+		if (!parity8(p[0]) || !parity8(p[1]))
 			return 0;
 		vbi->type = V4L2_SLICED_CAPTION_525;
 		break;
-- 
2.34.1

