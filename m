Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF28A4ABBA
	for <lists+dri-devel@lfdr.de>; Sat,  1 Mar 2025 15:26:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63EA410E210;
	Sat,  1 Mar 2025 14:25:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZVQ1sQCX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3FBB10E210
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Mar 2025 14:25:57 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-22337bc9ac3so59623705ad.1
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Mar 2025 06:25:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740839157; x=1741443957; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Nutb7MJ9eZ82YUrFszN8Vow0UKyoKuoqD2og5G/xi8M=;
 b=ZVQ1sQCXB0DEzhC2ncF6X3q9EOV7JaLdl6OwauqLAMjqlVaN2W86B8rMvyq3JFV6uY
 u5RuKm/8op8GwiQWmgx05nzFd7JCPAyZFeZMyWTnwUCOmtaIFYzW5XdB9icqAFo3xaWN
 IAJGsGpTGsQp6F+OElmNC5VNE0KMuIjyonRyHlZVzfHAg3HSk+UHoUGAbeQZRAMR6mmU
 0cYQq2+B1J3ui2Ka1WcYbVCI6bU8WVj3x0jtpNTCgxd7Spk6jRbzfs40DqPlLhh5j5Xc
 W1F6euIJl8NkVkBeku/tNiEYoyLK0lgSqVXajmX0D1tZ9s4ILK3h4m1zhbc6OxL5QrkD
 bxcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740839157; x=1741443957;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Nutb7MJ9eZ82YUrFszN8Vow0UKyoKuoqD2og5G/xi8M=;
 b=dSiolBNeBrdGk4LJZezKuq2miS7kBQMNoMYQ9SOl7PctSZ4++t1E3PyCSu+TjW8h3v
 nKJajgBHbdPL3QHWAa2tVJEfTy7joXZfE34QR/oHPpV1ThpQ/OkUPRfvQ0UY1NBMjujZ
 vpsJYxMAD8fzpnWV76iIC+qQKfU1LTvcNQfCsz2hCPzsYxhrfN8TNNVLetd2YBrE2b1v
 eZ1eGcivzsYmcns7e70YVp3LVUGMuPZX+yp8OolB+OeXPMWgKLBaT+glASY2aBw0hKEj
 qedkxMExvtsqHnHsaO9XodLQI/qia85M2DXAg334SJOhRWj9HTZWb+1NzyhjcsaDFbQr
 BSqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX02l/DllcM+APHFzUC2Bnf10O/2wX5CkHIfU0gBUstGm3c4Ir/7RgIdowy/wA6smlSx6iBf338wf0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxVpuCOiPIF/WcRqm4woK4BiIFEdrECTcEa/BsYygKUGfmKJbXm
 3T5vSAqgrg31HASMpqi07aNlc1/SIKF7Xe4QDPklKOvHTJhmRlkN
X-Gm-Gg: ASbGnctkZgFxIbnuBUMJtkDcFDBR0kppab/rkeYTp5fVOGhOoSk4968i9+Om/C/LuWI
 Tikyo8sK26oxhz0X5qPOxsFD52hteNDcNu1TfqO/tB+xKHreB0gTI4bTEr01XSUxvLYWTALEn9J
 bfMuTmeQo9iv4sESsMkMEESBFKE370+qyJXgw5PqXoyA6Tn4ikAjBZWhQJiqOyuaiGUZxdnTb39
 IygaNxq5hSYrNp4D3U2YnbYUVq6j3cslvMjoV5RFijmcEneELCIygTxE/PjOAt+kMPl8z2rDItE
 MqmyzNg5DQLZBgaMZkwQZndoJU/+ndgjXRyc/XcjTprpeat4BPoMWB7BLXWawV6bumpmniM3/dY
 =
X-Google-Smtp-Source: AGHT+IGPradnOrYoMR1IanWjYjFo3KQDnHNjL2IS+TgfZGmLy7jDODNM73AvbKhXyZC7rWPMMIa78g==
X-Received: by 2002:a17:902:d507:b0:220:c4e8:3b9f with SMTP id
 d9443c01a7336-22368bc6ae3mr104323495ad.0.1740839157468; 
 Sat, 01 Mar 2025 06:25:57 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-223501fa8f1sm49231965ad.90.2025.03.01.06.25.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Mar 2025 06:25:56 -0800 (PST)
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
Subject: [PATCH v2 04/18] media: media/test_drivers: Replace open-coded parity
 calculation with parity8()
Date: Sat,  1 Mar 2025 22:23:55 +0800
Message-Id: <20250301142409.2513835-5-visitorckw@gmail.com>
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
 drivers/media/test-drivers/vivid/vivid-vbi-gen.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/media/test-drivers/vivid/vivid-vbi-gen.c b/drivers/media/test-drivers/vivid/vivid-vbi-gen.c
index 70a4024d461e..e0f4151bda18 100644
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
+	return val | (parity8(val) ? 0 : 0x80);
 }
 
 static void vivid_vbi_gen_set_time_of_day(u8 *packet)
-- 
2.34.1

