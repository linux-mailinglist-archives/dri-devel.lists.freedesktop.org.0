Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D5EA82AFB
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 17:47:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B79010E2E5;
	Wed,  9 Apr 2025 15:47:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MGB4ecrY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 691F210E698
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Apr 2025 15:47:06 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-2264aefc45dso90325305ad.0
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Apr 2025 08:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744213626; x=1744818426; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sCEd/+juUKZOFlQ/4SCoGPbjU2jFBlmcZeDTBbgWCik=;
 b=MGB4ecrYXIieBe863q5DTRQw3ZOq+5q7EkFeWB66GWrzwFmL9KVb4duicE4QiPKPmg
 NYCY6RfLygc2yl4kt6XeOZtuY8DCuuOY/CI/WVi2/i6qzsLigpiVCdCEfjLsZrXeid6l
 zga5x7vLNZsagw4iv+mytYrmoR0+JKt6SIkV52sT3/kxngWskucfzsTkIxmh0ur1xRFl
 tE6rTOI6/4jntlcgll6zzLbgFQ11rKiwkNnPuYib11ChAl0rPTumPj2XAHnjvmq76z8h
 Wv8Q4p9RMjrvpjAWJFpSpqOPGB2tW4tyb9aGY8v6LEUjDXTHn/BdcB90vIv8c2o20M3D
 UmNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744213626; x=1744818426;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sCEd/+juUKZOFlQ/4SCoGPbjU2jFBlmcZeDTBbgWCik=;
 b=tu2/2uNP7/t7cpC0dxebYu169O5tOBzZ7iM1mhLn66lAvJeCrqe9D+Yh/f7/DQD0oz
 9e50Ii3iBgtnqTUt4sxr3Qx1LxQxwUIcK+H/p+HdRxrAWs2CrPSBwceunMbfpBQ6TNke
 A3hvu20YAP02+1BbD/xPPMQh8duNibjg67+E9ZkCMXT0/deEo0Ia2HTAxV8phzz8LIpw
 O5ey74JlMKqGGoSNtHA3SWBJ5mBc2YqI1r+4fmpkPeDsQUBX9xAMO1/aS67kKTqZTHPB
 x94VHQGnS4vPOkcdbMxFkqT/E8r9GS5V9CEA/tTUoCZh/vXXeaRhF4reKnqWSmtQRjrr
 /Fig==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6WNna1ur/WvxE1x/uK6nr0uKtR5gMupjAZdJV9oR34kI+LJYzeh+YBHCcioteDyGX9BA181S69I0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyNSFYHt2GOOvfqWRKciP0Z47uBplVzRRfFFLGjS71uy9x7ClON
 ldc+YbX3CfyXTDXCcVB2OGJdKRpQOuPJqFAxLHOykhmLIHiKRe87MpXQYQ==
X-Gm-Gg: ASbGnct8X8RR5dTXV5kG7+CAxi9uIBrUf1LiT8SD7N13+aHD8NYRUfNbct8p8PmPb2/
 P81gvNryQVMveULYBGCyNywvndlle9gM8DMdUIGhaOg7zYwxwhUQGLOY3Bb3k27M3xr/rVToYyu
 2eJD7Scz2PpI/8lC5JlcJncoveiLhyV3VkLeFocPuG33VmVOOreKCpFiXgiIYAqk7YCTOLNmAsZ
 oy8nsHDKEhG8n/HPdQC8cRcItDXB5K2teEmBA/1JJxLuAUSfHhtDqxzpCH2/zk38RKIiF9VKwbv
 gaclvMaNR5vg1GpNgTQu3BQK87SmIcAwmPJuGTAmxizTqM9hfZcPMROk/ai4dEid2NcP0pg=
X-Google-Smtp-Source: AGHT+IF8SQ2JgM5sFunT9Xi0DOo/QXgkDUpLAzWqHE4Pm6PBSNMIs+CrkMQPqWas8YcuXm51yI9Ehg==
X-Received: by 2002:a17:90b:58cf:b0:2f9:9ddd:68b9 with SMTP id
 98e67ed59e1d1-306dbc0c8abmr4476592a91.26.1744213625892; 
 Wed, 09 Apr 2025 08:47:05 -0700 (PDT)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-306dd171991sm1952304a91.37.2025.04.09.08.46.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Apr 2025 08:47:05 -0700 (PDT)
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
Subject: [PATCH v4 13/13] nfp: bpf: Replace open-coded parity calculation with
 parity_odd()
Date: Wed,  9 Apr 2025 23:43:56 +0800
Message-Id: <20250409154356.423512-14-visitorckw@gmail.com>
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
 drivers/net/ethernet/netronome/nfp/nfp_asm.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/netronome/nfp/nfp_asm.c b/drivers/net/ethernet/netronome/nfp/nfp_asm.c
index 154399c5453f..2f8f78abb6f5 100644
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
+		ecc |= parity_odd(nfp_ustore_ecc_polynomials[i] & insn) << i;
 
 	return insn | (u64)ecc << NFP_USTORE_OP_BITS;
 }
-- 
2.34.1

