Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9BEAA82AE4
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 17:45:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DB0410E1A6;
	Wed,  9 Apr 2025 15:45:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AB12/GQu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9110A10E1A6
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Apr 2025 15:45:03 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id
 98e67ed59e1d1-2ff69365e1dso5622101a91.3
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Apr 2025 08:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744213503; x=1744818303; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lU43UpH11wLCdsjhsyHst5iurlQ+ThcWcqMooUtxxjY=;
 b=AB12/GQu7Q0uSoKNH7m3VJSKAM7DdrRn3DYuvglbL/RChqNpyKn2AP9WCDYfUYtjUR
 S+VQ+YzJmtZGeBPvLbSxoVCZYmvGRBeUpuOpqSaiNSKlzrsvlX65iZVPsVU9BQP3V8VH
 0YNRj3iXTk3qX9pF1VhiKs7XIpzdD2tOWcXylLM3QdOyKyTEAIVYO5z+/XptJT0tIU1/
 PrqlVOLydzOh7SAAE1Y6aKGhmol92Z9j9wl9y/yGfg4loFukBtY/LwJXqi5JP8dxPhk+
 IqdnYbL/XC4Ouh5f+T8fbkkn4CVJ8S5fK9QlGHND5Rr/1BhmfcHFr5ia73RMkkKqtc+q
 QLuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744213503; x=1744818303;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lU43UpH11wLCdsjhsyHst5iurlQ+ThcWcqMooUtxxjY=;
 b=GvhN9Y5JphIJj9q34Tqjh2i4cqsczAnlqrXGD7qclVnUBPeqoLF2oxgH8OQlef7WAe
 +2fy7UtuZDGW6ACq4SmYxTl2y1o9xYAnJhODqJV8GXE9JaScOBLtlPMQL7pfgTCi9vVE
 hOjHSHYjg26RAvGcX1G3w/nUhLjnHp7KhvatPyelBimRbGKNdInODrFis4ENXBKsYqPD
 8O9ke008AUATYyRtSz6UENN4xGeuXQtOojoG4V/KVCPZ0W5Pe4Zg4mTkb3o7CVS7j0ZE
 h54yOr4PpcDxMePa2eAqGjJpuHh9Sqbau8gglQrYtJiSLbLYrOyXTwLO9VPcJ6JiGS+H
 lIbw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNlWWBlHMf3NuhrsHHNNMuxXPVJ3TeivnByZb7nlsYvlwo4v7gt1vD6470zS8vAQVnf7JKdlf7w/E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy/i/p8axPEFrjmrEU4Ad1t/K92UZfblfl3r84/5LZLf1EYAYUd
 0XCgiMAyt2Xq18JDaOgl8gYmYsC0Jz8S/Tfsp4VIu6szibgESnnF
X-Gm-Gg: ASbGnct+MSXfT0fs3LA8xtKF8mWVSVehy/ol1IiBBeXewdZ+6LpY5le20+CitsRfVFX
 holRYo3fjcV7O5rkkjMshe6r8wsH4ZOby+8oNWJ1/WemWnFVAEOANQdA44ocB5NfBhBtXWdnlUX
 O/wvgzUvywxC+1XnB8SatF93odNLGpcBFdtRPSpi+LUiZDPE4YnGi7M3lQnQmO60spgmjERKvoA
 qrSau3jz2SUlVorjx/VWoZefUOanzzAJ+bSog/csG44bbYgPxr3fhhHSP/Rg7vUWmPzEumN+f8a
 crA5NNH3ncifWKl1Ja8KIxDu8PSgZeUS27XJjRvpSzp5KXqfI0bZ1iboPn8a79+pjZ8ISko=
X-Google-Smtp-Source: AGHT+IEs9q8P41yMEf/AWjN7idtRUGM7Z4tfe1JBSuODcHBz5h8hVFHXITrRQEV2h0IxkqA/pyunWg==
X-Received: by 2002:a17:90b:4a47:b0:2ff:7b28:a51a with SMTP id
 98e67ed59e1d1-306dd52d43amr4827521a91.17.1744213503051; 
 Wed, 09 Apr 2025 08:45:03 -0700 (PDT)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-306dd171991sm1952304a91.37.2025.04.09.08.44.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Apr 2025 08:45:02 -0700 (PDT)
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
Subject: [PATCH v4 03/13] media: pci: cx18-av-vbi: Replace open-coded parity
 calculation with parity_odd()
Date: Wed,  9 Apr 2025 23:43:46 +0800
Message-Id: <20250409154356.423512-4-visitorckw@gmail.com>
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
 drivers/media/pci/cx18/cx18-av-vbi.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/media/pci/cx18/cx18-av-vbi.c b/drivers/media/pci/cx18/cx18-av-vbi.c
index 65281d40c681..15b515b95956 100644
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
+		err = !parity_odd(p[0]) || !parity_odd(p[1]);
 		break;
 	case 9:
 		sdid = V4L2_SLICED_VPS;
-- 
2.34.1

