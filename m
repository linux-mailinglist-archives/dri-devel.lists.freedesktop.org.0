Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B74CA82AE7
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 17:45:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE83110E1C0;
	Wed,  9 Apr 2025 15:45:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ep2t8SWn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4225910E1C0
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Apr 2025 15:45:27 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id
 98e67ed59e1d1-301c4850194so5657316a91.2
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Apr 2025 08:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744213527; x=1744818327; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eUZBDj1ge3+4V9XGnjqkyMjyFYeNbBPtxuQpoO8Pkmo=;
 b=ep2t8SWnlWVCK3B6HjZJojBOxk9trqDpd8dxx5Srsg7HU4SrDrhql3venoVuhATBL+
 SGfv0fngnlmqJjkXC1j4g66Tl+G8BvhrRjrhYIlQ4GyoGPwcAnOzrjwsEEcpg3M+mcJH
 vlJklUYvfjs+ugB2qeRGnW0vaeouOugHdwU7F4x3JUqrnIqoqGWZ0y8ytlyJbhCwSh5D
 bcgbSDpXkBBoe9YLLKrADa7rQkKaHVtDrNMvfmzgEdrYxPjXY+47dF532HinT0WzmviC
 mbY/jM3cR7KXdjaj0n9+yt4xQDmS14TBzv687hyUIAXry3gvVruzmd3XdTFBYT5JOsBX
 asJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744213527; x=1744818327;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eUZBDj1ge3+4V9XGnjqkyMjyFYeNbBPtxuQpoO8Pkmo=;
 b=JA29Wm7rqVYt40DosLLS/3c+/HjbvM0qpk0Lsr0F+ZGIfhJw+AN0ymk1lIzc1+elA8
 4o4LLKidsiY8VGZRb0F8EMi8anHPoGpoL4wP03FGkxfc4QiU0b4ez+v8Wjouu4K9FRkN
 gNrCn/mxcQVgV+wP5YxjjdXHP5AcRpSk7KjZlSET7Nns8NzgsthpiVBdcCewuKPJWD3j
 Miy6siI3V0oCVaBPQGby0ozz9wQSVhY5SSyW5GoTOCtMqw1uKJZHAHxFsxMhk3BlLXSL
 SPN+pUFkQqd6U35ogtuUiZAUwdYj7SOkiQwvTC+j3hbv1wJhf1pVYx4yJoF8kVcES98v
 mTeg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXuPogcQpQ4ZDHTm7M5Y/e1PP3fxD8pzKLaf2t8Sl8+7bM6zZMHbjZVET0PeNKT7lTdjewYMD9Tz3E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxhjHg3bmwrogpCjtW/GI9f9luHolDgcztzJafPfpJmgC7ASJvm
 +XlnGbMFK3wXQc2E9IQioQ2hb73tFS1kzfrWnLsmMWkHTstAvt0D
X-Gm-Gg: ASbGncs85SrF0uXnnBrq2I+Rmc/3tk9dmi5yUxihqUdhXuepLCMYPBG4e5+aHXapHZh
 27DZkFHMtYbbFTVcP961UUKRv01t1uNs4JDjwlzzuoLKJY1ZEFzboH1/qpO4PWC22+P3erNVKc4
 yylReQLoveh/FLlLnMK3pw4jOHH5q3QHfMjP4EFO0L7EhIYApSwf+9pfEXOFbeU7ggy80Ht7lF3
 uULF43T+9zQ4PK5vkJKMao+taRU5vKXQ3aS4nyc87nku7labD2ahhSFNw0BdRNVNqHHIMEDjhPv
 FJv7oDkyvwAdckqQgv4QrzPIeU9WXk3r/zbTp4OpE9cOgWIIYcgKiq0TX+3uOufl6WeL3k8=
X-Google-Smtp-Source: AGHT+IGnNb2L5TPy8ZRk67DQoWNz3EnKr3D/3b81/wzKSzl4+H+Bebt+R4hGqZaj7Jkg168nL9a84w==
X-Received: by 2002:a17:90b:2e4b:b0:2eb:140d:f6df with SMTP id
 98e67ed59e1d1-306dd3247b3mr3471228a91.1.1744213526748; 
 Wed, 09 Apr 2025 08:45:26 -0700 (PDT)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-306dd171991sm1952304a91.37.2025.04.09.08.45.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Apr 2025 08:45:26 -0700 (PDT)
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
Subject: [PATCH v4 05/13] serial: max3100: Replace open-coded parity
 calculation with parity_odd()
Date: Wed,  9 Apr 2025 23:43:48 +0800
Message-Id: <20250409154356.423512-6-visitorckw@gmail.com>
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
 drivers/tty/serial/max3100.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/max3100.c b/drivers/tty/serial/max3100.c
index f2dd83692b2c..36ed41eef7b1 100644
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
+	parity = parity ^ parity_odd(c);
 	return parity;
 }
 
-- 
2.34.1

