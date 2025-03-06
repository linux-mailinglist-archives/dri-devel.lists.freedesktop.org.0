Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EED68A550D1
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 17:28:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22B1410E9F4;
	Thu,  6 Mar 2025 16:28:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TNvQowNL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4343810E9F4
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Mar 2025 16:28:37 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id
 98e67ed59e1d1-2fec13a4067so1485872a91.2
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Mar 2025 08:28:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741278517; x=1741883317; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AlCo47pw1I/mq/I7vHIVVBFEFMdGZP7EQcov25MLW34=;
 b=TNvQowNLS9yWqLMOpgL+5Yssf7rRhQ2yKjicIKwTU9pn9g2qSMp3+EFYF6xnfpVsBe
 2JdptVYq9Lshy+fTvUB/Yfm1u/Wn/z/xmWdw1xC9MexpZGXoFHR8uGkhGjqMp3I4oJDH
 uiFvR3LN1Z2O3PJKjfmvSR0+T3mjtKSBGsZFGnsqjOHwwuHiY24bbmh20r7l+RTl7xYE
 +QtwJCpDURy/gF2D6GSd8JUadW08hctddThMH1YL0zzUaQCw6wVFXSq9r5ngNNBEubIl
 xOnsaaiRElFqIb/ItXY8YCj3nfYm7BJM1RsXNx9QUbt9zNRlD/zaF0m8vMIAk5Z8EYLy
 EBTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741278517; x=1741883317;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AlCo47pw1I/mq/I7vHIVVBFEFMdGZP7EQcov25MLW34=;
 b=hL3NptBm6riNWGA23tlOT0TDK7vB3he0P0JMSZAg84oEc2YbB81ePi7/XOIEFHrHW4
 iyjJYKBRm+uzdoWM5sPF9eoOB7RwOOT8HdpBrJ89DTzQa/rX9+w+PewIE4N9IdR9o4ZX
 FNsuiUymETQ7JbBPwWFPxsTJi1yLqfjAiWISg/j7a88yWnWxGxg48/AOhHDy9nwJ4k+e
 m8q7yKlDr2XslHutSf/gClOV9Aroxuo6qaAuDatomAwWncCZ6i7lu2AL8Z3ntAYl0d9C
 UWmR9B9O5+cGZe1bV6jgP+ePKyqBOFTVdGoyM7HKs5vpVkCsno/dJ5DK31EFk8vv10Lp
 A+Zw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUKQNR66HhARN6+/c6OqszxaPhlKs83uZu0stv5Td1BkWCqDM7yzo2qO5ah4eGOgpwcC9VCLrq+Yo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx5WEeVJ4BBYfkOXliro0YiOZFyPSMnczv7475TPN+Z5PIQpzTK
 GE2T0G9DJedq+a12cZkxWbj3ZBPpHGe7yjITLxNEquQsxHwIYDFh
X-Gm-Gg: ASbGncvBax6pnoO2uenvKyhpFpHmWAueclVDI7dVyS7vGEe6fcAJGKxobHf8hidevwa
 Ctom15pyXEyC5nVY/n7fc/e+19FlWokbRzVgqfiQNEVKOrRtU/JGvgUhn8a4GBhxP94ikg9SqRf
 crestB2PkKw42SO7FzAh4XpCpGwXJLRjAeT1npK9BXivan6LlS815X95MoSi9noZBfPmSvQyE6y
 PNqvhU55gJ+U8k8PgWaqJt2AeRMJiL1zJ636HLesLznqW69Rzi6IY7cp5KjZT3ubXHK4hCoPqFS
 Vbts6lfF2nDGTZoRHpUBmGaifDJkf8VFeE7ubQOamvwXhpnDZo4fzHf2Q9Lendk5hg1X2UyarOA
 =
X-Google-Smtp-Source: AGHT+IEEoNncBZARV2kGM5Yy+T23A5PpEPT2NiyzW+biIXJ8M18fImFLR3KC2etUuhFwV9KdupSQZw==
X-Received: by 2002:a17:90b:1f88:b0:2fe:68a5:d84b with SMTP id
 98e67ed59e1d1-2ff49716658mr11420319a91.1.1741278516777; 
 Thu, 06 Mar 2025 08:28:36 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2ff693e75bfsm1464298a91.33.2025.03.06.08.28.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Mar 2025 08:28:36 -0800 (PST)
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
Subject: [PATCH v3 16/16] nfp: bpf: Replace open-coded parity calculation with
 parity64()
Date: Fri,  7 Mar 2025 00:25:41 +0800
Message-Id: <20250306162541.2633025-17-visitorckw@gmail.com>
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

Refactor parity calculations to use the standard parity64() helper.
This change eliminates redundant implementations and improves code
efficiency.

Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
Changes in v3:
- Change parity64() to !!parity64().

 drivers/net/ethernet/netronome/nfp/nfp_asm.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/netronome/nfp/nfp_asm.c b/drivers/net/ethernet/netronome/nfp/nfp_asm.c
index 154399c5453f..14306f128497 100644
--- a/drivers/net/ethernet/netronome/nfp/nfp_asm.c
+++ b/drivers/net/ethernet/netronome/nfp/nfp_asm.c
@@ -295,11 +295,6 @@ static const u64 nfp_ustore_ecc_polynomials[NFP_USTORE_ECC_POLY_WORDS] = {
 	0x0daf69a46910ULL,
 };
 
-static bool parity(u64 value)
-{
-	return hweight64(value) & 1;
-}
-
 int nfp_ustore_check_valid_no_ecc(u64 insn)
 {
 	if (insn & ~GENMASK_ULL(NFP_USTORE_OP_BITS, 0))
@@ -314,7 +309,7 @@ u64 nfp_ustore_calc_ecc_insn(u64 insn)
 	int i;
 
 	for (i = 0; i < NFP_USTORE_ECC_POLY_WORDS; i++)
-		ecc |= parity(nfp_ustore_ecc_polynomials[i] & insn) << i;
+		ecc |= !!parity64(nfp_ustore_ecc_polynomials[i] & insn) << i;
 
 	return insn | (u64)ecc << NFP_USTORE_OP_BITS;
 }
-- 
2.34.1

