Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE8EA4ABDD
	for <lists+dri-devel@lfdr.de>; Sat,  1 Mar 2025 15:27:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E22F10E267;
	Sat,  1 Mar 2025 14:27:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZRlMajAy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8660910E267
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Mar 2025 14:27:52 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-2234bec7192so28695235ad.2
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Mar 2025 06:27:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740839272; x=1741444072; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H92cNXD8ivdLBJu7PZvS/WlFHsCPSxa0jaZByFXEmx4=;
 b=ZRlMajAysbOSQ91j4xtYU9PSGHrFBoRzAANBMHhOsGif0hd95ZJwKdCvyPracZFf+8
 wzvFtZ5A1w731xsHxL1A1WmYC6VX6HYV0G2rPVtNlJat2ShSjlQAYicQPsk/WBeJCpHD
 6qMgjfompak6FOQ7SKQAN6Jc9fKHrNOPlC4f7+1etOXqfNExreCUZbFx2aahikli87o1
 PO5F0QjtLX6gOpHzpJsKACYjHxgbsYMuMqYQpXWfke/RPWAoAMNyUIJqlUlzfl4QY+sS
 Cdf4/stok0NLSUJQlMN0xmQJt4ayEvAgFGqnXPZTae4blRSVbQPPVi5vvnqSw64/vmp5
 SY1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740839272; x=1741444072;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=H92cNXD8ivdLBJu7PZvS/WlFHsCPSxa0jaZByFXEmx4=;
 b=LYDQ/RforLqF66x95eXIU1kkhdvpU2ZFbegSaFhmuxZ0M77K3yf8u+eYvRNmQ8nQXx
 ZgWLln6l7EjkCfI6IsoAx2JT4sXNRBxvEi6roxC/damq8A4QdlX2hadWP1SrDyl5+E8q
 YQijSaBF7tJfuZRm0Iz1ENfaVvHRnf2On6uvy2RvtBBEt4taYU5yt2RsHymdLbdm1Yj7
 MV3Sv1H32YPuaDK4zJnFBCq2UCgvje2yoHkq/WN27h0oz6BynYsQJSKcVVwMIZZwMvR0
 1x3B8q0FFHucQPbt0bwycdl8RnqIv6WMdQ+Xh9qwKPX8JACoUlL3j1qiMleKi9pOd/g/
 H6hA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNcXh2fFkrZPxz1k8v81dIdDGDrHVCOOZy1s00K+mtDRHyIUCegKgDtVYRicQBWe91pDhQbTA+zSA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzan17p7lOkrWZFAW9ZtoW3hI2DJcGFTPQQCLgaY4ridpJIyyM8
 GeWvDTbc2jHazbGrp9uqtDfYJMb2ZnG+rTfhGe2HKN1yJzvG0pjy
X-Gm-Gg: ASbGncs3nJaVpAQpIQn9H7cHE6JXJL1HZ+w+O1BQhbkVGYNS+cH10LXeE9AF8vH5526
 o4nYUMTxmpiUKw167NiIPJzJLkYbco0gbkb+biwHxuj1h/PipXJagmR0LDmRDWH2qPtuqY3YfLD
 OTVUureTaToxXSDH8xeI2MV8XJWJ0uWFS0hrM+Zjs4PBEu0cjBXUGYxhs4OGuP4n3tWJ3wssSh/
 otkQXqphhs32504Kx5s6Z31/Ka7uImipZzq9bFlwWsrglLXayY+bOdrAOiR3gdIChjLeO8mTFdp
 9ji0CjsBDKYQiXecINYoLl/vW+mr1/zvPAH8uHrucxsFvEocUSy1JFejZgcmqGSH84r4Vk7ogUI
 =
X-Google-Smtp-Source: AGHT+IFJ7v56//ubfe5SZfIgarRaf2kt414B71bZC0lL5Jm/hhEy1S8FPvdkgRl1jpN6UW8NLO4j1Q==
X-Received: by 2002:a17:902:e5ca:b0:223:894e:4376 with SMTP id
 d9443c01a7336-223894e454dmr21360135ad.43.1740839272112; 
 Sat, 01 Mar 2025 06:27:52 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-223501fa8f1sm49231965ad.90.2025.03.01.06.27.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Mar 2025 06:27:51 -0800 (PST)
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
Subject: [PATCH v2 15/18] fsi: i2cr: Replace open-coded parity calculation
 with parity64()
Date: Sat,  1 Mar 2025 22:24:06 +0800
Message-Id: <20250301142409.2513835-16-visitorckw@gmail.com>
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
 drivers/fsi/fsi-master-i2cr.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/fsi/fsi-master-i2cr.c b/drivers/fsi/fsi-master-i2cr.c
index 8212b99ab2f9..8f558b7c6dbc 100644
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
+	return parity ^ parity64(v);
 }
 
 static u32 i2cr_get_command(u32 address, bool parity)
-- 
2.34.1

