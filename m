Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEBF0A550B5
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 17:27:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B8AE10E95D;
	Thu,  6 Mar 2025 16:27:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Gk0kI4Yt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06D6410E9E7
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Mar 2025 16:27:09 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id
 98e67ed59e1d1-2ff615a114bso2088219a91.0
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Mar 2025 08:27:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741278428; x=1741883228; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vfkeURT+EbeVrjHOwezSCAhftS9inN7HFKHEaavRXXI=;
 b=Gk0kI4Yt62eC8TrofuHaajb2silr4N0xpTNTfhzIxODC4JkSsvUUAgwVrYO2RKpbxB
 9RAeEmaBL8CVhIFhac8fvOVLB945G/LdvtkZhKhcv2k9ohBFZElbqyDtHQWmoehorPEV
 EqhatyEInGJRVhaF2FhNix1gC5XNzvWjCqAcPLy/d9RXbPQZtw/Kj20jxIWdI5TwhYe5
 OUPqcj9UYUFMR4azoTsjvOTsdlw2cMUEsw3/hxESk5uMWdq6Qyv+Af9IIslzV472jWfK
 wjjqx6sdbWSiTW7VAqPccXQWeiVwGJo4XTkudA04IrgUe+QbrJ2cTWLi0bgM2ZQW+Nn/
 rYGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741278428; x=1741883228;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vfkeURT+EbeVrjHOwezSCAhftS9inN7HFKHEaavRXXI=;
 b=k7nE61klotpDxE4dNF1NAKtua9e8WmA/EeHsML/21WuWIETg9KktZw3n2qdWhBIQIh
 wV14GrItDBHo3N6wsKSyg1PRK6VbPBC03TiRZx2MkcsVIs1nOPk+gjrRBdAS/DA+0sJa
 47VPyuAQrw8MDH0PA9uUd1kQSHuoE93BM0heH4/Hp2U07FbL9cq2OrRLAp4z1muRL1J/
 mcG8zlzDoZMA4JU8TY+c+LzVQIlrIWtAGZGDt+QXxRKIEdliWDQ2ZSKE3Y3JdhE6x/Ng
 j7rnYEDmt6ajwo6Yhip38a7Vp3oGwz0kTyaJMwd1UvdEX/QblQ6DA/R0sjdDxDPnOFTT
 P2fg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUh7y6Lxok/aW/JHsv6qdf6sv4OpbXOn11y74AWDIsLiBbO+45/0H0y1cL3wFeTrnHTv4x5zX6Y6c0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxBLzsGDJjt9KDwwQ/fOogg2IpXYrB8wKUAwrEno2DJpP54BXm8
 v8h0/Qo59fJNPjYPKYYXcyiX9nx3NLhn4YzR2E++1kUhHoYa5s7U
X-Gm-Gg: ASbGncsGeR/QlG5qBznnp1ICRF22RkAMad6dowqnTdQhVfbu/avb2/KG+sNKvLl7krT
 /GcTii8pAINg6E7Wg3Hzt7OOC3Bhdl6bTL0Asm1bwseJp+QS5Te78yJv5hfqZbJJVOI78qwwqxh
 b5uJvkLtcadA8jHR+BU9WM0zB8bCyyi33SSHNX5mQQRFKjTy7EwW7lsKYCJphcmG/QUbAdJoZSx
 I/cc3LhvjmqeZqhSRXMyi+3H3vHMAYsckwpUrEQs2GrBjyIPcShL+Gz7wdTPJpwGowDmwK7QeuV
 1sHdPT4ljvUScQCefWw7M2iwv3i46k1HGMf/4fQjqy76X8UNIQIm5fIlAxsAIHPTPslEAMwItm4
 =
X-Google-Smtp-Source: AGHT+IGNBcefivOmpQNsVFSdkYo/uQMo0VhzohCZYprzHPevS02kDmNn83LuER8aDdhmdhff3Ulvpw==
X-Received: by 2002:a17:90b:1808:b0:2fa:17e4:b1cf with SMTP id
 98e67ed59e1d1-2ff7b59dcffmr195851a91.2.1741278428557; 
 Thu, 06 Mar 2025 08:27:08 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2ff693e75bfsm1464298a91.33.2025.03.06.08.27.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Mar 2025 08:27:08 -0800 (PST)
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
Subject: [PATCH v3 07/16] lib/bch: Replace open-coded parity calculation with
 parity32()
Date: Fri,  7 Mar 2025 00:25:32 +0800
Message-Id: <20250306162541.2633025-8-visitorckw@gmail.com>
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
---
Changes in v3:
- Change parity32(mask) to !!parity32(mask).

 lib/bch.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/lib/bch.c b/lib/bch.c
index 1c0cb07cdfeb..6c29122c0982 100644
--- a/lib/bch.c
+++ b/lib/bch.c
@@ -311,18 +311,6 @@ static inline int deg(unsigned int poly)
 	return fls(poly)-1;
 }
 
-static inline int parity(unsigned int x)
-{
-	/*
-	 * public domain code snippet, lifted from
-	 * http://www-graphics.stanford.edu/~seander/bithacks.html
-	 */
-	x ^= x >> 1;
-	x ^= x >> 2;
-	x = (x & 0x11111111U) * 0x11111111U;
-	return (x >> 28) & 1;
-}
-
 /* Galois field basic operations: multiply, divide, inverse, etc. */
 
 static inline unsigned int gf_mul(struct bch_control *bch, unsigned int a,
@@ -524,7 +512,7 @@ static int solve_linear_system(struct bch_control *bch, unsigned int *rows,
 		tmp = 0;
 		for (r = m-1; r >= 0; r--) {
 			mask = rows[r] & (tmp|1);
-			tmp |= parity(mask) << (m-r);
+			tmp |= !!parity32(mask) << (m-r);
 		}
 		sol[p] = tmp >> 1;
 	}
-- 
2.34.1

