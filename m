Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1440A550BF
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 17:27:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BB7310E9EF;
	Thu,  6 Mar 2025 16:27:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="C6GPDvNA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1614B10E9EF
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Mar 2025 16:27:39 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id
 98e67ed59e1d1-2fef5c978ccso1515359a91.1
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Mar 2025 08:27:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741278458; x=1741883258; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ih00TRqmhmd1Mh0sl7zFiAmpBAeBPMq/8Nno4TrvKu8=;
 b=C6GPDvNAhZWuToL7KXOa21ELZjOiFzhN+JxvScTqQOJ35xyaJcOiNN+Ue6r5q5TLjF
 P23L7Mgd2r4qttywJ5Ri9aImZ47JEa0cMAxvz7twY2PghFMzkvkp96p23vZqsBXIosqj
 8qqwpVG5SsBi5BJSjuM+IY1bM9KxUVNoN9cobV6zAZ/+IF9M8hmyNQxkjceJ9P8EiLI5
 oavB9t6K0ONHVPczyXCvIaZisuol6iWxqIGLvJ0eZGqL9brhycHtCSCxwhKI07cqn8Kd
 LlW5SF9nRevpA2KdxPZVBif4Zg7ZGAYg/H2sKcVGNajPMTOXRdzOEE9Gy8tHeb3T8VkK
 Mbjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741278458; x=1741883258;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ih00TRqmhmd1Mh0sl7zFiAmpBAeBPMq/8Nno4TrvKu8=;
 b=IHZtWOPnI/4YzhpCi90o+hqlWwdHC4LXM2fOtlrGQOjTgzIgPEGyi0COlqRq8JQWmI
 e7duY4W1GOKGBbUvxSdlejqiGSDnK3T/8i75KB5UCDxED2s3YebJj1dQHQ9z8bEL8yuP
 WIRIQcYKO+QA8ufSF2wphrK5Zc3LojXjRcuTwVDhNnsswOnu0rh0r0ShTUc9UFt+qJKd
 D6rYir5jeCDeA2p2ci3IEYXpu7aSh/NFQpyBw/HAO2Qhok49RszBAio6zY8wP+DjESMY
 xSm4xtgNjAvEy99xypDzGGmOstJc8yMUY4yAtOlu/W0gYb6TgxsxoeF58dmT0BdZBw5X
 +7FQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+2SXLqVQGHsFyuwA+FOIiOTlAx5ZmdZut1vWdxv6QqS52VhpCLxDv6c9YzDwvF+WnV55t7cKIKhw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyAhvyrMf7qqUi294eHexsyMFqbC58xA/AKj7d68LpFzfw1KXNU
 IE0+XYU565ZQ+NgCBrqeh5cAxLe1rVWPMDcZzbx1SPF4ZQSljnY2
X-Gm-Gg: ASbGncsqCEG/04RaMLMQN9zqeQaLhOLMBISHh0uPz8CoNbr6RhNQxbtdyjO6OZy8e/q
 8UM/W8NDZ6oPP9bCTS7i/5DAiuj3P1R7sDTeFi07Z9NT97BPBjJ9bWu5HTjesg42lGEFQvM3aGd
 J0XbKAa7wfKgpNGQHlAZyJkBR3rA+VYXQGMfXQl9f+hmHIFteiQ3br9jdDEZDVsDecG9Q0F0wP1
 FkeAV8hF7Sj51t2VGF8ltSw93fZmsj/QUehd0fg/d6B99gKtxUqpyCoub6mbIOv/rP1MP09bHG2
 ophQlTfs0EOSINZrI0uDc7MrJuJFaCjpif1IeZzpTWubcrWvpWzeea9lcKXuiBsCPiP58sXLnsI
 =
X-Google-Smtp-Source: AGHT+IHic3IzGXhBZWP6zBd/pJJw64LoRGQ/N6k6+q6inZlCxRIB1pB5KkHjt//av4DrSwa4YWD19w==
X-Received: by 2002:a17:90b:1e04:b0:2ee:a76a:830 with SMTP id
 98e67ed59e1d1-2ff49841eeamr12538794a91.24.1741278458615; 
 Thu, 06 Mar 2025 08:27:38 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2ff693e75bfsm1464298a91.33.2025.03.06.08.27.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Mar 2025 08:27:38 -0800 (PST)
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
Subject: [PATCH v3 10/16] wifi: brcm80211: Replace open-coded parity
 calculation with parity32()
Date: Fri,  7 Mar 2025 00:25:35 +0800
Message-Id: <20250306162541.2633025-11-visitorckw@gmail.com>
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
Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>
---
 .../wireless/broadcom/brcm80211/brcmsmac/dma.c   | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/dma.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/dma.c
index 80c35027787a..d1a1ecd97d42 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/dma.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/dma.c
@@ -17,6 +17,7 @@
 #include <linux/slab.h>
 #include <linux/delay.h>
 #include <linux/pci.h>
+#include <linux/bitops.h>
 #include <net/cfg80211.h>
 #include <net/mac80211.h>
 
@@ -283,21 +284,6 @@ struct dma_info {
 	bool aligndesc_4k;
 };
 
-/* Check for odd number of 1's */
-static u32 parity32(__le32 data)
-{
-	/* no swap needed for counting 1's */
-	u32 par_data = *(u32 *)&data;
-
-	par_data ^= par_data >> 16;
-	par_data ^= par_data >> 8;
-	par_data ^= par_data >> 4;
-	par_data ^= par_data >> 2;
-	par_data ^= par_data >> 1;
-
-	return par_data & 1;
-}
-
 static bool dma64_dd_parity(struct dma64desc *dd)
 {
 	return parity32(dd->addrlow ^ dd->addrhigh ^ dd->ctrl1 ^ dd->ctrl2);
-- 
2.34.1

