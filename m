Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A1ECA4ABE4
	for <lists+dri-devel@lfdr.de>; Sat,  1 Mar 2025 15:28:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6021710E271;
	Sat,  1 Mar 2025 14:28:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hdrL3RfT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DEF310E270
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Mar 2025 14:28:12 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-22339936bbfso46315495ad.1
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Mar 2025 06:28:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740839292; x=1741444092; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nzBrmzWckDIJwY51QBb0mQJ5Dqo6Ldx+jMH0V0Ck8/w=;
 b=hdrL3RfT1Wx+jVb2/QGxJgURqe8vzRgzzmiRAyGyjv51jiLJTShEZssakby/Ypd3fb
 hoE8t9+kJ8Yr83TF2qvI6987gjCflbbBzOs0vcckMbKsQx12G49W60VGhhbJ/MXNNvNS
 LOJIwD0mvaKBxIX77GIYMFQ9X5mYuqbMPZpiJZ3aFVJyGJhR9EhxTmHZHopW4Oyh0M4a
 KjwrUb5JR42MKEcKrQcfrUh8evpyPdwIKoPbEWZWp+XhtvwlI0e6ttXfoxTRPlvMi3Cq
 x6QKGBlLOlTfQChplpvb09vEhBSXyVPnE4bUgaG+CuCxwynRjEWa9KLvFJJC0oKwdEMq
 7qIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740839292; x=1741444092;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nzBrmzWckDIJwY51QBb0mQJ5Dqo6Ldx+jMH0V0Ck8/w=;
 b=CNaMMWMBGO6VRPqnxqt718C5mw3y/mGd4s1gOY6Gx9u39735Adj32R19RP8Eye9hkQ
 SVhmZxqVje3r+dLQROT4IHzm30EEvexKJ+iCRs8sN/1Mvjbkg1ZGPg8WKarsQkV3s7vW
 SSWEu82No74i87J2X03nnQ1W8+wi8jkZ+JDrRb3Hog6aKeJdOwbxmaxmKd3IIy9J08x+
 DLxwk+Sc0dIwYyphEAcz8cEL3qrJt7JyrGPKrtBRq++aoPgjb+ufIOAnIf5QMxCCdfbY
 xbMQg7ZUc3eOBlJ1pcg2GoF/Ben+piOAyi340lNkA1NA2uToIfbqQnT/qwv6flK54QVj
 ghjQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRk8P63kabdylN4S9nxSEYEZ/ggFup3Q7Jf663orTyMnkbWctbMgpK2Mxrako6yUGqz3Cikiko9Bc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxHVtpnr6phYu29pICxSMagkYulKbTNuYDDw7ziaELCwsqGAXAa
 saD/tF2Zn6GAqAf4C/B8UgC8aZ5EhJPgaRNE+sbKt5fIENGtbuvn
X-Gm-Gg: ASbGnctFsJJ4Gj9YIQYZrZWPOcBu1xCXumkcIgl5GaVJMO4h9ebW5Jfa8UHj591ApGx
 XhP+RvmiEzLZ5a5zFLkY/DS6U8W4esvHxUixt8CeFoaOsRwwbPw6awqMyqk5VxmtVfYBPwpoS0P
 M/9gkYxsisRVa6AxsyePEOME5Po5CmDEhZCcBfOFwkZopnQ2iFwl1zBN+yxyTZS23guDW0EvIU+
 dlIbXtidmR+VhgP6k9/Vuz8DWQNoh28Y0XjsMSxXuQrk7dvtF84WLLvwhAo/ASc1B2Ekzti/W+s
 ti1NdWriUvL7vdjeAVHyP6xMKSQ+syRD+HVczX8sdwro/NsGbH3AeXo8PZT/9zt2vrgW355SBS8
 =
X-Google-Smtp-Source: AGHT+IHOy6Wv/sKHhRUGc/3EBAQcCBF/SI4YUeW7LDGDR7+GStKywND2M264p9e2dxtzneP/WiNrxQ==
X-Received: by 2002:a17:903:fa5:b0:220:f40c:71e9 with SMTP id
 d9443c01a7336-22368f71f0dmr96371785ad.9.1740839291945; 
 Sat, 01 Mar 2025 06:28:11 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-223501fa8f1sm49231965ad.90.2025.03.01.06.28.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Mar 2025 06:28:11 -0800 (PST)
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
Subject: [PATCH v2 17/18] nfp: bpf: Replace open-coded parity calculation with
 parity64()
Date: Sat,  1 Mar 2025 22:24:08 +0800
Message-Id: <20250301142409.2513835-18-visitorckw@gmail.com>
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

