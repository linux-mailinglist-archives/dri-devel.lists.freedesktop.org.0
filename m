Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE754A550AF
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 17:26:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1525110E969;
	Thu,  6 Mar 2025 16:26:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GBk9RvSK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2576F10E969
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Mar 2025 16:26:49 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id
 98e67ed59e1d1-2fea8d8c322so2026953a91.2
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Mar 2025 08:26:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741278408; x=1741883208; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TZw0QJRtM6IhR4KZmh2KNqroHre3ebnX5GDU+1y6qXk=;
 b=GBk9RvSKrN7T7RIhg9k+rLC/NJtJ1uh+tZSc8pC8yRnKC3kfb1vsjT3qxBKLY43pls
 WM4SBWTEUT8muXx9F2TUVPSLRooVGWpQypyj+8KeQS9v4/8rPoruLc6ValVT9nwqTn7Z
 TvcWhYXjXEnJI57tzCUkuD0pNQlP1MptOLZ3nr1aHi5GSrmlizU9Y1AthrGJObeP70CK
 5z1AsI59Mb79RkmF80cqWiEiv+sSraegTG1QKm7jwgpwFUT+TCrfCw59weOv+ZPym2LG
 /7o98akIgOMNQTXcy64JtSUwOk3VbZbE7vOcvFA/f8ExxUG5+kAtqmxQ5mQZIR0Hi2Km
 CjvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741278408; x=1741883208;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TZw0QJRtM6IhR4KZmh2KNqroHre3ebnX5GDU+1y6qXk=;
 b=ovgQCG8s1TZ8i8XPAPxkECrXm6RDRdeICUUBVpyYCaR2O6zMNWVhiTzSxNAfwAo1BI
 r66EABWUdrUKTH6pAQqCzxU2kErzWEATyiGx418fk6XC1GDvxJnrGjAcCXC8o/zn/D+c
 OoZxEPDd2hbVs3DGTk4IGl8+Bwo1iHH275mStFz/wmOe0FwkI/4OhyfjG38sLaNU44bW
 qYGufYn46rcZfkUfqaKiB3q7qCjGJotJiaakgp+IvSP61Fe32qYGCcXmett6B44zgw1i
 R7HD2498q5dl8cAHmFv2HAQB4ww95Lh7gArfYesA6qtGg0aSd4tKECOMUUYObruWMYM1
 mW/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXaPrvE1dNhAF2eEuWkYC5zt446/+ad6DD5o9MvyKIezwjAddorXChTKp0yohWzxksDmMaQlHVpNFQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyyFINQ1lRFNwMigx6YTPqCbmMsbDltWvlOXJ6A7J7CISgwKYW5
 CMgiJcJ7NCFCnrre4N3jot/l9VJ0S+IEMi4YSp38tF4W5r5DsAeY
X-Gm-Gg: ASbGncsEaAvBs247vqjP5bvniSbSCY29kZrNMW00iu71IJMXT0le4G5sbUutzBKkTBL
 78jeoiQK3GhIC1FM3H+AVDiBJom4xvCEfiO/92Sr6CWFjSL9cNUhNC45z+Cjd9BGvo4O/9luR2D
 QXWhQi8V9cNen5x4xK8L9bVF/c4qRNvKnLGNTLEzJxMTqGeuZbV/RrSRL1i2wAdH818iaa7jl6t
 /JFPLZKW9jW3V38QvXYaMBYKSRPyBdgQbxa7UhRKDXVsKLZQh20Vyz3YNyBNfumkOdn38w591rr
 hkYU/padw21k1yHc0v6gnvdvdUyP6sDwb1zeJq2yCbFS/XlVULW76UFlJ0MJuEr5lhJz0JWktRk
 =
X-Google-Smtp-Source: AGHT+IE6epbCXvOg8cIc3QqWkrmaal2XvyOtsnANvbKq/mA/VIWvo3NmMHOwXwWdALV1bmHV/eFsdg==
X-Received: by 2002:a17:90b:4b44:b0:2ff:7b28:a51c with SMTP id
 98e67ed59e1d1-2ff7b28a652mr262212a91.34.1741278408658; 
 Thu, 06 Mar 2025 08:26:48 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2ff693e75bfsm1464298a91.33.2025.03.06.08.26.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Mar 2025 08:26:48 -0800 (PST)
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
Subject: [PATCH v3 05/16] media: saa7115: Replace open-coded parity
 calculation with parity8()
Date: Fri,  7 Mar 2025 00:25:30 +0800
Message-Id: <20250306162541.2633025-6-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250306162541.2633025-1-visitorckw@gmail.com>
References: <20250306162541.2633025-1-visitorckw@gmail.com>
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

