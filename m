Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A53A82AF1
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 17:46:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D05A10E279;
	Wed,  9 Apr 2025 15:46:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fW4Hqw4x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97C1210E279
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Apr 2025 15:46:06 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id
 98e67ed59e1d1-301c4850194so5658049a91.2
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Apr 2025 08:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744213566; x=1744818366; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dXLi2SRJHleL6i4thZNOgy64MnVVDpLvymelzP4O5VU=;
 b=fW4Hqw4xuTr6JLhCaNDZRdy7HexZ2Ai5fd7OMUjHD5vPoPrVYpMqyq4wgcSAZn61yo
 R2ZMMI7ySqClHUQ0I1dKivHMIZuGz7O8ZuD4RV43SznZnQ0GdmLrvKm330dq2uZF8ISH
 L2M0IsYwbKgmgkTnbEqE35BYg2Hier/IbtS3D0o5wV39/eVazVfTNNfuywmepPBtI0Gx
 VBdic0v321IV/EvMtx8yWZfOGywfMfZvXFequ6vMz4rDssXBLEn/Sfd8QH3JM2aXV7xX
 JWZ3/l+YO2ljFUzMvuyA8KYAZr4O2RgjyU6FbJ6LJWDvFScop8+RBFlPlNUOq9KIlBhG
 fD7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744213566; x=1744818366;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dXLi2SRJHleL6i4thZNOgy64MnVVDpLvymelzP4O5VU=;
 b=CFxJfWQUEspfSvDu4ZIeqEQBt1RgxQtMgg+hTLlohvkVid/AWBJ0wS+MStxDYs5dd2
 TDXo3/qvF6j1gqXGV6Fy4UZUM04nWhtZQ2KdnSr/KwaIfdZS+l/10HBqKXBEMJEmDP35
 f3NWlUn6bk68PEgsERQ+lcwHQvVgtFqnfp/1j6+uNKffJcoc6DLhyLABTj2xtxomQl96
 RULuEXatWEICor4eHKz/JPg5eC1LiZT2dvXtdkROx6T41MbMQUUFXLKHc7QngSXmBF1v
 mPuEpCYO3EYqAg5GT3s7IIlj42gmMd21EbZRZeBByHR84CynV7nAof55oP7ZNPx5OK5M
 qQsw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDWVlMv8U7qrAi3L1M/dBhxt4PD1fU7F+vvt5FC9EtPmlntX7X+6B5LEn2wXsXi+UpTZDFGh5b428=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwZJ4DvQlDQi1Vpc4h2Vyz0ZeDZF3mTu1XttsKEFSzeT/TdZzBv
 yOb5WTsnatmqzu1XENh3OoKTqQn7UrtcV6tVzGflVHFnKf09SwnO
X-Gm-Gg: ASbGnct2z6PbgGd1G3hQrSFtXTlwFyPvtX5Jvd8OLqkAia2PL1isqk3Vn9WuUceaVja
 RydxKsutaXBCr3eFgNT/Dj2MnnkdWqrjiJm/jSBoRNTjjkfhtrCG2C0QJ+ub/R71XOnihfGqySK
 3SISb2NDIvncaUhRxUCoQ/bPduFRqCquU4pO2zl58S1CUIGbI80KIUp/eMbfk39B5Z9OyX5PxCL
 ZDtplnrp4uBP4Gk9Bpp2r2prWzAT2xdS9tHTMgVci887pBd1/c3salUgUxqDFcoNeCMQhyRwJZy
 veaB2tGcKvAsdbBZjBea5D7ZwBV7VROr/VkHpfc6Unt82mhaoXH8SbJgmGTqGaZ2/I15Rzw=
X-Google-Smtp-Source: AGHT+IGweN+KZRMZ3CYcrqcq5iC29qaxOJUe/Q8yFuoByE0YY1D6tXNucvOC/QvWbivmYcNL8OhrUw==
X-Received: by 2002:a17:90b:584b:b0:2f4:4500:bb4d with SMTP id
 98e67ed59e1d1-306dd52eaadmr4119633a91.20.1744213565972; 
 Wed, 09 Apr 2025 08:46:05 -0700 (PDT)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-306dd171991sm1952304a91.37.2025.04.09.08.45.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Apr 2025 08:46:05 -0700 (PDT)
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
 jirislaby@kernel.org, yury.norov@gmail.com, akpm@linux-foundation.org,
 jdelvare@suse.com, linux@roeck-us.net, alexandre.belloni@bootlin.com,
 pgaj@cadence.com
Cc: hpa@zytor.com, alistair@popple.id.au, linux@rasmusvillemoes.dk,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, kuba@kernel.org, linux-kernel@vger.kernel.org,
 linux-fsi@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 linux-input@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mtd@lists.infradead.org, oss-drivers@corigine.com,
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com,
 linux-serial@vger.kernel.org, bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw,
 Frank.Li@nxp.com, linux-hwmon@vger.kernel.org,
 linux-i3c@lists.infradead.org, david.laight.linux@gmail.com,
 andrew.cooper3@citrix.com, Kuan-Wei Chiu <visitorckw@gmail.com>,
 Yu-Chun Lin <eleanor15x@gmail.com>
Subject: [PATCH v4 08/13] net: ethernet: oa_tc6: Replace open-coded parity
 calculation with parity_odd()
Date: Wed,  9 Apr 2025 23:43:51 +0800
Message-Id: <20250409154356.423512-9-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250409154356.423512-1-visitorckw@gmail.com>
References: <20250409154356.423512-1-visitorckw@gmail.com>
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

Refactor parity calculations to use the standard parity_odd() helper.
This change eliminates redundant implementations.

Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 drivers/net/ethernet/oa_tc6.c | 19 +++----------------
 1 file changed, 3 insertions(+), 16 deletions(-)

diff --git a/drivers/net/ethernet/oa_tc6.c b/drivers/net/ethernet/oa_tc6.c
index db200e4ec284..6734b49357e7 100644
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
+			     !parity_odd(header));
 
 	return cpu_to_be32(header);
 }
@@ -940,8 +928,7 @@ static __be32 oa_tc6_prepare_data_header(bool data_valid, bool start_valid,
 		     FIELD_PREP(OA_TC6_DATA_HEADER_END_BYTE_OFFSET,
 				end_byte_offset);
 
-	header |= FIELD_PREP(OA_TC6_DATA_HEADER_PARITY,
-			     oa_tc6_get_parity(header));
+	header |= FIELD_PREP(OA_TC6_DATA_HEADER_PARITY, !parity_odd(header));
 
 	return cpu_to_be32(header);
 }
-- 
2.34.1

