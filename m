Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4584B5A396
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 23:08:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9E6A10E7A6;
	Tue, 16 Sep 2025 21:08:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QYySkJES";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C21C10E78F
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 21:08:33 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-77619f3f41aso3489522b3a.2
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 14:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758056912; x=1758661712; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=JXlqsfnKLagrxPr3VzrTdqYzxgGnKLHikbQ3zw87L3c=;
 b=QYySkJESmNpXNRKQDf6IKRJ+nd5iVF6BybJLwN3Rbbu1Bt+o+bkBwUeDbX1UTlknNR
 /7D2dhvVDsL6u76FgiRbnAZJHLxwREYgFu0a0330l7+6Ftntw81S2XGsB3/oWzmxdeuN
 8JUygZD75ZyoSgnLxCHYMgmJAHSsl4+32tuUjeCEt6iJt+EX5+QAbfmNPL4JwusGysvF
 9i7BkpIY3znxXt7KX/Xb/AmhExXEDmCd70Oa9UmiRtlVwb+VkL9V9n37baxght5PLOdd
 8M0/uxtbne/Ycc2oXQwFzlhpXnbucEvhpUfzcPU/FQDdLTsJ64yrMhsQGLXOCvd+HgQY
 O6MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758056912; x=1758661712;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JXlqsfnKLagrxPr3VzrTdqYzxgGnKLHikbQ3zw87L3c=;
 b=m200cY48536zkyZzixpYIqjjz12f9h7hIAKcZyurXiFHaFPsEHwZdznTDaqnqgkXMy
 W31WP0P2WgtIOwYcquAN29h12ubxXDuFtrn5JHgOFNJG1U1bEKS/Y6J2zEkcmlv1GPQk
 B6mG2kFfxHADG5pSz5d+TL7y02UHKBREoUUkIaKrnB2R1jQnwwVB93yGi+hpK9BoB9PE
 FWfqNWQGJSLuNhcB0tYQtlnPG2ZRsn9HNn21jEHVE2ucxsqWM9fWtfkbaoPFtYk1LLoS
 PdSzyA+XRXB6dp1l6zPrGF21eHzfF+OgW8zga1pCpzyibM+aAMWxNEAzhHlY8WnKKHZY
 gaJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXHPGn5jdLKQP02A3TQcdbSPOrleaFhW6FkfrCC3QsivR26gIguVjXF7kONtd+7EFzZMHI94yimm8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwTSQd1vW/76DPnkGYd59pK9sU/9RaFzh+rOvXYV8+76stXYeYw
 oZgC2MMFp9dXVrfMWrIPJ04m04fkprMXpCDsWupfOxuArD9ucHXg9fkp
X-Gm-Gg: ASbGnct1wQLa2KSETLJVeIl5sYgmuO541e/ts+D0FWWgRN/0PWOo88RlKssoKuYn6Qe
 RMV9nbAkkWwzxkUmSIPc6jbghXVNldG6cOFN4K5ZQhoILOjG0zaez5ugfHq+bB8I7VO7SuhlvRS
 mMWcFAUPqGOC6q4xYfSiEwjYMnoa6bfynuzZCeq2/ieCcu2E2rfqLQYYD5yAOJhV3fdGG0jBscJ
 ZLygp4jXzhvHusiUYlR7dd5fQdxbZeMu9gZZy8LG3hqswvet0Ack4bXMXbmgnxp+EOAGbgFbGkc
 ogWLxF/lEKz0pe651zuzp3QWJ5+AOZ+OKCdmtxHVUhnoAmqbc6Q+vrYEbcakDSD5IjXAXAGjkGY
 3KjLkW66bW7lUuYGFSbQaGBxXsDUKC6YsglxfGYr19VmFuGi1ztDm+zLAIBClvcx50iZr+XTl0w
 9IVRPsye2+UQ==
X-Google-Smtp-Source: AGHT+IGpEOt2m53Rpg1wAIXOJxhtQSEdxYW2LFFzym9M525oZbCACFLRLKzow9N2bwg0rZ2ZXol3rg==
X-Received: by 2002:a17:903:19e8:b0:267:776b:a315 with SMTP id
 d9443c01a7336-267776ba382mr100151885ad.32.1758056912450; 
 Tue, 16 Sep 2025 14:08:32 -0700 (PDT)
Received: from localhost (185.3.125.34.bc.googleusercontent.com.
 [34.125.3.185]) by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-26711e5d42csm62779625ad.78.2025.09.16.14.08.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Sep 2025 14:08:31 -0700 (PDT)
From: Chia-I Wu <olvaffe@gmail.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Grant Likely <grant.likely@linaro.org>,
 Heiko Stuebner <heiko@sntech.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 01/10] drm/panthor: rename and document wait_ready
Date: Tue, 16 Sep 2025 14:08:14 -0700
Message-ID: <20250916210823.4033529-2-olvaffe@gmail.com>
X-Mailer: git-send-email 2.51.0.384.g4c02a37b29-goog
In-Reply-To: <20250916210823.4033529-1-olvaffe@gmail.com>
References: <20250916210823.4033529-1-olvaffe@gmail.com>
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

Rename wait_ready to mmu_hw_wait_ready.

Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
---
 drivers/gpu/drm/panthor/panthor_mmu.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index 6dec4354e3789..d3af4f79012b4 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -503,7 +503,17 @@ static void free_pt(void *cookie, void *data, size_t size)
 	kmem_cache_free(pt_cache, data);
 }
 
-static int wait_ready(struct panthor_device *ptdev, u32 as_nr)
+/**
+ * mmu_hw_wait_ready() - Wait until the AS is inactive
+ * @ptdev: Device.
+ * @as_nr: AS to wait.
+ *
+ * An AS can accept one command at a time. This function waits until the AS is
+ * inactive and is ready to accept the next command.
+ *
+ * Return: 0 on success, a negative error code otherwise.
+ */
+static int mmu_hw_wait_ready(struct panthor_device *ptdev, u32 as_nr)
 {
 	int ret;
 	u32 val;
@@ -528,7 +538,7 @@ static int write_cmd(struct panthor_device *ptdev, u32 as_nr, u32 cmd)
 	int status;
 
 	/* write AS_COMMAND when MMU is ready to accept another command */
-	status = wait_ready(ptdev, as_nr);
+	status = mmu_hw_wait_ready(ptdev, as_nr);
 	if (!status)
 		gpu_write(ptdev, AS_COMMAND(as_nr), cmd);
 
@@ -601,7 +611,7 @@ static int mmu_hw_do_operation_locked(struct panthor_device *ptdev, int as_nr,
 
 	lock_region(ptdev, as_nr, iova, size);
 
-	ret = wait_ready(ptdev, as_nr);
+	ret = mmu_hw_wait_ready(ptdev, as_nr);
 	if (ret)
 		return ret;
 
@@ -617,7 +627,7 @@ static int mmu_hw_do_operation_locked(struct panthor_device *ptdev, int as_nr,
 	write_cmd(ptdev, as_nr, AS_COMMAND_UNLOCK);
 
 	/* Wait for the unlock command to complete */
-	return wait_ready(ptdev, as_nr);
+	return mmu_hw_wait_ready(ptdev, as_nr);
 }
 
 static int mmu_hw_do_operation(struct panthor_vm *vm,
-- 
2.51.0.384.g4c02a37b29-goog

