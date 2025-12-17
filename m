Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56249CC99B2
	for <lists+dri-devel@lfdr.de>; Wed, 17 Dec 2025 22:33:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B810B10E1D5;
	Wed, 17 Dec 2025 21:33:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="lSep6hcm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05D1610E1D5
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Dec 2025 21:33:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1766007187; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=kLhM+DT0ElxrJKGPuffL8LLhwqcHDSeXDN8ECNYyyaYcmKP0xArU/YzUTWy1S0MiA7X7/3t6YBZqi+D4PmMuXqcN4QSORYKfHi02xAcrfCpYRnJ0FsKd5+x2fdSkVpnSBRavnLPPoGQXc1+HJLIaesLqdtfh5qt1MpLpyLwzxrI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1766007187;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=DpqTJKS625niKSf+hA6i1Ymi8WA6IU3kfWdUBpuwDIw=; 
 b=M8Wz1agKE101Ln8WLlBV91QBrdLvSEsIkmaNOTN6cNcXzekwOigVBuAFZfpKGcgmpjBWaAj846F1+YYV9aWshQBCUKeyYKCXasH15CSKOGD83QgTmWWAdFlsOq1/taD/jrOFo9Lmd1S0agT/ICP40s/5VQoLYqjZhkkv/H0rz7I=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1766007187; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=DpqTJKS625niKSf+hA6i1Ymi8WA6IU3kfWdUBpuwDIw=;
 b=lSep6hcmJHZ7E+H7UZdv8H/uM1GlP0Zrc5eLt/VVVbz2e75MYTDMRBxfBiAjcOwj
 c/UJIZK614G3B9nju8BMhr9UJW/iFJ51S9YfaL379Q2BoCOY+a3BW0eovw/3ifkFB34
 5xtpescOo8yY8IrHn7m6ReNd8yu9r4ecmZeqPoMw=
Received: by mx.zohomail.com with SMTPS id 1766007185068554.5790800425979;
 Wed, 17 Dec 2025 13:33:05 -0800 (PST)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Subject: Workaround for partial huge page unmaps in Panthor
Date: Wed, 17 Dec 2025 21:32:32 +0000
Message-ID: <20251217213252.677020-1-adrian.larumbe@collabora.com>
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
v5:
 - Addressed minor formating nit.
 - Passedd right range value to panthor_vm_lock_region() rather than end address.
 - Added R-b tag.

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

[1] https://lore.kernel.org/dri-devel/20251214202426.3186811-1-adrian.larumbe@collabora.com/
[2] https://lore.kernel.org/igt-dev/20251213190205.2435793-1-adrian.larumbe@collabora.com/T/#

Adrián Larumbe (1):
  drm/panthor: Support partial unmaps of huge pages

 drivers/gpu/drm/panthor/panthor_mmu.c | 100 +++++++++++++++++++++++---
 1 file changed, 92 insertions(+), 8 deletions(-)

--
2.51.2
