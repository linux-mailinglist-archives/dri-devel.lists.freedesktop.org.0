Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D14F4A82ADF
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 17:44:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DC2010E146;
	Wed,  9 Apr 2025 15:44:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UMJB0xFu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 537F310E146
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Apr 2025 15:44:53 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id
 41be03b00d2f7-afc857702d1so4243003a12.3
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Apr 2025 08:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744213493; x=1744818293; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v49ZwnZIj2AOJhsRco4puem3oLXi78jqbt8BbW57LpM=;
 b=UMJB0xFuh7kJkB39DBWphQuXb3xpYDlSSnfVIL3Rbso2wxFrGB6USessQVRfPsaCNR
 KnITJa85JWm0NBw2Mdq72+bIQjMVk/n6CT/NqYUSNA28h+oez1P4I17uSvGCatGNvN0g
 mYjV2OlhMk5H6oMIwP5PbiQb/jr4NHB6TU+wIYy2OdwhTV1Ql+V44OjQA4J89ocTFVPc
 lY9fqE2LT5ajuYlz6biSPjYaFf6Cg0kZ9K8pSOpzBiDq+Na+HG63qayxBacGK8c7H1Cb
 sdxc+pSpYtmcyFdZyMSfp8+CA8Jff6CiS62sRaxOe3RMNEnE18HW/zr0pLUAWswYaDtr
 VEWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744213493; x=1744818293;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v49ZwnZIj2AOJhsRco4puem3oLXi78jqbt8BbW57LpM=;
 b=UkJOFP35mvnY/+dZdLhBJkA3ZElPOBTDwi0O7G/T7S3P8krRn7erazXOpLbtfqrd1u
 TyabWyWu0dsEYCKNWOJKHl0FiR8Bpj8oL63lmZBXe/6c4VkiEJ2vTpX2COZGyqK+gjY5
 Z2OF+R1YjzrkhNSNDPNo4Rin1rRgfsZlz7PVPUdbn6zfv5cpqqV8Cn0uOabugXPBv3Ck
 ExRkx4y7vJavX3kWLv2qx6PYqgm3N9j7HSHrB3fxWkeYJQl7C+iWCj4hghqSBoZrZXAQ
 OVtm2xHaSOj09334423lwrVW+6drDx94Af63b3uc1SaUHeGVQ8L8bxovtiRU2CSMeWvO
 cD/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUh8AXxNR70NMRLeLAj4/h2wGhGlul7IyLJOzajKkPP1+4v7BPPbmVa68R4JzdUmBkhy9Wp6+uYXgU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxVdvkYddMtyLpA37SmRNJAq0LwvEEBvcQrjldiRb0FyHsbc9En
 mkN8gl+UVl3+1kkRvWIOE7B3wE76ou2Qwr/GJ0QH9r+K8wrvuzZz
X-Gm-Gg: ASbGnctxJh1Ehugv6XDBgUT6cib7OURls0vG6uYTC13A0Q7fOKVAwp62CNy5GPcBMVD
 m6mYn2d0DPERc96PBxcjshH6mHoJB+64IlOpfYi9h1eH3A9cJINyWyDijgRcoZjr8UYzBK4IMEA
 TKV7VYMhh2o+ILnYRGoKWLnFXJbfvrLdMp+pOjg5KoPWDvmDvDuNt23Mo6mu27s/oxCQhnw/gsA
 CVhAzVuCxEQWF6KvSUUERUNG8jTxPZrwWkz6ZjKhcCFMu4noZiLdBp0ZUhyGN4FF7BnK6aILj5/
 X2z6SVfGjyQDz38dnUuyCaMft4nttsSLWjaqiD+0iBGJn25sSCUAWtfEAdzIZu9TqwmkczkWyla
 uSJGQfA==
X-Google-Smtp-Source: AGHT+IHDjC6NZDKGKeJbiK4hibwKJCoZJOXppnGBHSYZ9kKUia5ispG3D8M0PIfVIJ8M4eMwylwt9g==
X-Received: by 2002:a17:90b:1f8f:b0:305:2d28:c8fd with SMTP id
 98e67ed59e1d1-306dbc2bf43mr5380309a91.24.1744213492550; 
 Wed, 09 Apr 2025 08:44:52 -0700 (PDT)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-306dd171991sm1952304a91.37.2025.04.09.08.44.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Apr 2025 08:44:52 -0700 (PDT)
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
Subject: [PATCH v4 02/13] media: media/test_drivers: Replace open-coded parity
 calculation with parity_odd()
Date: Wed,  9 Apr 2025 23:43:45 +0800
Message-Id: <20250409154356.423512-3-visitorckw@gmail.com>
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
 drivers/media/test-drivers/vivid/vivid-vbi-gen.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/media/test-drivers/vivid/vivid-vbi-gen.c b/drivers/media/test-drivers/vivid/vivid-vbi-gen.c
index 70a4024d461e..5e1b7b1742e4 100644
--- a/drivers/media/test-drivers/vivid/vivid-vbi-gen.c
+++ b/drivers/media/test-drivers/vivid/vivid-vbi-gen.c
@@ -5,6 +5,7 @@
  * Copyright 2014 Cisco Systems, Inc. and/or its affiliates. All rights reserved.
  */
 
+#include <linux/bitops.h>
 #include <linux/errno.h>
 #include <linux/kernel.h>
 #include <linux/ktime.h>
@@ -165,12 +166,7 @@ static const u8 vivid_cc_sequence2[30] = {
 
 static u8 calc_parity(u8 val)
 {
-	unsigned i;
-	unsigned tot = 0;
-
-	for (i = 0; i < 7; i++)
-		tot += (val & (1 << i)) ? 1 : 0;
-	return val | ((tot & 1) ? 0 : 0x80);
+	return val | (parity_odd(val) ? 0 : 0x80);
 }
 
 static void vivid_vbi_gen_set_time_of_day(u8 *packet)
-- 
2.34.1

