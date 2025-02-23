Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 013B9A42104
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 14:42:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99CFE10E3A2;
	Mon, 24 Feb 2025 13:41:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CbIUK4Xi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 474FB10E05A
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Feb 2025 16:43:57 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-22101839807so77145125ad.3
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Feb 2025 08:43:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740329037; x=1740933837; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TZw0QJRtM6IhR4KZmh2KNqroHre3ebnX5GDU+1y6qXk=;
 b=CbIUK4XiQUdkXxI9d7LzKRd0aPmY5O6C+96YEhDa5myDSkefgAQnwORbz3o7y/UBqa
 hCGMKOpoZSaTXRgJgyGc3HcP9qmw5PtsNMBcEOAfW7CkFMAjEEWRWybd2qFzPupNx2t2
 IB5QKvT5ly57SFn65zg9tU8PeviurgnC6a8FF1E4LZjs2waChS9/lQecXcyr9wtRmkUQ
 5/bDgujU+JZDzIEKZSX8vxUr7ciHqABZyZwUeSSY6X7Bz+VfFdmVtFj8QKyxVTWtTxuH
 H3rrxqUbHtfdQizjjyqvEUeZNTDpJ4dV+uRJUXDGVYEOrcm+0okU21NQ5seBeeJ7CjMD
 81BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740329037; x=1740933837;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TZw0QJRtM6IhR4KZmh2KNqroHre3ebnX5GDU+1y6qXk=;
 b=cmgSUiX+n2SWBqd156HSsDeht2nM1OQmPtxHMLabgVzKUKppz/c2mlMvggHkfMy1UW
 A5ej7WpgglE4ayGpL8flKlWNZ9MaRPo1NLrINDvmidl8UXp8gh4D6YlDdXpHH75pgQbU
 f1SgEqZRgI84W4DwxLr+qeqNoWpdiUD9XC3OA4iFJ7w8sxV+mzSKB6467K9/Yk6hWTuZ
 zKHW5Eb+HIB3XKLLXJrQiCvge7T2BrIUkBVYFG00QbkowFI6XMIvLv7plAkfqux4p2DE
 RmEw0gB/2qKXIyaNHVRdzuc58USDsBtwhYMzuDvWFrNptLN5hJrGQ5LGAvzn4xrCHW4i
 0trQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUr5uZei5o4f0yQKPCKU8JQxbZp/oC+qGYLzi1OlZ5xIQP8dwPJhc3H0TFw6YEf2HgJcEtvzmOuKYM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxO+08APV9ilqm5sPlPo1B4g8lwU3OiOQl1qrFkEtVOQYeeTBv+
 l1pFr2U0eTAyvqcLFxdVIXOAZoHgDLugAGXzzORCQeZMZust33vL
X-Gm-Gg: ASbGncsm8ZxCORm0FDBO8O1EL0qAtat4H8y7iuzuOszeFRfJYPx0ieFiRyYGYW9cHNJ
 FECsb+2u7lVfAVUBKvMOrEGCITKK0SbiI1SfujMtO7ytukuXfsTitgAGmyf7nFW1GZ+2MEdXLJj
 KXFzRb9wVYGQhTHc6uap19ol1fJ13eWP+maPz2eIvTcTODRpnaCFfoU0EstYZhxDS51H8dLdeVn
 dz1CREA1LSh+ry4v9w4HPCoGZhAzIWbUQPjtRn86+wlkW8GTPcrqZsJVubs9s0XJji4orMY+dhA
 mUkilr8jT14IxlRUi3RG9KjoSKt6259UVX9Kum01Ft1Nr7GA8MKphJ4P
X-Google-Smtp-Source: AGHT+IEgNthmnTYYE27hPhlCIM7V4DPg7XXe7YBwN1u1Fl+WN3rwEYwr5OtCEkA4s1cdBmE2mWkiww==
X-Received: by 2002:a17:902:db07:b0:216:73f0:ef63 with SMTP id
 d9443c01a7336-2219fff4377mr185099965ad.49.1740329036761; 
 Sun, 23 Feb 2025 08:43:56 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2fceb09f6e0sm4935080a91.44.2025.02.23.08.43.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Feb 2025 08:43:56 -0800 (PST)
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
 Kuan-Wei Chiu <visitorckw@gmail.com>, Yu-Chun Lin <eleanor15x@gmail.com>
Subject: [PATCH 06/17] media: saa7115: Replace open-coded parity calculation
 with parity8()
Date: Mon, 24 Feb 2025 00:42:06 +0800
Message-Id: <20250223164217.2139331-7-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250223164217.2139331-1-visitorckw@gmail.com>
References: <20250223164217.2139331-1-visitorckw@gmail.com>
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

