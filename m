Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7BFCA550B0
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 17:27:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EB1510E9F0;
	Thu,  6 Mar 2025 16:27:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="at0z524C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA61610E9F0
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Mar 2025 16:26:58 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id
 98e67ed59e1d1-2feb91a2492so1694387a91.2
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Mar 2025 08:26:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741278418; x=1741883218; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OLC46Ss2m89bTVvfLJi0Yp7p5tSaqeo4vrmp4oYzA88=;
 b=at0z524CbpK0qNvhjzSb/j7amq58IblLh0k9P43C+PkoT4EpC+e/hwBXZHVDDq10Dv
 pH84ulLk3QSXQfqnUYXU/Bdyfa7EZox3D3uQh/fd/s/d3CW2AxJUNuOYyGRIWbWskSt5
 yPdV18ewOVnndRkISASvUcpGPLiepCX0kcfGtFOCzjA9mf/cKKxOeFcmxItD2vg1C5QI
 0pOz6pwceEKVQeS7NQzQG1mb4hlJGLAdrEnyB2Hl3u82uojLwusWFTjDRGVqGDUuQaah
 pLcdScKOw6ozhryeK0dwOPaOtdJMI8Xkc7i+nb8yT4yA0JRbnkQqsQnbeFQvHX21JnnH
 av8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741278418; x=1741883218;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OLC46Ss2m89bTVvfLJi0Yp7p5tSaqeo4vrmp4oYzA88=;
 b=U1Rq7iT+bYAja6Tof9AJVw35TYaWb8JC4TOWQ175eXfBbCbSmPQOwVk7xOWOsgx2uq
 ErOlZi4j3BGGO1jCG5Y8oABoMfcjZBvDYAlEJC6OHV73bd3xhNjAF6tgmSXrXuJ+U11I
 rjOp7uRXAQ0/9nFn4zNg9kOKw/mMszFFhaJM0AtCnGIiZyk3BAmx5P7q5t/BPOnTXZIy
 mWfKu07tp5s63etw3/hc6IfBY6uijK2mbRVMW2ejIz2IbLAVkYi5i1sOJKXEzeMpP1C6
 hr2JYyJMQJNSxEDWBEg7YWOC8UBB0vSsMl3Z92zu3QroPTF69AM9iY0oTV/CoUNRuRR0
 7TYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2R8ZqoykIYcBKRWHGxA2AR3gdW2+ThKnhUzGfC3oTln5WAfNlT85qODxUxWbyehUkwjNX/I361g0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzhcSWeE9j7L8bpwtM7/77Ge/Q5HUlCmKDeKosAjJqUl+1rwNay
 4ARMdQx/7I4Zg3Q9B+ohS5gohCOATlMHOgFT6V2kuv4uVIfed3Bb
X-Gm-Gg: ASbGnctRhphJTmPGG8eUUDShdkunnLYWlcca3F/+7AJls5stGlxt90dlHl05vRa1wE8
 iIsD0DAGTDB/2jQkJHRMsBHhf+1CwPFgo/GW4SoZ3SKUp40OKKdpXmYtGsIv0eMRdmVbBv/1NPb
 R3eZ0/R5iWY3iytr9Y9eTMxVe0UmVNffo4BPPzdBaRimK2eNE+1BdWpQ6BZXIDQ3+S2obQrPlwy
 ApLbSeht+TuTuXXJfDp39LjtN339yTzAJ0jVz5X5/hV0EPr6BgyIhxGaeNz0CZ4pw2ilOGKWCRE
 vEYPRMaQB1rTEZaBU9eWmVJicBlLS6UcaiHxlWrlkeJ1paR+GJyeQt+tITga9b7J1WWMWNE0qyM
 =
X-Google-Smtp-Source: AGHT+IG03DCzCpNpvI11hw07lC+sk1Ut5naphaEWX0iSJy+1ysJZeXoZKrfH0dsPOSnHxsIbzbSOpg==
X-Received: by 2002:a17:90b:3c87:b0:2fa:15ab:4df5 with SMTP id
 98e67ed59e1d1-2ff497ccd9emr10053018a91.34.1741278418239; 
 Thu, 06 Mar 2025 08:26:58 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2ff693e75bfsm1464298a91.33.2025.03.06.08.26.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Mar 2025 08:26:57 -0800 (PST)
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
Subject: [PATCH v3 06/16] serial: max3100: Replace open-coded parity
 calculation with parity8()
Date: Fri,  7 Mar 2025 00:25:31 +0800
Message-Id: <20250306162541.2633025-7-visitorckw@gmail.com>
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
Changes in v3:
- Change parity8(c) to !!parity8(c).

 drivers/tty/serial/max3100.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/max3100.c b/drivers/tty/serial/max3100.c
index cde5f1c86353..419d74043498 100644
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
+	parity = parity ^ !!parity8(c);
 	return parity;
 }
 
-- 
2.34.1

