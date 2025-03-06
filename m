Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D91A550BA
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 17:27:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83CA010E9E7;
	Thu,  6 Mar 2025 16:27:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PZqO50yj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B794710E9E7
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Mar 2025 16:27:28 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id
 98e67ed59e1d1-2fa8ac56891so1506831a91.2
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Mar 2025 08:27:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741278448; x=1741883248; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OqxvpgZHoGiLr6YH8sD6RZa4e3r1mx+K51Pz7JFmQwA=;
 b=PZqO50yjoPG89ug6PTh6UO/NExQFXVX9JmFyS9Rblq2mA/0qJ/rOY0KX6CKTu2eKwY
 KgwHpEzHKxjHRaHOxdkXfSP09H2m7AGGn5JS0U2D6/IetpBOKxIXrhI+HWlgqVBd2D/n
 UNyaOsENwNhZtFt9pj4sQAWW0Rm/M0JYZdRcqdHQW9iSbGqKbM19aUoT1tEMrubqY/6t
 QksUpMjH+OB6bHIXt2kbu/GYV5M+SLbdHwnUuvnrBy0FWK8PAZv2Iy9fODSI43Smjcbu
 12IQRNWoVuQB+ea8lYwEcUXHG3fRgwlW3JEiUGVIHJN9mCG+3AjjWxfxb5OcoaPNjLBx
 +y5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741278448; x=1741883248;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OqxvpgZHoGiLr6YH8sD6RZa4e3r1mx+K51Pz7JFmQwA=;
 b=ZGCLg28A4TefoV6/2iFEn5XYKiqeTV6oNOA2mCReX2i4OeLqrlCO+xE7cQJQEmMMxO
 XlLMNK4JZ5I1jhWPt8+3EJIH8BZmvGlJ6GhEUu1PsiteBJ0sz2CwmZdn1giztYmi4DI0
 dZI+F+ClatnYPnzOtA39+SP9RyNDe809cYQcgfWPVVimP9E0dTiw7wZRPtM8Wmk5fFU8
 rp3pWUSyW9ZM1nK6h5+MV9BeISTjHH0Lzbs6SuhCNy/mUXgy2E+0alecq/x5EbxMDTe5
 /s/N7ZrA6xncSdUHlAnkzYxKGSXOPkX66DLvZlwhmH/8WB2H4JQklXMg4IhdRbtSPQq+
 lnPg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZJJ5IV7vArb6Fs6NvSQWPd0/hDVkraGFwGUoLa6Pl2/KukEONaqiY4NrKEbXtwNEaDSOkC88IwYk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxyaSlVv7rjMz3r1qomA25FP+QUGwDZX28w8NZH5Lwik3tS/tDF
 MvpYv+y1hm8LaQqeYDfYd2xMPzx8A2CyHHc/12AdkLJYH724cNWm
X-Gm-Gg: ASbGnctb3Z9i6aYZO4aFznva/mbSRfU0qrLBvD7Bf1immIgmlPVDahZmAR9IWD9iqKw
 uHyvkUpngld1LSNZdadvptPQ+ML4p36eXPItHww4YOwrcCdH+qM9gL02Rc6TIYmYmo6mABKGzwT
 NQ29wHYZl57AYANi61U+Eq/1G8+C+75RJchuhAgQGVqi78HPLyIxBvyl4KO0E7GjZF61ZZBEVSj
 UEJoudGw+NVWXTQPNw+csHx0AYD+zUCLlcsshcmr5XcG/NNhz+zd81S3wle1GPkYjiwVEb2p8AK
 R7+UGpk5Z0seZr/EtkjdICLh5agjPvNkLRH5xruxV0jtkaJmCDVupogA6gpBYzVWCj8QW034tGI
 =
X-Google-Smtp-Source: AGHT+IHUo1VQ1LAiyQ9UXLap7uh1jhPtCUcmwdFlNac3xPKGa9S5gSb9W1skAcfvxZCU/ssK4wuDpg==
X-Received: by 2002:a17:90b:17d1:b0:2ee:ed1c:e451 with SMTP id
 98e67ed59e1d1-2ff497cd4b3mr11755081a91.15.1741278448219; 
 Thu, 06 Mar 2025 08:27:28 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2ff693e75bfsm1464298a91.33.2025.03.06.08.27.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Mar 2025 08:27:27 -0800 (PST)
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
Subject: [PATCH v3 09/16] net: ethernet: oa_tc6: Replace open-coded parity
 calculation with parity32()
Date: Fri,  7 Mar 2025 00:25:34 +0800
Message-Id: <20250306162541.2633025-10-visitorckw@gmail.com>
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

