Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB49A4ABBE
	for <lists+dri-devel@lfdr.de>; Sat,  1 Mar 2025 15:26:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDE9D10E1EE;
	Sat,  1 Mar 2025 14:26:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VCcsmz6q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F068210E1EE
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Mar 2025 14:26:07 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-223378e2b0dso44908245ad.0
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Mar 2025 06:26:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740839167; x=1741443967; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r0Ho2aCKNYfg5T/o22fFzxZ+UyjSx6Fm0wn6W8o8Gr8=;
 b=VCcsmz6qZXqo6AK1JBukBmeYQLOB3F5xbCmcPxRVSc3jWlaMl6CyuSAmUfOLNmybKU
 yxp0SzQJOMgyO6zCjgGGi4LJICdLNFR607nYQeGjV+paerChIpN1TkRMGd3M8evk/wlu
 o7YmGo4I6IxeMWirL8zrvE9oLGYqNPD0QHZXls89F/rHauj9D7btlnHvT7m/K/tXtg8x
 QM3Um3hhFGnGT8aaHotlqoO+8tJxlj5n/SVE5lwjfPJW2PXGmnOGasMrun8EUT/14wAI
 jgBgc0a4+yDYXG9nszA2BAJuTTBgD0x2p9XvZASlYDNVmm9ndAV+0Fj13A4Klzglkf0D
 T+mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740839167; x=1741443967;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r0Ho2aCKNYfg5T/o22fFzxZ+UyjSx6Fm0wn6W8o8Gr8=;
 b=rjf4gyWKEuiKBw8BbaoSapt4JPPVmy2oW6W2FoMnQdiIeK5Ml4/CdqgexzqgkoA9+V
 c447NlIjktNfGWTjfLDXymTbHUuT7w9aYzgH6PQvA6kDjqn9+mykB1Y4DE38qTSxJTDS
 /0WIOffzZEVPoQ8mb58xTCwbBcJM/Vf5NMtXqAxMDGPBDMzQhjrI5x34MjInsmT3uyvu
 IfPsr/nid8Renw5n+u1WNics7iqqVz/Wc4ve2n6WGy7A9fM5tuKnIZGiBRpVs7oCgCwG
 0JDovKKbBNYrycHMoGj449Z9LUjpurxVB/FnEuNUd0t7t9TmUm6DEaTNvTsnz4Az2oNe
 IkcA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVdMln7BLmpkP/Z9mVcX5dtXWKwuXggeYO1fduusO7uVoYxRVTRsoHB66udMrgtQgxVSdzBVqxfpXY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx9qJA8mIrz4Plf73KYQPgMWzq8G0Qn41hQAgWLTHR1svmmFPlq
 3r0MvEWqQlwgRri00vYTTahdx5Qd1FnJXTSbnUbQqZpGucc8R39d
X-Gm-Gg: ASbGncv6OtUB24ZmyFGKzwPALWggt7k/ZOWYddhOHnyrFtoWHEl2UeHeyzCF6rK+IsE
 QH+fhXdH9qQ/kmHbpyOGccXoA7TKGbYAN1h1cvmKvKUvB+RLETvi4vydzyq7Jh41vgWwHEmDjh8
 iHRIg39I+SEIK51EbvSiIIXL9QiUatWFw5eF8Duvdv560wlMePa3rfY5emzb2+qm40TAX5zwvJL
 ls4jTY+Qp4G6+npO8bbvp636FXgiflWxrKAFqIpOBnfNC2rqsrcztHvL5pNApn23+0ospk2Q+ff
 qBLfNoOIaCfasObYG4CHha3lWjQssQxg/XtiWxYqDPYNSu66B0ONYwUae7wMic4QTzgrOZD4fcU
 =
X-Google-Smtp-Source: AGHT+IFTfohTxN61KiiUMR75yyegIVFtOgTpaXboBycWTn/wkpOLO86TKXx34bh6gLZ1DoKzx8tYbQ==
X-Received: by 2002:a17:903:fb0:b0:220:e7ae:dbcf with SMTP id
 d9443c01a7336-22368fc9332mr106296855ad.23.1740839167480; 
 Sat, 01 Mar 2025 06:26:07 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-223501fa8f1sm49231965ad.90.2025.03.01.06.25.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Mar 2025 06:26:06 -0800 (PST)
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
Subject: [PATCH v2 05/18] media: pci: cx18-av-vbi: Replace open-coded parity
 calculation with parity8()
Date: Sat,  1 Mar 2025 22:23:56 +0800
Message-Id: <20250301142409.2513835-6-visitorckw@gmail.com>
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
 drivers/media/pci/cx18/cx18-av-vbi.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/media/pci/cx18/cx18-av-vbi.c b/drivers/media/pci/cx18/cx18-av-vbi.c
index 65281d40c681..1a113aad9cd4 100644
--- a/drivers/media/pci/cx18/cx18-av-vbi.c
+++ b/drivers/media/pci/cx18/cx18-av-vbi.c
@@ -8,6 +8,7 @@
  */
 
 
+#include <linux/bitops.h>
 #include "cx18-driver.h"
 
 /*
@@ -56,15 +57,6 @@ struct vbi_anc_data {
 	/* u8 fill[]; Variable number of fill bytes */
 };
 
-static int odd_parity(u8 c)
-{
-	c ^= (c >> 4);
-	c ^= (c >> 2);
-	c ^= (c >> 1);
-
-	return c & 1;
-}
-
 static int decode_vps(u8 *dst, u8 *p)
 {
 	static const u8 biphase_tbl[] = {
@@ -278,7 +270,7 @@ int cx18_av_decode_vbi_line(struct v4l2_subdev *sd,
 		break;
 	case 6:
 		sdid = V4L2_SLICED_CAPTION_525;
-		err = !odd_parity(p[0]) || !odd_parity(p[1]);
+		err = !parity8(p[0]) || !parity8(p[1]);
 		break;
 	case 9:
 		sdid = V4L2_SLICED_VPS;
-- 
2.34.1

