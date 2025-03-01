Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38150A4ABCD
	for <lists+dri-devel@lfdr.de>; Sat,  1 Mar 2025 15:27:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BD7F10E24C;
	Sat,  1 Mar 2025 14:27:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FdG/wbWM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 070BD10E24C
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Mar 2025 14:27:00 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-223594b3c6dso51921535ad.2
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Mar 2025 06:27:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740839219; x=1741444019; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OqxvpgZHoGiLr6YH8sD6RZa4e3r1mx+K51Pz7JFmQwA=;
 b=FdG/wbWMTx4vTe/h2vysLZfJsf1oqwzyVoqXlSgprL49gHLB637DzhZoRVVGQ9yU1w
 ggen6unce0sE/OmdqgWuR6Z4vnnoOxky9wNHZzuDiuUk+a6W93k0/vWtZKGVQxfnxjTD
 GlMVDmzCIGeIPAmSdWZ0I1czMePWeY5XRFRd3Qm2xJJE99Dik9+TF9RuxLTUT1NI0y22
 CyMLNozqFHSkWllGQgooU0+6k1j58OpEIrEGhQQSXRUHWZ3awmvpedW+w4oWrAQG+MFm
 ePkzMwkxq0v8Y21PGM05UvRRHw0l3IoYVMWcgNhe09MwWVas/r2t/LhiqN3hWoEVoyhc
 1xDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740839219; x=1741444019;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OqxvpgZHoGiLr6YH8sD6RZa4e3r1mx+K51Pz7JFmQwA=;
 b=XJnv/dn43ANkNHjHMfbSS4M01z8P9cbxqA4+1dSiq+Hkl1gv0gldeoouJ73rceXYQW
 2Jg1ujsFGXgznEcYEOLUZKve7BVTieyLaX/sP/WKv+PtdbkJaEBtaPqU1apqT4VY9T7e
 6w1iWO80OrWlnf8ZZ845SGF9X1sDQWEFX5kdLPlBw/YgSePPudjmedt9WG31/lpLgzBR
 kwGJfXSHK+akUU3eXn2c9XEj1eblnZVsHzNcuBLtdvmr7bjRBGjo6niYCUNODY6l5J6m
 qlJX1dr6OdQsXHAgebtZYvYy/qYfC4R1s0eIIz99GqTKyJoDCqPMmsd21afOrjO3+N91
 NgTA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUExbPZUEjHMKS+pYANnZBYkWgB4pHC990FRBPXtaNDnc2So2KuRbRlcosk99NEomfOILKliIRBMbQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzT3gZbfbX4MUvtNytk4/cepSTFMZPexMlrZ3tF1raWToYzB9ec
 gbcCeig4I1rIHYYv3hU4ulB3YhCyY/jWkvKrFYSZZ0190/glGvpG
X-Gm-Gg: ASbGncuGb0yz702cP+7J2FahFg1wFeJcNZQ6RCXL1QtBw/SVSJz6kt9q0olH6qlL/5W
 Ng51o2MSUTep7kVR+6nHNQWhIeRprBoi8LG9CX7mt8svmgRjfW7jpryqIFAdXTgqWAIvltpYtaS
 6jiCLCw1dzJPxgfi4/RLoNRDtXk0CXCaNw3uL4Qe2fumKQ4H2WXWK+WUt8zrj6UyFulaq/Wxj+b
 hG3A+W4E1niEqNGrTr0NnwQtakDE8maQFdSrz+vQOZP3dt4FHIUsdDMTmxnBTQxrpz3QrkSO3A7
 +JWUE69NRJNNtezXYux16Riy17flUO5puowU7YuYkEKVOhZRZiF13/0IxX5FDFtPpoLqbVq9wcA
 =
X-Google-Smtp-Source: AGHT+IGwTX1zwhWAXU1AZVXFy1OzhL7kB0zYwA4xHDy3bfQBeELXGyOD8jSe52YiMtbVSQB6FlE4Fg==
X-Received: by 2002:a17:902:ce0d:b0:223:4b8d:32f7 with SMTP id
 d9443c01a7336-22368fa9062mr110269565ad.19.1740839219506; 
 Sat, 01 Mar 2025 06:26:59 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-223501fa8f1sm49231965ad.90.2025.03.01.06.26.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Mar 2025 06:26:58 -0800 (PST)
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
Subject: [PATCH v2 10/18] net: ethernet: oa_tc6: Replace open-coded parity
 calculation with parity32()
Date: Sat,  1 Mar 2025 22:24:01 +0800
Message-Id: <20250301142409.2513835-11-visitorckw@gmail.com>
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

