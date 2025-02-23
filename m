Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D43A40FED
	for <lists+dri-devel@lfdr.de>; Sun, 23 Feb 2025 17:46:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FE2710E09E;
	Sun, 23 Feb 2025 16:45:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Uhpv28+7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8849610E09E
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Feb 2025 16:45:58 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id
 98e67ed59e1d1-2fa48404207so7516116a91.1
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Feb 2025 08:45:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740329158; x=1740933958; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nzBrmzWckDIJwY51QBb0mQJ5Dqo6Ldx+jMH0V0Ck8/w=;
 b=Uhpv28+7t4cQOaqRfEer2hW2ItYDkHd592wG0vYIFngBHpF+oWJhdxeit7KKqDQY20
 imS5Yd0HtJ/+ptr1d6LSNlhMAruqHTS6G20Zyq5Fjr5E2AOqOHxw8Fo8L/wb+aqveqtF
 NRzc6gDXy2Dh/ILWsGHTCnCX3Ts0UDahOfgl6yo3IAvP52zV/e74tB4Zbaumov7wDmNL
 9lRrCdXDS4yAKgkv056u4Qhrttp1KuuQTeoeIrNltS9O05moCkVkBrjSfsVM/MmAhYlV
 dY1PL1HZO1qP9JCqclI4b8vsdc3INfKRW9hiZQUEBIYDXsuIOjap6trqpH655fJhVyQJ
 udgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740329158; x=1740933958;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nzBrmzWckDIJwY51QBb0mQJ5Dqo6Ldx+jMH0V0Ck8/w=;
 b=N6m2R8bs5QBfIbjyrJzo+3vyESLGZ4MvstRJitZ2NHAi73rTY7FmrCQF8EzMU4iO7w
 getmNbGryU3Th4YYnGUKsLLG01L4OJQsm1xTajZ2TZi8hA50/tyzDXTalpbJO/bGBukM
 jrKGTQRjuGf/TADmepQsVYnX1ubofatPeKP32wizb1m2pEIm7zaQhVaTRBYsKxO7edop
 E0fBbhLp7/5dNnRAa4xip9aDZiuDvU3FDI+JmvO/aozEN00W4j6zhxuSxuPAag/xotpx
 CRTs6vT9VYWeqnuUCmqt8DhiaeLCqslFwb1xpXJ3g+jYYdSwIuf7qOx3MPLm+MkAcdpV
 77vQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWDNZVUVCshdss8t+4WbW5rssd0Jn+8i4H0TBu69IKDoqMNAeUueDkNyO6AJu1CsE0TvpKNrJbp0Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz9T08uIxbqtacBgYdYeJ8V915fpcGfzgpgPKlM3WVjkyp/MYjP
 8lTpg6w2DxfM6+FYTsV3KbUcyr0R73ht4k6Aee72SkL6JLd/bg5z
X-Gm-Gg: ASbGncu+cdCjn2hAJYLj18hv+3opKqUR91ffIOoqZ1coMsQo/dPNOF6Kl3S3HRXDBXM
 lLfhEhCQmmNpkcj1RdLx9+lnZ88BDpCH9vsXAxWGi+vqJQJwdd5e1akrAH2X0V09BaBwzBZTZqi
 wSi+mD6x2srKz+5fEqOfigxbxEo3TGerkz6a9xazzkv5ZCRK2F1hWX68FdCXuGxwR6zRJf1mdq6
 wNGRKbrF9KfNUwtwuqo4/ljug7Sny7T+6X+n8EtkqMFXFnEFv+Wy6ZDMWOW4/Bi36GfhW5Zqm8X
 DXPqt8XRUI28V9MMVPhIh7CbLx81aILd1spiFKoXSZekGZuQJjwWBGhV
X-Google-Smtp-Source: AGHT+IF16AG7QV3yDJH/B6gDeFm18hoNJMWrJMQH/o1eQGkDQfNTajRN2mVaQtR8BSlGLJjsCZspog==
X-Received: by 2002:a17:90b:2e44:b0:2f5:63a:44f9 with SMTP id
 98e67ed59e1d1-2fce7b0acaamr15082851a91.23.1740329158110; 
 Sun, 23 Feb 2025 08:45:58 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2fceb09f6e0sm4935080a91.44.2025.02.23.08.45.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Feb 2025 08:45:57 -0800 (PST)
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
Subject: [PATCH 17/17] nfp: bpf: Replace open-coded parity calculation with
 parity64()
Date: Mon, 24 Feb 2025 00:42:17 +0800
Message-Id: <20250223164217.2139331-18-visitorckw@gmail.com>
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

Refactor parity calculations to use the standard parity64() helper.
This change eliminates redundant implementations and improves code
efficiency.

Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 drivers/net/ethernet/netronome/nfp/nfp_asm.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/netronome/nfp/nfp_asm.c b/drivers/net/ethernet/netronome/nfp/nfp_asm.c
index 154399c5453f..3646f84a6e8c 100644
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
+		ecc |= parity64(nfp_ustore_ecc_polynomials[i] & insn) << i;
 
 	return insn | (u64)ecc << NFP_USTORE_OP_BITS;
 }
-- 
2.34.1

