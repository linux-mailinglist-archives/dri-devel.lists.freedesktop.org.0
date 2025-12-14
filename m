Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0EACCBBFD3
	for <lists+dri-devel@lfdr.de>; Sun, 14 Dec 2025 21:24:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C19AE10E011;
	Sun, 14 Dec 2025 20:24:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="WEbG47ej";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 379BE10E011
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Dec 2025 20:24:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1765743878; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=hIyJ7Uzmu3Ue8m1v7kDsxa8mCqGLqy5FQjuB6B6WB7MEUofOp+jeznqkFyVtuPc+5ei09dRgGoA2aaoI0AXvxAcw2bfNONBurfTcolaNEL7SAX6+Xq5p4+K0kKpbNuv5AeMSfYtrEA64kot10pQPGgSvyhGUCLmkZf7Ay1Qds2M=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1765743878;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=TBxEjprZDT3VgMi8PeOjTgEeyc8tXAEDKBzqj1ZR+HA=; 
 b=PvoN0Vxe3prigcjQur5S31MiPO3tRWI8GFGo51rKqWgKA1k8a6PdAH4RELCZU1hmSsLqyAWkRyBxrr0AEeoqaGHQsaT1r8jPNmkaljPw1lRFe14W0DQWQfbtmPCRPDVWNB6e3A/ZAd1z4DtC7mNVv5NwUdCYz2JbNrpV1GmcQ64=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1765743878; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=TBxEjprZDT3VgMi8PeOjTgEeyc8tXAEDKBzqj1ZR+HA=;
 b=WEbG47ejrwgrEtYzCZF7luMinZRAcJexC0VTm3N3GWNCCa2QI7MLprPhsu2LhIsT
 kRtAFo5nsoQKBSzcXxIXPCuGlbrD9TVQgmbtSIQ6HHcv60lsU1ePD46Sky5Z09IbH38
 RAkB6v/td/Zo2sHmOAsznndcYmXL8bLOzH8G74vM=
Received: by mx.zohomail.com with SMTPS id 176574387618131.769145758230707;
 Sun, 14 Dec 2025 12:24:36 -0800 (PST)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Subject: [PATCH v4 0/1] Workaround for partial huge page unmaps in Panthor
Date: Sun, 14 Dec 2025 20:24:24 +0000
Message-ID: <20251214202426.3186811-1-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.51.2
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

This is v4 of [1]. This patch is a workaround for performing partial unmaps of a VM region backed
by huge pages. Since these are now disallowed, the patch makes sure unmaps are done on a backing
page-granularity, and then regions untouched by the VM_BIND unmap operation are restored.

A patch series with IGT tests to validate this functionality is found at [2].

Changelog:
v4:
 - Added VM lock for expanded unmap region.
 - No longer pass the original VMA when calculating expanded unmap address and ranges for
 calculating BO offsets, as this can be obtained from the map va op's
 - Added more comments and renamed the unmap boundary calculation function
 - Calculate prev and next map offsets, sizes and addresses in the block prelude for
 the sake of clarity.
 - Addressed some minor style nits.
 - Rebased the patch onto the latest drm-misc.

v3:
 - Reworked address logic so that prev and next gpuava_op's va's are used in the calculations
   instead of those of the original unmap vma.
 - Got rid of the return struct from get_map_unmap_intervals() and now reckon panthor_vm_map_pages()
   arguments by fiddlign with the gpuva's respective gem object offsets.
 - Use folio_size() instead of folio_order() because the latter implies page sizes from the
   CPU's MMU perspective, rather than that of the GPU.

v2:
 - Fixed bug caused by confusion between semantics of gpu_va prev and next ops boundaries
   and those of the original vma object.
 - Coalesce all unmap operations into a single one.
 - Refactored and simplified code.

[1] https://lore.kernel.org/dri-devel/20251213190835.2444075-1-adrian.larumbe@collabora.com/T/#t
[2] https://lore.kernel.org/igt-dev/20251213190205.2435793-1-adrian.larumbe@collabora.com/T/#

Adrián Larumbe (1):
  drm/panthor: Support partial unmaps of huge pages

 drivers/gpu/drm/panthor/panthor_mmu.c | 99 ++++++++++++++++++++++++---
 1 file changed, 91 insertions(+), 8 deletions(-)


base-commit: d8684ae1cdcf848d21e00bc0e0de821d694a207b
prerequisite-patch-id: 3b0f61bfc22a616a205ff7c15d546d2049fd53de
--
2.51.2
