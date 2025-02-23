Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 303CDA40FE1
	for <lists+dri-devel@lfdr.de>; Sun, 23 Feb 2025 17:44:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A26D10E071;
	Sun, 23 Feb 2025 16:44:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="aO2nzj6K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16B8810E071
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Feb 2025 16:44:54 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id
 98e67ed59e1d1-2fc291f7ddbso5850802a91.1
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Feb 2025 08:44:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740329093; x=1740933893; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0/rM0c8KAofiqOH9E+BbTStqrJdKUl6Z4Ta9tU7voiA=;
 b=aO2nzj6KFMhHjfKheGWJTyTMqhZ4QM/cf65DMz/Gi79ol5sNjZCG6dOQz57RxogywL
 QITPX6BX/7U1ZaSuOmQNvrONq57+GfN0BVqxZVeKQhNQ51VP3xVVQ1v1kRZhll3nwTWw
 mTlGMBJsMlPrZVu/35w7Nip4s17imPEcfS8VPvY8oEDpyyzRwDy6KTnf1psS2b9Hqj2N
 zsyC8ZF4ZjBh8ouJm6gjf7/wETyMsIlR971iuJhHhLx5XYCITnj2+xx1nWdo0saId42z
 udQnOkdOYUG/NjnhwIWxNUK8BJKSKhZ7qscsxPTIyhwYee9aj28h3cogJ2vk2QQQa1Xe
 Rupw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740329093; x=1740933893;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0/rM0c8KAofiqOH9E+BbTStqrJdKUl6Z4Ta9tU7voiA=;
 b=uMv/F1Gbm3bFThOQ2bY5vLzkJbGdbzBnX8d4Wc928//Ir7iJ+02EQCOB6AQrOailqb
 RTTO8xVIwFmAy5QUQt1Rsyep0rmhs0J9YfuTigS+v3gL+PcPatvyHksKqmwfRVhsuJj7
 4BoDdiY32ASpJHILwaSkSw5Vp+GI4IVbXJejnZ27eZQGrK9oYbpk+2wgIkaRfWWBVwit
 j3xk08iw+1wbcZZCoLAFLjMVLEFECQJABt2je/iNp9gdnnKp4Cptt+9PxG7zptashMMZ
 VPw35Y7u4uqXB8JR9yGyMoPCJHVZqMQHwtGc2K/uBGETMF7KCzAwy+XlL5QqQuWZAcqg
 VNMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBrkcz9V4fkTX5xuL60aKz2Z4BdSrd5VOquzgY8sJ4VExULjfpuVWHihGoNshA+MDINpWN+wkV0/8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YznwRYU59Otwj11Ll7RrGDNFu4RY9JxeiYMnWHGEBsk62JA4u3w
 XIwjb4s8khDLdHQSqTNF2DpcHiubntB8LF/iXAwKNDMASid+sLIx
X-Gm-Gg: ASbGncu18gIgMhBJQw03iErEXAWha4f2QQ0N7SbIjpdlo+gsLsi60fbgvDP08B7tttH
 jfbXdwvQnA+VRQtJUpb1nzxPXYL0R9FKERAoimHl6IXSWq1jQjgpV8Uoshm77p7VzcUs3K1JPvn
 hzfCtYgt5yM9j0MticzCr43K9yFgMTN/mhzM/PFRrPWa3SE+hIKAL0LRPWtdv/C05T/JxnewdEL
 k86GOC/JC8HdeJ0hky9kHcF6vj9TYr69cViARtn55TkJOueL2GACTFl831gN1YHK5PZBqApMgcO
 +NP/VCKJYwf6mOlWLp8dNBJ4CoQx/iTOmEafKZX1Ge7DciMDsMNK9D1c
X-Google-Smtp-Source: AGHT+IFyGSvrJM271swgjLlCi2TwHZU6y12ME2N9/TuoQb9IugR13IQRKyCWyxRNE+S6ruhpAiUUqQ==
X-Received: by 2002:a17:90b:2b8f:b0:2ea:3f34:f194 with SMTP id
 98e67ed59e1d1-2fce78aab09mr18428370a91.10.1740329093592; 
 Sun, 23 Feb 2025 08:44:53 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2fceb09f6e0sm4935080a91.44.2025.02.23.08.44.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Feb 2025 08:44:53 -0800 (PST)
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
Subject: [PATCH 11/17] wifi: brcm80211: Replace open-coded parity calculation
 with parity32()
Date: Mon, 24 Feb 2025 00:42:11 +0800
Message-Id: <20250223164217.2139331-12-visitorckw@gmail.com>
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

Refactor parity calculations to use the standard parity32() helper.
This change eliminates redundant implementations and improves code
efficiency.

Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 .../wireless/broadcom/brcm80211/brcmsmac/dma.c   | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/dma.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/dma.c
index 80c35027787a..d1a1ecd97d42 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/dma.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/dma.c
@@ -17,6 +17,7 @@
 #include <linux/slab.h>
 #include <linux/delay.h>
 #include <linux/pci.h>
+#include <linux/bitops.h>
 #include <net/cfg80211.h>
 #include <net/mac80211.h>
 
@@ -283,21 +284,6 @@ struct dma_info {
 	bool aligndesc_4k;
 };
 
-/* Check for odd number of 1's */
-static u32 parity32(__le32 data)
-{
-	/* no swap needed for counting 1's */
-	u32 par_data = *(u32 *)&data;
-
-	par_data ^= par_data >> 16;
-	par_data ^= par_data >> 8;
-	par_data ^= par_data >> 4;
-	par_data ^= par_data >> 2;
-	par_data ^= par_data >> 1;
-
-	return par_data & 1;
-}
-
 static bool dma64_dd_parity(struct dma64desc *dd)
 {
 	return parity32(dd->addrlow ^ dd->addrhigh ^ dd->ctrl1 ^ dd->ctrl2);
-- 
2.34.1

