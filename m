Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DCF6A420F6
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 14:41:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3CB310E3BA;
	Mon, 24 Feb 2025 13:41:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mB6c/Iax";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AC0D10E071
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Feb 2025 16:44:42 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-220f048c038so68415165ad.2
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Feb 2025 08:44:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740329082; x=1740933882; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OqxvpgZHoGiLr6YH8sD6RZa4e3r1mx+K51Pz7JFmQwA=;
 b=mB6c/IaxrCfTab7l3/pjqSnhmmqHxrSXH5BFoEJQdKbODxXzJKNeRtM1mkvbuPK74Q
 wVMpJJ+MzXsfrRu5XtBtKSDzzbcFqrQTdB5LNqWzy+84DosQ2jknHkS1nanQtz8cYAsl
 jZnzNaOr2bfi+PewaVa7cv9ggaH6+QPb1gTG0sKk6VUb6eQYauHRmhyp7MbnNS/rGInk
 dsOsJi23AsSSXrmOkd4xAGpNGo1hpqGBTigJXBkbW4UKgUyF19JDTC4gsH4Pk5W4cyZr
 9pMBgFr8CDnWjQpf4hjG9NVku7D9EC0wsODKlILHMIGpKhCefvYmmUfpMT50xgAatFn5
 oVvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740329082; x=1740933882;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OqxvpgZHoGiLr6YH8sD6RZa4e3r1mx+K51Pz7JFmQwA=;
 b=IvgZeCQGydkjGcrtQ43+cuV6/sVFBOMh6fKTuZt2IujE2K/Po2U/kgeV1nnIaPhN8U
 y55JWZ2QC19ArKgF1aYk86V157Ub5tqpIeM4d03T7YnHveZfsotjB3CFrM0YoIB2rj95
 JH8fjVNcDQtaefGIuQBhTKg14dlJSbzFzPeR1j66IP0JYM4AVxmORdNqeCoKFcuOr8cm
 SYV2xjkfqbrwxkt+YTG2914iIbl7hHfcxRSRyeA/Y/ddVQswRnkm006C1VN0YFEud2YJ
 gJYpgXylrMq7SMfTtobDE7X0/Bvmsj8p2Q1XQRsrKf4dbXJ5IcYw8fedayFiCNwxcU1w
 l8ug==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFIRZiC0gps4wrslVSLwcVdkiEVfBc6Sk4kKRhGMoAG8LnWH6t0xFRo36C+R8XMB7uVEq6wWeG2qQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzkzUT5Cow0xldxlw8seKfCyA5mXzawNX9DgrmkVKoHkg/KvHsG
 Ryv72j9+w7WQ/le+qM+hfYBSNUUkV4L6+t+9YL/q3RkRY7pk3KR0
X-Gm-Gg: ASbGnctH+SuhnVeV358HxSA8RjUmVYf30zTPQ+e1QYd0jYuirRGGQZqhuVq5q5KBzmu
 6ZP/Oe9VYYtT7Fm/VArKznuyzDTNSaVx4tH2jowpvwUxAIpMir9pzFYRu9pLU02dwYFFcLQPCvh
 335XiU8EP9NML2oqSsOXZ65IDZO4OGEvfKvHHB0+BhLFRl8hdAP/HQm10t4QhnV+rOoAGqxGPDb
 LOUxO5UJWyXsLH44HehK/U5ZrljVy9oe6mtfNOo1wQ0kv7xxqjIvXMpc8j3YURqq9sXXOAricCS
 xq4T1pXuPOQhN1yIOBJhznfguwaWXkHy0N5leTEoCznG66qv0HF1+q7U
X-Google-Smtp-Source: AGHT+IGsE1LtqpOiLzBH/xsJP0qffWffejZOaFdgJ8XT2KOaHV87U7eq24SL1hIn8uNFPIxHHHWZ4w==
X-Received: by 2002:a17:902:d54c:b0:220:e023:8fa6 with SMTP id
 d9443c01a7336-2219ffd8556mr169735225ad.50.1740329081702; 
 Sun, 23 Feb 2025 08:44:41 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2fceb09f6e0sm4935080a91.44.2025.02.23.08.44.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Feb 2025 08:44:41 -0800 (PST)
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
Subject: [PATCH 10/17] net: ethernet: oa_tc6: Replace open-coded parity
 calculation with parity32()
Date: Mon, 24 Feb 2025 00:42:10 +0800
Message-Id: <20250223164217.2139331-11-visitorckw@gmail.com>
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

Refactor parity calculations to use the standard parity32() helper.
This change eliminates redundant implementations and improves code
efficiency.

Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 drivers/net/ethernet/oa_tc6.c | 19 +++----------------
 1 file changed, 3 insertions(+), 16 deletions(-)

diff --git a/drivers/net/ethernet/oa_tc6.c b/drivers/net/ethernet/oa_tc6.c
index db200e4ec284..f02dba7b89a1 100644
--- a/drivers/net/ethernet/oa_tc6.c
+++ b/drivers/net/ethernet/oa_tc6.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/bitfield.h>
+#include <linux/bitops.h>
 #include <linux/iopoll.h>
 #include <linux/mdio.h>
 #include <linux/phy.h>
@@ -177,19 +178,6 @@ static int oa_tc6_spi_transfer(struct oa_tc6 *tc6,
 	return spi_sync(tc6->spi, &msg);
 }
 
-static int oa_tc6_get_parity(u32 p)
-{
-	/* Public domain code snippet, lifted from
-	 * http://www-graphics.stanford.edu/~seander/bithacks.html
-	 */
-	p ^= p >> 1;
-	p ^= p >> 2;
-	p = (p & 0x11111111U) * 0x11111111U;
-
-	/* Odd parity is used here */
-	return !((p >> 28) & 1);
-}
-
 static __be32 oa_tc6_prepare_ctrl_header(u32 addr, u8 length,
 					 enum oa_tc6_register_op reg_op)
 {
@@ -202,7 +190,7 @@ static __be32 oa_tc6_prepare_ctrl_header(u32 addr, u8 length,
 		 FIELD_PREP(OA_TC6_CTRL_HEADER_ADDR, addr) |
 		 FIELD_PREP(OA_TC6_CTRL_HEADER_LENGTH, length - 1);
 	header |= FIELD_PREP(OA_TC6_CTRL_HEADER_PARITY,
-			     oa_tc6_get_parity(header));
+			     !parity32(header));
 
 	return cpu_to_be32(header);
 }
@@ -940,8 +928,7 @@ static __be32 oa_tc6_prepare_data_header(bool data_valid, bool start_valid,
 		     FIELD_PREP(OA_TC6_DATA_HEADER_END_BYTE_OFFSET,
 				end_byte_offset);
 
-	header |= FIELD_PREP(OA_TC6_DATA_HEADER_PARITY,
-			     oa_tc6_get_parity(header));
+	header |= FIELD_PREP(OA_TC6_DATA_HEADER_PARITY, !parity32(header));
 
 	return cpu_to_be32(header);
 }
-- 
2.34.1

