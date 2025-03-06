Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D61AA550CC
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 17:28:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8671010EA00;
	Thu,  6 Mar 2025 16:28:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="l34di33X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00B8410E9F9
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Mar 2025 16:28:16 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id
 98e67ed59e1d1-2ff187f027fso1640787a91.1
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Mar 2025 08:28:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741278496; x=1741883296; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BS9Ngq0ErapA9ho16k90z8id/zApcMAPWGpuMTc0x9A=;
 b=l34di33X9MSlqczlpjLBeDyLf7jt8WiKFf+c7AR2iqOVCwkxU+DKIlWt/Z7MChaSr0
 IDeekLvQT05HIwKrQ3PATvfCgaqGMCEcQJDZLPXGhJfPqDb/F0efOwMbzsTBx2PnXutW
 rYNueToXOKD+QwZYmTza8BwpEIIF4kE6clVPeH2bzsrFr8HvVg0Slax2Q+TzyqGm1cGq
 Mytw9qxBvEdp0Mr7VdRKNTYc9FNrXmMFdAM8ELkxsiwR/o4i7jpzxNj0FFSgfeVuam4t
 UhCJtD27VOGbOjchXNDeyGpUB7GB5C8HibKK1J3qm94lltLdhzBzhQpAcW2kUnNi00h9
 8AgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741278496; x=1741883296;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BS9Ngq0ErapA9ho16k90z8id/zApcMAPWGpuMTc0x9A=;
 b=RmGQCIeDkw502EGtNfeOsk5ZZpNk8OhwMrNbAqdgI+mvu7+CFFM9vosHVcEVcRLgA6
 uDEYehLlI8qpDQkn64F5+Uc+cOerOiDzaF8E/wBkYmlPzL0dV3LrleBGqdSlV5avh1+S
 RRVHBTIoM++/tZT003dMAIygDwQqegWeTcsc3FUKU38p4jSxaeonw6w8tPMewU7zYNrk
 1XG/IfcpV+gycVToG8s+iOuCAbdwZ07Cf3zeWYFJm1aFeXqT0VL/F0UZ2t6frnIT14N0
 +BJTkXD7L98Kiy6jms8Y/Avn2Nl0ec8wC1QKHW7Vg7FXfuSngaXkgomH+AJxkNzqH6iI
 YgAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU++Xlqmy8YU9RUr/lQVROuK4IcwWoShcqhnjvzOwSQEDrqRPDPjDM4kqiaqHaTCPFupJJz+P9TElA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwiHJwPDdaWCIi/ci5jrNO+g6TBFMS++7S0jgghxdzN5vlu7Pcw
 WDPG5pZFHuOxRI/R8cgHoi5ufXCRPlddhoNxdKUD2F4xqaZQ6GF3
X-Gm-Gg: ASbGnct3oeiLD+UZxQhbDk5IH2Jh0coIC2v3wtpqsD6lIBL8yOo4vRxd8i1kptbC4Td
 5UcxtxlrYf9qjBMEhVN+IbmoKLLbrAMfDIV9f7T4NUHtwl9AUV6dkaMWfvtaTUfazFI9PcBK2Vq
 VhweNYXBvTD762cNZQONnvDIuQUXWQXUoJyiEuW7O04DfQ+VRCSXBcr7eHPpRF3jZV3msSTgevX
 1xg1cS1evn4tnE/eY+pONzk91ZvtyyKot28wAUfwdq1MoMXhToPiNUSl97ROCZcrVRrQ00U+blP
 3L3fpiNB6v6GtXdVGnuUL0X4w8dy1l/9SpaqVtQ/Y6KxxBW152+udZdLKsW9JllcHD0FNjeQwIA
 =
X-Google-Smtp-Source: AGHT+IFnMh654YdQkj0YFSRHf+ssdwCg9qa/rMgaUesbiD2om2YrQrVL25CKfgP6tloqN6SwFoBXOA==
X-Received: by 2002:a17:90b:4c4f:b0:2fa:6793:e860 with SMTP id
 98e67ed59e1d1-2ff6162ec0fmr6970693a91.0.1741278496344; 
 Thu, 06 Mar 2025 08:28:16 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2ff693e75bfsm1464298a91.33.2025.03.06.08.28.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Mar 2025 08:28:15 -0800 (PST)
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
Subject: [PATCH v3 14/16] fsi: i2cr: Replace open-coded parity calculation
 with parity64()
Date: Fri,  7 Mar 2025 00:25:39 +0800
Message-Id: <20250306162541.2633025-15-visitorckw@gmail.com>
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
- Change parity ^= parity64(v) to parity != parity64(v).

 drivers/fsi/fsi-master-i2cr.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/fsi/fsi-master-i2cr.c b/drivers/fsi/fsi-master-i2cr.c
index 46511236bbca..3356c478e395 100644
--- a/drivers/fsi/fsi-master-i2cr.c
+++ b/drivers/fsi/fsi-master-i2cr.c
@@ -44,15 +44,9 @@ static bool i2cr_check_parity32(u32 v, bool parity)
 
 static bool i2cr_check_parity64(u64 v)
 {
-	u32 i;
 	bool parity = I2CR_INITIAL_PARITY;
 
-	for (i = 0; i < 64; ++i) {
-		if (v & (1llu << i))
-			parity = !parity;
-	}
-
-	return parity;
+	return parity != parity64(v);
 }
 
 static u32 i2cr_get_command(u32 address, bool parity)
-- 
2.34.1

