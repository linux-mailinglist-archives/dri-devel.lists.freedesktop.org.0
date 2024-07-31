Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4087E94335F
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2024 17:30:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A10BF10E65F;
	Wed, 31 Jul 2024 15:30:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cGQUDqaw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9FE410E483
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2024 07:36:18 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-1fc692abba4so38060335ad.2
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2024 00:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722411378; x=1723016178; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lRH4DV0DJDUFsL+oAneJ1eExEHHJriff1ENVzKjdwVA=;
 b=cGQUDqaweRBFMP7KS5HHkeQTz8HKa706GQO770vK3IPfQdYS/FCp7oA3FIgI4FHWUF
 2n+LzAzZzr2+y2dLztyno7bmuqGoSwvF20vf6cJcl3vBEeCKDVxilwgEwasbElVycH9R
 8HsML9Zofd1jAGV/iwjZGCqMwEZlAoairuOBQmhMAh7zms0161UJ2R1zzH56Qsq54jpq
 nutz/e09Wrlo6KbfREk+t5FGxfpbjKRef8V7i/IiI/jSa+FkhtKG/QB5CGlSQR0qoOb3
 +ZHIbX7trntvolVv6eabJnYPyNJtikCBJz4R7ZawUP01RFAQS3M2bL+Zc3U6f6PClwv8
 INKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722411378; x=1723016178;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lRH4DV0DJDUFsL+oAneJ1eExEHHJriff1ENVzKjdwVA=;
 b=cQCS60MXST4uBznxeMUs+KKQfgSsCk/d8kJwV5FBL0/SCV3dWWImbKRlhuk8EWKw+f
 sE/bLZasUD5Fqpmtcc+Ul+G+cnubfJeWFjr9qQ/00lFkrJ/LigZqpVdmd+250N8qZKIg
 5TI38cgSkE3wbdQIJRVPyzqrE8T55XmN+LHpPRjZtkCQFiu0ki7vHgzu6FuNouyRUNYL
 /KyS468xNHTtkPBGAgjppvBUeejcew6aCNLznsNILbWz7bHx2AD3qzUjS7CI7SnAviV/
 AvxOFiyOmE7Kb7D6w7NKyEPvflcEyXItmadvibiEru4SW+9+8xRoZDwK80QuBR98q1Cs
 0TPg==
X-Gm-Message-State: AOJu0YyHHwyNIpM43TQGuMzsMo/YIfkHUq7dOazxS6T8/eRCOoSgQTkZ
 BclEoMUFPLkGbZfk4hjHRVc+uykrkZ8jej5giFLnglwZNbfxilu6
X-Google-Smtp-Source: AGHT+IEceKTtYYEsOkXyN0s0CRHubuzO4J5r0XPfOvSvOHmtwtPrADzOS1FSoHURcWoeZWH3v5Mn1w==
X-Received: by 2002:a17:902:cec3:b0:1fb:779e:4fca with SMTP id
 d9443c01a7336-1ff047a5335mr138685625ad.14.1722411378005; 
 Wed, 31 Jul 2024 00:36:18 -0700 (PDT)
Received: from Riyan.inspiron ([2409:40d0:1028:df3:da0:ae29:34f8:4b4d])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fed7f1b7dfsm113401935ad.189.2024.07.31.00.36.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Jul 2024 00:36:17 -0700 (PDT)
From: Riyan Dhiman <riyandhiman14@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 Riyan Dhiman <riyandhiman14@gmail.com>
Subject: [PATCH] staging: vme_user: vme_bridge.h: Fix mutex without comment
 warning
Date: Wed, 31 Jul 2024 13:06:05 +0530
Message-Id: <20240731073605.9857-1-riyandhiman14@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 31 Jul 2024 15:30:09 +0000
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

Adhere to Linux kernel coding style

Reported by checkpatch:

CHECK: mutex definition without comment

Signed-off-by: Riyan Dhiman <riyandhiman14@gmail.com>
---
 drivers/staging/vme_user/vme_bridge.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/staging/vme_user/vme_bridge.h b/drivers/staging/vme_user/vme_bridge.h
index 9bdc41bb6602..0b1f05944f0d 100644
--- a/drivers/staging/vme_user/vme_bridge.h
+++ b/drivers/staging/vme_user/vme_bridge.h
@@ -28,6 +28,7 @@ struct vme_master_resource {
 struct vme_slave_resource {
 	struct list_head list;
 	struct vme_bridge *parent;
+	/* Locking for VME slave resources */
 	struct mutex mtx;
 	int locked;
 	int number;
@@ -55,12 +56,14 @@ struct vme_dma_list {
 	struct list_head list;
 	struct vme_dma_resource *parent;
 	struct list_head entries;
+	/* Mutex to protect access to DMA list's entries */
 	struct mutex mtx;
 };
 
 struct vme_dma_resource {
 	struct list_head list;
 	struct vme_bridge *parent;
+	/* Mutex to protect DMA controller resources and ensure thread-safe operations */
 	struct mutex mtx;
 	int locked;
 	int number;
@@ -72,6 +75,7 @@ struct vme_dma_resource {
 struct vme_lm_resource {
 	struct list_head list;
 	struct vme_bridge *parent;
+	/* Mutex to protect LM Monitor resources and ensure thread-safe operations */
 	struct mutex mtx;
 	int locked;
 	int number;
-- 
2.39.2

