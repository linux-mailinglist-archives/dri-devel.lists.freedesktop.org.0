Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9FE8A550AD
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 17:26:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AB3910E18D;
	Thu,  6 Mar 2025 16:26:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="A3/64ltK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1E1710E18D
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Mar 2025 16:26:37 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id
 98e67ed59e1d1-2fee4d9c2efso1691776a91.3
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Mar 2025 08:26:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741278397; x=1741883197; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r0Ho2aCKNYfg5T/o22fFzxZ+UyjSx6Fm0wn6W8o8Gr8=;
 b=A3/64ltKL5vlDiqh9lDeFJrBXvfnG0wXHKrJkgpn/TaWmO+lVP6ZCbM9vMn6x6Sa2U
 SvN+znMAez9YEp/W/oJTOp6FhygeXiaq6VvPlWO7rGf/tw9+FJMgcAFzN/y+pX3/Hf/o
 0nY936hDwB/4eXpaYZ57HpS7xhBZ6Kdnf86MPsiQ5KUVYwHVuSSzZcYOX1KMgCLLS5rA
 K/WIoqpB4UuE7pFXpVixSXms8sgBb7Jtvvys1EwnVh7dP5+SxYmAT8Baoj27Jdn8OU6h
 uRp7Dcq/HsIc1DvMMm3xFIW8Vg4f9f/T8YdDaVH8oXY9vhHH8crKvMyU5bdWfrILcGHB
 0lsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741278397; x=1741883197;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r0Ho2aCKNYfg5T/o22fFzxZ+UyjSx6Fm0wn6W8o8Gr8=;
 b=VyP6IGOU6jWzmEBwE83WAuNc3y0Ho872yEhM0+zpMbLhrpU266ms4p5V1adIxyw/Jl
 8PwFARR6KD5bvw7S4fYV+MOpThCycqtlD258zA3y2ssaFIw2xuli50rx5RKiPuKAaGoO
 uhOU/LNhNGGZmp0PY69pTgF5N0mqtIK8Rm4b4sJmie518HNRYWMC6Cjj+k+vtaK42oGi
 wrqlSqdIosn8ALZ+7rkwlQJUqO2zl9lbwaIehmcQXtAfxHhsCu2ltVz85KKKlszI8EUB
 XjyI8XR1A/v6sF9HIlNYcogdwTATFGeZqJF9Ng42U0PpEmJEQlGH7H1hGPPYjce1IEpy
 wNwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWptnWB0W43GvuZmaMSWBs/todUyz5yRdEIWAKcnzjHIhJwiU5HSAmaXsOcKdbvRjKedKXjOYBKQDM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxuwLjuoyvXRQMYbtNpG3tIo9VndEIJsuuCoY9Uwp8RzSUDbFrp
 F0aoDukaVprDsZTkhl8m7vpR1LvnU+/X+MTpe1JVujxvjJ5hHaSu
X-Gm-Gg: ASbGncvhdn4CgHuTUpTRhVkDwGaMPKECK2WbVq1nDanS/qHsAYHSHrkkCit/nOolBTB
 e25cJ7rMaS+PIlbhvCI0B0zzwrmJ7ROZNWPnAcPyY22Vx2mHmUiZW9odA3r9OWx7v5Yfzzuub1E
 PuGZAZzuE7Hzds3NXujq7ERA1Bbppkb100v5hpBmq+IlsO3KE/kwPVYHTUxA8x2EpNKeBzJJzc8
 SuW8j8mHcgtrFKI+ragNkuHg43Lh60aRYauQ8MGbbEiN9jTnWouLYzEIlxvYQ4eD0NecaBc6BAs
 MdLHG4wzmrqre+LrR5lk9lsBVJVMlbygbfS1JDd0JklsIKXAQU4fb0ptTAqlWZoQAuAsVkTNNIo
 =
X-Google-Smtp-Source: AGHT+IEdHwa48DziWanocz8wQ67fQs43cM3+X1TXQ11+KVNWCpcETjdD+vdPtUkiB0WUQbIndA90jg==
X-Received: by 2002:a17:90b:1cc6:b0:2fe:afbc:cd53 with SMTP id
 98e67ed59e1d1-2ff497a62c4mr12413101a91.28.1741278397498; 
 Thu, 06 Mar 2025 08:26:37 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2ff693e75bfsm1464298a91.33.2025.03.06.08.26.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Mar 2025 08:26:36 -0800 (PST)
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
Subject: [PATCH v3 04/16] media: pci: cx18-av-vbi: Replace open-coded parity
 calculation with parity8()
Date: Fri,  7 Mar 2025 00:25:29 +0800
Message-Id: <20250306162541.2633025-5-visitorckw@gmail.com>
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

