Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5857A42101
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 14:41:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA58910E3D3;
	Mon, 24 Feb 2025 13:41:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="R6cBwMKM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0B7310E055
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Feb 2025 16:43:23 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id
 98e67ed59e1d1-2fce3b01efcso4287221a91.3
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Feb 2025 08:43:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740329003; x=1740933803; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tmrxQyU7jDRE4tATauCMPx/rjxqRJrbj6hI/X9rAOQs=;
 b=R6cBwMKMRkaoL/155d/kFgiU3E1960slQogGSOgARkzHzvDrKk9Ztu8qn4yJgNknJZ
 wIS/e1aTvGSAgwaqbf3UzXNjOAsZme1hbE02d41mixzjXxbYeAD5IA1khijOfkfjcQtt
 8M0uC4MNLgCZC+tt/hKYYzZ0/Z7pm+3IpT5s0xK3vliKGpvsgiSSmJK7BqT//cQ0lIGO
 E0hVeax1FbgAvMI91wYq13SsI8XGp38ee+dzezdPsmHtJCfcyXWH0XQ4gLXkYtv+dRoV
 XDXRfNohGFvVGi6EWb1NCK4QCqkQToLJ3WvQEr/ib299a/6CqShQ95qas0/Vt4O5+s90
 ei+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740329003; x=1740933803;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tmrxQyU7jDRE4tATauCMPx/rjxqRJrbj6hI/X9rAOQs=;
 b=mLbHZ7rT7EPC6atGcbj3l7C/6TaWLO/nczlXVSUKaHOJ5/aVSpkCA2XqZ7w4GssBpT
 dA5Lwu0UcrlNznn3j8WZwCxdBnKW+mfMpWlS0VaMOq/E37/PLmzPxZVQha2xX85Q3ee6
 dFeUq5mJcZvEYXWqcZ1p9liLfyktOuJN2f44q5j19VADMElI1MiTBoBK5u/N8/WdcBfH
 sBVkc3Y1W8ibVbzHSmsgnmvXFvuPeM/SwtXUG5FZaTlR7Rup0wh29B5Gp9FIB8vgW+a0
 Fjg5tWYrHO6bThdOwWNDgW8jQLvJbKVc5QvbaIFWQLO275vLuptWI1A8/QZlGqltC0kk
 c5WA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQK9lG3kBHfOQUAI9wIbQtrT61hGWy8pGucCJrucnUcJ+1rgIrr9huNY/w1+O33kUQA116va43Ac0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzb3gBhQVT3s9z8caaGkT8+3WcXkXVTEiKF3l/MAJnEcq1EVT3U
 TbGSJtpT5PI9yI6AXq8vP98T1DjAD+0xi7I+sYhtIXlx4VN5fTC7
X-Gm-Gg: ASbGncuxObEdQpGTGqndpYSPp8Y0b8puEtdx3XuzhZWZfrxcchR1ZNNxMpYlQXhfjui
 ZGliDG7cP/ztUgRyan17gspALkzsj4WAPk7sOIXZ9E+0BMiUu5BoYiqzXANCcRZq4UnIV/x+LNT
 KovCN7k7mv6MAol5+ALI67GaD+WtDRQIEHnsEvjJsWmFCiwm8nh6YUETT3KOUA8uOloBjJJPzKr
 FomyzNj7qZCSoE/8eK2l+y9GZ/nAZ5/fqoAabBHc/yQD7CdSytGC4vhKqYKC3PiBM3QhC9M9m4P
 RAvXFQhKPcwPanwKDXgogWR3TLM16IyQgZVdaofPiyTjOR9JcqeZjo3i
X-Google-Smtp-Source: AGHT+IFT1Vzkj4StFehOYZfGx3Pqek+1r8/xkOZDF3lpptIfx6ywtn9p4F3sEZEqv+n3pwXv0Ec0Og==
X-Received: by 2002:a17:90b:5488:b0:2ee:ee5e:42fb with SMTP id
 98e67ed59e1d1-2fce789bbb5mr17312586a91.13.1740329003448; 
 Sun, 23 Feb 2025 08:43:23 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2fceb09f6e0sm4935080a91.44.2025.02.23.08.43.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Feb 2025 08:43:22 -0800 (PST)
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
Subject: [PATCH 03/17] x86: Replace open-coded parity calculation with
 parity8()
Date: Mon, 24 Feb 2025 00:42:03 +0800
Message-Id: <20250223164217.2139331-4-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250223164217.2139331-1-visitorckw@gmail.com>
References: <20250223164217.2139331-1-visitorckw@gmail.com>
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
 arch/x86/kernel/bootflag.c | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/arch/x86/kernel/bootflag.c b/arch/x86/kernel/bootflag.c
index 3fed7ae58b60..314ff0e84900 100644
--- a/arch/x86/kernel/bootflag.c
+++ b/arch/x86/kernel/bootflag.c
@@ -8,6 +8,7 @@
 #include <linux/string.h>
 #include <linux/spinlock.h>
 #include <linux/acpi.h>
+#include <linux/bitops.h>
 #include <asm/io.h>
 
 #include <linux/mc146818rtc.h>
@@ -20,26 +21,13 @@
 
 int sbf_port __initdata = -1;	/* set via acpi_boot_init() */
 
-static int __init parity(u8 v)
-{
-	int x = 0;
-	int i;
-
-	for (i = 0; i < 8; i++) {
-		x ^= (v & 1);
-		v >>= 1;
-	}
-
-	return x;
-}
-
 static void __init sbf_write(u8 v)
 {
 	unsigned long flags;
 
 	if (sbf_port != -1) {
 		v &= ~SBF_PARITY;
-		if (!parity(v))
+		if (!parity8(v))
 			v |= SBF_PARITY;
 
 		printk(KERN_INFO "Simple Boot Flag at 0x%x set to 0x%x\n",
@@ -70,7 +58,7 @@ static int __init sbf_value_valid(u8 v)
 {
 	if (v & SBF_RESERVED)		/* Reserved bits */
 		return 0;
-	if (!parity(v))
+	if (!parity8(v))
 		return 0;
 
 	return 1;
-- 
2.34.1

