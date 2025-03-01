Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92CAAA4ABC2
	for <lists+dri-devel@lfdr.de>; Sat,  1 Mar 2025 15:26:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E4D110E242;
	Sat,  1 Mar 2025 14:26:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZWbzG3kd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADA7510E239
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Mar 2025 14:26:27 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-223378e2b0dso44910255ad.0
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Mar 2025 06:26:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740839187; x=1741443987; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hp3kGqc16FF01of4e/8WmkeqsdCblTk7qrBu9qHKlh8=;
 b=ZWbzG3kd7/3B+MSnmM/gWeczsEQmG5k2LyxuB/JFve4f82ZH5JNxEf2zFYPOx+WnT4
 7GXqc+qDU7l/8zTNPgPIpPSPqifrrzJ4TkgWoSUvJ0v/B/CX4raAUYJP6Ra9fdVCdSpz
 KXevJnARE6eFarp4Hj6oCLkLEcUbjwX5Z+VPjShspe6UeaRgTPkDSFB1lrcd+7uqzuI3
 5uZ0812/KwYXyaejgmKODV4Rj9RZrF6gaJnjgH3vjyd4FdmsZWf2JJ8F6ZCPzpYwLecU
 zHvqtHFxsA8W2X+WoZHYfRhA5LMgsdBfXY671GlIdMrvlh4F5Sm2zLCrrB18519BcxAA
 b91g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740839187; x=1741443987;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hp3kGqc16FF01of4e/8WmkeqsdCblTk7qrBu9qHKlh8=;
 b=aJokKQn6W/soSr1JV12Jr+YVONGW3EYgSO50T4oO7boOQMbQQai96RJ2VZV9/Ucshs
 r637AruKdFKDpnEbTx/66bHHPmUKQ+3PY6tuF+vwEPSgisDK3PDTHQURlYI0sPAbZEyL
 ncOZzjzRbV3Kf6jkHTlC8x1UPMJ0K/DJX0PISOb79xK/MwIBrmdZwe7kK7wI8yo50Vji
 p5v2yRqOfx2xP+Yyc0y/8Y+f6ybWJzqC93wv0mi98IWcdNAtD0f/QLi0Gkev0nP62Chr
 pMGKulJkKOXIUKDWtYt454n6tF2dkdxI0cKKOjBu8Qkc4NwSlhZueibNZoZDj5Q+BzV6
 5rBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTMV19aDyEodePVz3PygTb6iUSzfUufn+X2yNEfHggepcdis2JURW1s+s1XgFcKlxyw7WCn/8+jDc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxyYbE15WekDzTZXGiCAG9tYht7NhahJcmAWthPonXWWjsXSsxD
 wdWUx82bTflIop1JnKlVXjLJ2AQEj1RNo5IdSIsS+UawHvP3WcpW
X-Gm-Gg: ASbGncvg6jORWbQioEp1DATPt/sIR5TAKmnMr4oH+UgmYo747pAfI6WDsp5Cs4ukdg/
 KZ+cFouv8jHYfeAziDWgUTNdp/zVZSAR18QhbG1SAHYl474DjY/rEccL6wj76E8+ke8G6I71Ggu
 4p7G/5EcGkqBKED5UHRw+QvXxxUvXApSBBp5xibdiuVHADn/v1yJvu6m38aA70Wykq7ZFU8ktpZ
 SAKWJw/TRNdL0oGbvm16BhiinvVi4gmFWFAEtuuMj+58ez3FVW/k5ZgZl0EdLnLOGICcTD+7Qpa
 bJO65Iz8i9JUHGlLfWpDCZsEnxodTOOywIwHmhHvxwUZjCRqKwZR6Hw75K6+2e33IYpbqvZ+FRc
 =
X-Google-Smtp-Source: AGHT+IGHEYprq9u4C7FchZ9I6Y/Ibnse4qNPj1GVk/AdnINX25zgN7NgXyYUydYVyaa9stUlYFgdnA==
X-Received: by 2002:a17:903:198c:b0:220:e1e6:4457 with SMTP id
 d9443c01a7336-22368fc987fmr121177295ad.26.1740839187181; 
 Sat, 01 Mar 2025 06:26:27 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-223501fa8f1sm49231965ad.90.2025.03.01.06.26.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Mar 2025 06:26:26 -0800 (PST)
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
Subject: [PATCH v2 07/18] serial: max3100: Replace open-coded parity
 calculation with parity8()
Date: Sat,  1 Mar 2025 22:23:58 +0800
Message-Id: <20250301142409.2513835-8-visitorckw@gmail.com>
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
 drivers/tty/serial/max3100.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/max3100.c b/drivers/tty/serial/max3100.c
index cde5f1c86353..3b05ed113a67 100644
--- a/drivers/tty/serial/max3100.c
+++ b/drivers/tty/serial/max3100.c
@@ -16,6 +16,7 @@
 /* 4 MAX3100s should be enough for everyone */
 #define MAX_MAX3100 4
 
+#include <linux/bitops.h>
 #include <linux/container_of.h>
 #include <linux/delay.h>
 #include <linux/device.h>
@@ -133,7 +134,7 @@ static int max3100_do_parity(struct max3100_port *s, u16 c)
 	else
 		c &= 0xff;
 
-	parity = parity ^ (hweight8(c) & 1);
+	parity = parity ^ parity8(c);
 	return parity;
 }
 
-- 
2.34.1

