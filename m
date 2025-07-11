Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A9C7B020CC
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 17:46:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B500D10E2C8;
	Fri, 11 Jul 2025 15:46:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="Sk6Bi764";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B64BE10E2C7
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 15:46:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1752248779; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=iDtDZbWsnekV0rCvmUANxNaCWNje5kWmBJ/Tlns63hgzvzP9jOTQcbnP25e8rnfSBAQFUvWojFgo03N2fu58oX59ifZKFY+cED3Fxcrc7JWILEPLHMdZpRaVMArTulwxIRGfgaQkVwmuAFdsP19zWUU0HSqWLmhsNxuhL+vaqaY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1752248779;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=ASHpOI276JmL7bsVLc1cZjd5B6X1k3J9nQa6Rj8VCzU=; 
 b=Di8ifHeTPLulgSrXYybvTd0+usoF2BRXoi8c1aE6edVMN/kwR9mwwFtO8kpgjeyd6rcXd1tPDg0s5UgUnyf/3/lk2ZM2i2Cm+gbMuR5F4Jm7VfEjydv8SMua69nTxutM7PTvdsuskhgkQ9F/gGlwMLKhWxQqVrldJzdj+SQA+HY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1752248779; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=ASHpOI276JmL7bsVLc1cZjd5B6X1k3J9nQa6Rj8VCzU=;
 b=Sk6Bi764BwsghtdlkliSfS9kxUUozEgg0xHF1heUEmx8E+aGE8V9RPwGDfuv3rVG
 A424FKbq5ec2B5D1yZr+/KFy/BFiPsKLOXldE6f+xeXZOc6RUtDqu7OQHiJUNlmWR1a
 N4AoEHGvGLPPoS4CDyjEiyHlzQgv7ErUCRT+4DDU=
Received: by mx.zohomail.com with SMTPS id 1752248777868590.8325993297874;
 Fri, 11 Jul 2025 08:46:17 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: kernel@collabora.com,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/panthor: Remove dead VM flushing code
Date: Fri, 11 Jul 2025 16:45:53 +0100
Message-ID: <20250711154557.739326-1-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Commit ec62d37d2c0d("drm/panthor: Fix the fast-reset logic") did away
with the only reference to panthor_vm_flush_all(), so let's get rid
of the orphaned definition.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_mmu.c | 11 -----------
 drivers/gpu/drm/panthor/panthor_mmu.h |  1 -
 2 files changed, 12 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index b39ea6acc6a9..ed3712f8d6a9 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -885,17 +885,6 @@ static int panthor_vm_flush_range(struct panthor_vm *vm, u64 iova, u64 size)
 	return ret;
 }
 
-/**
- * panthor_vm_flush_all() - Flush L2 caches for the entirety of a VM's AS
- * @vm: VM whose cache to flush
- *
- * Return: 0 on success, a negative error code if flush failed.
- */
-int panthor_vm_flush_all(struct panthor_vm *vm)
-{
-	return panthor_vm_flush_range(vm, vm->base.mm_start, vm->base.mm_range);
-}
-
 static int panthor_vm_unmap_pages(struct panthor_vm *vm, u64 iova, u64 size)
 {
 	struct panthor_device *ptdev = vm->ptdev;
diff --git a/drivers/gpu/drm/panthor/panthor_mmu.h b/drivers/gpu/drm/panthor/panthor_mmu.h
index fc274637114e..0e268fdfdb2f 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.h
+++ b/drivers/gpu/drm/panthor/panthor_mmu.h
@@ -33,7 +33,6 @@ int panthor_vm_active(struct panthor_vm *vm);
 void panthor_vm_idle(struct panthor_vm *vm);
 u32 panthor_vm_page_size(struct panthor_vm *vm);
 int panthor_vm_as(struct panthor_vm *vm);
-int panthor_vm_flush_all(struct panthor_vm *vm);
 
 struct panthor_heap_pool *
 panthor_vm_get_heap_pool(struct panthor_vm *vm, bool create);
-- 
2.50.0

