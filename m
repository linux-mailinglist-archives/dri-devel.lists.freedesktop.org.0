Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E38CBB27C
	for <lists+dri-devel@lfdr.de>; Sat, 13 Dec 2025 20:09:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02D5E10E182;
	Sat, 13 Dec 2025 19:09:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="WCluVfKS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 904A710E182
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Dec 2025 19:09:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1765652935; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Ln1YyVH/FQIG4t16Zz1BXDd0x2eHKAx7VPnQPsxsxZXsnA3/UN9bniiPbkRChaG3bHm0E04ZG5343NWwNbPc+fS4j3RF2DB28hIrGTTiffVFj1tzFlQ+UwbYvk5yO7rufACiY1DovVI5iQBwyBs5yVKGmsND5M5chgOR0bwEst4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1765652935;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=QreqcUmbJuLRfMDwkHbguOG5L8Fq9oShdDpbsW6V7xU=; 
 b=DdA/A+svLAEo9X305pkzXY9OScHJ6Y/Cx9riTJr1fhZ4JvpIUEI7MCNxER8yiR3R9k3/4BOdRyhfvL1rDCoYSXIqH40cZNoSA1wx+oJlt3UwFuNKh6shEfy6UmNbkN+BVDpsnkGgJezukjJDqyk3Ndhd+76UxyU0ZBLBwAe2ZDg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1765652935; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=QreqcUmbJuLRfMDwkHbguOG5L8Fq9oShdDpbsW6V7xU=;
 b=WCluVfKSKPMkgd7uL+0k84AihAkWvwqdjwSk9pkzep52Ay5KcMLe8vY7MwVttLFu
 hzOsSAGLsC3T09O7VTnTHF07QjSfyROpupO8UvPbjR65rKe8Su0F22j+fxRQB6wxZtQ
 1srh4HWMWE0RDI1B/7HS90iwtJCEndiy8JQq7pLk=
Received: by mx.zohomail.com with SMTPS id 1765652933492827.0707613508447;
 Sat, 13 Dec 2025 11:08:53 -0800 (PST)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Subject: [PATCH v3 0/1] Workaround for partial huge page unmaps in Panthor
Date: Sat, 13 Dec 2025 19:08:32 +0000
Message-ID: <20251213190835.2444075-1-adrian.larumbe@collabora.com>
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

This is v3 of [1]. This patch is a workaround for performing partial unmaps of a VM region backed
by huge pages. Since these are now disallowed, the patch makes sure unmaps are done on a backing
page-granularity, and then regions untouched by the VM_BIND unmap operation are restored.

A patch series with IGT tests to validate this functionality is found at [2].

Changelog:
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

[1] https://lore.kernel.org/dri-devel/20251127035021.624045-1-adrian.larumbe@collabora.com/
[2] https://lore.kernel.org/igt-dev/20251213190205.2435793-1-adrian.larumbe@collabora.com/T/#t


Adrián Larumbe (1):
  drm/panthor: Support partial unmaps of huge pages

 drivers/gpu/drm/panthor/panthor_mmu.c | 66 +++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

--
2.51.2
