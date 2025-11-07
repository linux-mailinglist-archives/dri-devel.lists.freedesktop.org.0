Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54024C3FD49
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 13:01:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7C4710EAA2;
	Fri,  7 Nov 2025 12:01:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Mpz4jtjS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED3E010EAA2
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Nov 2025 12:01:04 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id
 98e67ed59e1d1-340c680fe8cso611730a91.0
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Nov 2025 04:01:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762516864; x=1763121664; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+CceWq1gwdCMIj9EhxpAQS0ZIz7AyEWHXDa3+02Ng1A=;
 b=Mpz4jtjSBxsFa9cQYd86P2CgKJSa1j1DEpM7FB0508gNfiUpHoQ88elSgQ9qoA0kdS
 +3powJy+CA3AedJrHTzu8FJw4+ZiErw7gWc6oarblxSubQ2HFI2J4+bmQ4qz3gyoTtXh
 tSas2ku3Jn6nRKjN/P+eqklmehEr/OmhKIvdtIA/USV9YphVx1isrRH99Op+khs13oWT
 iT5kzSA9XFTQ6xCGgvVkP8s15D66mgB8A2BSgFNijnrYUV+omjLNCmJTc/8eXsQ3JfQA
 +omc2FXDOaxgRJlh8BPfEqrwRpgQlBQEzU2KSu/gCM8Nyp5PJetQZs7mJMmCtzVaAVZs
 W0ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762516864; x=1763121664;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+CceWq1gwdCMIj9EhxpAQS0ZIz7AyEWHXDa3+02Ng1A=;
 b=b9k04MTV/TcSaRkhwwjO3oFiNR2RJYEVluslCX6V5RwT/NvTqG7+6x5N34I2l/fO+h
 k36cs5FO3PV0gU6+FWa7qNAHakUNSRyq/m+RbjQ9sM0ZoNiuZP/rCxBoQskfQUaJ2JQI
 YJWrChATgn1yWog0BIHLPytBoCnbL6HuKowlS8ojsbXAdIo3aWIUjwPYavXS9al9giHc
 3p2Ahc/3C1YLKPnSzbbgVLWyZnE6D7hBfsvd7dGGhKx3MB98bQYRHFBAVgs+FPxe32Ya
 1/2s1N8ftAgupugh9cE6vIuETBBypFyJkpCAFhEySgE23lMd5xJf/nSg0AbhLAMcoq/c
 4wRg==
X-Gm-Message-State: AOJu0YxkNgFu+IK7/y+ReCkhq8R3c1zQpEu72YSpl4/zA3nBogRrV6Kn
 Wi8RRErM2UmZnibBKOpyeAOuMrnRlJJlZvGzc2KtF4FXBb77E58LcPOt
X-Gm-Gg: ASbGncscQF9Hqhys77FSRzhUtofnQZJe/7Sfh7SV5CRpkiO7SQoZ3TUqf/xUHqXWBjP
 rUZ3JvEcqYecJciLfMwL/VMB1dt0hxIQ7Y6OINVS0tZxgpAfSTGKagyEaeKxScsU2CXRSa1QdH0
 SpXXNqpEPCF/GLyainCiO0xlhkg+HyTtzkYb80FskMofU9Upkl0ZAIAJ1Cyg4gnqoec4Mq+oSaH
 o7rDDoV4wlBs5skuXviSfVb3zJ8ORDmYZJbnh0J51adg4JqdFmpcRZBOI76nTI51cQ82zL037g9
 uIPZhS+AT2qLNXO+KC4l/5ef9TSES0Az00t3GQz3OGYWjpMr2hCHUorkD1SYAyhrt5ZYy3BPzC2
 FcVQf39QdPx1HdHb4Nm/hbTk76ZF7QRdbRi4G8Cy8sn72cleBgNkP8hR/sav0kXQHn/tmf1PPPv
 GWVtngJGAjwjeLCb6ZwuTVegokSlBPMC4V37hLFZ8yXD+l7f91KwUbotXIZFAGEAg=
X-Google-Smtp-Source: AGHT+IE2Jvir4YmFcnnOxNAW+erOoTmE+Om3BFAAMC9RL83vI2P1CfSiqnBRw4rpoPb7xePR5kkslg==
X-Received: by 2002:a17:90b:3843:b0:340:b908:9665 with SMTP id
 98e67ed59e1d1-3434c584051mr3815197a91.37.1762516862908; 
 Fri, 07 Nov 2025 04:01:02 -0800 (PST)
Received: from SIQOL-WIN-0002-DARSHAN.localdomain ([27.57.191.202])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7b0c9c08ee9sm2833728b3a.21.2025.11.07.04.01.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Nov 2025 04:01:02 -0800 (PST)
From: Darshan Rathod <darshanrathod475@gmail.com>
To: airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Darshan Rathod <darshanrathod475@gmail.com>
Subject: [PATCH] agp/nvidia: Fix coding style issues
Date: Fri,  7 Nov 2025 12:02:06 +0000
Message-ID: <20251107120206.923-1-darshanrathod475@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Remove assignment from inside if condition and adjust brace placement in
static initializers to comply with kernel coding style guidelines.

No functional changes.

Signed-off-by: Darshan Rathod <darshanrathod475@gmail.com>
---
 drivers/char/agp/nvidia-agp.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/char/agp/nvidia-agp.c b/drivers/char/agp/nvidia-agp.c
index 4787391bb6b4..aab33d1297d9 100644
--- a/drivers/char/agp/nvidia-agp.c
+++ b/drivers/char/agp/nvidia-agp.c
@@ -125,7 +125,8 @@ static int nvidia_configure(void)
 	pci_write_config_dword(nvidia_private.dev_2, NVIDIA_2_APLIMIT, aplimit);
 	pci_write_config_dword(nvidia_private.dev_3, NVIDIA_3_APBASE, apbase);
 	pci_write_config_dword(nvidia_private.dev_3, NVIDIA_3_APLIMIT, aplimit);
-	if (0 != (rc = nvidia_init_iorr(apbase, current_size->size * 1024 * 1024)))
+	rc = nvidia_init_iorr(apbase, current_size->size * 1024 * 1024);
+	if (rc)
 		return rc;
 
 	/* directory size is 64k */
@@ -291,8 +292,7 @@ static void nvidia_tlbflush(struct agp_memory *mem)
 }
 
 
-static const struct aper_size_info_8 nvidia_generic_sizes[5] =
-{
+static const struct aper_size_info_8 nvidia_generic_sizes[5] = {
 	{512, 131072, 7, 0},
 	{256, 65536, 6, 8},
 	{128, 32768, 5, 12},
@@ -302,8 +302,7 @@ static const struct aper_size_info_8 nvidia_generic_sizes[5] =
 };
 
 
-static const struct gatt_mask nvidia_generic_masks[] =
-{
+static const struct gatt_mask nvidia_generic_masks[] = {
 	{ .mask = 1, .type = 0}
 };
 
-- 
2.43.0

