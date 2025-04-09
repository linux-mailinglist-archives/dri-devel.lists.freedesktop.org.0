Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2D6A82AEA
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 17:45:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B703A10E236;
	Wed,  9 Apr 2025 15:45:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SIdJqW8f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9306210E236
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Apr 2025 15:45:44 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id
 98e67ed59e1d1-3014ae35534so5779452a91.0
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Apr 2025 08:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744213544; x=1744818344; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sTd+jcAteb5XQtuvZoTF72DclP9q3bsZAYfMztua9WA=;
 b=SIdJqW8fGR3zzeMr8sB+aaX9UcEPscqkfKWobAgaSt/JqcuwC4vocAMi3DZqXQd4qw
 vf2zvFGW4dw0ntvugOldDfu4RHTZXN0Lp6sQ814GwaJfTpegU6187dNspinQYB47OjoZ
 AdkutouyqPcCq0tw3JVTVcynmR5u1m/O73Uquk7u/ISyL7TdW2+rxSHNRDyO9D6oBvhn
 nyJNi8QVDl7vZBX3F6W6mBmK+6FBDbfWCctCTgW7Rh3FxQ7Jji06ob+1mBbQCaz3K5s8
 akqZUqtJMrGEhSgojkIt0Gs0VsWJDLMuMgtOuvQYvy9Vt7FnoaLeEREVfUYcYfDlMf4Z
 k0wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744213544; x=1744818344;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sTd+jcAteb5XQtuvZoTF72DclP9q3bsZAYfMztua9WA=;
 b=Wl2SKgAAzrF79eq8OMJEmRT0XYrNoo4qQc3fKYvS03s+vzIhtKfDEjJ3BWLZxtaHNW
 dALB9QX9GNrGVkHV3AREnydOK5y6yP1fUgytagXL9zYT55af06H/PZV5Kqunyg6vgxrF
 6TrHJAIRTnbKAMgeqDerF+2QuyuhZr8AmX8/+pbwjKEzUZYMncykrEYE3yneXaQMaiMq
 nTlh7rA3o0gByP2FJ6ubimOgSLFii1OD4x5VjFat0btnaUWsFJHUQSwOzpXdZz1XDarU
 Zb02dlcvRsRqSiBO8/PVv7/SAVQw2ObORFQo0NObcsQe/odJKv5OJKXP0btgVu1tv6o+
 VfEg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXwjZijMBZXfP9kFpVzcjNV/HT/bOCPt/BUxP8JfhTFp4sjIIZ9TnoeWGAQmtzKFYfLkN1JI1LD3Sw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzHkzR2aNOSSsFZpBQEwDOOPpKEMrDgK9P/zGdfgwVZsYO6PXKS
 jQYGKR90g7Ssd1iXuTnap8NIc9Aig7P4GaMm57szZ9/nfoMcDz9x
X-Gm-Gg: ASbGncsKjaRxCK5OVEh9/zpo9u9A9d0apbm1ALBE07TEDMGGn7Y9k5y6lon5aPfTJRs
 XjjqP4mRjRCjFdwe4yQ4q7CdnOmHpaye25TeXrT7eKis7B2cYrX0wH+XT3SVhgEN2DNmSZJjJoS
 F+gdjusb0+TNSNhfC2e6RHD5brj/5t8uLyX6FZCcomoQE/ybAK7s60vZnIdOJZbmb2b/GLDd+0W
 Vaq4qb7BimWC7su32DiyP2wCaNUrxyz1giQ44ikt84oPk/HHEDrJYw47JDpt1wxcmH2s+OH6ukV
 eG1pHzSCJpR8DL7o8wI8gRYWOeg2yPNUwi99+pguXf3TJ2ixmicI/ZbxJo+d5k4vV3Z2vy4=
X-Google-Smtp-Source: AGHT+IEJ7Jl6M7/jx+b0QfG2QtnETYXioK/EteWOwSUQmw7SIb5H5CEFmuEhS1eLp2rAJpsPWE7AMg==
X-Received: by 2002:a17:90b:3d09:b0:2ff:6fc3:79c4 with SMTP id
 98e67ed59e1d1-306dd56b507mr3990247a91.27.1744213544132; 
 Wed, 09 Apr 2025 08:45:44 -0700 (PDT)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-306dd171991sm1952304a91.37.2025.04.09.08.45.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Apr 2025 08:45:43 -0700 (PDT)
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
Subject: [PATCH v4 06/13] lib/bch: Replace open-coded parity calculation with
 parity_odd()
Date: Wed,  9 Apr 2025 23:43:49 +0800
Message-Id: <20250409154356.423512-7-visitorckw@gmail.com>
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
 lib/bch.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/lib/bch.c b/lib/bch.c
index 1c0cb07cdfeb..3f14d69f373e 100644
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
+			tmp |= parity_odd(mask) << (m-r);
 		}
 		sol[p] = tmp >> 1;
 	}
-- 
2.34.1

